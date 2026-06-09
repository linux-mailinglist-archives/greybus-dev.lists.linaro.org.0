Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LJ6jOVCJKWq2YwMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:04 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600B66B166
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 17:57:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=GaQOhvXT;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4816140499
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jun 2026 15:57:03 +0000 (UTC)
Received: from mail-dy1-f194.google.com (mail-dy1-f194.google.com [74.125.82.194])
	by lists.linaro.org (Postfix) with ESMTPS id 0EEF840979
	for <greybus-dev@lists.linaro.org>; Tue,  9 Jun 2026 20:27:16 +0000 (UTC)
Received: by mail-dy1-f194.google.com with SMTP id 5a478bee46e88-304ec41197bso5880556eec.1
        for <greybus-dev@lists.linaro.org>; Tue, 09 Jun 2026 13:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781036835; x=1781641635; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iLwR6IHwmNaa9C/3Flq2TDyHPUp76uKXSunVgALSj9w=;
        b=GaQOhvXTFGKspmyJoBlpgo1+6aNhr9lvXu91xvR37Kdf9mYydEz6T+mG44DjI7wK+e
         gxK5q1U/I+eIHKugjZzzhkLb3qvcouF3G5Jl7QUvTFNuVx4fHO+pE9p3fdyFjWTTuUo+
         omX5224VgVnD78iAHTNyY0YjusjnX3cNwUQTd/qmDXyp1HsB0E7Nv3entlNdXs5Jewq9
         bwAXz0IijLjMkaF2msZgTDlGmQjGWmRm7VgA5GZht4ayRm661TCZRzpq6yJpcDKaLjmS
         jaWb6kAVbRtgsCMz+lTPpy41qMM/gGXKYVYJJ/VLYWhMvWX3mh7U3JyuZ4ulltM69VwN
         dBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781036835; x=1781641635;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLwR6IHwmNaa9C/3Flq2TDyHPUp76uKXSunVgALSj9w=;
        b=kw3GOgt4NuHWeE0jJoAuo3aq8rBoD99MNl0DfS/Th/7HehBTigBM/gpiUnnP8X55Vh
         2/3IzonnAEzniWVECYu3ip1m09kCnJmvr/EpxcF7Y82txfUPhczJyKmr2ZNYS5duTNuB
         X2K/xdEse79E4aKCrTMgC+UycqlUBPRnlYb1z1xmJ7gFG+n3RCZ96EGyIVizTDcESRQD
         vhM57Srb6aV3DahFsBAI3t9VlaKgmE9BFlbAVNlxqYHIwRkxZMikR7zo9x7ZiyROYMk4
         ndJmk6e7JxTtZ1DvCv8LSdpx9sBDIMq+EXvPdzT9KqmXQcIPGuo2Tl3BSaNFCeYLY0H8
         ogzQ==
X-Gm-Message-State: AOJu0YxZpS8/1+jLn8HFsKZ9NLEpAoBIKBpVHZXbPo8PqZSJvrU512t2
	uRw+YKMZZYg0Mp981/M+StrVbKh4K8J7c4Mb/cQIxJp9R3Q7FHetvGtgUPBErtjj
X-Gm-Gg: Acq92OH5rJsmvtdWlI2FUBPWshswbKsPs27UIT41+1lpktX5nYlch03nuX1AvpBFty3
	2r+L5coJicoJ0AFnpsTOe8SrXUzoKsqeldPC3OsUFU0jJNJQINgszN2wHrwp2ZHF4tFv4O/pcio
	N1/KAwkPA1Kbk+69C/7LUEDzqFbr5RLufBimRuPfFIdVL34VugeptSfmNkETrSvkcerIjq+PwZB
	UdnGwqNFGhFXT/nMI+4NkjM8VrHuSIVglWcRa37r8Al2GBFifDQ9FA8ek06dLa/AWO7DIGX2PXP
	aj5ghTJ7jrOf6ovysX2kzV4lfU3gVhVHSo1jDU+2cKhlF4wgdwZ45mA/az/xoramDhxEyAu5twe
	xuuQAboWP7dNqKV2A22gpR7q4hYun+s+TSGek0UgfiiNRsl/kOoCUBageWI4P5gmHIlxsLUw3IL
	pXhg4mShC5dD45ahOfVwQqzutXWCpexgo/Q82mXwKu33nNfQIjF0tJt1CrY2RyH9+II2QInlWe6
	kJ7isaZzC1OnXlFGUjOzAVHp5h70ccQdEbot9nxlt5p07Rnx0tlFViNfszpiMyLFwTHs8Gt1fJ/
	6pyEr4NMUBtP8sLcgGo/1eeW5Zb0
X-Received: by 2002:a05:693c:2c01:b0:2d2:96e8:1bf5 with SMTP id 5a478bee46e88-3077b32a4ddmr13713497eec.3.1781036834748;
        Tue, 09 Jun 2026 13:27:14 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db56697sm23357139eec.2.2026.06.09.13.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 13:27:14 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Tue,  9 Jun 2026 13:26:58 -0700
Message-ID: <20260609202705.183875-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: enelsonmoore@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YBPJPT34MV5PVRX7WM3ANY4G4RQOBMYH
X-Message-ID-Hash: YBPJPT34MV5PVRX7WM3ANY4G4RQOBMYH
X-Mailman-Approved-At: Wed, 10 Jun 2026 15:56:59 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Ethan Nelson-Moore <enelsonmoore@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Namjae Jeon <linkinjeon@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove driver depending on nonexistent config option
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YBPJPT34MV5PVRX7WM3ANY4G4RQOBMYH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:enelsonmoore@gmail.com,m:kuba@kernel.org,m:linkinjeon@kernel.org,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[enelsonmoore@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[enelsonmoore@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp,nexus-software.ie:email,linuxcare.com:email,demon.co.uk:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4600B66B166

The Greybus Arche Platform driver depends on the config option
USB_HSIC_USB3613, which has never existed in mainline Linux. Therefore,
it is impossible for anyone to be using it with unmodified mainline
kernels. Remove it and move the former maintainer to the CREDITS file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 CREDITS                                  |   4 +
 MAINTAINERS                              |   7 -
 drivers/staging/greybus/Kconfig          |   9 -
 drivers/staging/greybus/Makefile         |   6 -
 drivers/staging/greybus/arche-apb-ctrl.c | 491 -----------------
 drivers/staging/greybus/arche-platform.c | 653 -----------------------
 drivers/staging/greybus/arche_platform.h |  28 -
 7 files changed, 4 insertions(+), 1194 deletions(-)
 delete mode 100644 drivers/staging/greybus/arche-apb-ctrl.c
 delete mode 100644 drivers/staging/greybus/arche-platform.c
 delete mode 100644 drivers/staging/greybus/arche_platform.h

diff --git a/CREDITS b/CREDITS
index 17962bdd6dbd..19a493aceabf 100644
--- a/CREDITS
+++ b/CREDITS
@@ -1701,6 +1701,10 @@ S: Talstr. 1
 S: D - 72072 Tuebingen
 S: Germany
 
+N: Vaibhav Hiremath
+E: hvaibhav.linux@gmail.com
+D: Greybus Arche Platform driver
+
 N: Richard Hirst
 E: richard@sleepie.demon.co.uk
 E: rhirst@linuxcare.com
diff --git a/MAINTAINERS b/MAINTAINERS
index e035a3be797c..2461e8a6a45a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11122,13 +11122,6 @@ M:	Bryan O'Donoghue <pure.logic@nexus-software.ie>
 S:	Maintained
 F:	drivers/staging/greybus/loopback.c
 
-GREYBUS PLATFORM DRIVERS
-M:	Vaibhav Hiremath <hvaibhav.linux@gmail.com>
-S:	Maintained
-F:	drivers/staging/greybus/arche-apb-ctrl.c
-F:	drivers/staging/greybus/arche-platform.c
-F:	drivers/staging/greybus/arche_platform.h
-
 GREYBUS SDIO/GPIO/SPI PROTOCOLS DRIVERS
 M:	Rui Miguel Silva <rmfrfs@gmail.com>
 S:	Maintained
diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index 7635f3e850fa..c25da61570eb 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -204,13 +204,4 @@ config GREYBUS_USB
 
 endif	# GREYBUS_BRIDGED_PHY
 
-config GREYBUS_ARCHE
-	tristate "Greybus Arche Platform driver"
-	depends on USB_HSIC_USB3613 || COMPILE_TEST
-	help
-	  Select this option if you have an Arche device.
-
-	  To compile this code as a module, chose M here: the module
-	  will be called gb-arche.ko
-
 endif	# GREYBUS
diff --git a/drivers/staging/greybus/Makefile b/drivers/staging/greybus/Makefile
index 7c5e89622334..7b9807f8a1a3 100644
--- a/drivers/staging/greybus/Makefile
+++ b/drivers/staging/greybus/Makefile
@@ -65,9 +65,3 @@ obj-$(CONFIG_GREYBUS_SDIO)		+= gb-sdio.o
 obj-$(CONFIG_GREYBUS_SPI)		+= gb-spi.o gb-spilib.o
 obj-$(CONFIG_GREYBUS_UART)		+= gb-uart.o
 obj-$(CONFIG_GREYBUS_USB)		+= gb-usb.o
-
-
-# Greybus Platform driver
-gb-arche-y	:= arche-platform.o arche-apb-ctrl.o
-
-obj-$(CONFIG_GREYBUS_ARCHE)	+= gb-arche.o
diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
deleted file mode 100644
index 19a6e59b6d5c..000000000000
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ /dev/null
@@ -1,491 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Arche Platform driver to control APB.
- *
- * Copyright 2014-2015 Google Inc.
- * Copyright 2014-2015 Linaro Ltd.
- */
-
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/gpio/consumer.h>
-#include <linux/interrupt.h>
-#include <linux/module.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/platform_device.h>
-#include <linux/pm.h>
-#include <linux/property.h>
-#include <linux/regulator/consumer.h>
-#include <linux/spinlock.h>
-#include <linux/mod_devicetable.h>
-#include "arche_platform.h"
-
-static void apb_bootret_deassert(struct device *dev);
-
-struct arche_apb_ctrl_drvdata {
-	/* Control GPIO signals to and from AP <=> AP Bridges */
-	struct gpio_desc *resetn;
-	struct gpio_desc *boot_ret;
-	struct gpio_desc *pwroff;
-	struct gpio_desc *wake_in;
-	struct gpio_desc *wake_out;
-	struct gpio_desc *pwrdn;
-
-	enum arche_platform_state state;
-	bool init_disabled;
-
-	struct regulator *vcore;
-	struct regulator *vio;
-
-	struct gpio_desc *clk_en;
-	struct clk *clk;
-
-	struct pinctrl *pinctrl;
-	struct pinctrl_state *pin_default;
-
-	/* V2: SPI Bus control  */
-	struct gpio_desc *spi_en;
-	bool spi_en_polarity_high;
-};
-
-/*
- * Note that these low level api's are active high
- */
-static inline void deassert_reset(struct gpio_desc *gpio)
-{
-	gpiod_set_raw_value(gpio, 1);
-}
-
-static inline void assert_reset(struct gpio_desc *gpio)
-{
-	gpiod_set_raw_value(gpio, 0);
-}
-
-/*
- * Note: Please do not modify the below sequence, as it is as per the spec
- */
-static int coldboot_seq(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct arche_apb_ctrl_drvdata *apb = platform_get_drvdata(pdev);
-	int ret;
-
-	if (apb->init_disabled ||
-	    apb->state == ARCHE_PLATFORM_STATE_ACTIVE)
-		return 0;
-
-	/* Hold APB in reset state */
-	assert_reset(apb->resetn);
-
-	if (apb->state == ARCHE_PLATFORM_STATE_FW_FLASHING && apb->spi_en)
-		devm_gpiod_put(dev, apb->spi_en);
-
-	/* Enable power to APB */
-	if (!IS_ERR(apb->vcore)) {
-		ret = regulator_enable(apb->vcore);
-		if (ret) {
-			dev_err(dev, "failed to enable core regulator\n");
-			return ret;
-		}
-	}
-
-	if (!IS_ERR(apb->vio)) {
-		ret = regulator_enable(apb->vio);
-		if (ret) {
-			dev_err(dev, "failed to enable IO regulator\n");
-			return ret;
-		}
-	}
-
-	apb_bootret_deassert(dev);
-
-	/* On DB3 clock was not mandatory */
-	if (apb->clk_en)
-		gpiod_set_value(apb->clk_en, 1);
-
-	usleep_range(100, 200);
-
-	/* deassert reset to APB : Active-low signal */
-	deassert_reset(apb->resetn);
-
-	apb->state = ARCHE_PLATFORM_STATE_ACTIVE;
-
-	return 0;
-}
-
-static int fw_flashing_seq(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct arche_apb_ctrl_drvdata *apb = platform_get_drvdata(pdev);
-	int ret;
-
-	if (apb->init_disabled ||
-	    apb->state == ARCHE_PLATFORM_STATE_FW_FLASHING)
-		return 0;
-
-	ret = regulator_enable(apb->vcore);
-	if (ret) {
-		dev_err(dev, "failed to enable core regulator\n");
-		return ret;
-	}
-
-	ret = regulator_enable(apb->vio);
-	if (ret) {
-		dev_err(dev, "failed to enable IO regulator\n");
-		return ret;
-	}
-
-	if (apb->spi_en) {
-		unsigned long flags;
-
-		if (apb->spi_en_polarity_high)
-			flags = GPIOD_OUT_HIGH;
-		else
-			flags = GPIOD_OUT_LOW;
-
-		apb->spi_en = devm_gpiod_get(dev, "spi-en", flags);
-		if (IS_ERR(apb->spi_en)) {
-			ret = PTR_ERR(apb->spi_en);
-			dev_err(dev, "Failed requesting SPI bus en GPIO: %d\n",
-				ret);
-			return ret;
-		}
-	}
-
-	/* for flashing device should be in reset state */
-	assert_reset(apb->resetn);
-	apb->state = ARCHE_PLATFORM_STATE_FW_FLASHING;
-
-	return 0;
-}
-
-static int standby_boot_seq(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct arche_apb_ctrl_drvdata *apb = platform_get_drvdata(pdev);
-
-	if (apb->init_disabled)
-		return 0;
-
-	/*
-	 * Even if it is in OFF state,
-	 * then we do not want to change the state
-	 */
-	if (apb->state == ARCHE_PLATFORM_STATE_STANDBY ||
-	    apb->state == ARCHE_PLATFORM_STATE_OFF)
-		return 0;
-
-	if (apb->state == ARCHE_PLATFORM_STATE_FW_FLASHING && apb->spi_en)
-		devm_gpiod_put(dev, apb->spi_en);
-
-	/*
-	 * As per WDM spec, do nothing
-	 *
-	 * Pasted from WDM spec,
-	 *  - A falling edge on POWEROFF_L is detected (a)
-	 *  - WDM enters standby mode, but no output signals are changed
-	 */
-
-	/* TODO: POWEROFF_L is input to WDM module  */
-	apb->state = ARCHE_PLATFORM_STATE_STANDBY;
-	return 0;
-}
-
-static void poweroff_seq(struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct arche_apb_ctrl_drvdata *apb = platform_get_drvdata(pdev);
-
-	if (apb->init_disabled || apb->state == ARCHE_PLATFORM_STATE_OFF)
-		return;
-
-	if (apb->state == ARCHE_PLATFORM_STATE_FW_FLASHING && apb->spi_en)
-		devm_gpiod_put(dev, apb->spi_en);
-
-	/* disable the clock */
-	if (apb->clk_en)
-		gpiod_set_value(apb->clk_en, 0);
-
-	if (!IS_ERR(apb->vcore) && regulator_is_enabled(apb->vcore) > 0)
-		regulator_disable(apb->vcore);
-
-	if (!IS_ERR(apb->vio) && regulator_is_enabled(apb->vio) > 0)
-		regulator_disable(apb->vio);
-
-	/* As part of exit, put APB back in reset state */
-	assert_reset(apb->resetn);
-	apb->state = ARCHE_PLATFORM_STATE_OFF;
-
-	/* TODO: May have to send an event to SVC about this exit */
-}
-
-static void apb_bootret_deassert(struct device *dev)
-{
-	struct arche_apb_ctrl_drvdata *apb = dev_get_drvdata(dev);
-
-	gpiod_set_value(apb->boot_ret, 0);
-}
-
-int apb_ctrl_coldboot(struct device *dev)
-{
-	return coldboot_seq(to_platform_device(dev));
-}
-
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
-void apb_ctrl_poweroff(struct device *dev)
-{
-	poweroff_seq(to_platform_device(dev));
-}
-
-static ssize_t state_store(struct device *dev,
-			   struct device_attribute *attr,
-			   const char *buf, size_t count)
-{
-	struct platform_device *pdev = to_platform_device(dev);
-	struct arche_apb_ctrl_drvdata *apb = platform_get_drvdata(pdev);
-	int ret = 0;
-	bool is_disabled;
-
-	if (sysfs_streq(buf, "off")) {
-		if (apb->state == ARCHE_PLATFORM_STATE_OFF)
-			return count;
-
-		poweroff_seq(pdev);
-	} else if (sysfs_streq(buf, "active")) {
-		if (apb->state == ARCHE_PLATFORM_STATE_ACTIVE)
-			return count;
-
-		poweroff_seq(pdev);
-		is_disabled = apb->init_disabled;
-		apb->init_disabled = false;
-		ret = coldboot_seq(pdev);
-		if (ret)
-			apb->init_disabled = is_disabled;
-	} else if (sysfs_streq(buf, "standby")) {
-		if (apb->state == ARCHE_PLATFORM_STATE_STANDBY)
-			return count;
-
-		ret = standby_boot_seq(pdev);
-	} else if (sysfs_streq(buf, "fw_flashing")) {
-		if (apb->state == ARCHE_PLATFORM_STATE_FW_FLASHING)
-			return count;
-
-		/*
-		 * First we want to make sure we power off everything
-		 * and then enter FW flashing state
-		 */
-		poweroff_seq(pdev);
-		ret = fw_flashing_seq(pdev);
-	} else {
-		dev_err(dev, "unknown state\n");
-		ret = -EINVAL;
-	}
-
-	return ret ? ret : count;
-}
-
-static ssize_t state_show(struct device *dev,
-			  struct device_attribute *attr, char *buf)
-{
-	struct arche_apb_ctrl_drvdata *apb = dev_get_drvdata(dev);
-
-	switch (apb->state) {
-	case ARCHE_PLATFORM_STATE_OFF:
-		return sysfs_emit(buf, "off%s\n",
-				apb->init_disabled ? ",disabled" : "");
-	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sysfs_emit(buf, "active\n");
-	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sysfs_emit(buf, "standby\n");
-	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sysfs_emit(buf, "fw_flashing\n");
-	default:
-		return sysfs_emit(buf, "unknown state\n");
-	}
-}
-
-static DEVICE_ATTR_RW(state);
-
-static int apb_ctrl_get_fw_data(struct platform_device *pdev,
-				struct arche_apb_ctrl_drvdata *apb)
-{
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	apb->resetn = devm_gpiod_get(dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(apb->resetn)) {
-		ret = PTR_ERR(apb->resetn);
-		dev_err(dev, "Failed requesting reset GPIO: %d\n", ret);
-		return ret;
-	}
-
-	apb->boot_ret = devm_gpiod_get(dev, "boot-ret", GPIOD_OUT_LOW);
-	if (IS_ERR(apb->boot_ret)) {
-		ret = PTR_ERR(apb->boot_ret);
-		dev_err(dev, "Failed requesting bootret GPIO: %d\n", ret);
-		return ret;
-	}
-
-	/* It's not mandatory to support power management interface */
-	apb->pwroff = devm_gpiod_get_optional(dev, "pwr-off", GPIOD_IN);
-	if (IS_ERR(apb->pwroff)) {
-		ret = PTR_ERR(apb->pwroff);
-		dev_err(dev, "Failed requesting pwroff_n GPIO: %d\n", ret);
-		return ret;
-	}
-
-	/* Do not make clock mandatory as of now (for DB3) */
-	apb->clk_en = devm_gpiod_get_optional(dev, "clock-en", GPIOD_OUT_LOW);
-	if (IS_ERR(apb->clk_en)) {
-		ret = PTR_ERR(apb->clk_en);
-		dev_err(dev, "Failed requesting APB clock en GPIO: %d\n", ret);
-		return ret;
-	}
-
-	apb->pwrdn = devm_gpiod_get(dev, "pwr-down", GPIOD_OUT_LOW);
-	if (IS_ERR(apb->pwrdn)) {
-		ret = PTR_ERR(apb->pwrdn);
-		dev_warn(dev, "Failed requesting power down GPIO: %d\n", ret);
-		return ret;
-	}
-
-	/* Regulators are optional, as we may have fixed supply coming in */
-	apb->vcore = devm_regulator_get(dev, "vcore");
-	if (IS_ERR(apb->vcore))
-		dev_warn(dev, "no core regulator found\n");
-
-	apb->vio = devm_regulator_get(dev, "vio");
-	if (IS_ERR(apb->vio))
-		dev_warn(dev, "no IO regulator found\n");
-
-	apb->pinctrl = devm_pinctrl_get(&pdev->dev);
-	if (IS_ERR(apb->pinctrl)) {
-		dev_err(&pdev->dev, "could not get pinctrl handle\n");
-		return PTR_ERR(apb->pinctrl);
-	}
-	apb->pin_default = pinctrl_lookup_state(apb->pinctrl, "default");
-	if (IS_ERR(apb->pin_default)) {
-		dev_err(&pdev->dev, "could not get default pin state\n");
-		return PTR_ERR(apb->pin_default);
-	}
-
-	/* Only applicable for platform >= V2 */
-	if (device_property_read_bool(&pdev->dev, "gb,spi-en-active-high"))
-		apb->spi_en_polarity_high = true;
-
-	return 0;
-}
-
-static int arche_apb_ctrl_probe(struct platform_device *pdev)
-{
-	int ret;
-	struct arche_apb_ctrl_drvdata *apb;
-	struct device *dev = &pdev->dev;
-
-	apb = devm_kzalloc(&pdev->dev, sizeof(*apb), GFP_KERNEL);
-	if (!apb)
-		return -ENOMEM;
-
-	ret = apb_ctrl_get_fw_data(pdev, apb);
-	if (ret) {
-		dev_err(dev, "failed to get apb devicetree data %d\n", ret);
-		return ret;
-	}
-
-	/* Initially set APB to OFF state */
-	apb->state = ARCHE_PLATFORM_STATE_OFF;
-	/* Check whether device needs to be enabled on boot */
-	if (device_property_read_bool(&pdev->dev, "arche,init-disable"))
-		apb->init_disabled = true;
-
-	platform_set_drvdata(pdev, apb);
-
-	/* Create sysfs interface to allow user to change state dynamically */
-	ret = device_create_file(dev, &dev_attr_state);
-	if (ret) {
-		dev_err(dev, "failed to create state file in sysfs\n");
-		return ret;
-	}
-
-	dev_info(&pdev->dev, "Device registered successfully\n");
-	return 0;
-}
-
-static void arche_apb_ctrl_remove(struct platform_device *pdev)
-{
-	device_remove_file(&pdev->dev, &dev_attr_state);
-	poweroff_seq(pdev);
-	platform_set_drvdata(pdev, NULL);
-}
-
-static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
-{
-	/*
-	 * If timing profile permits, we may shutdown bridge
-	 * completely
-	 *
-	 * TODO: sequence ??
-	 *
-	 * Also, need to make sure we meet precondition for unipro suspend
-	 * Precondition: Definition ???
-	 */
-	return 0;
-}
-
-static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
-{
-	/*
-	 * At least for ES2 we have to meet the delay requirement between
-	 * unipro switch and AP bridge init, depending on whether bridge is in
-	 * OFF state or standby state.
-	 *
-	 * Based on whether bridge is in standby or OFF state we may have to
-	 * assert multiple signals. Please refer to WDM spec, for more info.
-	 *
-	 */
-	return 0;
-}
-
-static void arche_apb_ctrl_shutdown(struct platform_device *pdev)
-{
-	apb_ctrl_poweroff(&pdev->dev);
-}
-
-static SIMPLE_DEV_PM_OPS(arche_apb_ctrl_pm_ops, arche_apb_ctrl_suspend,
-			 arche_apb_ctrl_resume);
-
-static const struct of_device_id arche_apb_ctrl_of_match[] = {
-	{ .compatible = "usbffff,2", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, arche_apb_ctrl_of_match);
-
-static struct platform_driver arche_apb_ctrl_device_driver = {
-	.probe		= arche_apb_ctrl_probe,
-	.remove		= arche_apb_ctrl_remove,
-	.shutdown	= arche_apb_ctrl_shutdown,
-	.driver		= {
-		.name	= "arche-apb-ctrl",
-		.pm	= &arche_apb_ctrl_pm_ops,
-		.of_match_table = arche_apb_ctrl_of_match,
-	}
-};
-
-int __init arche_apb_init(void)
-{
-	return platform_driver_register(&arche_apb_ctrl_device_driver);
-}
-
-void __exit arche_apb_exit(void)
-{
-	platform_driver_unregister(&arche_apb_ctrl_device_driver);
-}
diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
deleted file mode 100644
index de5de59ea8ab..000000000000
--- a/drivers/staging/greybus/arche-platform.c
+++ /dev/null
@@ -1,653 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Arche Platform driver to enable Unipro link.
- *
- * Copyright 2014-2015 Google Inc.
- * Copyright 2014-2015 Linaro Ltd.
- */
-
-#include <linux/clk.h>
-#include <linux/delay.h>
-#include <linux/gpio/consumer.h>
-#include <linux/init.h>
-#include <linux/module.h>
-#include <linux/of_platform.h>
-#include <linux/pinctrl/consumer.h>
-#include <linux/platform_device.h>
-#include <linux/pm.h>
-#include <linux/interrupt.h>
-#include <linux/irq.h>
-#include <linux/suspend.h>
-#include <linux/time.h>
-#include <linux/greybus.h>
-#include <linux/of.h>
-#include "arche_platform.h"
-
-#if IS_ENABLED(CONFIG_USB_HSIC_USB3613)
-#include <linux/usb/usb3613.h>
-#else
-static inline int usb3613_hub_mode_ctrl(bool unused)
-{
-	return 0;
-}
-#endif
-
-#define WD_COLDBOOT_PULSE_WIDTH_MS	30
-
-enum svc_wakedetect_state {
-	WD_STATE_IDLE,			/* Default state = pulled high/low */
-	WD_STATE_BOOT_INIT,		/* WD = falling edge (low) */
-	WD_STATE_COLDBOOT_TRIG,		/* WD = rising edge (high), > 30msec */
-	WD_STATE_STANDBYBOOT_TRIG,	/* As of now not used ?? */
-	WD_STATE_COLDBOOT_START,	/* Cold boot process started */
-	WD_STATE_STANDBYBOOT_START,	/* Not used */
-};
-
-struct arche_platform_drvdata {
-	/* Control GPIO signals to and from AP <=> SVC */
-	struct gpio_desc *svc_reset;
-	bool is_reset_act_hi;
-	struct gpio_desc *svc_sysboot;
-	struct gpio_desc *wake_detect; /* bi-dir,maps to WAKE_MOD & WAKE_FRAME signals */
-
-	enum arche_platform_state state;
-
-	struct gpio_desc *svc_refclk_req;
-	struct clk *svc_ref_clk;
-
-	struct pinctrl *pinctrl;
-	struct pinctrl_state *pin_default;
-
-	int num_apbs;
-
-	enum svc_wakedetect_state wake_detect_state;
-	int wake_detect_irq;
-	spinlock_t wake_lock;			/* Protect wake_detect_state */
-	struct mutex platform_state_mutex;	/* Protect state */
-	unsigned long wake_detect_start;
-	struct notifier_block pm_notifier;
-
-	struct device *dev;
-};
-
-/* Requires calling context to hold arche_pdata->platform_state_mutex */
-static void arche_platform_set_state(struct arche_platform_drvdata *arche_pdata,
-				     enum arche_platform_state state)
-{
-	arche_pdata->state = state;
-}
-
-/* Requires arche_pdata->wake_lock is held by calling context */
-static void arche_platform_set_wake_detect_state(struct arche_platform_drvdata *arche_pdata,
-						 enum svc_wakedetect_state state)
-{
-	arche_pdata->wake_detect_state = state;
-}
-
-static inline void svc_reset_onoff(struct gpio_desc *gpio, bool onoff)
-{
-	gpiod_set_raw_value(gpio, onoff);
-}
-
-static int apb_cold_boot(struct device *dev, void *data)
-{
-	int ret;
-
-	ret = apb_ctrl_coldboot(dev);
-	if (ret)
-		dev_warn(dev, "failed to coldboot\n");
-
-	/*Child nodes are independent, so do not exit coldboot operation */
-	return 0;
-}
-
-static int apb_poweroff(struct device *dev, void *data)
-{
-	apb_ctrl_poweroff(dev);
-
-	/* Enable HUB3613 into HUB mode. */
-	if (usb3613_hub_mode_ctrl(false))
-		dev_warn(dev, "failed to control hub device\n");
-
-	return 0;
-}
-
-static void arche_platform_wd_irq_en(struct arche_platform_drvdata *arche_pdata)
-{
-	/* Enable interrupt here, to read event back from SVC */
-	enable_irq(arche_pdata->wake_detect_irq);
-}
-
-static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
-{
-	struct arche_platform_drvdata *arche_pdata = devid;
-	unsigned long flags;
-
-	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
-	if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_TRIG) {
-		/* Something is wrong */
-		spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
-		return IRQ_HANDLED;
-	}
-
-	arche_platform_set_wake_detect_state(arche_pdata,
-					     WD_STATE_COLDBOOT_START);
-	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
-
-	/* It should complete power cycle, so first make sure it is poweroff */
-	device_for_each_child(arche_pdata->dev, NULL, apb_poweroff);
-
-	/* Bring APB out of reset: cold boot sequence */
-	device_for_each_child(arche_pdata->dev, NULL, apb_cold_boot);
-
-	/* Enable HUB3613 into HUB mode. */
-	if (usb3613_hub_mode_ctrl(true))
-		dev_warn(arche_pdata->dev, "failed to control hub device\n");
-
-	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
-	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_IDLE);
-	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
-
-	return IRQ_HANDLED;
-}
-
-static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
-{
-	struct arche_platform_drvdata *arche_pdata = devid;
-	unsigned long flags;
-
-	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
-
-	if (gpiod_get_value(arche_pdata->wake_detect)) {
-		/* wake/detect rising */
-
-		/*
-		 * If wake/detect line goes high after low, within less than
-		 * 30msec, then standby boot sequence is initiated, which is not
-		 * supported/implemented as of now. So ignore it.
-		 */
-		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
-			if (time_before(jiffies,
-					arche_pdata->wake_detect_start +
-					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
-				arche_platform_set_wake_detect_state(arche_pdata,
-								     WD_STATE_IDLE);
-			} else {
-				/*
-				 * Check we are not in middle of irq thread
-				 * already
-				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
-					return IRQ_WAKE_THREAD;
-				}
-			}
-		}
-	} else {
-		/* wake/detect falling */
-		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
-			arche_pdata->wake_detect_start = jiffies;
-			/*
-			 * In the beginning, when wake/detect goes low
-			 * (first time), we assume it is meant for coldboot
-			 * and set the flag. If wake/detect line stays low
-			 * beyond 30msec, then it is coldboot else fallback
-			 * to standby boot.
-			 */
-			arche_platform_set_wake_detect_state(arche_pdata,
-							     WD_STATE_BOOT_INIT);
-		}
-	}
-
-	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
-
-	return IRQ_HANDLED;
-}
-
-/*
- * Requires arche_pdata->platform_state_mutex to be held
- */
-static int
-arche_platform_coldboot_seq(struct arche_platform_drvdata *arche_pdata)
-{
-	int ret;
-
-	if (arche_pdata->state == ARCHE_PLATFORM_STATE_ACTIVE)
-		return 0;
-
-	dev_info(arche_pdata->dev, "Booting from cold boot state\n");
-
-	svc_reset_onoff(arche_pdata->svc_reset, arche_pdata->is_reset_act_hi);
-
-	gpiod_set_value(arche_pdata->svc_sysboot, 0);
-	usleep_range(100, 200);
-
-	ret = clk_prepare_enable(arche_pdata->svc_ref_clk);
-	if (ret) {
-		dev_err(arche_pdata->dev, "failed to enable svc_ref_clk: %d\n",
-			ret);
-		return ret;
-	}
-
-	/* bring SVC out of reset */
-	svc_reset_onoff(arche_pdata->svc_reset, !arche_pdata->is_reset_act_hi);
-
-	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_ACTIVE);
-
-	return 0;
-}
-
-/*
- * Requires arche_pdata->platform_state_mutex to be held
- */
-static int
-arche_platform_fw_flashing_seq(struct arche_platform_drvdata *arche_pdata)
-{
-	int ret;
-
-	if (arche_pdata->state == ARCHE_PLATFORM_STATE_FW_FLASHING)
-		return 0;
-
-	dev_info(arche_pdata->dev, "Switching to FW flashing state\n");
-
-	svc_reset_onoff(arche_pdata->svc_reset, arche_pdata->is_reset_act_hi);
-
-	gpiod_set_value(arche_pdata->svc_sysboot, 1);
-
-	usleep_range(100, 200);
-
-	ret = clk_prepare_enable(arche_pdata->svc_ref_clk);
-	if (ret) {
-		dev_err(arche_pdata->dev, "failed to enable svc_ref_clk: %d\n",
-			ret);
-		return ret;
-	}
-
-	svc_reset_onoff(arche_pdata->svc_reset,	!arche_pdata->is_reset_act_hi);
-
-	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_FW_FLASHING);
-
-	return 0;
-}
-
-/*
- * Requires arche_pdata->platform_state_mutex to be held
- */
-static void
-arche_platform_poweroff_seq(struct arche_platform_drvdata *arche_pdata)
-{
-	unsigned long flags;
-
-	if (arche_pdata->state == ARCHE_PLATFORM_STATE_OFF)
-		return;
-
-	/* If in fw_flashing mode, then no need to repeate things again */
-	if (arche_pdata->state != ARCHE_PLATFORM_STATE_FW_FLASHING) {
-		disable_irq(arche_pdata->wake_detect_irq);
-
-		spin_lock_irqsave(&arche_pdata->wake_lock, flags);
-		arche_platform_set_wake_detect_state(arche_pdata,
-						     WD_STATE_IDLE);
-		spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
-	}
-
-	clk_disable_unprepare(arche_pdata->svc_ref_clk);
-
-	/* As part of exit, put APB back in reset state */
-	svc_reset_onoff(arche_pdata->svc_reset,	arche_pdata->is_reset_act_hi);
-
-	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
-}
-
-static ssize_t state_store(struct device *dev,
-			   struct device_attribute *attr,
-			   const char *buf, size_t count)
-{
-	struct arche_platform_drvdata *arche_pdata = dev_get_drvdata(dev);
-	int ret = 0;
-
-	mutex_lock(&arche_pdata->platform_state_mutex);
-
-	if (sysfs_streq(buf, "off")) {
-		if (arche_pdata->state == ARCHE_PLATFORM_STATE_OFF)
-			goto exit;
-
-		/*  If SVC goes down, bring down APB's as well */
-		device_for_each_child(arche_pdata->dev, NULL, apb_poweroff);
-
-		arche_platform_poweroff_seq(arche_pdata);
-
-	} else if (sysfs_streq(buf, "active")) {
-		if (arche_pdata->state == ARCHE_PLATFORM_STATE_ACTIVE)
-			goto exit;
-
-		/* First we want to make sure we power off everything
-		 * and then activate back again
-		 */
-		device_for_each_child(arche_pdata->dev, NULL, apb_poweroff);
-		arche_platform_poweroff_seq(arche_pdata);
-
-		arche_platform_wd_irq_en(arche_pdata);
-		ret = arche_platform_coldboot_seq(arche_pdata);
-		if (ret)
-			goto exit;
-
-	} else if (sysfs_streq(buf, "standby")) {
-		if (arche_pdata->state == ARCHE_PLATFORM_STATE_STANDBY)
-			goto exit;
-
-		dev_warn(arche_pdata->dev, "standby state not supported\n");
-	} else if (sysfs_streq(buf, "fw_flashing")) {
-		if (arche_pdata->state == ARCHE_PLATFORM_STATE_FW_FLASHING)
-			goto exit;
-
-		/*
-		 * Here we only control SVC.
-		 *
-		 * In case of FW_FLASHING mode we do not want to control
-		 * APBs, as in case of V2, SPI bus is shared between both
-		 * the APBs. So let user chose which APB he wants to flash.
-		 */
-		arche_platform_poweroff_seq(arche_pdata);
-
-		ret = arche_platform_fw_flashing_seq(arche_pdata);
-		if (ret)
-			goto exit;
-	} else {
-		dev_err(arche_pdata->dev, "unknown state\n");
-		ret = -EINVAL;
-	}
-
-exit:
-	mutex_unlock(&arche_pdata->platform_state_mutex);
-	return ret ? ret : count;
-}
-
-static ssize_t state_show(struct device *dev,
-			  struct device_attribute *attr, char *buf)
-{
-	struct arche_platform_drvdata *arche_pdata = dev_get_drvdata(dev);
-
-	switch (arche_pdata->state) {
-	case ARCHE_PLATFORM_STATE_OFF:
-		return sysfs_emit(buf, "off\n");
-	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sysfs_emit(buf, "active\n");
-	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sysfs_emit(buf, "standby\n");
-	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sysfs_emit(buf, "fw_flashing\n");
-	default:
-		return sysfs_emit(buf, "unknown state\n");
-	}
-}
-
-static DEVICE_ATTR_RW(state);
-
-static int arche_platform_pm_notifier(struct notifier_block *notifier,
-				      unsigned long pm_event, void *unused)
-{
-	struct arche_platform_drvdata *arche_pdata =
-		container_of(notifier, struct arche_platform_drvdata,
-			     pm_notifier);
-	int ret = NOTIFY_DONE;
-
-	mutex_lock(&arche_pdata->platform_state_mutex);
-	switch (pm_event) {
-	case PM_SUSPEND_PREPARE:
-		if (arche_pdata->state != ARCHE_PLATFORM_STATE_ACTIVE) {
-			ret = NOTIFY_STOP;
-			break;
-		}
-		device_for_each_child(arche_pdata->dev, NULL, apb_poweroff);
-		arche_platform_poweroff_seq(arche_pdata);
-		break;
-	case PM_POST_SUSPEND:
-		if (arche_pdata->state != ARCHE_PLATFORM_STATE_OFF)
-			break;
-
-		arche_platform_wd_irq_en(arche_pdata);
-		arche_platform_coldboot_seq(arche_pdata);
-		break;
-	default:
-		break;
-	}
-	mutex_unlock(&arche_pdata->platform_state_mutex);
-
-	return ret;
-}
-
-static int arche_platform_probe(struct platform_device *pdev)
-{
-	struct arche_platform_drvdata *arche_pdata;
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	int ret;
-	unsigned int flags;
-
-	arche_pdata = devm_kzalloc(&pdev->dev, sizeof(*arche_pdata),
-				   GFP_KERNEL);
-	if (!arche_pdata)
-		return -ENOMEM;
-
-	/* setup svc reset gpio */
-	arche_pdata->is_reset_act_hi = of_property_read_bool(np,
-							     "svc,reset-active-high");
-	if (arche_pdata->is_reset_act_hi)
-		flags = GPIOD_OUT_HIGH;
-	else
-		flags = GPIOD_OUT_LOW;
-
-	arche_pdata->svc_reset = devm_gpiod_get(dev, "svc,reset", flags);
-	if (IS_ERR(arche_pdata->svc_reset)) {
-		ret = PTR_ERR(arche_pdata->svc_reset);
-		dev_err(dev, "failed to request svc-reset GPIO: %d\n", ret);
-		return ret;
-	}
-	arche_platform_set_state(arche_pdata, ARCHE_PLATFORM_STATE_OFF);
-
-	arche_pdata->svc_sysboot = devm_gpiod_get(dev, "svc,sysboot",
-						  GPIOD_OUT_LOW);
-	if (IS_ERR(arche_pdata->svc_sysboot)) {
-		ret = PTR_ERR(arche_pdata->svc_sysboot);
-		dev_err(dev, "failed to request sysboot0 GPIO: %d\n", ret);
-		return ret;
-	}
-
-	/* setup the clock request gpio first */
-	arche_pdata->svc_refclk_req = devm_gpiod_get(dev, "svc,refclk-req",
-						     GPIOD_IN);
-	if (IS_ERR(arche_pdata->svc_refclk_req)) {
-		ret = PTR_ERR(arche_pdata->svc_refclk_req);
-		dev_err(dev, "failed to request svc-clk-req GPIO: %d\n", ret);
-		return ret;
-	}
-
-	/* setup refclk2 to follow the pin */
-	arche_pdata->svc_ref_clk = devm_clk_get(dev, "svc_ref_clk");
-	if (IS_ERR(arche_pdata->svc_ref_clk)) {
-		ret = PTR_ERR(arche_pdata->svc_ref_clk);
-		dev_err(dev, "failed to get svc_ref_clk: %d\n", ret);
-		return ret;
-	}
-
-	platform_set_drvdata(pdev, arche_pdata);
-
-	arche_pdata->num_apbs = of_get_child_count(np);
-	dev_dbg(dev, "Number of APB's available - %d\n", arche_pdata->num_apbs);
-
-	arche_pdata->wake_detect = devm_gpiod_get(dev, "svc,wake-detect",
-						  GPIOD_IN);
-	if (IS_ERR(arche_pdata->wake_detect)) {
-		ret = PTR_ERR(arche_pdata->wake_detect);
-		dev_err(dev, "Failed requesting wake_detect GPIO: %d\n", ret);
-		return ret;
-	}
-
-	arche_platform_set_wake_detect_state(arche_pdata, WD_STATE_IDLE);
-
-	arche_pdata->dev = &pdev->dev;
-
-	spin_lock_init(&arche_pdata->wake_lock);
-	mutex_init(&arche_pdata->platform_state_mutex);
-	arche_pdata->wake_detect_irq =
-		gpiod_to_irq(arche_pdata->wake_detect);
-
-	ret = devm_request_threaded_irq(dev, arche_pdata->wake_detect_irq,
-					arche_platform_wd_irq,
-					arche_platform_wd_irq_thread,
-					IRQF_TRIGGER_FALLING |
-					IRQF_TRIGGER_RISING | IRQF_ONESHOT,
-					dev_name(dev), arche_pdata);
-	if (ret) {
-		dev_err(dev, "failed to request wake detect IRQ %d\n", ret);
-		return ret;
-	}
-	disable_irq(arche_pdata->wake_detect_irq);
-
-	ret = device_create_file(dev, &dev_attr_state);
-	if (ret) {
-		dev_err(dev, "failed to create state file in sysfs\n");
-		return ret;
-	}
-
-	ret = of_platform_populate(np, NULL, NULL, dev);
-	if (ret) {
-		dev_err(dev, "failed to populate child nodes %d\n", ret);
-		goto err_device_remove;
-	}
-
-	arche_pdata->pm_notifier.notifier_call = arche_platform_pm_notifier;
-	ret = register_pm_notifier(&arche_pdata->pm_notifier);
-	if (ret) {
-		dev_err(dev, "failed to register pm notifier %d\n", ret);
-		goto err_depopulate;
-	}
-
-	/* Explicitly power off if requested */
-	if (!of_property_read_bool(pdev->dev.of_node, "arche,init-off")) {
-		mutex_lock(&arche_pdata->platform_state_mutex);
-		ret = arche_platform_coldboot_seq(arche_pdata);
-		if (ret) {
-			mutex_unlock(&arche_pdata->platform_state_mutex);
-			dev_err(dev, "Failed to cold boot svc %d\n", ret);
-			goto err_unregister_pm_notifier;
-		}
-		arche_platform_wd_irq_en(arche_pdata);
-		mutex_unlock(&arche_pdata->platform_state_mutex);
-	}
-
-	dev_info(dev, "Device registered successfully\n");
-	return 0;
-
-err_unregister_pm_notifier:
-	unregister_pm_notifier(&arche_pdata->pm_notifier);
-err_depopulate:
-	of_platform_depopulate(dev);
-err_device_remove:
-	device_remove_file(&pdev->dev, &dev_attr_state);
-	return ret;
-}
-
-static void arche_platform_remove(struct platform_device *pdev)
-{
-	struct arche_platform_drvdata *arche_pdata = platform_get_drvdata(pdev);
-
-	unregister_pm_notifier(&arche_pdata->pm_notifier);
-	device_remove_file(&pdev->dev, &dev_attr_state);
-	of_platform_depopulate(&pdev->dev);
-	arche_platform_poweroff_seq(arche_pdata);
-
-	if (usb3613_hub_mode_ctrl(false))
-		dev_warn(arche_pdata->dev, "failed to control hub device\n");
-}
-
-static __maybe_unused int arche_platform_suspend(struct device *dev)
-{
-	/*
-	 * If timing profile permits, we may shutdown bridge
-	 * completely
-	 *
-	 * TODO: define shutdown sequence
-	 *
-	 * Also, need to make sure we meet precondition for unipro suspend
-	 * Precondition: Definition ???
-	 */
-	return 0;
-}
-
-static __maybe_unused int arche_platform_resume(struct device *dev)
-{
-	/*
-	 * At least for ES2 we have to meet the delay requirement between
-	 * unipro switch and AP bridge init, depending on whether bridge is in
-	 * OFF state or standby state.
-	 *
-	 * Based on whether bridge is in standby or OFF state we may have to
-	 * assert multiple signals. Please refer to WDM spec, for more info.
-	 *
-	 */
-	return 0;
-}
-
-static void arche_platform_shutdown(struct platform_device *pdev)
-{
-	struct arche_platform_drvdata *arche_pdata = platform_get_drvdata(pdev);
-
-	arche_platform_poweroff_seq(arche_pdata);
-
-	usb3613_hub_mode_ctrl(false);
-}
-
-static SIMPLE_DEV_PM_OPS(arche_platform_pm_ops,
-			arche_platform_suspend,
-			arche_platform_resume);
-
-static const struct of_device_id arche_platform_of_match[] = {
-	/* Use PID/VID of SVC device */
-	{ .compatible = "google,arche-platform", },
-	{ },
-};
-MODULE_DEVICE_TABLE(of, arche_platform_of_match);
-
-static struct platform_driver arche_platform_device_driver = {
-	.probe		= arche_platform_probe,
-	.remove		= arche_platform_remove,
-	.shutdown	= arche_platform_shutdown,
-	.driver		= {
-		.name	= "arche-platform-ctrl",
-		.pm	= &arche_platform_pm_ops,
-		.of_match_table = arche_platform_of_match,
-	}
-};
-
-static int __init arche_init(void)
-{
-	int retval;
-
-	retval = platform_driver_register(&arche_platform_device_driver);
-	if (retval)
-		return retval;
-
-	retval = arche_apb_init();
-	if (retval)
-		platform_driver_unregister(&arche_platform_device_driver);
-
-	return retval;
-}
-module_init(arche_init);
-
-static void __exit arche_exit(void)
-{
-	arche_apb_exit();
-	platform_driver_unregister(&arche_platform_device_driver);
-}
-module_exit(arche_exit);
-
-MODULE_LICENSE("GPL v2");
-MODULE_AUTHOR("Vaibhav Hiremath <vaibhav.hiremath@linaro.org>");
-MODULE_DESCRIPTION("Arche Platform Driver");
diff --git a/drivers/staging/greybus/arche_platform.h b/drivers/staging/greybus/arche_platform.h
deleted file mode 100644
index 9d997f2d6517..000000000000
--- a/drivers/staging/greybus/arche_platform.h
+++ /dev/null
@@ -1,28 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Arche Platform driver to enable Unipro link.
- *
- * Copyright 2015-2016 Google Inc.
- * Copyright 2015-2016 Linaro Ltd.
- */
-
-#ifndef __ARCHE_PLATFORM_H
-#define __ARCHE_PLATFORM_H
-
-enum arche_platform_state {
-	ARCHE_PLATFORM_STATE_OFF,
-	ARCHE_PLATFORM_STATE_ACTIVE,
-	ARCHE_PLATFORM_STATE_STANDBY,
-	ARCHE_PLATFORM_STATE_FW_FLASHING,
-};
-
-int __init arche_apb_init(void);
-void __exit arche_apb_exit(void);
-
-/* Operational states for the APB device */
-int apb_ctrl_coldboot(struct device *dev);
-int apb_ctrl_fw_flashing(struct device *dev);
-int apb_ctrl_standby_boot(struct device *dev);
-void apb_ctrl_poweroff(struct device *dev);
-
-#endif	/* __ARCHE_PLATFORM_H */
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
