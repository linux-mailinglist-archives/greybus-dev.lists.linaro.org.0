Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5858879092A
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 20:29:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 225713EF6B
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 18:29:34 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by lists.linaro.org (Postfix) with ESMTPS id 08B0D3EA01
	for <greybus-dev@lists.linaro.org>; Sat,  2 Sep 2023 18:29:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=ZUD+AXl0;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.176 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1c313f8c6c9so965465ad.3
        for <greybus-dev@lists.linaro.org>; Sat, 02 Sep 2023 11:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693679367; x=1694284167; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/h6f60a51OBLWnoS64kjCROnu9sNnSGTdI4hkrdrgU=;
        b=ZUD+AXl0RssO50O7JRnh+cJILqpMsGlS74aysIbR5oStY2VtjbgKxRfnC2ARQS7wta
         3z7e5BbGivr0qwAz9ff1sl1l+FCe6NvC8zmcULuI6xrRLyXUdo2IQtMdi1EyjtchlgWL
         MRz0Q+xRT1pNUUSg4+cHKKA1y9h4fQw+EfQtxQblx1YJFXu0opApJ3sZXNbHaG7J7wbP
         CGKkt1ZJ8HzRJJ4z/k0aUK3kUekTeTCWApfgb/LSFaxdKxsOZloYsEJCtevdZUlB038X
         y9S/b9xLsKXr2zN1ClZBsD34Nv4Jcw7u3C8HvNxjRJj5t3fgCbeLz9NGojsQNSbDz/b9
         EUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693679367; x=1694284167;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/h6f60a51OBLWnoS64kjCROnu9sNnSGTdI4hkrdrgU=;
        b=SKMchw7Uc9YU6ei3j/g6IdezJ/yNrzZrDmHVFsS9BwzZCCu+Xil3Nm1/QzLHkjyBJk
         nVTfboCrloKIJxn7nR+cAvg1S+d1aZgTtTenef0Tgazvt/g77G3yUWGRXU22TCl/SJFG
         qO5XsinBB6lnH8w2R9tq0MSzfbiFx4FYUfZIhHKSvPKSj6Z6rJ/VnDd8b9AJSf2dOSf5
         I7t+yRGzRGclDk/9+mTW0lmCcSNF8KRJSr/bTeOxXTszEsIQdO544OhUGjUhUW/3jZ9p
         rxSb4My0bs9fHEx1A+pkReO6TbG/ZUU072VCdHljqf10vBdvw+3QjIltEt5KC2Bdfx5a
         3FCg==
X-Gm-Message-State: AOJu0YyAUty+cmAOcZJCrNDr2+xXIeEyqJK3w4pKrAGRNJq9Yex97L94
	2VOKeW5TeFa5GbL3eIzLbImlJ+bYi5U=
X-Google-Smtp-Source: AGHT+IG/uEbtoVkHaVb2B12zE2+36cqoiOeVslgBCDws8JeZpUrN1RRTE+9A140Ffx7K8OEhgJKP3g==
X-Received: by 2002:a17:902:eacc:b0:1bf:2e5c:7367 with SMTP id p12-20020a170902eacc00b001bf2e5c7367mr6724508pld.42.1693679366775;
        Sat, 02 Sep 2023 11:29:26 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id i6-20020a170902eb4600b001bf846dd2d0sm4918970pli.13.2023.09.02.11.29.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 11:29:26 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sat,  2 Sep 2023 23:58:40 +0530
Message-ID: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 08B0D3EA01
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.176:from];
	NEURAL_HAM(-0.00)[-0.999];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: GKOFWZ5IJMNXIWVDOM3WRNU2B2S4244G
X-Message-ID-Hash: GKOFWZ5IJMNXIWVDOM3WRNU2B2S4244G
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GKOFWZ5IJMNXIWVDOM3WRNU2B2S4244G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

BeaglePlay is a board by BeagleBoard.org. It contains a main AM62
processor with a CC1352 co-processor. They are connected over UART.

Greybus is a hardware protocol that was designed to provide Unipro with a
sane application layer. It can be used in IOT and IIOT applications
keeping the intelligence on the host.

This driver has been tested on BeaglePlay by BeagleBoard.org. It serves
as Greybus Host device and communicates with BeaglePlay CC1352
co-processor which serves as Greybus SVC. This replaces the old setup with
bcfserial, wpanusb and GBridge. This driver also contains async HDLC code
since communication with SVC take place over UART using HDLC.

This driver has been created as a part of my Google Summer of Code 2023.
For more information, take a look at my blog.

This patchset has been tested over `next-20230825`.

My GSoC23 Blog: https://programmershideaway.xyz/tags/gsoc23/
Zephyr App: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware
GitHub Branch: https://github.com/Ayush1325/linux/tree/gb-beagleplay
Video Demo: https://youtu.be/GVuIB7i5pjk

This the v4 of this patch
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

 .../bindings/serial/beaglecc1352.yaml         |  25 +
 MAINTAINERS                                   |   7 +
 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
 drivers/greybus/Kconfig                       |  10 +
 drivers/greybus/Makefile                      |   3 +-
 drivers/greybus/gb-beagleplay.c               | 494 ++++++++++++++++++
 6 files changed, 542 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/serial/beaglecc1352.yaml
 create mode 100644 drivers/greybus/gb-beagleplay.c

-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
