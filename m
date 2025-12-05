Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC54CA7A8F
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Dec 2025 13:56:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B49B33F9B1
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Dec 2025 12:56:38 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id DF4733F93E
	for <greybus-dev@lists.linaro.org>; Fri,  5 Dec 2025 11:21:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=JMkUxanh;
	spf=pass (lists.linaro.org: domain of julio191096@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=julio191096@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7a9c64dfa8aso1641779b3a.3
        for <greybus-dev@lists.linaro.org>; Fri, 05 Dec 2025 03:21:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764933710; x=1765538510; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P55QFDL5j85Vhd3CMucSVVVZVJ9u57AheboaCTxtyrw=;
        b=JMkUxanhPz9VCgBPdKt5UrSkpudko+PCJVCPmy+xoGI6GG0VE34fPkW4aDbb3o9itv
         mL3re9fdTjazJ47JIzcUXrgzWI2PwA+fsJpZFBs4cnK/SjpUFekxR/btTF3IZhZiIS44
         0ExO0InwhYoSPB6fFnqacaVwrY4/zBwakZ028BNT654KonqqXR/+NtmkHSPMmsU3siPg
         LeRct3WL9aIVDfabHGlkmhyBn4zro9hPyI7P1oLe4CDj9UOR+ZY6qrZTaAaABUNcG8aS
         DZQBaYNo+PkfebSFcDhFMtWoic9hpVfPDI6ewNhzbYHDkyT+ys5WoIk4BlBZLAlMik9z
         jecw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764933710; x=1765538510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P55QFDL5j85Vhd3CMucSVVVZVJ9u57AheboaCTxtyrw=;
        b=aOroMBfTWK1nfZMNPF9pdKeZohqd4fSA/Sopdv+BSSHsPAqr7c6uTV6Mk40BL4P5+I
         XZH3HK6WaRtLnRo/6UwJhzePOQ0dsx+AZBKENPXhTIXLQKsyQ0uHdbAvDImJFTm0tce/
         w7qq+GfjmADBSS3AR9u8BdPbSnrYBrBQDV7Sex5TLXn1iTNzE2pec6utjC7Y3Ngbg3N7
         lFm/MCLXm2zIkyEFQpC5O+Sr67S/JEmmhgBN88nv8j4psVgUy510bjUlhQexk3DkL2rk
         x/Skg/RAyGJUrEogiyntQBSbZaIgTJwdgZCosR4K6fGFB2R5PXJ6nYsUR+XFosV7ERrS
         3JPQ==
X-Gm-Message-State: AOJu0YyoBv3ONEe4iwAYxSix3HdVEUykP1piXZLjicRuIB9aSF27lLh0
	P8hGtRQe3AyrmJXTeq5ZTBicC/GPIXwrw/sL6KdGo7hQHiYF9EWNh7bO
X-Gm-Gg: ASbGncsqkjMoxLkJM0nR+e2yCyWRw8LSzQb7Tj5xlMx7I8B/ksHv+2JDT4vx8sBa/HK
	BWhfg2ohN0+SeHY3vBqbOjn7rMjV9dHtCBUCA8Menc1pwxtZWzvQ5wZZgIUmukwD3CQnNYwOSyr
	oRF0XRf/rqVSX8iCbYcm78CcDWJgD9RvYDBXw5S2hiDHVVdkpVNwqWZzidMixtF75mz6Hb1zl0o
	TkQZRdA+T1ZyUo68OOmIxv/LPT5iF7DobSWl/nqjdq/6gYz/REapV106vsvCvYclrjKv1eYvkJf
	n/xWrzjhLybLGGq0mGuWLctM9AO92P1015A4Y7zA3Bg6qGF6FaY+pfK88duZKF24anhooVc3nrD
	tYvEIS4nevDiMfWsG9luyJH5T+TeI8N54y8Y776IfgywLrmelEw7Z0OYhyMtp9UtHqKYRokcuTg
	u4OZCLEEZ1epNF
X-Google-Smtp-Source: AGHT+IFy2MHfCerrGnaj1Qc+/LL4wDTJCmzPsBHd2bOjZVbGPNG91rncOd1PgzI9xp3MZTEio0x3zw==
X-Received: by 2002:a05:7022:e1f:b0:11b:af12:ba30 with SMTP id a92af1059eb24-11df643bf9emr4174980c88.8.1764933709822;
        Fri, 05 Dec 2025 03:21:49 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76edd4fsm15756550c88.8.2025.12.05.03.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:21:49 -0800 (PST)
From: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Date: Fri,  5 Dec 2025 08:21:38 -0300
Message-ID: <20251205112138.3431-1-julio191096@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	URIBL_BLOCKED(0.00)[user.name:url];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,linaro.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[2804:1b2:9545:c615:2358:ef44:78a3:f69a:query timed out];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DF4733F93E
X-Spamd-Bar: --
X-MailFrom: julio191096@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SACYUTEJKNOAHYZG45W4SYJQRNVPNLMX
X-Message-ID-Hash: SACYUTEJKNOAHYZG45W4SYJQRNVPNLMX
X-Mailman-Approved-At: Fri, 05 Dec 2025 12:56:27 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SACYUTEJKNOAHYZG45W4SYJQRNVPNLMX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Switch from the deprecated of_property_read_bool() to the common
device_property_read_bool() API. This makes the driver agnostic to
the underlying firmware interface (DT or ACPI) and simplifies the
logic.

Since the driver is no longer strictly dependent on Device Tree,
include <linux/mod_devicetable.h> directly for the struct
of_device_id definition, instead of relying on implicit inclusion
via <linux/of_irq.h>, which has been removed as it is unused.

Also rename apb_ctrl_get_devtree_data() to apb_ctrl_get_fw_data()
to better reflect the agnostic nature of the new implementation.

Signed-off-by: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
---

Changes in v6:
    - Aligned function arguments with the open parenthesis in function declaration.

Changes in v5:
    - Fixed 'From' header mismatch(updated git config user.name)
    - Fixed indentation aligment in function declaration as pointed out
    by Dan Carpenter

Changes in v4:
    -  Fixed a typo in the v3 commit

Changes in v3:
  - Added changelog history as requested by the maintainer bot.

Changes in v2:
  - Shortened the subject line to match subsystem standards.
  - Updated Signed-off-by to use full real name.

 drivers/staging/greybus/arche-apb-ctrl.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..33f26a65f0cc 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -10,13 +10,14 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/interrupt.h>
-#include <linux/of_irq.h>
 #include <linux/module.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 #include <linux/pm.h>
+#include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spinlock.h>
+#include <linux/mod_devicetable.h>
 #include "arche_platform.h"
 
 static void apb_bootret_deassert(struct device *dev);
@@ -314,8 +315,8 @@ static ssize_t state_show(struct device *dev,
 
 static DEVICE_ATTR_RW(state);
 
-static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
-				     struct arche_apb_ctrl_drvdata *apb)
+static int apb_ctrl_get_fw_data(struct platform_device *pdev,
+				struct arche_apb_ctrl_drvdata *apb)
 {
 	struct device *dev = &pdev->dev;
 	int ret;
@@ -378,7 +379,7 @@ static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
 	}
 
 	/* Only applicable for platform >= V2 */
-	if (of_property_read_bool(pdev->dev.of_node, "gb,spi-en-active-high"))
+	if (device_property_read_bool(&pdev->dev, "gb,spi-en-active-high"))
 		apb->spi_en_polarity_high = true;
 
 	return 0;
@@ -394,7 +395,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
 	if (!apb)
 		return -ENOMEM;
 
-	ret = apb_ctrl_get_devtree_data(pdev, apb);
+	ret = apb_ctrl_get_fw_data(pdev, apb);
 	if (ret) {
 		dev_err(dev, "failed to get apb devicetree data %d\n", ret);
 		return ret;
@@ -403,7 +404,7 @@ static int arche_apb_ctrl_probe(struct platform_device *pdev)
 	/* Initially set APB to OFF state */
 	apb->state = ARCHE_PLATFORM_STATE_OFF;
 	/* Check whether device needs to be enabled on boot */
-	if (of_property_read_bool(pdev->dev.of_node, "arche,init-disable"))
+	if (device_property_read_bool(&pdev->dev, "arche,init-disable"))
 		apb->init_disabled = true;
 
 	platform_set_drvdata(pdev, apb);
-- 
2.52.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
