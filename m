Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C82CA5E30
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Dec 2025 03:12:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 638183F9AE
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Dec 2025 02:12:16 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	by lists.linaro.org (Postfix) with ESMTPS id EF21D3F8EF
	for <greybus-dev@lists.linaro.org>; Thu,  4 Dec 2025 23:18:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Gg0ZlE9t;
	spf=pass (lists.linaro.org: domain of julio191096@gmail.com designates 209.85.210.171 as permitted sender) smtp.mailfrom=julio191096@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7b86e0d9615so2561731b3a.0
        for <greybus-dev@lists.linaro.org>; Thu, 04 Dec 2025 15:18:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764890286; x=1765495086; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AWEQlYDaUsxp7jmlyLpjxPDtRsxXkORcN5A8Xf/todk=;
        b=Gg0ZlE9tcqOlhqQHSaDgk40I8NIN4VEMbXCJzMPK1Sn3FVWR6K4vS/PlKjQPwcGihy
         EjK0QA8EEJm6TDPoLGiA40VpmCZvaeAedmV3SYoelE1zTQQsh9/yvCnOMq6N8o31/6gN
         aGLHsqhUwkCLWCJo1OMuIzU3WRVeBv0velak8Byaei2zer8/wttCvYHCpRWA96k7GDz3
         AasVf2AriXldwwe4T9yQcKPIlzRpu3xI9MkXhIYjn/DzkgkJYlcvOydvhTea87kp5pZG
         uABPk2HAlk2S64c3Rap+75h4CO2DGd/OOqB4V1SgIaJyg9yjDQGz1Bzbfgn1+a7Z4R00
         /Skg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764890286; x=1765495086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AWEQlYDaUsxp7jmlyLpjxPDtRsxXkORcN5A8Xf/todk=;
        b=Oc0pZOy+fa/toG6gvygetX4Ke3KdQnftE6naFJblZMfDcN1vx/4XSW2U8Dk5ZOvlSq
         1l1Mb6emgB7dnEMMlrMJM1L9kOVv57lwUL8DNDmKwvnJBrFXZVWSJD6HaB5EEEsc0Uik
         LinetdAlllNSWUH/nywJu4TCGT0LTE3gO66vLlzN+S0Ky9NaNIUW8mINIKnag+tXNAXZ
         rhCS0TNydF7tuHUV1Y6pjhtpqYDlUCMS5AXKjysZ4eBMFCoMudBMJBhZPOzeRffdDhGA
         B1f7syfr4t0mOZh3D0wNGLOomToK3DtCDK2O3bBF+vzaY7bSIve9PB/8vYDu8rBIFFLv
         fCfg==
X-Gm-Message-State: AOJu0Yzq30drdENmwicB3Vg01rx2CgKZaR89ht06KDriqxrEuXg/KqEx
	mTXSOW83FEXMKjv9b6gC1MmJnhXSpD4Pt6fEm1CxLt7xht718jOqNFrz
X-Gm-Gg: ASbGnctEK3yfNRQjrMiM1f8hPRaLUHrakrATcPAMmaXQUfnw5lmYKPK+JTXQzBY6bSb
	MNH4CCbwD6XS8I63N2icXOu4FtmHqNnds1RcsfW/nbXT2rQ6JY/BOXceI9BL1BexFBUrS12gkwP
	3favpSxzevdRzC4QSgaDpD6VE8OuVV3rw13Yy3uQqe4u4tjLf/EGsgjanPVkBxyoS4hAyl4xQgl
	VkxJRcGT4rsLYpi/a1AcrW9Lr4DdIfU/WoIad5SzX6xxYV+qzMFvLZULR3N4LtWzq3Hu21Lozfa
	niTUKGcK4zoTkF3T2OtNj0mfHhxDIc7S/E1Jlmt81XtPuxeqPpS7KTvlkoXhQo38z8uTD15wV4w
	Y7MKmxOcS/hJRqQoiNdxhfdHZ9SwZBT5QR1CBUEpnvWRP20HFLYM2hdliBUoJjqb817lbaLNeDm
	11F+H0BxPlSpLG
X-Google-Smtp-Source: AGHT+IHxs1tQ1xeBAWh/tIWleP9GOEzT7NgHbhxODFuKWUB91u3R5HydNGSERen5RlQkjRsawkj7kQ==
X-Received: by 2002:a05:7022:23a4:b0:11a:962:99c2 with SMTP id a92af1059eb24-11df0cd9026mr6352423c88.38.1764890285862;
        Thu, 04 Dec 2025 15:18:05 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df749f8ddsm8406971c88.0.2025.12.04.15.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 15:18:05 -0800 (PST)
From: Julioccps <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  4 Dec 2025 20:17:53 -0300
Message-ID: <20251204231753.66229-1-julio191096@gmail.com>
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
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.171:from];
	BLOCKLISTDE_FAIL(0.00)[2804:1b2:9545:c615:2358:ef44:78a3:f69a:server fail];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EF21D3F8EF
X-Spamd-Bar: --
X-MailFrom: julio191096@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 47PSQK54MHSQPPF5C62EEZDNW4XWLBTN
X-Message-ID-Hash: 47PSQK54MHSQPPF5C62EEZDNW4XWLBTN
X-Mailman-Approved-At: Fri, 05 Dec 2025 02:12:06 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Julioccps <julio191096@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/47PSQK54MHSQPPF5C62EEZDNW4XWLBTN/>
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

Changes in v4:
    -  Fixed a typo in the v3 commit

Changes in v3:
  - Added changelog history as requested by the maintainer bot.

Changes in v2:
  - Shortened the subject line to match subsystem standards.
  - Updated Signed-off-by to use full real name.

 drivers/staging/greybus/arche-apb-ctrl.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 90ab32638d3f..eea9648a461c 100644
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
@@ -314,7 +315,7 @@ static ssize_t state_show(struct device *dev,
 
 static DEVICE_ATTR_RW(state);
 
-static int apb_ctrl_get_devtree_data(struct platform_device *pdev,
+static int apb_ctrl_get_fw_data(struct platform_device *pdev,
 				     struct arche_apb_ctrl_drvdata *apb)
 {
 	struct device *dev = &pdev->dev;
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
