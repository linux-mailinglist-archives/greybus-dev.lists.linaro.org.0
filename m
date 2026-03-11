Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kDn5MqcmsWnJrQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 09:24:07 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 593D525F1DC
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 09:24:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3FCE240149
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 08:24:06 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id D4FF03F764
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 08:24:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=IFVYBQdi;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 634FB6012A;
	Wed, 11 Mar 2026 08:24:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A36C4CEF7;
	Wed, 11 Mar 2026 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773217443;
	bh=44Z0qRUXUhsuCSzCi6hLN3itEzTgPOqA9Np28eT5kcI=;
	h=From:To:Cc:Subject:Date:From;
	b=IFVYBQdiL6iFyB5UwOOskqh4Py8xsXxxHJu1wM27eJJsJM6eNATMmpzuACf1FIWu1
	 SAVFvcazvtj2oACoeMOeTJA9LTsDYIKpaqSNl0yV0nJX3JPXT2AmUpRQ5GmITQ/jjp
	 7iFc6j6zEHvXqR8KyU/QUx+PaWQl6OhBHozID2P6b99p2MKOnqYJpDmH97/DauRl1x
	 b6p608lwCl+tare/neSzV3q/PVQsP3oTJ0xJ+wtWQZ/Fh18u67GdYGwMLWy0D3W7sa
	 KUlV+krNxRUUIaFdZ7Y7YxmsSL2BT1m7EJCMdRpbovsDAEmOy4zXZ9SfAjK+9hfBSb
	 3wXEKkVluCMaA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w0ErI-000000004Hm-1qgc;
	Wed, 11 Mar 2026 09:24:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 11 Mar 2026 09:22:26 +0100
Message-ID: <20260311082226.14865-1-johan@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Spamd-Bar: --
Message-ID-Hash: LPZFOYUITSCHZLQJAEPDFWPI3AE3EY6A
X-Message-ID-Hash: LPZFOYUITSCHZLQJAEPDFWPI3AE3EY6A
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] greybus: es2: drop redundant device reference
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LPZFOYUITSCHZLQJAEPDFWPI3AE3EY6A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 593D525F1DC
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
	NEURAL_HAM(-0.00)[-0.360];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
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

This one needs one more spin... Sorry about the mess up.

Johan


Changes in v3:
 - drop the leftover usb_dev_put() in early error paths

Changes in v2:
 - drop temporary udev variable as reported by the kernel test robot
   (W=1 warning)


 drivers/greybus/es2.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index 6ae0ac828afa..75b889fa21b4 100644
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
@@ -1257,11 +1253,10 @@ static int ap_probe(struct usb_interface *interface,
 	bool bulk_in_found = false;
 	bool arpc_in_found = false;
 
-	udev = usb_get_dev(interface_to_usbdev(interface));
+	udev = interface_to_usbdev(interface);
 
 	num_cports = apb_get_cport_count(udev);
 	if (num_cports < 0) {
-		usb_put_dev(udev);
 		dev_err(&udev->dev, "Cannot retrieve CPort count: %d\n",
 			num_cports);
 		return num_cports;
@@ -1269,10 +1264,8 @@ static int ap_probe(struct usb_interface *interface,
 
 	hd = gb_hd_create(&es2_driver, &udev->dev, ES2_GBUF_MSG_SIZE_MAX,
 			  num_cports);
-	if (IS_ERR(hd)) {
-		usb_put_dev(udev);
+	if (IS_ERR(hd))
 		return PTR_ERR(hd);
-	}
 
 	es2 = hd_to_es2(hd);
 	es2->hd = hd;
-- 
2.52.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
