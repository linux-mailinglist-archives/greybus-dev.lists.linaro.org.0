Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F1B82D2A1
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jan 2024 01:01:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0B96043F66
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jan 2024 00:01:24 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr [80.12.242.20])
	by lists.linaro.org (Postfix) with ESMTPS id 6A2E743FD4
	for <greybus-dev@lists.linaro.org>; Sun, 14 Jan 2024 09:57:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=wanadoo.fr header.s=t20230301 header.b=OZLsa+cG;
	spf=pass (lists.linaro.org: domain of christophe.jaillet@wanadoo.fr designates 80.12.242.20 as permitted sender) smtp.mailfrom=christophe.jaillet@wanadoo.fr;
	dmarc=pass (policy=none) header.from=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id OxEsri9TbPUoqOxEsr29aG; Sun, 14 Jan 2024 10:57:11 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705226231;
	bh=lqzv3ZLxuAAMhNo6bpMj22uaPMyMoPdULdX0yVOZDFo=;
	h=From:To:Cc:Subject:Date;
	b=OZLsa+cGkeNE3acSjtG9Rpfl/q1SQ/ND8zZ0J8UJJ+Cv9dXcAAOWllJKok/Ycr59a
	 Hefs//IBAtWUrcGbOsR9XN9IMKLTBa1zlDpbmuH8+3SJ69AgG2dPawvayP78jPW7Yx
	 Q89X9SRD7/9wASbLVW33qKX2jE4nxhELqGJxt5h1RdZR8M4r9KMs8ILGd2TUE58m6b
	 oxeYctlUsSeW/8JDtW0omTcCn00rl8PxJCdv8qF4nJJ+hm5MEBSxaD9wM0fXneGCL7
	 NGs+ab67jwKVOI5cTpCozYurSnwzf3k/HPl5fWrJoi8kz013tEW7Lnt7Lmy5WARz0g
	 DE/pIR4ymc7Jw==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sun, 14 Jan 2024 10:57:11 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sun, 14 Jan 2024 10:57:02 +0100
Message-ID: <26425379d3eb9ba1b9af44468576ee20c77eb248.1705226208.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,none];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	R_SPF_ALLOW(-0.20)[+ip4:80.12.242.0/25];
	RWL_MAILSPIKE_VERYGOOD(-0.20)[80.12.242.20:from];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	RCVD_COUNT_ONE(0.00)[1];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	ASN(0.00)[asn:3215, ipnet:80.12.240.0/20, country:FR];
	FREEMAIL_ENVFROM(0.00)[wanadoo.fr];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.linaro.org];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[wanadoo.fr:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6A2E743FD4
X-Spamd-Bar: --
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Y76PMFSX2BOCHZY46ZG7IFW54MHFETB4
X-Message-ID-Hash: Y76PMFSX2BOCHZY46ZG7IFW54MHFETB4
X-Mailman-Approved-At: Mon, 15 Jan 2024 00:01:21 +0000
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Remove usage of the deprecated ida_simple_xx() API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Y76PMFSX2BOCHZY46ZG7IFW54MHFETB4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

ida_alloc() and ida_free() should be preferred to the deprecated
ida_simple_get() and ida_simple_remove().

Note that the upper limit of ida_simple_get() is exclusive, but the one of
ida_alloc_range()/ida_alloc_max() is inclusive. So a -1 has been added when
needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/greybus/es2.c       |  8 ++++----
 drivers/greybus/hd.c        | 16 ++++++++--------
 drivers/greybus/interface.c |  9 ++++-----
 3 files changed, 16 insertions(+), 17 deletions(-)

diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index e89cca015095..1ee78d0d90b4 100644
--- a/drivers/greybus/es2.c
+++ b/drivers/greybus/es2.c
@@ -513,16 +513,16 @@ static int es2_cport_allocate(struct gb_host_device *hd, int cport_id,
 
 	if (cport_id < 0) {
 		ida_start = 0;
-		ida_end = hd->num_cports;
+		ida_end = hd->num_cports - 1;
 	} else if (cport_id < hd->num_cports) {
 		ida_start = cport_id;
-		ida_end = cport_id + 1;
+		ida_end = cport_id;
 	} else {
 		dev_err(&hd->dev, "cport %d not available\n", cport_id);
 		return -EINVAL;
 	}
 
-	return ida_simple_get(id_map, ida_start, ida_end, GFP_KERNEL);
+	return ida_alloc_range(id_map, ida_start, ida_end, GFP_KERNEL);
 }
 
 static void es2_cport_release(struct gb_host_device *hd, u16 cport_id)
@@ -535,7 +535,7 @@ static void es2_cport_release(struct gb_host_device *hd, u16 cport_id)
 		return;
 	}
 
-	ida_simple_remove(&hd->cport_id_map, cport_id);
+	ida_free(&hd->cport_id_map, cport_id);
 }
 
 static int cport_enable(struct gb_host_device *hd, u16 cport_id,
diff --git a/drivers/greybus/hd.c b/drivers/greybus/hd.c
index 72b21bf2d7d3..bc5fd2f53d8b 100644
--- a/drivers/greybus/hd.c
+++ b/drivers/greybus/hd.c
@@ -50,7 +50,7 @@ int gb_hd_cport_reserve(struct gb_host_device *hd, u16 cport_id)
 	struct ida *id_map = &hd->cport_id_map;
 	int ret;
 
-	ret = ida_simple_get(id_map, cport_id, cport_id + 1, GFP_KERNEL);
+	ret = ida_alloc_range(id_map, cport_id, cport_id, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(&hd->dev, "failed to reserve cport %u\n", cport_id);
 		return ret;
@@ -64,7 +64,7 @@ void gb_hd_cport_release_reserved(struct gb_host_device *hd, u16 cport_id)
 {
 	struct ida *id_map = &hd->cport_id_map;
 
-	ida_simple_remove(id_map, cport_id);
+	ida_free(id_map, cport_id);
 }
 EXPORT_SYMBOL_GPL(gb_hd_cport_release_reserved);
 
@@ -80,16 +80,16 @@ int gb_hd_cport_allocate(struct gb_host_device *hd, int cport_id,
 
 	if (cport_id < 0) {
 		ida_start = 0;
-		ida_end = hd->num_cports;
+		ida_end = hd->num_cports - 1;
 	} else if (cport_id < hd->num_cports) {
 		ida_start = cport_id;
-		ida_end = cport_id + 1;
+		ida_end = cport_id;
 	} else {
 		dev_err(&hd->dev, "cport %d not available\n", cport_id);
 		return -EINVAL;
 	}
 
-	return ida_simple_get(id_map, ida_start, ida_end, GFP_KERNEL);
+	return ida_alloc_range(id_map, ida_start, ida_end, GFP_KERNEL);
 }
 
 /* Locking: Caller guarantees serialisation */
@@ -100,7 +100,7 @@ void gb_hd_cport_release(struct gb_host_device *hd, u16 cport_id)
 		return;
 	}
 
-	ida_simple_remove(&hd->cport_id_map, cport_id);
+	ida_free(&hd->cport_id_map, cport_id);
 }
 
 static void gb_hd_release(struct device *dev)
@@ -111,7 +111,7 @@ static void gb_hd_release(struct device *dev)
 
 	if (hd->svc)
 		gb_svc_put(hd->svc);
-	ida_simple_remove(&gb_hd_bus_id_map, hd->bus_id);
+	ida_free(&gb_hd_bus_id_map, hd->bus_id);
 	ida_destroy(&hd->cport_id_map);
 	kfree(hd);
 }
@@ -162,7 +162,7 @@ struct gb_host_device *gb_hd_create(struct gb_hd_driver *driver,
 	if (!hd)
 		return ERR_PTR(-ENOMEM);
 
-	ret = ida_simple_get(&gb_hd_bus_id_map, 1, 0, GFP_KERNEL);
+	ret = ida_alloc_min(&gb_hd_bus_id_map, 1, GFP_KERNEL);
 	if (ret < 0) {
 		kfree(hd);
 		return ERR_PTR(ret);
diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
index 9ec949a438ef..c3cfd62831ff 100644
--- a/drivers/greybus/interface.c
+++ b/drivers/greybus/interface.c
@@ -131,9 +131,8 @@ static int gb_interface_route_create(struct gb_interface *intf)
 	int ret;
 
 	/* Allocate an interface device id. */
-	ret = ida_simple_get(&svc->device_id_map,
-			     GB_SVC_DEVICE_ID_MIN, GB_SVC_DEVICE_ID_MAX + 1,
-			     GFP_KERNEL);
+	ret = ida_alloc_range(&svc->device_id_map, GB_SVC_DEVICE_ID_MIN,
+			      GB_SVC_DEVICE_ID_MAX, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(&intf->dev, "failed to allocate device id: %d\n", ret);
 		return ret;
@@ -165,7 +164,7 @@ static int gb_interface_route_create(struct gb_interface *intf)
 	 * XXX anymore.
 	 */
 err_ida_remove:
-	ida_simple_remove(&svc->device_id_map, device_id);
+	ida_free(&svc->device_id_map, device_id);
 
 	return ret;
 }
@@ -178,7 +177,7 @@ static void gb_interface_route_destroy(struct gb_interface *intf)
 		return;
 
 	gb_svc_route_destroy(svc, svc->ap_intf_id, intf->interface_id);
-	ida_simple_remove(&svc->device_id_map, intf->device_id);
+	ida_free(&svc->device_id_map, intf->device_id);
 	intf->device_id = GB_INTERFACE_DEVICE_ID_BAD;
 }
 
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
