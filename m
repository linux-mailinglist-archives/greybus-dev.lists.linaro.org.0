Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF1F9B9E86
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Nov 2024 11:03:56 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 82CA941422
	for <lists+greybus-dev@lfdr.de>; Sat,  2 Nov 2024 10:03:55 +0000 (UTC)
Received: from msa.smtpout.orange.fr (out-66.smtpout.orange.fr [193.252.22.66])
	by lists.linaro.org (Postfix) with ESMTPS id 4D6F73EBEA
	for <greybus-dev@lists.linaro.org>; Sat,  2 Nov 2024 09:36:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=wanadoo.fr header.s=t20230301 header.b=I9zQPgRb;
	spf=pass (lists.linaro.org: domain of christophe.jaillet@wanadoo.fr designates 193.252.22.66 as permitted sender) smtp.mailfrom=christophe.jaillet@wanadoo.fr;
	dmarc=pass (policy=quarantine) header.from=wanadoo.fr
Received: from localhost.localdomain ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id 7AYBtqJIgpBS87AYBtJqoH; Sat, 02 Nov 2024 10:36:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1730540169;
	bh=NyhZO+p/ZIiZc1HaYQM5EPp9Jxx4qvXRWG7UB7JsmrM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=I9zQPgRboy8/raEXy9Rjy2ghjxUtTxO7MuXDU5tJejgfRT2iwqcMiMnl+mz1EzNQx
	 o6D5KLxv73nNjuD9WmqF1SdDX0hNu4CIEqf7wKRZ8Gfnn2W6+k4zR6O8AU8U5MjAEK
	 AV+BCeg1h3xLK25WQBqoE7Sqfo4CkVj6BeMkNHlNHWicvLPCE+h/YokVrc3fVZQUw9
	 ohZZlD7Iduj6NMRHJYA4RFdOyxpFYVOjBdCfe+bYXx9rn+9tnxoeU5VrtKMhPQW0vZ
	 LSXKRiD3+8Wfhm2LjUhB8vPs6lz3imQ8lBDFjXkfCEx9fUcXucgKUZw7Yx7369/QvZ
	 o5TJHcpoBWIgA==
X-ME-Helo: localhost.localdomain
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 02 Nov 2024 10:36:09 +0100
X-ME-IP: 90.11.132.44
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat,  2 Nov 2024 10:35:56 +0100
Message-ID: <aad9d19c20ea0463974b7652ba7f2f8d9fec1186.1730540152.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[wanadoo.fr,quarantine];
	R_MISSING_CHARSET(0.50)[];
	ONCE_RECEIVED(0.20)[];
	R_DKIM_ALLOW(-0.20)[wanadoo.fr:s=t20230301];
	RWL_MAILSPIKE_VERYGOOD(-0.20)[193.252.22.66:from];
	R_SPF_ALLOW(-0.20)[+ip4:193.252.22.0/25];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[wanadoo.fr];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[msa.smtpout.orange.fr:helo];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[wanadoo.fr:+];
	FREEMAIL_ENVFROM(0.00)[wanadoo.fr];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,wanadoo.fr,lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:3215, ipnet:193.252.20.0/22, country:FR];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4D6F73EBEA
X-Spamd-Bar: --
X-MailFrom: christophe.jaillet@wanadoo.fr
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OW6NMLVX5K5TEM6JCONOUECWRHAGIXL3
X-Message-ID-Hash: OW6NMLVX5K5TEM6JCONOUECWRHAGIXL3
X-Mailman-Approved-At: Sat, 02 Nov 2024 10:03:52 +0000
CC: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Christophe JAILLET <christophe.jaillet@wanadoo.fr>, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Fix a typo
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OW6NMLVX5K5TEM6JCONOUECWRHAGIXL3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

s/interfce/interface/
A 'a' is missing. Add it.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/greybus/interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/greybus/interface.c b/drivers/greybus/interface.c
index d022bfb5e95d..a0f3e9422721 100644
--- a/drivers/greybus/interface.c
+++ b/drivers/greybus/interface.c
@@ -780,7 +780,7 @@ const struct device_type greybus_interface_type = {
  * The position of interface within the Endo is encoded in "interface_id"
  * argument.
  *
- * Returns a pointer to the new interfce or a null pointer if a
+ * Returns a pointer to the new interface or a null pointer if a
  * failure occurs due to memory exhaustion.
  */
 struct gb_interface *gb_interface_create(struct gb_module *module,
-- 
2.47.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
