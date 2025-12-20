Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FE2CD36CA
	for <lists+greybus-dev@lfdr.de>; Sat, 20 Dec 2025 21:44:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 925AC3F8FB
	for <lists+greybus-dev@lfdr.de>; Sat, 20 Dec 2025 20:44:54 +0000 (UTC)
Received: from mail-4396.protonmail.ch (mail-4396.protonmail.ch [185.70.43.96])
	by lists.linaro.org (Postfix) with ESMTPS id 1BC3C400F1
	for <greybus-dev@lists.linaro.org>; Sat, 20 Dec 2025 13:56:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=parkour.is header.s=protonmail header.b=BWzJh9xN;
	spf=pass (lists.linaro.org: domain of sammy@parkour.is designates 185.70.43.96 as permitted sender) smtp.mailfrom=sammy@parkour.is;
	dmarc=pass (policy=quarantine) header.from=parkour.is
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=parkour.is;
	s=protonmail; t=1766239013; x=1766498213;
	bh=nxDz1Vk+5ekSjMdlDr+dQjoEj6eaQ8Fx6OBPXnbcXbU=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=BWzJh9xNLzMHVaXZz997Ddf/OcRwmEB2+qxE5N7ziNwjh8SIqvYvtJWc7vfv0XL2N
	 MSx+eEFLXmcTZ/wbcg2QCAGKFzaoRcXtrWoH4hDG1F/aCuNKY7sCaRZfaTSsoc8s3N
	 8LPGa0vrsrc6OQtFIl+3iviNHzXWWmNe+dGq/k9cniBJKQPBKL4Vws8TfIgTOmJcy6
	 N12w20KnO5OcBIPyJg9eA0DE0r++aWmAsLuKd8QtKxf8hgzs1BLBZ4wVznVaR3cbAc
	 FcIPja1RgXXGyuA0lGgIFeewamf5yNveyXL8GUva+L9dYQ3qOkDUdMqyXmWDtmz7Ru
	 +IRagoUIY75pA==
Date: Sat, 20 Dec 2025 13:56:48 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
From: Sammy Malik <sammy@parkour.is>
Message-ID: <20251220135613.226912-1-sammy@parkour.is>
Feedback-ID: 169234940:user:proton
X-Pm-Message-ID: 97b67c31d679c3af491ce8a5c06a2860105b2a4d
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[parkour.is,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:185.70.43.0/24];
	R_DKIM_ALLOW(-0.20)[parkour.is:s=protonmail];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:62371, ipnet:185.70.43.0/24, country:CH];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	BLOCKLISTDE_FAIL(0.00)[185.70.43.96:server fail];
	DWL_DNSWL_BLOCKED(0.00)[parkour.is:dkim];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[parkour.is:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1BC3C400F1
X-Spamd-Bar: ---
X-MailFrom: sammy@parkour.is
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ANWZBZKCJ2ZABINRN6LWEN7CU4CGE7TU
X-Message-ID-Hash: ANWZBZKCJ2ZABINRN6LWEN7CU4CGE7TU
X-Mailman-Approved-At: Sat, 20 Dec 2025 20:44:52 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/1] staging: greybus: Remove completed PWM TODO item.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ANWZBZKCJ2ZABINRN6LWEN7CU4CGE7TU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The pwm.c driver already uses pwm_ops::apply. This item was completed
in commit 832ce36f44a2 ("staging: greybus: introduce pwm_ops::apply")
but never removed from the TODO list.

Removed the outdated TODO item.

Signed-off-by: Sammy Malik <sammy@parkour.is>
---
Changes in v2:
  - Added commit reference 832ce36f44a2 that originally implemented pwm_ops::apply
  - Fixed typos: PWN -> PWM, pwn_ops -> pwm_ops

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
