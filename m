Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJuLJH36h2l2ggQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Feb 2026 03:52:45 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id E228B107B32
	for <lists+greybus-dev@lfdr.de>; Sun, 08 Feb 2026 03:52:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D7453F072
	for <lists+greybus-dev@lfdr.de>; Sun,  8 Feb 2026 02:52:43 +0000 (UTC)
Received: from mail-24416.protonmail.ch (mail-24416.protonmail.ch [109.224.244.16])
	by lists.linaro.org (Postfix) with ESMTPS id 305653F85E
	for <greybus-dev@lists.linaro.org>; Sat,  7 Feb 2026 15:10:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=protonmail.com header.s=protonmail3 header.b=nna5XvrN;
	spf=pass (lists.linaro.org: domain of ehanoc@protonmail.com designates 109.224.244.16 as permitted sender) smtp.mailfrom=ehanoc@protonmail.com;
	dmarc=pass (policy=quarantine) header.from=protonmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1770477033; x=1770736233;
	bh=elPcySqM8SQ/m5D1yGRtD/gds0vFjO5AXLY1AjS8CYY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=nna5XvrNIt47alo37cSe6NJmLTQRYAm3Uxrm8UqaXLOtoNApQANRa8x1IUtZw8KJ7
	 MLz1Nde0ULgvddhi0ByBKmMNru5ULq1F3ghW7oHuSGdzveVekVzjQTUsxywx5Bj0kx
	 qb/ACI1wfv8FnR0wJUH9f0g7Qd5zf+hVZvSfqif7gUJKkrKw/phgBDreZyZGEEc7py
	 gqF1PpBWDsrXaivXvzfcXMoQkXx/+L0enRHugM1/tNYGHpvJrLIO0ycQ6WP4QdP71x
	 ScZedfunVdH4peIgGkh7I6h2Ak70FCSMUvmOxDKMvK5gLQ0rGrA3rabsrHTx61zzyb
	 1i6Vg6vcu4a9A==
Date: Sat, 07 Feb 2026 15:10:30 +0000
To: gregkh@linuxfoundation.org, elder@kernel.org, johan@kernel.org, hvaibhav.linux@gmail.com
From: Bruno Martins <ehanoc@protonmail.com>
Message-ID: <20260207151026.118681-1-ehanoc@protonmail.com>
Feedback-ID: 4792375:user:proton
X-Pm-Message-ID: c3b242fd3bdbc1a218a7abe6ecb8b330220291c1
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: ehanoc@protonmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LUU6LINCRI2ABLKRDGNBEHL55V2JL3KJ
X-Message-ID-Hash: LUU6LINCRI2ABLKRDGNBEHL55V2JL3KJ
X-Mailman-Approved-At: Sun, 08 Feb 2026 02:52:38 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bruno Martins <ehanoc@protonmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove unused apb_ctrl_fw_flashing() and apb_ctrl_standby_boot()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LUU6LINCRI2ABLKRDGNBEHL55V2JL3KJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[protonmail.com : SPF not aligned (strict),quarantine];
	R_DKIM_REJECT(1.00)[protonmail.com:s=protonmail3];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,protonmail.com];
	GREYLIST(0.00)[pass,meta];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[protonmail.com];
	FREEMAIL_TO(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[protonmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[ehanoc@protonmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: E228B107B32
X-Rspamd-Action: no action

These functions were left behind when commit 921dbe52b40b ("greybus:
arche-platform: Add support for SPI bus sharing for Mihi") removed
their only callers in 2016.

Signed-off-by: Bruno Martins <ehanoc@protonmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 10 ----------
 drivers/staging/greybus/arche_platform.h |  2 --
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..6a50b79bb787 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -230,16 +230,6 @@ int apb_ctrl_coldboot(struct device *dev)
 	return coldboot_seq(to_platform_device(dev));
 }
 
-int apb_ctrl_fw_flashing(struct device *dev)
-{
-	return fw_flashing_seq(to_platform_device(dev));
-}
-
-int apb_ctrl_standby_boot(struct device *dev)
-{
-	return standby_boot_seq(to_platform_device(dev));
-}
-
 void apb_ctrl_poweroff(struct device *dev)
 {
 	poweroff_seq(to_platform_device(dev));
diff --git a/drivers/staging/greybus/arche_platform.h b/drivers/staging/greybus/arche_platform.h
index 9d997f2d6517..5d0692af2533 100644
--- a/drivers/staging/greybus/arche_platform.h
+++ b/drivers/staging/greybus/arche_platform.h
@@ -21,8 +21,6 @@ void __exit arche_apb_exit(void);
 
 /* Operational states for the APB device */
 int apb_ctrl_coldboot(struct device *dev);
-int apb_ctrl_fw_flashing(struct device *dev);
-int apb_ctrl_standby_boot(struct device *dev);
 void apb_ctrl_poweroff(struct device *dev);
 
 #endif	/* __ARCHE_PLATFORM_H */
-- 
2.47.3


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
