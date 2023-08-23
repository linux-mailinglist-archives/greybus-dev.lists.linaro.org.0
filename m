Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A53D2785DF1
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 18:55:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B4C5040F73
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 16:55:55 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by lists.linaro.org (Postfix) with ESMTPS id DA7DB40F72
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 16:55:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=ZZJXIuJn;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.177 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bf3a2f4528so43576125ad.2
        for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 09:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809748; x=1693414548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WV1agaJVquY6roJrJ8mzJ/vJzzHnaVViYEHM5VPe5eU=;
        b=ZZJXIuJnOmZJYjnXf3b8M6aKIJkM8KH3rnwY0VOJEpj0GpC85rHhykQ+D4nhwgksRO
         aDu5vPrvAIw5oNFyVqkU8ujxuXjR7feF1AwL6WryY4P0Jc8PF7rPU2QhTAoe9B6b5Rb2
         lwwfKGzUig4uLAPA5T4+oVjO5GMz9Gdov8xrHBvkHzO7aRsMNwtGgBD7E0NkCNc0Z+iW
         0PJgLpJS5WzF/f+vcBo6ywJXGmJEhMZ3IzDwNGjO8HzqHiDgxHb4yMrJf/fJgi9E9suv
         X7UJF65l2O4rRxiNgfsdIZbnz+T/nIhvw4GYTno0fw+UHSZ+zznHfGB25sOOpKbx+dUM
         3u8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809748; x=1693414548;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WV1agaJVquY6roJrJ8mzJ/vJzzHnaVViYEHM5VPe5eU=;
        b=jwo/ImgbJakHtgsJBtsq07ZJxjwLTeKTwvsySn/LmMqFgbx39+b5fwIneaNX7JBfr3
         VibxGPx5tImc0n7IOUQVAtrkhBrV1EIRbxJULqjChblL7gJCpU8sTZi3WundouvMHfky
         uNUe14F7THYzl/bf73u47vPPdaEIdEYTammLqcSal/Mg2dhf2dNWAegxYQT5XOLI7qKq
         v4fPUyNw/4YANRy80ao9H0/xxi9zpDL1HY5d8gL5beaMP76Os3dp4YVQo+dHRw+Pvbc5
         ASaQgaQzN0mPCFJBLtY9uEoOW/xGPya/hh5KN+0Z7JNhm2d0UeT4oHF01zQnsoXDgip+
         duIw==
X-Gm-Message-State: AOJu0YxESxmFEFfusbAkP1AJLj44SoyBjnaiASIVTtArWIEe7pN3+9t0
	y8omPRjz6AKmwkVEwYzKbCMKgefXohIn77xL
X-Google-Smtp-Source: AGHT+IEMz598nvTdwWluf9aWW5/TZyM5Yi2FaFPeaHvaXNNUSmvdcGiin6m8L43GUZI3WGEC7TFG1g==
X-Received: by 2002:a17:902:a587:b0:1c0:9abb:4873 with SMTP id az7-20020a170902a58700b001c09abb4873mr3831866plb.64.1692809748586;
        Wed, 23 Aug 2023 09:55:48 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id ix21-20020a170902f81500b001bb8895848bsm11256247plb.71.2023.08.23.09.55.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:55:48 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 23 Aug 2023 22:25:17 +0530
Message-ID: <20230823165520.181301-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823165520.181301-1-ayushdevel1325@gmail.com>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: DA7DB40F72
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.177:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: GQDUDEYIOI4MWQEEQKWYDPHM5SNSTBAI
X-Message-ID-Hash: GQDUDEYIOI4MWQEEQKWYDPHM5SNSTBAI
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/4] Add beagleplaygreybus to devicetree
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GQDUDEYIOI4MWQEEQKWYDPHM5SNSTBAI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This UART is used for communication with beagleplay cc1352

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
index 7c1402b0fa2d..feead1396718 100644
--- a/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
+++ b/arch/arm64/boot/dts/ti/k3-am625-beagleplay.dts
@@ -755,4 +755,8 @@ &main_uart6 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&wifi_debug_uart_pins_default>;
 	status = "okay";
+
+	beagleplaygreybus {
+		compatible = "beagle,beagleplaygreybus";
+	};
 };
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
