Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 09D8E7B8B22
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Oct 2023 20:47:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 209DA3E9FC
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Oct 2023 18:47:13 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 7E53140D64
	for <greybus-dev@lists.linaro.org>; Wed,  4 Oct 2023 18:47:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ApccWdkX;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1c60f1a2652so1767975ad.0
        for <greybus-dev@lists.linaro.org>; Wed, 04 Oct 2023 11:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696445221; x=1697050021; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oVKOeyfzPTqe/CUiQ9KqX2upeUQqv3i7YeBbchF99cg=;
        b=ApccWdkXH9HYYM2NxDbjFEuGWFq20JOeX33PsiUabfQp4rU2vYRgZEjsOklUdu9UtF
         5b39AitISebjwLCtwcoQpf6iCO7ArLGithL399JpS0Elkr87owF8lc/DiRnfH66ZV6lR
         ohWDPN6PK7AsUPZ20hzw/TRP6GtenKJPuLiP29swT9ajVT6/xbiCNjDUEt6ms8opMZl9
         o9In6eUDQAatDpaYpR3/2ZRyJiJ+itgtrW9c9MGQ01UEZ/Iyt2FftGKDkQhPekog6oP3
         r/GmaOkPSpdfwIrxQ7cwmORu963/0DDSigvgUHYthRU8e8TPjGxnAO+ZRWWbjWGdvWin
         bZZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696445221; x=1697050021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oVKOeyfzPTqe/CUiQ9KqX2upeUQqv3i7YeBbchF99cg=;
        b=odVTL3MMqpPbZilg9SnJ4myZYr4QLF0Njd/tYOrIGKoUkTadtTen7JV7LoBSCtb+Pc
         VgERdaiLrjPHCGOGngvbOx584ZsqIHJaqO+zOezvx6vit1/lWIBKWJnMo9X0If/Fz+Xu
         +HfnCh+1Ac1PjLYTZU5+jeBdfV5+8LvnmHdePId6D7Rg+Ur31EBEKQvC2yzq3xmZePMS
         dHDIzj/JjbFaXeU75546+Q5jNtJVtxwAX5SCNF738UA3uhY/09BIYCDZr76qZrlE522Q
         n0ANCrIsjvELYSCT5FLrgY+s07U1iCYixq5xar8513yOdmWukP/NgEhW8ke7FWJ3YFXx
         DqVg==
X-Gm-Message-State: AOJu0YzrllSeKdjZeDwybYGkLBl7YIpRzwkgSKTQLW9CZQvq45Tn1Rxh
	ix+fQHlcvYjr/+Nk8GJfIxSJBqK+abIeyQ==
X-Google-Smtp-Source: AGHT+IH5EysKla9gMnaPAFHRGkBdj66Ujtdad+jmPuEGAF4TxRvkG3qWjbp6PhDIh9aPwK9b657aJg==
X-Received: by 2002:a17:902:e80a:b0:1bc:4415:3c1 with SMTP id u10-20020a170902e80a00b001bc441503c1mr681699plg.7.1696445221141;
        Wed, 04 Oct 2023 11:47:01 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b001b9d95945afsm4063903plj.155.2023.10.04.11.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 11:47:00 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Thu,  5 Oct 2023 00:16:38 +0530
Message-ID: <20231004184639.462510-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004184639.462510-1-ayushdevel1325@gmail.com>
References: <20231004184639.462510-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org,lists.infradead.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[dt];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7E53140D64
Message-ID-Hash: IYYGAHLAKEGM66NTGH3XXEEUKC4Y7B65
X-Message-ID-Hash: IYYGAHLAKEGM66NTGH3XXEEUKC4Y7B65
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v7 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IYYGAHLAKEGM66NTGH3XXEEUKC4Y7B65/>
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
