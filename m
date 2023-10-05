Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 83DF77B9DF3
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 15:58:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 92C3F40CD7
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 13:58:55 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 7053340C33
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 13:58:46 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=ptJJPyqo;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E5A96CE22C6;
	Thu,  5 Oct 2023 13:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8F81C43140;
	Thu,  5 Oct 2023 13:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696514323;
	bh=DBqd7AkU7DoctJZB0I+61/B9KY1iQe4pE42vmDX0AyY=;
	h=From:To:Cc:Subject:Date:From;
	b=ptJJPyqoL9jyG92VOx03xz1lMgofmxd2qO7NZ8CcbYm5yNHCMf8nWXbX/MjZZ1/p0
	 7dYNC3pAj83a8hqUQHTLGOLoB+ip6enJbnbZM79ZLo1YtvXMZm2jG5NBCQ1qJfejBe
	 F7TPvYBuxM+c6NXSTgjSJ1oJnleIeZ4gWTTe+nTM=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Date: Thu,  5 Oct 2023 15:58:34 +0200
Message-ID: <2023100533-broadband-hunk-9e91@gregkh>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Lines: 81
X-Developer-Signature: v=1; a=openpgp-sha256; l=2583; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=DBqd7AkU7DoctJZB0I+61/B9KY1iQe4pE42vmDX0AyY=; b=owGbwMvMwCRo6H6F97bub03G02pJDKlyBzlZa/er/6s6eWmpSMDJU2W7Z85/pXy59zTHbqslV bfNsqU9O2JZGASZGGTFFFm+bOM5ur/ikKKXoe1pmDmsTCBDGLg4BWAiNswM87Ofh/TaBruIr7LQ 6cre27FAw1iyimF+Wvd11YCnUT+1bhxWe2Ouuybf7cl+AA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spam-Level: *
X-Rspamd-Queue-Id: 7053340C33
Message-ID-Hash: SW5PTRMOWQMLYYSQBGZWFM5P6H255KUP
X-Message-ID-Hash: SW5PTRMOWQMLYYSQBGZWFM5P6H255KUP
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/3] staging: greybus: raw: make raw_class constant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SW5PTRMOWQMLYYSQBGZWFM5P6H255KUP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Now that the driver core allows for struct class to be in read-only
memory, making all 'class' structures to be declared at build time
placing them into read-only memory, instead of having to be dynamically
allocated at load time.

Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/staging/greybus/raw.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 8bca8cb12cc6..a00978c8e1d2 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -32,7 +32,10 @@ struct raw_data {
 	u8 data[];
 };
 
-static struct class *raw_class;
+static const struct class raw_class = {
+	.name = "gb_raw",
+};
+
 static int raw_major;
 static const struct file_operations raw_fops;
 static DEFINE_IDA(minors);
@@ -195,7 +198,7 @@ static int gb_raw_probe(struct gb_bundle *bundle,
 	if (retval)
 		goto error_connection_disable;
 
-	raw->device = device_create(raw_class, &connection->bundle->dev,
+	raw->device = device_create(&raw_class, &connection->bundle->dev,
 				    raw->dev, raw, "gb!raw%d", minor);
 	if (IS_ERR(raw->device)) {
 		retval = PTR_ERR(raw->device);
@@ -229,7 +232,7 @@ static void gb_raw_disconnect(struct gb_bundle *bundle)
 	struct raw_data *temp;
 
 	// FIXME - handle removing a connection when the char device node is open.
-	device_destroy(raw_class, raw->dev);
+	device_destroy(&raw_class, raw->dev);
 	cdev_del(&raw->cdev);
 	gb_connection_disable(connection);
 	ida_simple_remove(&minors, MINOR(raw->dev));
@@ -340,11 +343,9 @@ static int raw_init(void)
 	dev_t dev;
 	int retval;
 
-	raw_class = class_create("gb_raw");
-	if (IS_ERR(raw_class)) {
-		retval = PTR_ERR(raw_class);
+	retval = class_register(&raw_class);
+	if (retval)
 		goto error_class;
-	}
 
 	retval = alloc_chrdev_region(&dev, 0, NUM_MINORS, "gb_raw");
 	if (retval < 0)
@@ -361,7 +362,7 @@ static int raw_init(void)
 error_gb:
 	unregister_chrdev_region(dev, NUM_MINORS);
 error_chrdev:
-	class_destroy(raw_class);
+	class_unregister(&raw_class);
 error_class:
 	return retval;
 }
@@ -371,7 +372,7 @@ static void __exit raw_exit(void)
 {
 	greybus_deregister(&gb_raw_driver);
 	unregister_chrdev_region(MKDEV(raw_major, 0), NUM_MINORS);
-	class_destroy(raw_class);
+	class_unregister(&raw_class);
 	ida_destroy(&minors);
 }
 module_exit(raw_exit);
-- 
2.42.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
