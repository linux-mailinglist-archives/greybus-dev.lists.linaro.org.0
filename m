Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AEA2890123
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Mar 2024 15:07:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6283C4437C
	for <lists+greybus-dev@lfdr.de>; Thu, 28 Mar 2024 14:07:14 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 0DFD83F359
	for <greybus-dev@lists.linaro.org>; Thu, 28 Mar 2024 14:07:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bIwgWdpl;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of arnd@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=arnd@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B028461790;
	Thu, 28 Mar 2024 14:07:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6929CC433C7;
	Thu, 28 Mar 2024 14:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711634831;
	bh=jCpFq1/rgN+7LjvFqEP/87Ucf4QQthKAvwD+RuobdII=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bIwgWdplCpwDNWYw4e1shf3eU4qoI/uvcSnjDOLeb+kQweNsamyY7YOT+JBBCmRzw
	 HezFO0Fb4Y5P33syW0JRJSrC5h9C5oTkH5rBI1MZ+P561FPcxmEayw1Bi9tveYzytC
	 pRKupfZbCAkQqUPaLBSSlJg6gVN1Fm4xeRNXMsgcNi9/x9CeOaHUG81Y4rCvtSwelR
	 asCNEsRlXnLfHoC3uwy5v9/I5NwerDic/0Q15M2P1Idowq4iZaa4rw4QpgdLTpmQ/0
	 LRp05PnaEx41QBFzVv1Zw+bK9LK24zwEz5PV77deYh3nlSY03oT0Z/yE0v+NQV0HVu
	 E3qh9p9plPG5A==
From: Arnd Bergmann <arnd@kernel.org>
To: linux-kernel@vger.kernel.org,
	Viresh Kumar <vireshk@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 28 Mar 2024 15:04:54 +0100
Message-Id: <20240328140512.4148825-11-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240328140512.4148825-1-arnd@kernel.org>
References: <20240328140512.4148825-1-arnd@kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0DFD83F359
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[arndb.de,wanadoo.fr,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 4CDOZRWOG5CXJ3JYOW6CFPLFY7EDYAJ4
X-Message-ID-Hash: 4CDOZRWOG5CXJ3JYOW6CFPLFY7EDYAJ4
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@arndb.de>, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 10/11] staging: greybus: change strncpy() to strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4CDOZRWOG5CXJ3JYOW6CFPLFY7EDYAJ4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Arnd Bergmann <arnd@arndb.de>

gcc-10 warns about a strncpy() that does not enforce zero-termination:

In file included from include/linux/string.h:369,
                 from drivers/staging/greybus/fw-management.c:9:
In function 'strncpy',
    inlined from 'fw_mgmt_backend_fw_update_operation' at drivers/staging/greybus/fw-management.c:306:2:
include/linux/fortify-string.h:108:30: error: '__builtin_strncpy' specified bound 10 equals destination size [-Werror=stringop-truncation]
  108 | #define __underlying_strncpy __builtin_strncpy
      |                              ^
include/linux/fortify-string.h:187:9: note: in expansion of macro '__underlying_strncpy'
  187 |  return __underlying_strncpy(p, q, size);
      |         ^~~~~~~~~~~~~~~~~~~~

For some reason, I cannot reproduce this with gcc-9 or gcc-11, so I'm not
sure what's going on. Changing it to strspy() avoids the warning. In this
case the existing check for zero-termination would fail but can be replaced
with an error check.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
This is from randconfig testing with random gcc versions, a .config to
reproduce is at https://pastebin.com/r13yezkU
---
 drivers/staging/greybus/fw-management.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 3054f084d777..35bfdd5f32d2 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -303,13 +303,13 @@ static int fw_mgmt_backend_fw_update_operation(struct fw_mgmt *fw_mgmt,
 	struct gb_fw_mgmt_backend_fw_update_request request;
 	int ret;
 
-	strncpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
+	ret = strscpy(request.firmware_tag, tag, GB_FIRMWARE_TAG_MAX_SIZE);
 
 	/*
 	 * The firmware-tag should be NULL terminated, otherwise throw error and
 	 * fail.
 	 */
-	if (request.firmware_tag[GB_FIRMWARE_TAG_MAX_SIZE - 1] != '\0') {
+	if (ret == -E2BIG) {
 		dev_err(fw_mgmt->parent, "backend-update: firmware-tag is not NULL terminated\n");
 		return -EINVAL;
 	}
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
