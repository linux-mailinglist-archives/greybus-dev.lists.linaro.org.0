Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDAD7B8B19
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Oct 2023 20:46:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 18B2B3F02A
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Oct 2023 18:46:56 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 089353F02A
	for <greybus-dev@lists.linaro.org>; Wed,  4 Oct 2023 18:46:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=ZjoaqZPk;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1c735473d1aso675015ad.1
        for <greybus-dev@lists.linaro.org>; Wed, 04 Oct 2023 11:46:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696445208; x=1697050008; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PXD3JwB7k7KInA/zPG1O5KwkNXcpwCRiREJJeHB9B40=;
        b=ZjoaqZPkp6+RfxwCn9HSozE5OtqbXSiK7MfkYf5UMs8szqqOtbyZPbSRYccEDkt4Vy
         b5SXnR2RSu2xEVZS2HoVVvAajO805s+f8egXZB1sYm+bfLnkRcnAc7JaIUqXrlKElghK
         ckH3t4eM+Wb3r8TpTop3t7BVoeH5omJG9UOaE4bEE9KvczuvLCgiRgYiBt6cMbEcq6hQ
         w6wu669qO1Rc9OtyMFJCgVurwgvZPXsSD0Q6agL47Xadc7tkDTZm0C6Gf32MZREahkFQ
         OxgHOl1MclhKMefMWEmLGLefBLG8hfsbotLhh+QAwMLBgUaJg18g2iS5VMN7onVNzhIe
         7+wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696445208; x=1697050008;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PXD3JwB7k7KInA/zPG1O5KwkNXcpwCRiREJJeHB9B40=;
        b=Z8/zIPfgKxv6tK5gHKXpJceiIalVe9YiwDRr8KRUzBsUQlXViY1I5whGeZJ0dteg6T
         wybcOWpiiLOdFzV8yy19CfCg2YhezNOMA0ExKKHNwH2gzC/FVAV+5oaBkZkBV3X5KuJh
         sq0a5DPMTisTHbryzdWpM0UNeqLwSGZxQvjclE4vh6tMatzMvDsIiucwNNNPKtBZAXIY
         pLKVXccQP703u8Z/IMwuv+HUjO4A7yJiL9WzgLjUoHFvih3poB7vyVm6b7l7Qe6zVcIo
         yNmq12w3bhQuHWpH0bT4hRB1ZU/knPlyJDM9oX6B5M9cVGoJ7owxg/Hk8VzAx6WvAN/w
         jYGA==
X-Gm-Message-State: AOJu0Yz+O8zk5E6EEQvPTvRuvUa2kq2X85ZZuZRUqz6tEXYsukrnD47D
	RJ3U2/NCszqhU+/O+E28Sx0ymuZMI6I=
X-Google-Smtp-Source: AGHT+IGTFkvIxDDTNFDTn1be9zBor9vq4zlQ3n+WWE9iG14rKAErWEsBVhxYkRKjGo8y/JF8XD8WrA==
X-Received: by 2002:a17:903:110d:b0:1c1:fe97:bf34 with SMTP id n13-20020a170903110d00b001c1fe97bf34mr3774660plh.24.1696445207671;
        Wed, 04 Oct 2023 11:46:47 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id j13-20020a170902c3cd00b001b9d95945afsm4063903plj.155.2023.10.04.11.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 11:46:46 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Thu,  5 Oct 2023 00:16:35 +0530
Message-ID: <20231004184639.462510-1-ayushdevel1325@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
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
X-Rspamd-Queue-Id: 089353F02A
Message-ID-Hash: CBMC25GFHFOPHHKYRHG7UTJAOTONJKGV
X-Message-ID-Hash: CBMC25GFHFOPHHKYRHG7UTJAOTONJKGV
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v7 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CBMC25GFHFOPHHKYRHG7UTJAOTONJKGV/>
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
Link: https://docs.beagleboard.org/latest/boards/beagleconnect/index.html BeagleConnect
Link: https://docs.beagleboard.org/latest/boards/beagleplay/index.html BeaglePlay
Link: https://github.com/Ayush1325/linux/tree/gb-beagleplay Github Repo
Link: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/NYA3N2JYG3WIRCDXHYINNXYOCSVYRTSF/ Patch v6

Changes in Patch v7
v6 -> v7:
- Drop speed variable
- Fix commit message
- add clock-names and descriptions
- fix power lines

v5 -> v6:
- Rename compatible to `ti,cc1352p7`
- Fix formatting
- Use kerneldoc
- Add clocks, power-gpios, reset-gpios to dt bindings

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
  dt-bindings: net: Add ti,cc1352p7
  greybus: Add BeaglePlay Linux Driver
  dts: ti: k3-am625-beagleplay: Add beaglecc1352

 .../devicetree/bindings/net/ti,cc1352p7.yaml  |  51 ++
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
 drivers/greybus/Kconfig                       |  10 +
 drivers/greybus/Makefile                      |   2 +
 drivers/greybus/gb-beagleplay.c               | 501 ++++++++++++++++++
 6 files changed, 575 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
 create mode 100644 drivers/greybus/gb-beagleplay.c


base-commit: 6269320850097903b30be8f07a5c61d9f7592393
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
