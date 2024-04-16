Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C87E68A776B
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Apr 2024 00:02:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1E294425A
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Apr 2024 22:02:23 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by lists.linaro.org (Postfix) with ESMTP id 9BD553F35A
	for <greybus-dev@lists.linaro.org>; Tue, 16 Apr 2024 08:03:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=163.com header.s=s110527 header.b=MyBil7y6;
	dmarc=pass (policy=none) header.from=163.com;
	spf=pass (lists.linaro.org: domain of congei42@163.com designates 220.197.31.2 as permitted sender) smtp.mailfrom=congei42@163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=YtBq8
	yEZv097YxmGZO1uAqajLtUZ0qspENxuvlWUMkc=; b=MyBil7y69RfEJOQK3poij
	wtEPInopyvPyO8Boov1c831gSKz9YmwGkmmBpShXwENKg5C/31BczWlB9lGnGelL
	Go7awvruOkWKqw7AmI++8bGNQmJinP2BuR2lqRosiUEc+xTiySsbG1kyaRoHjpLA
	X7lkaGZXEo/jKAu1IoHPl4=
Received: from flipped.. (unknown [159.226.94.118])
	by gzga-smtp-mta-g2-3 (Coremail) with SMTP id _____wD3Xx_DMB5m5JBDBQ--.33062S2;
	Tue, 16 Apr 2024 16:03:16 +0800 (CST)
From: Sicong Huang <congei42@163.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Tue, 16 Apr 2024 16:03:13 +0800
Message-Id: <20240416080313.92306-1-congei42@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3Xx_DMB5m5JBDBQ--.33062S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxJr1rtFWDuw1UXFy3WFWxZwb_yoW8GFW3pr
	WrGrWUGw4DJFs8tws8KF1UXFZYgw17KryakFWxCw4xGr98Ary3Zrn0yFZrAFZ3Cw1rJr17
	Zr4UZ3sYvas8X3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Ul-erUUUUU=
X-Originating-IP: [159.226.94.118]
X-CM-SenderInfo: 5frqwvrlusqiywtou0bp/1tbivgbC8mV4Ir559gAAsG
X-Rspamd-Queue-Id: 9BD553F35A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.40 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:220.197.31.0/27];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	RCVD_NO_TLS_LAST(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:4837, ipnet:220.197.0.0/17, country:CN];
	FREEMAIL_FROM(0.00)[163.com];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVFROM(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_XOIP(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,vger.kernel.org,163.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[163.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: congei42@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SSZF62HEYK36CVIQIBKJQ2IFUCTKOFDA
X-Message-ID-Hash: SSZF62HEYK36CVIQIBKJQ2IFUCTKOFDA
X-Mailman-Approved-At: Tue, 16 Apr 2024 22:02:12 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Sicong Huang <congei42@163.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v1] greybus: Fix use-after-free bug in gb_interface_release due to race condition.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SSZF62HEYK36CVIQIBKJQ2IFUCTKOFDA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In gb_interface_create, &intf->mode_switch_completion is bound with
gb_interface_mode_switch_work. Then it will be started by
gb_interface_request_mode_switch. Here is the relevant code.
if (!queue_work(system_long_wq, &intf->mode_switch_work)) {
	...
}

If we call gb_interface_release to make cleanup, there may be an
unfinished work. This function will call kfree to free the object
"intf". However, if gb_interface_mode_switch_work is scheduled to
run after kfree, it may cause use-after-free error as
gb_interface_mode_switch_work will use the object "intf".
The possible execution flow that may lead to the issue is as follows:

CPU0                            CPU1

                            |   gb_interface_create
                            |   gb_interface_request_mode_switch
gb_interface_release        |
kfree(intf) (free)          |
                            |   gb_interface_mode_switch_work
                            |   mutex_lock(&intf->mutex) (use)

Fix it by canceling the work before kfree.

Signed-off-by: Sicong Huang <congei42@163.com>
---
 drivers/greybus/interface.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
index fd58a86b0888..d022bfb5e95d 100644
--- a/drivers/greybus/interface.c
+++ b/drivers/greybus/interface.c
@@ -693,6 +693,7 @@ static void gb_interface_release(struct device *dev)
 
 	trace_gb_interface_release(intf);
 
+	cancel_work_sync(&intf->mode_switch_work);
 	kfree(intf);
 }
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
