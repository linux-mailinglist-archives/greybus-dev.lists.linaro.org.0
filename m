Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8CBCF3BFF
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 14:19:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ACADE40153
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 13:19:35 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by lists.linaro.org (Postfix) with ESMTPS id 348953F836
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 10:45:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=163.com header.s=s110527 header.b=K2OnCHzh;
	spf=pass (lists.linaro.org: domain of holden_hsu@163.com designates 117.135.210.5 as permitted sender) smtp.mailfrom=holden_hsu@163.com;
	dmarc=pass (policy=none) header.from=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=8U
	j1pTPRPcsRgexAtK4ViFtpiTuVh8bu+0hDS2e4um4=; b=K2OnCHzhZjRNITWT0D
	nAg+UA0nijDEW4Hw3lbvRAe1I6ku0CqTFUN7EZDE/IY1ABZda16tGBJNI4EVut++
	qtG/OOC9HxlJkUBQ9P3melMAys+TW76qVkMau4S9XDhR+usSqwtxvCwIBSju5Dgd
	PtUQE4LpNo36Ppwr37xG9RfeU=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnpxI1lltpOgk_EA--.3518S3;
	Mon, 05 Jan 2026 18:45:20 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  5 Jan 2026 02:45:04 -0800
Message-ID: <20260105104505.8120-2-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260105104505.8120-1-holden_hsu@163.com>
References: <20260105104505.8120-1-holden_hsu@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wBnpxI1lltpOgk_EA--.3518S3
X-Coremail-Antispam: 1Uf129KBjvdXoWrtFWxGrW3CFyDuFWfZryrJFb_yoWftFg_Xw
	s2kw4xtr1rA3s29w12yF43CrySvws7Ww4vv3y8tr9Iy34Fk39rJFyDuryUXFnrW3y7KFy3
	AanrKr1ayr13ZjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU11xRJUUUUU==
X-Originating-IP: [2409:8702:244c:230::99]
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC3wHmuGlblkFLKgAA3E
X-Rspamd-Queue-Id: 348953F836
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:117.135.210.0/27:c];
	R_DKIM_ALLOW(-0.20)[163.com:s=s110527];
	MIME_GOOD(-0.10)[text/plain];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	HAS_XOIP(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[163.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,163.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[117.135.210.5:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[163.com:dkim];
	DNSWL_BLOCKED(0.00)[117.135.210.5:from];
	ASN(0.00)[asn:138407, ipnet:117.135.210.0/24, country:CN];
	DKIM_TRACE(0.00)[163.com:+];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_ENVFROM(0.00)[163.com];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: holden_hsu@163.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: USUL767Y3WVXKIV54BW5YEQX5JCEOKZQ
X-Message-ID-Hash: USUL767Y3WVXKIV54BW5YEQX5JCEOKZQ
X-Mailman-Approved-At: Mon, 05 Jan 2026 13:19:16 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Holden Hsu <holden_hsu@163.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: arche-platform: clarify TODO comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/USUL767Y3WVXKIV54BW5YEQX5JCEOKZQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The TODO comment 'sequence ??' is unclear and provides little context
about what needs to be implemented. Replace it with 'TODO: define shutdown
sequence' to better describe the required implementation.

Signed-off-by: Holden Hsu <holden_hsu@163.com>
---
 drivers/staging/greybus/arche-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index 8aaff4e45..de38cd4b3 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -572,7 +572,7 @@ static __maybe_unused int arche_platform_suspend(struct device *dev)
 	 * If timing profile premits, we may shutdown bridge
 	 * completely
 	 *
-	 * TODO: sequence ??
+	 * TODO: define shutdown sequence
 	 *
 	 * Also, need to make sure we meet precondition for unipro suspend
 	 * Precondition: Definition ???
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
