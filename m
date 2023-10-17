Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 399817CC048
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Oct 2023 12:11:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 428AE402C5
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Oct 2023 10:11:47 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id A50FE402E6
	for <greybus-dev@lists.linaro.org>; Tue, 17 Oct 2023 10:11:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Pjs9cpbv;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c77449a6daso44128245ad.0
        for <greybus-dev@lists.linaro.org>; Tue, 17 Oct 2023 03:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697537495; x=1698142295; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TdZHxOOzFLZn0VZMmX6FQaeZ+Bg8TaP/zYXcfd62xjk=;
        b=Pjs9cpbvksEcjh56JDZ5d9oOizLXwfp07vuOx5OKUEno8wmXq64gBHDS1Ys6jRW9tP
         YjwirnAOhpoW76k8TFjukl8F5tpwWhKcoAp6agbzV805bxWEvdFESk1AhHm9MFKfC8Ey
         znEJQ+9td45ckqrvQVE18u93X812zi6g0kiPfJMJU+v+UEHD/zqAfwPDf8SgVOAgEEA1
         vhRdeHdk3saMl8TVDt6PTKRFuLT3VycKpWjt1zMgKo6ZFaOEh4EVh/4N3vW6IqCkHRY3
         FBpeXfvMm5yscQ5k1hnDbbl4bivz/0acXi6/Ww9C2zEMC93Ysg+xTxUQwv3HQJ0F3+Gj
         1ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537495; x=1698142295;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TdZHxOOzFLZn0VZMmX6FQaeZ+Bg8TaP/zYXcfd62xjk=;
        b=d0feFYpdtvJZShOGLO5KIS5KCGCA6VQtMxw506Ow2gyi+ToJRUkbqLswWEC3lCiF/C
         mRadV9QCpE+xSwiu8VKwy5zF2ElwTK5l01titRGGE1/zcWWphIwP0Qwvk1xFr2ZmeBnW
         x8sOAavNs0J0v/HS3b36ivYX38DQQPpqCL2nHdMmhtqw07i7RQH8Jb1XnSlvy3Bu6l3Q
         6F6lvfHZjKOpsOZm0OnPmWf4LNfbTzEfOY85YBg9RQ1mUC+CY2DYStSsAJmGlR/jUOZ9
         ahtfV+QvPv7oHim+53LFyB4KwOubzxILIg2UAwkymzOWHIF1xHN8X43m3tpJapPn2TIf
         j7pQ==
X-Gm-Message-State: AOJu0YyeezYimQ1XDGRLv68Yda8Ud2o7caaQDbXdjqp3XSs1eUTLG01I
	riEWYJWaptM6DJ8DuNvfxrtZ2JJN+SrmBQ==
X-Google-Smtp-Source: AGHT+IHQXTP0m+NaoCHVUd8uWZQaMgS9sF8ezdPJ0f/jGcALWbjn+T04o1aN+MFG8Kf+5mQ+l+ionA==
X-Received: by 2002:a17:903:5cc:b0:1c7:23c9:a7db with SMTP id kf12-20020a17090305cc00b001c723c9a7dbmr1742966plb.26.1697537495397;
        Tue, 17 Oct 2023 03:11:35 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001bbb8d5166bsm1127634plx.123.2023.10.17.03.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 03:11:35 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 17 Oct 2023 15:41:14 +0530
Message-ID: <20231017101116.178041-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017101116.178041-1-ayushdevel1325@gmail.com>
References: <20231017101116.178041-1-ayushdevel1325@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
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
X-Rspamd-Queue-Id: A50FE402E6
Message-ID-Hash: 5DPU3LGLP3H7Y2WGVAQFKINTMCMSG4XZ
X-Message-ID-Hash: 5DPU3LGLP3H7Y2WGVAQFKINTMCMSG4XZ
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v9 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5DPU3LGLP3H7Y2WGVAQFKINTMCMSG4XZ/>
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
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 7cfdf562b53b..d2e0b11242b6 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -870,6 +870,12 @@ &main_uart6 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wifi_debug_uart_pins_default>;
 	status = "okay";
+
+	mcu {
+		compatible = "ti,cc1352p7";
+		reset-gpios = <&main_gpio0 72 GPIO_ACTIVE_LOW>;
+		vdds-supply = <&vdd_3v3>;
+	};
 };
 
 &dss {
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
