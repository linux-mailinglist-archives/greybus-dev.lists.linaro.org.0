Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F41079092E
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 20:29:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 407E13EF6B
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 18:29:39 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 3C09344253
	for <greybus-dev@lists.linaro.org>; Sat,  2 Sep 2023 18:29:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=Uxtl7SIU;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1bdf4752c3cso650375ad.2
        for <greybus-dev@lists.linaro.org>; Sat, 02 Sep 2023 11:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693679370; x=1694284170; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BV45jbupLFx2TG+9F8H1M507c169iOaYL5EH+k/ISNQ=;
        b=Uxtl7SIUtTTVZ1FUlgPHidd1EUoJzXuZsbQm/X1Jqrx6GO/g6emDyyz2l68XrTFOsN
         gS2GcujjWlJqZS+HjxcGLpMkpgpW7AJ1BsI5QemTcczd1RDggfL8zZKlVLYZl2Uz0iwj
         McQrYMC2gxANtwC8LnSa+6CME2R5BAtZch/76yxp4lg/uWJ80xTaKkAcBynfkC458auK
         sXYyYVnD9fWNQ1csDNefKvNdiLdGFj37cgJQe6+mNcVpuaV7eOAtVin16cNfC66DIHfF
         nttkgwhFjR7CKiGfzsLtV+Vds46Fft185LyfxuSXDDFjugNwaEfxN9UQfSsSiU6Py7Bs
         E6NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693679370; x=1694284170;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BV45jbupLFx2TG+9F8H1M507c169iOaYL5EH+k/ISNQ=;
        b=JESdjkGLmYc67L+l7e1+GRL4pCJbUd2gttV/0HYDLf9C1lKnmHfQgGc0Fwr++xm4bT
         g7VDECdZOMJ87AuZmGObSLv71eQBPF7aDySTP8BEPskQxEMQOvuSztHZvBYKmvx6ULpe
         7JN0w6IhiNH88zdYrBb1Z2nQ4LBmNJ8KoQpim4IzkwRA5kKTAmL2AqLBUKGJa+P4sKkM
         UOS4DlXbl36e3J2DZXWoxgx6ZGVjl3N/UNJ7rjS5aWn+aMBZhpP2paqiVCCbarJYefsa
         X0QgGJ6Mf5ncUMKucaqTkZJcKx2EpRuxtjf1t6BouPgsncp9ANIZO4j70AIxKogmXOSM
         Om8g==
X-Gm-Message-State: AOJu0YzJCZNbbKqocQYq8dD+rCr9Dg/r+3LIG9QH3xRtdhvb70KVya8K
	5FeLc38upzKomcRMOOcbsYz97myg0oQ=
X-Google-Smtp-Source: AGHT+IHPRUuIj1BKSj0LtnsNRNydQthbMqyTlX8mU4BFRpAG81lwjVcjG4Gude2PnINdpETkwpBLfg==
X-Received: by 2002:a17:902:f54a:b0:1be:e851:c070 with SMTP id h10-20020a170902f54a00b001bee851c070mr6497245plf.22.1693679369900;
        Sat, 02 Sep 2023 11:29:29 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902eb4600b001bf846dd2d0sm4918970pli.13.2023.09.02.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 11:29:29 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sat,  2 Sep 2023 23:58:41 +0530
Message-ID: <20230902182845.1840620-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3C09344253
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 36K5YGRCLPKHTJC6VKPSAK4UBHOMBTCA
X-Message-ID-Hash: 36K5YGRCLPKHTJC6VKPSAK4UBHOMBTCA
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 1/3] dt-bindings: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/36K5YGRCLPKHTJC6VKPSAK4UBHOMBTCA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add DT bindings for BeagleCC1352 co-processor UART.

The BeaglePlay has a CC1352 co-processor. This co-processor is connected
to the main AM62 (running Linux) over UART. The CC1352 can run Zephyr
and other embedded OS. This commit adds DT bindings for the BeagleCC1352
UART, which will allow Linux platform drivers to identify and access this
device.

This commit adds serial/beaglecc1352 for identifying this UART. It is
used by an upcoming gb-beagleplay greybus driver.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../bindings/serial/beaglecc1352.yaml         | 25 +++++++++++++++++++
 MAINTAINERS                                   |  6 +++++
 2 files changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/serial/beaglecc1352.yaml

diff --git a/Documentation/devicetree/bindings/serial/beaglecc1352.yaml b/Documentation/devicetree/bindings/serial/beaglecc1352.yaml
new file mode 100644
index 000000000000..54db630a2a50
--- /dev/null
+++ b/Documentation/devicetree/bindings/serial/beaglecc1352.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/serial/beaglecc1352.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: BeaglePlay CC1352 serial UART
+
+maintainers:
+  - Ayush Singh <ayushdevel1325@gmail.com>
+
+properties:
+  compatible:
+    const: beagle,cc1352
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    beaglecc1352 {
+      compatible = "beagle,cc1352";
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
