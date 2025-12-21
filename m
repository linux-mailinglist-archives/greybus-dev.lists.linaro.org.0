Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 110FECD5F30
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Dec 2025 13:16:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22723400CE
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Dec 2025 12:16:55 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	by lists.linaro.org (Postfix) with ESMTPS id 040373F69B
	for <greybus-dev@lists.linaro.org>; Sun, 21 Dec 2025 19:43:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=K2IOSXgi;
	spf=pass (lists.linaro.org: domain of khaled.saleh.req@gmail.com designates 209.85.218.44 as permitted sender) smtp.mailfrom=khaled.saleh.req@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b79d6a70fc8so562541766b.0
        for <greybus-dev@lists.linaro.org>; Sun, 21 Dec 2025 11:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766346204; x=1766951004; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jxh4QQw2NyKDdmoVRlV29xSMRqLITbJdSU7eZMok6SE=;
        b=K2IOSXgioHbFUHcysoyPwRMzxE7Rv7Vmu1NiWnnQ0rxMwefJoe/vEoMoL8X1s8ocAd
         LplK5gj/WsmvybDtuX+avEoKT+fjU6j+vog8kaQSv8DVLUxeREVpMpwYQkOYIDut0//d
         HqzsFoY1UNDLnuX73qywLojiXsSmHBgVZgeCixWXyxzC0lVF93FZi7qOTr7dcIYdduam
         ZAXCHo/zKqMBECzTMD2FWuOUN+9a88o4HgHwtoLVWX6VvoIDh5m3l0YYyqdxvgTWYfm1
         RJ4atPFS3d+ACPsZVNOJe33KBTtYdaXFEr51fUGQJmuHwhPGbBdHfRy+96Df4qb7Xzjl
         lgmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766346204; x=1766951004;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jxh4QQw2NyKDdmoVRlV29xSMRqLITbJdSU7eZMok6SE=;
        b=wnwL6djt3o/dn/xRap0owZhqHcXI62dv9BfRUGoLy1Wx54S1VCQVQJYcy0tbcYL7sz
         kkO6xkTwXnX3N4bWYTDvuxPLxDCaJZ7bvoZv2lifEE+gPvyHDtYqdVrw8wSkI3woCN68
         FwNNi7UyrPQliDnf0giA+oiyfZgwg1nAhViSV9WJR11p69XNd2mP+DMECymusPywuzxn
         yfm60gGYRqGXEOO3WvPaRbabLixlypwg70PlH/hXqlMFtKImGGpu/Bg9mnE4ILXuVV6Y
         zwyxHNZP/XKHG/HAcJ2ECIggbmbuz3icjqKLK6UYlpAZeCZj3U+E55a6vMEmJQF3HhmF
         Lk5A==
X-Forwarded-Encrypted: i=1; AJvYcCWvbmezKILCUZ22X5omVy+xX+1nH77ZjjBlJV+Gb/ZDoevZB7FIk7lr7OgnK6y0lUIQyEgeJqPOe1Mf4A==@lists.linaro.org
X-Gm-Message-State: AOJu0YykJeMG1yaTLyEOQcArZxVTka+slgOosFMA/ox8RZdcyxwhPVrr
	LGfoA6435+9xd5Nr96Qx3SbQCCHHn1EUXQogCyvMwFlSAeFBJJisq1Ks
X-Gm-Gg: AY/fxX6n0emfPp65iLHssU9M8OpNApgRKzjEimXNx2rm75EzlSzuY7+5WuXC21XDD9p
	kC6pXceaSGKytQnypmobjRGBF3LgfbJ65vUTgCsdej7tebq6x4y1oaimvZo5n/v8RhZspVHiLYn
	dT5ZoWz1FEYyimQnQoecJ7CEIPAlU8bHYJmxbin0ZKcl61rnbw5OH1+OdwprpT3unVHVR/Z9L4D
	spFLRwk0uufTKM7zp3T9WngBfRyBkT/1PwF4xDkGkpS3ctryhRClFRG5mW4Ijwkbh/4DSU9Qmh0
	YOQP8QT6V+kaHNJNZE6u1UIlEBISbZSouGx06C6KWRc2mDULh+a6BYdTiHN17y2PKN6w/mZak3T
	B3HsUd//3EQUwhNT2DcKDeoIu0g8Dq6CbWaFLK+w/q2/qDklKJadT9+c9FqCpCi33VCI/1X7yjt
	HjNvbIwQfzC92UwgWHdFSqIaD9LI19nw==
X-Google-Smtp-Source: AGHT+IGkIfh0VwS6BbVacOE2kQwJxWv5qp/5Cxbpal1MiVKjNto7RZRca4sUvWddiXaTy/fN+uPhCw==
X-Received: by 2002:a17:907:75c3:b0:b80:3fb7:f3a8 with SMTP id a640c23a62f3a-b803fb7f6f6mr581892766b.63.1766346203667;
        Sun, 21 Dec 2025 11:43:23 -0800 (PST)
Received: from localhost.localdomain ([105.39.61.76])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8045a086fasm653170066b.70.2025.12.21.11.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Dec 2025 11:43:23 -0800 (PST)
From: Khaled Saleh <khaled.saleh.req@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 21 Dec 2025 21:42:00 +0200
Message-ID: <20251221194200.3734-1-khaled.saleh.req@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.linaro.org,gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	BLOCKLISTDE_FAIL(0.00)[105.39.61.76:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.218.44:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 040373F69B
X-Spamd-Bar: --
X-MailFrom: khaled.saleh.req@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XBUTLOV4VW2BXODFBVBE5ALGNUMXBKXA
X-Message-ID-Hash: XBUTLOV4VW2BXODFBVBE5ALGNUMXBKXA
X-Mailman-Approved-At: Mon, 22 Dec 2025 12:16:53 +0000
CC: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, khaled <khaled.saleh.req@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: split gb_audio_gb_get_topology() into helper functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XBUTLOV4VW2BXODFBVBE5ALGNUMXBKXA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: khaled <khaled.saleh.req@gmail.com>

The gb_audio_gb_get_topology() function performs multiple distinct
operations: retrieving the topology size, allocating the topology buffer,
and fetching the topology data. A TODO comment in the file notes that
this logic should be split into separate calls.

Introduce helper functions for each step and update
gb_audio_gb_get_topology() to use them.

This improves readability and maintainability without changing behavior.

Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 47 +++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..0d5109ec14f6 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -9,36 +9,61 @@
 #include "audio_codec.h"
 
 /* TODO: Split into separate calls */
+static int gb_audio_topology_get_size(struct gb_connection *connection, u16 *size)
+{
+	struct gb_audio_get_topology_size_response resp;
+	int ret;
+
+	ret = gb_operation_sync(connection,
+				GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+				NULL, 0,
+				&resp, sizeof(resp));
+	if (ret)
+		return ret;
+
+	*size = le16_to_cpu(resp.size);
+
+	return 0;
+}
+
+static struct gb_audio_topology *gb_audio_topology_alloc(u16 size)
+{
+	if (size < sizeof(struct gb_audio_topology))
+		return NULL;
+
+	return kzalloc(size, GFP_KERNEL);
+}
+
+static int gb_audio_topology_fetch(struct gb_connection *connection,
+				   struct gb_audio_topology *topo, u16 size)
+{
+	return gb_operation_sync(connection,
+				 GB_AUDIO_TYPE_GET_TOPOLOGY,
+				 NULL, 0,
+				 topo, size);
+}
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology)
 {
-	struct gb_audio_get_topology_size_response size_resp;
 	struct gb_audio_topology *topo;
 	u16 size;
 	int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+	ret = gb_audio_topology_get_size(connection, &size);
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
-
-	topo = kzalloc(size, GFP_KERNEL);
+	topo = gb_audio_topology_alloc(size);
 	if (!topo)
 		return -ENOMEM;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
+	ret = gb_audio_topology_fetch(connection, topo, size);
 	if (ret) {
 		kfree(topo);
 		return ret;
 	}
 
 	*topology = topo;
-
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
