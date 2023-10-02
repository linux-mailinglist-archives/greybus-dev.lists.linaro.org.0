Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A681F7B5A02
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 20:26:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B71D03F49A
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Oct 2023 18:26:53 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	by lists.linaro.org (Postfix) with ESMTPS id 141CF40D71
	for <greybus-dev@lists.linaro.org>; Mon,  2 Oct 2023 18:26:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=HxTiLP5A;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.52 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6c63117a659so15776a34.0
        for <greybus-dev@lists.linaro.org>; Mon, 02 Oct 2023 11:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696271200; x=1696876000; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMeCSX/w7tJc0iityHO3Qn4uN/ryo/E1f99r0zVNUKE=;
        b=HxTiLP5AMja1IiTLWGERpn+fD9z+MuYTGarkx10T4E/LI6+YA/gTlLBl5IvA4oOvGm
         iiGQ9eBv7rMiUxrVxmdqXCet3nWhJOAtgONZcjMdQs3Nkgiqs+zZQ+NTxr6QToSR8Ba6
         5nqhwKHcuKZERYcbaiRPg98c5kgsVwSEaO2D4gW5fPVlvVdmXRdkAlm0OX5zFyZFNtRn
         7nfPzkJHwSEPzdNvOUWCFfW7TUJCEWCDxoDU+IW+EhLMz8dYDiD2LH8ftRjqc6geIAM2
         ninEZAzr1esBqj0ABnWhsvD9iIdGepOLj4wis5M6zr/wsNKosaiEgbqq+7NcVDazUL31
         oqsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696271200; x=1696876000;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMeCSX/w7tJc0iityHO3Qn4uN/ryo/E1f99r0zVNUKE=;
        b=AMUF1peHSpAaYoJCbnFZSGZaHIM+1AgbY7pzCJ35A8beosq/bItdY/cqagn60aIv5j
         wpyfGipwe/vyDYJE6H7bpDz69Dp9QK2STWCgWA2LsegTmug8IndSXUqMJg1Sun4NfwhA
         //XWiShQJFnyZSKu+MzIPsDJH14C8Kq7CT+fa8wOPAapl0jC3GVDABpKZOH3sLX0mJqJ
         x/vmRel5EMY3g+j3UXJ3DG56DsuYh0OBaIowfQphHJTB2g0gHVzx+Knrxct6rq/N+1TR
         he1K6LXrq2OHOG/QaZk3xQEbuz2mLoIbAAUJaZBHbCHdjjlyObQdDNnHpIaXgjfkkchD
         Z8Ow==
X-Gm-Message-State: AOJu0YzDuJf3YD5+04VUPXy03O4cThZDFmoj3SnWgLQSlfKFXGU8PQLt
	RiP8e5Ce5RA9xD7lZn9rziAkbL6OioPpmw==
X-Google-Smtp-Source: AGHT+IEdcVWTW30EtEbPJcaFvAfF5wCjAmSmcLoYePah69Qv2s/V5Bu5Md/rFw+gtbhDKIzReGdYQg==
X-Received: by 2002:a05:6871:80e:b0:1d6:cb43:71cb with SMTP id q14-20020a056871080e00b001d6cb4371cbmr13457621oap.54.1696271200054;
        Mon, 02 Oct 2023 11:26:40 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id a8-20020a637f08000000b0057d86bb613esm17249584pgd.45.2023.10.02.11.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 11:26:39 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon,  2 Oct 2023 23:54:52 +0530
Message-ID: <20231002182454.211165-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231002182454.211165-1-ayushdevel1325@gmail.com>
References: <20231002182454.211165-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.52:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[beagleboard.org:url,mail-ot1-f52.google.com:helo,mail-ot1-f52.google.com:rdns];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[14];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org,lists.infradead.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 141CF40D71
Message-ID-Hash: SZCSDKXZD77R5ECREH7QJ57OGUU2AM7J
X-Message-ID-Hash: SZCSDKXZD77R5ECREH7QJ57OGUU2AM7J
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, vigneshr@ti.com, kristo@kernel.org, robh+dt@kernel.org, conor+dt@kernel.org, linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 3/3] dts: ti: k3-am625-beagleplay: Add beaglecc1352
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SZCSDKXZD77R5ECREH7QJ57OGUU2AM7J/>
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
