Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 98C326C96AA
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:09:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8E89643CD0
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:09:36 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 8895F3E968
	for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 07:21:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=olwZ2Ki+;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id le6so1045779plb.12
        for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 00:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679642484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=olwZ2Ki+GEmXv8N44rzlIT2zwtZrcHbqmSfDZrbXOE8skrN/XFMRPXRh9BxqAVJvq9
         1h59VhF08YneFvX2/UjLzW4bZ7/UXKkuXAelK8CWyQB03bWYJVm0indIiCeivCqWiIVE
         o+OnA12bz4QBpDXQGGUwrBH05ESQoZx/s7vzQxklJnkFiNdNGCr1h3neQDr0Wu0ETgc2
         PE72AAVHb7QW7fiOdDKL6TeyoQTUu8ItQM9D8FJWEgPRHiMsfl+BJtHzPk589PplTlCD
         F+e588GFFMmS6wLKgeMHAsaf849OTPjNgVpt/segz0OhGb4iGQ5x4kZz4M3pJDHlMQKT
         Vm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679642484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qOWL7nV1WlBQFqJTXaBmWX6r0g27OV1XFhs05mfe2aI=;
        b=LM/PDjEmQDU0OQQ7zSc4rTqH/9Uy2fceh4hIgMRr26sQD/TiE6j57C7NIA0OzvH+3H
         lso+wxwhGiUjSGam+jEBpy1gFqQFj8gLGnY4fj01FbMjwUg+1X4jKY8cso0mEhn4ZJ32
         CmYl8sqsO9Hn70C/LsuiH2UjlIWnby/BX1n3W/V3NU39QoyS8nUYJtWwl8Lt0QYtpumc
         QmcJFL0q25MrhMXrRrlcfryuytC26xv2b7vWAQOoi8D7qiw0xIfdKYRJbj6V/7qenV9x
         VPFJ00hDtvBTjxMjRCvzaxC1hMLaFyD9VkpsJ3T+cUwZR6IY3WaO7i/Ld/6NZkhT1k2t
         F6ew==
X-Gm-Message-State: AAQBX9cuhpyVta7ZgDEZLmtgxK88eHS9xljsSTO/zahT9HWFDvue/3m3
	+7Y0/3i0pL9GAGt/G2PSKgtAb8SvUlW3YA==
X-Google-Smtp-Source: AKy350a0aAAwD586M+JBEnfHYwX+wsWJNpNqvuQFJGvV3/eCeLmSCS1tVDK+PQPJ/zSPsgvlzLYLow==
X-Received: by 2002:a17:90b:1c88:b0:233:f354:e7df with SMTP id oo8-20020a17090b1c8800b00233f354e7dfmr1835231pjb.18.1679642484576;
        Fri, 24 Mar 2023 00:21:24 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id o10-20020a17090ab88a00b0023cfa3f7c9fsm2362372pjr.10.2023.03.24.00.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:21:24 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Fri, 24 Mar 2023 00:20:30 -0700
Message-Id: <cover.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8895F3E968
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
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
Message-ID-Hash: 4KQQAKUOJA5SYSSLWBH3VQEOIYEFIFAQ
X-Message-ID-Hash: 4KQQAKUOJA5SYSSLWBH3VQEOIYEFIFAQ
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/3] Staging: greybus: Use inline functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4KQQAKUOJA5SYSSLWBH3VQEOIYEFIFAQ/>
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

CHanges in v2: Change patch subjects, noted by Alison Schofield 
<alison.schofield@intel.com>

Sumitra Sharma (3):
  Staging: greybus: Use inline function for macro
    gpio_chip_to_gb_gpio_controller
  Staging: greybus: Use inline function for gb_audio_manager_module
  Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip

 drivers/staging/greybus/audio_manager_module.c | 7 +++++--
 drivers/staging/greybus/gpio.c                 | 7 +++++--
 drivers/staging/greybus/pwm.c                  | 6 ++++--
 3 files changed, 14 insertions(+), 6 deletions(-)

-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
