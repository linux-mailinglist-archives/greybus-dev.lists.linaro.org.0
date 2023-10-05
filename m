Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E93CB7B9DF2
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 15:58:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 007CE40C33
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Oct 2023 13:58:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 1AD2D3EFA7
	for <greybus-dev@lists.linaro.org>; Thu,  5 Oct 2023 13:58:41 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=V2p1hDhN;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9BC4761981;
	Thu,  5 Oct 2023 13:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52EEC43142;
	Thu,  5 Oct 2023 13:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1696514320;
	bh=5pLx0oV6bg6h2ZrtEPu2Hn5oOoMFTmfUpUEMcaBhv+g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=V2p1hDhNf/h8zw4v3DVF9FkdwMg8Zai0AvvpOf6zl6cAvMGLEnG2C3kJ1Pcg4cMh0
	 CVJoBGxwyXXULQuaiuFNr+sUtJqK7otsLII7covBEu3tWQX9exB8NpY4ytvpsYtevU
	 eSJx+a+hcirGFtWg83gRzJW3vt+blGerh6PCca2o=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Date: Thu,  5 Oct 2023 15:58:35 +0200
Message-ID: <2023100534-showoff-alright-6c95@gregkh>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <2023100533-broadband-hunk-9e91@gregkh>
References: <2023100533-broadband-hunk-9e91@gregkh>
MIME-Version: 1.0
Lines: 78
X-Developer-Signature: v=1; a=openpgp-sha256; l=2480; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=5pLx0oV6bg6h2ZrtEPu2Hn5oOoMFTmfUpUEMcaBhv+g=; b=owGbwMvMwCRo6H6F97bub03G02pJDKlyB7n2RddOaQudZy9QdP3BpG3GR5a513/qfyJ7xPTZn /hH+y+c7YhlYRBkYpAVU2T5so3n6P6KQ4pehranYeawMoEMYeDiFICJsOswLDj9Q1bJ/+TVPYLz o54GWQb1CJRvAYo21XEwR0Ssn8TzJK45Zn4p45FAL1EA
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
X-Spamd-Bar: +
X-Spamd-Result: default: False [1.00 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
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
X-Rspamd-Queue-Id: 1AD2D3EFA7
Message-ID-Hash: GNR3QUOICMF4XDQU52E6OKMQ4BYOBCFT
X-Message-ID-Hash: GNR3QUOICMF4XDQU52E6OKMQ4BYOBCFT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] staging: greybus: authentication: make cap_class constant
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GNR3QUOICMF4XDQU52E6OKMQ4BYOBCFT/>
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
 drivers/staging/greybus/authentication.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/authentication.c b/drivers/staging/greybus/authentication.c
index 7e01790a4659..b67315641d18 100644
--- a/drivers/staging/greybus/authentication.c
+++ b/drivers/staging/greybus/authentication.c
@@ -36,7 +36,10 @@ struct gb_cap {
 	dev_t			dev_num;
 };
 
-static struct class *cap_class;
+static const struct class cap_class = {
+	.name = "gb_authenticate",
+};
+
 static dev_t cap_dev_num;
 static DEFINE_IDA(cap_minors_map);
 static LIST_HEAD(cap_list);
@@ -336,7 +339,7 @@ int gb_cap_connection_init(struct gb_connection *connection)
 		goto err_remove_ida;
 
 	/* Add a soft link to the previously added char-dev within the bundle */
-	cap->class_device = device_create(cap_class, cap->parent, cap->dev_num,
+	cap->class_device = device_create(&cap_class, cap->parent, cap->dev_num,
 					  NULL, "gb-authenticate-%d", minor);
 	if (IS_ERR(cap->class_device)) {
 		ret = PTR_ERR(cap->class_device);
@@ -370,7 +373,7 @@ void gb_cap_connection_exit(struct gb_connection *connection)
 
 	cap = gb_connection_get_data(connection);
 
-	device_destroy(cap_class, cap->dev_num);
+	device_destroy(&cap_class, cap->dev_num);
 	cdev_del(&cap->cdev);
 	ida_simple_remove(&cap_minors_map, MINOR(cap->dev_num));
 
@@ -402,9 +405,9 @@ int cap_init(void)
 {
 	int ret;
 
-	cap_class = class_create("gb_authenticate");
-	if (IS_ERR(cap_class))
-		return PTR_ERR(cap_class);
+	ret = class_register(&cap_class);
+	if (ret)
+		return ret;
 
 	ret = alloc_chrdev_region(&cap_dev_num, 0, NUM_MINORS,
 				  "gb_authenticate");
@@ -414,13 +417,13 @@ int cap_init(void)
 	return 0;
 
 err_remove_class:
-	class_destroy(cap_class);
+	class_unregister(&cap_class);
 	return ret;
 }
 
 void cap_exit(void)
 {
 	unregister_chrdev_region(cap_dev_num, NUM_MINORS);
-	class_destroy(cap_class);
+	class_unregister(&cap_class);
 	ida_destroy(&cap_minors_map);
 }
-- 
2.42.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
