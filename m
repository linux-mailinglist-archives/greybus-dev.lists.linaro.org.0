Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qIGlMFuIqmn+TAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 06 Mar 2026 08:55:07 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C4C21CA73
	for <lists+greybus-dev@lfdr.de>; Fri, 06 Mar 2026 08:55:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4B1E83F70A
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Mar 2026 07:55:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 63F443F6A0
	for <greybus-dev@lists.linaro.org>; Fri,  6 Mar 2026 07:55:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=GBFSVS+3;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=johan@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C313E419A6;
	Fri,  6 Mar 2026 07:55:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E48DC4CEF7;
	Fri,  6 Mar 2026 07:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772783702;
	bh=1Lybsl8fGpg34wuqIaD6BSoi0h8hLG+AjaFlioISDCI=;
	h=From:To:Cc:Subject:Date:From;
	b=GBFSVS+3cOuQvXYioEs7Y8vlz/qJrhb7vhpj5vYpgdjFSe7XAs2MHEVcIbmyh16UT
	 ExMiWhWsw/EJuRDEJHD4GBTa029vrdsVVg9nRN3sRkLR5GkTEZtB9EGXvGdszrNvd5
	 r7OUwF79jPDV0Q6chuorBbHLK1JQFG6SDmhB4OHQElsfE5c2ZX0Y6Jk7uI6OUqrdPJ
	 WubAhTpnk2dDbJkLl9VlUM8uzAIfWfOW3Z7A9zYoShWnz2RlaUSn5OdnMbufTAZ2nJ
	 NsJyo9OIcxkKu+D7Tz9Zd1PvXTbA1/GrjcZUAaXJUtn7ZAhiqK5f727EQnT3fpG8Vu
	 TgpbKEB7N9vYg==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vyQ1U-0000000082q-0BIA;
	Fri, 06 Mar 2026 08:55:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri,  6 Mar 2026 08:54:48 +0100
Message-ID: <20260306075448.30909-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: LR5YAJEQSHPGNEISIY23ZJVDNBHQIS34
X-Message-ID-Hash: LR5YAJEQSHPGNEISIY23ZJVDNBHQIS34
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: es2: drop redundant device reference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LR5YAJEQSHPGNEISIY23ZJVDNBHQIS34/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 56C4C21CA73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.99 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.946];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo]
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

Changes in v2
 - drop temporary udev variable as reported by the kernel test robot
   (W=1 warning)


 drivers/greybus/es2.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index 6ae0ac828afa..a97868009191 100644
--- a/drivers/greybus/es2.c
+++ b/drivers/greybus/es2.c
@@ -772,7 +772,6 @@ static int check_urb_status(struct urb *urb)
 
 static void es2_destroy(struct es2_ap_dev *es2)
 {
-	struct usb_device *udev;
 	struct urb *urb;
 	int i;
 
@@ -804,10 +803,7 @@ static void es2_destroy(struct es2_ap_dev *es2)
 	gb_hd_cport_release_reserved(es2->hd, ES2_CPORT_CDSI1);
 	gb_hd_cport_release_reserved(es2->hd, ES2_CPORT_CDSI0);
 
-	udev = es2->usb_dev;
 	gb_hd_put(es2->hd);
-
-	usb_put_dev(udev);
 }
 
 static void cport_in_callback(struct urb *urb)
@@ -1257,7 +1253,7 @@ static int ap_probe(struct usb_interface *interface,
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
