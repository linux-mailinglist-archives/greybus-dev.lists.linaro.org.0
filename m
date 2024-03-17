Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4587DFBB
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 20:38:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 98E5143D46
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 19:38:46 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	by lists.linaro.org (Postfix) with ESMTPS id 64F3F3F449
	for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 19:38:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DJI+PBWL;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.167.170 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-3c35c4d8878so1642214b6e.1
        for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 12:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704324; x=1711309124; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OT6hmngmg7LhsdhWQVbZrDuHFIRfbTgzLQihr9TF8as=;
        b=DJI+PBWLlBJh3uUhUrjWyYs/vUwijzSe5F1FMpsADMRzZoUgZUWYGktRLrrODuy7AF
         wWwXH86vnF8X9lF2qk4kl69vNDRXeYtKQVLfCp5b0rb+TmiolceSPyr0Usp64jhtivcg
         DKa0Gef5xOt5Ae178Go5/9/nX0uVpXPlDJ+aTxym50jSDLVqu/18zKtuEFE8drYMdWXE
         W5x55xMjcPZi+nkvS3BqbJjs+QvtQRoT4zJKgQPudxNzsJJjwVo1iBr95YkZbzhwIEju
         5h8totpI/+jEGCi1trk8t8oCcdDGNLCXpsBQweopCVocmrvdD/xv1ItTpe2/n56nnp5H
         8qlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704324; x=1711309124;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OT6hmngmg7LhsdhWQVbZrDuHFIRfbTgzLQihr9TF8as=;
        b=pwFOL0OISRUfcxHqfagBNgNVLZIgKqyTfPTzzl+Q+d4Q07SkW72ZPVn9GB3lHxD/ml
         DZqBm7bTaxnWQrncKZb8srKecwX/0ITqXzuSYx7vhYTo4yWhUPFmUWPqM2uOpUHnE2vb
         7j4hmXAv4d4MkTyMG70Io3hFBWhMRz0jWRpMFszwLq0i4JQ0dQ7W9EJ7lGOBq+apNlIu
         InEvSY9/LoPatgcXcV0xPhl/rJQVOfSi/n2Oy4JoWS68BVV40lQdRqZ7Om5hoBnpK7Lc
         BmuG5UcblSfcHId0DSJnZRGFCl6qThbLrHYdVpWSn0qgAbRYp2uyfUdFr2vy2U/ApNQy
         RWqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs4fL1UBOKlaAkO6zHRC2Fs8wag5Ek7K9xNYuGVnHLxIdPD6mVTjl2OrtxUhm2Ox5SzTd52v2JkmLfD0+SVbHczBfvIP6gfr/ac0Ux
X-Gm-Message-State: AOJu0YweO9rAmdwVUEMHC2Y7ql5ANJG4eXawREF18a2pD5l5592BujTP
	/zR688nLfoLC0UzpedC1PtZQqUgf1c7gjHvPZgHi3xqefUyQrjh1
X-Google-Smtp-Source: AGHT+IFUpPTaU6PvOX+AKPaPFj4Fu6IdLBC3LDsxuIWxs0yZJKnWwhoTrKzOxe3YGH55CzjEL+bang==
X-Received: by 2002:a05:6358:7e92:b0:17c:1e63:d02e with SMTP id o18-20020a0563587e9200b0017c1e63d02emr13107142rwn.2.1710704323604;
        Sun, 17 Mar 2024 12:38:43 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id st6-20020a17090b1fc600b0029bbdc920besm6125995pjb.44.2024.03.17.12.38.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:38:43 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org (open list)
Date: Mon, 18 Mar 2024 01:07:13 +0530
Message-ID: <20240317193714.403132-6-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240317193714.403132-1-ayushdevel1325@gmail.com>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 64F3F3F449
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.170:from];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: RJWA5P2JFPPDIF7AOEK77JETJ3DIK6LN
X-Message-ID-Hash: RJWA5P2JFPPDIF7AOEK77JETJ3DIK6LN
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 5/5] dts: ti: k3-am625-beagleplay: Add mikroBUS
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RJWA5P2JFPPDIF7AOEK77JETJ3DIK6LN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

DONOTMERGE

this patch depends on patch 1

Add mikroBUS connector support for Beagleplay.

Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts | 80 +++++++++++++++++--
 1 file changed, 72 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index a34e0df2ab86..e1dce1b80153 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -29,6 +29,7 @@ aliases {
 		i2c3 = &main_i2c3;
 		i2c4 = &wkup_i2c0;
 		i2c5 = &mcu_i2c0;
+		mikrobus0 = &mikrobus0;
 		mmc0 = &sdhci0;
 		mmc1 = &sdhci1;
 		mmc2 = &sdhci2;
@@ -230,6 +231,38 @@ simple-audio-card,codec {
 		};
 	};
 
+	mikrobus0: mikrobus-connector {
+		compatible = "mikrobus-connector";
+		pinctrl-names = "default", "pwm_default", "pwm_gpio",
+				"uart_default", "uart_gpio", "i2c_default",
+				"i2c_gpio", "spi_default", "spi_gpio";
+		pinctrl-0 = <&mikrobus_gpio_pins_default>;
+		pinctrl-1 = <&mikrobus_pwm_pins_default>;
+		pinctrl-2 = <&mikrobus_pwm_pins_gpio>;
+		pinctrl-3 = <&mikrobus_uart_pins_default>;
+		pinctrl-4 = <&mikrobus_uart_pins_gpio>;
+		pinctrl-5 = <&mikrobus_i2c_pins_default>;
+		pinctrl-6 = <&mikrobus_i2c_pins_gpio>;
+		pinctrl-7 = <&mikrobus_spi_pins_default>;
+		pinctrl-8 = <&mikrobus_spi_pins_gpio>;
+		pwms = <&ecap2 0 500000 0>;
+		i2c-adapter = <&main_i2c3>;
+		spi-controller = <&main_spi2>;
+		uart = <&main_uart5>;
+		spi-cs = <0 1>;
+		mikrobus-gpios = <&main_gpio1 11 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 9 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 24 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 25 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 22 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 23 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 7 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 8 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 14 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 13 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 12 GPIO_ACTIVE_HIGH>,
+				 <&main_gpio1 10 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &main_pmx0 {
@@ -389,6 +422,18 @@ AM62X_IOPAD(0x01f0, PIN_OUTPUT, 5) /* (A18) EXT_REFCLK1.CLKOUT0 */
 		>;
 	};
 
+	mikrobus_pwm_pins_default: mikrobus-pwm-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01a4, PIN_INPUT, 2) /* (B20) MCASP0_ACLKX.ECAP2_IN_APWM_OUT */
+		>;
+	};
+
+	mikrobus_pwm_pins_gpio: mikrobus-pwm-gpio-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01a4, PIN_INPUT, 7) /* (B20) MCASP0_ACLKX.GPIO1_11 */
+		>;
+	};
+
 	mikrobus_i2c_pins_default: mikrobus-i2c-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x01d0, PIN_INPUT_PULLUP, 2) /* (A15) UART0_CTSn.I2C3_SCL */
@@ -396,6 +441,13 @@ AM62X_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (B15) UART0_RTSn.I2C3_SDA */
 		>;
 	};
 
+	mikrobus_i2c_pins_gpio: mikrobus-i2c-gpio-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01d0, PIN_INPUT, 7) /* (A15) UART0_CTSn.GPIO1_22 */
+			AM62X_IOPAD(0x01d4, PIN_INPUT, 7) /* (B15) UART0_RTSn.GPIO1_23 */
+		>;
+	};
+
 	mikrobus_uart_pins_default: mikrobus-uart-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x01d8, PIN_INPUT, 1) /* (C15) MCAN0_TX.UART5_RXD */
@@ -403,6 +455,13 @@ AM62X_IOPAD(0x01dc, PIN_OUTPUT, 1) /* (E15) MCAN0_RX.UART5_TXD */
 		>;
 	};
 
+	mikrobus_uart_pins_gpio: mikrobus-uart-gpio-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x01d8, PIN_INPUT, 7) /* (C15) MCAN0_TX.GPIO1_24 */
+			AM62X_IOPAD(0x01dc, PIN_INPUT, 7) /* (E15) MCAN0_RX.GPIO1_25 */
+		>;
+	};
+
 	mikrobus_spi_pins_default: mikrobus-spi-default-pins {
 		pinctrl-single,pins = <
 			AM62X_IOPAD(0x01b0, PIN_INPUT, 1) /* (A20) MCASP0_ACLKR.SPI2_CLK */
@@ -412,6 +471,15 @@ AM62X_IOPAD(0x0198, PIN_INPUT, 1) /* (A19) MCASP0_AXR2.SPI2_D1 */
 		>;
 	};
 
+	mikrobus_spi_pins_gpio: mikrobus-spi-gpio-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x0194, PIN_INPUT, 7) /* (B19) MCASP0_AXR3.GPIO1_7 */
+			AM62X_IOPAD(0x0198, PIN_INPUT, 7) /* (A19) MCASP0_AXR2.GPIO1_8 */
+			AM62X_IOPAD(0x01ac, PIN_INPUT, 7) /* (E19) MCASP0_AFSR.GPIO1_13 */
+			AM62X_IOPAD(0x01b0, PIN_INPUT, 7) /* (A20) MCASP0_ACLKR.GPIO1_14 */
+		>;
+	};
+
 	mikrobus_gpio_pins_default: mikrobus-gpio-default-pins {
 		bootph-all;
 		pinctrl-single,pins = <
@@ -629,8 +697,6 @@ &main_gpio0 {
 
 &main_gpio1 {
 	bootph-all;
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_gpio_pins_default>;
 	gpio-line-names = "", "", "", "", "",			/* 0-4 */
 		"SPE_RSTN", "SPE_INTN", "MIKROBUS_GPIO1_7",	/* 5-7 */
 		"MIKROBUS_GPIO1_8", "MIKROBUS_GPIO1_9",		/* 8-9 */
@@ -803,15 +869,11 @@ it66121_out: endpoint {
 };
 
 &main_i2c3 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_i2c_pins_default>;
 	clock-frequency = <400000>;
 	status = "okay";
 };
 
 &main_spi2 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_spi_pins_default>;
 	status = "okay";
 };
 
@@ -875,8 +937,6 @@ &main_uart1 {
 };
 
 &main_uart5 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_uart_pins_default>;
 	status = "okay";
 };
 
@@ -926,3 +986,7 @@ &mcasp1 {
 	tx-num-evt = <32>;
 	rx-num-evt = <32>;
 };
+
+&ecap2 {
+	status = "okay";
+};
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
