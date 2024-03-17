Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EA77487DFB0
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 20:38:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0705643D46
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 19:38:14 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	by lists.linaro.org (Postfix) with ESMTPS id 838283F387
	for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 19:38:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Ne+b7DAT;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.216.50 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-29dfad24f36so1187540a91.0
        for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 12:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704291; x=1711309091; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XAFdZ643wkelI8hZPnf28UKtzzWxeqJSxohoYBvzlpg=;
        b=Ne+b7DATevCsw9W6Yvje/gFItJcvussbB28fd+iEhSTvMKuJL/O9Wmuz+Xd5bStT73
         pa+dw//NnZVd27FZqJL8JhA+8NUnAO85emtal6Ugp6mtsFVyU2g0jZdkwqAkozusK9L6
         z72hdG1Ddfk2R7pCudvw2SYfE9bTkBdzvH7c7cXOPm6Aj8GRI9z8jINQ4q2Acrb+vdmH
         ga4kr2vCuLMS5rn/Kz3i1KOqBnm4cg4IUrJU1ZT1x11sCH5hmDkbpjv/L6NeRBGh7kud
         /7NGzwN+X5k2owe0QH3KAkIv6Mn2b32z/f/04HJ94vvlTwhzuRKzley+iWf1df0enXi4
         J21g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704291; x=1711309091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XAFdZ643wkelI8hZPnf28UKtzzWxeqJSxohoYBvzlpg=;
        b=RYfbrrmt45IfEae5OGuT1m8U/kQJkBylLbOFjCEfMrNAUaBw1OSZeWUzaud53tTyCM
         /rmMDJ4nP0+m4cnwAcb/CPCTRRU9LVRVuLImzkSHGHRIxdbGDnUmWjyjDsHEhr6fGLkF
         2TNHz3XAc2rGyYtQhjmraJwuf9VLUbzOyNopRi5j5FCduMaZU4b/RK8lGj1Hd5uGe3n2
         v146WY+8Z7f7pYQk/+Cq8fe5UrGDBlN0aFSDa65JGHTeUMn6K0Ql0xDGqZhaAzsjeQ0b
         mxcr2z9IPCxkx9YNFLD0tTOnFCJVZ/H3FlmuFVCog8pK383FjXq9V5EcsPVr3OCrDFQl
         1zxA==
X-Forwarded-Encrypted: i=1; AJvYcCWiRnHtlCl+xKijBs2qw2sLamMTWQlS7Y+SZla6m975+cuuNa3pvolgl32G5Wz8qtGEXW83oRGZfq3PLfcw4asULVvFiU7p2kfivOP8
X-Gm-Message-State: AOJu0YyxOimOMDUT7endvNpbYqnmrZgvxQF24diSwDMt6pIcys+hF7D+
	8ousf3ZB+K2uqA1P+vhK4+YDvDA6ZgL8Hzx1hNcXX9j86MswuN3+
X-Google-Smtp-Source: AGHT+IGIMfDbF9VDPxpzPhgHWGmVrvu7kV7iVi2cPqw22K30WUzkmMxnJYuAGqmR7ul921En552HNg==
X-Received: by 2002:a17:90a:88d:b0:29d:e70f:7240 with SMTP id v13-20020a17090a088d00b0029de70f7240mr6358733pjc.11.1710704290554;
        Sun, 17 Mar 2024 12:38:10 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id st6-20020a17090b1fc600b0029bbdc920besm6125995pjb.44.2024.03.17.12.38.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:38:10 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org (open list)
Date: Mon, 18 Mar 2024 01:07:09 +0530
Message-ID: <20240317193714.403132-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240317193714.403132-1-ayushdevel1325@gmail.com>
References: <20240317193714.403132-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 838283F387
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.50:from];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_RCPT(0.00)[dt];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: LF3PO2WCY2DICLAXCD5VTJ2HMUFH374X
X-Message-ID-Hash: LF3PO2WCY2DICLAXCD5VTJ2HMUFH374X
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, Vaishnav M A <vaishnav@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 1/5] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LF3PO2WCY2DICLAXCD5VTJ2HMUFH374X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add DT bindings for mikroBUS interface. MikroBUS is an open standard
developed by MikroElektronika for connecting add-on boards to
microcontrollers or microprocessors.

mikroBUS is a connector and does not have a controller. Instead the
software is responsible for identification of board and setting up /
registering uart, spi, i2c, pwm and other buses. Thus it needs a way to
get uart, spi, i2c, pwm and gpio controllers / adapters.

A mikroBUS addon board is free to leave some of the pins unused which
are marked as NC or Not Connected.

Some of the pins might need to be configured as GPIOs deviating from their
reserved purposes Eg: SHT15 Click where the SCL and SDA Pins need to be
configured as GPIOs for the driver (drivers/hwmon/sht15.c) to work.

For some add-on boards the driver may not take care of some additional
signals like reset/wake-up/other. Eg: ENC28J60 click where the reset line
(RST pin on the mikrobus port) needs to be pulled high.

Here's the list of pins in mikroBUS connector:
Analog - AN
Reset - RST
SPI Chip Select - CS
SPI Clock - SCK
SPI Master Input Slave Output - MISO
SPI Master Output Slave Input - MOSI
VCC-3.3V power - +3.3V
Reference Ground - GND
PWM - PWM output
INT - Hardware Interrupt
RX - UART Receive
TX - UART Transmit
SCL - I2C Clock
SDA - I2C Data
+5V - VCC-5V power
GND - Reference Ground

Additionally, some new mikroBUS boards contain 1-wire EEPROM that contains
a manifest to describe the addon board to provide plug and play
capabilities.

Link: https://www.mikroe.com/mikrobus
Link:
https://download.mikroe.com/documents/standards/mikrobus/mikrobus-standard-specification-v200.pdf
mikroBUS specification
Link: https://www.mikroe.com/sht1x-click SHT15 Click
Link: https://www.mikroe.com/eth-click ENC28J60 Click
Link: https://www.mikroe.com/clickid ClickID

Co-developed-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Vaishnav M A <vaishnav@beagleboard.org>
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../connector/mikrobus-connector.yaml         | 113 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 119 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/connector/mikrobus-connector.yaml

diff --git a/Documentation/devicetree/bindings/connector/mikrobus-connector.yaml b/Documentation/devicetree/bindings/connector/mikrobus-connector.yaml
new file mode 100644
index 000000000000..ee3736add41c
--- /dev/null
+++ b/Documentation/devicetree/bindings/connector/mikrobus-connector.yaml
@@ -0,0 +1,113 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/connector/mikrobus-connector.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: mikroBUS add-on board socket
+
+maintainers:
+  - Ayush Singh <ayushdevel1325@gmail.com>
+
+properties:
+  compatible:
+    const: mikrobus-connector
+
+  pinctrl-0: true
+  pinctrl-1: true
+  pinctrl-2: true
+  pinctrl-3: true
+  pinctrl-4: true
+  pinctrl-5: true
+  pinctrl-6: true
+  pinctrl-7: true
+  pinctrl-8: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: pwm_default
+      - const: pwm_gpio
+      - const: uart_default
+      - const: uart_gpio
+      - const: i2c_default
+      - const: i2c_gpio
+      - const: spi_default
+      - const: spi_gpio
+
+  mikrobus-gpios:
+    minItems: 11
+    maxItems: 12
+
+  i2c-adapter:
+    description: i2c adapter attached to the mikrobus socket.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  spi-controller:
+    description: spi bus number of the spi-master attached to the mikrobus socket.
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  uart:
+    description: uart port attached to the mikrobus socket
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+  pwms:
+    description: the pwm-controller corresponding to the mikroBUS PWM pin.
+    maxItems: 1
+
+  spi-cs:
+    description: spi chip-select numbers corresponding to the chip-selects on the mikrobus socket.
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    items:
+      - description: chip select corresponding to CS pin
+      - description: chip select corresponding to RST pin
+
+required:
+  - compatible
+  - pinctrl-0
+  - pinctrl-1
+  - pinctrl-2
+  - pinctrl-3
+  - pinctrl-4
+  - pinctrl-5
+  - pinctrl-6
+  - pinctrl-7
+  - pinctrl-8
+  - i2c-adapter
+  - spi-controller
+  - spi-cs
+  - uart
+  - pwms
+  - mikrobus-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    mikrobus {
+      compatible = "mikrobus-connector";
+      pinctrl-names = "default", "pwm_default", "pwm_gpio","uart_default", "uart_gpio", "i2c_default",
+                      "i2c_gpio", "spi_default", "spi_gpio";
+      pinctrl-0 = <&P2_03_gpio_input_pin &P1_04_gpio_pin &P1_02_gpio_pin>;
+      pinctrl-1 = <&P2_01_pwm_pin>;
+      pinctrl-2 = <&P2_01_gpio_pin>;
+      pinctrl-3 = <&P2_05_uart_pin &P2_07_uart_pin>;
+      pinctrl-4 = <&P2_05_gpio_pin &P2_07_gpio_pin>;
+      pinctrl-5 = <&P2_09_i2c_pin &P2_11_i2c_pin>;
+      pinctrl-6 = <&P2_09_gpio_pin &P2_11_gpio_pin>;
+      pinctrl-7 = <&P1_12_spi_pin &P1_10_spi_pin &P1_08_spi_sclk_pin &P1_06_spi_cs_pin>;
+      pinctrl-8 = <&P1_12_gpio_pin &P1_10_gpio_pin &P1_08_gpio_pin &P1_06_gpio_pin>;
+      pwms = <&ehrpwm1 0 500000 0>;
+      i2c-adapter = <&i2c1>;
+      spi-controller = <&spi1>;
+      spi-cs = <0 1>;
+      uart = <&uart1>;
+      mikrobus-gpios = <&gpio1 18 GPIO_ACTIVE_HIGH>, <&gpio0 23 GPIO_ACTIVE_HIGH>,
+                       <&gpio0 30 GPIO_ACTIVE_HIGH>, <&gpio0 31 GPIO_ACTIVE_HIGH>,
+                       <&gpio0 15 GPIO_ACTIVE_HIGH>, <&gpio0 14 GPIO_ACTIVE_HIGH>,
+                       <&gpio0 4 GPIO_ACTIVE_HIGH>, <&gpio0 3 GPIO_ACTIVE_HIGH>,
+                       <&gpio0 2 GPIO_ACTIVE_HIGH>, <&gpio0 5 GPIO_ACTIVE_HIGH>,
+                       <&gpio2 25 GPIO_ACTIVE_HIGH>, <&gpio2 3 GPIO_ACTIVE_HIGH>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 375d34363777..69418a058c6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14767,6 +14767,12 @@ M:	Oliver Neukum <oliver@neukum.org>
 S:	Maintained
 F:	drivers/usb/image/microtek.*
 
+MIKROBUS
+M:	Ayush Singh <ayushdevel1325@gmail.com>
+M:	Vaishnav M A <vaishnav@beagleboard.org>
+S:	Maintained
+F:	Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
+
 MIKROTIK CRS3XX 98DX3236 BOARD SUPPORT
 M:	Luka Kovacic <luka.kovacic@sartura.hr>
 M:	Luka Perkov <luka.perkov@sartura.hr>
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
