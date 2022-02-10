Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 753CA4CA937
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA03D3EF45
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:58 +0000 (UTC)
Received: from 189.cn (ptr.189.cn [183.61.185.103])
	by lists.linaro.org (Postfix) with ESMTP id 1DEE73E887
	for <greybus-dev@lists.linaro.org>; Thu, 10 Feb 2022 08:59:53 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:38980.470878939
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-123.150.8.43 (unknown [10.64.8.43])
	by 189.cn (HERMES) with SMTP id 44247100211;
	Thu, 10 Feb 2022 16:59:47 +0800 (CST)
Received: from  ([172.27.8.53])
	by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id 4bfb3f56604f41b0af19343159f75bff for johan@kernel.org;
	Thu, 10 Feb 2022 16:59:50 CST
X-Transaction-ID: 4bfb3f56604f41b0af19343159f75bff
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
From: Song Chen <chensong_2000@189.cn>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de,
	lee.jones@linaro.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org
Date: Thu, 10 Feb 2022 17:05:02 +0800
Message-Id: <1644483902-9200-1-git-send-email-chensong_2000@189.cn>
X-Mailer: git-send-email 2.7.4
X-MailFrom: chensong_2000@189.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JQOUIRP6TXYK6WPG5QIJ7CNOMUHN2UGC
X-Message-ID-Hash: JQOUIRP6TXYK6WPG5QIJ7CNOMUHN2UGC
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:56 +0000
CC: Song Chen <chensong_2000@189.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JQOUIRP6TXYK6WPG5QIJ7CNOMUHN2UGC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce apply in pwm_ops to replace legacy operations,
like enable, disable, config and set_polarity.

Signed-off-by: Song Chen <chensong_2000@189.cn>
---
 drivers/staging/greybus/pwm.c | 46 +++++++++++++++--------------------
 1 file changed, 19 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 891a6a672378..e1889cf979b2 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -204,43 +204,35 @@ static void gb_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
 }
 
-static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			 int duty_ns, int period_ns)
-{
-	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
-
-	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns);
-};
-
-static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
-			       enum pwm_polarity polarity)
+static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			const struct pwm_state *state)
 {
+	int ret;
 	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
 
-	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
-};
-
-static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
+	/* set period and duty cycle*/
+	ret = gb_pwm_config_operation(pwmc, pwm->hwpwm, state->duty_cycle, state->period);
+	if (ret)
+		return ret;
 
-	return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
-};
+	/* set polarity */
+	ret = gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polarity);
+	if (ret)
+		return ret;
 
-static void gb_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
+	/* enable/disable */
+	if (state->enabled)
+		ret = gb_pwm_enable_operation(pwmc, pwm->hwpwm);
+	else
+		ret = gb_pwm_disable_operation(pwmc, pwm->hwpwm);
 
-	gb_pwm_disable_operation(pwmc, pwm->hwpwm);
-};
+	return ret;
+}
 
 static const struct pwm_ops gb_pwm_ops = {
 	.request = gb_pwm_request,
 	.free = gb_pwm_free,
-	.config = gb_pwm_config,
-	.set_polarity = gb_pwm_set_polarity,
-	.enable = gb_pwm_enable,
-	.disable = gb_pwm_disable,
+	.apply = gb_pwm_apply,
 	.owner = THIS_MODULE,
 };
 
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
