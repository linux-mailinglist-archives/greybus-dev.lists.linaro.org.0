Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 861F97BED9B
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Oct 2023 23:53:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 339093EAAE
	for <lists+greybus-dev@lfdr.de>; Mon,  9 Oct 2023 21:53:11 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 6F62C3EAAE
	for <greybus-dev@lists.linaro.org>; Mon,  9 Oct 2023 21:53:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=IyYdAZ9E;
	spf=pass (lists.linaro.org: domain of gustavoars@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=gustavoars@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EE556613DC;
	Mon,  9 Oct 2023 21:53:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBB9C433C7;
	Mon,  9 Oct 2023 21:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696888383;
	bh=W+VZfakyDjRAObO1dDQmRahEdfhe6IqKNZRo1tRwkuk=;
	h=Date:From:To:Cc:Subject:From;
	b=IyYdAZ9EdWVH9jfcqTIBghy4+Muh2EwEWNScrz4b6/aGOUsd4mtqMfoBGTvK0lO6c
	 onA3n0Ti125FvNmSQK8G0nHnkQuQfLHPIw94GdKqymW9RjYlnO5rr8K59gXix6rYDv
	 K+smp/Ptnv2nHzZokKGH0fagbuF1UXumVrzSuy0S+2dpj6k0oYedewNK8JDJCA4UBh
	 2kaFeZIXRSskXp46DKazFRFkJSWh0LQUEl4WA4ZKmoYOfpOlfrz6Q1kGaCyWSDkKHV
	 R+pJO6bQVK5kh2aPVWX0fFUVo6ErAoyTDyV3dCkv9qD4GYbDHRsqsj4TsHtEtYQEZn
	 AaCet59ZGYm5w==
Date: Mon, 9 Oct 2023 15:52:59 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ZSR2O6zGyT/VX6ve@work>
MIME-Version: 1.0
Content-Disposition: inline
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:dfw.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6F62C3EAAE
Message-ID-Hash: 7KHVYETHIHJSTUEBDSWOJ6CQNVFIBQYB
X-Message-ID-Hash: 7KHVYETHIHJSTUEBDSWOJ6CQNVFIBQYB
X-MailFrom: gustavoars@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH][next] staging: greybus: Add __counted_by for struct apr_rx_buf and use struct_size()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7KHVYETHIHJSTUEBDSWOJ6CQNVFIBQYB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Prepare for the coming implementation by GCC and Clang of the __counted_by
attribute. Flexible array members annotated with __counted_by can have
their accesses bounds-checked at run-time via CONFIG_UBSAN_BOUNDS (for
array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
functions).

While there, use struct_size() helper, instead of the open-coded
version, to calculate the size for the allocation of the whole
flexible structure, including of course, the flexible-array member.

This code was found with the help of Coccinelle, and audited and
fixed manually.

Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/staging/greybus/raw.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index a00978c8e1d2..b9c6eff7cdc1 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -29,7 +29,7 @@ struct gb_raw {
 struct raw_data {
 	struct list_head entry;
 	u32 len;
-	u8 data[];
+	u8 data[] __counted_by(len);
 };
 
 static const struct class raw_class = {
@@ -73,7 +73,7 @@ static int receive_data(struct gb_raw *raw, u32 len, u8 *data)
 		goto exit;
 	}
 
-	raw_data = kmalloc(sizeof(*raw_data) + len, GFP_KERNEL);
+	raw_data = kmalloc(struct_size(raw_data, data, len), GFP_KERNEL);
 	if (!raw_data) {
 		retval = -ENOMEM;
 		goto exit;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
