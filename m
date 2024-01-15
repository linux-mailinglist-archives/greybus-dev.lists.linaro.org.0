Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 13E9582ED7C
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jan 2024 12:15:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E258943C31
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jan 2024 11:15:05 +0000 (UTC)
Received: from smtp.smtpout.orange.fr (smtp-15.smtpout.orange.fr [80.12.242.15])
	by lists.linaro.org (Postfix) with ESMTPS id 1513F3F360
	for <greybus-dev@lists.linaro.org>; Mon, 15 Jan 2024 20:22:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=wanadoo.fr header.s=t20230301 header.b=I86YFgCg;
	spf=pass (lists.linaro.org: domain of christophe.jaillet@wanadoo.fr designates 80.12.242.15 as permitted sender) smtp.mailfrom=christophe.jaillet@wanadoo.fr;
	dmarc=pass (policy=none) header.from=wanadoo.fr
Received: from fedora.home ([92.140.202.140])
	by smtp.orange.fr with ESMTPA
	id PTTir1ptWH4TlPTTirsAw4; Mon, 15 Jan 2024 21:22:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1705350161;
	bh=KLEUXPxcl4S2K+yijIUmXn33V7/4C3/BfvWp16xY4Co=;
	h=From:To:Cc:Subject:Date;
	b=I86YFgCgO6G/h+knHPdkW5D98gIRsLPDog8+Wcz7suvnoOQAFVkQUtlrzAHk1PI1y
	 KWT9DzS1q/HuMLx1nACmGXlQbCiSLPL72Rzr9JHbtJ9g/3vFPFPD5bMZqRXLKh8DjU
	 vLvu+cZdiO9qewaB39mV3n8QmJa8UTX65fQbo2PhbxVRZYuhh1bv4g8ukBHpai44/F
	 3iCx2dwHnxte71IqQaBWAvx0pkaIjCG0jPJmWxYq89tA50IE25oOl5KngJMdIEKlpU
	 WUdzm/LsbOK90Ix6jxe43FUy1UR1VuOIBQXU9pJlE9M0F6ko0NCnXkS7s87WZFcU/P
	 e0oKbUGl1Kq5A==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 15 Jan 2024 21:22:41 +0100
X-ME-IP: 92.140.202.140
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <vireshk@kernel.org>,
	"Bryan O'Donoghue" <pure.logic@nexus-software.ie>
Date: Mon, 15 Jan 2024 21:22:29 +0100
Message-ID: <2e7bbdaf8a495bb1273396395b5c779363287581.1705350141.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,none];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[80.12.242.15:from];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	R_SPF_ALLOW(-0.20)[+ip4:80.12.242.0/25];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,nexus-software.ie];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.linaro.org,lists.linux.dev];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:3215, ipnet:80.12.240.0/20, country:FR];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVFROM(0.00)[wanadoo.fr];
	NEURAL_HAM(-0.00)[-1.000]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1513F3F360
X-Spamd-Bar: -
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VKFUXGUDEAGX47SIRBAY7X6Q6YVVFA65
X-Message-ID-Hash: VKFUXGUDEAGX47SIRBAY7X6Q6YVVFA65
X-Mailman-Approved-At: Tue, 16 Jan 2024 11:15:03 +0000
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Remove usage of the deprecated ida_simple_xx() API
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VKFUXGUDEAGX47SIRBAY7X6Q6YVVFA65/>
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

Note that the upper limit of ida_simple_get() is exclusive, buInputt the one of
ida_alloc_range()/ida_alloc_max() is inclusive. So a -1 has been added when
needed.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/staging/greybus/audio_manager.c  |  8 ++++----
 drivers/staging/greybus/authentication.c |  6 +++---
 drivers/staging/greybus/fw-download.c    |  7 +++----
 drivers/staging/greybus/fw-management.c  | 20 +++++++++-----------
 drivers/staging/greybus/gbphy.c          |  6 +++---
 drivers/staging/greybus/loopback.c       |  6 +++---
 drivers/staging/greybus/raw.c            |  6 +++---
 drivers/staging/greybus/vibrator.c       |  6 +++---
 8 files changed, 31 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager.c b/drivers/staging/greybus/audio_manager.c
index 9a3f7c034ab4..fa43d35bbcec 100644
--- a/drivers/staging/greybus/audio_manager.c
+++ b/drivers/staging/greybus/audio_manager.c
@@ -44,14 +44,14 @@ int gb_audio_manager_add(struct gb_audio_manager_module_descriptor *desc)
 	int id;
 	int err;
 
-	id = ida_simple_get(&module_id, 0, 0, GFP_KERNEL);
+	id = ida_alloc(&module_id, GFP_KERNEL);
 	if (id < 0)
 		return id;
 
 	err = gb_audio_manager_module_create(&module, manager_kset,
 					     id, desc);
 	if (err) {
-		ida_simple_remove(&module_id, id);
+		ida_free(&module_id, id);
 		return err;
 	}
 
@@ -78,7 +78,7 @@ int gb_audio_manager_remove(int id)
 	list_del(&module->list);
 	kobject_put(&module->kobj);
 	up_write(&modules_rwsem);
-	ida_simple_remove(&module_id, id);
+	ida_free(&module_id, id);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(gb_audio_manager_remove);
@@ -92,7 +92,7 @@ void gb_audio_manager_remove_all(void)
 
 	list_for_each_entry_safe(module, next, &modules_list, list) {
 		list_del(&module->list);
-		ida_simple_remove(&module_id, module->id);
+		ida_free(&module_id, module->id);
 		kobject_put(&module->kobj);
 	}
 
diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index b67315641d18..d53e58f92e81 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -324,7 +324,7 @@ int gb_cap_connection_init(struct gb_connection *connection)
 	if (ret)
 		goto err_list_del;
 
-	minor = ida_simple_get(&cap_minors_map, 0, NUM_MINORS, GFP_KERNEL);
+	minor = ida_alloc_max(&cap_minors_map, NUM_MINORS - 1, GFP_KERNEL);
 	if (minor < 0) {
 		ret = minor;
 		goto err_connection_disable;
@@ -351,7 +351,7 @@ int gb_cap_connection_init(struct gb_connection *connection)
 err_del_cdev:
 	cdev_del(&cap->cdev);
 err_remove_ida:
-	ida_simple_remove(&cap_minors_map, minor);
+	ida_free(&cap_minors_map, minor);
 err_connection_disable:
 	gb_connection_disable(connection);
 err_list_del:
@@ -375,7 +375,7 @@ void gb_cap_connection_exit(struct gb_connection *connection)
 
 	device_destroy(&cap_class, cap->dev_num);
 	cdev_del(&cap->cdev);
-	ida_simple_remove(&cap_minors_map, MINOR(cap->dev_num));
+	ida_free(&cap_minors_map, MINOR(cap->dev_num));
 
 	/*
 	 * Disallow any new ioctl operations on the char device and wait for
diff --git a/drivers/staging/greybus/fw-download.c b/drivers/staging/greybus/fw-download.c
index 543692c567f9..2a5c6d1b049c 100644
--- a/drivers/staging/greybus/fw-download.c
+++ b/drivers/staging/greybus/fw-download.c
@@ -63,8 +63,7 @@ static void fw_req_release(struct kref *kref)
 	 * just hope that it never happens.
 	 */
 	if (!fw_req->timedout)
-		ida_simple_remove(&fw_req->fw_download->id_map,
-				  fw_req->firmware_id);
+		ida_free(&fw_req->fw_download->id_map, fw_req->firmware_id);
 
 	kfree(fw_req);
 }
@@ -171,7 +170,7 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
 		return ERR_PTR(-ENOMEM);
 
 	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
-	ret = ida_simple_get(&fw_download->id_map, 1, 256, GFP_KERNEL);
+	ret = ida_alloc_range(&fw_download->id_map, 1, 255, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(fw_download->parent,
 			"failed to allocate firmware id (%d)\n", ret);
@@ -212,7 +211,7 @@ static struct fw_request *find_firmware(struct fw_download *fw_download,
 	return fw_req;
 
 err_free_id:
-	ida_simple_remove(&fw_download->id_map, fw_req->firmware_id);
+	ida_free(&fw_download->id_map, fw_req->firmware_id);
 err_free_req:
 	kfree(fw_req);
 
diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 93137a3c4907..3054f084d777 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -165,7 +165,7 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 	}
 
 	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
-	ret = ida_simple_get(&fw_mgmt->id_map, 1, 256, GFP_KERNEL);
+	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(fw_mgmt->parent, "failed to allocate request id (%d)\n",
 			ret);
@@ -180,8 +180,7 @@ static int fw_mgmt_load_and_validate_operation(struct fw_mgmt *fw_mgmt,
 				GB_FW_MGMT_TYPE_LOAD_AND_VALIDATE_FW, &request,
 				sizeof(request), NULL, 0);
 	if (ret) {
-		ida_simple_remove(&fw_mgmt->id_map,
-				  fw_mgmt->intf_fw_request_id);
+		ida_free(&fw_mgmt->id_map, fw_mgmt->intf_fw_request_id);
 		fw_mgmt->intf_fw_request_id = 0;
 		dev_err(fw_mgmt->parent,
 			"load and validate firmware request failed (%d)\n",
@@ -220,7 +219,7 @@ static int fw_mgmt_interface_fw_loaded_operation(struct gb_operation *op)
 		return -ENODEV;
 	}
 
-	ida_simple_remove(&fw_mgmt->id_map, fw_mgmt->intf_fw_request_id);
+	ida_free(&fw_mgmt->id_map, fw_mgmt->intf_fw_request_id);
 	fw_mgmt->intf_fw_request_id = 0;
 	fw_mgmt->intf_fw_status = request->status;
 	fw_mgmt->intf_fw_major = le16_to_cpu(request->major);
@@ -316,7 +315,7 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 	}
 
 	/* Allocate ids from 1 to 255 (u8-max), 0 is an invalid id */
-	ret = ida_simple_get(&fw_mgmt->id_map, 1, 256, GFP_KERNEL);
+	ret = ida_alloc_range(&fw_mgmt->id_map, 1, 255, GFP_KERNEL);
 	if (ret < 0) {
 		dev_err(fw_mgmt->parent, "failed to allocate request id (%d)\n",
 			ret);
@@ -330,8 +329,7 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 				GB_FW_MGMT_TYPE_BACKEND_FW_UPDATE, &request,
 				sizeof(request), NULL, 0);
 	if (ret) {
-		ida_simple_remove(&fw_mgmt->id_map,
-				  fw_mgmt->backend_fw_request_id);
+		ida_free(&fw_mgmt->id_map, fw_mgmt->backend_fw_request_id);
 		fw_mgmt->backend_fw_request_id = 0;
 		dev_err(fw_mgmt->parent,
 			"backend %s firmware update request failed (%d)\n", tag,
@@ -369,7 +367,7 @@ static int fw_mgmt_backend_fw_updated_operation(struct gb_operation *op)
 		return -ENODEV;
 	}
 
-	ida_simple_remove(&fw_mgmt->id_map, fw_mgmt->backend_fw_request_id);
+	ida_free(&fw_mgmt->id_map, fw_mgmt->backend_fw_request_id);
 	fw_mgmt->backend_fw_request_id = 0;
 	fw_mgmt->backend_fw_status = request->status;
 
@@ -617,7 +615,7 @@ int gb_fw_mgmt_connection_init(struct gb_connection *connection)
 	if (ret)
 		goto err_list_del;
 
-	minor = ida_simple_get(&fw_mgmt_minors_map, 0, NUM_MINORS, GFP_KERNEL);
+	minor = ida_alloc_max(&fw_mgmt_minors_map, NUM_MINORS - 1, GFP_KERNEL);
 	if (minor < 0) {
 		ret = minor;
 		goto err_connection_disable;
@@ -645,7 +643,7 @@ int gb_fw_mgmt_connection_init(struct gb_connection *connection)
 err_del_cdev:
 	cdev_del(&fw_mgmt->cdev);
 err_remove_ida:
-	ida_simple_remove(&fw_mgmt_minors_map, minor);
+	ida_free(&fw_mgmt_minors_map, minor);
 err_connection_disable:
 	gb_connection_disable(connection);
 err_list_del:
@@ -669,7 +667,7 @@ void gb_fw_mgmt_connection_exit(struct gb_connection *connection)
 
 	device_destroy(&fw_mgmt_class, fw_mgmt->dev_num);
 	cdev_del(&fw_mgmt->cdev);
-	ida_simple_remove(&fw_mgmt_minors_map, MINOR(fw_mgmt->dev_num));
+	ida_free(&fw_mgmt_minors_map, MINOR(fw_mgmt->dev_num));
 
 	/*
 	 * Disallow any new ioctl operations on the char device and wait for
diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 6a7d8cf2a1eb..93b74a236ab1 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -46,7 +46,7 @@ static void gbphy_dev_release(struct device *dev)
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
-	ida_simple_remove(&gbphy_id, gbphy_dev->id);
+	ida_free(&gbphy_id, gbphy_dev->id);
 	kfree(gbphy_dev);
 }
 
@@ -225,13 +225,13 @@ static struct gbphy_device *gb_gbphy_create_dev(struct gb_bundle *bundle,
 	int retval;
 	int id;
 
-	id = ida_simple_get(&gbphy_id, 1, 0, GFP_KERNEL);
+	id = ida_alloc_min(&gbphy_id, 1, GFP_KERNEL);
 	if (id < 0)
 		return ERR_PTR(id);
 
 	gbphy_dev = kzalloc(sizeof(*gbphy_dev), GFP_KERNEL);
 	if (!gbphy_dev) {
-		ida_simple_remove(&gbphy_id, id);
+		ida_free(&gbphy_id, id);
 		return ERR_PTR(-ENOMEM);
 	}
 
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index d7b39f3bb652..bb33379b5297 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -1028,7 +1028,7 @@ static int gb_loopback_probe(struct gb_bundle *bundle,
 	gb->file = debugfs_create_file(name, S_IFREG | 0444, gb_dev.root, gb,
 				       &gb_loopback_dbgfs_latency_fops);
 
-	gb->id = ida_simple_get(&loopback_ida, 0, 0, GFP_KERNEL);
+	gb->id = ida_alloc(&loopback_ida, GFP_KERNEL);
 	if (gb->id < 0) {
 		retval = gb->id;
 		goto out_debugfs_remove;
@@ -1079,7 +1079,7 @@ static int gb_loopback_probe(struct gb_bundle *bundle,
 out_connection_disable:
 	gb_connection_disable(connection);
 out_ida_remove:
-	ida_simple_remove(&loopback_ida, gb->id);
+	ida_free(&loopback_ida, gb->id);
 out_debugfs_remove:
 	debugfs_remove(gb->file);
 out_connection_destroy:
@@ -1121,7 +1121,7 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
 	spin_unlock_irqrestore(&gb_dev.lock, flags);
 
 	device_unregister(gb->dev);
-	ida_simple_remove(&loopback_ida, gb->id);
+	ida_free(&loopback_ida, gb->id);
 
 	gb_connection_destroy(gb->connection);
 	kfree(gb);
diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index b9c6eff7cdc1..836d35e5fa85 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -181,7 +181,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	raw->connection = connection;
 	greybus_set_drvdata(bundle, raw);
 
-	minor = ida_simple_get(&minors, 0, 0, GFP_KERNEL);
+	minor = ida_alloc(&minors, GFP_KERNEL);
 	if (minor < 0) {
 		retval = minor;
 		goto error_connection_destroy;
@@ -214,7 +214,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	gb_connection_disable(connection);
 
 error_remove_ida:
-	ida_simple_remove(&minors, minor);
+	ida_free(&minors, minor);
 
 error_connection_destroy:
 	gb_connection_destroy(connection);
@@ -235,7 +235,7 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	device_destroy(&raw_class, raw->dev);
 	cdev_del(&raw->cdev);
 	gb_connection_disable(connection);
-	ida_simple_remove(&minors, MINOR(raw->dev));
+	ida_free(&minors, MINOR(raw->dev));
 	gb_connection_destroy(connection);
 
 	mutex_lock(&raw->list_lock);
diff --git a/drivers/staging/greybus/vibrator.c b/drivers/staging/greybus/vibrator.c
index 227e18d92a95..89bef8045549 100644
--- a/drivers/staging/greybus/vibrator.c
+++ b/drivers/staging/greybus/vibrator.c
@@ -153,7 +153,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	 * there is a "real" device somewhere in the kernel for this, but I
 	 * can't find it at the moment...
 	 */
-	vib->minor = ida_simple_get(&minors, 0, 0, GFP_KERNEL);
+	vib->minor = ida_alloc(&minors, GFP_KERNEL);
 	if (vib->minor < 0) {
 		retval = vib->minor;
 		goto err_connection_disable;
@@ -173,7 +173,7 @@ static int gb_vibrator_probe(struct gb_bundle *bundle,
 	return 0;
 
 err_ida_remove:
-	ida_simple_remove(&minors, vib->minor);
+	ida_free(&minors, vib->minor);
 err_connection_disable:
 	gb_connection_disable(connection);
 err_connection_destroy:
@@ -197,7 +197,7 @@ static void gb_vibrator_disconnect(struct gb_bundle *bundle)
 		turn_off(vib);
 
 	device_unregister(vib->dev);
-	ida_simple_remove(&minors, vib->minor);
+	ida_free(&minors, vib->minor);
 	gb_connection_disable(vib->connection);
 	gb_connection_destroy(vib->connection);
 	kfree(vib);
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
