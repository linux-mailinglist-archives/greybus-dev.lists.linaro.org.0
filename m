Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4258387D3FD
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:50:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 52B26451EF
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:50:42 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	by lists.linaro.org (Postfix) with ESMTPS id 727D04520F
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:50:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=UN906nif;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.182 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-5d3912c9a83so1519797a12.3
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528636; x=1711133436; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kCkB7IphGBPGl1w/S0psqC8P5Um5bt65HZvq4RRR00Y=;
        b=UN906nif8bEMKWWjnTpDW73sCvJXRHNANh2dZWPbxVIUS9pMQlYVGGEsUaQzBqySXi
         f0Rhdu992mCFQ+AWrnbkMlodcSY/cIGplLrgqDayg8WNzi0nmk+p9bNPrSSRvn7eFBOg
         Bg+BGdOsd3UQi48Pc2fR0rSTV18HQVFSdVFMLpjm03tQ9KZVY9c4o39DkoCqMKnvZf0P
         YgE4VAdl5K3fqrCmqxa/RbKt3N0yPfQ2VS2dBi1oNefKex7lHX4RGrN9G1DDBIizOZuI
         lA+H2apXeuCw984pxvOWliqjpLfHpaNILM6gKpBOWD2bEV20Pq+P5oUuAELSicIl82Pf
         fXQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528636; x=1711133436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kCkB7IphGBPGl1w/S0psqC8P5Um5bt65HZvq4RRR00Y=;
        b=w4683Kg50demMwJDIGOlYiltUm/BxsoFoaJu9BXdK3U7T4GJmTNADlS6br8OWc2B4h
         s/lhLN0+93uO376C411gK/sW/b5JE9shgHEukItojima3nkh084Dx9f+eW8ms3pc36Fu
         I/U+7KUOEseKiczyDvabewlYpDcCRiXDsxGB9qJG73dTpHhtWn8snQYXttV2xTO3g8VG
         zoaZdWlgPZboGSqMBlNuPA6JPNG7Pcs1gRyxngH6WBcHYjqN+Rk/PlCE9Qr1HUWxE5q/
         DDDpZVRLYllC0oPN+sCEknl5ypdXN8R/tRhOeq8lM5EzipnylTCfDPAEcYMKf8Sz3Slc
         Tvfw==
X-Forwarded-Encrypted: i=1; AJvYcCUuX4ScAcuew6aF80pZdxYaPhHjuR9nBK1rqsRT0kLCrsST7zSCmEoC0/IHUC8W65Q1aFkudD2duF9dCmvQS2Glk/Kecbrf6EFscB0V
X-Gm-Message-State: AOJu0YwbgPAeld7gPdNCzK3yOdSyagoHgWvSQhD/kkoAH4nRFmM6Ipu7
	mbH7HV3z16YuM5SfEV0wqK1l2eSlylwE6aLSJYjpz78ijSs2M/cG
X-Google-Smtp-Source: AGHT+IFR9Rz9QYZm4Zrmj3QCj98EeqjLoIF4d8U8fx/cYS6Sv51WOwxOGnn90k4PIrka569oMmxqXw==
X-Received: by 2002:a05:6a20:2585:b0:1a3:504d:c064 with SMTP id k5-20020a056a20258500b001a3504dc064mr2238027pzd.55.1710528636650;
        Fri, 15 Mar 2024 11:50:36 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:50:36 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:19:06 +0530
Message-ID: <20240315184908.500352-9-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 727D04520F
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.182:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[mail-pg1-f182.google.com:rdns,mail-pg1-f182.google.com:helo];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[25];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: X53THPD3YD554ZHPFRCN4U6YVO4JHPA2
X-Message-ID-Hash: X53THPD3YD554ZHPFRCN4U6YVO4JHPA2
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 8/8] dts: ti: k3-am625-beagleplay: Add mikroBUS
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X53THPD3YD554ZHPFRCN4U6YVO4JHPA2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add mikroBUS connector support for Beagleplay.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts | 76 +++++++++++++++++--
 1 file changed, 68 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index a34e0df2ab86..886308f99d1a 100644
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
@@ -230,6 +231,33 @@ simple-audio-card,codec {
 		};
 	};
 
+	mikrobus0: linux-mikrobus {
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
+		i2c-adapter = <&main_i2c3>;
+		spi-controller = <&main_spi2>;
+		spi-cs = <0 1>;
+		uart = <&main_uart5>;
+		pwms = <&ecap2 0 500000 0>;
+		mikrobus-gpios =
+		<&main_gpio1 11 GPIO_ACTIVE_HIGH>, <&main_gpio1 9 GPIO_ACTIVE_HIGH>,
+		<&main_gpio1 24 GPIO_ACTIVE_HIGH>, <&main_gpio1 25 GPIO_ACTIVE_HIGH>,
+		<&main_gpio1 22 GPIO_ACTIVE_HIGH>, <&main_gpio1 23 GPIO_ACTIVE_HIGH>,
+		<&main_gpio1 7 GPIO_ACTIVE_HIGH>, <&main_gpio1 8 GPIO_ACTIVE_HIGH>,
+		<&main_gpio1 14 GPIO_ACTIVE_HIGH>, <&main_gpio1 13 GPIO_ACTIVE_HIGH>,
+		<&main_gpio1 12 GPIO_ACTIVE_HIGH>, <&main_gpio1 10 GPIO_ACTIVE_HIGH>;
+	};
 };
 
 &main_pmx0 {
@@ -389,6 +417,18 @@ AM62X_IOPAD(0x01f0, PIN_OUTPUT, 5) /* (A18) EXT_REFCLK1.CLKOUT0 */
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
@@ -396,6 +436,13 @@ AM62X_IOPAD(0x01d4, PIN_INPUT_PULLUP, 2) /* (B15) UART0_RTSn.I2C3_SDA */
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
@@ -403,6 +450,13 @@ AM62X_IOPAD(0x01dc, PIN_OUTPUT, 1) /* (E15) MCAN0_RX.UART5_TXD */
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
@@ -412,6 +466,15 @@ AM62X_IOPAD(0x0198, PIN_INPUT, 1) /* (A19) MCASP0_AXR2.SPI2_D1 */
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
@@ -629,8 +692,6 @@ &main_gpio0 {
 
 &main_gpio1 {
 	bootph-all;
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_gpio_pins_default>;
 	gpio-line-names = "", "", "", "", "",			/* 0-4 */
 		"SPE_RSTN", "SPE_INTN", "MIKROBUS_GPIO1_7",	/* 5-7 */
 		"MIKROBUS_GPIO1_8", "MIKROBUS_GPIO1_9",		/* 8-9 */
@@ -803,15 +864,11 @@ it66121_out: endpoint {
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
 
@@ -875,9 +932,8 @@ &main_uart1 {
 };
 
 &main_uart5 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&mikrobus_uart_pins_default>;
 	status = "okay";
+	force-empty-serdev-controller;
 };
 
 &main_uart6 {
@@ -926,3 +982,7 @@ &mcasp1 {
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
