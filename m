Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C08D187D3E8
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 19:49:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C46F14520F
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 18:49:38 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	by lists.linaro.org (Postfix) with ESMTPS id D22F840A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 18:49:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=OZjooycc;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.173 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6e6ee9e3cffso1337421b3a.1
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 11:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710528569; x=1711133369; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vkr1Nn4aLr68egb6cv/rvXMAargek6kpQuKuYfi/gnw=;
        b=OZjooyccYI8m6/lz9QW9houbH9mWtY/Iyve4wfB9mUj5Fip1kD88MJQzaqeyfMRBZk
         RAee5HO1MjIUB+GPQjcvzMWvz6X3bRe0EGqfTNw4O4RX7B26jadfUmElQgOD2eYjGEm8
         EzEXD8EARnF0uGOrdXtkvJ4OmJpMSAb/M5tAeL7RDUu6E63bZI70OLtcGEpLqpzhypae
         mr6eJ9EN9fQXmI0JJrNBnk/p6njetp2vQ9JGAk8j5zcr8s82ZiBlVrQqvTKb7bMhU/1Q
         MH+dMcZACCtAhUMhJKo7caOxg1QdClnc6BBlRunT2aOsGh3F9tZh7CYaNkMussPd9cZD
         6rLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710528569; x=1711133369;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vkr1Nn4aLr68egb6cv/rvXMAargek6kpQuKuYfi/gnw=;
        b=AvJlFrHwwRjxSJwc7/jsOEhWqR7gX9K35EWEa2SxfRys0bpikPpt7yDm0Mnb1D7t2G
         7dEieZYq6dRmINbJ8AUp21PccwejqFxeY1jKJf6iYKQRavCHIe8oByiU6Ay2906ulqdE
         OSYywnF2yiyTFokxM5soZ71kPhCqpKWaz/BFanEhYTMKSymohjRKtQ2IhA+dv9PAYdh4
         Nqe9J4X3zyssNn3OJvPphwe33f2LSSh7hCa+4dKQes9F1PVIBWaepJW4BYz4wV/wRv41
         oWfAheMjkp+aSxToHgUG3AtwI+uYdCFaP0XW8STJL7idsKE0uHSw1XuME2N+jtZztJmO
         ehVg==
X-Forwarded-Encrypted: i=1; AJvYcCVBmOidyzZ66r5uxQ5sCqZPM1oDzHuPBOsH9dIY3eGbBEIt4S7QWaqm5g0+w05Se7WY6FpphM3kf4I1XnDFCQKV+1KDlDi4col0yhHn
X-Gm-Message-State: AOJu0YzWiGq3Ke8suQb0PN0iXihVWOqL+Mbnzc4EbUiV7iz9FNOrqDtQ
	G/tb64EDH0z5/szSYxTZtmj0R1PSH+bdyF/EADHkKU5o8eMqsQfz
X-Google-Smtp-Source: AGHT+IHsm+HO3GDXSv/GZ4EFy5jwTiMdLS+yIDpRIDjfiLH/zmrN5f9qf6zHblX1mbdu531OocugkQ==
X-Received: by 2002:a05:6a00:a18:b0:6e5:1196:6cf5 with SMTP id p24-20020a056a000a1800b006e511966cf5mr14112902pfh.3.1710528568856;
        Fri, 15 Mar 2024 11:49:28 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id f17-20020a056a0022d100b006e6cc998be8sm3580784pfj.207.2024.03.15.11.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Mar 2024 11:49:28 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org
Date: Sat, 16 Mar 2024 00:18:58 +0530
Message-ID: <20240315184908.500352-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D22F840A53
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.173:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
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
Message-ID-Hash: BBEPR6XOTEZWXPPXVAFE2MCZQHQUI5WI
X-Message-ID-Hash: BBEPR6XOTEZWXPPXVAFE2MCZQHQUI5WI
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/8] misc: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BBEPR6XOTEZWXPPXVAFE2MCZQHQUI5WI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

MikroBUS is an open standard  developed by MikroElektronika for connecting
add-on boards to microcontrollers or microprocessors. It essentially
allows you to easily expand the functionality of your main boards using
these add-on boards.

This patchset adds mikroBUS as a Linux bus type and provides a driver to
parse, and flash mikroBUS manifest and register the mikroBUS board.

The v1 and v2 of this patchset was submitted by Vaishnav M A back in
2020. This patchset also includes changes made over the years as part of
BeagleBoards kernel.

Link: https://www.mikroe.com/mikrobus
Link: https://docs.beagleboard.org/latest/boards/beagleplay/
Link: https://lore.kernel.org/lkml/20200818124815.11029-1-vaishnav@beagleboard.org/ Patch v2

Changes in v3:
- Use phandle instead of busname for spi
- Use spi board info for registering new device
- Convert dt bindings to yaml
- Add support for clickID
- Code cleanup and style changes
- Additions required to spi, serdev, w1 and regulator subsystems

Changes in v2:
- support for adding mikroBUS ports from DT overlays,
- remove debug sysFS interface for adding mikrobus ports,
- consider extended pin usage/deviations from mikrobus standard
  specifications
- use greybus CPort protocol enum instead of new protocol enums
- Fix cases of wrong indentation, ignoring return values, freeing allocated
  resources in case of errors and other style suggestions in v1 review.

Ayush Singh (7):
  dt-bindings: misc: Add mikrobus-connector
  w1: Add w1_find_master_device
  spi: Make of_find_spi_controller_by_node() available
  regulator: fixed-helper: export regulator_register_always_on
  greybus: Add mikroBUS manifest types
  mikrobus: Add mikrobus driver
  dts: ti: k3-am625-beagleplay: Add mikroBUS

Vaishnav M A (1):
  serdev: add of_ helper to get serdev controller

 .../bindings/misc/mikrobus-connector.yaml     | 110 ++
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |  76 +-
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/mikrobus/Kconfig                 |  19 +
 drivers/misc/mikrobus/Makefile                |   6 +
 drivers/misc/mikrobus/mikrobus_core.c         | 942 ++++++++++++++++++
 drivers/misc/mikrobus/mikrobus_core.h         | 201 ++++
 drivers/misc/mikrobus/mikrobus_id.c           | 229 +++++
 drivers/misc/mikrobus/mikrobus_manifest.c     | 502 ++++++++++
 drivers/misc/mikrobus/mikrobus_manifest.h     |  20 +
 drivers/regulator/fixed-helper.c              |   1 +
 drivers/spi/spi.c                             | 206 ++--
 drivers/tty/serdev/core.c                     |  19 +
 drivers/w1/w1.c                               |   6 +-
 drivers/w1/w1_int.c                           |  27 +
 include/linux/greybus/greybus_manifest.h      |  49 +
 include/linux/serdev.h                        |   4 +
 include/linux/spi/spi.h                       |   4 +
 include/linux/w1.h                            |   1 +
 21 files changed, 2318 insertions(+), 113 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/misc/mikrobus-connector.yaml
 create mode 100644 drivers/misc/mikrobus/Kconfig
 create mode 100644 drivers/misc/mikrobus/Makefile
 create mode 100644 drivers/misc/mikrobus/mikrobus_core.c
 create mode 100644 drivers/misc/mikrobus/mikrobus_core.h
 create mode 100644 drivers/misc/mikrobus/mikrobus_id.c
 create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.c
 create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.h


base-commit: 61996c073c9b070922ad3a36c981ca6ddbea19a5
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
