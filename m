Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D838F7BB0B5
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 06:12:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD94540433
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 04:12:20 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by lists.linaro.org (Postfix) with ESMTPS id B1E4841058
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 04:12:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=AuqUXDLW;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.174 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-692c02adeefso1447246b3a.3
        for <greybus-dev@lists.linaro.org>; Thu, 05 Oct 2023 21:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696565531; x=1697170331; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ElaHiBH2gpr//Jw4k1jpeuPEUC0EHD6jwce46X0hpw=;
        b=AuqUXDLWL0pZ1hFJmvgmfIRmbkBj1mufai1wAmHI6YbuZcPaiCMPj5DtmkvQ0PS12t
         lPwNf1oA4BuO+//2ztF+vvU8Yz1nUJgsIQN5+rcYis+LtdYtKnl41DtyFaiJexIlSHRV
         T4TVAmcOs4zk+VapEqKq2p7V96+pVzf1efDUeKVPfxRiACM230XJq9Eb+YJcnWxrxHnC
         kWPpA2yyoEQ+rUAxLaOy9qIXVzH6mfrmgwdsSAsSZqwPvTzMK2WpXGinvA8gN145xWw3
         HHLZhnRcV2z48fqTHHCWA7Gi6K8sXsLSKq7gGjFkUdj4NmbAtxnWAURz9dGRdolo7JYU
         UbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696565531; x=1697170331;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ElaHiBH2gpr//Jw4k1jpeuPEUC0EHD6jwce46X0hpw=;
        b=KDVDRSl/k4Di034fLvP3NT3Y7Xgj5ppX8JFDCcEQ5zOSaJ0nyzdemTQ6coeKVxoCAu
         1zKfu+39Hwhf/XBaVO6YVKDcg4dMfm2paI3qajfegnKbzoeUlX60j3B4tuwp3dy0iOrq
         o1/Ri/T8iJhNcE6JuVD0eRW9VvsHITXzU9X4zMwyt0V94fGirZXJLzK4ksJPM9u/Pfem
         FRJHe9d2g23d4V4x7LsJ5O5tmXfropM8lr6fJapX6ErOqRNr0z2YKpRx4DPYfpKU0WzA
         Rt20Gw+t7FVRJNTg1Xsbs8Ib9GJ49hdpr94V+Zt2/HJkn9slqnCVP0/N+XzTgR5bKqxm
         Cfew==
X-Gm-Message-State: AOJu0YyzP2yeDbXaLOt+X8JDl5xexieNv5evsEYcEsqks9bwJyZGGuzU
	KjFJzFEOFZcTLsaDFvT+rgZAXnKuGF8qABjJ
X-Google-Smtp-Source: AGHT+IGCUK795EYjNWmS1WCmxu8wWlR0iFUgaTwAN667aycGcat4PIME2RRoQEut2/Wz8COmWS6MvQ==
X-Received: by 2002:a05:6a20:8e29:b0:15d:684d:f514 with SMTP id y41-20020a056a208e2900b0015d684df514mr8294977pzj.6.1696565531371;
        Thu, 05 Oct 2023 21:12:11 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79391000000b00694fee1011asm401131pfe.208.2023.10.05.21.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 21:12:10 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  6 Oct 2023 09:40:31 +0530
Message-ID: <20231006041035.652841-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006041035.652841-1-ayushdevel1325@gmail.com>
References: <20231006041035.652841-1-ayushdevel1325@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.174:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[linaro.org:email,mail-pf1-f174.google.com:helo,mail-pf1-f174.google.com:rdns];
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
X-Rspamd-Queue-Id: B1E4841058
Message-ID-Hash: KPSOPVOYIN45ZBVGYD2FYXQHN3UL4MUO
X-Message-ID-Hash: KPSOPVOYIN45ZBVGYD2FYXQHN3UL4MUO
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v8 1/3] dt-bindings: net: Add ti,cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KPSOPVOYIN45ZBVGYD2FYXQHN3UL4MUO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add DT bindings for Texas Instruments Simplelink CC1352P7 wireless MCU

BeaglePlay has CC1352P7 co-processor connected to the main AM62 (running
Linux) over UART. In the BeagleConnect Technology, CC1352 is responsible
for handling 6LoWPAN communication with beagleconnect freedom nodes as
well as their discovery.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../devicetree/bindings/net/ti,cc1352p7.yaml  | 51 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml

diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
new file mode 100644
index 000000000000..742763e04543
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
@@ -0,0 +1,51 @@
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
+    items:
+      - description: main system (mcu and peripherals) clock
+      - description: low-frequency system clock
+
+  clock-names:
+    items:
+      - const: sclk_hf
+      - const: sclk_lf
+
+  reset-gpios:
+    maxItems: 1
+
+  vdds-supply: true
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
+        clock-names = "sclk_hf", "sclk_lf";
+        reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
+        vdds-supply = <&vdds>;
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
