Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0346BDBFD
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BEF0A3EBB0
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:35 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	by lists.linaro.org (Postfix) with ESMTPS id 0B9113EE23
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 13:59:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=JIiZNE3p;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.221.43 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id l25so7529548wrb.3
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJRQANhCEGiforjUF4Wz2oYn+hKUyKWCbODGuMeniSQ=;
        b=JIiZNE3piZTJCsdED37IIm8XMSp9EX72kmtzwU+J7mdYahgbVAMXowLQYViHJ7h9us
         98UEpwBDucgBmIApBqTPNHqtZm4vCsrtJQeGmKZUZ+v+aE2QpS0XMG+TEaXvZfPgrChj
         G888iVy92TQEqtYbGEZAv3suMTzOaLMl+YYCh4qSBOdMCfUkfmJbUAI53MFtCHTYHP7t
         9BgSpNHefw8483mdbzuReU2/fOupzw4AlnJxaNf5ZY/h3o6U3KgWUL5drplcszGqsCWU
         9yLw7G+Ew7BZn5C79OHCJsSB2ooeC8oynkEAqt2gMZluxQ2gVoB3obLIhjApQSQKrA//
         cZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJRQANhCEGiforjUF4Wz2oYn+hKUyKWCbODGuMeniSQ=;
        b=W76A/HWFTs1PLbQ1nncz2I6hfgqthyY+2+0Gw794oHzNCXOw/CDLyBTmLng1jmaQ8u
         SI9v0yxf0KB43LHNZ9bRz/QRzCAH1V5vGzaAWKQJBJpQosvlzM0kK5tyan+BttgWh6sr
         xYmlpBXqKMCG1hrjY8PNrmB+cruzmsnMQrIA/zNwidrYQPe3xaESW3fW39e4dJ8l/+c6
         CvJHM95PfmY//RbjtRjCHeXSJnoOVOJbqeuDbcOf0vZW8dy8MvrZBFGI/vSm4ABfE/W0
         6eE3h7gLcxde8hugervqlbxL6IEHQTjgPoEeNY2edzObR92UWxrqhDOPsULdVDxA7s60
         Cchg==
X-Gm-Message-State: AO0yUKWnN+EhwwBcN+32NfBz0SxGlieh2tx6c+kQpHDBMos3hwqfLr3l
	2t5FIOYzeaaE1dsjJmoflSI=
X-Google-Smtp-Source: AK7set+flWmWv1HNs5ZSs/7+QBbG9EVcruCl00JPP/7DWKMEE8Tg5+ucOu2vofksMgs5muQs2jBs2g==
X-Received: by 2002:a5d:4b04:0:b0:2c5:3cfa:f7dc with SMTP id v4-20020a5d4b04000000b002c53cfaf7dcmr20930026wrq.7.1678543165955;
        Sat, 11 Mar 2023 05:59:25 -0800 (PST)
Received: from alaa-emad.. ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d5109000000b002cea8e3bd54sm245257wrt.53.2023.03.11.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:59:25 -0800 (PST)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: outreachy@lists.linux.dev
Date: Sat, 11 Mar 2023 15:59:19 +0200
Message-Id: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0B9113EE23
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.43:from];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_CC(0.00)[nexus-software.ie,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GYCSULH6PZAE5C3ONERFLY3JHZB4TJDA
X-Message-ID-Hash: GYCSULH6PZAE5C3ONERFLY3JHZB4TJDA
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:54 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GYCSULH6PZAE5C3ONERFLY3JHZB4TJDA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

" ERROR: Macros with multiple statements should be enclosed in a do -
while loop"

Reported by checkpath.

do loop with the conditional expression set to a constant
value of zero (0).This creates a loop that
will execute exactly one time.This is a coding idiom that
allows a multi-line macro to be used anywhere
that a single statement can be used.

So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
fix checkpath error

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/loopback.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1a61fce98056..e86d50638cb5 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
-#define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+#define gb_loopback_stats_attrs(field)					\
+	do { \
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field);				\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
