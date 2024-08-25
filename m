Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A38695E46C
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2024 18:47:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5ABC444145
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2024 16:47:35 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by lists.linaro.org (Postfix) with ESMTPS id 7708240D1A
	for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2024 16:47:31 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=Ux8ThtF2;
	spf=neutral (lists.linaro.org: 209.85.214.179 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2020b730049so25786465ad.3
        for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2024 09:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724604450; x=1725209250; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jxz9W0rg7mMy2BV/5liqAlp9Grj+cfqvAy4EMVlcW0Q=;
        b=Ux8ThtF2fMdb5skVHHyqQ6xOm+OLiAleXKpMAqk6GKHkMUAfJHheUrsOPrF1ygxWKS
         gFyhaQjkOEFKDlsveXgUwJie/Ju/FOZBtVLuEEuVeqFH6B0p2xG0is0tAkXpHG5AKnnd
         FmNJgxz62qMYMQGWGBFPOo88hTUgpyNRa1ovJ5BKWhgotf9teeNCiYa4/QlN8ePVWzWb
         5kDQIK6915iF4JrFdcr8426I+Q4aD9TY472eb/hOacrY8k1HoXnK5tC1vTK863YEZwtZ
         7JB49p38uDJ8fvfhaw/8iO2b01JO1bb8aHXNL4fK5UQ/+lQaQABD/+LFpS8F9WFKfDk5
         r85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724604450; x=1725209250;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jxz9W0rg7mMy2BV/5liqAlp9Grj+cfqvAy4EMVlcW0Q=;
        b=iMwZu9vNv3ju96KE8AmtQAdSiP5uIuSBgiJvpFZvU/2xxjX3rLciNWmMIqgc5R0sg4
         AUcpZd9XdVHvpH+7qpcfVDBNmBqosWGJVm7bgc7lom9CDmo1mLJ00Lr/Wt9fDt5feEaj
         AMR86R0lWyS+WbJ0rEsSLPX2LpS6uELkqAoviBueOkTHvkulfHbEA6arBr1XWCFDwtdS
         +ZMOQ9QF/E2cesMGUrA5aLCooA13xuzTL12wU9PWikVoXi25oS5YD8/qNDpLMCOQ5An+
         z/PqMnaXS/eJs883+4nLq+Yqmlg2OyMYMeI+YPspy16gFzw+NLZdLzXo9aPVU669YO5L
         HQyw==
X-Gm-Message-State: AOJu0YwBbDER1J3FsQWUdY96GBVZt/Fp/Rs3dlMF8I5jiQggIl+FQg1m
	MjZ6KNWmZ/eIsmiQNr6LLiilCY7vzgHT5s2lqDGevOo/FL2sEeJGycb08JE8Ug==
X-Google-Smtp-Source: AGHT+IGVR21d8zqzI/Keli5KOIFPrhh0cOLMEXTUS9i86vC9K91QywMMPIUWj0mRJltzwRZynXU06g==
X-Received: by 2002:a17:902:d4cd:b0:202:2f0:3bb2 with SMTP id d9443c01a7336-2039e555a4dmr75158555ad.60.1724604450596;
        Sun, 25 Aug 2024 09:47:30 -0700 (PDT)
Received: from [192.168.41.46] ([2401:4900:5ae1:9eb1:890a:6b80:a16d:5ab4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385609dddsm55411465ad.196.2024.08.25.09.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 09:47:30 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sun, 25 Aug 2024 22:17:05 +0530
MIME-Version: 1.0
Message-Id: <20240825-beagleplay_fw_upgrade-v3-1-8f424a9de9f6@beagleboard.org>
References: <20240825-beagleplay_fw_upgrade-v3-0-8f424a9de9f6@beagleboard.org>
In-Reply-To: <20240825-beagleplay_fw_upgrade-v3-0-8f424a9de9f6@beagleboard.org>
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
 h=from:subject:message-id; bh=GMfOVBjnJuIyDUwmWasZ6B3xnGuCFW07MH/nRO0xhUA=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmy2AQ2QBtHN5N93ah4bgfx1vdyCdBtkCC+s3tb
 u9GqnkyqcmJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZstgEAAKCRAFzvXHieVa
 dHc8D/93PwsuFi6L+Z/37jsgx7MhUtmNxp+24Wzk9vMkyykd5HReCsim7ISof3Kg6TBA77Ytp8z
 WGifo40UZ7NZ2oMdYizXh/zeVfPUQ9aqXEOCD8uMhb/KsQBeaiF14zqE0Ef5CSwEmW9ed+2zjCF
 sYoPm67yXMV2B472oR2DDUlHAKZmF5C+PuwX1OHa8lVxzn01xci2IDxgrLNKk4TV/exJjCmNUsX
 zvDMugn0FYID0rV7sE+Pgdrf7WkblXNA624ZzL3SlIj2pwVV6h4hEHEBiT6vF04SbhXrpZqaMV6
 tEwIQ8QQT1XjvMEtkmJMn2AWC7Yv4V3HH9ZjXlcIv3nHI7JmGVu36EBT2wn4mkp9MOeVe253QPc
 G+8YRqqoYNR067PQD7LZ6xJ2xmNtbLI/dgJK90/uBXeYS6cnjkHQt7TXzxbTmZ2C1z6Riq6JJnF
 FM+BW8BwyQzXwKMD9ZVIko3kmRmGOYTn+nS/ghK1+uxGiqLNXOkkAXuHA9PZ24chCfMI1RH4xF7
 zO28q4vrvMX3y94l6BKLKPyALVcG8IKP8yya1m64kYpDeKWrvclvi9j70I0MCEbCp1f7SPjLdkj
 oaL5ayWcLNJmlLaOcqE03yvyDJoDElOxk9Oyo71qSowojg5iYbAYTrXghsFhETMzLJ8tJm5WSQU
 U7t6YLDAYwcQhEg==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Action: no action
X-Spamd-Bar: -----
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7708240D1A
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.179:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
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
Message-ID-Hash: YCVQPOINPDQDUFYXXO23MZCADMBWMUSS
X-Message-ID-Hash: YCVQPOINPDQDUFYXXO23MZCADMBWMUSS
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/3] dt-bindings: net: ti,cc1352p7: Add bootloader-backdoor-gpios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YCVQPOINPDQDUFYXXO23MZCADMBWMUSS/>
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
2.46.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
