Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPfTI9xxnWmAQAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 10:39:40 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C4E3184C67
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 10:39:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1BCCA40490
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Feb 2026 09:39:39 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	by lists.linaro.org (Postfix) with ESMTPS id 0A8C0401B0
	for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 08:45:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DSKObE8P;
	spf=pass (lists.linaro.org: domain of azpijr@gmail.com designates 209.85.221.54 as permitted sender) smtp.mailfrom=azpijr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-437711e9195so3443182f8f.1
        for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 00:45:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771922740; x=1772527540; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8HGQyoPmmP4igIydqIgyIzKYxgE5L1j9Bpi6YK68BoI=;
        b=DSKObE8PCbPFD/XDkr3aCW55VV6k74i3lY+R3IlxMNlGazMeNKwcZLl9geGxQbvjkS
         NT1+TM+o6Z/ucxERzfSxiUJUqJbDaWHLdUWSJJefBX0QmY3cqLA+Tt1f1mcPT1zQlsZ7
         J4Jz9glEx2B3iiBVoz+jz57BcT8D8+WB767PAFUN49NusT1ETkQ7g2vIMmnpDZodYQs8
         R7UNqutZJBQ13TgeOcsO1GAJby+1m8damoobU5WZYe0b5BAYDW1muYBwh+HvwQ3Kcclz
         j5/6lL0/Nx+1fRSc1vYe0vJQPOFL8HnXZKnEo+7nfpi55/mph/UzsPSPpvFItPHpv2BG
         kt7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771922740; x=1772527540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8HGQyoPmmP4igIydqIgyIzKYxgE5L1j9Bpi6YK68BoI=;
        b=quiMf2O3EwS06P2zVw97ja9hFCElKgagQA14e7OctFBYiHCi5D36GWP4oqLvRCebgV
         /vO4RCXoz5cO5KkerG2Ak68CuzMiwpcznyxMwSfO3TVyIdMVg7j3yPm0H3XiM2vUhEOT
         /bu0JGfabvN4TTpx4c6kNkhE4L8LyB0hBAiPRNQ+vOxqEdqO8MWmBkSU0JrkLGEtk+5R
         bmPj5JpkD9IQOCJXlHWWfwlyKQf3anp8iZr8wotbY6owyWmbc4P79019hZjeQySzCZtN
         uiTuyvZqCaGxjl9vneqbRt6vu9OjJrQ7oq3akUCamcsfm45Ix5q+hiCVWQZ20A8AnSSR
         nukA==
X-Forwarded-Encrypted: i=1; AJvYcCUa+BiwAQCx4Fz56FQi28IOh31A8bntjtHeD29H+1C4sk4aKRUoXox/Rs5oV9SapJEHVmRkC0eebc8EZg==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywi//Q5aLMi3wDzhPjIquzuq01nmCz6Gzn5rm2Z6WUPjs5Qn1ZY
	CJuXtq8N1rlgGVIwCAP4PrUyvIGnKTTVN/mhm/GtNN9PDTSajAx+izUE
X-Gm-Gg: ATEYQzzEU35qT2KVE47iy6TNZQmCIrHsXV/PXdTMzfv0dMkIjQcp0yaTJjCu1NQH3tv
	0M6CJ60k33su3QqhlM7QYJla/HdWwsLHYXOUhA/bhILim6LIzaFD5BxRqMxewWmhjzHR2m09Z36
	RgJniczfjXS/eYzZOqrdcgsMPeX+ij1n+aJuwuAkYeVa2kd2B4JdmePxIQa9FstnStk7Apauers
	NGbyNTR5OlN38LB8EfDyk2evgnSareu6097S7pMOmROfIqbc2iqEj3GUz0HODLc7LnHDUPKaru+
	YRYwuEetjfLEpNnlYiTF30Yqv79hygmi/98/RCsIgugeej+4OLRb5UemGXLR0ivQ19QCug7nW3p
	an45DIW7acTrD29eci1kwoZtqAibcvfRcxkRm9GV92C0Y+ZDmcHNNzb3kev05Pu5/9F/Lodd809
	SnHrLvDAw49qC7ncOPi4WsyjPefNYFXaynHYnWcT0=
X-Received: by 2002:a05:6000:230c:b0:436:233c:c7bb with SMTP id ffacd0b85a97d-4396f194541mr20839944f8f.27.1771922739724;
        Tue, 24 Feb 2026 00:45:39 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm27941713f8f.28.2026.02.24.00.45.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 00:45:38 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Date: Tue, 24 Feb 2026 09:44:23 +0100
Message-ID: <20260224084508.88867-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260223195939.71151-1-azpijr@gmail.com>
References: <20260223195939.71151-1-azpijr@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: azpijr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CK5MX7GHD75EYPULAIUQI7PJMGJSKVVN
X-Message-ID-Hash: CK5MX7GHD75EYPULAIUQI7PJMGJSKVVN
X-Mailman-Approved-At: Tue, 24 Feb 2026 09:39:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel test robot <lkp@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: move topology allocation to codec probe
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CK5MX7GHD75EYPULAIUQI7PJMGJSKVVN/>
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.997];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 3C4E3184C67
X-Rspamd-Action: no action

The FIXME in gb_audio_probe noted that memory allocation for the
topology should happen within the codec driver rather than the
greybus helper.

Move the size-check and kzalloc from audio_gb.c to audio_module.c
and update the function signature of gb_audio_gb_get_topology to
accept the pointer. This clarifies ownership of the allocated memory.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602240844.4eT24iVh-lkp@intel.com/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
v2:
 - Fixed build error by updating function prototype in audio_codec.h.
 - Fixed 'struct gb_audio_topology has no member named size' by passing
   size as an explicit argument to gb_audio_gb_get_topology().
---
 drivers/staging/greybus/audio_codec.h  |  2 +-
 drivers/staging/greybus/audio_gb.c     | 33 +++-----------------------
 drivers/staging/greybus/audio_module.c | 27 +++++++++++++++++----
 3 files changed, 26 insertions(+), 36 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.h b/drivers/staging/greybus/audio_codec.h
index f3f7a7ec6be4..2d7c3f928b1d 100644
--- a/drivers/staging/greybus/audio_codec.h
+++ b/drivers/staging/greybus/audio_codec.h
@@ -179,7 +179,7 @@ void gbaudio_unregister_module(struct gbaudio_module_info *module);

 /* protocol related */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology);
+			     struct gb_audio_topology *topology, u16 size);
 int gb_audio_gb_get_control(struct gb_connection *connection,
 			    u8 control_id, u8 index,
 			    struct gb_audio_ctl_elem_value *value);
diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..8459a6d6f289 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,38 +8,11 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"

-/* TODO: Split into separate calls */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+			     struct gb_audio_topology *topology, u16 size)
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
+			NULL, 0, topology, size);
 }
 EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);

diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c477b3..84c591b59b4e 100644
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
@@ -304,13 +306,28 @@ static int gb_audio_probe(struct gb_bundle *bundle,
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
+	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology, size);
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
