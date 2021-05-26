Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ADCBF390E08
	for <lists+greybus-dev@lfdr.de>; Wed, 26 May 2021 03:51:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5F7F6144B
	for <lists+greybus-dev@lfdr.de>; Wed, 26 May 2021 01:51:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 84A8A61440; Wed, 26 May 2021 01:51:11 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4AFD661151;
	Wed, 26 May 2021 01:51:09 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3C6EF60B4F
 for <greybus-dev@lists.linaro.org>; Wed, 26 May 2021 01:51:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2F7D660FF8; Wed, 26 May 2021 01:51:08 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by lists.linaro.org (Postfix) with ESMTPS id E086F60B4F
 for <greybus-dev@lists.linaro.org>; Wed, 26 May 2021 01:51:05 +0000 (UTC)
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FqYjV1h05zpfXS;
 Wed, 26 May 2021 09:47:26 +0800 (CST)
Received: from dggeme759-chm.china.huawei.com (10.3.19.105) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 09:51:02 +0800
Received: from localhost.localdomain (10.69.192.56) by
 dggeme759-chm.china.huawei.com (10.3.19.105) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 09:51:02 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Wed, 26 May 2021 09:50:55 +0800
Message-ID: <1621993855-64142-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggeme759-chm.china.huawei.com (10.3.19.105)
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH] greybus: use pm_runtime_resume_and_get() to
 replace open coding
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: greybus-dev@lists.linaro.org, Tian Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

use pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. this change is just to simplify the code, no
actual functional changes.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/greybus/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index e546c64..434aa5d 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -174,11 +174,9 @@ static int greybus_probe(struct device *dev)
 	if (!id)
 		return -ENODEV;
 
-	retval = pm_runtime_get_sync(&bundle->intf->dev);
-	if (retval < 0) {
-		pm_runtime_put_noidle(&bundle->intf->dev);
+	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
+	if (retval < 0)
 		return retval;
-	}
 
 	retval = gb_control_bundle_activate(bundle->intf->control, bundle->id);
 	if (retval) {
-- 
2.7.4

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
