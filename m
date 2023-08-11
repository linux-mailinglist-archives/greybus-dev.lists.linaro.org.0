Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 051CF7787DE
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Aug 2023 09:11:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA0CD3F08E
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Aug 2023 07:11:33 +0000 (UTC)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	by lists.linaro.org (Postfix) with ESMTPS id E6E6B3F08E
	for <greybus-dev@lists.linaro.org>; Fri, 11 Aug 2023 07:11:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of yangyingliang@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=yangyingliang@huawei.com;
	dmarc=pass (policy=quarantine) header.from=huawei.com
Received: from dggpemm500012.china.huawei.com (unknown [172.30.72.54])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4RMZcn1XLrztS7P;
	Fri, 11 Aug 2023 15:07:53 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500012.china.huawei.com (7.185.36.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Fri, 11 Aug 2023 15:11:24 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Fri, 11 Aug
 2023 15:11:23 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-staging@lists.linux.dev>, <greybus-dev@lists.linaro.org>
Date: Fri, 11 Aug 2023 15:08:26 +0800
Message-ID: <20230811070826.739049-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E6E6B3F08E
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.40 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[45.249.212.187:from];
	RCVD_IN_DNSWL_MED(-0.20)[45.249.212.187:from];
	R_SPF_ALLOW(-0.20)[+ip4:45.249.212.187/29];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,huawei.com];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:134543, ipnet:45.249.212.0/24, country:CN];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	FROM_HAS_DN(0.00)[];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_IN_DNSWL_FAIL(0.00)[7.185.36.183:server fail]
Message-ID-Hash: S3NI72CGQBV3VXVTY4TBBGNGSOCJZLYS
X-Message-ID-Hash: S3NI72CGQBV3VXVTY4TBBGNGSOCJZLYS
X-MailFrom: yangyingliang@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, yangyingliang@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH -next] staging: greybus: arche-apb-ctrl: remove unnecessary platform_set_drvdata()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/S3NI72CGQBV3VXVTY4TBBGNGSOCJZLYS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove unnecessary platform_set_drvdata(..., NULL) in ->remove(),
the driver_data will be cleared in device_unbind_cleanup() after
calling ->remove() in driver call code.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index 8541995008da..5c77c1813214 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -423,7 +423,6 @@ static void arche_apb_ctrl_remove(struct platform_device *pdev)
 {
 	device_remove_file(&pdev->dev, &dev_attr_state);
 	poweroff_seq(pdev);
-	platform_set_drvdata(pdev, NULL);
 }
 
 static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
