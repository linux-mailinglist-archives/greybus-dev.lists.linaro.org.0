Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A052DA87201
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 14:59:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 627924595B
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 12:59:27 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com [209.85.160.193])
	by lists.linaro.org (Postfix) with ESMTPS id DC7FE45979
	for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 07:32:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=lWH53Rsf;
	spf=pass (lists.linaro.org: domain of ganeshkpittala@gmail.com designates 209.85.160.193 as permitted sender) smtp.mailfrom=ganeshkpittala@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qt1-f193.google.com with SMTP id d75a77b69052e-4767e969b94so59847741cf.2
        for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529561; x=1745134361; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/8etCy8vUBX1D7mcRQ877u8kgqMXt59GuVCcFTXiRU=;
        b=lWH53RsfT1rBPtC28ndrnFrCMztkSr+kPhTBXPXSpTmKv9IU+IaNtVQfHAEskV0QmV
         PbHYObNLRzf6BqZ7WSJrFARdgkkydaoLOc43kI+kwNMeuNIRz8ugKg5ieLJZKGDXsiFN
         RJ4kkcyTZskM8DU2dALesZupflRkPazvOue4EQCuj3ySqrk895vedH94WiHgQJbah+4H
         8OBsft6rq1SrKOKGw4Nm065Mk5lRTT8ut7PyJmj4wnh25SP/ctmZoo2hrJO1XEcGwGCg
         +F1Cj0iQgn2jBeQQDI2YFh99Y2bCrwZWN7sR7cvPziyW3OYLDqDRAijaJfJiZ8ZBLDYZ
         nCvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529561; x=1745134361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/8etCy8vUBX1D7mcRQ877u8kgqMXt59GuVCcFTXiRU=;
        b=nxpr4wMgUl9h6JUVlUAkunWfbjuOQOMZ74Ffpefprp/Bv1OopEAOwvIrbkcPiMkzwG
         jpReBGFE0I8FYJeR4gMyAfn1UqLF4eHGEp5gSkdWDsx0zp6e74ToOt1n9xB0hFPuNShO
         ZYQTtb8w4bdGc0r9+79tKnn5a1c9aHYqrY708RhB1eY7fCf7Y5dGOJQeUv9qRl8I/3cV
         G0HqBGHk+PxE5E5uFAAQMK7ggpAHvjGIa2zzsPo9H7Tu2jGCF4qDD5FnrKsYsLqVI2ht
         GN24GD76uJkyiM5nIgoka6CD6/CtNohNP4W1DGzHJ7b0sBeKSb35AnPEiB6Sgj4f+Fae
         +HvA==
X-Gm-Message-State: AOJu0YxfaFKrQsUDTCxYzv/i0abnaLunPboWaReiR7tcajpCakqsbZY8
	6omUKnOtI65jlO7reu0Gp6x9zd46whigmWi+rSP7qfaLhyjdIVGU
X-Gm-Gg: ASbGncvk54EyktiFdXVNDipAAkH2EF9xQJPcrUVW0FtqMjFhk/UoD7Lj/K5WspXZHqX
	NcooKnrfmOvfZo0ViSY+u7KnfJ2OICaqzRDweN9V23iYtGY0gtwQcaScnDpZKHoy5OQ4LYlmog2
	RkGERuu5C1eHzUZOU1TFBai/MhSJiDNfCJYIO8XRDlsCWZfkhY7BiuL/7KPKtEykeYaDd4qq9Xv
	F9SB5EHr6YLBpD7qGzcwk3d5vdMnGHV08HXYCroeCnU2/ACcFQPLBan3mDcaTYgWj4nS4r8Wc2f
	d01TsAzt+f15JypnGJgirOQV/w7Ln9+so7z+hElBOZfFgHRwGC72SxSzV3Yy8gV26LJV7aEyw0c
	0ALxerqt1FJ4CtIxX1w==
X-Google-Smtp-Source: AGHT+IGOP+2OtvsS7YolVOB2aGg75agobNToUGsbXzhY2oPmkrtUdrL5JFKn/GUT0mDN/OPwZtecvQ==
X-Received: by 2002:a05:622a:1902:b0:476:964a:e335 with SMTP id d75a77b69052e-4797755aaacmr88773491cf.24.1744529561246;
        Sun, 13 Apr 2025 00:32:41 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:40 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun, 13 Apr 2025 07:32:16 +0000
Message-ID: <20250413073220.15931-1-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: DC7FE45979
X-Spamd-Bar: +++
X-Spamd-Result: default: False [3.40 / 15.00];
	RBL_SENDERSCORE_REPUT_1(3.50)[209.85.160.193:from];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.193:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,animalcreek.com,nexus-software.ie];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Spam-Level: ***
X-Rspamd-Server: lists.linaro.org
X-MailFrom: ganeshkpittala@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XCAGNTORJ4EY6EXR6S6LUTUEHB252IGO
X-Message-ID-Hash: XCAGNTORJ4EY6EXR6S6LUTUEHB252IGO
X-Mailman-Approved-At: Sun, 13 Apr 2025 12:59:21 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, ganeshkpittala@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/4] staging: greybus: cleanup, API migration, and refactors
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XCAGNTORJ4EY6EXR6S6LUTUEHB252IGO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch series splits and improves the previously submitted single patch by
breaking it into four independent, logical changes following kernel submission
etiquette.

Link: https://lore.kernel.org/r/d683962c-e8b7-4adc-9902-483976197637@riscstar.com
Link: https://lore.kernel.org/r/5773d200-1d9d-4d6e-b01e-10d962ee9e8e@quicinc.com
Link: https://lore.kernel.org/r/4f47df18-e98c-4f23-afde-3fa8e9fd0f86@quicinc.com
Link: https://lore.kernel.org/r/202504010829.vIzweYue-lkp@intel.com
Link: https://lore.kernel.org/r/202504011217.iRb2Bbls-lkp@intel.com

All changes are isolated, reviewed, and tested.

Patches included:
  1. Replace deprecated strncpy() with strscpy() in firmware.c
  2. Replace sprintf() with sysfs_emit() in sysfs show functions
  3. Refactor gb_loopback_fn() into smaller helpers
  4. Fulfill TODO by splitting get_topology() logic in audio_gb.c

v1 feedback from maintainers highlighted the need to split changes and avoid
unrelated whitespace or formatting edits. These recommendations have been
carefully addressed in this version.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>

Ganesh Kumar Pittala (4):
  staging: greybus: replace deprecated strncpy with strscpy in
    firmware.c
  staging: greybus: replace sprintf with sysfs_emit in sysfs show
    functions
  staging: greybus: refactor gb_loopback_fn into smaller helper
    functions
  staging: greybus: split gb_audio_gb_get_topology into helper functions

 .../greybus/Documentation/firmware/firmware.c |   6 +-
 drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
 drivers/staging/greybus/arche-platform.c      |  11 +-
 drivers/staging/greybus/audio_gb.c            |  36 +++-
 .../staging/greybus/audio_manager_module.c    |  13 +-
 drivers/staging/greybus/gbphy.c               |   3 +-
 drivers/staging/greybus/light.c               |   5 +-
 drivers/staging/greybus/loopback.c            | 167 ++++++++++--------
 8 files changed, 145 insertions(+), 107 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
