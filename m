Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EE095E46D
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2024 18:47:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1CE4044145
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2024 16:47:44 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	by lists.linaro.org (Postfix) with ESMTPS id DC91F40D1A
	for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2024 16:47:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=GSqrFYD9;
	spf=neutral (lists.linaro.org: 209.85.215.177 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-76cb5b6b3e4so2209179a12.1
        for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2024 09:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1724604459; x=1725209259; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ueq56/ihM5P7UHNM9LExxz3BL+BrqPFaFFbdMDA7T6g=;
        b=GSqrFYD9Fe+wI9F4WxlCg2WL0VmBjSlxzWmL94AC7g5y0UDtOPRq+jBDNO7wJfU+De
         GmwaMi3ICkUpP3f0KXWCyR/MwSEI7scT67qTGo4d/HdGobLsuyEXLAWsH02hradK9kup
         cfwmw3f4ReCEVHTKgPJqA3CnU/xMQz1rodkl6peFw7X1RERc8OspWDH03Yndi4hHNxvc
         FxQrnMbcWNQlymQfG00ttD28ClCPmxlKSzqhH6bzPVFpCkjGMKSm0DDducv8oFzQwjnp
         DuU3FjYJmnlGPfUl2iVik4UsSNW3lZvb1aWGm2Szt/8qOSLO/1wqsUxBv3JaVQ5LYZOu
         X9Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724604459; x=1725209259;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ueq56/ihM5P7UHNM9LExxz3BL+BrqPFaFFbdMDA7T6g=;
        b=DRIAqPUWhMiWqVF776HTvjt4q7HLdxFkMTFNQ+A6uRx87n15gcuO8L7wQ8zVtn5tww
         w7/F6YYp/S08GKS9QNEna7Vm83f/KvorthGahF5ouDMD1e8ySqSTBPemnqB9iyJmG7s+
         lLfS1SKH5+EkUSS/dMo3+VagzG5wDQjtl4rJ8FVWz3KSeG5jkYYbTieyjtvwDxGIPDiQ
         gtNeYLZPBiEFtUGZeedUfl8m1+H53LW6KV5Yvdd8VENQpcdrt7UZRAzYrjEj7wCMQ4eN
         bGsNK0BK+GRWQprEr2s+X0bF2WoltpDwJosMX2Z2BnphhGYXVVKBv9yFL/YlVQPMGIgX
         /K8A==
X-Gm-Message-State: AOJu0Yy1RhZGdS+jNqBu6FTfjI0shrfF3QUtL0tIJBnlQQijA+zPQfj0
	SMuarAZaDBGFGYZ+qnypCgnAIdKDCBq3JBaTAEV9r9w0erB9nKG0/KyNvYzzww==
X-Google-Smtp-Source: AGHT+IF3wXb+mSv/UNa0ZMBw8G9xxwsqqc79mgqaYouznABo5fWpZP8CC5WQcB7qDSvQaC2AMvoPbw==
X-Received: by 2002:a05:6a20:d493:b0:1cc:9fa6:d3a6 with SMTP id adf61e73a8af0-1cc9fa709dcmr3036937637.3.1724604459012;
        Sun, 25 Aug 2024 09:47:39 -0700 (PDT)
Received: from [192.168.41.46] ([2401:4900:5ae1:9eb1:890a:6b80:a16d:5ab4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385609dddsm55411465ad.196.2024.08.25.09.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 09:47:38 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Sun, 25 Aug 2024 22:17:06 +0530
MIME-Version: 1.0
Message-Id: <20240825-beagleplay_fw_upgrade-v3-2-8f424a9de9f6@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=9dsYNp252XCXLeZVdDf5E51difa2bgrBMStutB0fu1Q=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmy2ARetMtxhDBfPiDIaJ0ybvafr0n2xZc8i1BA
 20ABi6GNBiJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZstgEQAKCRAFzvXHieVa
 dH1lEADngrBq+XkavxM0bdXYdsYC8etGCl5fyTT28X573HMtRgT0Qfcr5FOWR48fLzVQRnmYvCo
 Fz9JVjKjbF/XVep/Qtm1XYlv0yXeB9buuWq1PJq6y93kHaPdJjSew3Miy7N4shjBmaap4ybYg+2
 GI2pDdiNxuS2Cyujw1VWp4D1/qF7QIZCLCTUEUxhkhF4qHlOmVFUV5oumfuSVsaJ+PrID5N9bRN
 vUGaPWnVLAs/pjcZLnuBfQrPOT40Or2ft5jt1PCR0Ie7N3YXUjgmFvhs/qQ2sYS8Bq1aAHQK5qP
 3MMKDJ4jKS5YSICw3sdPzZYk4oU7vyfQqtbTW3JKkrTiRRTBB86MznwyusGFqAMC54mc/sA+0/0
 rFdy2AX0emAfUw5YoGuESI9V2hKkUIZHqCb+bK46/MYgG+erXBsydsT3r3SnW4vkisINzU+ElAv
 J7kWtWwjxGxYKIj9wYfaO6S1VcOWf/7Pc2JHk2NQyVLdBerLwC/V7K+1fQeHDPJ382sJlNYLZ30
 YYMrC6ZnvKUybIdmGAW+RDsP0wxVUYEdN15QxJskPHze/tPsBy+/Y3qTl5qKzBuUn4GUdiN7mbr
 naNlHe1X5vYM4yMhw+vAJESKUgsvXi8CpqrW9cy7UPDR5H3Lll+yPwxcFsG8tMUdDnp45V8R7V/
 WkSSQD2EW8xVHew==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Action: no action
X-Spamd-Bar: -----
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DC91F40D1A
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.177:from];
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
Message-ID-Hash: MFNQW46PDFQK6PSR3KVJSOIRFYMXDXKY
X-Message-ID-Hash: MFNQW46PDFQK6PSR3KVJSOIRFYMXDXKY
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 2/3] arm64: dts: ti: k3-am625-beagleplay: Add bootloader-backdoor-gpios to cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MFNQW46PDFQK6PSR3KVJSOIRFYMXDXKY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add bootloader-backdoor-gpios which is required for enabling bootloader
backdoor for flashing firmware to cc1352p7.

Also fix the incorrect reset-gpio.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 70de288d728e..a1cd47d7f5e3 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -888,7 +888,8 @@ &main_uart6 {
 
 	mcu {
 		compatible = "ti,cc1352p7";
-		reset-gpios = <&main_gpio0 72 GPIO_ACTIVE_LOW>;
+		bootloader-backdoor-gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&main_gpio0 14 GPIO_ACTIVE_HIGH>;
 		vdds-supply = <&vdd_3v3>;
 	};
 };

-- 
2.46.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
