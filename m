Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 031E9CE8C80
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 07:27:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9379C4013E
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Dec 2025 06:27:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	by lists.linaro.org (Postfix) with ESMTPS id 6CA604013E
	for <greybus-dev@lists.linaro.org>; Tue, 30 Dec 2025 06:27:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=infradead.org header.s=bombadil.20210309 header.b=bq3wyLlA;
	spf=none (lists.linaro.org: domain of rdunlap@infradead.org has no SPF policy when checking 198.137.202.133) smtp.mailfrom=rdunlap@infradead.org;
	dmarc=pass (policy=none) header.from=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=T0LFWDsTRHcdccaHeIxD74ix0q1QgkGIfA+ExJTok6o=; b=bq3wyLlABzaQHg9Xya3OuWMcoY
	KZYK4JICm8PQObdDNutf0Dic/RrEkMzbkzy0eMtTeWzfB9D+rjXULkSFjkQp4NU8LnSWolWuexUXg
	ih1VzAP35SpsX5PGnZKf7RAdlLASQAIEQI08svXcoUmTyRFKHvaBMsn2eHChQRe+3I9LNwgYYpd9q
	nZLpSMzgRWPKz0uL3ZUFldHaNLteOFy9c1ziOjcOXTDPnRVagBLH3G1kv/pfVc2XjnQjAQKf9f4hx
	DYYPz0jttx9BaTUQ9SfYCee2sAAs/xjbNLtAPysS98XLzgXQTovRwGJ6m6Aw2jQPwrAtZ6UUBDl+U
	pdH0+aFA==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaTCE-00000004Szq-0w56;
	Tue, 30 Dec 2025 06:27:08 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Mon, 29 Dec 2025 22:27:04 -0800
Message-ID: <20251230062704.3339404-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[infradead.org,none];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[infradead.org:s=bombadil.20210309];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[infradead.org:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	R_SPF_NA(0.00)[no SPF record];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,infradead.org:mid,infradead.org:email,infradead.org:dkim,infradead.org:from_smtp,infradead.org:from_mime];
	RCVD_TLS_ALL(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6CA604013E
X-Spamd-Bar: --
Message-ID-Hash: JYOHAY36472MSRGS3FY6S6JYGE6LIYI2
X-Message-ID-Hash: JYOHAY36472MSRGS3FY6S6JYGE6LIYI2
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Randy Dunlap <rdunlap@infradead.org>, Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: arche: drop dangling Kconfig symbol
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JYOHAY36472MSRGS3FY6S6JYGE6LIYI2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Kconfig symbol USB_HSIC_USB3613 is not defined in the kernel source
tree. Drop it since it unused.

Fixes: 2eccd4aa19fc ("staging: greybus: enable compile testing of arche driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Vaibhav Hiremath <hvaibhav.linux@gmail.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev

 drivers/staging/greybus/Kconfig          |    1 -
 drivers/staging/greybus/arche-platform.c |    4 ----
 2 files changed, 5 deletions(-)

--- linux-next-20251219.orig/drivers/staging/greybus/arche-platform.c
+++ linux-next-20251219/drivers/staging/greybus/arche-platform.c
@@ -23,14 +23,10 @@
 #include <linux/of.h>
 #include "arche_platform.h"
 
-#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
-#include <linux/usb/usb3613.h>
-#else
 static inline int usb3613_hub_mode_ctrl(bool unused)
 {
 	return 0;
 }
-#endif
 
 #define WD_COLDBOOT_PULSE_WIDTH_MS	30
 
--- linux-next-20251219.orig/drivers/staging/greybus/Kconfig
+++ linux-next-20251219/drivers/staging/greybus/Kconfig
@@ -206,7 +206,6 @@ endif	# GREYBUS_BRIDGED_PHY
 
 config GREYBUS_ARCHE
 	tristate "Greybus Arche Platform driver"
-	depends on USB_HSIC_USB3613 || COMPILE_TEST
 	help
 	  Select this option if you have an Arche device.
 
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
