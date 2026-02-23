Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EvXOddxnWmAQAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 10:39:35 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C1F184C59
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 10:39:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7AA8D4047C
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 09:39:34 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	by lists.linaro.org (Postfix) with ESMTPS id 1B30C4047E
	for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 20:00:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=O617XuFj;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.221.51 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4362c635319so4168331f8f.2
        for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 12:00:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771876848; x=1772481648; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yv125EGKHRfysJ3X3Lulm/FjdhCw6fk0IxMK5xEGXqs=;
        b=O617XuFjZ5rpFgLVp232vQ+5m4LzVYuIz3//VeD86yVx11EOEyt4kge6LgZqnBG9Nv
         bBbT7xJXyFBmYqOUEYq0u3pWSKTSoeJVzcLwN9AyCbEMl5KmAzVYJb0MLB51e8glZp8u
         MSnN0u8kO+jmI6DkjycuuB/mGV8sqtY/LMKhCiyROQL8UPoLDySbcNRCWG/97gH7HDPH
         oZ0RGKvyZddhYYKP+2ZDYzKSu0RonbldgtXw2kT0pbCAgGTxYDuG7tZkA1wMPPZ0XpIp
         Fb8fTzrZ9Ao/p4ZLaHjTrHVPxu0uqdAzj3nMnG6LLvoBxW86+Lz75btBvM8d+rwxcZBf
         kCzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771876848; x=1772481648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yv125EGKHRfysJ3X3Lulm/FjdhCw6fk0IxMK5xEGXqs=;
        b=qzNyYnq8pwOykIiGkUQ6uAPIFFRYQ5y+SmB40rmjz4SRce8eZy7ErhDjC8Doyje+3V
         SBXUbM60gzbr8O47nQXvCMNufcZLU6J913fMePPdhb4LPOGK1tyYNAYA1k6zjtbVjE9h
         MEUsdoldt5vEhtNYJ+su9jJhSMJ5ad3WrQJ1d659I3qdrhMuLPS2tEuv4WLw36Rt3Ubi
         8hK0ZSZkz+PO0vrJERD9Xblj3zonYKoJ0calz6bKZqeW24VfHV3yqv1SJhxuaARKvV2g
         bjXJXiPsLJo7Il0NwYwMSIhiZ+3Q7PbaEUuRVs6ztPye1Fe1AXOLNrRJGdd6Gdh537rA
         X9dg==
X-Forwarded-Encrypted: i=1; AJvYcCXKAj3Fl5h7BLqEOS9xMrBWnWHeeOA1erfoupmXaDQnlDOKh9H0q98t2TCCv6PYe+tgOQsJMVLTuXHvjw==@lists.linaro.org
X-Gm-Message-State: AOJu0YyNNUILPFZ2yqA7CvaY18pK7d7MysPhi9CF0b8zDSQkK3+fveVQ
	LJgx0Im4jo10JhUvaR6m6BaSZOpvU1+oOfJvoG9UNMVrwNpCqzbOU0At
X-Gm-Gg: ATEYQzw13t3U8ELzxjbB6bqtOINvZwBHu8/LUBi2g8N0Eshj8Ere3LUfbpMUathaqBn
	A34iebtTqHKQBbyxymnOyNcAmB7DwQ/kOTtMyT9Dur6QjRPiQvxvelBmQng5q0zwgf7GBQUfQUt
	Gi55Fgl+sEwUZ3QbNYhnv3MDpjIDapawqejvG0DbjhkUBU9ZOBu7e2AufCZQ2JfvICXwzP6M+L3
	letmPqjTBJB/XTaIOsmzrzbtHFJWYFdh6W1g3dS9fxAxZSMrjQ4kPtkVozwyNV+jtLVUWh56/f3
	EFnRC2GZH3PE1hYzeZdpPAtwm7Xfnjyk7Ir1ZI81J4CDl3evbtLLUnZwI/v0a4NrQn02OHo5SXz
	sajnuaunS7jeo3wvl6Ve+RraJt07Ghl+FADJi5nKdFeyJCPoRENlYVpQFKZEWoPLI2lSwo2HUg1
	fji1h73vgj0OqE3pDcdj7VeACQo2r+hiPwQ9yx2m4=
X-Received: by 2002:a05:6000:1a8a:b0:436:3563:499c with SMTP id ffacd0b85a97d-4396f14c9bfmr15966473f8f.8.1771876847774;
        Mon, 23 Feb 2026 12:00:47 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970c00e8bsm17975577f8f.15.2026.02.23.12.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 12:00:45 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Date: Mon, 23 Feb 2026 20:59:35 +0100
Message-ID: <20260223195939.71151-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SANLZMSA7VR724WH265VZJRQ2FDCB4F4
X-Message-ID-Hash: SANLZMSA7VR724WH265VZJRQ2FDCB4F4
X-Mailman-Approved-At: Tue, 24 Feb 2026 09:39:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: move topology allocation to codec probe
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SANLZMSA7VR724WH265VZJRQ2FDCB4F4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 86C1F184C59
X-Rspamd-Action: no action

The FIXME in gb_audio_probe noted that memory allocation for the
topology should happen within the codec driver rather than the
greybus helper.

Move the size-check and kzalloc from audio_gb.c to audio_module.c
and update the function signature of gb_audio_gb_get_topology to
accept the pointer. This clarifies ownership of the allocated memory.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/greybus/audio_gb.c     | 33 +++-----------------------
 drivers/staging/greybus/audio_module.c | 29 ++++++++++++++++++----
 2 files changed, 27 insertions(+), 35 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..4037b3bf1e9f 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,38 +8,11 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"

-/* TODO: Split into separate calls */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+			     struct gb_audio_topology *topology)
 {
-	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
-	int ret;
-
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
-	if (ret)
-		return ret;
-
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
-
-	return 0;
+	return gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY,
+			NULL, 0, topology, le16_to_cpu(topology->size));
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);

diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c477b3..8efb720c3f30 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -240,6 +240,8 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	struct gbaudio_data_connection *dai, *_dai;
 	int ret, i;
 	struct gb_audio_topology *topology;
+	struct gb_audio_get_topology_size_response size_resp;
+	u16 size;

 	/* There should be at least one Management and one Data cport */
 	if (bundle->num_cports < 2)
@@ -304,13 +306,30 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	}
 	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;

-	/*
-	 * FIXME: malloc for topology happens via audio_gb driver
-	 * should be done within codec driver itself
-	 */
-	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
+	ret = gb_operation_sync(gbmodule->mgmt_connection,
+				GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE, NULL, 0,
+			&size_resp, sizeof(size_resp));
+	if (ret)
+		goto disable_connection;
+
+	size = le16_to_cpu(size_resp.size);
+	if (size < sizeof(*topology)) {
+		ret = -ENODATA;
+		goto disable_connection;
+	}
+
+	topology = kzalloc(size, GFP_KERNEL);
+	if (!topology) {
+		ret = -ENOMEM;
+		goto disable_connection;
+	}
+
+	topology->size = cpu_to_le16(size);
+
+	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology);
 	if (ret) {
 		dev_err(dev, "%d:Error while fetching topology\n", ret);
+		kfree(topology);
 		goto disable_connection;
 	}

--
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
