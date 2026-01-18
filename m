Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 822E8D39BA9
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Jan 2026 01:43:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5EC823F79D
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Jan 2026 00:43:32 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by lists.linaro.org (Postfix) with ESMTPS id 0F82C3F9A7
	for <greybus-dev@lists.linaro.org>; Sun, 18 Jan 2026 06:06:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=I8kKgSZx;
	spf=pass (lists.linaro.org: domain of architanant5@gmail.com designates 209.85.216.41 as permitted sender) smtp.mailfrom=architanant5@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34c5f0222b0so1535032a91.3
        for <greybus-dev@lists.linaro.org>; Sat, 17 Jan 2026 22:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768716363; x=1769321163; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5L/u55ojOMWDoZfJfBy/ViDPd1rJfbOcCEU36M5eKa8=;
        b=I8kKgSZx/j0+UPvfNJMGt91sl0zWyef0mubKKKHAfXmemhM5BsNr7vyePn0JNM/RcX
         G0JBVH7+ejAAuzeDidpdGOXSMoNTjE8IVsM2BfFFAnsKUTMZWOeFpsDUUJ23FkqA6Ocv
         FrP9+o8T0zSVvg3SPYuPlccWvNIl5D5X2sQ14cw9Jx1aD3lbrAc+GCJk/VRZB4P8uTRL
         ZSVMNLXFZRESfLcAAxiojzFWvGzSLEsMY2IrZGZYSyVYpsImaJOAdXC9zKbeGzFc69z8
         T1dDS4z7Pv0mrOQeUp/WHqUyBRFfUi3eBPXmn1v+w7QCOL++1YpXg36VsJk+/5peXnyS
         bGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768716363; x=1769321163;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5L/u55ojOMWDoZfJfBy/ViDPd1rJfbOcCEU36M5eKa8=;
        b=FJyhFy0tMa9dl5kYaCT5BjG4PxFVjiwxNA1wWwH/smRZaRj87LDNVLxbG67jBwPG7R
         ERcjUCoMMtK2bnMzgd0yaUM2aWvmoogp94Tk57RviR+ospssj//zw/FZikIHxZYUNSCg
         ZYemwDdxdib7ucMf3WRcUjFnE4PZs5Gz8buIKPGt3yx54RF3P6+OFG717xE7/rHp7Io7
         RQ/x6fYE+1GkbExQCLnpBkV/U42v2J+a7ALsyzYMaSFYZT563mdd5zFC1zrxO1Roon6F
         OQUpCrcdU+59sUXp+sWXkrgRbk8rQJlE201pY3Yy4qvwmgzZFdg5k7cK+B4kR9/lSROr
         GQVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVpmb4BfA7+t4AERIoWAGWI0+XIyq+G0h9JWNVXyI0i8Ig4dE5W2uQdXqGyVbGgQxuEBvQJ+pDqIB+rWQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy5oq8Xz9Nr3zAOBIxWwLhbHr0Lgb6eHlS+n8WPQtmRMwpCPbo1
	sutcMfvxyFHmp3D/THjtUFBWed84DG7r9K8xJ/t8ZCMQXHkxKE1jpoIG
X-Gm-Gg: AY/fxX68eiQ5qfwo9qjzlWd9h3xcyAG7GjnBFvnZTZX0gjNDoAd+Obl+u3JNwxHTV+7
	QG2dSJD2n+B34ujbx2Dt6+jajOF6XJyV6RNiU9b/1f9UzAa4voxRPwXEfL/s8CnCfvE9Dy6ZhMq
	FsPcu4IJNnG3tHja6LRgCpNx7KOAKIArXZc/UkgqMpEzoYz6j+f+yxApDEt64gbvrpp1nHUj7tl
	koEE/xmMSJ1eMz5s9QnKlq7ZbCYv3Vr5tkHLRzuV3sAqdo80V8xiKTruHgVgwaoWxFQfrpveGaf
	IabvsZ+rEOTaAmVtJOzsCachgtrhxN/IZDx6KGCpww8IeS+K1PXr4IyjEF+EPXXYSlTNjAr+5GG
	roEPPhwEWT1/zBD14LIPJTTqf5QyjPeFPRkEq59bU0D+cwhOXtIbAlaZzmlahaMNwzuKvj0rp66
	YVOmIxVTKIkDzPzqjS1bA+OBW+z0ykGg==
X-Received: by 2002:a17:90b:350e:b0:33e:30e8:81cb with SMTP id 98e67ed59e1d1-35272edb3b6mr6658940a91.13.1768716362963;
        Sat, 17 Jan 2026 22:06:02 -0800 (PST)
Received: from debian.ari ([152.56.157.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3527305490fsm5730026a91.1.2026.01.17.22.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jan 2026 22:06:02 -0800 (PST)
From: Archit Anant <architanant5@gmail.com>
To: vireshk@kernel.org,
	johan@kernel.org,
	elder@kernel.org
Date: Sun, 18 Jan 2026 11:35:48 +0530
Message-Id: <20260118060548.24548-2-architanant5@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260118060548.24548-1-architanant5@gmail.com>
References: <20260118060548.24548-1-architanant5@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0F82C3F9A7
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.41:from];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[ptr_err_to_pe.cocci:url];
	ARC_NA(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.216.41:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: architanant5@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DVRRBIEJVN7YA3LD2W4YPG2HT5QOR6JF
X-Message-ID-Hash: DVRRBIEJVN7YA3LD2W4YPG2HT5QOR6JF
X-Mailman-Approved-At: Mon, 19 Jan 2026 00:43:31 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Archit Anant <architanant5@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/1] staging: greybus: fw-core: use %pe for error printing
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DVRRBIEJVN7YA3LD2W4YPG2HT5QOR6JF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Use the %pe printk format specifier to print error codes as symbolic
names (e.g., -ENOMEM) instead of numeric values. This improves
readability of error logs.

Issue identified by coccicheck using the ptr_err_to_pe.cocci script.

Signed-off-by: Archit Anant <architanant5@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 0fb15a60412f..1ad404d69b87 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -112,8 +112,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create download connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->download_connection = connection;
 			}
@@ -131,8 +131,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create SPI connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create SPI connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->spi_connection = connection;
 			}
@@ -149,8 +149,8 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			connection = gb_connection_create(bundle, cport_id,
 							  NULL);
 			if (IS_ERR(connection)) {
-				dev_err(&bundle->dev, "failed to create Authentication connection (%ld)\n",
-					PTR_ERR(connection));
+				dev_err(&bundle->dev, "failed to create Authentication connection (%pe)\n",
+					connection);
 			} else {
 				fw_core->cap_connection = connection;
 			}
-- 
2.39.5

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
