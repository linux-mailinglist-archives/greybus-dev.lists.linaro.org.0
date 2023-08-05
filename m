Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B4770D2B
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Aug 2023 03:42:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D5163F0B6
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Aug 2023 01:42:43 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	by lists.linaro.org (Postfix) with ESMTPS id E165C3E917
	for <greybus-dev@lists.linaro.org>; Sat,  5 Aug 2023 01:42:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=MT7P9SzD;
	spf=pass (lists.linaro.org: domain of madhumithabiw@gmail.com designates 209.85.160.47 as permitted sender) smtp.mailfrom=madhumithabiw@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1bf54f415afso1674647fac.3
        for <greybus-dev@lists.linaro.org>; Fri, 04 Aug 2023 18:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691199756; x=1691804556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SR4+0lK8VMa7xEJXrkPeazYWkv8MbM9OkffI+Wr4AlU=;
        b=MT7P9SzDvq3ZHRNDZExMw50zHVv9hnPu4zmqDXEEci98q5btHQOIQb0/T/ASjxgoYK
         u5OtHfy3UJNc36TeWj/1Z45/wC/4qV7nnb8Vdy5lbtVtkimaN803ZsGYDncvjP3GMtSF
         OoRYkO6xzMcDYjFIcwTOFsyd+ISJt5GjXo5lHD9os9qWQaaAYWR1MIlDrqF0eQHGTiCc
         A1r5UcE8FXCgIk0dFctLYA6VUxpqty2cpIGm3/tf7DnWeFhEF1djbAvVqxuoEM4GNacg
         N+Ht7qhleRaT90+f7gW0OEg0zpgYHOONBaIwOOTZZXHD/tpvvR3rRSUySFEe/W+5DhtM
         FkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691199756; x=1691804556;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SR4+0lK8VMa7xEJXrkPeazYWkv8MbM9OkffI+Wr4AlU=;
        b=CuO2ikHIcvAKjvETcAgmBT3MNmV7FiLLiJ6m+3HjTt2vGMadWaVWZgVkfddA0Z/6gs
         Bee9OkrUIktrPy7aQm547IJEgU8lOqtKECj1iGtaLA5qR5Hm70fqwIc2WSGJEYEcKG4I
         fKdrp1amm1WwCEoiG+rP99E4Wg4Qk0tM7yclN944OXMTaAsZvPx0eLCpp7bs93rPeQpX
         vYwhiDmCxQudP8NUQPfuxaiVhS7+OudQ2b9B82SGeTAYsWL2SQd4Z6rB4HNhbdtHjR5u
         ZEtYJ/pbxir1/CFcU+aDj+7p8dvC4UykLfh4vyDpFFCP5QJPbZtMSX25eSBsHkOLIZ4E
         9TRg==
X-Gm-Message-State: AOJu0YyVNc+0Fg1GMUDbjsFhNuDRr0+4j5st2WsYhaJN3PQRPFO07/3c
	qCf4+j1hYP8VRNTFU8MNWSY=
X-Google-Smtp-Source: AGHT+IFBWyNqEvS4q0WvesTp6PCfMAaDtxmOs5YBue/bsaJxgXfOd7Kb003+ZuRH1oaq86Bv8XjGAQ==
X-Received: by 2002:a05:6871:452:b0:1b7:4521:31f with SMTP id e18-20020a056871045200b001b74521031fmr3373967oag.18.1691199756170;
        Fri, 04 Aug 2023 18:42:36 -0700 (PDT)
Received: from madhu-kernel (99-145-207-128.lightspeed.austtx.sbcglobal.net. [99.145.207.128])
        by smtp.gmail.com with ESMTPSA id v3-20020a056870e28300b001b36699bd5fsm1872379oad.35.2023.08.04.18.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 18:42:35 -0700 (PDT)
Date: Fri, 4 Aug 2023 20:42:34 -0500
From: Madhumitha Prabakaran <madhumithabiw@gmail.com>
To: vaibhav.sr@gmail.com, mgreer@animalcreek.com, johan@kernel.org,
	elder@kernel.org, gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <20230805014234.GA948556@madhu-kernel>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E165C3E917
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[99.145.207.128:received,209.85.160.47:from];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.160.47:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[11];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
Message-ID-Hash: H55SX4OMDWGKKFZGZR2NQEPYIVUMEXEC
X-Message-ID-Hash: H55SX4OMDWGKKFZGZR2NQEPYIVUMEXEC
X-MailFrom: madhumithabiw@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: skhan@linuxfoundation.org, ivan.orlov0322@gmail.com, madhumithabiw@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: Refactor gb_audio_gb_get_topology() into separate calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H55SX4OMDWGKKFZGZR2NQEPYIVUMEXEC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Refactor gb_audio_gb_get_topology() into separate calls for better modularity

Signed-off-by: Madhumitha Prabakaran <madhumithabiw@gmail.com>
----
Changes in v2:
Include prototype in the /audio_codec.h, as
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202308050511.y5Yb9otW-lkp@intel.com/
---
 drivers/staging/greybus/audio_codec.h |  4 ++
 drivers/staging/greybus/audio_gb.c    | 67 +++++++++++++++++----------
 2 files changed, 46 insertions(+), 25 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index ce15e800e607..356143f3e241 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -176,7 +176,11 @@ int gbaudio_module_update(struct gbaudio_codec_info *codec,
 int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
+struct gb_audio_topology *gb_audio_gb_alloc_topology(u16 size);
+
 /* protocol related */
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+                 u16 *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology);
 int gb_audio_gb_get_control(struct gb_connection *connection,
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
