Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 660F286F0B0
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 15:46:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 713E740306
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Mar 2024 14:46:56 +0000 (UTC)
Received: from mail.rosalinux.ru (mail.rosalinux.ru [195.19.76.54])
	by lists.linaro.org (Postfix) with ESMTPS id 63EF040CEF
	for <greybus-dev@lists.linaro.org>; Fri,  1 Mar 2024 19:06:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=rosalinux.ru header.s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503 header.b=LpF0qO4U;
	spf=pass (lists.linaro.org: domain of m.lobanov@rosalinux.ru designates 195.19.76.54 as permitted sender) smtp.mailfrom=m.lobanov@rosalinux.ru;
	dmarc=pass (policy=quarantine) header.from=rosalinux.ru
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id 18082DCE59BB9;
	Fri,  1 Mar 2024 22:06:09 +0300 (MSK)
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 67HJQtmzNR1y; Fri,  1 Mar 2024 22:06:08 +0300 (MSK)
Received: from localhost (localhost [127.0.0.1])
	by mail.rosalinux.ru (Postfix) with ESMTP id D9520DCE59BBA;
	Fri,  1 Mar 2024 22:06:08 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rosalinux.ru D9520DCE59BBA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosalinux.ru;
	s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503; t=1709319968;
	bh=kclR9O1Au8wRehRzcfqdqVCqhOZ+OqTDy0X/Usb2D9w=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=LpF0qO4UY3zq8WFvfMYTDR419wAIeTTaU+28M4bjF48HF3Fk8cLVDiUVvukA6S3xf
	 LQV5kmSoorpDoEVfmqbF3di3udKnRg4jYZ1IGQ3AXGiMtk6Rit5sfp6Z3LjbacGNRL
	 w2v2AClGz6r4CWLWnTyazNB7IGiIU5ajLdpKUcgdyf1XoBA2+oBUOTSvr/Sqg0s2wj
	 XVpUGrzUB8pYNuzUIt1s10sCFq1tXQnW0qkmRIX4eRQapHb215i5a+lXfW0AufIL5i
	 RUXTL2+VtxS3tRvt0MJEf4ERbuAqjfuLyjsxHAsTGok1lJ86W88XUQ2OVijDjxIGSS
	 2PazYN5T3KB3A==
X-Virus-Scanned: amavisd-new at rosalinux.ru
Received: from mail.rosalinux.ru ([127.0.0.1])
	by localhost (mail.rosalinux.ru [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id VQ-MjpTfyj7b; Fri,  1 Mar 2024 22:06:08 +0300 (MSK)
Received: from localhost.localdomain (unknown [62.217.186.174])
	by mail.rosalinux.ru (Postfix) with ESMTPSA id A728DDCE59BB9;
	Fri,  1 Mar 2024 22:06:08 +0300 (MSK)
From: Mikhail Lobanov <m.lobanov@rosalinux.ru>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Date: Fri,  1 Mar 2024 14:04:24 -0500
Message-ID: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 63EF040CEF
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[rosalinux.ru,quarantine];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[rosalinux.ru:s=1D4BB666-A0F1-11EB-A1A2-F53579C7F503];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:47503, ipnet:195.19.76.0/24, country:RU];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_TRACE(0.00)[rosalinux.ru:+]
X-MailFrom: m.lobanov@rosalinux.ru
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: E3VLFUH5DAZD7ZOQLREM5N2ISST72EHY
X-Message-ID-Hash: E3VLFUH5DAZD7ZOQLREM5N2ISST72EHY
X-Mailman-Approved-At: Sat, 02 Mar 2024 14:46:52 +0000
CC: Mikhail Lobanov <m.lobanov@rosalinux.ru>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E3VLFUH5DAZD7ZOQLREM5N2ISST72EHY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Dereference of null pointer in the __gb_lights_flash_brightness_set function.
Assigning the channel the result of executing the get_channel_from_mode function
without checking for NULL may result in an error.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Mikhail Lobanov <m.lobanov@rosalinux.ru>
---
 drivers/staging/greybus/light.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index 87d36948c610..929514350947 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -148,10 +148,15 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
 						GB_CHANNEL_MODE_TORCH);
 
 	/* For not flash we need to convert brightness to intensity */
-	intensity = channel->intensity_uA.min +
+
+	if (channel) {
+		intensity = channel->intensity_uA.min +
 			(channel->intensity_uA.step * channel->led->brightness);
 
-	return __gb_lights_flash_intensity_set(channel, intensity);
+		return __gb_lights_flash_intensity_set(channel, intensity);
+	}
+
+	return 0;
 }
 #else
 static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
