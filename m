Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E767CC03F
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Oct 2023 12:11:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D9B1140433
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Oct 2023 10:11:30 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	by lists.linaro.org (Postfix) with ESMTPS id 358A43EA1B
	for <greybus-dev@lists.linaro.org>; Tue, 17 Oct 2023 10:11:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=NqLAot7m;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.169 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-53fbf2c42bfso4095082a12.3
        for <greybus-dev@lists.linaro.org>; Tue, 17 Oct 2023 03:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697537483; x=1698142283; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TP+yHaT3MV6NArdvH5yoIRCANwfJASikQilnTxXadnY=;
        b=NqLAot7mWv/f1crS1GhlWeqknUmH8m9/ShlqIsZtNWq3FWoRcGDXx9XQqTS0wZWgo9
         V5ZD3n+Z5cdWostcOBem1CkEjY3TVzxM/I+CWSWqvMZr2OyMQBsDn3WsVEUd/lyPP4qi
         q5v9h26a2fPOIMF2tPDc29OHYaymeBYuCsUpHh0/k5uljI7vmcNqD4k+3mCW2lKgrLv+
         lAJcijMDS/hVNise/xWad6TM4bVtan0UYC/lq63MDfIXPq9IbPws+2H3Ho4RNOlRZAWe
         2RZl0RkUcSwJ187RWd4blhGDRcZ0Ar85V9NYEjLPWyQynwHhPf9zl5id95Y5e1b9dr3S
         Om/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697537483; x=1698142283;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TP+yHaT3MV6NArdvH5yoIRCANwfJASikQilnTxXadnY=;
        b=Q5fDZd7t5kBvMFkUiBm7TfwUSt6r/Ai6SJdKzM26k2FYw7DLQe2h+RVw61tycWFymw
         qUzGV9es1cpqHGheKOXivft7nGPIlZ6m4bMyv3u/GMcNa4kBhXbLSwjWh55TJYRnKb2W
         LTwX5CDTv8uav8l7rdUzgVrSCgxbTVID8f0qJi6Bx7lied919dkrpTcNWJDUMpPKAqKF
         N5FmIxkgqlED25Ja7AF9NXEfY4Sstt1vY7hzCFJWABYcEt5q4o1Th4v8/6tXJu5uMX8/
         DCqBiI9z3DtFbz7mpuLsQQ1D81jTMlcE4z8/XPLkXGi9Z8DITts1s9ZJvaL5/ec0LgrC
         Z0xA==
X-Gm-Message-State: AOJu0YyVpZ5aLAp1Tn3GTyPpU3ACfTMOR8Th3u1E+ZvHQx+jYONSYaQi
	Vj+DBsr9rqlsQ5epRqtNS58EVLx7AtgbkQ==
X-Google-Smtp-Source: AGHT+IFv5Ij+lYOunw/pXkSzHDIoX8M+fWEaXeai9SMXKos/VOq7HPRDaYj9nbQKVbQcXvs0HxdQrg==
X-Received: by 2002:a05:6a21:3b46:b0:171:6b28:75c5 with SMTP id zy6-20020a056a213b4600b001716b2875c5mr1404253pzb.56.1697537482804;
        Tue, 17 Oct 2023 03:11:22 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902dac900b001bbb8d5166bsm1127634plx.123.2023.10.17.03.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 03:11:22 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 17 Oct 2023 15:41:11 +0530
Message-ID: <20231017101116.178041-1-ayushdevel1325@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.169:from];
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
X-Rspamd-Queue-Id: 358A43EA1B
Message-ID-Hash: PCT44XC76LIO4ZMNHMBMO2QFZ3SRGVVA
X-Message-ID-Hash: PCT44XC76LIO4ZMNHMBMO2QFZ3SRGVVA
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v9 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PCT44XC76LIO4ZMNHMBMO2QFZ3SRGVVA/>
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
Link: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/5RQV7OG5KI4BQWRN5ZCGZIFRMM6ERKPP/ Patch v8

Changes in Patch v9
v8 -> v9:
- Some capitalization in dt-bindings
- add reset-gpios and vdds-supply to beagleplay device tree

v7 -> v8:
- fix clocks
- fix reset-gpios
- depend on serdev

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
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   6 +
 drivers/greybus/Kconfig                       |  10 +
 drivers/greybus/Makefile                      |   2 +
 drivers/greybus/gb-beagleplay.c               | 501 ++++++++++++++++++
 6 files changed, 577 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
 create mode 100644 drivers/greybus/gb-beagleplay.c


base-commit: 6269320850097903b30be8f07a5c61d9f7592393
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
