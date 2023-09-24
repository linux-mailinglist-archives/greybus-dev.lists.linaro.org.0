Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 692697AC7BB
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 13:38:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D9E9B40F48
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 11:38:30 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	by lists.linaro.org (Postfix) with ESMTPS id DFD293E975
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 11:38:23 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=f5Q1gyYH;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.216.53 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-2774aa96947so390920a91.2
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 04:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695555502; x=1696160302; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JhhTXSXah4I7JqQq7Z8mOSYxnO2RCWDRvV8O3bTDHb4=;
        b=f5Q1gyYHNmt1JynZYuYI6qLHAMY+ywm0eJ7Uv/BcWrBgHXHyO8Wc+fIukvQAKohcEP
         FrWbDwRR+loxcyuZ16LCrSsmPv1FLp7l9b0jmg2IOylp5vARAMe5Ovbmo2PZmMZWQC8b
         8+siuLqm/pgMMgA8HQ2/rRuvmXoyrdKYR9V9R2a6FXpc++pO36pWeYoQsc8fQYgwIuJt
         VkNHOXzodh5e+0Sc/KIAf8qwJYWfxs1b0h3iv3hMAOQBvurjWLDRbHb8gRuLrWyN3Hbn
         aM7KUNDG1UFAOcsrOxifTqYBHoDQLzO91ZiX8cFtbnB5wuByVl4+GKU+cevmGvkkV8Vk
         IFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695555502; x=1696160302;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JhhTXSXah4I7JqQq7Z8mOSYxnO2RCWDRvV8O3bTDHb4=;
        b=VZVnG87ySnnfmmrhuFbXc4V1YUpWbbPjZvpXgLJ/2bwEGKyZTbjtgXP9qXF14ZAiwI
         98euUYgK9MHNnh3vuBAcTD3hhbPlVM5jDq6oojIflG95ShUw/iic4ao60N1vEGFtZEia
         sN7nsUM/T8LxsTVSq3VZMCiCXIKs98Y94prg9zu6fkFKnsP1r0GGFf9hO9B7U4YP0AEP
         x2EgmB4fZxLInXRBooByAjilhwgcoES/mjnQ9OF7ss7+W93bFoSv/8HLx+yZb7/Es6kI
         GmUQQ07tnfmiorATMMpt/6UZJeUsZmP2IcYqjk8VPXytWs4EnnFUS4MHDovGd9N43VTT
         P2iw==
X-Gm-Message-State: AOJu0YxXx3Gu24Y3FvMYgVGEDgVEVmPPpYwl16Z8pPHhRWdUxkVULMrm
	oQ6YWQgzz43EfrmLERW3CMP17qXdFu2cwQ==
X-Google-Smtp-Source: AGHT+IEmNQ8d7khOcZNLgbWh7MZLvEZkY2z1beZ234hDYMipdxze0OUT12np9WnjPFun/M/AImGT2g==
X-Received: by 2002:a17:90a:5384:b0:262:d6cb:3567 with SMTP id y4-20020a17090a538400b00262d6cb3567mr3760678pjh.26.1695555502440;
        Sun, 24 Sep 2023 04:38:22 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a6e4200b002775281b9easm422376pjm.50.2023.09.24.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 04:38:22 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun, 24 Sep 2023 17:06:56 +0530
Message-ID: <20230924113725.164948-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.53:from];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DFD293E975
Message-ID-Hash: BGNHBVKBO7OUXBKKBZY6BC2CO3EYZCLE
X-Message-ID-Hash: BGNHBVKBO7OUXBKKBZY6BC2CO3EYZCLE
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BGNHBVKBO7OUXBKKBZY6BC2CO3EYZCLE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BeagleConnect is both a technology concept and a line of board designs
that implement the technology. Born from Greybus, a mechanism for
dynamically extending a Linux system with embedded peripherals,
BeagleConnect adds two key elements: a 6LoWPAN transport and mikroBUS
manifests. The 6LoWPAN transport provides for arbitrary connections,
including the IEEE802.15.4g long-range wireless transport supported
between BeaglePlay and BeagleConnect Freedom (the first BeagleConnect
board design). The mikroBUS manifests provide for rapid prototyping
and low-node-count production with sensor boards following the
mikroBUS freely-licensable embedded bus standard such that existing
Linux drivers can be loaded upon Greybus discovery of the nodes.

This patch set provides the Linux-side hooks required for the 6LoWPAN
transport for BeagleConnect on BeaglePlay. Also adds required devicetree
additions.

Tested over `next-20230825`.

Link: https://programmershideaway.xyz/tags/gsoc23/ GSoC23 Blog
Link: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware Zephyr App
Link: https://github.com/Ayush1325/linux/tree/gb-beagleplay GitHub Branch
Link: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/GKOFWZ5IJMNXIWVDOM3WRNU2B2S4244G/ Patch v4
Link: https://docs.beagleboard.org/latest/boards/beagleconnect/index.html BeagleConnect
Link: https://docs.beagleboard.org/latest/boards/beagleplay/index.html BeaglePlay
Link: https://github.com/Ayush1325/linux/tree/gb-beagleplay Github Repo

Changes in Patch v5
v4 -> v5:
- Move DT Bindings to net
- Rename compatible to `beagle,play-cc1352`
- Expose CC1352 as MCU
- Remove redundant tracing messages
- Fix memory leaks

v3 -> v4:
- Add DT Bindings
- Reorder commits
- Improve commit messages

v2 -> v3:
- Move gb-beagleplay out of staging

v1 -> v2:
- Combine the driver into a single file
- Remove redundant code
- Fix Checkpatch complaints
- Other suggested changes

Ayush Singh (3):
  dt-bindings: Add beaglecc1352
  greybus: Add BeaglePlay Linux Driver
  dts: ti: k3-am625-beagleplay: Add beaglecc1352

 .../bindings/net/beagle,play-cc1352.yaml      |  25 +
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
 drivers/greybus/Kconfig                       |  10 +
 drivers/greybus/Makefile                      |   4 +-
 drivers/greybus/gb-beagleplay.c               | 526 ++++++++++++++++++
 6 files changed, 574 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/beagle,play-cc1352.yaml
 create mode 100644 drivers/greybus/gb-beagleplay.c


base-commit: 6269320850097903b30be8f07a5c61d9f7592393
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
