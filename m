Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CD18EC31068
	for <lists+greybus-dev@lfdr.de>; Tue, 04 Nov 2025 13:40:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6FDB3F826
	for <lists+greybus-dev@lfdr.de>; Tue,  4 Nov 2025 12:40:27 +0000 (UTC)
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	by lists.linaro.org (Postfix) with ESMTPS id 71ACF3F857
	for <greybus-dev@lists.linaro.org>; Tue,  4 Nov 2025 09:09:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	dmarc=none;
	spf=pass (lists.linaro.org: domain of vulab@iscas.ac.cn designates 159.226.251.21 as permitted sender) smtp.mailfrom=vulab@iscas.ac.cn
Received: from DESKTOP-L0HPE2S (unknown [124.16.141.245])
	by APP-01 (Coremail) with SMTP id qwCowAA3oWurwglpVfBcAQ--.499S2;
	Tue, 04 Nov 2025 17:09:00 +0800 (CST)
From: Haotian Zhang <vulab@iscas.ac.cn>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue,  4 Nov 2025 17:08:25 +0800
Message-ID: <20251104090825.224-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1.windows.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowAA3oWurwglpVfBcAQ--.499S2
X-Coremail-Antispam: 1UD129KBjvdXoWrKw1rAF4xJF1DXry3WFy5twb_yoWkZFcEq3
	92gw4xCr4rAr1vk3WjyF13WryIvFn0vrZYqFWjqrsxt34rJFsxWr47uw15CFy7XrW2kFyv
	ywnrWr1akw13GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r12
	6r1DMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	WUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjJ73PUUUU
	U==
X-Originating-IP: [124.16.141.245]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwsQA2kJiS3hHAAAsm
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 71ACF3F857
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	ONCE_RECEIVED(0.20)[];
	R_SPF_ALLOW(-0.20)[+ip4:159.226.251.0/25];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:7497, ipnet:159.226.0.0/16, country:CN];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	R_DKIM_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	HAS_XOIP(0.00)[];
	URIBL_BLOCKED(0.00)[cstnet.cn:helo];
	DMARC_NA(0.00)[iscas.ac.cn];
	NEURAL_HAM(-0.00)[-0.999]
X-Rspamd-Action: no action
X-MailFrom: vulab@iscas.ac.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FT4FL6XKHDVNU3UXO2KOJFQJ3V45H7TD
X-Message-ID-Hash: FT4FL6XKHDVNU3UXO2KOJFQJ3V45H7TD
X-Mailman-Approved-At: Tue, 04 Nov 2025 12:40:24 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Haotian Zhang <vulab@iscas.ac.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: arche-platform: fix pm_notifier leak in probe error path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FT4FL6XKHDVNU3UXO2KOJFQJ3V45H7TD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In arche_platform_probe(), if arche_platform_coldboot_seq() fails after
register_pm_notifier() succeeds, the function returns without unregistering
the pm_notifier, leading to a resource leak.

Add unregister_pm_notifier() call in the err_coldboot error path to
properly clean up the registered notifier on failure.

Fixes: d29b67d44a7c ("greybus: arche-platform: Add support for init-off feature")
Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
---
 drivers/staging/greybus/arche-platform.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index d48464390f58..9c5bb5dae187 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -545,6 +545,7 @@ static int arche_platform_probe(struct platform_device *pdev)
 	return 0;
 
 err_coldboot:
+	unregister_pm_notifier(&arche_pdata->pm_notifier);
 	mutex_unlock(&arche_pdata->platform_state_mutex);
 err_device_remove:
 	device_remove_file(&pdev->dev, &dev_attr_state);
-- 
2.50.1.windows.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
