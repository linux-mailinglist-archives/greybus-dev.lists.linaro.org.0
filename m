Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1T3JEtgrRGr/pwoAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 22:49:28 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id C49686E7ED9
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 22:49:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Icj9pfgO;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CCFE440B0D
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 20:49:26 +0000 (UTC)
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	by lists.linaro.org (Postfix) with ESMTPS id B28864098A
	for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 20:49:21 +0000 (UTC)
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-13b30f3d1e5so530700c88.1
        for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 13:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782852560; x=1783457360; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QH7GLHNGfwBkJqHxvx3I3p3T8oUpVImJRLd2zYY0WZg=;
        b=Icj9pfgOHQa1rElNm5OD5pQ2a2FJiov/I1dOzu7d/6rdKI3i6AgiYwBCJ2BRl7UjQZ
         VUKqIlIHdDYyvhrDY6EiODtZWRiMfgzNd4gYsfdJqa05xV2AoIY5wvKLTz/e1CgPQSXv
         5RowxF6M6n2ylSrP9z72Q9vovgXlFAf3F568E4df4yzoS17usJjJY7ITDAOumXrVfvwi
         34iMe4w7jDxbTM0gOq3HXggotB7YDQbvY/peI6cCqXV+CCgXHCtnuhOQ6f7Aykub7jSZ
         trn3skgWGXpdqJvMjZIBYt4bN/+uoXv8Mu39avbhqBwEnmAWj8o16CyQ2SB/UNaRkKoz
         ky9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782852560; x=1783457360;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QH7GLHNGfwBkJqHxvx3I3p3T8oUpVImJRLd2zYY0WZg=;
        b=godeLt0H49rRxO8sAoX3r8cMgQwsRV/qbf7wguepMv1LuAcDDZxdm9u+n/Svoq1YMa
         kD7FmThcS8cVPBCY/SqmiYLAP0bhyoWTfD1KhMrUybk699+MBSD0bMMCR0gxHWnZxTyF
         7a+13METHywar57R11/TAWTSZBZZIkQcRq4DRTgH6Fu3XoDRpX6k5AjCTfajDIg1c09q
         q4FAUQs8njJn+sjnXRX9YsfqasOqUsrSeCg7KlVoDDMMwKlVvmiuCSorZR9Ki+1BGvzw
         xeFccYy9amUzSYbaHnIqdedKbyuhv1sUTsA3FiapTWRWDbQaVEweEtFqnO4qpekUqbi6
         8glg==
X-Forwarded-Encrypted: i=1; AHgh+Rp1GBgzOZuH1oe5t4M8k90a+tPIAUAMkvnhzVsXVxqN8/mqU/HbbmrFA5IQBSFVJ0/iqrkE97SXvvHc1Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YyThEY0Is+NbLeSAK6Htg5TUBgAAf3o94IoAF4bNcSrWodJHXsg
	w6NVlIFLTy6ZNpBuxsbDUUOAiciTD2hOVPNe4j3PPgJFLG7gh6SFkTyI
X-Gm-Gg: AfdE7clgSRYGMt3x8lyz5rWY2Dd/9qtHuDYaaoTkBbV6o4UWiDJQWtUZSYBDZXPscCC
	Xzy1MKYgpE152VrkZ4I1Vn6c0uM+M5jNj5eAydJ20/KH4ujcqcsqsi+o38/0OPttmom2e0K0WuY
	NQ/tHMu/FewhRkusRKdkBkk+V33B4Bp7TvjKg0Aih6A5hCMc+X98glmsAU36OPebc+hI75cwahB
	je6u8SgQ1rYJdN+NEt1L6oSX31Qcd68p960IUlWhx5yxTpxmMsVuBcUE45Yd4hEjngFLnVRxLvc
	oczx4lMzS5Gt0+8Mfn6LXTlHhUrXzucOwCAA3f4L69IjTo9hidJBx6CSc3dcZDdQT0UgrNb9F/G
	yayrKvtp5ZqFVe+Llfgtcw5bkHFiewQLzBpcRFTl1sSEOAY+1GRclCt9n7t3d99FnMKQKAAH3VW
	yhbUNxiCFailGYiHUqAT1CA/F1EaJm7BFmHhh+N6zrfuqjkQl1G98KguI=
X-Received: by 2002:a05:7301:7191:b0:30c:829a:f67c with SMTP id 5a478bee46e88-30ee9f6ce52mr1786800eec.3.1782852560400;
        Tue, 30 Jun 2026 13:49:20 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee32519aesm10902297eec.27.2026.06.30.13.49.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 13:49:19 -0700 (PDT)
From: adi25charis@gmail.com
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed,  1 Jul 2026 02:19:08 +0530
Message-ID: <20260630204908.40206-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260629144941.33818-1-adi25charis@gmail.com>
References: <20260629144941.33818-1-adi25charis@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: 2Q2R7KI7MN3L37NHEDBYK3DAMHUTJJQO
X-Message-ID-Hash: 2Q2R7KI7MN3L37NHEDBYK3DAMHUTJJQO
X-MailFrom: adi25charis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: error27@gmail.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Aditya Chari S <adi25charis@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: split topology get into size and data calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2Q2R7KI7MN3L37NHEDBYK3DAMHUTJJQO/>
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
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:error27@gmail.com,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:adi25charis@gmail.com,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	FREEMAIL_CC(0.00)[gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FORGED_SENDER(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C49686E7ED9

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

----------
v2:
- Fold in review feedback from Dan Carpenter.
- Store topology size as size_t instead of u16.
- Move topology size validation into gb_audio_probe() before kzalloc().
- Use -EINVAL for invalid topology size.
- Drop unrelated dev_err() formatting cleanup.
- Compile-tested with `make M=drivers/staging/greybus`.
- Run checkpatch.pl on the updated patch; no issues reported.
---
 drivers/staging/greybus/audio_codec.h  |  4 +++-
 drivers/staging/greybus/audio_gb.c     | 32 +++++++++-----------------
 drivers/staging/greybus/audio_module.c | 27 +++++++++++++++++-----
 3 files changed, 35 insertions(+), 28 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6..b45cd257d 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -178,8 +178,10 @@ int gbaudio_register_module(struct gbaudio_module_info *module);
 void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  size_t *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology);
+			     struct gb_audio_topology *topology, size_t size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb..2e6f155d8 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,13 +8,10 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+				  size_t *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
@@ -22,25 +19,18 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
-		return -ENODATA;
-
-	topo = kzalloc(size, GFP_KERNEL);
-	if (!topo)
-		return -ENOMEM;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
-				topo, size);
-	if (ret) {
-		kfree(topo);
-		return ret;
-	}
-
-	*topology = topo;
+	*size = le16_to_cpu(size_resp.size);
 
 	return 0;
 }
+EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology *topology, size_t size)
+{
+	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
+				 topology, size);
+}
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
 
 int gb_audio_gb_get_control(struct gb_connection *connection,
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c47..4cd1f42c1 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -239,6 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gb_audio_manager_module_descriptor desc;
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
+	size_t size;
 	struct gb_audio_topology *topology;
 
 	/* There should be at least one Management and one Data cport */
@@ -304,16 +305,30 @@ static int gb_audio_probe(struct gb_bundle *bundle,
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
+	if (size < sizeof(*topology)) {
+		dev_err(dev, "Invalid topology size: %zu\n", size);
+		ret = -EINVAL;
 		goto disable_connection;
 	}
 
+	topology = kzalloc(size, GFP_KERNEL);
+	if (!topology) {
+		ret = -ENOMEM;
+		goto disable_connection;
+	}
+
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
