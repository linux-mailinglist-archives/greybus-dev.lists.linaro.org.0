Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CC69BEE01
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 14:15:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E8BE4413DE
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Nov 2024 13:15:00 +0000 (UTC)
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	by lists.linaro.org (Postfix) with ESMTPS id DDFE840CEE
	for <greybus-dev@lists.linaro.org>; Wed,  6 Nov 2024 09:58:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=LfOSBYL3;
	spf=pass (lists.linaro.org: domain of chenqiuji666@gmail.com designates 209.85.215.194 as permitted sender) smtp.mailfrom=chenqiuji666@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-656d8b346d2so4221563a12.2
        for <greybus-dev@lists.linaro.org>; Wed, 06 Nov 2024 01:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730887110; x=1731491910; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IL+yWlh9vw0jY8HppITDLAmrvaCxhRoxikmmdyKh+y8=;
        b=LfOSBYL3rw5DrR7brc6NmI6xhq79zNnTL3cjKKsQc7va3e01MavXpJ/eTxm6Rha4L0
         2LcHUZM6LsZqwhUx7KMYd0+AbPJtMy03r7zwzMt7VO6+xmLWtvBD4TMQ8kvEZeHNxaUr
         mUChvg2111RNlqgnMWzxRYU2bgxna2YOUK8oF4q2b56OEqEnCM38PNMxqvtEtKLAdqRP
         XVcPY5RYaDFt2lE8selHcj3KFXpZLLAfFnoVIPTO8XR6bA0RUqiMnEOYtVJqoiSVUOka
         sdozN3TmCGG0DyOCQnWt/qOJ/RD+VnK/4ZDGMTiNzZRzYFwjp00x7Hu2OwRhve5fqYBl
         FjPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730887110; x=1731491910;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IL+yWlh9vw0jY8HppITDLAmrvaCxhRoxikmmdyKh+y8=;
        b=go4hNRFr20431dos1GbnlCN2cWWt9azldKtdxj654UMXtAyw+uiMCU9KxZLikRT+kb
         hoda5vITZQ9/3er9GmDzYSbs+3cPTh4AoOv6S+9tbWIkxOZtozrol4iJOtyeu4UFKFsQ
         g1mFEvMUbzsrhimK4bnZcT3l3W/V5v0lm8NPht2DgG48a6szLVNf0NX+asUSiYyI6su/
         zmxh2m713/esuUDbmqa1kZaH25te2l0Jo/XoOI7Kmz2OhUZPakMt1bd3oP05d1ayMIop
         tF1QnqJRQeM3FCviD2ZErzpUm/clhUX4MUqE8ryrDLR3Qw47lAioWBNiTLipSKzbZUOw
         +tRQ==
X-Gm-Message-State: AOJu0YxEGRZbsjkyUv7EfSO0LWRukL0aqpiK61zoURqwvS9Ih7CwF2Go
	L430e7Dj7iY7LP8nXcEI83sr8p2zqahoEp1wz33tJCHvyx/EznNJ
X-Google-Smtp-Source: AGHT+IG2tBOEv1SQ+V34aw/3CB9NObTGsM/TPaYr68DvAKudhuXE3dzD2HjurZOP4mEoNNYPZUQJwQ==
X-Received: by 2002:a05:6a20:12d2:b0:1db:e425:c8a2 with SMTP id adf61e73a8af0-1dbe4263443mr12310020637.19.1730887109882;
        Wed, 06 Nov 2024 01:58:29 -0800 (PST)
Received: from tom-QiTianM540-A739.. ([106.39.42.118])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2c3db8sm11229287b3a.131.2024.11.06.01.58.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Nov 2024 01:58:29 -0800 (PST)
From: Qiu-ji Chen <chenqiuji666@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed,  6 Nov 2024 17:58:19 +0800
Message-Id: <20241106095819.15194-1-chenqiuji666@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Result: default: False [0.90 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	RBL_SENDERSCORE_REPUT_3(2.50)[209.85.215.194:from];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.194:from];
	BAD_REP_POLICIES(0.10)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	NEURAL_HAM(-0.00)[-0.996];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17];
	RCPT_COUNT_SEVEN(0.00)[9];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DDFE840CEE
X-Spamd-Bar: /
X-MailFrom: chenqiuji666@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2MMFKNMW3K25DM5FAKSWW5G7BB3J2HMT
X-Message-ID-Hash: 2MMFKNMW3K25DM5FAKSWW5G7BB3J2HMT
X-Mailman-Approved-At: Wed, 06 Nov 2024 13:14:57 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, Qiu-ji Chen <chenqiuji666@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus/uart: Fix atomicity violation in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2MMFKNMW3K25DM5FAKSWW5G7BB3J2HMT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Our static checker found a bug where set_serial_info() uses a mutex, but 
get_serial_info() does not. Fortunately, the impact of this is relatively 
minor. It doesn't cause a crash or any other serious issues. However, if a 
race condition occurs between set_serial_info() and get_serial_info(), 
there is a chance that the data returned by get_serial_info() will be 
meaningless.

Signed-off-by: Qiu-ji Chen <chenqiuji666@gmail.com>
Fixes: 0aad5ad563c8 ("greybus/uart: switch to ->[sg]et_serial()")
---
V2:
Modified the patch description to make it more concise and easier to understand.
Changed the fix code to ensure the logic is correct.
Thanks to Johan Hovold and Dan Carpenter for helpful suggestion.
---
 drivers/staging/greybus/uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index cdf4ebb93b10..8eab94cb06fa 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -596,11 +596,13 @@ static int get_serial_info(struct tty_struct *tty,
 	struct gb_tty *gb_tty = tty->driver_data;
 
 	ss->line = gb_tty->minor;
+	mutex_lock(&gb_tty->port.mutex);
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
+	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
