Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1493E9435E1
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 20:53:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2973A4486E
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 18:53:35 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	by lists.linaro.org (Postfix) with ESMTPS id 686064486F
	for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 18:53:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=eFARmjrB;
	spf=neutral (lists.linaro.org: 209.85.210.54 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-70939a06e52so496533a34.1
        for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 11:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1722452007; x=1723056807; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ojT/JLCa93OROa435ly8/9yf/IKMKJjKV66nK3VNbzc=;
        b=eFARmjrBauGVewnCJ6ss6pQpS1i6XaGklvbPslRRGk1v1qsOQCSHGxp2zCScqtyzPE
         mruCh6M7j9yz4Sllp3CoTrDkiGXooCTl87OWSL1jJ8qTyIjUDct19siYnu5IAgWvAI+K
         rM+fhpGZdrGrtN1ex7DD9x7noNTg4aCkKAmPKTwr1bAiirZEOvg8Ad84pwAXoUh3GDd5
         BGRcJxrEu8ovFXSzg8htmn6vaQufTsKDmssULdt1oCW3DVJ9IyHBr5tMCR6411DC0FrN
         ahA7juW7PGtitIzL+9s1gGkRzDqgd79BFCVVIwKhdi+2H5gqJc21U57lTvG2kPr8UIXi
         KfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722452007; x=1723056807;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ojT/JLCa93OROa435ly8/9yf/IKMKJjKV66nK3VNbzc=;
        b=OBmqxkRprumHFFjy2iUQpSr/RJO9Ygu0K15cxRDRTTs0eikThRYLLlZkn3G4/jdktc
         7EWaL01C3FptyYA8mEaycpw0d0T5z+1FsH9E5eOt7vNU6Cvi/7j07o9W0I8DpqA17KOO
         csFsDtUkZs5BUpmTBRg4IpypUOqz6q3Wrw8KbWY9nnm0dFvzo8gT3YlwOyXsxZAh1xgU
         Et84AOpotTfVjFVgmzvY1TFinUmZMcNtaPyeeASxN7dheAzcyB6i4ZNi3QPYXL2wzmal
         vcAEaO58gBjhaoHgKNjQlAPLbLNBM6qydDPRQDBcp6fDrvs2eCZj2DzYUXnBWIUCf2se
         LJsA==
X-Gm-Message-State: AOJu0YzZENdbe9rle/YCuCTkuxLc+Dx7OpiM55IXYiZagOTMDp5EZeiK
	LqeGR784IBxg60IVhs2iTVzmzGGaS/MlvXJnYE9h78DP6AHo1YQQQpq7uAT02C9tOnXkMBmgFeA
	=
X-Google-Smtp-Source: AGHT+IHdD6Lu2yTxVi0/pR+KxWdAvB7471oytstPn7Ep06dyWyYC7FdxtYjBH0hrSEJ/lCHbOD3o+g==
X-Received: by 2002:a17:902:d507:b0:1fc:5377:35ac with SMTP id d9443c01a7336-1ff4d27c1ccmr1480985ad.10.1722451995611;
        Wed, 31 Jul 2024 11:53:15 -0700 (PDT)
Received: from [172.16.118.4] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ff3d64sm123182825ad.299.2024.07.31.11.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:53:15 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 01 Aug 2024 00:21:05 +0530
MIME-Version: 1.0
Message-Id: <20240801-beagleplay_fw_upgrade-v2-1-e36928b792db@beagleboard.org>
References: <20240801-beagleplay_fw_upgrade-v2-0-e36928b792db@beagleboard.org>
In-Reply-To: <20240801-beagleplay_fw_upgrade-v2-0-e36928b792db@beagleboard.org>
To: lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1346; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=XHqJU4/T7F12L5POtvVe0Q4zmll9qWWprpMTXEoqi+k=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmqogPQ0J/TODCghlK+Gt4hhKjYxhh2Cr6l7ces
 FW/VbMBS8mJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZqqIDwAKCRAFzvXHieVa
 dDgoD/wLkKv4S7Es1rK82+/4QnDQYJc7qcpNhWECyHjCljbCMyaa4WnDa3OakUCJShWbwwy+Ael
 yC5w9+vVDuyWoYRBF7Q2t6Zk5wW5admxnuvGr+5iwrrmtewNxscAyiSdk+3z86dJ7ZT9ykh3jdX
 ubTwC5yWlPPB6sE8skPc8hx3h52CbTH/dyyqSmw5TQ8k1CcyA3zCFtm2BKcrqGfLgORI5iB/N2g
 wUYkccWg4APMnzXYFIbTwGSD+sTTo7QKTJ+PUf3kAgGfcKKcmDUY82p+MU+cnefFKLRXFocANtW
 uXrOeH+zufLwS84w8qtx7M+vw76ZQzA/uSUoLgdxcxXGkJln+6KnSc/WbST9hbX6/te5+KLnLeN
 zKJjmcbNjXY8UYeSGdmO4BeduMefXidaz4NTILD9YrY545m9incW7OgzOATss3A7GmXSGp6z6+0
 yHxsC3a4HZQy6v+FHJtTf1asuWeTefsQibTluZSS+FbNNzW0wvLpHXF63glW43LZ5cfXS8mf8OD
 hNf0i981p7jXn8VgXW3616o8r1Uw2q0MIqNRNcZ8p8kIJuApNxK3oHnmz5Tu7oXr8LcMmXnNZOX
 nthCn7gtjNrGjV8plupFsvE4+VCVK7TjPvDlYb0O+jcv4ccVuqKRp4Hbhq0SZwIrfJZTwm8pFuy
 MupaODO95S+NofQ==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 686064486F
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.54:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	R_SPF_NEUTRAL(0.00)[?all:c];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[beagleboard.org:email,beagleboard.org:mid,beagleboard-org.20230601.gappssmtp.com:dkim,mail-ot1-f54.google.com:helo,mail-ot1-f54.google.com:rdns];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: G2Y4F2GCOKFKROG643X5UZK3EAFUBFGS
X-Message-ID-Hash: G2Y4F2GCOKFKROG643X5UZK3EAFUBFGS
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/3] dt-bindings: net: ti,cc1352p7: Add bootloader-backdoor-gpios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G2Y4F2GCOKFKROG643X5UZK3EAFUBFGS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

bootloader-backdoor-gpio (along with reset-gpio) is used to enable
bootloader backdoor for flashing new firmware.

The pin and pin level to enable bootloader backdoor is configured using
the following CCFG variables in cc1352p7:
- SET_CCFG_BL_CONFIG_BL_PIN_NO
- SET_CCFG_BL_CONFIG_BL_LEVEL

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
index 3dde10de4630..4f4253441547 100644
--- a/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
+++ b/Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
@@ -29,6 +29,12 @@ properties:
   reset-gpios:
     maxItems: 1
 
+  bootloader-backdoor-gpios:
+    maxItems: 1
+    description: |
+      gpios to enable bootloader backdoor in cc1352p7 bootloader to allow
+      flashing new firmware.
+
   vdds-supply: true
 
 required:
@@ -46,6 +52,7 @@ examples:
         clocks = <&sclk_hf 0>, <&sclk_lf 25>;
         clock-names = "sclk_hf", "sclk_lf";
         reset-gpios = <&pio 35 GPIO_ACTIVE_LOW>;
+        bootloader-backdoor-gpios = <&pio 36 GPIO_ACTIVE_LOW>;
         vdds-supply = <&vdds>;
       };
     };

-- 
2.45.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
