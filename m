Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BA7CD6A66
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Dec 2025 17:21:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 49CF03F9AD
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Dec 2025 16:21:52 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	by lists.linaro.org (Postfix) with ESMTPS id 0CB2D3F7D9
	for <greybus-dev@lists.linaro.org>; Mon, 22 Dec 2025 16:18:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=I2vAgzcd;
	spf=pass (lists.linaro.org: domain of khaled.saleh.req@gmail.com designates 209.85.208.51 as permitted sender) smtp.mailfrom=khaled.saleh.req@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-64baaa754c6so3631428a12.3
        for <greybus-dev@lists.linaro.org>; Mon, 22 Dec 2025 08:18:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766420336; x=1767025136; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3w4oHlFOdPzEk3v7dhC8z4lrYMgtc8u75s3nHlwvA0=;
        b=I2vAgzcdIcBrVlfkm2EVg6OeUrEOa3JkVViS2fv+kTpg7ewtsvOkvpCjpJsxvYck4A
         sYW64a9+eKb3dWlcYvpOXqhrOpxtVLGFxW85WvuxuQnwINAhfVV2buAoTrbIwEsKUq8P
         mjplCl1hCaOcua/tHpFeUlLOpZh2R2sGeIFTejuuv4Bt4012BJAUFGn2rrRnS036RFMt
         5/FMH6zu6xrHHZO8W/H28G+ejjn5TraexsGISdHzNVP63e0ISSbv0dN7ZCUDdKTruJCV
         iJemRmTusrycZk6xpYwKr3Jvf85kG0JjfaXKrY9W5CmMs5yZTt6WKFxxesgSzSjU2pS8
         JYBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766420336; x=1767025136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3w4oHlFOdPzEk3v7dhC8z4lrYMgtc8u75s3nHlwvA0=;
        b=VqOgI3xhuF/8dYUuB9/RqAY2TlqeDd55JJUXE9gBlJlOqSwS9r+n5Nc4XtsnrBEp/I
         2VWU0KKBAxVyCiIzcz6l65zNriKaBTiD6FwrB35L4qv8cfONZUF3yTtDLsncvBkm1MBj
         kDJpS+p8I2pTE5xqE5Zr88ylu/Do3qy0VdxCaC4WRMQYYPGerWBLsq+UxNGcoL0EBQ/y
         ysnYJM/acVwnZguwsI+MDTyvGcd9eQXCmqBMkOCJGv2WuDWV6BFMc0g72iK/sGUcpttD
         9Ut3VdydSdCNs7bD+jyPynCesiPQ1ZaokE4e9Ddqg/FmoJHzoyGUNdwAhQjWY98K1cpZ
         Fmmg==
X-Forwarded-Encrypted: i=1; AJvYcCUOtC8ClzkYUkd35YTlfmbH9Y2wTRTgTyQE1DLqgia3fadBckUNTrdtk5VHNZ+IYY8kCjCn6UysIdXFOA==@lists.linaro.org
X-Gm-Message-State: AOJu0YxJRBVdM3Kpqcqv94nn7FCJgudHhSw0zh1cztxrfAc7EmEGCnJe
	7jkZPZPOKJkkwYT6S3tcAnBT6Kwo07KeV/TQSaZk1Vk4TXMZpZLjgUgN
X-Gm-Gg: AY/fxX46eHSZ7NKyl2qkcQXRTtG1YUUa/Gtx/QsbyOpCSjomhxjaE64QTe0f51cxI+P
	O3fA6iUheq76gnd34A0nT1cjAd2iKZMw7f7VVSu2wXThbaTeK9hrj3HW5fdDud2zTORTDWaFmsc
	6tfeF/7pO5X21JlmCsbRB1AdttXfkKfbncVblDsQFZyGJLneCD/UXdbr54UGKinBlCWrwiRlzkB
	/uTxCpiRibmxuVH+X7SdNmxS+GiBQLxDaUlCzslZ9cVy/HCEg5xp3CrLYHJ0T0YwikdERAcyOtd
	reVCVnCXFc0l93tw4+uRUEByOWSpFVPPYRJIAIRF9lDjSLSZ04mbsUfBWLGm//jDxCNmsuStgUn
	v5DPReo9Sblnu75TShfYWSj2+eyfivedbCJWLMgqDpSsPpGSuNIaZBgYwDViAuFrWh4pDRSxXnI
	hspRJQAb6NRYeT2M/Tem3fykZELEz4pz1K
X-Google-Smtp-Source: AGHT+IEBXMSCUAdjhwO5bhx+wwR8i4ksecx8ybEZ1rOxrFCYh9R1J06gztIvyz7VZslZCVs4VRd+wA==
X-Received: by 2002:a17:907:d1a:b0:b73:78f3:15c1 with SMTP id a640c23a62f3a-b803725fb6dmr1151827266b.52.1766420335705;
        Mon, 22 Dec 2025 08:18:55 -0800 (PST)
Received: from localhost.localdomain ([105.42.152.221])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8056ff4925sm687121566b.31.2025.12.22.08.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 08:18:55 -0800 (PST)
From: Khaled Saleh <khaled.saleh.req@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 22 Dec 2025 18:15:17 +0200
Message-ID: <20251222161517.6123-1-khaled.saleh.req@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-ed1-f51.google.com:rdns,mail-ed1-f51.google.com:helo];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linux.dev,lists.linaro.org,gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.51:from];
	BLOCKLISTDE_FAIL(0.00)[105.42.152.221:server fail];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0CB2D3F7D9
X-Spamd-Bar: --
X-MailFrom: khaled.saleh.req@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SPISVSG7NXBWLOZQXARUAPVVJAWFSWME
X-Message-ID-Hash: SPISVSG7NXBWLOZQXARUAPVVJAWFSWME
X-Mailman-Approved-At: Mon, 22 Dec 2025 16:21:50 +0000
CC: linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Khaled Saleh <khaled.saleh.req@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: split gb_audio_gb_get_topology() into helper functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SPISVSG7NXBWLOZQXARUAPVVJAWFSWME/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

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
