Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A17785DF0
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 18:55:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9193540F68
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 16:55:49 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by lists.linaro.org (Postfix) with ESMTPS id E38933EF34
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 16:55:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=rSUtRt7j;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.177 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-1bf092a16c9so45803045ad.0
        for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 09:55:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809741; x=1693414541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GcQRPQr9UeGVPlBoE10Lcz6gR0PZdGk3JGQGdOH62Eo=;
        b=rSUtRt7j4aCx/1dpe4761kBO+XLVa0QxBVxMN/QgK1QWpbRvYzIqoUwIvf7HpLok8N
         vFCGojq/Rht5FRhGRwCDoLuRB7M9NesHHT7CHbM0EK1ktADmzVE1DbTwiROoS0UUwJK0
         gyn6A7mzudquFNj1k4QDhufuo0s8DMhOdeclmyLX+K+3xvLGuKRpT0W8oqWxxSkWM+6J
         Z3d4GavOoIGRLdoAkwS0GeHSjg+ThR03hnN9W+UvtA9xS4W8xCgnIhRAno5r4L/Ot5Qx
         z9gXKURLK2wU+5LrkzXlXsTqPM/EERLg51XBcTIlywWUCc9f98e4JWCBS/+weWiscBJh
         iJdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809741; x=1693414541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GcQRPQr9UeGVPlBoE10Lcz6gR0PZdGk3JGQGdOH62Eo=;
        b=ECOE7nI7Uta0Zg1SNtlqwveMS6qx0LgBzjrU813fZ8THT0gbc1jITg6kRSQ8YHIe8P
         nIyCSrHr9OxuGcaEYv3jNHj0i3XnJ5nqFZ0KD1WQMIgnwb/Vi2h20fdeM6ZRxjzWmT8V
         YGAnc1IR/W7pzpKhmNH3s29rHuuyj98ED8/ezspFa32VuyF0/6uODe+p3QVmm16m1X1/
         gcVBeVIopDPJh3kMYezqmn38pQ9Xukqd6YB5/ZyN/NmJeW+NFGLbmszC+LU09vRrLOdu
         hjuU25pZDnoMtedJN4vNFBr0EHs3BtVq2p5/H4WZNc8KEnZu2gr3LcxyB3YWuOV5ChNV
         vvRA==
X-Gm-Message-State: AOJu0Yxwm+c7PviempSB+we2qKZNQ8SJasAUNhtBPZ5RuzJIflpEdGoN
	NJFd6Ku0LSFX+w+MGr7m0QsJEtERIg4mTDpM
X-Google-Smtp-Source: AGHT+IE9pvnLbiWm9/gNQ5T4fPSeIBYWsgHg8NqBLwXWEAUp/dsacdcuw8R26r8DkSGmrZPAB6hL8w==
X-Received: by 2002:a17:902:e5c4:b0:1bc:5197:73c5 with SMTP id u4-20020a170902e5c400b001bc519773c5mr16223210plf.54.1692809741324;
        Wed, 23 Aug 2023 09:55:41 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id ix21-20020a170902f81500b001bb8895848bsm11256247plb.71.2023.08.23.09.55.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:55:40 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 23 Aug 2023 22:25:16 +0530
Message-ID: <20230823165520.181301-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: E38933EF34
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.177:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: BD3OASDER7T5TYV7TZIM4W27RGXQJAH5
X-Message-ID-Hash: BD3OASDER7T5TYV7TZIM4W27RGXQJAH5
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/4] BeaglePlay Greybus Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BD3OASDER7T5TYV7TZIM4W27RGXQJAH5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This driver is for BeaglePlay by BeagleBoard.org. It communicates with
BeaglePlay CC1352 co-processor which serves as Greybus SVC [1]. This
replaces the old setup with bcfserial, wpanusb and GBridge.

This driver also contains async HDLC code since communication with
CC1352 take place over UART using HDLC.

Since this is my first driver, I expect there to be some mistakes, so
feel free to give feedback and point out things I might have missed or
might not be aware of.

This driver has been created as a part of my Google Summer of Code 2023.
For more information, take a look at my blog [2]

[1]: https://git.beagleboard.org/gsoc/greybus/cc1352-firmware
[2]: https://programmershideaway.xyz/tags/gsoc23/

Ayush Singh (4):
  Add beagleplaygreybus to devicetree
  Add beagleplay greybus driver
  Add HDLC helper for beagleplay driver
  Allow building beagleplay greybus driver

 .../arm64/boot/dts/ti/k3-am625-beagleplay.dts |   4 +
 drivers/staging/greybus/Kconfig               |   9 +
 drivers/staging/greybus/Makefile              |   5 +
 .../greybus/beagleplay-greybus-driver.c       | 264 ++++++++++++++++++
 .../greybus/beagleplay-greybus-driver.h       |  28 ++
 drivers/staging/greybus/hdlc.c                | 229 +++++++++++++++
 drivers/staging/greybus/hdlc.h                | 137 +++++++++
 7 files changed, 676 insertions(+)
 create mode 100644 drivers/staging/greybus/beagleplay-greybus-driver.c
 create mode 100644 drivers/staging/greybus/beagleplay-greybus-driver.h
 create mode 100644 drivers/staging/greybus/hdlc.c
 create mode 100644 drivers/staging/greybus/hdlc.h

-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
