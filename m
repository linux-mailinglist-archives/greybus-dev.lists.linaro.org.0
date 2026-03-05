Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DjwJER8qWkh8wAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Mar 2026 13:51:16 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1EF2121FE
	for <lists+greybus-dev@lfdr.de>; Thu, 05 Mar 2026 13:51:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 164FF4015D
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Mar 2026 12:51:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 83EAB400F1
	for <greybus-dev@lists.linaro.org>; Thu,  5 Mar 2026 12:51:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=EaGSXi5A;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 12EC761340;
	Thu,  5 Mar 2026 12:51:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD5F6C116C6;
	Thu,  5 Mar 2026 12:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772715071;
	bh=njXEsTMZ5BShzocq/55WZmd2JpFbSJspeiUMScX2Utc=;
	h=From:To:Cc:Subject:Date:From;
	b=EaGSXi5AYVjcDf6X8IUmWKQS/MtNYPo2KwimlHyvoQj4LRpEapYlbysxJLyK0tGQl
	 osl3vQjvWuYXXVIthgyCIrOojXAi+xENEK/RDfH42XWxAOZcWooanqMZRTWYZq2UAj
	 B01NsgJA2LBAwr7h82rEpR8NYlMmDla3TCG0vifXEdryO5j6eX5kurYFDcyvxQOune
	 0fq0I/noqycVP3rGZOcbC7891rZhaK0yJh5iPEoIBQNkM1ED16uLrokLzE0ByQdEUK
	 +XmMlZOXlt+vie2q/u+DLftGNtAlACThavw+T6P6E5RuoLBHyEIeygkDmlnRu62xUF
	 5/cr2AcLITAYA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vy8AX-000000002pf-1xzK;
	Thu, 05 Mar 2026 13:51:09 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu,  5 Mar 2026 13:50:36 +0100
Message-ID: <20260305125036.10856-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: NJ647PKJQTRA3ECAN56KKK5HBX36453R
X-Message-ID-Hash: NJ647PKJQTRA3ECAN56KKK5HBX36453R
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: es2: drop redundant device reference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NJ647PKJQTRA3ECAN56KKK5HBX36453R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 4C1EF2121FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.945];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:-]
X-Rspamd-Action: no action

Driver core holds a reference to the USB interface and its parent USB
device while the interface is bound to a driver and there is no need to
take additional references unless the structures are needed after
disconnect.

Drop the redundant device reference to reduce cargo culting, make it
easier to spot drivers where an extra reference is needed, and reduce
the risk of memory leaks when drivers fail to release it.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/greybus/es2.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index 6ae0ac828afa..bb513ef7f7ff 100644
--- a/drivers/greybus/es2.c
+++ b/drivers/greybus/es2.c
@@ -806,8 +806,6 @@ static void es2_destroy(struct es2_ap_dev *es2)
 
 	udev = es2->usb_dev;
 	gb_hd_put(es2->hd);
-
-	usb_put_dev(udev);
 }
 
 static void cport_in_callback(struct urb *urb)
@@ -1257,7 +1255,7 @@ static int ap_probe(struct usb_interface *interface,
 	bool bulk_in_found = false;
 	bool arpc_in_found = false;
 
-	udev = usb_get_dev(interface_to_usbdev(interface));
+	udev = interface_to_usbdev(interface);
 
 	num_cports = apb_get_cport_count(udev);
 	if (num_cports < 0) {
-- 
2.52.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
