Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F0443CA5E2D
	for <lists+greybus-dev@lfdr.de>; Fri, 05 Dec 2025 03:12:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E15673F992
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Dec 2025 02:12:11 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	by lists.linaro.org (Postfix) with ESMTPS id DB5663F8EF
	for <greybus-dev@lists.linaro.org>; Thu,  4 Dec 2025 23:11:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=QEAZ4VmL;
	spf=pass (lists.linaro.org: domain of julio191096@gmail.com designates 209.85.215.182 as permitted sender) smtp.mailfrom=julio191096@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-bc29d64b39dso876623a12.3
        for <greybus-dev@lists.linaro.org>; Thu, 04 Dec 2025 15:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764889885; x=1765494685; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xqy3wcsk4O+DQIbyxqEYo0Dly3qr2S6LsCBX00uMEIk=;
        b=QEAZ4VmLEMFndAkegLsm6hLFn+rjH1nYCDElI9du0HB8lUzInO00dTiEJFMYqCuHh3
         3+Jw6VwxgLasdeG5eCYVYlgXVa4NPr/ESHg3bx70/fWupClG7EohtaD/lCUzobq1LOMC
         N36qCD/l/HcWRAUEjgf90Qyy9mCDWOwOAlYiwvzwT4/moXwWDhyohbaFdTrXQj/ZIdFC
         zgkBfH86b0o1RyctSbKXJNvMQJAlMt/fkk/141dOY8sdHv7jJUFQQen1OR+uoEN58frO
         9DI2VgHmvw522CN7mB7M28BkUmwhc1yBCjEwXcDN70pgGdar5iXLCfiTQA/cP3i5BIW3
         K2Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764889885; x=1765494685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xqy3wcsk4O+DQIbyxqEYo0Dly3qr2S6LsCBX00uMEIk=;
        b=o3+2ubbgWSGlLeovmmzLymuKtSTHWjPb8MBPCoVBb8sIm7CXEBHNTne/f1sooYYovr
         fgLfsfcm9KnNC9sS1yMlKu1Ts8J4lZHmLWfRQEvbm9J6b3x7xzKly3SVuGKyKV0mKhHD
         a3SPiU9qg5VKR453omps+E4PqXGHHYSQESH+kWiJ04q9dJIM2JrWcJjIEN0AwGXT7REq
         b8DxjDRYiCV2MIv8BNz8LONCxfCg0Hsgy8W3vI6nMi7bHK0n5vodBKLSMSq0zVZ59zln
         AVx2OJ3C/9EKV5pULNcXUY+oPBvPyfGB2Cmg7OERbR//8YLtCLNnq4y53MqneVSS506L
         8JDQ==
X-Gm-Message-State: AOJu0YxxCmKX/WLKmA/Hx6Iqv+mmL3KTg7x3NB98n9FlnfUjuxoNZ6Bz
	dRbGesC60nU3F3veM7vWBIbMGDoviOZAM1Hqzz9weVOi1ZVUem2iIaCf
X-Gm-Gg: ASbGncsTskDYZbKLjYczBiqsBtGV+xrEKeekeBvpwDREGmGd8S5NlIMgWCd2LnTQlpq
	KM3j+xb0mmTEryo9Hkj5kh4rogv7k5GAetyWZDtiJ5FzGOvL0VVDB2Gg20RsdBjGoGc5Ozetic5
	rl/P6JcRUhQvmVOrj295NwVrEw1GpVdJsLs/GgkMvqPFR3pEWvxPKGA+lcg8/poLN4QRpCJ0aue
	IDKpuB05MNTf86b83uJzwhUEPsOKC5xSfHA0oxLPmNJZUqKqpPQl1vUeGh7aXmd3jpSBhRoD6u1
	QnZdW0HrEWGCO9BZJ2ljH0TT9I+sgEgYLWkbUN+Lok3HgF7gaxhY6hX5/1M+ZNWeWvn2rEi8uTl
	nhinwNi6rVkcMFD89UAlMtaKu4bvuKfu1PBSBDVc1CBDKXnI0PLC3vS4KzODM24U0JCfOto8hZl
	P+Z04fqqwOgdWU
X-Google-Smtp-Source: AGHT+IGChwRhiuJpt1m7HWoo3n75LeO2jMMDnp2qXu4+IWXfmH04+yQWZYyW7q8gk/r2FK9JKF9qDg==
X-Received: by 2002:a05:7300:8b86:b0:2a4:3593:ddd8 with SMTP id 5a478bee46e88-2ab92d4fd2amr5006514eec.5.1764889884665;
        Thu, 04 Dec 2025 15:11:24 -0800 (PST)
Received: from archlinux ([2804:1b2:9545:c615:2358:ef44:78a3:f69a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87aa5fcsm8000962eec.3.2025.12.04.15.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 15:11:24 -0800 (PST)
From: Julioccps <julio191096@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  4 Dec 2025 20:11:10 -0300
Message-ID: <20251204231110.65847-1-julio191096@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.182:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[209.85.215.182:server fail,2804:1b2:9545:c615:2358:ef44:78a3:f69a:server fail];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DB5663F8EF
X-Spamd-Bar: --
X-MailFrom: julio191096@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6W6KBZ7GKUHFPKVYQ4CWMVCOSTAPS237
X-Message-ID-Hash: 6W6KBZ7GKUHFPKVYQ4CWMVCOSTAPS237
X-Mailman-Approved-At: Fri, 05 Dec 2025 02:12:05 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Julioccps <julio191096@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: arche-apb-ctrl: switch to device_property_read_bool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6W6KBZ7GKUHFPKVYQ4CWMVCOSTAPS237/>
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
hanges in v3:
  - Added version history (changelog) required by the subsystem maintainer.

Changes in v2:
  - Updated the subject line to match the subsystem standard.
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
