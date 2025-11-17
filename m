Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A7115C696EA
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C42513F949
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:35 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id BF89C3F8F2
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=NtScP93v;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-297e982506fso55296145ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403628; x=1764008428; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LJLo1e4srSl/A8tUoXfklbAY5SHQ1BetqKki69lZJ4=;
        b=NtScP93vrTT+qpl4lxbFG+nuhWCi56XCR4OizBgIChc9PuqgTl+oSVVW2oYJXb10wC
         VmapRlDftPBLkt0IYRLYgaO8By9OakBOVYZOgQq8sAcqWQmuCBjiIwDSl+Jbo04UfImR
         wOYrxRdrx/9PgIBd/JAm4qAzt0Hqg03fdN1KIE5iYiYpJngW8hZqoUA2bvAngHWO/AA+
         /Utcvnt3/q9aszA+CVI8qSS/mAYlJLsBZSedOh25YsMgJVluOPp03FDSIW6z1DP/umen
         ioizz324ZygZa8jn26FuTZyhgraeXQOIRAI5Soeryx92vDkdrMbr2JdOgPuZmAOGLhnm
         +xyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403628; x=1764008428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/LJLo1e4srSl/A8tUoXfklbAY5SHQ1BetqKki69lZJ4=;
        b=sCb3YFVFLPeTif6udQ/9jtQ4yDB+txrPpa9NdmqzNphxTvEn4FDXvOpOm/wn05cgC0
         2lc2PABHp8xDeO45hKw14aJS19cc+eRbt5pGrHHF6ZqNfF6ljDisUYKequKxiC3PELO/
         r8OJXZf70eg/xgrP6T93n675rwiCy6+aJpTJ/JnA2XWihB4befeU2L4s9YlSuLcSW2dx
         sMzfQbTqSjAYrAFmt5sgMyMMeUNX/HJftbZtvL2UD6RWHHLoJBO2tYOu7CYz1RuSX2bT
         EQJ9bW1RrN+XxBTPgcZH2NShdefhQ98MgvVeF9/y5b6LqJpb0VCrPdbU3B93G3UYJw9L
         6uzg==
X-Forwarded-Encrypted: i=1; AJvYcCUlevjom9dclGFy+Uvx0uA0Vo9ivLX6ru4cqKq4tQwBZ1btYVEkuvdFWmVx7/IaMI7uVOWj6aQabD70qQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyALXXtIPiKWndwakI19poHq/B39O7dzwFnwtAsQw6cY+zQsTE3
	+p4Omn0HB9bWsjxlaSlFw0GPNJNDCShidBL7mrJwqUpgKgOggHhQnycx
X-Gm-Gg: ASbGnctpsPlTOLDXpoR9IH/J76CMj9uuhKaPMmP9zumIblp+BFZL9UpZMiMcT/ujugg
	ap4qpPSeNTJT8pm5xd97h0zXKyOQWWW+wNs3XtrT/d88O1i8XowaZhseEbAQa26t3MnAayyyhlc
	6+qfQyUT5OhgBCkqIMO1Q42xnhg7E4FYl5Xa8EpD6ICeWF5hKf2eyav1AvJvGnY0R+bVxvgFDf5
	BamfC2VfLpf5kf2WeUD34SigWT447/+VBboaolp8pUDjAw3jx0MOgcVn8OQT4nkkcXnkovy0TIn
	OCWYqDcjiIhDbOpB264m3rdzQAyp1GolBwjNcp2SPE8vfGfkjNsma8ROujuU5zbpHfFAA3+IKrJ
	8QH3fgHhLn4q8qsH/Td84rF4CmrlkpFiGEmUUTBdW+hl59GFLPNDFzRzK6F/adApDdHWCI99Lfd
	vM6Vz1uACnGFNJiN2Srvpway4kjOrTnu7RUu6b
X-Google-Smtp-Source: AGHT+IH3HGg/AmNLBIKUB40JPQtMiBox13JfuVBM7e26piVH8Syan3xudGxi2caHhVADE84tiRsaGA==
X-Received: by 2002:a17:903:1786:b0:295:24c3:8b49 with SMTP id d9443c01a7336-2986a75676emr144549835ad.46.1763403627931;
        Mon, 17 Nov 2025 10:20:27 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:27 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:16 +0530
Message-ID: <20251117181818.118139-12-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BF89C3F8F2
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MESMKVRSFV7REBPI5GKZE24MBMS5DEI3
X-Message-ID-Hash: MESMKVRSFV7REBPI5GKZE24MBMS5DEI3
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:56 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 11/13] staging: greybus: uart: clear unsupported termios bits
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MESMKVRSFV7REBPI5GKZE24MBMS5DEI3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The Greybus UART protocol supports only 8 data bits, no parity, one stop
bit, and no hardware flow control. Mask out unsupported termios flags
before applying settings and force the supported configuration. This
removes the old FIXME and aligns the driver with TTY subsystem
expectations.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/uart.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 10df5c37c83e..cc7337bf5088 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -495,8 +495,14 @@ static void gb_tty_set_termios(struct tty_struct *tty,
 
 	newline.data_bits = tty_get_char_size(termios->c_cflag);
 
-	/* FIXME: needs to clear unsupported bits in the termios */
-	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
+	/* Mask out unsupported termios flags for Greybus UART */
+	termios->c_cflag &= ~(CSIZE | CSTOPB | PARENB | PARODD |
+				CRTSCTS | CMSPAR | CBAUD | CBAUDEX);
+	termios->c_cflag |= CS8;	/* Force 8 data bits */
+	termios->c_cflag &= ~PARENB;	/* No parity */
+	termios->c_cflag &= ~CSTOPB;	/* One stop bit */
+
+	gb_tty->clocal = (termios->c_cflag & CLOCAL);
 
 	if (C_BAUD(tty) == B0) {
 		newline.rate = gb_tty->line_coding.rate;
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
