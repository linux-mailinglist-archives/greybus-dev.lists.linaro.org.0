Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CF67B9DF6
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 15:59:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 00FC03EFA7
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 13:59:02 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 57F5D40C33
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 13:58:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=lcCQ8V9L;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0C1ADCE2077;
	Thu,  5 Oct 2023 13:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB82C116A4;
	Thu,  5 Oct 2023 13:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696514328;
	bh=AiYYMA+NHBeWDMz0RJeTj9dCfxc0pBpMecEskqVefGY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lcCQ8V9LlcSBGrW0NZctP7uRITYQmNVj6qin6uL/yCqmpr4oliqpI5HmUEK+9YF/x
	 J/TP6/3T+4qjBRTj+atu15R+CjHISSwUsjcUUPNBnb8U9FQQVTodnwYUWAX51Wf4YP
	 VtTPy+Vhhh8Bc4Eww4qNELhXKiuN3DY8cBtHYI4I=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Date: Thu,  5 Oct 2023 15:58:36 +0200
Message-ID: <2023100534-catty-moodiness-099e@gregkh>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <2023100533-broadband-hunk-9e91@gregkh>
References: <2023100533-broadband-hunk-9e91@gregkh>
MIME-Version: 1.0
Lines: 78
X-Developer-Signature: v=1; a=openpgp-sha256; l=2579; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=AiYYMA+NHBeWDMz0RJeTj9dCfxc0pBpMecEskqVefGY=; b=owGbwMvMwCRo6H6F97bub03G02pJDKlyB7l4gji/rr/28Y2vzu/Z3eHcPA2MupufTGAymJ8U+ P3k+0S2jlgWBkEmBlkxRZYv23iO7q84pOhlaHsaZg4rE8gQBi5OAZiIQQvDgo0Xn37b2aF7R1um J+jE5m1cFmVX7jDM09tcn/jyyuPL97RfHCz9mxp/+N9+RQA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.00 / 15.00];
	REPLY(-4.00)[];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 57F5D40C33
Message-ID-Hash: X46I2GDRBWCCD76J6DTANYX5MQFF2FZG
X-Message-ID-Hash: X46I2GDRBWCCD76J6DTANYX5MQFF2FZG
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] staging: greybus: fw-management: make fw_mgmt_class constant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/X46I2GDRBWCCD76J6DTANYX5MQFF2FZG/>
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
 drivers/staging/greybus/fw-management.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index cd9141e4b794..93137a3c4907 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -55,7 +55,10 @@ struct fw_mgmt {
  */
 #define NUM_MINORS		U8_MAX
 
-static struct class *fw_mgmt_class;
+static const struct class fw_mgmt_class = {
+	.name = "gb_fw_mgmt",
+};
+
 static dev_t fw_mgmt_dev_num;
 static DEFINE_IDA(fw_mgmt_minors_map);
 static LIST_HEAD(fw_mgmt_list);
@@ -629,7 +632,7 @@ int gb_fw_mgmt_connection_init(struct gb_connection *connection)
 		goto err_remove_ida;
 
 	/* Add a soft link to the previously added char-dev within the bundle */
-	fw_mgmt->class_device = device_create(fw_mgmt_class, fw_mgmt->parent,
+	fw_mgmt->class_device = device_create(&fw_mgmt_class, fw_mgmt->parent,
 					      fw_mgmt->dev_num, NULL,
 					      "gb-fw-mgmt-%d", minor);
 	if (IS_ERR(fw_mgmt->class_device)) {
@@ -664,7 +667,7 @@ void gb_fw_mgmt_connection_exit(struct gb_connection *connection)
 
 	fw_mgmt = gb_connection_get_data(connection);
 
-	device_destroy(fw_mgmt_class, fw_mgmt->dev_num);
+	device_destroy(&fw_mgmt_class, fw_mgmt->dev_num);
 	cdev_del(&fw_mgmt->cdev);
 	ida_simple_remove(&fw_mgmt_minors_map, MINOR(fw_mgmt->dev_num));
 
@@ -696,9 +699,9 @@ int fw_mgmt_init(void)
 {
 	int ret;
 
-	fw_mgmt_class = class_create("gb_fw_mgmt");
-	if (IS_ERR(fw_mgmt_class))
-		return PTR_ERR(fw_mgmt_class);
+	ret = class_register(&fw_mgmt_class);
+	if (ret)
+		return ret;
 
 	ret = alloc_chrdev_region(&fw_mgmt_dev_num, 0, NUM_MINORS,
 				  "gb_fw_mgmt");
@@ -708,13 +711,13 @@ int fw_mgmt_init(void)
 	return 0;
 
 err_remove_class:
-	class_destroy(fw_mgmt_class);
+	class_unregister(&fw_mgmt_class);
 	return ret;
 }
 
 void fw_mgmt_exit(void)
 {
 	unregister_chrdev_region(fw_mgmt_dev_num, NUM_MINORS);
-	class_destroy(fw_mgmt_class);
+	class_unregister(&fw_mgmt_class);
 	ida_destroy(&fw_mgmt_minors_map);
 }
-- 
2.42.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
