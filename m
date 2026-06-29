Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vSyiFNTaQmoOFAoAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Jun 2026 22:51:32 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D07C66DEB7F
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Jun 2026 22:51:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=h6Uo2YI1;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B786C40AF8
	for <lists+greybus-dev@lfdr.de>; Mon, 29 Jun 2026 20:51:30 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by lists.linaro.org (Postfix) with ESMTPS id BB6DC40A71
	for <greybus-dev@lists.linaro.org>; Mon, 29 Jun 2026 14:50:00 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c9e8a1d256so13053785ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 29 Jun 2026 07:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782744600; x=1783349400; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U3IH7lTasgN8z7TKzZJYuQBYYqraZCPUHS7aDOkklfQ=;
        b=h6Uo2YI10U3tXr4QgoNHm6fFggR3/rwOGvRnr04hcItY2Pz/86YHG+bpKVLeNzv5fW
         uSE1EQnzzo9ngmysUO9NevGFva8wg9ogRalcdJHJRFT8qC6NNX/9Ezgho/xE7XHoHok2
         rHLOUJ1V0IFnoqgfwZPCLSwiwePqkC2tJVZTJBOfkHq09XoomJqO4eyyVToNn1HWAwuN
         nfX29aZ0LpJbxmkdt2fp1wO4sQPe18g+M+392zALJr+lGUotn4czjwj140iJsolObxjH
         xszl9BJimJcLDkGJOW5ELpfaef5Cv8foPpYi1+qqdQPBl6zAi4qaYkngpA5P8Vg3uo8n
         H6SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782744600; x=1783349400;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3IH7lTasgN8z7TKzZJYuQBYYqraZCPUHS7aDOkklfQ=;
        b=WL0Aix3LhWGMtgVaAPcc1FS3HGSKkVcszRMs0gfkx/fWEdBb7bxG1UZV4zolZpPrb+
         NoCN3X3vV7Gwpen3YCO8Gk/jYpII9Rw11wWtA+AoIslSYpf9h9S09XzAiekE0I6FJixh
         RKepbBeVWqm4SGJbh0iQ8ZjyvlPxzLrNIqVraK9AY2o5u16iSYPXixHLbmhkFcGWimB1
         176cfVnjYMAdlLaYf6nLhR0l4GqihUD9c4gIioN+XfRtchlnMxGZ+H1niYCC+ScbqiqP
         MQGTVg/pdrngDxy8pgGtd3HjkpaS53a4IYsvQH2Q7kiCaG/febWyQVYj7x/N+DDg94cP
         hlUA==
X-Gm-Message-State: AOJu0YyuwB+gDCjvYdmEZhdm9DQaTxhsfVUr4pjJiMegoKjm8Vqgd0yF
	sjsE93Bxw98C7tJB7vBf/47uPMEBTf0GRJsOiqpis8y4K3CCIPGIOpDT
X-Gm-Gg: AfdE7ckDLoxusLk3qDpjc1bFfW6dZ8CCjXQjkMJfAHibj8KP8TEndBomEE28w0jzl2q
	0yqhHWKMvXHkZ4MJrsIJU1dhiluxbDzfgLWdXKRYyMnx8UdX/enUZ/rVRJq7uIdSJjXhZ8+dj/u
	ZNY3hctGe7v57MU0Gsn/SmT4e5XJARpqIG2KwwLH5Np3WpTgA1QiVQwS0iMBU8Had7ZbyWt7zgV
	Hy1weOX/cb+TX66AE9iLyDb4q3snpynxWkafxhz7QPI5L8DedC8f5HgVifilro/ncoOBNQ9dpD6
	EHC25XQznX7t28A4kzm3OJcg3peqWy6CbXWizfUfhaG/teEqQcd5tg4tl8v/26MGwNLx0RTICK8
	DaDiBuQvyCJTyticIwNmsFztV19/G8yL8gnoR8xn4eoCDd/sPr3t5VAx+OCqpX+7GU7Po4GsKBq
	ZTFMO/sJfRScCe1iZ1pDVWKeZ3odyulBJNU/kh2XnHeUhfVehCA2KUiBk=
X-Received: by 2002:a17:903:1a24:b0:2ca:329:3d96 with SMTP id d9443c01a7336-2ca03293fd1mr28737305ad.3.1782744599684;
        Mon, 29 Jun 2026 07:49:59 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca0e498ff5sm17873205ad.38.2026.06.29.07.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 07:49:59 -0700 (PDT)
From: adi25charis@gmail.com
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 29 Jun 2026 20:19:41 +0530
Message-ID: <20260629144941.33818-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: adi25charis@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HLH44G2BE42FY37B34QHGK3LX4UHPLSQ
X-Message-ID-Hash: HLH44G2BE42FY37B34QHGK3LX4UHPLSQ
X-Mailman-Approved-At: Mon, 29 Jun 2026 20:51:27 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Aditya Chari S <adi25charis@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: split topology get into size and data calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HLH44G2BE42FY37B34QHGK3LX4UHPLSQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:adi25charis@gmail.com,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_SENDER(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D07C66DEB7F

From: Aditya Chari S <adi25charis@gmail.com>

gb_audio_gb_get_topology() combined three separate responsibilities
into a single call: querying the topology size, allocating a buffer
for it, and fetching the topology data into that buffer. This left
callers with no way to perform any of these steps independently, and
forced the kzalloc() allocation to live inside the protocol-layer
driver rather than the caller, as already flagged by a FIXME comment
at the call site in audio_module.c.

Split the function into two:

  gb_audio_gb_get_topology_size() - queries only the topology size
  gb_audio_gb_get_topology()      - fetches topology data into a
                                     caller-supplied buffer of a
                                     given size

Update the only caller, gb_audio_probe() in audio_module.c, to query
the size first, allocate the topology buffer itself, then fetch the
data into it, freeing the buffer via the existing free_topology error
path on failure.

This resolves both the "TODO: Split into separate calls" comment
above the original function in audio_gb.c and the FIXME comment at
the call site in audio_module.c, both of which are removed as part
of this change.

No functional change in behavior for the existing probe path.

Compile-tested with W=1, sparse (C=2), and checkpatch.pl; all clean
on the three changed files (audio_gb.c, audio_module.c, audio_codec.h).

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
 drivers/staging/greybus/audio_codec.h  |  4 +++-
 drivers/staging/greybus/audio_gb.c     | 33 ++++++++++----------------
 drivers/staging/greybus/audio_module.c | 21 +++++++++++-----
 3 files changed, 31 insertions(+), 27 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..be5a2a86b 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -178,8 +178,10 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  u16 *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology);
+			     struct gb_audio_topology *topology, u16 size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb..e6356643d 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,13 +8,10 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  u16 *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
@@ -22,24 +19,20 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
-
-	topo = kzalloc(size, GFP_KERNEL);
-	if (!topo)
-		return -ENOMEM;
+	*size = le16_to_cpu(size_resp.size);
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
-	if (ret) {
-		kfree(topo);
-		return ret;
-	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
 
-	*topology = topo;
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology *topology, u16 size)
+{
+	if (size < sizeof(*topology))
+		return -ENODATA;
 
-	return 0;
+	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
+				 topology, size);
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c47..1163cf093 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -239,6 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gb_audio_manager_module_descriptor desc;
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
+	u16 size;
 	struct gb_audio_topology *topology;
 
 	/* There should be at least one Management and one Data cport */
@@ -304,16 +305,24 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	}
 	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
 
-	/*
-	 * FIXME: malloc for topology happens via audio_gb driver
-	 * should be done within codec driver itself
-	 */
-	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
+	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
 	if (ret) {
-		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		dev_err(dev, "%d:Error while fetching topology size\n", ret);
+		goto disable_connection;
+	}
+
+	topology = kzalloc(size, GFP_KERNEL);
+	if (!topology) {
+		ret = -ENOMEM;
 		goto disable_connection;
 	}
 
+	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
+	if (ret) {
+		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		goto free_topology;
+	}
+
 	/* process topology data */
 	ret = gbaudio_tplg_parse_data(gbmodule, topology);
 	if (ret) {
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
