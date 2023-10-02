Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8021F7B59FD
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 20:26:41 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F04240D68
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 18:26:40 +0000 (UTC)
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	by lists.linaro.org (Postfix) with ESMTPS id 4193740D69
	for <greybus-dev@lists.linaro.org>; Mon,  2 Oct 2023 18:26:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DryGT+BU;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.161.49 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-57bd4e4ada6so21506eaf.3
        for <greybus-dev@lists.linaro.org>; Mon, 02 Oct 2023 11:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696271191; x=1696875991; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=deMrdhI7n6d43o9ynRDnYKYyrcO/xdvIoxsUthjyE5k=;
        b=DryGT+BU9sbMwO88r7CzneK0XudW4eiBhMwYkmzv22+xSb09NL/8Y4SeubIN9lQp53
         g/QQwufv0Uzioip+3mpbO5wXzEoFCnkPndAa0gG/bvBclcs7871GxPnx/9TGBORvUwmo
         yUcY9Zr7jPc7mEdVOgCYHO0La4RUkd69vIGCKExsY2bZ9pkhwm98OBxvdYJgSwKFw7X3
         r3TTr5mjnKs+GQHRzCtxIPyWoTAWwXHVkNGiVTgsJHcJDnqH0OMok2tPPA/jCW+FOCUY
         AtrWXUnvhajj3ZmPzjy2UwAP7zw/mka9kJOdbLBfF/I1VBuBoLDjC5mm5eaHQkJkGwj6
         yI8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696271191; x=1696875991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=deMrdhI7n6d43o9ynRDnYKYyrcO/xdvIoxsUthjyE5k=;
        b=EMM4JjQRTUsAtbKkHiugBsOhHjxSjyZDyVYklYf5wjBqVMmSeaC6geiMaJlAX4Ex83
         2q6EqbFDS8jlzLCjKbZTkFebQtCuE8ai6FXrDHpZJV+vIhwca/SPJlw9lutaULnEUxpc
         GgVk5hEWqiSyrsqZtOg1PYC3PUtSFEygKKAl2zQnc3BvRv4A1j632CyDCfafvbp8oWp6
         JEJQNQ6nW6YN99+zQH+Qon1CykCL5fzwaBmPbkuWv3m8j3MphwZ0KP2KTjCsv5dU2GvW
         o6msj9Y30hyuC3lkjJfM4BJuO+RfBhLHbIyMiq/SJnvCvr37RxsglIEnkxxHRUTjO5uu
         PxGw==
X-Gm-Message-State: AOJu0Yz4GSLU1jWdGCxW/naB08dWNKw/UgPge81Mb4CNn9QENzzd0e0f
	JwAN061ze16lUcflyyhTnBIdExBH6yfkjQ==
X-Google-Smtp-Source: AGHT+IFOOEkZ1k10QlUz+9HgXzSS9Pvfa+Dg0k015541iUOgbMH4VTd4c1S1ehXHCVvJkRE1UfckhA==
X-Received: by 2002:a05:6358:339f:b0:142:d1cb:48ab with SMTP id i31-20020a056358339f00b00142d1cb48abmr14693012rwd.15.1696271191244;
        Mon, 02 Oct 2023 11:26:31 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id a8-20020a637f08000000b0057d86bb613esm17249584pgd.45.2023.10.02.11.26.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:26:30 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon,  2 Oct 2023 23:54:50 +0530
Message-ID: <20231002182454.211165-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002182454.211165-1-ayushdevel1325@gmail.com>
References: <20231002182454.211165-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.161.49:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[linaro.org:email];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org,lists.infradead.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4193740D69
Message-ID-Hash: 7PTDKXVGNFEGEVNSVJPYIBXQOFUTJ5R3
X-Message-ID-Hash: 7PTDKXVGNFEGEVNSVJPYIBXQOFUTJ5R3
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7PTDKXVGNFEGEVNSVJPYIBXQOFUTJ5R3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add DT bindings for BeaglePlay CC1352 co-processor.

The BeaglePlay has a CC1352 co-processor. This co-processor is connected
to the main AM62 (running Linux) over UART. In the BeagleConnect
Technology, CC1352 is responsible for handling 6LoWPAN communication
with beagleconnect freedom nodes as well as their discovery

This commit adds net/ti,cc1352p7. It is used by gb-beagleplay greybus
driver.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../devicetree/bindings/net/ti,cc1352p7.yaml  | 48 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 54 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml

diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
new file mode 100644
index 000000000000..57bc2c43e5b1
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/ti,cc1352p7.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Texas Instruments Simplelink CC1352P7 wireless MCU
+
+description:
+  The cc1352p7 mcu can be connected via SPI or UART.
+
+maintainers:
+  - Ayush Singh <ayushdevel1325@gmail.com>
+
+properties:
+  compatible:
+    const: ti,cc1352p7
+
+  clocks:
+    maxItems: 2
+
+  reset-gpios:
+    maxItems: 1
+
+  power-gpios:
+    maxItems: 3
+    description:
+      The device has three power rails that are exposed on external pins VDDS,
+      VDDR and DCOUPL.
+
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    serial {
+      mcu {
+        compatible = "ti,cc1352p7";
+        clocks = <&sclk_hf 0>, <&sclk_lf 25>;
+        reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
+        power-gpios = <&pio 1 GPIO_ACTIVE_HIGH>, <&pio 2 GPIO_ACTIVE_HIGH>, <&pio 3 GPIO_ACTIVE_HIGH>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 37b9626ee654..5467669d7963 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8969,6 +8969,12 @@ F:	drivers/staging/greybus/sdio.c
 F:	drivers/staging/greybus/spi.c
 F:	drivers/staging/greybus/spilib.c
 
+GREYBUS BEAGLEPLAY DRIVERS
+M:	Ayush Singh <ayushdevel1325@gmail.com>
+L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
+
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 M:	Alex Elder <elder@kernel.org>
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
