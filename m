Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6FA4A700A
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 12:36:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0CC703EE07
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 11:36:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id BE95A3EE07
	for <greybus-dev@lists.linaro.org>; Wed,  2 Feb 2022 11:36:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D96B4B83074;
	Wed,  2 Feb 2022 11:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6F07C004E1;
	Wed,  2 Feb 2022 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643801767;
	bh=UyZaJ0tB41ZV6qBFKK9qIgn5LBAmyc6MC+K+6DFNjjY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Db18p5vr4c8W40fy+RORFCyNFR8aqxfBfI6Vy+ODBeUx/blR7PxB1PJ/iCWUVxnMb
	 nxGC8BMUbjizY78IYE0jYgBs9+4BLCiwDSvBDdS6u2HikLWZeWflhd/DpPrvSAmoy8
	 Jy+Z9GTjuJs3bowDt9RVwduyGJvWIvrrOoi3q1ywlE7hhVYEkrQ8sKpepnQJIZQ7rC
	 3chnSUOFKc0juQIVvC6xOHzad8HVnhWGLdCErGjEfhzL5GH9yV7/YBjQoWYueKm5kn
	 DhuoXjj6abIUFADblDBtaJg4mjp+mTSKf5wkBZYd9Ir5WCZvYe6MBiLlXAxvev8bRL
	 JkpbnY/ZP4+JA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nFDvT-0000M1-EE; Wed, 02 Feb 2022 12:35:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  2 Feb 2022 12:33:47 +0100
Message-Id: <20220202113347.1288-4-johan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202113347.1288-1-johan@kernel.org>
References: <20220202113347.1288-1-johan@kernel.org>
MIME-Version: 1.0
Message-ID-Hash: TLYETPBL7NCRTRDTRPQXX3RXR7BJ62KI
X-Message-ID-Hash: TLYETPBL7NCRTRDTRPQXX3RXR7BJ62KI
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] greybus: svc: clean up link configuration hack at hello
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TLYETPBL7NCRTRDTRPQXX3RXR7BJ62KI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit ee2f2074fdb2 ("greybus: svc: reconfig APBridgeA-Switch link to
handle required load") added a temporary hack which reconfigures the
link at HELLO by abusing the deferred request processing mechanism.

Restructure the HELLO request processing so that the link-configuration
work is queued before creating the debugfs files and add a comment
explaining why it's there.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/greybus/svc.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 4f93d6b2f4ed..56d2b44d6fef 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -864,16 +864,19 @@ static int gb_svc_hello(struct gb_operation *op)
 		goto err_deregister_svc;
 	}
 
-	gb_svc_debugfs_init(svc);
-
+	/*
+	 * FIXME: This is a temporary hack to reconfigure the link at HELLO
+	 * (which abuses the deferred request processing mechanism).
+	 */
 	ret = gb_svc_queue_deferred_request(op);
 	if (ret)
-		goto err_remove_debugfs;
+		goto err_destroy_watchdog;
+
+	gb_svc_debugfs_init(svc);
 
 	return 0;
 
-err_remove_debugfs:
-	gb_svc_debugfs_exit(svc);
+err_destroy_watchdog:
 	gb_svc_watchdog_destroy(svc);
 err_deregister_svc:
 	device_del(&svc->dev);
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
