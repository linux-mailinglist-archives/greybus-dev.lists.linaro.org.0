Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B6C937604
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 11:45:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F28434418D
	for <lists+greybus-dev@lfdr.de>; Fri, 19 Jul 2024 09:45:47 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	by lists.linaro.org (Postfix) with ESMTPS id 27D5044194
	for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 09:45:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=gRVOW86v;
	spf=neutral (lists.linaro.org: 209.85.214.173 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fc5a93ce94so1842175ad.1
        for <greybus-dev@lists.linaro.org>; Fri, 19 Jul 2024 02:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1721382344; x=1721987144; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jz9ch4dVrBxP6urYri9BwgC1U24Q+OuXsXlD8NvO7qw=;
        b=gRVOW86vpj3J4pl0rxOjCxE6mR8o8IdSgLyfe1LRvP1s96eZ84a1LDEyQjRscphYFw
         mVX2jFBFeeISy6s/lXJVFmJbGvZjPawm3U3l7NmJtWWF3FuqVTJ1+iI6anJ+s6Nu3WjS
         QBl7e1SsuRk8h085FE1Cro5wiewfkAa0CwtdtCxZlWlXaD170UF3oqlJ67nP1Pc7m6Nd
         /wF8ZiEh5xamUIdEjVs1O+2B+NFcOK2g/Qif4A2WHBp4pOOMaJPYl2gQ07QAGvNQxBYm
         ZkEn7lB5StWhGL2+55SDflPSmK6cnu+yNSXtN9LOkt3RqYcqc1ZV9V664DmW/SVQXfn5
         BDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721382344; x=1721987144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jz9ch4dVrBxP6urYri9BwgC1U24Q+OuXsXlD8NvO7qw=;
        b=N/L22mGAwsfeFGLKDC6LMoDOV+kSYqn/E1nWWbwuPrKQCX8y1pPXtfphcDhKzLeDxd
         iX1sws2Zz3NNWanyRjkSqyQF+C+Zvvy0Lw02XNVoTiRLRMmoFJjcO33yudXE9fp7nkVE
         a4AC/PpXGQBtIVvrOqlIPQDAX1zZGbdPt+ObbrlIxz7yPSg6J9Xet3ExrJiu9OZ7z8Ut
         CogbcNEaGYDzqqy5MCQONuYU1mWK4T6RUF63tmXbu00M7D65eViuHLQZmZo/p98hXdAF
         Ox6d0dzy0uyFFePcTv4gu0bpnLBa0w7xamfhEmaPKWhsmxisfsYWC/qcKVMcgRwRS4Ph
         f70Q==
X-Gm-Message-State: AOJu0Yx0EmyKj6DJyCZ2yNOKwgtGrm3Ifmoowy7F/OEWzawFBpt2UjRl
	rGpPuF+24l9XTWKXQ9MfyiJkxKjbIwIcDCwTK+z4I4TtRXAjHZr/089S4EdNUW1JnbuxW0M+3J4
	=
X-Google-Smtp-Source: AGHT+IG0Dk0pyXiY9meaZxdcfjUrxlBVZ658N6RulLlCRYXcYG3KDTx6qBif55oSv0WqFWNFaxs8wg==
X-Received: by 2002:a17:902:b195:b0:1fc:5b41:bb1b with SMTP id d9443c01a7336-1fd5ec8ab33mr13930375ad.4.1721382344055;
        Fri, 19 Jul 2024 02:45:44 -0700 (PDT)
Received: from [127.0.0.1] ([2401:4900:8899:6437:d031:b9ec:7ff1:6aa1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f28f67esm819025ad.96.2024.07.19.02.45.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 02:45:43 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Fri, 19 Jul 2024 15:15:11 +0530
MIME-Version: 1.0
Message-Id: <20240719-beagleplay_fw_upgrade-v1-2-8664d4513252@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=859; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=ktL075+vgq6cWYqcECtw9d1aoTJoi7kLRDiZQD8+fpM=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmmjW1ukKzxE3mHOQzG3KoTViMg43jWSqDVpuRC
 H3CShKNvxqJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZpo1tQAKCRAFzvXHieVa
 dNvOD/4zxih/AxWFlgeOf8/JryAOSm7ENtd7lwPSWatsBhNCh8aGUlUXec9zUg0uiHPK4krGM8T
 oepqoAJuui8ay+aQw6MrhEDV01Yg0hIDh8iQLJiKnHUAXpLbTgjhhc3qFeQ7Mt1/MkHVD6Ga1yF
 k0d2dK0/ZpmaG5GNk2qc1iGnAPC68lfkmc2dDWiRTzCJDFoR7Hw1twsdC8yQ2Sx4qyfTcak21Nj
 uI/hFtwdfS66OqU8wOpTSiMGKgEtt8dsKlKkmNEkKPoAjxTuO1/AzbOhE2XNxk03ZPq3cCXyaJa
 zjsA65hVmS1OEFd8oiPQUJVwOp7yuyBelJWWw6nSoSbZAuGPPNQknjSg+J8dnrdP508nFlonKjv
 MIQh2p+Joh3hPnkEUZrC4u+6LsAvk9MsWCVHmgFmif7guLXCQghuEADsq3nMoBwyXsM4vdEVjYu
 5MTSzqvORZG86x4p4xFlaGoWDAnhEa4aiB5CL/nuvmNg9WyX0S+4zbUM4h+WNYrOhKU5AVlynpG
 ETumL9S6LuuZHR8wzMyD9wFwEB0Uue8YRlNDmEwrRYY++aBD2mIHgqCoOu9zeb+YOXWwBpJkxJr
 TQoTwYMyuwOOxaIzNBBIlK/T4vJyz8QYvS7Sqaq/DVbHaJoK5SvYaLYCzHAHc4VH7E4ZLePim33
 VBXzufQnYREtRHA==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Queue-Id: 27D5044194
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.173:from];
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
Message-ID-Hash: WAELJN5PS2ZTN4JAIP624TXCCPEMILQW
X-Message-ID-Hash: WAELJN5PS2ZTN4JAIP624TXCCPEMILQW
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] arm64: dts: ti: k3-am625-beagleplay: Add boot-gpios to cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WAELJN5PS2ZTN4JAIP624TXCCPEMILQW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add boot-gpios which is required for enabling bootloader backdoor for
flashing firmware to cc1352p7.

Also fix the incorrect reset-gpio.

Signed-off-by: Ayush Singh <ayush@beagleboard.org>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 70de288d728e..6c9d1dc26379 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -888,7 +888,8 @@ &main_uart6 {
 
 	mcu {
 		compatible = "ti,cc1352p7";
-		reset-gpios = <&main_gpio0 72 GPIO_ACTIVE_LOW>;
+		boot-gpios = <&main_gpio0 13 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&main_gpio0 14 GPIO_ACTIVE_HIGH>;
 		vdds-supply = <&vdd_3v3>;
 	};
 };

-- 
2.45.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
