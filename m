Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B80CF3C02
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 14:19:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 018A940164
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 13:19:40 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by lists.linaro.org (Postfix) with ESMTPS id 2CD5D4014F
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 10:45:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=163.com header.s=s110527 header.b=FuNIvbmG;
	spf=pass (lists.linaro.org: domain of holden_hsu@163.com designates 220.197.31.2 as permitted sender) smtp.mailfrom=holden_hsu@163.com;
	dmarc=pass (policy=none) header.from=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=j9
	IYzl5Mgx7Z3V24w/mbu3ZTvXoRK6X9gdyX889/ptA=; b=FuNIvbmGQMAq7MvUzB
	UVmVbOwtQwDmLy+qbORO/o1IqTrdrSVDgeZxohKOY2VVQCliVoNpd3ogsjWsyG/W
	CJdww0UKvjo4FPjtLbPpLDTrn9sy4mmmp11b+9cSaDl1TbBdVUsgx2cssVBpa+qK
	vxv9QTeyIJQWPgjjBmAch9/Cs=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnpxI1lltpOgk_EA--.3518S4;
	Mon, 05 Jan 2026 18:45:24 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  5 Jan 2026 02:45:05 -0800
Message-ID: <20260105104505.8120-3-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105104505.8120-1-holden_hsu@163.com>
References: <20260105104505.8120-1-holden_hsu@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBnpxI1lltpOgk_EA--.3518S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFWktrWkJw43XFWrJFy7KFg_yoW3uwb_Z3
	ZFgr4xtrZ5Aw1vkw12yF43CryxXaykXFZYv348KrZxt3y5C39rJ3WDur1UZFyxW3y3KFyU
	A3ZrXr4akr13JjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8lD73UUUUU==
X-Originating-IP: [2409:8702:244c:230::99]
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC-AXnuWlblkXp-wAA3Q
X-Rspamd-Queue-Id: 2CD5D4014F
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:220.197.31.0/27:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,163.com];
	DKIM_TRACE(0.00)[163.com:+];
	HAS_XOIP(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[220.197.31.2:from];
	DWL_DNSWL_BLOCKED(0.00)[163.com:dkim];
	RWL_MAILSPIKE_POSSIBLE(0.00)[220.197.31.2:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_ONE(0.00)[1];
	ASN(0.00)[asn:4837, ipnet:220.197.0.0/17, country:CN];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: holden_hsu@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: WGOVVMJJ4LFGQMOUEH7JKEDFPCM44WK2
X-Message-ID-Hash: WGOVVMJJ4LFGQMOUEH7JKEDFPCM44WK2
X-Mailman-Approved-At: Mon, 05 Jan 2026 13:19:16 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Holden Hsu <holden_hsu@163.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] staging: greybus: arche-platform: fix spelling mistake in comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WGOVVMJJ4LFGQMOUEH7JKEDFPCM44WK2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix 'premits' -> 'permits' in a comment to improve code readability.

Signed-off-by: Holden Hsu <holden_hsu@163.com>
---
 drivers/staging/greybus/arche-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index de38cd4b3..f669a7e2e 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -569,7 +569,7 @@ static void arche_platform_remove(struct platform_device *pdev)
 static __maybe_unused int arche_platform_suspend(struct device *dev)
 {
 	/*
-	 * If timing profile premits, we may shutdown bridge
+	 * If timing profile permits, we may shutdown bridge
 	 * completely
 	 *
 	 * TODO: define shutdown sequence
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
