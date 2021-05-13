Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2656E3823DA
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 07:56:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3620761198
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 05:56:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C162461082; Mon, 17 May 2021 05:56:43 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2C98260AEC;
	Mon, 17 May 2021 05:56:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 43DA360AD3
 for <greybus-dev@lists.linaro.org>; Thu, 13 May 2021 08:32:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2920260B8B; Thu, 13 May 2021 08:32:45 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by lists.linaro.org (Postfix) with ESMTPS id D226060AD3
 for <greybus-dev@lists.linaro.org>; Thu, 13 May 2021 08:32:42 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FglGX0m76zlcB5;
 Thu, 13 May 2021 16:30:28 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Thu, 13 May 2021 16:32:31 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Thu, 13 May 2021 16:49:32 +0800
Message-ID: <1620895772-52538-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 17 May 2021 05:56:39 +0000
Subject: [greybus-dev] [PATCH -next] staging: greybus: audio: Add missing
 MODULE_DEVICE_TABLE
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
Cc: greybus-dev@lists.linaro.org, Zou Wei <zou_wei@huawei.com>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

This patch adds missing MODULE_DEVICE_TABLE definition which generates
correct modalias for automatic loading of this driver when it is built
as an external module.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/staging/greybus/audio_codec.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6..6fa9781 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1086,6 +1086,7 @@ static const struct of_device_id greybus_asoc_machine_of_match[]  = {
 	{ .compatible = "toshiba,apb-dummy-codec", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, greybus_asoc_machine_of_match);
 
 static struct platform_driver gbaudio_codec_driver = {
 	.driver = {
-- 
2.6.2

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
