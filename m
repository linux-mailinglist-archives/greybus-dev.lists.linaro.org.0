Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DD7CA7A86
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Dec 2025 13:56:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 56C173F99B
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Dec 2025 12:56:32 +0000 (UTC)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	by lists.linaro.org (Postfix) with ESMTPS id 34DAD3F953
	for <greybus-dev@lists.linaro.org>; Fri,  5 Dec 2025 11:06:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=H8y9gkzf;
	spf=pass (lists.linaro.org: domain of julio191096@gmail.com designates 209.85.221.182 as permitted sender) smtp.mailfrom=julio191096@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-55ae07cf627so619416e0c.1
        for <greybus-dev@lists.linaro.org>; Fri, 05 Dec 2025 03:06:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764932780; x=1765537580; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KZhvelUTNVQjpCwZjkIiRYWFFb4bmI4pkoHsXqQN7X4=;
        b=H8y9gkzfkDjfxrjqm5xNyWPZYxAWprdkPbqM+QB9cI8vDg88yhXt2qe9LZdp1kTjuW
         NMQrIQUFwMgW5EEmPsDDB5+HxjFe30L0RqmGIoyGVOhQUIo5UWBEgNBICvMXq5weo8TU
         utezCfPKgcPKoAujAHtetborfebi5oduNcogY531uvk+Sp6QtJLexVrmTyCGHK2cinbZ
         wFjKmV+ZP9bMBsFDd+7sqZVUfOWXAkRh+udaLB4/1nCRkC3f3uzEXpccfNUnojG7D5TP
         6R6UBjPaLPVEpTCw2PL5uSr+QBKQzFCJRBnFthaXepo4TeOgXEBWOmwAlBUSOEFEi8gM
         6J6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764932780; x=1765537580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZhvelUTNVQjpCwZjkIiRYWFFb4bmI4pkoHsXqQN7X4=;
        b=hBPY6HiBsp+MPzpQ+m5RrBybyBj5hFq5E+x8+wU93Tn2YSyXv+eakGeBrYBHv+0krX
         a4ugmRgnc1WJrO0Eq6G8N2kg57keAVecrB6D5iScRROtQVACj1Tg9r6L+G+Lw6MuFccG
         gluHJNlyZKUYoAZEc2QPJwhfBLD6LMkUIeGBwkEEp1Fk15yjOKZv4VjkZh6hx0psGgqu
         mFnwEK75i8YoQT+THO7IYdbE8PMED09oOf0oBMULfdu5Sc864U+LA3FSKT9lfvRKW1Wk
         uvoFJTK/PSkg0njq8zRUB0a2s89TQIKRLlnb7Bf5XJ6uzl5aEGkJO5v/choOcj14c53C
         EgkQ==
X-Gm-Message-State: AOJu0Yz4g31VsfQ98IOOUlwVZs+WNlyBGyn3seHZfVlwvl8Nt9cuMA/k
	doaokS5v1U88u1z100kQbJQcenvUnXuDjfa7oxAzwFtL4Ekn9w/gJhwc
X-Gm-Gg: ASbGncsovLnzpINCB65VMYMIeBdfvkchkEq/Q1U1FtH4668LzXiJ8iUcKipo67jhNU9
	y2B9w/DGVfcXqliJgH7PoeFzFg8GbILtWu6042TUQrkOREyMZ9eAz3lbfJS5xX02NvOjpQtpegh
	1tb4f7uYW9/TEiy5yY6I8HWDM6eeWwKiFOQlVav+P4gfRJTerymmSOUxGVwAb6VFOtz42uLGrec
	jcHyARlgkQXWzwQ9qQxFXQcPDlITynPaFPUAX6DyM/9IcISwA5H0t5i4l87FmrjZAzvvTmHKc+U
	c9EmRe8Ra3f2DLFkr1FR//7y6Y/EW7FhVmK9580WrFRHWIIcLD5KGNZfuln4Ym3AvqVZKEi6sfF
	RyaDyfHhhl6eIs1X3mEzPvv7rTj0c+olxKF2i0nBtl3737YkPOaphwq0G1n6iZ7nmJc8CDc/lyT
	/GCRGzw9o6qXw655Zu1BQnNGM=
X-Google-Smtp-Source: AGHT+IEkt8HW36gyLR1l2wdTY0ESpus9ypRrB4cqHbD2NMCLXH7kTrxq5PT359t4Ljci47BAN9TkQA==
X-Received: by 2002:a05:6122:660d:b0:55b:305b:4e3d with SMTP id 71dfb90a1353d-55e5c043be0mr3726432e0c.19.1764932779670;
        Fri, 05 Dec 2025 03:06:19 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93f01d022a4sm245598241.3.2025.12.05.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 03:06:19 -0800 (PST)
From: Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Date: Fri,  5 Dec 2025 08:06:07 -0300
Message-ID: <20251205110607.2438-1-julio191096@gmail.com>
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
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org,linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[2804:1b2:9545:c615:2358:ef44:78a3:f69a:server fail];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.182:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 34DAD3F953
X-Spamd-Bar: --
X-MailFrom: julio191096@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RMGOCV7SEJT4MCXS4ROXCP34RHQSDVAN
X-Message-ID-Hash: RMGOCV7SEJT4MCXS4ROXCP34RHQSDVAN
X-Mailman-Approved-At: Fri, 05 Dec 2025 12:56:26 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Julio Cesar Carvalho de Paula Souza <julio191096@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RMGOCV7SEJT4MCXS4ROXCP34RHQSDVAN/>
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
index 90ab32638d3f..6a4efa9a9e0e 100644
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
+			        struct arche_apb_ctrl_drvdata *apb)
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
