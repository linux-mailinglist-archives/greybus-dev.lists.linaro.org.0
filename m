Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDE27AC7BD
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 13:38:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3682B3E975
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 11:38:36 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	by lists.linaro.org (Postfix) with ESMTPS id 7FEC640F48
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 11:38:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EfZH4mLp;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.171 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-54290603887so2884238a12.1
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 04:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695555508; x=1696160308; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ygmequM6X8SVeyJvfoY8+sWP6RwI5iKR0zSHbF+Gqd0=;
        b=EfZH4mLpbKUH7m13nDq6AATauPLp6muZbEzZQbaMnAZiiy3qz71lwxXFImq1G4WGme
         gL6P7CBoo78Yw0nvMMn9mKT6aamc+vwXs7s4+PpopQljYEib2ID4MsPj7/rQuk+1l6++
         1edhNj0QIADIkrWFxjrBw++A3tgZrjvWph0eHdSRZDw1uYOdwxPjhGFvEUW8OwQVELFM
         UR+1x+IFDnnOdOmZfB+JY/C3CBc9Lorq6kxOaABAbMPljBjQB+8weEXC0gJx7cL4o9JF
         aAPoX+0zEpWMnCPMtFVyaI5CoXoqQojMSkZtGNDpcBEQQAtVxsJUCBeSa7fQTawl7zxD
         bUlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695555508; x=1696160308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ygmequM6X8SVeyJvfoY8+sWP6RwI5iKR0zSHbF+Gqd0=;
        b=G3Vx5saOCCCOlY+fTbF9ne8sC/BIoZojur+zvIafQp/ECfqdY0eqm3j6A3q5Mq5DKi
         fRJ7dqHVJs6+c5PvjV+PokQdoGSCbTZgHVdU7ZztwwEaQzceF8pORMGJbFiC3qZtR5XX
         uu6/KHwQoDxMP1HK0x8xJl0EpsR/FL8SX/vKMCxDNHjXUGl4Ljl3gjnbR53kDVywK51c
         CykipOp39Z5fTkD91kyzyq4DHp/rjN3LpbkK/LshKH/IsO6Zuu6sGxHlEk1DsqNkCPUo
         8i7HgAqvjiChgV3GBrVesfnwxpQeL+11dKBRsNl8N9rHT8BmnFg0I1CrsT1V0aiEyaUL
         5fmQ==
X-Gm-Message-State: AOJu0Yxedm3NdyEYz74t6i/j2yZBQTVsmEDJIKqkEqZv918T61TFbogs
	rjAy8WfpfiLHvJcJNOQA6szivRBGE66Tbg==
X-Google-Smtp-Source: AGHT+IEI7URBA4Skcmsfr5ChZP0QUxE8WRwEVkgD/HieECpdU+fz8NVZK1v0TuVCOT/kIFwJODK5hA==
X-Received: by 2002:a17:90a:f182:b0:274:c2b2:7bb7 with SMTP id bv2-20020a17090af18200b00274c2b27bb7mr2246863pjb.27.1695555508165;
        Sun, 24 Sep 2023 04:38:28 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a6e4200b002775281b9easm422376pjm.50.2023.09.24.04.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 04:38:27 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun, 24 Sep 2023 17:06:57 +0530
Message-ID: <20230924113725.164948-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924113725.164948-1-ayushdevel1325@gmail.com>
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
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
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org,lists.infradead.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.215.171:from];
	TAGGED_RCPT(0.00)[dt];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7FEC640F48
Message-ID-Hash: ABE5VYIZIBZNCN4AOPGPHHJINUO676OJ
X-Message-ID-Hash: ABE5VYIZIBZNCN4AOPGPHHJINUO676OJ
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5 1/3] dt-bindings: Add beagleplaycc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ABE5VYIZIBZNCN4AOPGPHHJINUO676OJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adds DT bindings for BeaglePlay CC1352 co-processor.

BeaglePlay has a CC1352 co-processor connected to the main AM62 (running
Linux) over UART. In the BeagleConnect Technology, CC1352 is responsible
for handling 6LoWPAN communication with beagleconnect freedom nodes as
well as their discovery.

It is used by gb-beagleplay greybus driver.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../bindings/net/beagle,play-cc1352.yaml      | 25 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++++
 2 files changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml

diff --git a/Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml b/Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml
new file mode 100644
index 000000000000..f8536d1a6765
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/beagle,play-cc1352.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BeaglePlay CC1352 co-processor
+
+maintainers:
+  - Ayush Singh <ayushdevel1325@gmail.com>
+
+properties:
+  compatible:
+    const: beagle,play-cc1352
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    mcu {
+      compatible = "beagle,play-cc1352";
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 37b9626ee654..9d1b49a6dfad 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8969,6 +8969,12 @@ F:	drivers/staging/greybus/sdio.c
 F:	drivers/staging/greybus/spi.c
 F:	drivers/staging/greybus/spilib.c
 
+GREYBUS BEAGLEPLAY DRIVERS
+M:	Ayush Singh <ayushdevel1325@gmail.com>
+L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/serial/beaglecc1352.yaml
+
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
 M:	Alex Elder <elder@kernel.org>
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
