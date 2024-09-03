Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D19B8969912
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 11:33:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1F9D44AE8
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 09:33:22 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	by lists.linaro.org (Postfix) with ESMTPS id 344BB40F7F
	for <greybus-dev@lists.linaro.org>; Tue,  3 Sep 2024 09:33:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=yGyZlUV2;
	spf=neutral (lists.linaro.org: 209.85.160.52 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-277c861d9f6so1818379fac.2
        for <greybus-dev@lists.linaro.org>; Tue, 03 Sep 2024 02:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1725355997; x=1725960797; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ueq56/ihM5P7UHNM9LExxz3BL+BrqPFaFFbdMDA7T6g=;
        b=yGyZlUV2XEpMQmKvAoxXeXXre/WiIEKBafL8b4F6PjyGogj+Y3R4EXFAwJjfQU+/kU
         clnTF0nTa3rSwdcjRNIMgaZJdP+cKD2coAvGNdQRayqvlkIT3Es6eRmfS7qpUie7wVQ4
         dyOWZJ3ikXiNneQW6yDWdlXpO3GQ7w3LQuNzq30W7ywihIt+ru4VKdBnxUMEJOM5PU+M
         S8d+3TBd12xWLIKl+Tw4xoF9MVTyUAmNqMP6NdT2ZHY7HY/TOCgkWyHGVLeH68f6xuIa
         9rcLVRt4Ogbe9hsNVi7FGtXj099YUjXIDllyFg9ZfWCTzQHuf4Y5s/qQJHdQE2HtjQIC
         MpqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725355997; x=1725960797;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ueq56/ihM5P7UHNM9LExxz3BL+BrqPFaFFbdMDA7T6g=;
        b=G7Vin6aE6UQgk9xwXH8CH3Hwv5Vb/LENbwV17p+UrSLlj51HT19YX2oxbDYJbj/MVb
         ILKrALzB4xTHYNJ5dJGea7nmxh2LGapjkx9yONnl58xxugzoymCX5VzYbVcti+lbZlMq
         emwr9JeLyCuv4Za99yNGoyaoTOtQ/epD7WTbkp1V4GsffC6stgn4tth4HP6qEiP5juQT
         UTm6iNG9UdwD5zZAfgb00Oq/4ujbJQ5D3GX7V+hx+NxjipVK/ZeWENkJXLYiu3Cr9Pf5
         ouxawZqHCsUrd5zE72N6Gs0wLKdmZTlmFTtWK0j39Y2kNdyoMc9g8JmzpKoDx5f1YpJn
         yuxA==
X-Gm-Message-State: AOJu0Yx67ZIT5wEI1cKAPTCUH1NTg/E9Wc307hjOfCKgWdIwi14ipK0f
	Ld4CeRVSYEqNaWrpr8w3zx7rrbZAMmdg9Anx+e/5FgKZ3dRq7018g3krYc2RAA==
X-Google-Smtp-Source: AGHT+IHc8yX+S1ZXZeTcmQ5A8u1mvv0IrBsqppyFA35CEi2Tk/eV8DOVds8sW0bRplyZMtz6Ke6u7g==
X-Received: by 2002:a05:6870:eca7:b0:277:e94b:779c with SMTP id 586e51a60fabf-27810b95fe3mr3301878fac.19.1725355997608;
        Tue, 03 Sep 2024 02:33:17 -0700 (PDT)
Received: from [172.22.57.189] ([117.250.76.240])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-715e56d72d1sm8365868b3a.170.2024.09.03.02.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Sep 2024 02:33:17 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Tue, 03 Sep 2024 15:02:19 +0530
MIME-Version: 1.0
Message-Id: <20240903-beagleplay_fw_upgrade-v4-2-526fc62204a7@beagleboard.org>
References: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
In-Reply-To: <20240903-beagleplay_fw_upgrade-v4-0-526fc62204a7@beagleboard.org>
To: d-gole@ti.com, lorforlinux@beagleboard.org, jkridner@beagleboard.org,
 robertcnelson@beagleboard.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=9dsYNp252XCXLeZVdDf5E51difa2bgrBMStutB0fu1Q=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBm1tfEpliavJH9xYgy4XhOMi5G/rvxrKEVED4yY
 F8oY208HKmJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZtbXxAAKCRAFzvXHieVa
 dFhAEACg46eymI+09SiSpRzRfg6b+SpXlknETkWrd/3opSTGuqU6gc8JKgGLfTA0DtVbDUwdJ6S
 eVdFWFdn/1co7872USRxL52+ATPTj6BPWlpvqMUvc2AcCC1cr/INciz0hIMueGsnQRtxdKWhRMH
 OhkrNEHey6kHn8fF14oUhknD8ynVMe7/81uJ767biwnU2muuLDZIyW51oVQxl3ocwIPGIXB/Cl0
 rgqb2ERaN5P03slQAYquN/Jvw5xgB5H9iZ8iA+JKU/Y7DcG+qBZ9YAP3990aA/7G4dFWQmVeYeZ
 X4mjM2BhMm1HrIJ+3wPaXPaMP7AlJXjpMCanj3P0B8dOrrdBJvWo6x0J+E2lWzhFyq6du2KF+JC
 LySq4rFgP918WAH1SUC+QaWXbeBbTMS2fop8jw5hx7wmHBSlyKl3sq7iYUkruTMnN6k2+615kl+
 kB8hoLCyHHvP8zlUI9FZxVt7dG1WpKIrP2/BGwuoTpLEjQlTV2eu4vTj+J4luZjYrhnADda6xnX
 G0TkUOUI/zhh4fxpGNjWJcHZQngTFcL38gmdHvT4ielcGZqlOBrcTLaLmHSL2ZymGNKWi+M0m3L
 /nYZ2dWcvAcvuTLuw7L+GUzMdnfRaf5QIS3w8Y2XQY5pq3hapEjBbq8FkDMReUKP9ZBYAKJph42
 emwpHqgEqQnwt6g==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Action: no action
X-Spamd-Bar: -----
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 344BB40F7F
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.52:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
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
Message-ID-Hash: NMJ7ONMDDTAR4VMWXTGQ7WCYRVMT4PIZ
X-Message-ID-Hash: NMJ7ONMDDTAR4VMWXTGQ7WCYRVMT4PIZ
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 2/3] arm64: dts: ti: k3-am625-beagleplay: Add bootloader-backdoor-gpios to cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NMJ7ONMDDTAR4VMWXTGQ7WCYRVMT4PIZ/>
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
