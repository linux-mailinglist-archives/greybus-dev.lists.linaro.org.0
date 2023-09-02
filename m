Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 89295790920
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 20:23:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 35E473EF6B
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Sep 2023 18:23:52 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	by lists.linaro.org (Postfix) with ESMTPS id 211693EF47
	for <greybus-dev@lists.linaro.org>; Sat,  2 Sep 2023 18:23:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b="EcB0/wT4";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.174 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1c06f6f98c0so965065ad.3
        for <greybus-dev@lists.linaro.org>; Sat, 02 Sep 2023 11:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693679024; x=1694283824; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S/h6f60a51OBLWnoS64kjCROnu9sNnSGTdI4hkrdrgU=;
        b=EcB0/wT4/fwL17Dr2UWtc0iDPiyDZ4jdRTVAqC5zLAFbnUpZtdneefD2mHT7uyA/BD
         fJnlhdEMD65wc1zpJ2hzotqdLSdW0pfF1l+8AGTVwbXynW6ymoYi7joPqaA66ZnwCSoQ
         RjpDx0+OPizPgD+gzRh2x9T8YeeqPwmvgmYbr+yIJofj4dkOhfYY5QE1Yq9kYEpLTE7w
         n514pxyp/95WTvG3Zn+gzkKn8Er2ZPNdLc+xmdcU4RG590JghJDLoUC7x8kBRbebxEme
         IAXBZ0dXWeb2rn/ibyFeVv/+tSmBoI7BFYWA+yHv0oef5OJFnEF1P6aRKLVPcVIdP6RZ
         jhBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693679024; x=1694283824;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S/h6f60a51OBLWnoS64kjCROnu9sNnSGTdI4hkrdrgU=;
        b=co2mwz1o+Q3HOz56DGkVmciH/+EwA5T8z7H4Yat7O2lBKl0a7ufz5qtENCiPTaAEOq
         DRx+eoaacyPzfLkcZLtPHC1/2ZREb1uqGYzm9HnNHCMLrw/aVjsB0Sp4reXCd560WrT3
         KJxM0wZo3liSGel1p1C8E2QNNamq6P9rdF2yctlh0Yrg+D913CUZ40J/GUca9XI3fDqs
         Tthavkws13fhefIVp89IVezLUy2ZhUJgdQRxRya5EjkFYTdhxzkJ+kyrdlTQwLmEwJrh
         5unAP0pG54zqAAYCkDi8v9Obo1U9Z8tV63wVi30ioQsfLfzstvrm/XvrrTFVXcPATSgD
         fc+g==
X-Gm-Message-State: AOJu0YwyVscrR6aaGIhoks0myMDEsHoA/HL4zz2/hZaWXtbJRcrcIIn8
	D2JTJtf5SrD/d+Rrvldi/ypsf2/iVK4=
X-Google-Smtp-Source: AGHT+IHFvEafo7q0avmTsrUfG8fYgqrU08jnX3qM1X8SnECauUTJFJ8cH1IXNkXvVcsJmrwcsG3Fzg==
X-Received: by 2002:a17:902:be05:b0:1bb:c06e:647a with SMTP id r5-20020a170902be0500b001bbc06e647amr6563279pls.53.1693679023694;
        Sat, 02 Sep 2023 11:23:43 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id i4-20020a170902eb4400b001b801044466sm4899870pli.114.2023.09.02.11.23.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Sep 2023 11:23:43 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sat,  2 Sep 2023 23:52:23 +0530
Message-ID: <20230902182243.1838554-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 211693EF47
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.174:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: GRGPFXEHD5L5UYOIMNXAMUOTFUHIK4NX
X-Message-ID-Hash: GRGPFXEHD5L5UYOIMNXAMUOTFUHIK4NX
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 0/3] greybus: Add BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GRGPFXEHD5L5UYOIMNXAMUOTFUHIK4NX/>
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
