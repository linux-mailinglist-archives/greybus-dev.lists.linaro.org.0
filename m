Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 645737BB0B2
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 06:12:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7411E41025
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 04:12:15 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	by lists.linaro.org (Postfix) with ESMTPS id 730743EFDC
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 04:12:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=C07oY0+x;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.175 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-690d2441b95so1353840b3a.1
        for <greybus-dev@lists.linaro.org>; Thu, 05 Oct 2023 21:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696565527; x=1697170327; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Eu6aaTza3btLqwJeXCa4CkRwr35Is1denoYOzgGUDs=;
        b=C07oY0+xECAGz/adoR18NveT39FGccmRvniOgF4CSjHwQU/R7fL6Y1jXRhVjjGyPZ1
         nFSFCiRoE0FSx3y9v41PUzP3LET2w5pb5BwjEoKQ80S6Zifi7T6AliUqRxHk018RZCpb
         7cteAu1Uw7QMYCPweGdhjdzHLBHUX4x/qb6XFxvyOcwM0m8bT8Kx7ELJH3uZP4DvHdxf
         d1usQMqbwSMY0siYYPzRfI/Ta/rcumTTrG1SMWQloAKwUcFEka6AGaSrE2HdmK3bmqL+
         lLL6US1CeQIGu1hTsd/lJJgIJRIY4czDW4FPLdyUB9/OI9qPhkGstMJfI+VUMRvg98AI
         2lTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696565527; x=1697170327;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Eu6aaTza3btLqwJeXCa4CkRwr35Is1denoYOzgGUDs=;
        b=HF5Tw2iLbcOCT60hAlMZpeoK8ZRJr86bJnV8MNqXbr8+tFaUN49Gsyscm7qY+bJ2pX
         uTvB9JO8y3jwpdRLTzTjaREQJzLHi8r/kwjd85r1EyqBYmfHDEi35595PvZBsIZec54C
         hu0GV8GF3Q+uwcGtO9ejLK84ONgiyTYr2R84cotmiFGJ0NDvO4RGxQP3d5sc/sb7cmbG
         X/wbGZOdRDbsmWjK6wVqE7hPp8cfURBOgxbL5epdGQU4wTxXs0q656ll54G7MQSh4lKf
         EqE6xSohWForxMt3XEjoX87uK2wq7MIKsARFPpW+6BI5rX+HyBL6J2pQtpmDMQYNXjYT
         ca6w==
X-Gm-Message-State: AOJu0YzmfN5xRxWj9s3HoZIzamZ9dNIO4aWZ9PzQcTqr454f30+KAaw9
	7Wf9aOMT5PwVoY0GKFNo7RvWsHDmouaU6g==
X-Google-Smtp-Source: AGHT+IGMGyGp+bKC07hLojC8Cr3py2DZz0u8Od/wENDqekEuvYzB0ZycWJMz3Fi+LUlScx3nmtZa8A==
X-Received: by 2002:a05:6a00:99c:b0:690:fd48:1aa4 with SMTP id u28-20020a056a00099c00b00690fd481aa4mr5494112pfg.0.1696565526810;
        Thu, 05 Oct 2023 21:12:06 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79391000000b00694fee1011asm401131pfe.208.2023.10.05.21.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 21:12:06 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  6 Oct 2023 09:40:30 +0530
Message-ID: <20231006041035.652841-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org];
	URIBL_BLOCKED(0.00)[linaro.org:url,beagleboard.org:url,mail-pf1-f175.google.com:helo,mail-pf1-f175.google.com:rdns];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.175:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 730743EFDC
Message-ID-Hash: 5RQV7OG5KI4BQWRN5ZCGZIFRMM6ERKPP
X-Message-ID-Hash: 5RQV7OG5KI4BQWRN5ZCGZIFRMM6ERKPP
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v8 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5RQV7OG5KI4BQWRN5ZCGZIFRMM6ERKPP/>
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
Link: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/CBMC25GFHFOPHHKYRHG7UTJAOTONJKGV/ Patch v7

Changes in Patch v8
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
