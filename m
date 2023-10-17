Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 217827CC041
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Oct 2023 12:11:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 26CC340439
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Oct 2023 10:11:36 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	by lists.linaro.org (Postfix) with ESMTPS id 342CA40440
	for <greybus-dev@lists.linaro.org>; Tue, 17 Oct 2023 10:11:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=T4C86HFB;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.174 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1ca215cc713so16519085ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 17 Oct 2023 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697537487; x=1698142287; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L/xhityidHANRldjqCZLdwURqWfb6ZxMT/TSWeuUQRw=;
        b=T4C86HFBHLxLVHoo5uDIinA0B0A9g4s4QbO7R9W2jiA/Cf7TLy3+HcNID7tOKehQf4
         CLwd2pg+JiOcNCM4Ts8EskP6uYEH/soP52KTBHBPLc1szKzrS42Is2uqIE2AVMmkS+ZV
         RRqlGgoFRjeJIiVCpm3hPdXe1obQKmgVkfquxvVWx/WSA+Ry7d6TvsfpNhjNw2S6UwpZ
         z+xprgsNtX8nnkEmpR/oJuy+QXmvdAJ8V9e9Uh8MbgDXtsGjTpyZ9iU/WMXd/EuKI6lO
         D70+OKDi1hq/Vr59Hnw8QFrNqYatDlenhwSeC9qewl1DkJYuwzsQNCtkaC+PsjCwHFdD
         m0tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537487; x=1698142287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L/xhityidHANRldjqCZLdwURqWfb6ZxMT/TSWeuUQRw=;
        b=MsmR9q+Cigfk7Wjji5oCe2u/php6XNFDvTBYVeHRbe6xjbq8BNYbcbps98kx8cgaLR
         2onN3ugFVDHpH7uIv0zvD/U1qi+u3eb3hMViVnmk7X2Wrv+rac0fdStwtrhQJwqKzREQ
         UAlTIDcNDB59uLzIUszKtxa2pep+aaPZq8ym9LhsUSl6B5jpaf1YB0BLmTYy7DmCjPPf
         WLWOA2J5LjKrukC1Vrz07adxtXVqrVHNTx+GKH0XgFgXcXqXmpvcafrAqkYTwaX23abS
         PC0dA9XRIBBtoKEVWkzoSWvAyAG/pGapqORNaJHMruTw/IA5Rmdk7W+rP+o85GWoSFkP
         ve4A==
X-Gm-Message-State: AOJu0Yw+r8sw9o+8E4GU6Z7pZYj47z/wnYxWVERVGKHqFDLUe3FAgWBb
	j2j47iaZhJ7lUAJ5KgsC9wnlUfWF6CzoPw==
X-Google-Smtp-Source: AGHT+IERzA5Z7Z0TYiNwEpJH1G57kh34XWYQ19Y6Czdr8THGHCovdeCYtJWE1UDEHzJ5penp9zhgfQ==
X-Received: by 2002:a17:902:ce8b:b0:1ca:3d53:2867 with SMTP id f11-20020a170902ce8b00b001ca3d532867mr2062576plg.15.1697537487400;
        Tue, 17 Oct 2023 03:11:27 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001bbb8d5166bsm1127634plx.123.2023.10.17.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 03:11:26 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 17 Oct 2023 15:41:12 +0530
Message-ID: <20231017101116.178041-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017101116.178041-1-ayushdevel1325@gmail.com>
References: <20231017101116.178041-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.174:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org,lists.infradead.org];
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
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 342CA40440
Message-ID-Hash: RCKKP4MUCUGFZFBU7XX22T63CRNVVSPH
X-Message-ID-Hash: RCKKP4MUCUGFZFBU7XX22T63CRNVVSPH
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v9 1/3] dt-bindings: net: Add ti,cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RCKKP4MUCUGFZFBU7XX22T63CRNVVSPH/>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Nishanth Menon <nm@ti.com>
---
 .../devicetree/bindings/net/ti,cc1352p7.yaml  | 51 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++
 2 files changed, 57 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml

diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
new file mode 100644
index 000000000000..3dde10de4630
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
+  The CC1352P7 MCU can be connected via SPI or UART.
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
+      - description: high-frequency main system (MCU and peripherals) clock
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
