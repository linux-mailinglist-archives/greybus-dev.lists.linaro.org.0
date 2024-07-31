Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B989A9435DE
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 20:53:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CE5654486A
	for <lists+greybus-dev@lfdr.de>; Wed, 31 Jul 2024 18:53:27 +0000 (UTC)
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	by lists.linaro.org (Postfix) with ESMTPS id 403004482F
	for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 18:53:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=O1667mpK;
	spf=neutral (lists.linaro.org: 209.85.215.177 is neither permitted nor denied by domain of ayush@beagleboard.org) smtp.mailfrom=ayush@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-7ae8dd8724dso234205a12.2
        for <greybus-dev@lists.linaro.org>; Wed, 31 Jul 2024 11:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1722452001; x=1723056801; darn=lists.linaro.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Q/3E3b2eo/TFXOq6VQUHvlRBXDZ59E7fsnrItLmpMw=;
        b=O1667mpK3RzbBfnxlmEUR2GRaK00+Jpf/RtZ0LHsV5DmidiVeyXnDoSyeOqDQHVqFE
         s6NCsotC236+uvhTpDGjmNndvkoZJkUAOgcCvMNf3xz2Vje9BIk5nZeRyAVo690GW8vB
         Wbpv5e+FvsgMeM5P1xFXdj0FJ6L3h8w4EatmuFa8zYBwqRbGeOMTbbE6YdJ8nxuZobOA
         mkQbSO9mK1YgYNgdAvFeau0LRiSIiceVbMWAJg7EL4wOOFr1nWNn30tbcjlXmUXg4Kyw
         BYRJ4tzka4ap52XJT8AQmHsTUeqLG2G1y3lD5JT2Fv9bFfPtRQ9HWEqF9rU7NyUe4nTk
         rW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722452001; x=1723056801;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Q/3E3b2eo/TFXOq6VQUHvlRBXDZ59E7fsnrItLmpMw=;
        b=V08gSbYEK7IpzKRAcxGOuXckqJg0MAVdM4M9+14ubL0MGq3ifTRd9yDtaW8GtuN+Sl
         6fY7z0GLpRA9JyG8AoN0oPfcypSY1R9H2veWIq47jHMRasN+NVJdAL+ndQLTHq3Stwzc
         uYqTkkHcBuWcq/QOxEpnbRQOp1kQaOUnfOc0Fa2lIqNzEHV7mDZUu8nfSyDg3Zs8DZwE
         uMU5HcEz8gDxD3UCW4SeYx4VRkOXjiZsjnomcjGEYi+meeSYRRA32rY4p8lnh0vieK+G
         VL71p80le/S3I0PxYUi8mjLSuu9qU3Z9YJpKlAGAj7LR8cIRI6+a4t/DMd+cPorv0tqF
         7v+g==
X-Gm-Message-State: AOJu0YxRM6uR6fUQYAl80GcIS84RMs7SR8FqGJ7YGj3fStM/cA9HN59x
	4RKOGZ0XMyUMm8pQCcbLs/qpZYU4vTV+0GGqycGMeiUi0u7Yo6MyORTTJJKQfA==
X-Google-Smtp-Source: AGHT+IF9e5nH0+houYf35o7HSbuUJwbUbuVuAZal2IMrlR7X8KHx7hsAAxE0bVJaQ0L7OkSUFPL55w==
X-Received: by 2002:a17:902:fa84:b0:1f7:1a37:d0b5 with SMTP id d9443c01a7336-1ff4d0f0395mr1556395ad.4.1722452001387;
        Wed, 31 Jul 2024 11:53:21 -0700 (PDT)
Received: from [172.16.118.4] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7ff3d64sm123182825ad.299.2024.07.31.11.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 11:53:21 -0700 (PDT)
From: Ayush Singh <ayush@beagleboard.org>
Date: Thu, 01 Aug 2024 00:21:06 +0530
MIME-Version: 1.0
Message-Id: <20240801-beagleplay_fw_upgrade-v2-2-e36928b792db@beagleboard.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=889; i=ayush@beagleboard.org;
 h=from:subject:message-id; bh=kPfCx03ybr3MIpJmR8pHHfQuNtULEfQX762YDGBxnKs=;
 b=owEBbQKS/ZANAwAIAQXO9ceJ5Vp0AcsmYgBmqogQIw+1kSBa5l0LPqEzMyulYyOyGwpLiDqAl
 +XMMMoQrviJAjMEAAEIAB0WIQTfzBMe8k8tZW+lBNYFzvXHieVadAUCZqqIEAAKCRAFzvXHieVa
 dGsLEACnI9KpgROhjrZozoczEI/u+dRf5uh/LYSnTLW2PsdGjwsBfhmhQMq66oWyjLzpHwix1Fm
 0F6PQev4zZVxoCKwaPMSxVaQG5eXCqM6CQL9saBrCgxR7Loh1EdSKuvwh2LXqOsIoBzhSgbe+Rq
 FYcxHFNfTel8mwZIMXKlL2KFWKyW16GzrCWdIQGJjc11ZgLI7Bj3OcnnjsnuFwBoXm5keHYI7+2
 GB4/dHSbxr9NwzmYea3rnVUWKk1J32XaGvuCfVWgL65a5T638EIYLg/0dUZ8DhuJkWdVJizaWOU
 tHFKvYmmC6LWOwRwHeKnDlpelKyMb9rfzcXXRSAh4oRW41LdXX2/eIEnaACTN0d8XOII6hztQdE
 1BtyqUdBF64RcCNae6VHtrEsq+11n5oClFLBQfeFPrJUGy8H0ORrROp2rZtZpOUFy+emJ6irmi8
 CvUv9Z0mFVM6/LkNQYZ5dMbhJ/awOn0R7B9paKmAj1FZ/FMlXREUv9RjncR/e5o9PNZMN8uh/xF
 xCVOQJOj0zExhhMB7+sQ+j/6vW25brLoN5+/bzG/v9ICNe5xgCjUS03udutATd17Y39cNdse9fQ
 4y6c3Sr6EzVe2Dg0fyaqQxNgN8p3BuWpUicmgbeArXp5ZbrNU7lEK3UZ7CdUlM73oQA5QXdSxRM
 dpFIs3qKAAPNskw==
X-Developer-Key: i=ayush@beagleboard.org; a=openpgp;
 fpr=DFCC131EF24F2D656FA504D605CEF5C789E55A74
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 403004482F
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.80 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.177:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TAGGED_RCPT(0.00)[dt];
	MIME_TRACE(0.00)[0:+];
	R_SPF_NEUTRAL(0.00)[?all:c];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	URIBL_BLOCKED(0.00)[beagleboard.org:email,beagleboard.org:mid,mail-pg1-f177.google.com:helo,mail-pg1-f177.google.com:rdns,beagleboard-org.20230601.gappssmtp.com:dkim];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: LS6EJ2343YHLETNDWLFXN6I2RJDYUGLE
X-Message-ID-Hash: LS6EJ2343YHLETNDWLFXN6I2RJDYUGLE
X-MailFrom: ayush@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ayush Singh <ayush@beagleboard.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/3] arm64: dts: ti: k3-am625-beagleplay: Add bootloader-backdoor-gpios to cc1352p7
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LS6EJ2343YHLETNDWLFXN6I2RJDYUGLE/>
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
2.45.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
