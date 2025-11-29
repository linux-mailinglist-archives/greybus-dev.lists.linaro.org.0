Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 46074C93FE7
	for <lists+greybus-dev@lfdr.de>; Sat, 29 Nov 2025 15:34:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 094753F8E8
	for <lists+greybus-dev@lfdr.de>; Sat, 29 Nov 2025 14:34:27 +0000 (UTC)
Received: from mail-43199.protonmail.ch (mail-4399.protonmail.ch [185.70.43.99])
	by lists.linaro.org (Postfix) with ESMTPS id A5AFF3F832
	for <greybus-dev@lists.linaro.org>; Sat, 29 Nov 2025 10:44:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=parkour.is header.s=protonmail header.b=AIxS6UFw;
	spf=pass (lists.linaro.org: domain of sammy@parkour.is designates 185.70.43.99 as permitted sender) smtp.mailfrom=sammy@parkour.is;
	dmarc=pass (policy=quarantine) header.from=parkour.is
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parkour.is;
	s=protonmail; t=1764413082; x=1764672282;
	bh=GSU4ft/LQAGSvukPJTYavgxlOykLmAtTuNUWK0X3J+s=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=AIxS6UFwQE+8OqgZhJSuRbtILpYPbCCo0EEcLCLUJuF105xsA5ZmVxXXa30dHFt7z
	 sSfKnfvX9ygWkoTNSgyHeOvPtRu+/PrlH72mUNsYrSQPTXI4HBI91XK1Tvzvg5soPK
	 Kl3zLsn6bVO7l/QcQWPGK7uTzQupCk6aPfyfkCF3922JiuCxUNM7Fh3TbyIlZoW8IS
	 JmAJ2o4YkDuaxnB2Ou2Er1314COspsA8TXP0Frzs9J2ZUtQuUFL7eBJwzYggMkcn1x
	 U7BQfHJN1H2Ro6OFoWHICoYotjCmPh2syfeducVtPifIgMKDV2mo8WyWa7jjJNCMI8
	 mYF6nJYpvLmFQ==
Date: Sat, 29 Nov 2025 10:44:36 +0000
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
From: Sammy Malik <sammy@parkour.is>
Message-ID: <20251129104407.145907-1-sammy@parkour.is>
Feedback-ID: 169234940:user:proton
X-Pm-Message-ID: dd4d3330df85c4dbdd1af97df2be76da5a658154
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.70 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	HFILTER_HELO_IP_A(1.00)[mail-43199.protonmail.ch];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[parkour.is,quarantine];
	HFILTER_HELO_NORES_A_OR_MX(0.30)[mail-43199.protonmail.ch];
	R_DKIM_ALLOW(-0.20)[parkour.is:s=protonmail];
	R_SPF_ALLOW(-0.20)[+ip4:185.70.43.0/24];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:62371, ipnet:185.70.43.0/24, country:CH];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	BLOCKLISTDE_FAIL(0.00)[185.70.43.99:server fail];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[parkour.is:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A5AFF3F832
X-Spamd-Bar: -
X-MailFrom: sammy@parkour.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FJFYQZCQ22YTF3VNYS3DQFWGXOODXDXI
X-Message-ID-Hash: FJFYQZCQ22YTF3VNYS3DQFWGXOODXDXI
X-Mailman-Approved-At: Sat, 29 Nov 2025 14:34:20 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Remove completed PWN TODO item.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FJFYQZCQ22YTF3VNYS3DQFWGXOODXDXI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pwm.c driver already uses pwn_ops::apply. This item was completed
but never removed.

Removed the outdated TODO item.

Signed-off-by: Sammy Malik <sammy@parkour.is>
---
 drivers/staging/greybus/TODO | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/TODO b/drivers/staging/greybus/TODO
index 6461e0132fe3..31f1f2cb401c 100644
--- a/drivers/staging/greybus/TODO
+++ b/drivers/staging/greybus/TODO
@@ -1,5 +1,3 @@
 * Convert all uses of the old GPIO API from <linux/gpio.h> to the
   GPIO descriptor API in <linux/gpio/consumer.h> and look up GPIO
   lines from device tree or ACPI.
-* Make pwm.c use the struct pwm_ops::apply instead of ::config, ::set_polarity,
-  ::enable and ::disable.
-- 
2.52.0


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
