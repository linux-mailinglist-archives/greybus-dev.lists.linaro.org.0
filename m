Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PJsIMVBymky7AUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 11:26:29 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4BE35827C
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 11:26:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 50E76402D3
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 09:26:28 +0000 (UTC)
Received: from yug-MacBookPro.lan (89-81-10-116.abo.bbox.fr [89.81.10.116])
	by lists.linaro.org (Postfix) with ESMTPS id 376493F719
	for <greybus-dev@lists.linaro.org>; Sun, 29 Mar 2026 21:55:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	dmarc=fail reason="No valid SPF, No valid DKIM" header.from=gmail.com (policy=none);
	spf=softfail (lists.linaro.org: 89.81.10.116 is neither permitted nor denied by domain of yug@yug.be) smtp.mailfrom=yug@yug.be
Received: by yug-MacBookPro.lan (Postfix, from userid 1000)
	id 4E326A879C7; Sun, 29 Mar 2026 23:55:27 +0200 (CEST)
From: Yug Merabtene <yug.merabtene@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun, 29 Mar 2026 23:55:27 +0200
Message-Id: <20260329215527.1403001-1-yug.merabtene@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Spam-Level: **
X-MailFrom: yug@yug.be
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WQAF7NXSS5EGL6NS3XHYWJXL6ZANNFNR
X-Message-ID-Hash: WQAF7NXSS5EGL6NS3XHYWJXL6ZANNFNR
X-Mailman-Approved-At: Mon, 30 Mar 2026 09:26:15 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Yug Merabtene <yug.merabtene@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: camera: use scnprintf() for debugfs buffers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WQAF7NXSS5EGL6NS3XHYWJXL6ZANNFNR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[yugmerabtene@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[greybus-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 4A4BE35827C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Signed-off-by: Yug Merabtene <yug.merabtene@gmail.com>
---
 drivers/staging/greybus/camera.c | 28 ++++++++++++++++++----------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..2e4968d206d3 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -889,9 +889,15 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
 
 	for (i = 0; i < size; i += 16) {
 		unsigned int nbytes = min_t(unsigned int, size - i, 16);
+		size_t remain;
 
-		buffer->length += sprintf(buffer->data + buffer->length,
-					  "%*ph\n", nbytes, caps + i);
+		remain = PAGE_SIZE - buffer->length;
+		if (!remain)
+			break;
+
+		buffer->length += scnprintf(buffer->data + buffer->length,
+					    remain, "%*ph\n", nbytes,
+					    caps + i);
 	}
 
 done:
@@ -973,17 +979,19 @@ static ssize_t gb_camera_debugfs_configure_streams(struct gb_camera *gcam,
 	if (ret < 0)
 		goto done;
 
-	buffer->length = sprintf(buffer->data, "%u;%u;", nstreams, flags);
+	buffer->length = scnprintf(buffer->data, PAGE_SIZE, "%u;%u;", nstreams, flags);
 
 	for (i = 0; i < nstreams; ++i) {
 		struct gb_camera_stream_config *stream = &streams[i];
 
-		buffer->length += sprintf(buffer->data + buffer->length,
-					  "%u;%u;%u;%u;%u;%u;%u;",
-					  stream->width, stream->height,
-					  stream->format, stream->vc,
-					  stream->dt[0], stream->dt[1],
-					  stream->max_size);
+		if (buffer->length < PAGE_SIZE)
+			buffer->length += scnprintf(buffer->data + buffer->length,
+					    PAGE_SIZE - buffer->length,
+					    "%u;%u;%u;%u;%u;%u;%u;",
+					    stream->width, stream->height,
+					    stream->format, stream->vc,
+					    stream->dt[0], stream->dt[1],
+					    stream->max_size);
 	}
 
 	ret = len;
@@ -1046,7 +1054,7 @@ static ssize_t gb_camera_debugfs_flush(struct gb_camera *gcam,
 	if (ret < 0)
 		return ret;
 
-	buffer->length = sprintf(buffer->data, "%u", req_id);
+	buffer->length = scnprintf(buffer->data, PAGE_SIZE, "%u", req_id);
 
 	return len;
 }
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
