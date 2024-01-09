Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F047A8282B4
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Jan 2024 10:08:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D7C9C40D2C
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Jan 2024 09:08:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 001893F0D1
	for <greybus-dev@lists.linaro.org>; Tue,  9 Jan 2024 09:08:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=ujzq1UR2;
	spf=pass (lists.linaro.org: domain of arnd@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=arnd@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 92925612A5;
	Tue,  9 Jan 2024 09:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8313C433C7;
	Tue,  9 Jan 2024 09:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704791291;
	bh=MaD4HDa30ZbvY4qSPCXvNuJfHRvaMwuyuAlT9sVZdMg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ujzq1UR20rNnhOSrio+PVvos+3wzg6fgwg8V0bexCiASt61RDSFfy7H1kaAXbJrfp
	 iIzgfHzJWWjHQpIhOM0GYHiyx3Rb8EejR9O0drFgm+XB5EvKHBWdAwSFuWwJEbYEom
	 fOGKt85EO4dOhqI3gF9KxIyVRE7zoQgqtHrOLfI9Lo1L7w/qtGPqGCz0YSejh1pcXL
	 sF0HFJOu9pMd+0ZAXza86XpnFeff3NkbWfmN+vYvuBLsljGkq55eNkVM3meC09LkpA
	 v4FmCmgqA3tMOTXkM1vl8THkxZoYdrLryh9lNN2KFHmEIGVomADetR3yTQPyY6MooR
	 8CrPJ+piHViqw==
From: Arnd Bergmann <arnd@kernel.org>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Date: Tue,  9 Jan 2024 10:06:40 +0100
Message-Id: <20240109090715.982332-2-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240109090715.982332-1-arnd@kernel.org>
References: <20240109090715.982332-1-arnd@kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lunn.ch,arndb.de,gmail.com,redhat.com,traphandler.com,vger.kernel.org,kernel.org,linuxfoundation.org,linux.intel.com,kemnade.info,lists.linaro.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 001893F0D1
X-Spamd-Bar: --
Message-ID-Hash: ER3O4OFNRBWWY2MFDEXLO6OOHHZ7EALE
X-Message-ID-Hash: ER3O4OFNRBWWY2MFDEXLO6OOHHZ7EALE
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Andrew Lunn <andrew@lunn.ch>, Arnd Bergmann <arnd@arndb.de>, Heiner Kallweit <hkallweit1@gmail.com>, Hans de Goede <hdegoede@redhat.com>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andreas Kemnade <andreas@kemnade.info>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] leds: make flash and multicolor dependencies unconditional
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ER3O4OFNRBWWY2MFDEXLO6OOHHZ7EALE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnd Bergmann <arnd@arndb.de>

Along the same lines as making devm_led_classdev_register() declared
extern unconditional, do the same thing for the two sub-classes
that have similar stubs.

The users of these interfaces go to great lengths to allow building
with both the generic leds API and the extended version, but realistically
there is not much use in this, so just simplify it to always rely
on it and remove the confusing fallback logic.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/leds/Kconfig                 |  4 ++--
 drivers/leds/flash/Kconfig           |  4 ++--
 drivers/staging/greybus/Kconfig      |  2 +-
 drivers/staging/greybus/light.c      | 21 --------------------
 include/linux/led-class-flash.h      | 24 -----------------------
 include/linux/led-class-multicolor.h | 29 ----------------------------
 6 files changed, 5 insertions(+), 79 deletions(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d721b254e1e4..9613a45a35bd 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -395,7 +395,7 @@ config LEDS_LP3952
 config LEDS_LP50XX
 	tristate "LED Support for TI LP5036/30/24/18/12/09 LED driver chip"
 	depends on LEDS_CLASS && REGMAP_I2C
-	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
+	depends on LEDS_CLASS_MULTICOLOR
 	help
 	  If you say yes here you get support for the Texas Instruments
 	  LP5036, LP5030, LP5024, LP5018, LP5012 and LP5009 LED driver.
@@ -406,7 +406,7 @@ config LEDS_LP50XX
 config LEDS_LP55XX_COMMON
 	tristate "Common Driver for TI/National LP5521/5523/55231/5562/8501"
 	depends on LEDS_CLASS
-	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
+	depends on LEDS_CLASS_MULTICOLOR
 	depends on OF
 	depends on I2C
 	select FW_LOADER
diff --git a/drivers/leds/flash/Kconfig b/drivers/leds/flash/Kconfig
index 4e08dbc05709..b95f90cd5749 100644
--- a/drivers/leds/flash/Kconfig
+++ b/drivers/leds/flash/Kconfig
@@ -51,8 +51,8 @@ config LEDS_MAX77693
 config LEDS_MT6360
 	tristate "LED Support for Mediatek MT6360 PMIC"
 	depends on LEDS_CLASS && OF
-	depends on LEDS_CLASS_FLASH || !LEDS_CLASS_FLASH
-	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
+	depends on LEDS_CLASS_FLASH
+	depends on LEDS_CLASS_MULTICOLOR
 	depends on V4L2_FLASH_LED_CLASS || !V4L2_FLASH_LED_CLASS
 	depends on MFD_MT6360
 	help
diff --git a/drivers/staging/greybus/Kconfig b/drivers/staging/greybus/Kconfig
index 927cfa4bc989..1e745a8d439c 100644
--- a/drivers/staging/greybus/Kconfig
+++ b/drivers/staging/greybus/Kconfig
@@ -64,7 +64,7 @@ config GREYBUS_HID
 
 config GREYBUS_LIGHT
 	tristate "Greybus LED Class driver"
-	depends on LEDS_CLASS
+	depends on LEDS_CLASS_FLASH
 	help
 	  Select this option if you have a device that follows the
 	  Greybus LED Class specification.
diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index 87d36948c610..d62f97249aca 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -29,13 +29,9 @@ struct gb_channel {
 	struct attribute_group		*attr_group;
 	const struct attribute_group	**attr_groups;
 	struct led_classdev		*led;
-#if IS_REACHABLE(CONFIG_LEDS_CLASS_FLASH)
 	struct led_classdev_flash	fled;
 	struct led_flash_setting	intensity_uA;
 	struct led_flash_setting	timeout_us;
-#else
-	struct led_classdev		cled;
-#endif
 	struct gb_light			*light;
 	bool				is_registered;
 	bool				releasing;
@@ -84,7 +80,6 @@ static bool is_channel_flash(struct gb_channel *channel)
 				   | GB_CHANNEL_MODE_INDICATOR));
 }
 
-#if IS_REACHABLE(CONFIG_LEDS_CLASS_FLASH)
 static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
 {
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(cdev);
@@ -153,22 +148,6 @@ static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
 
 	return __gb_lights_flash_intensity_set(channel, intensity);
 }
-#else
-static struct gb_channel *get_channel_from_cdev(struct led_classdev *cdev)
-{
-	return container_of(cdev, struct gb_channel, cled);
-}
-
-static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
-{
-	return &channel->cled;
-}
-
-static int __gb_lights_flash_brightness_set(struct gb_channel *channel)
-{
-	return 0;
-}
-#endif
 
 static int gb_lights_color_set(struct gb_channel *channel, u32 color);
 static int gb_lights_fade_set(struct gb_channel *channel);
diff --git a/include/linux/led-class-flash.h b/include/linux/led-class-flash.h
index 612b4cab3819..36df927ec4b7 100644
--- a/include/linux/led-class-flash.h
+++ b/include/linux/led-class-flash.h
@@ -85,7 +85,6 @@ static inline struct led_classdev_flash *lcdev_to_flcdev(
 	return container_of(lcdev, struct led_classdev_flash, led_cdev);
 }
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS_FLASH)
 /**
  * led_classdev_flash_register_ext - register a new object of LED class with
  *				     init data and with support for flash LEDs
@@ -116,29 +115,6 @@ int devm_led_classdev_flash_register_ext(struct device *parent,
 void devm_led_classdev_flash_unregister(struct device *parent,
 					struct led_classdev_flash *fled_cdev);
 
-#else
-
-static inline int led_classdev_flash_register_ext(struct device *parent,
-				    struct led_classdev_flash *fled_cdev,
-				    struct led_init_data *init_data)
-{
-	return 0;
-}
-
-static inline void led_classdev_flash_unregister(struct led_classdev_flash *fled_cdev) {};
-static inline int devm_led_classdev_flash_register_ext(struct device *parent,
-				     struct led_classdev_flash *fled_cdev,
-				     struct led_init_data *init_data)
-{
-	return 0;
-}
-
-static inline void devm_led_classdev_flash_unregister(struct device *parent,
-					struct led_classdev_flash *fled_cdev)
-{};
-
-#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_FLASH) */
-
 static inline int led_classdev_flash_register(struct device *parent,
 					   struct led_classdev_flash *fled_cdev)
 {
diff --git a/include/linux/led-class-multicolor.h b/include/linux/led-class-multicolor.h
index 210d57bcd767..db9f34c6736e 100644
--- a/include/linux/led-class-multicolor.h
+++ b/include/linux/led-class-multicolor.h
@@ -30,7 +30,6 @@ static inline struct led_classdev_mc *lcdev_to_mccdev(
 	return container_of(led_cdev, struct led_classdev_mc, led_cdev);
 }
 
-#if IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR)
 /**
  * led_classdev_multicolor_register_ext - register a new object of led_classdev
  *				      class with support for multicolor LEDs
@@ -64,34 +63,6 @@ int devm_led_classdev_multicolor_register_ext(struct device *parent,
 
 void devm_led_classdev_multicolor_unregister(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev);
-#else
-
-static inline int led_classdev_multicolor_register_ext(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev,
-					    struct led_init_data *init_data)
-{
-	return 0;
-}
-
-static inline void led_classdev_multicolor_unregister(struct led_classdev_mc *mcled_cdev) {};
-static inline int led_mc_calc_color_components(struct led_classdev_mc *mcled_cdev,
-					       enum led_brightness brightness)
-{
-	return 0;
-}
-
-static inline int devm_led_classdev_multicolor_register_ext(struct device *parent,
-					  struct led_classdev_mc *mcled_cdev,
-					  struct led_init_data *init_data)
-{
-	return 0;
-}
-
-static inline void devm_led_classdev_multicolor_unregister(struct device *parent,
-					    struct led_classdev_mc *mcled_cdev)
-{};
-
-#endif  /* IS_ENABLED(CONFIG_LEDS_CLASS_MULTICOLOR) */
 
 static inline int led_classdev_multicolor_register(struct device *parent,
 					    struct led_classdev_mc *mcled_cdev)
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
