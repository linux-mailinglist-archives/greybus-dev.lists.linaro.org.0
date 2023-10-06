Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1F07BB0BB
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 06:12:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 651E041026
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 04:12:32 +0000 (UTC)
Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	by lists.linaro.org (Postfix) with ESMTPS id 0327641025
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 04:12:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WSLVJPQU;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.160.43 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1dcfb2a3282so1105201fac.2
        for <greybus-dev@lists.linaro.org>; Thu, 05 Oct 2023 21:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696565540; x=1697170340; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVKOeyfzPTqe/CUiQ9KqX2upeUQqv3i7YeBbchF99cg=;
        b=WSLVJPQU/fTGnqUwdmeRgBrLJ9DjjMuCdxRdFL+dkHQhMpy77x6aRRDeoKt6jASqFp
         W0npzkh8cISsY9z+B5GEsW/cg7tNPOUgJHuWrg8vuyLQses02pU9RlyUa5bUVSGU/Skc
         n+2hNXvn0PNJj7eRGm+wCcUk/HJj5aAfO6h5sy1G7UDoACubfeD1MdAhakr8WLq1sGE7
         NLY5rYfFYpSktRNE5Fmgzw0PVnrbVbpV8jzRAN+R/pLXTQ3ZlOJmDjM1YYt7WLj7fGJX
         bLdWPvIFUq+No2wSIeuvzP5Kg5jXGY0PruyU1eHna1ctf8SEN8tcLTEqagWTDLw9Ysgd
         oEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696565540; x=1697170340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVKOeyfzPTqe/CUiQ9KqX2upeUQqv3i7YeBbchF99cg=;
        b=iNCNcjfdDpmM8cnYYr1hHlbZ5AOmSNkZVsk0TsbqERxWNNQfzB7ojHCfYa1+T1DpbH
         dxVgtgrbkSCg0SDls3nAOwO+TawSOjx/AqV7CEHeQOEmAmd+neY79hJY9Xrouz+cOpLv
         SFA+qa5JVFUwggruOMzzJimp5wVv5BmMEWLpwEo5yBu4GJ6/uxPnnDRYJF4kDSrLGjUJ
         qkWjnbGEFudBOBkott+8bgwKdD3EAbh/uVSTtbfpdIQb0X50jm1+QLrdlVY51z0KfPsT
         bk0mZ81smp20GOEHKftwNUbN5AVJVYktw6EGHxbUStt60fMT3xQBFbr6U5Hs0HqeKOaV
         gU5w==
X-Gm-Message-State: AOJu0YymuQWgeXixvs0hj3n/H9jJBik4F7YK/WE4zS9tVPjejn5iPqYu
	Vmr8AJhp3U+yet2DC9H3LpjI7dB+MZ1fyQ==
X-Google-Smtp-Source: AGHT+IHKShHmFoX6g4eYJMYkSYLJOFe6EddPNVGX6m8IyulpLKYMQXzc/RE5XrQ7C5u/q6l3ytJgYw==
X-Received: by 2002:a05:6870:e2cf:b0:1d6:563b:c3a5 with SMTP id w15-20020a056870e2cf00b001d6563bc3a5mr8732318oad.7.1696565539958;
        Thu, 05 Oct 2023 21:12:19 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79391000000b00694fee1011asm401131pfe.208.2023.10.05.21.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 21:12:19 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  6 Oct 2023 09:40:33 +0530
Message-ID: <20231006041035.652841-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006041035.652841-1-ayushdevel1325@gmail.com>
References: <20231006041035.652841-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[beagleboard.org:url,mail-oa1-f43.google.com:helo,mail-oa1-f43.google.com:rdns];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.160.43:from];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0327641025
Message-ID-Hash: 7SZ2CGJZGKEAI2UA52HN3XOS5QABPQRP
X-Message-ID-Hash: 7SZ2CGJZGKEAI2UA52HN3XOS5QABPQRP
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v8 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7SZ2CGJZGKEAI2UA52HN3XOS5QABPQRP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The BeaglePlay board by BeagleBoard.org has a CC1352P7 co-processor
connected to the main AM62 (running Linux) over UART. In the BeagleConnect
Technology, CC1352 is responsible for handling 6LoWPAN communication with
beagleconnect freedom nodes as well as their discovery.

This mcu is used by gb-beagleplay, a Greybus driver for BeaglePlay.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 7cfdf562b53b..5160923b4dc2 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -870,6 +870,10 @@ &main_uart6 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wifi_debug_uart_pins_default>;
 	status = "okay";
+
+	mcu {
+		compatible = "ti,cc1352p7";
+	};
 };
 
 &dss {
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
