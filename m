Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K/2AId3yQ2oKmAoAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 18:46:21 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 062796E6967
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 18:46:21 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=syoJcvTL;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DEA46409AA
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Jun 2026 16:46:19 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by lists.linaro.org (Postfix) with ESMTPS id 4F249401C7
	for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 16:46:15 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2c9cb97e178so27654365ad.3
        for <greybus-dev@lists.linaro.org>; Tue, 30 Jun 2026 09:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782837974; x=1783442774; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHhIFB/lwAV7YlLBcirT3lG64iGvOufo3zoAL+EAuJg=;
        b=syoJcvTLecoX1ATrI3z6rok0w52kyinJ/5wsKK8EOxrmU46ktzP+lFO5Fn3gw5asNe
         WoAD/EHQJilrqB5iIKqsiiXwumNbZH+HR9+ScqKSWF7t0Hrt8v7sGYn6+RexML0c0QYv
         NNQc4do5hiusS1nCNb89fz7zQTZa1zjfVzMYz7Nt3ETeXWe5i/FhfciSgeG79c0gNst5
         18wMGvUdUb6IQyk1t4iEDHcY7ottI2JRiJtAH5IdTdNX5yZklAdlXKRlihzZzx0LZeDX
         IJD3Q5O17vLJvx/2e9OAbF/BTU/xGsx7pItRob5MB4ROdlC3J8hnFkigiR9Z0v+E6KeA
         sHqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782837974; x=1783442774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHhIFB/lwAV7YlLBcirT3lG64iGvOufo3zoAL+EAuJg=;
        b=AqHPKmdETBgKBeLZF4tBDgBVHzhYCwUAuxZYaSahdTqBCPS2oAP0+L7MuUGkowa7L0
         HupNzBdQWvuB8lBeHywnEz53H7IYwScPhrxab9+hrYrdXmlfy49C6aQe3b9g/JR824Rf
         MgODC3nc3zpnLXKjiD959E/F/uEwf91YC9zJucZON90f0D54WBVDADQjOsezzYYAX5eS
         V1mNe7PMDYy4BQOohVO9azH0Y42WWXjGfqTkoWNE1gHkWT2u42ReV+Y+TYy95DGo5Kjt
         ZWjtViFJGUvRHhA+w5R7ine3ILkqhkWRr7lUIFubTi5UC/IGPFDYEuSPvZFGJDYIteeq
         Lijg==
X-Forwarded-Encrypted: i=1; AHgh+RopumPyev724/7MYGOpnLio8qgjQxWW5NubvlymwiQla9xkcoSGMijNUeZXD1+4FfJqUFiwmEtX8hYV3g==@lists.linaro.org
X-Gm-Message-State: AOJu0YyhBry05Jk/nn09eI7PyV+CnPSVnn+OWO38iMnA3V7B3WyhrJf1
	WBIDXXCBs6b05XRgftCEBMAnxVRWxFzVXtoJuUERR8qDn34sWAQ7qbH4
X-Gm-Gg: AfdE7ck1o3l0yat5LPhax2D7kLr6yBHPSKIxOXKYBrisgHfr+nFBEMwV/JzN195QpS/
	wvH6dyPw8xU3AI1diuz7y/NSfNJRnF9ZQjzVtM2S+wJ3YS0j9VuhJKZN8v3tSjOMLJeID4JjXQR
	6GrFK/z0yPSNKpfDKju7wOc17bL1G1APZ4sJtNvBoJHe5vjSxmtbJHprc3Q7k3PPkjeMy48Tixk
	s4wiujmUFw3MGrMkyE4k9NUlBbIxayRjcB4Ru+foIV/cyj9qdJ/n0yxaMprDDKO9zA0M6BT9KdP
	ueyrqUkHa7o4FVRhYm0beZvqqO2dIkuT8F5qIzuSuKTsiX/W1aP2yyaJNZhR8BCw3GEdX+2S4HE
	8p1E0xqQnI8BduGSViHSoXXkjfHC5FJnTLWCeaKKz0jzjO74cpMIzZp0dBCO0jubDwown8N20iI
	WIUCYuREE7WqYpmBxlDM/8omDOOoksvXOrhAPxzThHgiDcS7J/1Z8rYck=
X-Received: by 2002:a17:903:234d:b0:2ca:2073:3119 with SMTP id d9443c01a7336-2ca2ea1d0dfmr32374435ad.32.1782837974269;
        Tue, 30 Jun 2026 09:46:14 -0700 (PDT)
Received: from kernel-dev.multipass ([49.36.101.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca3828b0e7sm17583155ad.47.2026.06.30.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 09:46:13 -0700 (PDT)
From: adi25charis@gmail.com
To: error27@gmail.com
Date: Tue, 30 Jun 2026 22:16:02 +0530
Message-ID: <20260630164602.37663-1-adi25charis@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <akOy6ORYkzHxodYU@stanley.mountain>
References: <akOy6ORYkzHxodYU@stanley.mountain>
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: 76ZB4RRKPJ2V2L3ZQRI53ZKT2WLKCK5F
X-Message-ID-Hash: 76ZB4RRKPJ2V2L3ZQRI53ZKT2WLKCK5F
X-MailFrom: adi25charis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Aditya Chari S <adi25charis@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: split gb_audio_gb_get_topology()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/76ZB4RRKPJ2V2L3ZQRI53ZKT2WLKCK5F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:error27@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:adi25charis@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[adi25charis@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns,lists.linaro.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 062796E6967

From: Aditya Chari S <adi25charis@gmail.com>

Split gb_audio_gb_get_topology() into two functions:
gb_audio_gb_get_topology_size() to fetch the topology size, and
gb_audio_gb_get_topology() to fetch the topology data into a
caller-provided buffer. This moves buffer allocation out of the
audio_gb protocol helper and into gb_audio_probe(), where it
belongs, addressing a long-standing FIXME.

Signed-off-by: Aditya Chari S <adi25charis@gmail.com>
---
v2:
- Store size as size_t instead of u16, per Dan Carpenter.
- Move the size validation (size < sizeof(*topology)) out of
  gb_audio_gb_get_topology() and into gb_audio_probe(), before
  the kzalloc(), per Dan Carpenter.
- Fix dev_err() format strings so %d is no longer printed first;
  put it at the end of the message instead, per Dan Carpenter.

Compile-tested with `make M=drivers/staging/greybus modules`.
All modified files (audio_codec.h, audio_gb.c, audio_module.c)
compile without errors or warnings. checkpatch.pl --no-tree passes
clean on all three files.
---
 drivers/staging/greybus/audio_codec.h  |  4 ++--
 drivers/staging/greybus/audio_gb.c     |  7 ++-----
 drivers/staging/greybus/audio_module.c | 12 +++++++++---
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index be5a2a86b..b45cd257d 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -179,9 +179,9 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);
 
 /* protocol related */
 int gb_audio_gb_get_topology_size(struct gb_connection *connection,
-				  u16 *size);
+				  size_t *size);
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology *topology, u16 size);
+			     struct gb_audio_topology *topology, size_t size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index e6356643d..2e6f155d8 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -9,7 +9,7 @@
 #include "audio_codec.h"
 
 int gb_audio_gb_get_topology_size(struct gb_connection *connection,
-				  u16 *size)
+				  size_t *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
 	int ret;
@@ -26,11 +26,8 @@ int gb_audio_gb_get_topology_size(struct gb_connection *connection,
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology_size);
 
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology *topology, u16 size)
+			     struct gb_audio_topology *topology, size_t size)
 {
-	if (size < sizeof(*topology))
-		return -ENODATA;
-
 	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY, NULL, 0,
 				 topology, size);
 }
diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 1163cf093..806533f03 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -239,7 +239,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gb_audio_manager_module_descriptor desc;
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
-	u16 size;
+	size_t size;
 	struct gb_audio_topology *topology;
 
 	/* There should be at least one Management and one Data cport */
@@ -307,7 +307,13 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 
 	ret = gb_audio_gb_get_topology_size(gbmodule->mgmt_connection, &size);
 	if (ret) {
-		dev_err(dev, "%d:Error while fetching topology size\n", ret);
+		dev_err(dev, "Error while fetching topology size: %d\n", ret);
+		goto disable_connection;
+	}
+
+	if (size < sizeof(*topology)) {
+		dev_err(dev, "Invalid topology size: %zu\n", size);
+		ret = -ENODATA;
 		goto disable_connection;
 	}
 
@@ -319,7 +325,7 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 
 	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
 	if (ret) {
-		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		dev_err(dev, "Error while fetching topology: %d\n", ret);
 		goto free_topology;
 	}
 
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
