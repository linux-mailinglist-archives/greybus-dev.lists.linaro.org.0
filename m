Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 62B7A6C96B1
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2FBC343CD2
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:14 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	by lists.linaro.org (Postfix) with ESMTPS id 3C91B3E948
	for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 08:24:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=S8LFugRH;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.216.52 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f52.google.com with SMTP id r7-20020a17090b050700b002404be7920aso3156128pjz.5
        for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 01:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679732658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Da0bkbbQlx1cEs08lUYN3fUFt8qfcR/cqaYyxH0QCRI=;
        b=S8LFugRHYwHLsqlFp4TiYTxTrzlBTJU3W9ZYzdP9TSNebZ3xugCXzOJAuEoceScAfM
         W3afFKTdAfyaaB1/BXWjHmGGPgXR/0rUoquLqS7AijFf6JfkaRz+l5tiKDKIoLH7XOP8
         xVTrwC0oV3wTBzfCU+yJc8ot5T0IkjisKaUcuMl4zw8rZ6KQn02NEt6nJfHkojIZnARb
         VIlINZ2DWrcVGbN23EK/awQb6Wb2rLmQe3xTo8ZpvLh9jhQaeGE6pDcNhqeHXQMiiMqK
         BYmltWHS7uZLZfh3FM2Pce3d84j7R+D+fnz/wMdml4nk9cLl+QqOYuFVqkCfK7BidYhu
         CYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679732658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Da0bkbbQlx1cEs08lUYN3fUFt8qfcR/cqaYyxH0QCRI=;
        b=vuZVSGB0ASJppUdhfwDkBSJUXUcIwqn2gGjJwwAHiASlRG+iKNF6euSV4AEzSget03
         8N7UIdm1mgUSPcpbAv57ZpiZtC6NQ+dBQ/dYJVzB6a9uqkSqJgxpTVKGHRNUmIlwS8Aa
         ORE3FVwNMt09klelG2c5CPmIdfCoFnni9XixfnOUsQwKPIzSGY6qda5qMpDZwNpwpfKk
         OTCPAz4VBAHcMO6UrUt/XYviEQFov7+KcsEvC623GUK6lc2AnGhRcR6ZhkwwPPo4F7FM
         czOEc/DxLRkXImymoRQNdOEGjkV5qFX6Lq94LiyrLU9pQR5bOanoz7L+Fy7gi9zX+C+X
         ZV7w==
X-Gm-Message-State: AO0yUKV+CVasF19UcEniiYBW7uAncyi2dvp+6MF79omParyv26Xk3mEY
	RNzIi8Y38h8GGFrhSG9s70A=
X-Google-Smtp-Source: AK7set+llncqGBAhJvP94FYyzOGTMhdMpyTZWZW6uXjdxRoCGo9tZBxcSO6MBhAfVzbCitYTSnuZNQ==
X-Received: by 2002:a05:6a20:729d:b0:dd:e036:37e4 with SMTP id o29-20020a056a20729d00b000dde03637e4mr7209642pzk.2.1679732658165;
        Sat, 25 Mar 2023 01:24:18 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id b5-20020aa78105000000b005938f5b7231sm15035875pfi.201.2023.03.25.01.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:24:17 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Sat, 25 Mar 2023 01:23:30 -0700
Message-Id: <cover.1679732179.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3C91B3E948
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.52:from];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6QW7GF5UR47I522FEBPGPWX26PULY2RR
X-Message-ID-Hash: 6QW7GF5UR47I522FEBPGPWX26PULY2RR
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:33 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 0/3] staging: greybus: Use Inline fuctions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6QW7GF5UR47I522FEBPGPWX26PULY2RR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert macros to a static inline function, to make the relevant
types apparent in the definition and to benefit from the type
checking performed by the compiler at call sites.

Changes in v2: Change patch subjects, noted by Alison Schofield
<alison.schofield@intel.com>

Changes in v3: Change patch subjects to length 80 chars,      
noted by Alison Schofield <alison.schofield@intel.com>

Sumitra Sharma (3):
  staging: greybus: Inline gpio_chip_to_gb_gpio_controller()
  staging: greybus: Inline gb_audio_manager_module()
  staging: greybus: Inline pwm_chip_to_gb_pwm_chip()

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 drivers/staging/greybus/gpio.c                 | 7 +++++--
 drivers/staging/greybus/pwm.c                  | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
