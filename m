Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id /SrGAKyv3GldVQkAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 10:56:12 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8093C3E9680
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 10:56:11 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 87289404BF
	for <lists+greybus-dev@lfdr.de>; Mon, 13 Apr 2026 08:50:51 +0000 (UTC)
Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	by lists.linaro.org (Postfix) with ESMTPS id 260B73F728
	for <greybus-dev@lists.linaro.org>; Sat, 11 Apr 2026 18:21:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Z4usbebf;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of dennylin0707@gmail.com designates 74.125.82.67 as permitted sender) smtp.mailfrom=dennylin0707@gmail.com
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-12c42a23c8eso440905c88.1
        for <greybus-dev@lists.linaro.org>; Sat, 11 Apr 2026 11:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775931678; x=1776536478; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DqrPr1FaYRhKQEWInixscQtNUjWWsyNu8DLckOP7xwk=;
        b=Z4usbebfKDlVDx8HD7yQoOM3rzwovQ25VRT4F4L3skuKmL5txJ+uAotEl9rKcEY0Bt
         u8vg0S9HYLOdP8YlBwn7n9WLEQv+zndR1vRRVfOz5Y8PIJVIbDpTiD9wbTQIzAAvrtMz
         3vFf/EzQXlldjalftZnr2pDIRJpOrby4Yqj7nw3FyHC4Fx3kzlyLjfLpMJA7535qLyWB
         yH4V6p/z+rMy6OToQ2vvrQxxXXTkPcTlxTPpJ49lMz4KtkRcgP7Tb9tl3P1Z1YTddNAB
         ilcVcW0NvL3PvsfEeOf8YxoCJV8jxCq3UyjsMYNwYfNxRN2qrvG3nk299oxatk3zx3RG
         bGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775931678; x=1776536478;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DqrPr1FaYRhKQEWInixscQtNUjWWsyNu8DLckOP7xwk=;
        b=ecbj9T3D76md4M2jiRAOtHbuuQRK/VBNuc9eF2VELsQkF4vEnkaRzw03ntYlFO6gQE
         erw6d+9D0EfoUM2uAjJk0vqoaMYqHmQ6kfPG5/c1II5Y1wetF+1npfkxGd/FTpHiNGD0
         ldG2ZSUU3wPMwh3KvgaiKOi7Zsr6SijR3K+sOfl6x33Z13E6XU2mhDSts1t9b9BjHjrS
         By+yPbvwRanjr+fmOJHt3kLo2aumJYhDWCnY3Fx5lLZqPI2USafGnRzqFci49/0w0YdU
         GkCim4mSNp8M+liQu/JnVlUkZp4/MmCoAmKRJXwstw8z5HV2+FsC97Qoa3nBLsSH++6G
         E4fw==
X-Forwarded-Encrypted: i=1; AJvYcCV0Kkv1wlXz5tBCCQFD8cR2FknyzN+Rj47pQMzgM94jxeNSvH6rV/roF4l3ZRPy5h3qpLYQ8R7/89gJrQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwXxfx1HMgSLrvTIo4b/MhdzgAip7UQDzm28mBxLodNmyvCFsR+
	3vp3uyjG0sOFQuM2UEV9ePlp4+11K7uvnVEC3xqT7Uxc3zYksl2w/GPr
X-Gm-Gg: AeBDievfBkBNL42CdnJ+6IwsZrxtthgno6y3nbDV5N4Jga7MjgcKxW05tXtwo/9E/Au
	4D44lnl8BdWUw67FDpzD+8gXXX/STLSCNVCEMYHPCeazeL0fv6LN9x7TAY/7k7UfruQsVaqZTEY
	VhkY841iYfo6fmuDHLjk7zFvYep263iku5EJGnBSLy9F9aqq8NK9wWvj3DH/3AUqg1/w//duBMd
	Js2VYboksBHekKAgDCfkeiq1G5CUi6yD2komdE1whkIeKpVkQrDF1CfimOvQWWue7nMuFQl6t+L
	JTdyuQACXEa4FlVljwU25vKf/TuhdRY4RRMceTGLn/wAKe7bs5II0iLfWl+2gSCYJ8HK25t2A3V
	EpM3XAqOmIaLC4+3bCFJRRpBFv9zp9IC+JUDxhGvRV8IjPtomfwu1DPQfgPUo6+EuGzThjUcqrc
	2Aw1CqzZgC+Hrd5FB91+hqd9A8IS2k4CGU1XEVIMW5DT4GIRIdjrxARR4=
X-Received: by 2002:a05:7022:fd01:b0:12c:8b9:7200 with SMTP id a92af1059eb24-12c34eeca8amr4974556c88.17.1775931678009;
        Sat, 11 Apr 2026 11:21:18 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d562ac344csm9455531eec.25.2026.04.11.11.21.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 11:21:17 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>
Date: Sat, 11 Apr 2026 18:20:55 +0000
Message-Id: <20260411182055.24413-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: dennylin0707@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EZT55X6PLVWLBMYIO36CSM5PQHFITJM2
X-Message-ID-Hash: EZT55X6PLVWLBMYIO36CSM5PQHFITJM2
X-Mailman-Approved-At: Mon, 13 Apr 2026 08:50:48 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Hungyu Lin <dennylin0707@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: audio: extract topology size retrieval into a helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EZT55X6PLVWLBMYIO36CSM5PQHFITJM2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[38];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,body];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[dennylin0707@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.390];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 8093C3E9680
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The topology retrieval code currently mixes the size query with
allocation and data fetch in a single function.

Extract the size query into a helper to make the control flow clearer.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/greybus/audio_gb.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/audio_gb.c b/drivers/staging/greybus/audio_gb.c
index 9d8994fdb41a..d95f8b7d4ce2 100644
--- a/drivers/staging/greybus/audio_gb.c
+++ b/drivers/staging/greybus/audio_gb.c
@@ -8,21 +8,33 @@
 #include <linux/greybus.h>
 #include "audio_codec.h"
 
+static int gb_audio_gb_get_topology_size(struct gb_connection *connection,
+					 u16 *size)
+{
+	struct gb_audio_get_topology_size_response size_resp;
+	int ret;
+
+	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
+				NULL, 0, &size_resp, sizeof(size_resp));
+	if (ret)
+		return ret;
+
+	*size = le16_to_cpu(size_resp.size);
+	return 0;
+}
+
 /* TODO: Split into separate calls */
 int gb_audio_gb_get_topology(struct gb_connection *connection,
 			     struct gb_audio_topology **topology)
 {
-	struct gb_audio_get_topology_size_response size_resp;
 	struct gb_audio_topology *topo;
 	u16 size;
 	int ret;
 
-	ret = gb_operation_sync(connection, GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE,
-				NULL, 0, &size_resp, sizeof(size_resp));
+	ret = gb_audio_gb_get_topology_size(connection, &size);
 	if (ret)
 		return ret;
 
-	size = le16_to_cpu(size_resp.size);
 	if (size < sizeof(*topo))
 		return -ENODATA;
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
