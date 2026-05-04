Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yCRgIb0J+2mbVQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 06 May 2026 11:28:29 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 202764D89B9
	for <lists+greybus-dev@lfdr.de>; Wed, 06 May 2026 11:28:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25C4840501
	for <lists+greybus-dev@lfdr.de>; Wed,  6 May 2026 09:28:28 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	by lists.linaro.org (Postfix) with ESMTPS id DDD82405DC
	for <greybus-dev@lists.linaro.org>; Mon,  4 May 2026 17:13:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Jl8Nzu9D;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of khaled.saleh.req@gmail.com designates 209.85.128.43 as permitted sender) smtp.mailfrom=khaled.saleh.req@gmail.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488b3f8fa2bso49145635e9.1
        for <greybus-dev@lists.linaro.org>; Mon, 04 May 2026 10:13:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777914832; x=1778519632; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YVyX/l6EVBhcYm4HveFR/2Y6ddEwga1Q1M3z5qjkJEA=;
        b=Jl8Nzu9DfnMHe6zcSa8l682HYu5OW0V1qms5Lj8jYtveHClHOFEToa2AUK0Mpchyfa
         mHb3ssMwnWYsttElItlmsxz4hO7kHyuC8QR11KDFlXXNvUFkbsafLargo/2pJKPInQn6
         6l4RlIXOnD62slubg3Kz+cbWPpSOQvqE3gRrfZl4B2GHmXtIYuivrtUE25svbf5QgVOa
         dzI7p+6+JXfY3QmcNFCzrS0mbGHNWky3p8q6bkb6VSpV7S5cBlvPI9KJo5j4KxsHnbQj
         6xvCMfFDokWqAAJ1SvhY0tboKtvEsvTwstpcOWzZ+EEKDwx1SDfjRaWp8WGPEfCkKBoU
         uC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777914832; x=1778519632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YVyX/l6EVBhcYm4HveFR/2Y6ddEwga1Q1M3z5qjkJEA=;
        b=RbYmQ5WIZHP0qpSJKPnlF/9O4R3NEoJaF6gh/Pq0vfgRu4tw7sM83bTKX6PHgpISVW
         d/4Zq+/0Yk4KIOfzx0JSiAlPtJFCOJBvKu3a/gegwg9bpXl0ss85iEAJEraWrqYBKKvI
         +qmPUzpLLBwdsIqrwsIkys7w7CRFG+pfY8ca6Ej6DVirvS7Ti5TNjFs+KhwAZrZtD5sD
         dFzzTUx2QUQ/0Q08P9t1fL6Cf4PsI6LDrPmp8vEsQrX8w/3AA4e4EDxv7zhwsZtUH7+R
         LuZZDTlwQ4Dep1Em9gc5xaq+jaKKj+fD3tHt3x2Cuk9l8uk0+q4CokE8fdzrHVoBoCXE
         rX8A==
X-Gm-Message-State: AOJu0YxA38+PltczgOSZSowPhqnoROqeiHiIHnJ7YzQQLk0vBtyiqoud
	5MWAE40XQv8xMDDLTzxG979zRsxxnAda3YrrsO4az01qlugoUGvoKmf3
X-Gm-Gg: AeBDiesuEAZcUSjGCwTf9uq+YBw9+wk9H7PgM0PJyBl+3qBjr71cNJ9cYayl/l9IOII
	Vke/IkWydhTmNVDCGQoPaTdH3vWpWoyLrQtDGVo+D9fBV3ZhYJsFalE1uRJJJG1HZE2VYdT9b5j
	Qxb50Af7a11NmgoNdWyN1iMAh84oPhyw94kfLVcyWxeILtf2O6nt9VwtvIrfur5Ky7+q44jSza9
	qMT1usxcZTX8uhCy/7IHxutLc0IF4EdkuxJp5UzDsNBoRLkyPoboX3T9C8XFMUYl/j7XNyMBrsx
	eru0tdGo9eeP+603eebSPs5NxI0db/fjFby5z15iC8/etQ3PD5jXpUZ6oSqNDND9f61x8g5TTlc
	5mfI6xKZAMEZ2x78VTARlMd38UlDNPijm1nfFk64nc4OxM+UJGE4wH86+Ncmsb97RRAi7+5qaBE
	qJyNkFzaT5fbO4NHE5g9WSslXZHgIrSNNiAr2gbBQEPxnCqhzqkD5bBqz6tBFRLQ6e71skCq1nq
	dtszH9r
X-Received: by 2002:a05:600c:4186:b0:48d:50a:6ef4 with SMTP id 5b1f17b1804b1-48d14260d69mr3945825e9.11.1777914831633;
        Mon, 04 May 2026 10:13:51 -0700 (PDT)
Received: from localhost.localdomain ([105.39.209.175])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm603830925e9.2.2026.05.04.10.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 10:13:50 -0700 (PDT)
From: Khaled Saleh <khaled.saleh.req@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  4 May 2026 19:13:30 +0200
Message-Id: <20260504171330.83727-1-khaled.saleh.req@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: khaled.saleh.req@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7XYAPXEMNJARB3ZY2PIIGSOSGMFJFZUS
X-Message-ID-Hash: 7XYAPXEMNJARB3ZY2PIIGSOSGMFJFZUS
X-Mailman-Approved-At: Wed, 06 May 2026 09:28:26 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, khaled.saleh.req@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: split gb_audio_gb_get_topology()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7XYAPXEMNJARB3ZY2PIIGSOSGMFJFZUS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 202764D89B9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[40];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.507];
	FROM_NEQ_ENVFROM(0.00)[khaledsalehreq@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]

Split gb_audio_gb_get_topology() into smaller helper functions
to improve readability and maintainability.

No functional change intended.

Signed-off-by: Khaled Saleh <khaled.saleh.req@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 25 ++++++++++++++++++-------
 1 file changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..b5ead09532c8 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,13 +8,10 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
-/* TODO: Split into separate calls */
-int gb_audio_gb_get_topology(struct gb_connection *connection,
-			     struct gb_audio_topology **topology)
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
 {
 	struct gb_audio_get_topology_size_response size_resp;
-	struct gb_audio_topology *topo;
-	u16 size;
 	int ret;
 
 	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
@@ -22,10 +19,24 @@ int gb_audio_gb_get_topology(struct gb_connection *connection,
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
-	if (size < sizeof(*topo))
+	*size = le16_to_cpu(size_resp.size);
+	if (*size < sizeof(struct gb_audio_topology))
 		return -ENODATA;
 
+	return 0;
+}
+
+int gb_audio_gb_get_topology(struct gb_connection *connection,
+			     struct gb_audio_topology **topology)
+{
+	struct gb_audio_topology *topo;
+	u16 size;
+	int ret;
+
+	ret = gb_audio_gb_get_topology_size(connection, &size);
+	if (ret)
+		return ret;
+
 	topo = kzalloc(size, GFP_KERNEL);
 	if (!topo)
 		return -ENOMEM;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
