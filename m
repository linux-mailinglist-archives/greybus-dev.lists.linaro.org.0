Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 12DE978EF38
	for <lists+greybus-dev@lfdr.de>; Thu, 31 Aug 2023 16:05:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C1CF53ECBB
	for <lists+greybus-dev@lfdr.de>; Thu, 31 Aug 2023 14:05:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id AF2BA3ECBB
	for <greybus-dev@lists.linaro.org>; Thu, 31 Aug 2023 14:05:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=K18tQlSA;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-68a402c1fcdso680689b3a.1
        for <greybus-dev@lists.linaro.org>; Thu, 31 Aug 2023 07:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693490717; x=1694095517; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z5eJvhCEg+Jd/91lCDqsoIEpU7LYUO1lmoutPi1frxE=;
        b=K18tQlSAEas1aUecodMoY0WI4mNO7hcobBFAN7ODNSCxJDoBJ9Dk2RWmBjlVm2IG2o
         jzvrP7E/8rd4DHh2KaOk0NSbyKlX8ufbof2RcHr0GMysZQjYr7KLr8tx3I8Szd4BjmPg
         l14IFy49eUtAFt9nB1V1PIBMMW6q+sgweuiSvB2bPdSve2bi3TxPg7balcR8YF3Ssadk
         TmL0fmPWM3OV1rWIvRK99rIIW9zQ9qSIEai1Mx1h0ITjdnuRArzVil072vJ9pGxJVlVK
         4OiPcfrJwc0oBFTNjp4IsUNEy/yBZhbBDmRvqnDaCM/4j4mC8Z7EeBd/3GSLBjtl4AyA
         40vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693490717; x=1694095517;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z5eJvhCEg+Jd/91lCDqsoIEpU7LYUO1lmoutPi1frxE=;
        b=P3yXZLF93+zAIbturh1yA1Tt9eUjIrKYadTyC2ddI5OGzKVLqN3ogVEcl91I6zaZI8
         6Qq9+GO+nCbN6ZSno0pIJjAvVgK7TwWJluJWKSPQrce8x5tazr6iUYRRa4B5khDJ+4lv
         Kc/v8pB+/ze4jSayT4nQMj1gpR+ZlR4xq4y+FkIjvKngSO/Z9Rip8CJrKw/4GEmXxbpn
         RTIW9gnLnSitVmMCxMR0eXFFYESDtdXLTZfXTlByXALg8cDvErqFN0oS/2dZlI9xN4Lv
         Wbr8wiwEbdKOihQ0LRSJKeXX9BbYR7ycvN8qjEzKINT/5NyCaKnu+htVA4jnhAx5PnKL
         l4aw==
X-Gm-Message-State: AOJu0YyPBgZMGuE+frF1KJiFz6YUrEjF5ZXMbQY3smC75HLlViBhxDWB
	hAiCJx5AsKXJeRQV2tFsHeBpxXFh/uY=
X-Google-Smtp-Source: AGHT+IGQFwMeT265tIsPr5DTc2qLEAC4BEAhDHTl4vEMbIqZjKCWrzzre6MsEoLfDE6j340PpDbVGg==
X-Received: by 2002:a05:6a00:14c4:b0:68b:e6e0:5047 with SMTP id w4-20020a056a0014c400b0068be6e05047mr5600067pfu.14.1693490717178;
        Thu, 31 Aug 2023 07:05:17 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id j13-20020aa7928d000000b0066f37665a6asm1356739pfa.117.2023.08.31.07.05.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Aug 2023 07:05:16 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Thu, 31 Aug 2023 19:34:15 +0530
Message-ID: <20230831140417.327283-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: AF2BA3ECBB
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.177:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com,beagleboard.org,ti.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: TGRN4U5HLDWPFGMWT5F3J3HQN4YQNSUA
X-Message-ID-Hash: TGRN4U5HLDWPFGMWT5F3J3HQN4YQNSUA
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/2] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TGRN4U5HLDWPFGMWT5F3J3HQN4YQNSUA/>
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

This driver has been tested on BeaglePlay by BeagleBoard.org. It
communicates with BeaglePlay CC1352 co-processor which serves as Greybus
SVC. This replaces the old setup with bcfserial, wpanusb and GBridge. This
driver also contains async HDLC code since communication with SVC take
place over UART using HDLC.

This patchset also introduces a compatible property for the UART that is
connected to CC1352 in BeaglePlay. I am not quite sure if it needs its
own DT Schema file under `Documentation/devicetree/bindings/serial`.

This driver has been created as a part of my Google Summer of Code 2023.
For more information, take a look at my blog.

This patchset has been tested over `next-20230825`.

My GSoC23 Blog: https://programmershideaway.xyz/tags/gsoc23/
Zephyr App: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware
GitHub Branch: https://github.com/Ayush1325/linux/tree/gb-beagleplay
Video Demo: https://youtu.be/GVuIB7i5pjk

This the v3 of this patch
v2 -> v3:
- Move gb-beagleplay out of staging

v1 -> v2:
- Combine the driver into a single file
- Remove redundant code
- Fix Checkpatch complaints
- Other suggested changes

Ayush Singh (2):
  dts: Add beaglecc1352 to devicetree
  greybus: Add BeaglePlay Linux Driver

 MAINTAINERS                                   |   5 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
 drivers/greybus/Kconfig                       |  10 +
 drivers/greybus/Makefile                      |   3 +-
 drivers/greybus/gb-beagleplay.c               | 494 ++++++++++++++++++
 5 files changed, 515 insertions(+), 1 deletion(-)
 create mode 100644 drivers/greybus/gb-beagleplay.c

-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
