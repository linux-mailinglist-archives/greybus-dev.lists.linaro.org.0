Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EC285785DF6
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 18:56:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0A8633EE8C
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 16:56:12 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by lists.linaro.org (Postfix) with ESMTPS id 8DF0740F68
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 16:55:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b="TLs/gznQ";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.176 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1bc8a2f71eeso38668625ad.0
        for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 09:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809757; x=1693414557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pL3H+krm56PnU1cD5lNdLEjclSjlnFMa/G8DTHbCwfU=;
        b=TLs/gznQGQsHpoRWhV/m+2H1t8mVJiV6cMvEdDIhsKt2fwGQLBQkuL+XBxV5I53h+R
         y40jhxODdtnb6+Fq3U+NVKlgwl3aCKimiDGfUs7eanL2rrPaETWUI5MxYrG0i2RVJvdv
         Ay/2HT910PCNTRA9AfK8I9PtcSBC9wtOfWvi5fJIcYom8Dqulg54j2m+YXi7M0Zy/5i3
         J39zHKntX+qeGVt9wIn+N+iligjIba3DImZw8d0FNcaPLTjkxW+eCf0UfYu12ACVwRG9
         Fn4MfHgPhT5PpbW30/tOg0cnIUerXWnheec9JfMpgn6rAvm+NrnbH11j27cmmwENJH3I
         jweA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809757; x=1693414557;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pL3H+krm56PnU1cD5lNdLEjclSjlnFMa/G8DTHbCwfU=;
        b=VwavuMlZ5ShBZ+7t4ZPrZgBFZ05285s7GUHuHAxDrPQJcuiwD0nwRkdxx01yF9RF1n
         r3nzUHYICnubiTCeqvyMRLRbOcqad4R020EDLSUiPqA/qZwzojDY4YzV/OndXUrl3rXR
         kfKzuAJILENP7rwp5cySEr2TJ47rA29PdcIvtebFxZ+CCacZYBKowNF01foWEl7FHk/8
         suJabkAtMgGqWOTtYGF+s8NiyV0eMfoZ01Tc4IIe46co8Xc+JClhfPEU5nFrUzl8lA9H
         TglCg6UFGUwB8Pzz9jMn9nOeDMH0A0XAEsRadDYgXRuqdSr8AWAoCA3x15pZiYJcBWSY
         RC8Q==
X-Gm-Message-State: AOJu0Yz/alXmpsbTg8EGmi4x8pKri//h2Swhtv1LrWlB4Xr1yTc+lvC3
	DV6fLJAh5tC7d6nO7LLyP+5bylwoWiUzr3lp
X-Google-Smtp-Source: AGHT+IGPKuE7dXdatkv5FRR7OgrEDSJGSA8VJpMjwrzXnovaFW6cE6tA1Fl0d7ZxWkZhwAf6IL1FHA==
X-Received: by 2002:a17:903:187:b0:1b6:6c32:59a8 with SMTP id z7-20020a170903018700b001b66c3259a8mr12575097plg.36.1692809757282;
        Wed, 23 Aug 2023 09:55:57 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id ix21-20020a170902f81500b001bb8895848bsm11256247plb.71.2023.08.23.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:55:56 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 23 Aug 2023 22:25:20 +0530
Message-ID: <20230823165520.181301-5-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823165520.181301-1-ayushdevel1325@gmail.com>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 8DF0740F68
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.176:from];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ABKITIPMEHNAVRFJZXGFI3T7EEC2RZDL
X-Message-ID-Hash: ABKITIPMEHNAVRFJZXGFI3T7EEC2RZDL
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 4/4] Allow building beagleplay greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ABKITIPMEHNAVRFJZXGFI3T7EEC2RZDL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add KConfig and Makefile stuff

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/staging/greybus/Kconfig  | 9 +++++++++
 drivers/staging/greybus/Makefile | 5 +++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index 927cfa4bc989..5306d773c3ce 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -213,4 +213,13 @@ config GREYBUS_ARCHE
 	  To compile this code as a module, chose M here: the module
 	  will be called gb-arche.ko
 
+config GREYBUS_BEAGLEPLAY
+	tristate "Greybus BeaglePlay driver"
+	depends on TTY
+	help
+	  Select this option if you have a BeaglePlay device.
+
+	  To compile this code as a module, chose M here: the module
+	  will be called gb-beagleplay.ko
+
 endif	# GREYBUS
diff --git a/drivers/staging/greybus/Makefile b/drivers/staging/greybus/Makefile
index 7c5e89622334..a94a88bfad01 100644
--- a/drivers/staging/greybus/Makefile
+++ b/drivers/staging/greybus/Makefile
@@ -71,3 +71,8 @@ obj-$(CONFIG_GREYBUS_USB)		+= gb-usb.o
 gb-arche-y	:= arche-platform.o arche-apb-ctrl.o
 
 obj-$(CONFIG_GREYBUS_ARCHE)	+= gb-arche.o
+
+# Beagleplay Greybus driver
+gb-beagleplay-y	:= beagleplay-greybus-driver.o hdlc.o
+
+obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+= gb-beagleplay.o
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
