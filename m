Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4645315D4
	for <lists+greybus-dev@lfdr.de>; Mon, 23 May 2022 21:52:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 756A13F4B6
	for <lists+greybus-dev@lfdr.de>; Mon, 23 May 2022 19:52:01 +0000 (UTC)
Received: from mail.wantyapps.xyz (unknown [66.135.5.160])
	by lists.linaro.org (Postfix) with ESMTPS id 871413EC44
	for <greybus-dev@lists.linaro.org>; Mon, 23 May 2022 18:22:37 +0000 (UTC)
Received: from localhost (bzq-79-178-31-184.red.bezeqint.net [79.178.31.184])
	by mail.wantyapps.xyz (Postfix) with ESMTPSA id 952A87D6DD;
	Mon, 23 May 2022 18:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=wantyapps.xyz;
	s=mail; t=1653330157;
	bh=mYRY9mnO7zMIt2NucJujebHW7Y5Gx8FBoKuT5hw5hFo=;
	h=From:To:Cc:Subject:Date:From;
	b=APOOvHCauvJBy9I3Fpf8u195Q5bLcrg+lRD0PFYZ0Z+hD42xn70/sGsRyLjdpDpN6
	 3dQt97J4OxnpbtMWoFxeHCWUgGECycIuvzISl8fsO0Ri3myDLhmvPDYqHYkv5YY2UK
	 xd9LFljGyOejfpqfhUa9TTYDDBO4/mO2GiCEU5H46xJJQ5SH+x4khkuzIr8maLv0Yn
	 Of+CV+8EERbtQjwx/+1cMjvW/ORRgGAtsk7n7uDwRTzryMi5/tQqmr1TvKWobybNPR
	 hnlEW5SUeD0r3/pH4fiUX7kyQmF9klesEBEk7lE9RxQL2lCyEKFMGLhUGCIysdu5aU
	 Kzvt4eHcKpS+A==
From: Uri Arev <me@wantyapps.xyz>
To: 
Date: Mon, 23 May 2022 21:22:26 +0300
Message-Id: <20220523182226.405159-1-me@wantyapps.xyz>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-MailFrom: me@wantyapps.xyz
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7IWML3BF5UEH2XKHOTWV4CPJONDIXMZR
X-Message-ID-Hash: 7IWML3BF5UEH2XKHOTWV4CPJONDIXMZR
X-Mailman-Approved-At: Mon, 23 May 2022 19:51:59 +0000
CC: Uri Arev <me@wantyapps.xyz>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: Fix indentation in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7IWML3BF5UEH2XKHOTWV4CPJONDIXMZR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Reported by Checkpatch:
CHECK: Alignment should match open parenthesis

Signed-off-by: Uri Arev <me@wantyapps.xyz>
---
v2: More understandable title, add Signed-off-by line
v3: Remove my name signature from the patch description

 drivers/staging/greybus/fw-management.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 687c6405c65b..3342b84597da 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -102,7 +102,7 @@ static struct fw_mgmt *get_fw_mgmt(struct cdev *cdev)
 }
 
 static int fw_mgmt_interface_fw_version_operation(struct fw_mgmt *fw_mgmt,
-		struct fw_mgmt_ioc_get_intf_version *fw_info)
+						  struct fw_mgmt_ioc_get_intf_version *fw_info)
 {
 	struct gb_connection *connection = fw_mgmt->connection;
 	struct gb_fw_mgmt_interface_fw_version_response response;
@@ -240,7 +240,7 @@ static int fw_mgmt_interface_fw_loaded_operation(struct gb_operation *op)
 }
 
 static int fw_mgmt_backend_fw_version_operation(struct fw_mgmt *fw_mgmt,
-		struct fw_mgmt_ioc_get_backend_version *fw_info)
+						struct fw_mgmt_ioc_get_backend_version *fw_info)
 {
 	struct gb_connection *connection = fw_mgmt->connection;
 	struct gb_fw_mgmt_backend_fw_version_request request;
@@ -473,7 +473,7 @@ static int fw_mgmt_ioctl(struct fw_mgmt *fw_mgmt, unsigned int cmd,
 			return -EFAULT;
 
 		ret = fw_mgmt_backend_fw_update_operation(fw_mgmt,
-				backend_update.firmware_tag);
+							  backend_update.firmware_tag);
 		if (ret)
 			return ret;
 
-- 
2.36.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
