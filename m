Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C34ACCF811
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 12:00:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0D641400F5
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 11:00:17 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 4AEB33F9B2
	for <greybus-dev@lists.linaro.org>; Fri, 19 Dec 2025 11:00:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=tc6TXj8K;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98281442FB;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C35CC19424;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=zXtoaGB9QB5Fkc+DJoOlTNeBL3v1x6M9tWrSIMdLjx8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tc6TXj8KRQu1IINknkJJZUKVZlWusnW26+WVU7yZK39cQuLJoWOQS8stevsbfp3AX
	 xTwrokYwRNUkjlcHs030FAiZY3P3xsmGldv05Av6sWDSVxNeRzT0+ktMdBdXAMkHxL
	 2dVrLIOQRwEhOsOIIF76KWxipWXqOWPinU6I4r/CVnubEXDbCCO20Sm8u7HzeYA1QN
	 qx801Nn3FOvDmOO+zFz+YS2X8SGQHikRbdv9v89ylsuntSMKJozFSqw1XJG7Mqf8Lp
	 I9EqHahSpYTQuyXZAYw2ONjlTAY3JhrSo+JBmZa4xcMR6VC6b6EdA1bGMY1sss7GKs
	 6JGXFwVtRHH8Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDM-0000000065d-0C7a;
	Fri, 19 Dec 2025 12:00:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Date: Fri, 19 Dec 2025 11:59:26 +0100
Message-ID: <20251219105928.23329-2-johan@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251219105928.23329-1-johan@kernel.org>
References: <20251219105928.23329-1-johan@kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.252.31];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[iscas.ac.cn:email];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4AEB33F9B2
X-Spamd-Bar: --
Message-ID-Hash: BJ7E4INFYZDG27C2FPK5TJD726U4GEUG
X-Message-ID-Hash: BJ7E4INFYZDG27C2FPK5TJD726U4GEUG
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/3] staging: greybus: arche-platform: fix coldboot probe error path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BJ7E4INFYZDG27C2FPK5TJD726U4GEUG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make sure to deregister the PM notifier in case the coldboot sequence
fails during probe.

Fixes: d29b67d44a7c ("greybus: arche-platform: Add support for init-off feature")
Reported-by: Haotian Zhang <vulab@iscas.ac.cn>
Link: https://lore.kernel.org/lkml/20251104090825.224-1-vulab@iscas.ac.cn/
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/arche-platform.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..bd069d75391b 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -534,8 +534,9 @@ static int arche_platform_probe(struct platform_device *pdev)
 		mutex_lock(&arche_pdata->platform_state_mutex);
 		ret = arche_platform_coldboot_seq(arche_pdata);
 		if (ret) {
+			mutex_unlock(&arche_pdata->platform_state_mutex);
 			dev_err(dev, "Failed to cold boot svc %d\n", ret);
-			goto err_coldboot;
+			goto err_unregister_pm_notifier;
 		}
 		arche_platform_wd_irq_en(arche_pdata);
 		mutex_unlock(&arche_pdata->platform_state_mutex);
@@ -544,8 +545,8 @@ static int arche_platform_probe(struct platform_device *pdev)
 	dev_info(dev, "Device registered successfully\n");
 	return 0;
 
-err_coldboot:
-	mutex_unlock(&arche_pdata->platform_state_mutex);
+err_unregister_pm_notifier:
+	unregister_pm_notifier(&arche_pdata->pm_notifier);
 err_device_remove:
 	device_remove_file(&pdev->dev, &dev_attr_state);
 	return ret;
-- 
2.51.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
