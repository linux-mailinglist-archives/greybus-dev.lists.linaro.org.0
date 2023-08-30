Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F200B78D5DA
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 14:24:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9EBFC3EFC9
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 12:24:51 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id BB4063EC22
	for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 12:24:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=av+h2puj;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.173 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-68a440a8a20so4675401b3a.3
        for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 05:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693398283; x=1694003083; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RqkDHQTi/u02kcMTt1a9hA9rfjhqs2+lJNc8gDCN59M=;
        b=av+h2pujtY9QPtnPws2k12tb/JqlbQQtTAf/XBoYB6mDO+Zpnu5sxicdtXIAntXu9D
         ks8tRSkjihnd5mnBq7TBCFgg9cmGcxi9RhVyUIe4Ix4Z/LEgMOPyvCkb+YcgbQrGd2kO
         V3z/trVL5wZWpXQwjhjKNiVO9o8iLMfEdrN88FVswAtr1h3kUgahkMRKtgbryoI53gl5
         4Cik+3d7KPGuykd5inju6IEQ0Yf1NB3JVBE3WStH3VCnMw+3ovpmgM8yXTxJSmdE+ZR5
         Ry8HqPm0ngckaUHHil906AtXmMr0JAmzNJdCk+oxmORilsLKordzg7S1fe9BVGsUpUq6
         50/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693398283; x=1694003083;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RqkDHQTi/u02kcMTt1a9hA9rfjhqs2+lJNc8gDCN59M=;
        b=aRY+27J09bapJzvfGL8dHVCkF1nThKWg0dR7VRzgazZanMw4c8dc8ZzjW3hGBbYUDF
         pdMAVg7EQR9vBmmbv8ALyS0vKBZ45BDzzRMBL+CFlYqX4dUeWI274+5Ctc0Jl0gzyi0l
         dXPSQNfFaiioKq5T3ymPkx4ZHNiaxeguGa287/wQejm2w8RAKg4jUetz5mGtq+QjacU4
         OQ+1XhDIqLaUKl9B3JCCeq1lBFLdYcYdgMidjXn0rvbnjp9JbI53AcAJTHm2PgBU7koh
         Tr2ypetPltvAudWycmU8wOBaRWDh1TpIuwgH1jDc/PVu88S5OMSI7/QtjIy3OEXi3RQH
         uxuA==
X-Gm-Message-State: AOJu0Ywf+EtnrOryWFCjNLiulDXapSe/6zVoEwIx0RgoTaDpfF9vevQL
	d2OMO26jCfLAodx+NWk7r6CwPKyACJu2ow==
X-Google-Smtp-Source: AGHT+IGU+BRgw0V/tmAfEANeyG8gAVVn1n8whR8stagE+oKkoOb8LbMK6gSOj22tdav4wj8R5AKgyQ==
X-Received: by 2002:a05:6a20:442a:b0:149:7fea:d88e with SMTP id ce42-20020a056a20442a00b001497fead88emr2778381pzb.24.1693398283351;
        Wed, 30 Aug 2023 05:24:43 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id ey6-20020a056a0038c600b006828e49c04csm10071702pfb.75.2023.08.30.05.24.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 05:24:42 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 30 Aug 2023 17:54:25 +0530
Message-ID: <20230830122427.284415-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: BB4063EC22
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.210.173:from,103.15.228.92:received];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.173:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: YULDO645ZIWFUNVTE4RS7BY4KBEA2I25
X-Message-ID-Hash: YULDO645ZIWFUNVTE4RS7BY4KBEA2I25
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] staging/greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YULDO645ZIWFUNVTE4RS7BY4KBEA2I25/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This driver can be used in any Greybus setup where SVC and Linux Host
are connected over UART.

This driver has been tested on BeaglePlay by BeagleBoard.org. It communicates
with BeaglePlay CC1352 co-processor which serves as Greybus SVC. This
replaces the old setup with bcfserial, wpanusb and GBridge. This driver also
contains async HDLC code since communication with SVC take place over UART
using HDLC.

This patchset also introduces a compatible property for the UART that is
connected to CC1352 in BeaglePlay. I am not quite sure if it needs its
own DT Schema file under `Documentation/devicetree/bindings/serial`.

This driver has been created as a part of my Google Summer of Code 2023.
For more information, take a look at my blog.

I have made most of the changes requested in the first version of this
patch and simplified the code as well.

This patchset has been tested over `next-20230825`.

My GSoC23 Blog: https://programmershideaway.xyz/tags/gsoc23/
Zephyr Application: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware
GitHub Branch: https://github.com/Ayush1325/linux/tree/gb-beagleplay
Video Demo: https://youtu.be/GVuIB7i5pjk

Ayush Singh (2):
  dts: Add beaglecc1352 to devicetree
  staging/greybus: Add BeaglePlay Linux Driver

 MAINTAINERS                                   |   5 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
 drivers/staging/greybus/Kconfig               |   9 +
 drivers/staging/greybus/Makefile              |   3 +
 drivers/staging/greybus/gb-beagleplay.c       | 493 ++++++++++++++++++
 5 files changed, 514 insertions(+)
 create mode 100644 drivers/staging/greybus/gb-beagleplay.c

-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
