Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4636678D5DB
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 14:24:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 56EC63EFC6
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 12:24:58 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id 6592A3EFC9
	for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 12:24:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=rhP+Mvku;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.173 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68c3ec0578bso2728605b3a.2
        for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 05:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693398288; x=1694003088; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4krt2m+n0J6VqnZMY8u/6wGVwG8SUYvmpEVLbWiOI4U=;
        b=rhP+MvkudZF3EWLIJ52sqwQ44GNl6z+hMIIuFjwETjUtj7Ib5khlHPKCpRFFqMwU8z
         MUjW4DiHup9f0PUgafr7w4aiPzlZOI66ycdJKEkA3gc6JAtVZlsGIpd95jyuJtxtSbPy
         ZBEJcy7oxlV5VadDQa9DsJrDpMj8RxnFj/LKcItn74NsNm7rNIRcNRU4s7/zhVXZWzLe
         rb7LxyrW9tQiWLHtevW58e8UEp0e7hN2CaMlkwfBj6vpacp9DgNovQVM5D+vUxlKJWZT
         7ch7JoqN5I0oL0hXKiknbuCJVOrby3ddS5KgDV3N+zeTH/sNgQBdQ5zcWzYDjFJPrRiy
         mKDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693398288; x=1694003088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4krt2m+n0J6VqnZMY8u/6wGVwG8SUYvmpEVLbWiOI4U=;
        b=jdsp8LRF15Hc4SJ3z7SWELMy6EX9ytu6axh+JoRWtomfL5mfIBGw5JmBdzFf0lV24T
         f2weyFVp3ji2x0Pa5qYlsL0FI1mUIG8l9o9PTMg++KdKXTaQTDP7biUSs//BPlnUBMSC
         Nw6QDEAXmHbCGJfk48GyE9hT6XHonb7hwB6lHchG/TIKtx5PK5X94xCTICt9w2HkiXCz
         n1Nf9VkPg9frIx+duKRXBWd+zSsqoa2n8KODytW0noirZfI5jnt4VsEcQc2yjpBX705C
         Pp1eKbPbKLDtViZKVaKOs/hGkDiCBZstPsMAbVd5UmFle6ppI7vdHHnJU8eC9NeZ4ZQm
         EniQ==
X-Gm-Message-State: AOJu0Yw9od5wwNu3Na3t0kj05rkBuE12tZ3GFq68Y4BLU+RlAsKht5If
	6HockiNucnuva2nqR6Fydhu9groiGkhlAg==
X-Google-Smtp-Source: AGHT+IF/0xiUKLnZxMF8LbD0s6BPj75NqRwHQNRa61qxpgAkWnQwL93G/F6cYNf65WMq1YMFQ1oQzA==
X-Received: by 2002:a05:6a20:2d6:b0:13a:ccb9:d5b7 with SMTP id 22-20020a056a2002d600b0013accb9d5b7mr2050928pzb.41.1693398288157;
        Wed, 30 Aug 2023 05:24:48 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id ey6-20020a056a0038c600b006828e49c04csm10071702pfb.75.2023.08.30.05.24.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 05:24:47 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 30 Aug 2023 17:54:26 +0530
Message-ID: <20230830122427.284415-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830122427.284415-1-ayushdevel1325@gmail.com>
References: <20230830122427.284415-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6592A3EFC9
X-Spamd-Bar: ----------
X-Spamd-Result: default: False [-10.60 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[103.15.228.92:received,209.85.210.173:from];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.173:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_FIVE(0.00)[6];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: BBHZ3BJO4UM5SMZS3IVOAQCAT67LE3IS
X-Message-ID-Hash: BBHZ3BJO4UM5SMZS3IVOAQCAT67LE3IS
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] dts: Add beaglecc1352 to devicetree
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BBHZ3BJO4UM5SMZS3IVOAQCAT67LE3IS/>
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
