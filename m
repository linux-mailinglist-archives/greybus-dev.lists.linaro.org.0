Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C8A96A0B0
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 16:31:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CEBC4463F
	for <lists+greybus-dev@lfdr.de>; Tue,  3 Sep 2024 14:31:53 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
	by lists.linaro.org (Postfix) with ESMTPS id 0C8F13F3C2
	for <greybus-dev@lists.linaro.org>; Tue,  3 Sep 2024 14:31:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of lizetao1@huawei.com designates 45.249.212.190 as permitted sender) smtp.mailfrom=lizetao1@huawei.com;
	dmarc=pass (policy=quarantine) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Wyp323V3Kz2Cp7q;
	Tue,  3 Sep 2024 22:31:26 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
	by mail.maildlp.com (Postfix) with ESMTPS id B7A041A016C;
	Tue,  3 Sep 2024 22:31:45 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Tue, 3 Sep
 2024 22:31:45 +0800
From: Li Zetao <lizetao1@huawei.com>
To: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Tue, 3 Sep 2024 22:40:19 +0800
Message-ID: <20240903144019.2005320-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Rspamd-Action: no action
X-Spamd-Bar: --
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0C8F13F3C2
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_VERYGOOD(-0.20)[45.249.212.190:from];
	R_SPF_ALLOW(-0.20)[+ip4:45.249.212.187/29];
	MIME_GOOD(-0.10)[text/plain];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TO_DN_NONE(0.00)[];
	ASN(0.00)[asn:134543, ipnet:45.249.212.0/24, country:CN];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	R_DKIM_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	HAS_XOIP(0.00)[];
	NEURAL_HAM(-0.00)[-0.966]
Message-ID-Hash: LDBH6V7P3SBVC3XUXFK43QUDHFOI76VQ
X-Message-ID-Hash: LDBH6V7P3SBVC3XUXFK43QUDHFOI76VQ
X-MailFrom: lizetao1@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: lizetao1@huawei.com, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH -next] greybus: Remove redundant null pointer checks in gb_svc_pwrmon_debugfs_init()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LDBH6V7P3SBVC3XUXFK43QUDHFOI76VQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Since the debugfs_create_dir() never returns a null pointer, checking
the return value for a null pointer is redundant, and using IS_ERR is
safe enough.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 drivers/greybus/svc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/greybus/svc.c b/drivers/greybus/svc.c
index 4256467fcd35..906ea61cba30 100644
--- a/drivers/greybus/svc.c
+++ b/drivers/greybus/svc.c
@@ -765,7 +765,7 @@ static void gb_svc_pwrmon_debugfs_init(struct gb_svc *svc)
 	u8 rail_count;
 
 	dent = debugfs_create_dir("pwrmon", svc->debugfs_dentry);
-	if (IS_ERR_OR_NULL(dent))
+	if (IS_ERR(dent))
 		return;
 
 	if (gb_svc_pwrmon_rail_count_get(svc, &rail_count))
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
