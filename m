Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BA1A64270
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 08:01:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25F3344525
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Mar 2025 07:01:37 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id A71204472E
	for <greybus-dev@lists.linaro.org>; Mon, 17 Mar 2025 07:01:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=WsPPor6R;
	spf=pass (lists.linaro.org: domain of jirislaby@kernel.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=jirislaby@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D0B01A43A24;
	Mon, 17 Mar 2025 06:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 359CFC4CEEE;
	Mon, 17 Mar 2025 07:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742194886;
	bh=S+XImMzdVUV9r9EFo8L+yAW5p+vSzmK/coEDq0u0j+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WsPPor6Rey9Jc3MQ+L5KkubgT27WjCCTSfPtPGQZ7mSAdQUew6s6pq3hgHi3/Xjqt
	 Nx6ner8er3qNkgVduJu220dadEetCULjyXo4TDkxKcHCr0SCUBWq59rF98kri9vSYh
	 C7EhvDmdIEQXVbye04sLXEtxQPOYhsNuQNebrBvSFO7PgzTk1tadOiJhMs5g3BnigM
	 vu/91xVoWk+ZaJHgcUEqWFTKO8h5NnR2hDEgam2EI51FUZ2tdYypHi5QtePcH4xDc5
	 LvUN7PZvTwmjStxTW+NPQ3ly0uZaqw/DUk6lRl4bmZ0OeJPrCRtffR5JoJfNnXqeuT
	 0V7Po9cO7187A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Mar 2025 08:00:37 +0100
Message-ID: <20250317070046.24386-23-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250317070046.24386-1-jirislaby@kernel.org>
References: <20250317070046.24386-1-jirislaby@kernel.org>
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A71204472E
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_9(-1.00)[147.75.193.91:from];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,linux.dev:email];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: N7HSYOZVRZ47BLX4NQMDFDGTWDU7UMXO
X-Message-ID-Hash: N7HSYOZVRZ47BLX4NQMDFDGTWDU7UMXO
X-MailFrom: jirislaby@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, David Lin <dtwlin@gmail.com>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 22/31] tty: staging/greybus: pass tty_driver flags to tty_alloc_driver()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N7HSYOZVRZ47BLX4NQMDFDGTWDU7UMXO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

tty_alloc_driver() is supposed to receive tty driver flags.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Acked-by: Johan Hovold <johan@kernel.org>
Cc: David Lin <dtwlin@gmail.com>
Cc: Alex Elder <elder@kernel.org>
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
---
 drivers/staging/greybus/uart.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 8eab94cb06fa..308ed1ca9947 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -948,7 +948,8 @@ static int gb_tty_init(void)
 {
 	int retval = 0;
 
-	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, 0);
+	gb_tty_driver = tty_alloc_driver(GB_NUM_MINORS, TTY_DRIVER_REAL_RAW |
+					 TTY_DRIVER_DYNAMIC_DEV);
 	if (IS_ERR(gb_tty_driver)) {
 		pr_err("Can not allocate tty driver\n");
 		retval = -ENOMEM;
@@ -961,7 +962,6 @@ static int gb_tty_init(void)
 	gb_tty_driver->minor_start = 0;
 	gb_tty_driver->type = TTY_DRIVER_TYPE_SERIAL;
 	gb_tty_driver->subtype = SERIAL_TYPE_NORMAL;
-	gb_tty_driver->flags = TTY_DRIVER_REAL_RAW | TTY_DRIVER_DYNAMIC_DEV;
 	gb_tty_driver->init_termios = tty_std_termios;
 	gb_tty_driver->init_termios.c_cflag = B9600 | CS8 |
 		CREAD | HUPCL | CLOCAL;
-- 
2.49.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
