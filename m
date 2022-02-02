Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 72FB54A700B
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 12:36:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A946B3EE5B
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Feb 2022 11:36:19 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 43A893EE07
	for <greybus-dev@lists.linaro.org>; Wed,  2 Feb 2022 11:36:10 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 6E061B83094;
	Wed,  2 Feb 2022 11:36:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE600C340F0;
	Wed,  2 Feb 2022 11:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643801767;
	bh=mQieYQKkKj2DTVG1ustfGTpy5JdAXgMiVkEJnFEOhjg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KuEkAgjgVmPST/TCrjUN16vOXGT6aWlRPrByc3G+5md6qNHgYmXqHcSqkyDcXR5Qa
	 xQcds3WB1XeFCe+oYNj+qlT4JRYIn4KTiKTREKUM6erVtbUAq8qpSDJmzUsybJudft
	 Z3L5/Z+QjSXSKLyrf1i1rOgCtgYFS/Pmpa/FBqh+JAfJqd7MVP/j/kwTspNSLnBLtx
	 Aexjz2tNeNxb3CWt1vRDqVSEYsCP/nNlPtb0ExHN36TfHgvtootACFlhb60sQFkFua
	 +aQ+NPZX0eLPuRm2Wc8wuF1BbPsVc5nMUO99AhF+Vn+2CsYejaWUX1oMJBwvDv7sBZ
	 v/PQebZAOYfvg==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nFDvT-0000Lz-BK; Wed, 02 Feb 2022 12:35:51 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  2 Feb 2022 12:33:46 +0100
Message-Id: <20220202113347.1288-3-johan@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220202113347.1288-1-johan@kernel.org>
References: <20220202113347.1288-1-johan@kernel.org>
MIME-Version: 1.0
Message-ID-Hash: PS25RCCPJDGJMIIBY745YGAPYP4E3P4B
X-Message-ID-Hash: PS25RCCPJDGJMIIBY745YGAPYP4E3P4B
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/3] greybus: svc: clean up hello error path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PS25RCCPJDGJMIIBY745YGAPYP4E3P4B/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

While currently safe, it is unnecessary (and confusing) to try to
destroy the watchdog when watchdog creation fails.

Change the corresponding error path to only deregister the svc.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/greybus/svc.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 51d0875a3480..4f93d6b2f4ed 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -861,7 +861,7 @@ static int gb_svc_hello(struct gb_operation *op)
 	ret = gb_svc_watchdog_create(svc);
 	if (ret) {
 		dev_err(&svc->dev, "failed to create watchdog: %d\n", ret);
-		goto err_unregister_device;
+		goto err_deregister_svc;
 	}
 
 	gb_svc_debugfs_init(svc);
@@ -874,9 +874,10 @@ static int gb_svc_hello(struct gb_operation *op)
 
 err_remove_debugfs:
 	gb_svc_debugfs_exit(svc);
-err_unregister_device:
 	gb_svc_watchdog_destroy(svc);
+err_deregister_svc:
 	device_del(&svc->dev);
+
 	return ret;
 }
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
