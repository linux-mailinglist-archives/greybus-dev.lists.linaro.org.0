Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 48907790934
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 20:29:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5AEA93EA01
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 18:29:50 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id A2F213EA01
	for <greybus-dev@lists.linaro.org>; Sat,  2 Sep 2023 18:29:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=TSvLL+Gv;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.171 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1c0d0bf18d7so766855ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 02 Sep 2023 11:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693679376; x=1694284176; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnrT7LHJjUAagSGCNBHonhWO840GVzI76QQJKTy0U0o=;
        b=TSvLL+GvvunVVYfC2p6iu2nhduuAm4tWkXTLsSYTdKGc+RhYRwyCZbC2DAbJird3eo
         y1D12Vpj1TNA5RMxw2LqBYidu3LzmnCc9GgIcSy+PlfGwZUSLtJK4BQKMh4ISYhKvLmA
         Z0w/XuIgD23ENXCDDixom5im1CsHxIY7A4zujN3kPp1XlJ7lUvOlwhNaCrur8yoQUJBd
         gRe5adqCg8DLA511x0uiqU5Ko/KToPRYYJGUki3COZLDxoXt3/KCUgJp/7uCa3zNVXog
         LX6aSGbi/RvV8wJkEhS5sRjAYc9DG2mVPaCSSjS+ulcUg0CSAltppIi7h5sZZ7F4cmhU
         HvkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693679376; x=1694284176;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnrT7LHJjUAagSGCNBHonhWO840GVzI76QQJKTy0U0o=;
        b=KiZV2/bIFS3qXUXqPzmmE77k8bhb42pc6beX+GKtnk3N1oDXrJyQ3SWPERXTj/mrWd
         JRhtfFbCG+fZ5BELXyHMe6oz4jmEQ4jimDpm3Tt/zoqw+BzZSQ3CzPuhGn2Kv+NLO4JG
         5StcK4IEw6VuKRbMCqvitnOjx1AXv784HZ8K+ZK2JL9a5gg20q7m3SORmJVBKiYASWc1
         RqxJvydx0mWc28D9wKYQwVt3A7zMbtk8s3Gjr0jVlBVtdsgLP+7KVkO103STlJD38Orf
         WQM+gdiY0ovgIJvXJJayPRbVXR7eOTli4LmPiQxfFE5guc7AMpbOX/eQFk4IosezHYdW
         vvkg==
X-Gm-Message-State: AOJu0Yx3betdayaWCiiflqORUit3RkX9HaW587C+eW+ivwYE1+FH50TY
	1UU3bkp38xu7LjU0dNkAduUiPef9abA=
X-Google-Smtp-Source: AGHT+IFyh/QK01pwrTqOJo0jEmHr/IuRlq/pYy1squww9SSU2If6HdRuDy0sTSLQ0E0NRXRHYegpnQ==
X-Received: by 2002:a05:6a20:8f17:b0:138:1c5b:2653 with SMTP id b23-20020a056a208f1700b001381c5b2653mr6667590pzk.41.1693679376415;
        Sat, 02 Sep 2023 11:29:36 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902eb4600b001bf846dd2d0sm4918970pli.13.2023.09.02.11.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 11:29:36 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sat,  2 Sep 2023 23:58:43 +0530
Message-ID: <20230902182845.1840620-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: A2F213EA01
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	BLOCKLISTDE_FAIL(0.00)[209.85.214.171:server fail];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 4YXBYAASNT3DJ6QQKD5G62NZGFIFI7DP
X-Message-ID-Hash: 4YXBYAASNT3DJ6QQKD5G62NZGFIFI7DP
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4YXBYAASNT3DJ6QQKD5G62NZGFIFI7DP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The BeaglePlay board by BeagleBoard.org has a CC1352 co-processor. This
co-processor is connected to the main AM62 (running Linux) over UART. The
CC1352 can run Zephyr and other embedded OS. This commit adds support for
the CC1352 in the Linux kernel DTS. This allows Linux platform drivers to
identify the device and communicate with it.

This UART is used by gb-beagleplay, an upcoming Greybus driver for
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
