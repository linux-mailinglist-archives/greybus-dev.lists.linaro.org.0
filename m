Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A40FA7AC7C5
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 13:38:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AD49D3F1C4
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 11:38:47 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id B4A2040F3F
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 11:38:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=H1Cm4MT3;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-690ce3c55f1so3273647b3a.0
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 04:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695555517; x=1696160317; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ul33TqpD3VQ4mK3/9LxJs7GhSg/Yt+Ru6Sjot+t3GL0=;
        b=H1Cm4MT3NEDqF4nHw6QsWQT8sLODRrpPf4pCc3lVNwzrcBTLPrcDziXydZlX3fiRbe
         /Rqpg8vsUG6WrF6cAiCnSrD2qtsDRKeiQzmnfSRg/Ds363eRfYLpBMuukqbDFX5jd5xU
         hczrsv4+elAvfx52uIQkAnb54bstMz8IN4BlEPcK929COvlT4pQth/mK1LDDILnJXJi3
         hTkSu6a+kAuz36M4UCcBJ2/N7j1sBepGaAoor1U5PwZFLzjjr9hEcOzVa0WHl1GO/jgj
         r67GQdplS1Os5DNPvzmAdzOgbdFv4OR4Ge4cfn+HEuKyMTjKyVuSzX1Rk8hF+IXZ9EHE
         fqWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695555517; x=1696160317;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ul33TqpD3VQ4mK3/9LxJs7GhSg/Yt+Ru6Sjot+t3GL0=;
        b=YFzrQa9eVz+ktAF3P+atSGZUJe2Ka+6fPF0WPWTWLonxCl64+qu8o28a9RIzFAvqe5
         BtXHx2V1bQWo6A2CxqrGURpa7VBdDNsiHuF8GX0VCMQMuZy1Rz4eujeESmQ76G57G6Bk
         JzCiu2WLSTOUc/KbETTbfu+KeUphBppQA3G+TRF+Xs4aCbBKw8RGnQa7x10BdunJAzj7
         jHj6/W+Lqs+olnHdu/V3yyNd/+xPTXYLdJfCFB0Xk6YlKBZlaHnmwEe7NCJd6t8FmStF
         KlbBoZbGUSCJ+choIbZDvOem77UeS1M8HgALxk2cw3P2x2kHyuZQoZ/RwJYEdnd9mcwe
         xuLg==
X-Gm-Message-State: AOJu0YwvlBbvyJ9FTC67ZrMzu7Rq690qP+3H2YewrBbmmkhcvqveVHDh
	jSwVaVaN0hNtzBo7ns1gt48OG32RBDOXjA==
X-Google-Smtp-Source: AGHT+IESOUWBAFs+Ltaz90JcqBTiNhA05cnMgzrSgkq9/0A6aoTHEl2HZln4Na+j8B2rwkcoGAO+lw==
X-Received: by 2002:a05:6a20:8e08:b0:13d:5b8e:db83 with SMTP id y8-20020a056a208e0800b0013d5b8edb83mr3211081pzj.9.1695555517561;
        Sun, 24 Sep 2023 04:38:37 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a6e4200b002775281b9easm422376pjm.50.2023.09.24.04.38.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 04:38:37 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun, 24 Sep 2023 17:06:59 +0530
Message-ID: <20230924113725.164948-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924113725.164948-1-ayushdevel1325@gmail.com>
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,kernel.org,linaro.org,lists.infradead.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	TAGGED_RCPT(0.00)[dt];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B4A2040F3F
Message-ID-Hash: H44EI7TJKXARLE3O7GWOSDKQMHWNTWLV
X-Message-ID-Hash: H44EI7TJKXARLE3O7GWOSDKQMHWNTWLV
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H44EI7TJKXARLE3O7GWOSDKQMHWNTWLV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The BeaglePlay board by BeagleBoard.org has a CC1352 co-processor. This
co-processor is connected to the main AM62 (running Linux) over UART. In
the BeagleConnect Technology, CC1352 is responsible for handling 6LoWPAN
communication with beagleconnect freedom nodes as well as their
discovery.

This mcu is used by gb-beagleplay, a Greybus driver for BeaglePlay.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 7cfdf562b53b..5d46f907468f 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -870,6 +870,10 @@ &main_uart6 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wifi_debug_uart_pins_default>;
 	status = "okay";
+
+	mcu {
+		compatible = "beagle,play-cc1352";
+	};
 };
 
 &dss {
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
