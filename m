Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F10174E261E
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 13:13:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2BC353EE94
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 12:13:35 +0000 (UTC)
Received: from 189.cn (ptr.189.cn [183.61.185.104])
	by lists.linaro.org (Postfix) with ESMTP id 511833EE14
	for <greybus-dev@lists.linaro.org>; Fri, 18 Mar 2022 09:51:10 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:36022.1773867350
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-123.150.8.43 (unknown [10.64.8.31])
	by 189.cn (HERMES) with SMTP id 2ABC21001B4;
	Fri, 18 Mar 2022 17:51:06 +0800 (CST)
Received: from  ([123.150.8.43])
	by gateway-153622-dep-749df8664c-cv9r2 with ESMTP id 374a5bf189884f2aa252180a3e8c7832 for johan@kernel.org;
	Fri, 18 Mar 2022 17:51:08 CST
X-Transaction-ID: 374a5bf189884f2aa252180a3e8c7832
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.43
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
	linux-pwm@vger.kernel.org,
	elder@ieee.org,
	elder@linaro.org
Date: Fri, 18 Mar 2022 17:57:12 +0800
Message-Id: <1647597432-27586-1-git-send-email-chensong_2000@189.cn>
X-Mailer: git-send-email 2.7.4
X-MailFrom: chensong_2000@189.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VC6SKX5L52UJNJEPWB3THWGI5SQLCNNL
X-Message-ID-Hash: VC6SKX5L52UJNJEPWB3THWGI5SQLCNNL
X-Mailman-Approved-At: Mon, 21 Mar 2022 12:13:33 +0000
CC: Song Chen <chensong_2000@189.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VC6SKX5L52UJNJEPWB3THWGI5SQLCNNL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Introduce newer .apply function in pwm_ops to replace legacy operations
including enable, disable, config and set_polarity.

This guarantees atomic changes of the pwm controller configuration.

Signed-off-by: Song Chen <chensong_2000@189.cn>

---
v2:
1, define duty_cycle and period as u64 in gb_pwm_config_operation.
2, define duty and period as u64 in gb_pwm_config_request.
3, disable before configuring duty and period if the eventual goal
   is a disabled state.

v3:
Regarding duty_cycle and period, I read more discussion in this thread,
min, warn or -EINVAL, seems no perfect way acceptable for everyone.
How about we limit their value to INT_MAX and throw a warning at the
same time when they are wrong?

v4:
1, explain why legacy operations are replaced.
2, cap the value of period and duty to U32_MAX.

v5:
1, revise commit message.

v6:
1, revise commit message.
2, explain why capping the value of period and duty to U32_MAX in
   comment.
---
 drivers/staging/greybus/pwm.c | 64 ++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 891a6a672378..ad20ec24031e 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -204,43 +204,59 @@ static void gb_pwm_free(struct pwm_chip *chip, struct pwm_device *pwm)
 	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
 }
 
-static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
-			 int duty_ns, int period_ns)
+static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
+			const struct pwm_state *state)
 {
+	int err;
+	bool enabled = pwm->state.enabled;
+	u64 period = state->period;
+	u64 duty_cycle = state->duty_cycle;
 	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
 
-	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns);
-};
+	/* Set polarity */
+	if (state->polarity != pwm->state.polarity) {
+		if (enabled) {
+			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
+			enabled = false;
+		}
+		err = gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polarity);
+		if (err)
+			return err;
+	}
 
-static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device *pwm,
-			       enum pwm_polarity polarity)
-{
-	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
+	if (!state->enabled) {
+		if (enabled)
+			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
+		return 0;
+	}
 
-	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
-};
+	/*
+	 * Set period and duty cycle
+	 *
+	 * PWM privodes 64-bit period and duty_cycle, but greybus only accepts
+	 * 32-bit, so their values have to be limited to U32_MAX.
+	 */
+	if (period > U32_MAX)
+		period = U32_MAX;
 
-static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
+	if (duty_cycle > period)
+		duty_cycle = period;
 
-	return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
-};
+	err = gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_cycle, period);
+	if (err)
+		return err;
 
-static void gb_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
-{
-	struct gb_pwm_chip *pwmc = pwm_chip_to_gb_pwm_chip(chip);
+	/* enable/disable */
+	if (!enabled)
+		return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
 
-	gb_pwm_disable_operation(pwmc, pwm->hwpwm);
-};
+	return 0;
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
