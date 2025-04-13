Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B59A87206
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 14:59:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D37F4595B
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 12:59:49 +0000 (UTC)
Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	by lists.linaro.org (Postfix) with ESMTPS id 5A93A3F5FA
	for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 10:48:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linux.dev header.s=key1 header.b=pteAQmfs;
	spf=pass (lists.linaro.org: domain of thorsten.blum@linux.dev designates 95.215.58.188 as permitted sender) smtp.mailfrom=thorsten.blum@linux.dev;
	dmarc=pass (policy=none) header.from=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744541316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=FwPalQ+WPPJJofPUk8b+xFc99j4ifYRnW/QMrgi5bv8=;
	b=pteAQmfsLDQQGmwcB45zrDjGtykwo7sY/P5MUQzur/kdtjZkCJTNS0J8EFQKbTA8WpX91N
	bBbOrD/WIg8crniMxIIwGSqez6sIqvAqUUzgVi4AIeD0+s9dDo1M/P0MfRSfPx4Sg97Av/
	HMwPjPsm+iChEVHo4DjLiv1gh/YKpT4=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 13 Apr 2025 12:48:03 +0200
Message-ID: <20250413104802.49360-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-Rspamd-Queue-Id: 5A93A3F5FA
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.40 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[95.215.58.188:from];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:95.215.58.0/24];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:202172, ipnet:95.215.58.0/24, country:CH];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DWL_DNSWL_BLOCKED(0.00)[linux.dev:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linux.dev:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: thorsten.blum@linux.dev
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JT4SSX5V5SWE755IUPPZZKMZ4UIXUZYI
X-Message-ID-Hash: JT4SSX5V5SWE755IUPPZZKMZ4UIXUZYI
X-Mailman-Approved-At: Sun, 13 Apr 2025 12:59:24 +0000
CC: Thorsten Blum <thorsten.blum@linux.dev>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Reformat code in gb_operation_sync_timeout()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JT4SSX5V5SWE755IUPPZZKMZ4UIXUZYI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove any unnecessary curly braces and combine 'else' and 'if' to an
'else if' to improve the code's readability and reduce indentation.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/greybus/operation.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 8459e9bc0749..ba26504ccac3 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -1157,16 +1157,12 @@ int gb_operation_sync_timeout(struct gb_connection *connection, int type,
 		memcpy(operation->request->payload, request, request_size);
 
 	ret = gb_operation_request_send_sync_timeout(operation, timeout);
-	if (ret) {
+	if (ret)
 		dev_err(&connection->hd->dev,
 			"%s: synchronous operation id 0x%04x of type 0x%02x failed: %d\n",
 			connection->name, operation->id, type, ret);
-	} else {
-		if (response_size) {
-			memcpy(response, operation->response->payload,
-			       response_size);
-		}
-	}
+	else if (response_size)
+		memcpy(response, operation->response->payload, response_size);
 
 	gb_operation_put(operation);
 
-- 
2.49.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
