Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8750C780C04
	for <lists+greybus-dev@lfdr.de>; Fri, 18 Aug 2023 14:44:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 89DA13EE23
	for <lists+greybus-dev@lfdr.de>; Fri, 18 Aug 2023 12:44:19 +0000 (UTC)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	by lists.linaro.org (Postfix) with ESMTPS id C4B133EE23
	for <greybus-dev@lists.linaro.org>; Fri, 18 Aug 2023 12:44:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of yuehaibing@huawei.com designates 45.249.212.255 as permitted sender) smtp.mailfrom=yuehaibing@huawei.com;
	dmarc=pass (policy=quarantine) header.from=huawei.com
Received: from canpemm500007.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RS1jy1F9jz1GDS2;
	Fri, 18 Aug 2023 20:42:46 +0800 (CST)
Received: from localhost (10.174.179.215) by canpemm500007.china.huawei.com
 (7.192.104.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Fri, 18 Aug
 2023 20:44:08 +0800
From: Yue Haibing <yuehaibing@huawei.com>
To: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>,
	<yuehaibing@huawei.com>
Date: Fri, 18 Aug 2023 20:43:38 +0800
Message-ID: <20230818124338.37880-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.179.215]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500007.china.huawei.com (7.192.104.62)
X-CFilter-Loop: Reflected
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C4B133EE23
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[45.249.212.255:from];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:45.249.212.255];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:134543, ipnet:45.249.212.0/24, country:CN];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.950];
	HAS_XOIP(0.00)[];
	TO_DN_NONE(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[]
Message-ID-Hash: H3XJBDRUTK7KJ7SPFXWTW3AZA7EVCQ2W
X-Message-ID-Hash: H3XJBDRUTK7KJ7SPFXWTW3AZA7EVCQ2W
X-MailFrom: yuehaibing@huawei.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH -next] greybus: svc: Remove unused declarations
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H3XJBDRUTK7KJ7SPFXWTW3AZA7EVCQ2W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Commit 84427943d2da ("greybus: svc: drop legacy-protocol dependency")
removed these implementations but not the declarations.

Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
---
 include/linux/greybus/svc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/include/linux/greybus/svc.h b/include/linux/greybus/svc.h
index 5afaf5f06856..da547fb9071b 100644
--- a/include/linux/greybus/svc.h
+++ b/include/linux/greybus/svc.h
@@ -100,7 +100,4 @@ bool gb_svc_watchdog_enabled(struct gb_svc *svc);
 int gb_svc_watchdog_enable(struct gb_svc *svc);
 int gb_svc_watchdog_disable(struct gb_svc *svc);
 
-int gb_svc_protocol_init(void);
-void gb_svc_protocol_exit(void);
-
 #endif /* __SVC_H */
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
