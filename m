Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 669D587D3EA
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:49:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7970C451F0
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:49:45 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	by lists.linaro.org (Postfix) with ESMTPS id E09BD4516F
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:49:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=mUsYl3Y2;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6e6a9fafacdso2141726b3a.2
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528577; x=1711133377; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekuD/GR/ETK+oPLgoe3fsxeUCpWofF5b/ECIf7CXi9k=;
        b=mUsYl3Y2/g/nTUwFT6R2ubgU4VU8ktHmpftaMWJOiRUcox2z0gwgo8gNlx1+W1soUw
         9C+8BDzvuWDJLFArXzk0gnw54UmGV0o0xPBNVXCI0P5pWk8xyxYFUcC/Lv+NawDVmnXo
         FdsmCD7e3x+MfVRCDs/ZAaP/k5Y9mhaSQB0TIRsPKFlrBcXYWVKKCOSqW+I6B3f7brse
         k+ByI0BYxhk2pruEbhXUPoKBuPketjyFIs/3vIj8V5dDj0yza4SFMfcst2StvSdKuGit
         SyaM+LugFQgzT5wN4oiXsHch8rEfAdXj/CvU8W5XnqqUuoyp8qYw+1MOxU7E7ogtXpDE
         PDTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528577; x=1711133377;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ekuD/GR/ETK+oPLgoe3fsxeUCpWofF5b/ECIf7CXi9k=;
        b=mQ22RKQdoSROdQs1Lr/WJQaTXbhqD7I7v/2WCw52yR52aKvoMssOBcduoq8Bnt71Ws
         dcmTqsfP7Nu0lB42M17sy9g52JQ0g5z2xBtXAXvugOM72VKa7q3JRkbQXzCkXtDBxB6z
         tci9CkIXa5GZdnmQv8ODpu/w338llrnK9YiyUpyRI9Drqb15DhjU8VsT8nOf2FvO4o9C
         9487bBD9C2FvOtlBF+Pae2frdytz0LVxpzFVudOfuzYDJBpAtqbsTWGfbbkQXvPEURxH
         zg2lySV2o60pDkc/YAs9nUx6E0tM3yLy2Rs8+aVFhnpC10Ne6sMZYW6d7kW1Z5VAaIzQ
         F9uA==
X-Forwarded-Encrypted: i=1; AJvYcCUYLigqkooMZ+8oDLQ4CuLtLW8CRKU2K++G+RDPVH6d1/BtV/cCKXE5j0NQO78EhnnCbbWHHoqnDlQxAjbNaO/wkKy49YZzRaTDaolo
X-Gm-Message-State: AOJu0YyXDDNjlHQoR/Z+rzAsss9Sd4vBvCO9UVciM2c2Cf5qtfbY7Epg
	ztK59jowfk0jwFudZQNHNaTkxU9Rh8ahFzS1+lNl2s84wBdcq2lj
X-Google-Smtp-Source: AGHT+IHqxtAsUgvo4NnLO1aRy+KdmDGkLoMtm8Lp1OEsLkEDiyduFba/9liT290O5AFXVR+nRAdYxw==
X-Received: by 2002:a05:6a21:3990:b0:1a1:7711:cb4d with SMTP id ad16-20020a056a21399000b001a17711cb4dmr4993623pzc.36.1710528576938;
        Fri, 15 Mar 2024 11:49:36 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:49:36 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:18:59 +0530
Message-ID: <20240315184908.500352-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E09BD4516F
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.181:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: BPBUDEWNJ36OOLMOLGPAE4HLRJQZ5AJO
X-Message-ID-Hash: BPBUDEWNJ36OOLMOLGPAE4HLRJQZ5AJO
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/8] dt-bindings: misc: Add mikrobus-connector
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BPBUDEWNJ36OOLMOLGPAE4HLRJQZ5AJO/>
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

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../bindings/misc/mikrobus-connector.yaml     | 110 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 116 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/misc/mikrobus-connector.yaml

diff --git a/Documentation/devicetree/bindings/misc/mikrobus-connector.yaml b/Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
new file mode 100644
index 000000000000..6eace2c0dddc
--- /dev/null
+++ b/Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
@@ -0,0 +1,110 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/misc/mikrobus-connector.yaml#
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
+      mikrobus-0 {
+        compatible = "mikrobus-connector";
+        status = "okay";
+        pinctrl-names = "default", "pwm_default", "pwm_gpio","uart_default", "uart_gpio", "i2c_default",
+                        "i2c_gpio", "spi_default", "spi_gpio";
+        pinctrl-0 = <&P2_03_gpio_input_pin &P1_04_gpio_pin &P1_02_gpio_pin>;
+        pinctrl-1 = <&P2_01_pwm_pin>;
+        pinctrl-2 = <&P2_01_gpio_pin>;
+        pinctrl-3 = <&P2_05_uart_pin &P2_07_uart_pin>;
+        pinctrl-4 = <&P2_05_gpio_pin &P2_07_gpio_pin>;
+        pinctrl-5 = <&P2_09_i2c_pin &P2_11_i2c_pin>;
+        pinctrl-6 = <&P2_09_gpio_pin &P2_11_gpio_pin>;
+        pinctrl-7 = <&P1_12_spi_pin &P1_10_spi_pin &P1_08_spi_sclk_pin &P1_06_spi_cs_pin>;
+        pinctrl-8 = <&P1_12_gpio_pin &P1_10_gpio_pin &P1_08_gpio_pin &P1_06_gpio_pin>;
+        i2c-adapter = <&i2c1>;
+        spi-controller = <&spi1>;
+        spi-cs = <0 1>;
+        uart = <&uart1>;
+        pwms = <&ehrpwm1 0 500000 0>;
+        mikrobus-gpios = <&gpio1 18 0> , <&gpio0 23 0>, <&gpio0 30 0> , <&gpio0 31 0>, <&gpio0 15 0>,
+                         <&gpio0 14 0>, <&gpio0 4 0> , <&gpio0 3 0>, <&gpio0 2 0>, <&gpio0 5 0>,
+                         <&gpio2 25 0>, <&gpio2 3 0>;
+      };
+
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
