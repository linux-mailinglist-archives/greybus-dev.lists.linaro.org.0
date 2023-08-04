Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E837C7709B4
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Aug 2023 22:31:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9CF0B4159C
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Aug 2023 20:31:44 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	by lists.linaro.org (Postfix) with ESMTPS id 561953F492
	for <greybus-dev@lists.linaro.org>; Fri,  4 Aug 2023 20:31:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=sJxIClGp;
	spf=pass (lists.linaro.org: domain of madhumithabiw@gmail.com designates 209.85.167.182 as permitted sender) smtp.mailfrom=madhumithabiw@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3a3b7f992e7so1871868b6e.2
        for <greybus-dev@lists.linaro.org>; Fri, 04 Aug 2023 13:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691181097; x=1691785897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P2sRXegefcAEl333biQwB8H/OIszvfSG+NNQtF6Df6w=;
        b=sJxIClGpPyW2HMO2BQEMygYCD21+kw9MK5mfE9Jl0bGSq/VBa+BVWlZgjp4vfpCM73
         /itVh0mFRBTgD4yixQPHc5rzFzYUi9vH5ip3cSDi5ob+JbpJpA7B2wqzw23fFCr43Jfh
         K4sJnIIKjz9VqutdxqdXF3ZQRwpbRkVwe8mmNaKz3bZjS7Hg4DWd2sP5Le3PtrcKOATt
         cSBmau63g/oFdMg+agGgsDep9RcCgwjrZ4Z1PSAuBCsQS6FLKVO/KMAfQZ8mXo+7PaNM
         qSW3+wKvxkzd/FL0DxSr7mrtqvYRyX8W96NPAfdnJBn8cF++oNNSSv+qjGJ6QbRFHtXX
         DSfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691181097; x=1691785897;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P2sRXegefcAEl333biQwB8H/OIszvfSG+NNQtF6Df6w=;
        b=UnTYoC4NCw8/FNRxp1JVBCCGn5iOPs+eb9qKDHqe/ulxWOynxniiQuufryMb8DDZsL
         Xl+3Hj/SIMOAWkHpLb7Ed3xxD06ab3OY7E77nUWGPhQLqoaeFGiulGUzKfnjlylcZynD
         +ClsqPeTrtHImY39OIOYCF8iRBTVFJLigYjuvWzEPeebZ9wqB/1gtZs2gEEa0bnHQWdK
         XJ3v7v7IW70yp90ZjsjWNWpI+6YvSgneE+yVX6ynHHiXK89y06KEJCz1lbxpYz96Y0JK
         xMNwn9vHZe+jBYuhzZdVGRryrypJYYtg1VN4jy+JzpHDRpfm//z0/g71/gcfekrnQycX
         a03w==
X-Gm-Message-State: AOJu0YxEemLTDQMv/FEEXJulFufu3bTAUkmwTTclR819iydlPYVfY93D
	qwbNL61Qwp2ksMxVUTEV4d4=
X-Google-Smtp-Source: AGHT+IFSGKqv/EpwBMvrQ1Kag1VNKCAJJWEtIYcN330189QrIWtiqx2lwCILiFCLfVr3YgfuDwm90w==
X-Received: by 2002:a54:4e02:0:b0:3a4:57a7:b30e with SMTP id a2-20020a544e02000000b003a457a7b30emr2404804oiy.26.1691181096638;
        Fri, 04 Aug 2023 13:31:36 -0700 (PDT)
Received: from madhu-kernel (99-145-207-128.lightspeed.austtx.sbcglobal.net. [99.145.207.128])
        by smtp.gmail.com with ESMTPSA id e22-20020a05680809b600b003a75b6cbd38sm1467104oig.45.2023.08.04.13.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 13:31:36 -0700 (PDT)
Date: Fri, 4 Aug 2023 15:31:34 -0500
From: Madhumitha Prabakaran <madhumithabiw@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <20230804203134.GA618419@madhu-kernel>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 561953F492
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[99.145.207.128:received,209.85.167.182:from];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.167.182:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: FYON5RSGKJLE5SQ6AW3DGDRHQJIDN65B
X-Message-ID-Hash: FYON5RSGKJLE5SQ6AW3DGDRHQJIDN65B
X-MailFrom: madhumithabiw@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Refactor gb_audio_gb_get_topology() into separate calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FYON5RSGKJLE5SQ6AW3DGDRHQJIDN65B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor gb_audio_gb_get_topology() into separate calls for better modularity.

Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 67 +++++++++++++++++++-----------
 1 file changed, 42 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..a48ddadd6f1e 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,39 +8,56 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+int gb_audio_gb_get_topology_size(struct gb_connection *connection, u16 *size)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
-	int ret;
+    struct gb_audio_get_topology_size_response size_resp;
+    int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
-	if (ret)
-		return ret;
+    ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+                            NULL, 0, &size_resp, sizeof(size_resp));
+    if (ret)
+        return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
+    *size = le16_to_cpu(size_resp.size);
+    return 0;
+}
 
-	topo = kzalloc(size, GFP_KERNEL);
-	if (!topo)
-		return -ENOMEM;
+struct gb_audio_topology *gb_audio_gb_alloc_topology(u16 size)
+{
+    struct gb_audio_topology *topo;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
-	if (ret) {
-		kfree(topo);
-		return ret;
-	}
+    if (size < sizeof(struct gb_audio_topology))
+        return NULL;
 
-	*topology = topo;
+    topo = kzalloc(size, GFP_KERNEL);
+    return topo;
+}
 
-	return 0;
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+                             struct gb_audio_topology **topology)
+{
+    u16 size;
+    int ret;
+
+    ret = gb_audio_gb_get_topology_size(connection, &size);
+    if (ret)
+        return ret;
+
+    *topology = gb_audio_gb_alloc_topology(size);
+    if (!*topology)
+        return -ENOMEM;
+
+    ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
+                            NULL, 0, *topology, size);
+    if (ret) {
+        kfree(*topology);
+        *topology = NULL;
+        return ret;
+    }
+
+    return 0;
 }
+
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
