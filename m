Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 39448CF3BFC
	for <lists+greybus-dev@lfdr.de>; Mon, 05 Jan 2026 14:19:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E80240154
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Jan 2026 13:19:31 +0000 (UTC)
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	by lists.linaro.org (Postfix) with ESMTPS id 2CA4D3F6E3
	for <greybus-dev@lists.linaro.org>; Mon,  5 Jan 2026 10:45:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=163.com header.s=s110527 header.b=Z3CLPyQg;
	spf=pass (lists.linaro.org: domain of holden_hsu@163.com designates 220.197.31.2 as permitted sender) smtp.mailfrom=holden_hsu@163.com;
	dmarc=pass (policy=none) header.from=163.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hM
	BIrglZLl2cr5F7X5Hu94a3U4hUWyo9xzTV6mqgXro=; b=Z3CLPyQgadFqHDbSkn
	cSEpMKgSvMWjPEmNBXsWmf98QmnVgX6W9mlG8r80hDqINhuNLUZUR0jXvNNN7NLE
	ivQOk1sIXcDFiFvYZOP8MUVaukVhEgqKzPT5HyKwlc7moPYqzGv5jYTtGfYrRmcE
	fKNHYqVdrzXJ7pRYTlcIz44zk=
Received: from outlook.com (unknown [])
	by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wBnpxI1lltpOgk_EA--.3518S2;
	Mon, 05 Jan 2026 18:45:16 +0800 (CST)
From: Holden Hsu <holden_hsu@163.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  5 Jan 2026 02:45:03 -0800
Message-ID: <20260105104505.8120-1-holden_hsu@163.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wBnpxI1lltpOgk_EA--.3518S2
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUUXdbDUUUU
X-Originating-IP: [2409:8702:244c:230::99]
X-CM-SenderInfo: xkrovv5qbk23i6rwjhhfrp/xtbC+xzlt2lbljznKQAA3j
X-Rspamd-Queue-Id: 2CA4D3F6E3
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[163.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:220.197.31.0/27];
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
Message-ID-Hash: 2RFCXQROPRG42IJCX67MYLDBHZXYPIZY
X-Message-ID-Hash: 2RFCXQROPRG42IJCX67MYLDBHZXYPIZY
X-Mailman-Approved-At: Mon, 05 Jan 2026 13:19:15 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Holden Hsu <holden_hsu@163.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] staging: greybus: arche-platform: minor cleanups
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2RFCXQROPRG42IJCX67MYLDBHZXYPIZY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Holden Hsu (2):
  staging: greybus: arche-platform: clarify TODO comment
  staging: greybus: arche-platform: fix spelling mistake in comment

 drivers/staging/greybus/arche-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
