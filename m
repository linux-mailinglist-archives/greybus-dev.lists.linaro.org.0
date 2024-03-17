Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8AE87DFAD
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 20:38:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 230A043D46
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Mar 2024 19:38:05 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id B617C3F387
	for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 19:38:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=MJSDhEmR;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6e6b5aa0b52so3145148b3a.3
        for <greybus-dev@lists.linaro.org>; Sun, 17 Mar 2024 12:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710704282; x=1711309082; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOuQoK+aCpD9BndP2a56795Q5pkcrTD7MkJhQYgQRRE=;
        b=MJSDhEmRzGJdnOaOaUa7Ue+iVYXSVsd0jl1tgrZes63Y0F7FVzA+rWo+dPYfPKsJQZ
         ou+GSAQAGWQ1Gt55scA4bMY7FI02sUDnqfdMiwOG06TpUDtvMTlDOu4jkmFV61BjWjMh
         +LGY7lt8f42XZud3bFDAJ2O4atybG/7lSMo3SuNETBH6ckiJMj4akQwWOiEDy65qOUJM
         kBOpjyvkpzSCFVPJ1cMkvvCP0HGfD4aHurq8G01P/LEWFVYRkG0NhIKq2mMkszOJFAqU
         Of1zWGnp7B4sxa8x4c9Z/QvKpPsauw4xOgljW3NCVWTxakrin/8Yt37O+Q/0RF+hJthb
         zjWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710704282; x=1711309082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOuQoK+aCpD9BndP2a56795Q5pkcrTD7MkJhQYgQRRE=;
        b=hiW01w4uuq7c6sKqOQ1AO0RFIqEXXf8FXDzIwVniaKCoMAOZVh8bSXRR+gBAeHs+H+
         6LQgk3Fym+zRrlPnXqjGdP3vsNDYDB3L7mwQqBsxt8S5zcWPsXQSEyvvIuzyUYJTyoQc
         Elb5LBC0tWyHE3J4xhEygpM7xfy8pGonAiCie7HK5T6RSKP2P7Cd7/5ZnPIK5kiyos0t
         V9QIIyKnkQKfp6VCqhRPEvAvLvtR8msETj+vvb/AdnPPlmjsQYArez4hkl9UBhx9YrBC
         NJoo4SErqQXDfGluU6F/bymy4V4eRt6BdTO1XPLbWUJMBBFYoJKKi+BM+LpcaoZe4YAD
         P/Rg==
X-Forwarded-Encrypted: i=1; AJvYcCWzmekiJBKzut1j1NRej4p9H0j0MIdsefZ1o0MtrLeR8OQK1uSZJUFkBsp3jjIH6+lZcw3ntuDKMyDI0vocrZNYc5dsYTBcHZMsILnP
X-Gm-Message-State: AOJu0Yz/Aa0CDxSFWU5INEI0QrV+wFwpZq/iQMQXx5egvosZwoc6FUkE
	zfcsRJVRHrChzbpIfeUhXdNlNitu8h9JMiwL4+h08Xb8MCxrOKZY
X-Google-Smtp-Source: AGHT+IF36PtWXGUyktoxAgcK72f91CpSjqHRlGCFk/zUs9CV8FTiGRE9UbHnhk653DcJjP0P++a9rA==
X-Received: by 2002:a05:6a21:3945:b0:1a3:5f13:e43d with SMTP id ac5-20020a056a21394500b001a35f13e43dmr2179598pzc.25.1710704281676;
        Sun, 17 Mar 2024 12:38:01 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id st6-20020a17090b1fc600b0029bbdc920besm6125995pjb.44.2024.03.17.12.37.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:38:01 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: linux-kernel@vger.kernel.org (open list)
Date: Mon, 18 Mar 2024 01:07:08 +0530
Message-ID: <20240317193714.403132-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: B617C3F387
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[gmail.com,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,vger.kernel.org,lists.infradead.org,lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	TAGGED_RCPT(0.00)[dt];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 3CHJS5B3BCVHD7VMKDM3JLEMEECKT2CL
X-Message-ID-Hash: 3CHJS5B3BCVHD7VMKDM3JLEMEECKT2CL
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, robertcnelson@beagleboard.org, lorforlinux@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Vaishnav M A <vaishnav.a@ti.com>, Mark Brown <broonie@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, "moderated list:ARM/TEXAS INSTRUMENTS K3 ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>, "open list:SPI SUBSYSTEM" <linux-spi@vger.kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 0/5] misc: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3CHJS5B3BCVHD7VMKDM3JLEMEECKT2CL/>
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
parse and register the mikroBUS board using mikroBUS manifest.

The patchset is based on work originally done by Vaishnav.

Link: https://www.mikroe.com/mikrobus
Link: https://docs.beagleboard.org/latest/boards/beagleplay/
Link: https://lore.kernel.org/lkml/20240315184908.500352-1-ayushdevel1325@gmail.com/ Patch v3

Changes v4:
- Better commit messages
- Remove clickID, serdev, pwm, regulator, clocks etc. Just the basic
  mikroBUS driver.
- Fix a lot of memory leaks, unused variables, etc.
- Create accompanying PR in Greybus Spec repository
- Switch to 80 columns formatting
- Some other fixes pointed out in v3

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

Ayush Singh (5):
  dt-bindings: misc: Add mikrobus-connector
  spi: Make of_find_spi_controller_by_node() available
  greybus: Add mikroBUS manifest types
  mikrobus: Add mikroBUS driver
  dts: ti: k3-am625-beagleplay: Add mikroBUS

 .../connector/mikrobus-connector.yaml         | 113 +++
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |  80 +-
 drivers/misc/Kconfig                          |   1 +
 drivers/misc/Makefile                         |   1 +
 drivers/misc/mikrobus/Kconfig                 |  15 +
 drivers/misc/mikrobus/Makefile                |   5 +
 drivers/misc/mikrobus/mikrobus_core.c         | 696 ++++++++++++++++++
 drivers/misc/mikrobus/mikrobus_core.h         | 151 ++++
 drivers/misc/mikrobus/mikrobus_manifest.c     | 503 +++++++++++++
 drivers/misc/mikrobus/mikrobus_manifest.h     |  29 +
 drivers/spi/spi.c                             | 206 +++---
 include/linux/greybus/greybus_manifest.h      |  49 ++
 include/linux/spi/spi.h                       |   4 +
 14 files changed, 1750 insertions(+), 110 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/connector/mikrobus-connector.yaml
 create mode 100644 drivers/misc/mikrobus/Kconfig
 create mode 100644 drivers/misc/mikrobus/Makefile
 create mode 100644 drivers/misc/mikrobus/mikrobus_core.c
 create mode 100644 drivers/misc/mikrobus/mikrobus_core.h
 create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.c
 create mode 100644 drivers/misc/mikrobus/mikrobus_manifest.h


base-commit: 61996c073c9b070922ad3a36c981ca6ddbea19a5
-- 
2.44.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
