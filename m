Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C167778EF39
	for <lists+greybus-dev@lfdr.de>; Thu, 31 Aug 2023 16:05:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D30C03EFD3
	for <lists+greybus-dev@lfdr.de>; Thu, 31 Aug 2023 14:05:29 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	by lists.linaro.org (Postfix) with ESMTPS id 011F93EFDB
	for <greybus-dev@lists.linaro.org>; Thu, 31 Aug 2023 14:05:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=P2c+xeAc;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.179 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-68c3b9f83f4so672221b3a.2
        for <greybus-dev@lists.linaro.org>; Thu, 31 Aug 2023 07:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693490720; x=1694095520; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4krt2m+n0J6VqnZMY8u/6wGVwG8SUYvmpEVLbWiOI4U=;
        b=P2c+xeAcFQ8ipyLqo30LXy6gDPwGMC7M3K3C56Oo5jEpxQZCug78ueu1ZKHVxm3o7p
         pHRq8dGquQNbZGDtkL84UQfXoI7DKb1hRsYzMqoYhNnhaqpgnHqVctY0ZOHhNVbE1GV2
         QJhUtqqYDzCWoGG+8UxM2vePMCMhxBKHsh1eKnPqrq5saEUKFoKxV2UBrCFaPc7JE/EY
         A//YZavGGfXVcdvNmghMKh4yZtfBr8Hw8fpooNeTal2g75pj+h/Su2YQBsTYcROFlWJ9
         XJ8e8qTiwB3tWkn6VO44k7Ol3xRRulcjo3crmRWqoJwUyMoTnKIGTvcGGH+jnpimo+S1
         1nHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693490720; x=1694095520;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4krt2m+n0J6VqnZMY8u/6wGVwG8SUYvmpEVLbWiOI4U=;
        b=KpmWcGdAMCidcfEAr2fgNORvaO2bRo47NudomXU+pmqz3MOJaZT74yg+/JsXMr7akf
         JlCBmPO3gratg/jOJzQgo+NG2288IZgLWcE9VakbCocS8KPx6OvHScMi0PiYccIY7JHZ
         DZNkUFMRh/Kk9U413UK0ZsXYsacCeZZTKz/cpkoEd+Q3KSY/DYhYu2BoYudCq9dtMoMy
         VX82L8OoW5crDSRzLqTMabhPAJCMTrFyTngH//LUVjasSXCGHZlXWbVllCawLStVL8KU
         ozznYWp8g2GjeMmHFBPdgIRHbEzHEVnrXshW/iPvFVGqU/CyEdWmFCce8rU3TwdLMOo+
         1OsA==
X-Gm-Message-State: AOJu0Yy8I+CZ+mNAgQk48VyJN+LPcjVxbKGKa0ydvY5U33oa8lBllTAG
	zdm5Qm31hZ+WesGvv0A5D2flgjffFO8=
X-Google-Smtp-Source: AGHT+IHeWD7rM+Q5Jkjq1bFeWRK8H9dVUjYKICo9GVZs+FL9XYDUtKkv+jzS9ON24+FuBPPGvXH/Wg==
X-Received: by 2002:a05:6a00:14c7:b0:68a:2272:23e9 with SMTP id w7-20020a056a0014c700b0068a227223e9mr5267223pfu.17.1693490719635;
        Thu, 31 Aug 2023 07:05:19 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id j13-20020aa7928d000000b0066f37665a6asm1356739pfa.117.2023.08.31.07.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 07:05:19 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Thu, 31 Aug 2023 19:34:16 +0530
Message-ID: <20230831140417.327283-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230831140417.327283-1-ayushdevel1325@gmail.com>
References: <20230831140417.327283-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 011F93EFDB
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.179:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: Z25ZQSDOIY37YIBJII7CTIE5J7UUQA32
X-Message-ID-Hash: Z25ZQSDOIY37YIBJII7CTIE5J7UUQA32
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/2] dts: Add beaglecc1352 to devicetree
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z25ZQSDOIY37YIBJII7CTIE5J7UUQA32/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This UART is connected to the CC1352 co-processor on beagleplay. This
co-processor can run it's own firmware like Zephyr Application and thus
needs to be discoverable by Linux Platform drivers.

This UART is also used by gb-beagleplay, an upcoming Serdev driver for
BeaglePlay.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 7cfdf562b53b..10abbb8feda5 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -870,6 +870,10 @@ &main_uart6 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wifi_debug_uart_pins_default>;
 	status = "okay";
+
+	beaglecc1352 {
+		compatible = "beagle,cc1352";
+	};
 };
 
 &dss {
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
