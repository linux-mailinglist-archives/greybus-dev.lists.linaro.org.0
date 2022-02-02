Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 931FE4A7008
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 12:36:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B34E43EE5F
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 11:36:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id A80F03EE07
	for <greybus-dev@lists.linaro.org>; Wed,  2 Feb 2022 11:36:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4C83C616B4;
	Wed,  2 Feb 2022 11:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC3C4C340EF;
	Wed,  2 Feb 2022 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643801767;
	bh=a1ae4CRR715CYUBaMy5Wvq7XIcUVZv3r/LRlFqiLhcU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ACAYFu7lMBxzuwbdfNTStL40XCbFtT6GoVWnv4CP3EgQ/iOz+K6wOcHkZfBm4jv4W
	 8+OYs7ENFOzdKOVFFenKyHPBfotEK0CvcdAWhyJTUZUY3j+czBWz1T/wuIik2zCqAW
	 4GP37+mFhknWkybJEpIzfN11Jthh7wPR3RKWTebgsO+/IvpJO1cOkbdLMBTuozK45u
	 pIlUpoqhbpD4X+r821bKC12WD9M/GJ+/j0iyqsHzmsVxy0uUYnzqlTztRoxkWyC2+1
	 O4Ylgk2bLhogace9pchPCSNE0w754rhmj74YrLYRFbIT4hu2tLqQAnEPZgADgp4/3G
	 SctclROqzLPWQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nFDvT-0000Lx-8Z; Wed, 02 Feb 2022 12:35:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  2 Feb 2022 12:33:45 +0100
Message-Id: <20220202113347.1288-2-johan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202113347.1288-1-johan@kernel.org>
References: <20220202113347.1288-1-johan@kernel.org>
MIME-Version: 1.0
Message-ID-Hash: 7XOFVCTBHUWORJZI5ZP6KH3XUN466RT4
X-Message-ID-Hash: 7XOFVCTBHUWORJZI5ZP6KH3XUN466RT4
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/3] greybus: svc: fix an error handling bug in gb_svc_hello()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7XOFVCTBHUWORJZI5ZP6KH3XUN466RT4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Dan Carpenter <dan.carpenter@oracle.com>

Cleanup if gb_svc_queue_deferred_request() fails.

Fixes: ee2f2074fdb2 ("greybus: svc: reconfig APBridgeA-Switch link to handle required load")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/r/20220202072016.GA6748@kili
Cc: stable@vger.kernel.org      # 4.9
[johan: fix commit summary prefix and rename label ]
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/greybus/svc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index ce7740ef449b..51d0875a3480 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -866,8 +866,14 @@ static int gb_svc_hello(struct gb_operation *op)
 
 	gb_svc_debugfs_init(svc);
 
-	return gb_svc_queue_deferred_request(op);
+	ret = gb_svc_queue_deferred_request(op);
+	if (ret)
+		goto err_remove_debugfs;
+
+	return 0;
 
+err_remove_debugfs:
+	gb_svc_debugfs_exit(svc);
 err_unregister_device:
 	gb_svc_watchdog_destroy(svc);
 	device_del(&svc->dev);
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
