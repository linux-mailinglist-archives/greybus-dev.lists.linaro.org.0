Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0F498A15C
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Sep 2024 14:04:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C18B6447ED
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Sep 2024 12:04:26 +0000 (UTC)
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	by lists.linaro.org (Postfix) with ESMTPS id ED01E3F532
	for <greybus-dev@lists.linaro.org>; Mon, 30 Sep 2024 10:14:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=VFdLzg5N;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of chenqiuji666@gmail.com designates 209.85.210.195 as permitted sender) smtp.mailfrom=chenqiuji666@gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-71781f42f75so3892029b3a.1
        for <greybus-dev@lists.linaro.org>; Mon, 30 Sep 2024 03:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727691256; x=1728296056; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeqWJOPzZaRbF9gG0yA3SFCc22f9/UbzzT3ylYy44K0=;
        b=VFdLzg5N3yl8L1WExwFhZVeJ8zEWdJ6mZInmyOFnXPprIo4RyngXCuXzOpP2JwzWos
         D0KYoYRwZcW9BrD1xA1T9zXJ9YE9gGoGGStu9N5ASIHZMwNWmo4XhE8NtmG6lshEP3EQ
         LxgjPPxAWWWz8NdoAQD4pN2W51DHryknuYR4VkdDRIHHhd16UVqx31q4PzPC6et8uF+3
         +a+pmUH0GH1xdd6LYqetDZ5bci/LEHVYOHa3qZIh6eOO+quyi+x4c3e4DsG6X51opQ2h
         lDSqr0Ha0k4H0WNv7jge5WWUeYJs0tWm76vtpLkzyy/4qebscCR2XFfWZgzb7nWSDhmG
         3XFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727691256; x=1728296056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XeqWJOPzZaRbF9gG0yA3SFCc22f9/UbzzT3ylYy44K0=;
        b=R7VWGWjUy16f0jRXzHk/bcZEiYKkMx2kuLIHvvBM0dzdRMRp3GpodTsZHcxr8anRhd
         7FEzspMveZuxEFRn2lrMjJo2qpcQBnkSyGpItOTTglKDd2mfEZKTpSJkRpKdx6jGVMxv
         JZy7z7nJ+PhQnvTRPaYJe5UimB/4bFgh3A2ddwbi0h4vzStqZKykJMxHIhq9LPdvDd0a
         0OMtD3M0kieD8I/d8yNc7actJ9WXFrv2qLGUmDuA2LGjyAYbUGXzXADJPPSsg8iWI3bf
         gwHd4oDQT8Irm16YL98RbzoKwC00FhbrJT10zIdaWY4Xc9b35alEzuBJigNMrxdm6D8K
         IC5Q==
X-Gm-Message-State: AOJu0YxuOa+N0PMiBNi1wJlIah10bycWGDJ3oLIH1Cq0Df3bi7b5qtwF
	lQRZz0Zz7eDqnIe+P9tIpRrybdJzLXzlfDPxhBfEKSyBJPQVCUoG
X-Google-Smtp-Source: AGHT+IGKdx6IwYAgMFCo2EOm2aLHGc/L3S3ogRZ0t2c/hlLVQF5CXlJlAybcrG4oW/fHQrb/dtI+YA==
X-Received: by 2002:a05:6a00:1813:b0:718:d9fb:63e1 with SMTP id d2e1a72fcca58-71b25f3999cmr21202444b3a.10.1727691255909;
        Mon, 30 Sep 2024 03:14:15 -0700 (PDT)
Received: from tom-QiTianM540-A739.. ([106.39.42.164])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26536fd0sm5872043b3a.206.2024.09.30.03.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 03:14:15 -0700 (PDT)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 30 Sep 2024 18:14:03 +0800
Message-Id: <20240930101403.24131-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: ED01E3F532
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.195:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: chenqiuji666@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KQQ4J2JC4SZPS45XOBGCHY747Y7HA5OL
X-Message-ID-Hash: KQQ4J2JC4SZPS45XOBGCHY747Y7HA5OL
X-Mailman-Approved-At: Mon, 30 Sep 2024 12:04:22 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, Qiu-ji Chen <chenqiuji666@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KQQ4J2JC4SZPS45XOBGCHY747Y7HA5OL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Atomicity violation occurs during consecutive reads of the members of 
gb_tty. Consider a scenario where, because the consecutive reads of gb_tty
members are not protected by a lock, the value of gb_tty may still be 
changing during the read process. 

gb_tty->port.close_delay and gb_tty->port.closing_wait are updated
together, such as in the set_serial_info() function. If during the
read process, gb_tty->port.close_delay and gb_tty->port.closing_wait
are still being updated, it is possible that gb_tty->port.close_delay
is updated while gb_tty->port.closing_wait is not. In this case,
the code first reads gb_tty->port.close_delay and then
gb_tty->port.closing_wait. A new gb_tty->port.close_delay and an
old gb_tty->port.closing_wait could be read. Such values, whether
before or after the update, should not coexist as they represent an
intermediate state.

This could result in a mismatch of the values read for gb_tty->minor, 
gb_tty->port.close_delay, and gb_tty->port.closing_wait, which in turn 
could cause ss->close_delay and ss->closing_wait to be mismatched.

To address this issue, we have enclosed all sequential read operations of 
the gb_tty variable within a lock. This ensures that the value of gb_tty 
remains unchanged throughout the process, guaranteeing its validity.

This possible bug is found by an experimental static analysis tool
developed by our team. This tool analyzes the locking APIs
to extract function pairs that can be concurrently executed, and then
analyzes the instructions in the paired functions to identify possible
concurrency bugs including data races and atomicity violations.

Fixes: b71e571adaa5 ("staging: greybus: uart: fix TIOCSSERIAL jiffies conversions")
Cc: stable@vger.kernel.org
Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
---
 drivers/staging/greybus/uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index cdf4ebb93b10..8cc18590d97b 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -595,12 +595,14 @@ static int get_serial_info(struct tty_struct *tty,
 {
 	struct gb_tty *gb_tty = tty->driver_data;
 
+	mutex_lock(&gb_tty->port.mutex);
 	ss->line = gb_tty->minor;
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
+	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
