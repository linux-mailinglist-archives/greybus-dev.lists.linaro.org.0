Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLEHIGfmr2nkdAIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 10:37:43 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D5C248981
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 10:37:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7FBC93F98A
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Mar 2026 09:37:42 +0000 (UTC)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	by lists.linaro.org (Postfix) with ESMTPS id 81C773F69B
	for <greybus-dev@lists.linaro.org>; Mon,  9 Mar 2026 23:05:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=icxHvdGk;
	spf=pass (lists.linaro.org: domain of luistermc789@gmail.com designates 209.85.221.170 as permitted sender) smtp.mailfrom=luistermc789@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56aeaa75cadso2113700e0c.3
        for <greybus-dev@lists.linaro.org>; Mon, 09 Mar 2026 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773097511; x=1773702311; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EayLIqCrKmuAOgPEtBGDOmJISWy5NxhD06YKjOvpoo8=;
        b=icxHvdGkc/p4I6LCjRK5SVK53+kS/bhkbQiqFHnHfS8vVozqLmX4AMkOsc8HUfPgzX
         x5o/qfbEajw8mXLq+bJI406R6jXEPDi2iRrrgECTw/mx6ZDCj/si+iszuRCkzDChHGxh
         CMmmqDA52vAIh8v6G3yyvFuuMvaLewSchkwxxFdbDJsOKIdiFPTjYX20iijATkDjGZM1
         BNUN/KjPGuTInQoOU0ExxiwBK5YCwSjx7gYY8nN+es8yBPgcXDmPIyvv71m+w1z/Z4K5
         8/VQhU0/t2790RcJEJ4YvCqDrZRNxj+qQnMfeR/NsdkyZ8Q7yV810YSS2SmQfDl+BEq7
         g7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773097511; x=1773702311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EayLIqCrKmuAOgPEtBGDOmJISWy5NxhD06YKjOvpoo8=;
        b=MuwUaTFSe+yDpDjmoP+KuYYdAw33RRpIPL5enU9473DwbmGA2Iamc7/qgK/lOCOa9V
         A6v1oMp6gMH+FwdT6mztsVNe09RG+urDixAGcQ7j1ESwbUmCkisBLL2KVNlvih3nyz9B
         LpJjGtdBu6jQl3+JoRPrtBbisOUUFhj/l7HYM/rALF0R2/vtwlyd3Mg9vqNZr2zMhjmO
         pRIRpRvhnfSPiCCULDVJG8GWHEKr+Gz4sMjXn8/+ZXGlfz3Bxf+w97k95EAaJuL2Uz5d
         /nCApvMp5t4goeb4X09XaQdIG9MpaBqMtD7SROsGCbHxUp2tAE7aTZ2390Wh/TWtcS90
         pang==
X-Forwarded-Encrypted: i=1; AJvYcCVCtkU2rIg/MvpBpctTT14JRfymPYOexvUpC7Wrg1YGmGfCxhgbNpIjYhWWFtWmN1+Umb5aPDOa1F7rbQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YzOZgrY86d2Uf54hAcI2I1X+/jrXsX5sSxCScmoA3moRmrv9NVv
	s3QNBqclxSq788CR97vaRiAFKy17hZK5pyWkkZQifFPaY20XCZMuI/cL
X-Gm-Gg: ATEYQzzuELfX5BqgbGsA2jKgEVi5kJqLXG+MIeO+wPwMorf6zWeRoDwjFPOlREL9qsr
	E91pmWMFg+huZvUYQHq3Oh7S7uXf721/E5XrBvvUhDPr18qoX4ys9EEc9neauTyPh83f8l+X6we
	eyXICThVQjFBmTlZzV663qy8pEDzMieNTDUQoJRgwDObZbfywFtX395rrDgghKklpSj5HYwkGe/
	Ao7bopxV0oaCPKPjlI6CMcB3qNznoO5qONsTXbttpIAaBW2JtdweSmjHBHH+lISuT09Ag3F9Ld/
	CYEbcjwYxZn4Ux6Eo++qjm/S8T0RGt7PTnkGBu665qkVmiBAjdihrfkHm5Roavd/U48FTkIwFKa
	I7teKT4Yj7JvXlS7Zy6RXSU9uVMkZOr6EU2ich0iXVEJ5dry/LxzuEaamvUVw/65gQT5ZCrhiNd
	AJ/x9dphUJsadWpw==
X-Received: by 2002:a05:6123:14f:b0:55b:305b:4e45 with SMTP id 71dfb90a1353d-56b07e9d2f4mr4274311e0c.17.1773097511039;
        Mon, 09 Mar 2026 16:05:11 -0700 (PDT)
Received: from horus ([138.97.160.237])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b09b6ac44sm10441332e0c.19.2026.03.09.16.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 16:05:10 -0700 (PDT)
From: Luis Soza Rodriguez <luistermc789@gmail.com>
X-Google-Original-From: Luis Soza Rodriguez <contact@sluisr.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon,  9 Mar 2026 17:05:07 -0600
Message-ID: <20260309230507.4931-1-contact@sluisr.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: ---
X-MailFrom: luistermc789@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PB6E4IIQKUCPM4DJCVW7OTPIMSTJ2IXD
X-Message-ID-Hash: PB6E4IIQKUCPM4DJCVW7OTPIMSTJ2IXD
X-Mailman-Approved-At: Tue, 10 Mar 2026 09:37:36 +0000
CC: dan.carpenter@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Luis Soza Rodriguez <contact@sluisr.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: loopback: use sysfs_emit in sysfs show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PB6E4IIQKUCPM4DJCVW7OTPIMSTJ2IXD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 60D5C248981
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.231];
	FROM_NEQ_ENVFROM(0.00)[luistermc789@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Action: no action

As per the kernel's documentation, sysfs_emit() is the preferred way
to format strings for sysfs attributes. It handles buffer overruns
safely. Replace sprintf calls with sysfs_emit across all loopback
sysfs show macros.

Signed-off-by: Luis Soza Rodriguez <contact@sluisr.com>
---
v2: align backslashes in macros as requested by Dan Carpenter.

 drivers/staging/greybus/loopback.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0..3a502d89d 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -125,7 +125,7 @@ static ssize_t field##_show(struct device *dev,			\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);			\
+	return sysfs_emit(buf, "%u\n", gb->field);			\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -137,8 +137,8 @@ static ssize_t name##_##field##_show(struct device *dev,	\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
 	/* Report 0 for min and max if no transfer succeeded */		\
 	if (!gb->requests_completed)					\
-		return sprintf(buf, "0\n");				\
-	return sprintf(buf, "%" #type "\n", gb->name.field);		\
+		return sysfs_emit(buf, "0\n");				\
+	return sysfs_emit(buf, "%" #type "\n", gb->name.field);		\
 }									\
 static DEVICE_ATTR_RO(name##_##field)
 
@@ -158,7 +158,7 @@ static ssize_t name##_avg_show(struct device *dev,		\
 	rem = do_div(avg, count);					\
 	rem *= 1000000;							\
 	do_div(rem, count);						\
-	return sprintf(buf, "%llu.%06u\n", avg, (u32)rem);		\
+	return sysfs_emit(buf, "%llu.%06u\n", avg, (u32)rem);		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
@@ -173,7 +173,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
@@ -199,7 +199,7 @@ static ssize_t field##_show(struct device *dev,		\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%u\n", gb->field);				\
+	return sysfs_emit(buf, "%u\n", gb->field);				\
 }									\
 static DEVICE_ATTR_RO(field)
 
@@ -209,7 +209,7 @@ static ssize_t field##_show(struct device *dev,				\
 			    char *buf)					\
 {									\
 	struct gb_loopback *gb = dev_get_drvdata(dev);			\
-	return sprintf(buf, "%" #type "\n", gb->field);			\
+	return sysfs_emit(buf, "%" #type "\n", gb->field);			\
 }									\
 static ssize_t field##_store(struct device *dev,			\
 			    struct device_attribute *attr,		\
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
