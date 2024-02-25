Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A498678F6
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 15:48:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 28DCF40E1F
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 14:48:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 5117A3F3B7
	for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 08:41:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="Sy9dnj/y";
	spf=pass (lists.linaro.org: domain of dileepsankhla.ds@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=dileepsankhla.ds@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1dc5d0162bcso17737675ad.0
        for <greybus-dev@lists.linaro.org>; Sun, 25 Feb 2024 00:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708850518; x=1709455318; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iXcTHohQKUEWCG3AfRPALlxApVKdvPfbvuOAXc4fB5c=;
        b=Sy9dnj/yg5AU9DYUI1FNhD5PeafsVu1chQSBqOk/EUFnGicpKJ6hmSPK+sFgcWwM8J
         iqpDD/eBiikHEVPWqXug2Vbl+m7mqTv3be/dSeiCSKKAjhw5hi8kp17ZXmcSAuaopYtj
         k9LgJBvRXA8dL5qo5ttnPJDHQLDG7VbOlfnc/hh44+KR2YzjrEKHmAFig/h+S4YtCs1B
         5M7Y7zn7TDldEbvun+sGKY73HQP0+0pgKejuUg91yWCKAR9MHPY6kOHO7KnX8i/eh394
         nH3t6LAz08wTZjqMK3nEAIiQffRtf7iZGh/eG7WCub7o3jqlLb8fhSm17s3m1lFQUGo4
         QdEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708850518; x=1709455318;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXcTHohQKUEWCG3AfRPALlxApVKdvPfbvuOAXc4fB5c=;
        b=t9W172TcIORHJ5gRpgIGm1qsqPBtvOv+xwQOzJZ84qX8ZpweGelc5T8Z2I+PjXmX3c
         N7d/WPw7FCkQXiuKlg9U4+q1nlz8Kn3Svt/JYAAPSCOmTja6nnEQmhveUrFYUrkaLajz
         FL6ao/vRRpcfqrApnpcl6o2CpNQSGOfhybW/zR8W5tV1vR6jMUrDqd2Pp23GNr4Ho27g
         /HsmmjZK4ZK96ktiWribMZoD0slub5RjeJ0j0t0xgA0IYAhbnXy9NeOXsnP/EDy1wTMb
         I3XVYp4EmuJyi3+t7gLbMP0tOCSKXXODLemqluzYo0Oa6/7bMZfeVKxnjv6GGTd3VQ1O
         8ffA==
X-Gm-Message-State: AOJu0YzKfwP8C8QzQ2AVyXH6OQZzwN6vuBsT3ttvlF+NfSCKEzaaIo99
	5veeoJPGWIKaeXBryPucfa5SADVea5FER1NzvsiEMqagYbzRB7QI74wHjtDaa/oZjg==
X-Google-Smtp-Source: AGHT+IHaSPeFmSU8LbgQp6DtCzv3SLULosPQKgzi/lNKyeSLUsDjebl0vj2X4o7c4Gbq1Kxs7N69Ng==
X-Received: by 2002:a17:902:db01:b0:1dc:6373:3cc with SMTP id m1-20020a170902db0100b001dc637303ccmr4354300plx.50.1708850518265;
        Sun, 25 Feb 2024 00:41:58 -0800 (PST)
Received: from dileep-HP-Pavilion-Laptop-15-eg2xxx.. ([2405:201:5c1b:782d:790a:81c5:9183:eca7])
        by smtp.gmail.com with ESMTPSA id w5-20020a170902d3c500b001dc2d1bd4d6sm1968425plb.77.2024.02.25.00.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Feb 2024 00:41:57 -0800 (PST)
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Sun, 25 Feb 2024 14:10:17 +0530
Message-Id: <20240225084017.418773-1-dileepsankhla.ds@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5117A3F3B7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nexus-software.ie,kernel.org,linuxfoundation.org,gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[2405:201:5c1b:782d:790a:81c5:9183:eca7:server fail,209.85.214.182:server fail];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[]
X-MailFrom: dileepsankhla.ds@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YABLPA7ORDU2IKKP2CIY4S7DGRFCTK3T
X-Message-ID-Hash: YABLPA7ORDU2IKKP2CIY4S7DGRFCTK3T
X-Mailman-Approved-At: Mon, 26 Feb 2024 14:48:18 +0000
CC: johan@kernel.org, elder@kernel.org, Dileep Sankhla <dileepsankhla.ds@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: put macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YABLPA7ORDU2IKKP2CIY4S7DGRFCTK3T/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Enclose the macro gb_loopback_stats_attrs defined with multiple
replacement statements in a do - while loop. This avoids possible
if/else logic defects and clears a checkpatch error.

ERROR: Macros with multiple statements should be enclosed in a do -
while loop

Signed-off-by: Dileep Sankhla <dileepsankhla.ds@gmail.com>
---
 drivers/staging/greybus/loopback.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index bb33379b5297..eb5a7a20f5a3 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,9 +162,11 @@ static ssize_t name##_avg_show(struct device *dev,		\
 static DEVICE_ATTR_RO(name##_avg)
 
 #define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+	do {							\
+		gb_loopback_ro_stats_attr(field, min, u);	\
+		gb_loopback_ro_stats_attr(field, max, u);	\
+		gb_loopback_ro_avg_attr(field);			\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.40.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
