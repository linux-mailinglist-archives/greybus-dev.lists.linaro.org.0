Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EC2CCF814
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 12:00:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CD03400F5
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Dec 2025 11:00:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 6D7B94013E
	for <greybus-dev@lists.linaro.org>; Fri, 19 Dec 2025 11:00:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=evEh4JGb;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ABEE760008;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6184FC116B1;
	Fri, 19 Dec 2025 11:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766142005;
	bh=pF7UD0tW3OiVIYQQAtFEz1D+vMdZQtxYsbSG8ztDW8M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=evEh4JGbpMnbn2aVs+HC8xNCut6OqLhzxd5EtARXde89ocnEPMf3OMmYvMroDcoNb
	 +Hv0lvgzUYPCTGOHTImk4148xwrhMwIUp2iPICxfZdDFV8xh1+oPaoK38cdUwAP4Vi
	 g36fgm0T640tlNHB4UMCVROHe45p3t5TN9eWbNJPl6F9tFl+Rd2h7N2HJ5wO4IAE70
	 NJE7fYI/ze4nysZknUkwrn5/Ami0I6ADiaTVusX3JAVV0WG+ZLe7WkhHAYOHVRtYWE
	 lJRjENGMXqeFc1+UNU3IBFkSNgqfAy+kChKTWSrf4xlApjQOBeHxh8f56YxP2E+MAn
	 v4eQFtN3zmLvw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vWYDM-0000000065f-0WMF;
	Fri, 19 Dec 2025 12:00:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Date: Fri, 19 Dec 2025 11:59:27 +0100
Message-ID: <20251219105928.23329-3-johan@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.4.254:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[tor.source.kernel.org:rdns,tor.source.kernel.org:helo];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6D7B94013E
X-Spamd-Bar: --
Message-ID-Hash: OTNZTWJ5TPY2KAO2B7OSN4KXY2PGNGAT
X-Message-ID-Hash: OTNZTWJ5TPY2KAO2B7OSN4KXY2PGNGAT
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] staging: greybus: arche-platform: fix memleak on probe failure
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OTNZTWJ5TPY2KAO2B7OSN4KXY2PGNGAT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make sure to depopulate the child devices in case of late probe
failures to avoid leaking the corresponding resources.

Fixes: fd60ac585607 ("greybus: arche-platform: Fix boot, poweroff and fw_flashing seq with APBs")
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/arche-platform.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index bd069d75391b..7dcb33a6f2e3 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -523,10 +523,9 @@ static int arche_platform_probe(struct platform_device *pdev)
 
 	arche_pdata->pm_notifier.notifier_call = arche_platform_pm_notifier;
 	ret = register_pm_notifier(&arche_pdata->pm_notifier);
-
 	if (ret) {
 		dev_err(dev, "failed to register pm notifier %d\n", ret);
-		goto err_device_remove;
+		goto err_depopulate;
 	}
 
 	/* Explicitly power off if requested */
@@ -547,6 +546,8 @@ static int arche_platform_probe(struct platform_device *pdev)
 
 err_unregister_pm_notifier:
 	unregister_pm_notifier(&arche_pdata->pm_notifier);
+err_depopulate:
+	of_platform_depopulate(dev);
 err_device_remove:
 	device_remove_file(&pdev->dev, &dev_attr_state);
 	return ret;
-- 
2.51.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
