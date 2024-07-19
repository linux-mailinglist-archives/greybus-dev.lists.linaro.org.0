Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D1010937603
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 11:45:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E22F34418D
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 09:45:41 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 1BA634418D
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 09:45:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=l7TduWUq;
	spf=neutral (lists.linaro.org: 209.85.214.181 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1fc5a93ce94so1841975ad.1
        for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 02:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1721382338; x=1721987138; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+46O4rQZG+afw+seJ1aSaqWCwYwoT6C2GKWC2dXu30=;
        b=l7TduWUqfNTiy6WI0R/W23a/RpiXbgwKknD0NXt7e5MlwhwIlx5zNgOVShu0CcQwMq
         9+DL4aFZrjMDS1JCXqFaTVpJp1bqW+J9q0SHBEVexV0sYEG6ghxIHUfcCLCy1GWQbtr6
         1I12XMQeNG9kQSPANwk3bvIzw1SBUVz61fDJEQ6OEZX0+gCJelg57gygQP7G1SGVURAT
         DO4A+iUVnNpoZODngIbD93c+f59djQo8blQHDbIyRLKiHuYHReRGMmCR6aWYzljvxhh2
         oPqzstyO6/bE673eOGmu9do3jE1sAU/Lrt+C4ouua5ZwWM/J7Ua2z8SBi97Q63CD/83N
         oicw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382338; x=1721987138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+46O4rQZG+afw+seJ1aSaqWCwYwoT6C2GKWC2dXu30=;
        b=QJCm3KnPwOH2dI3SwZm/rwRkFYQe1a73XUMX4yLc0ckMz/UXoTbkdS3YnexATn3RIc
         D9Xsnec5WZ762dJUz81d94bacfNQ2b2+/yHf89K9J2YK5i4NmaiEO7mKqYZsW+koaNdS
         ttlVfd2Gs41b2Nnn2Xy0dtjJ8/aY4+7K6ddD8Lefpg3uAS2iPsElaMKYmZE1GavlARtl
         35TrsDoUlwYvNyzDcboOB6Umk8be6X9SvUqds3O+xi4HWmAYzLCDql4+s+Ai7HP7CWlC
         5yA9S/4o9bgc94xtWpTFF5b9mWCeMDnIPuPp2ytJWwlTXGb04mvBpf1yVMXNScyCjABC
         jyxw==
X-Gm-Message-State: AOJu0YwGE1ZkwmaT3jZg2azIK6GDj3fOE6d3d+D/l0VjDinVOeSAm+E/
	ps5UUtKlMLUufcl00W4GCBy2AYC5n+sOPWQq5FE5Bk67CnqLA1ve2GZY7P8b3A/+LXzfoA90UYY
	=
X-Google-Smtp-Source: AGHT+IGTvpfyGkQSzcGiWO9xJsSuPVeVkrZ5bQM0dG5A4we5XMAn0a2gFht26kLa5ZsN/Jp0o9awzQ==
X-Received: by 2002:a17:902:b195:b0:1fc:5b41:bb1b with SMTP id d9443c01a7336-1fd5ec8ab33mr13929205ad.4.1721382338043;
        Fri, 19 Jul 2024 02:45:38 -0700 (PDT)
Received: from [127.0.0.1] ([2401:4900:8899:6437:d031:b9ec:7ff1:6aa1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f67esm819025ad.96.2024.07.19.02.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:45:37 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 19 Jul 2024 15:15:10 +0530
MIME-Version: 1.0
Message-Id: <20240719-beagleplay_fw_upgrade-v1-1-8664d4513252@beagleboard.org>
References: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
In-Reply-To: <20240719-beagleplay_fw_upgrade-v1-0-8664d4513252@beagleboard.org>
To: jkridner@beagleboard.org, robertcnelson@beagleboard.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1167; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=ShGVMtgc0hDJDLEQjlIXd5oij4dB7J9Ckvvpo/zXXW0=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmmjW1FCj3t80L4AIBRXHK9xB7rRLJ+43vNde2f
 nHTW8A6u9uJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZpo1tQAKCRAFzvXHieVa
 dOQKD/97OqRvHiNgAtedUcGy81V44GNPmt+MwamaNqBs/ESpSxZaZCBUmXU4Ikq6jWKM50k3gPs
 noxPI8ZwpgwqTW7CHvQu+FwuugPwOVub4cAskF4MXDPP76puggUF0gL9/aXCPvEK+sXyuNbeLJL
 6hmdiavzI1oqVENYVkxIBsbLxA96T9Dtsj39CMz8spOurWjl0IGziLRfXd8k1Dj9JfqCTwJHiNM
 x0FPeS+QYjzsoTVgrdowKLtqqevOvpCrMF3Shj1OvmMcC3qtA1/2UgIC1LZ+SDqh5JtkWZfvAE+
 0IeEPi+N4r5fIzon+OKlQOiHBrzTMp42V0T0+5IkV1DSPOL0oNS6tTqdWFsDs+iJYvi2y9wHidT
 W1jl8/kw9OkiiGlZBlUgCXw23HfXhaNzkzozWAAFEvJagEQbeYSSxyoKNnJfmGLIV3MKcMXnaRd
 RJAfOS3aJ1liKybxkDjWyGIQWXxpfDTxwgOLWS6rCzmJmY+5FHyGeRaM5wHlaeNSeDisOjD9Vyj
 Z+jwPRSmqHGM165PaH8qRilV0E1hv+fqYbIw+82m/ETIwS4kovzktB6Sr/6r46tj9WmNwSSqZP3
 DGuLmkFSVdV26vPHrjce3pwcXqWtayCdAT4pbydSURatbZzt84eX6Fr5koTF0g8ZNLqGBH4RES9
 Ot0J23ppRG8qbcw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Queue-Id: 1BA634418D
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_RCPT(0.00)[dt];
	R_SPF_NEUTRAL(0.00)[?all:c];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MTHNXKUGOWOOGVQIC5LJ74KQX3TNFDAW
X-Message-ID-Hash: MTHNXKUGOWOOGVQIC5LJ74KQX3TNFDAW
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/3] dt-bindings: net: ti,cc1352p7: Add boot-gpio
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MTHNXKUGOWOOGVQIC5LJ74KQX3TNFDAW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

boot-gpio (along with reset-gpio) is used to enable bootloader backdoor
for flashing new firmware.

The pin and pin level to enabel bootloader backdoor is configed using
the following CCFG variables in cc1352p7:
- SET_CCFG_BL_CONFIG_BL_PIN_NO
- SET_CCFG_BL_CONFIG_BL_LEVEL

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
index 3dde10de4630..a3511bb59b05 100644
--- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
@@ -29,6 +29,9 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  boot-gpios:
+    maxItems: 1
+
   vdds-supply: true
 
 required:
@@ -46,6 +49,7 @@ examples:
         clocks = <&sclk_hf 0>, <&sclk_lf 25>;
         clock-names = "sclk_hf", "sclk_lf";
         reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
+        boot-gpios = <&pio 36 GPIO_ACTIVE_LOW>;
         vdds-supply = <&vdds>;
       };
     };

-- 
2.45.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
