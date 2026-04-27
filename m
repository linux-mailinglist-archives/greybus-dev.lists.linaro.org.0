Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EEObFogv72mb8wAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 11:42:32 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D84D44700F4
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 11:42:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0513E406C8
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Apr 2026 09:42:31 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	by lists.linaro.org (Postfix) with ESMTPS id A06573F7A4
	for <greybus-dev@lists.linaro.org>; Mon, 27 Apr 2026 04:55:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=opxKCDeG;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of debjeetbanerjee48@gmail.com designates 209.85.215.172 as permitted sender) smtp.mailfrom=debjeetbanerjee48@gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c796163fac5so5931553a12.1
        for <greybus-dev@lists.linaro.org>; Sun, 26 Apr 2026 21:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777265701; x=1777870501; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFgTfDtQqAbkf7ATgQZ3F8aWPMjefay/fF2UFGDgFWQ=;
        b=opxKCDeGyivVfrqLp7NozwC1Eq9Yt/vd3YEMD5R6QlU4lUsyHPlfnl0hbLN8ifoWPJ
         7bM8AcjzA7CUYaTFJWLFIrUN3+zcmO+5zht7i7jc/LxkJgDHaCvzpLlTiRalieCQjxvT
         EWE3qA4cYuMZANxyKrQJ6XuHpi7g6/YA8xNEl+43au3eqrrZoT9K+VGvONfXcUXKX8FP
         sstNwtEWnh16O776hYo9LUY+g4l9IvWMWFcHMXHm8RmAoK70fQDi+G5rHrTFzxLBD5W4
         SnxzXQsVrlgIgZwj2lOf6AZ8DgXNCuimmFNGGeEm3Vcag6RGFCO1ylQI6Qa7DC0RMmQI
         6bWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777265701; x=1777870501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cFgTfDtQqAbkf7ATgQZ3F8aWPMjefay/fF2UFGDgFWQ=;
        b=X5JchHi3Vwkga3l/pislh+j/ochEuCq107OpIoTHlhRPedpZF8lxDfcO1eXB2I7NHg
         C0F1jeJIaKYImG84Mcmj2olUVq3rSNlUoYTmVwMFhFmpro4b62HgJ5u9luIok8vunVdv
         Hr5y9HCCelc02Z4KtRJXAioF+NDZ7Jj9zG5pHISP8YfOwVeEZ5AqY8zV2/js+2k+KwHF
         +8V3aFKxIO0hkwDcT/f7UlSTbY3dS55Ja4hqGVHGu/xh00cY2GaMBvOJ1i+Biawa0AWJ
         S7UlGriXGGR28dc9B8jHUigaYL76utXzEx1IUaQKqreU6/W07csr8G/7IWUbNwuTOAwC
         tVGw==
X-Forwarded-Encrypted: i=1; AFNElJ9TQw3NECL4SKVYR6dS+S7v6WJeGRgmjHsOXGj+YFZu2sBTTnxl6pJgcYJ7ITl1eQ0LN6O4FMoSEov7yw==@lists.linaro.org
X-Gm-Message-State: AOJu0YytIymCOMNs05/GjpMpreSIWAmnIwEIJj52IYQfDhmjCxf6CR6N
	ocYwMQow8QV+3KyVnQUbUOGt8xSlNbqGphinv6PmZpNIolX40ErPpeym
X-Gm-Gg: AeBDietAWA79e8qAclJXfEHkMZxAvEQ5z33HdlBqoc9okQtf/ZNGSBjSf6MRO49XFJb
	AjvDs72YSApJ8BvGWgMeUJaFdPRrankQFHKJhxblH0DYpk96t5Mj8lFBCroOIVXk7QE83CMQX6l
	d/rU/CEPyg1vFM8meEL/ndpUEZ5dOsrZNCSaiNnT3MrnHHmyzIamf8sflfonSDuBXWoP2Ir/oTF
	suM99VPX9Zysgj1IrpV0AL9D3xf4L4UbTx/oOxHtJc4SzBJzLc3z4HyTXRRYiV3hFf7XL02aa7G
	Beckj/fRCpO2rOSWK2+SPgqtjWYzmdGNsfNG4WpUP29iKVUZLslkeRwv+5JUuhgY85tgE6wuOyB
	lEpmN1ZbA8AzJxu4Egy/mOrkXM5g+hhSvNxWgmOayoq2hU9XiP8rJh8uo5EW61w44a0CyM3W/UL
	TDV8qJOFUGIUdRs5Uak6C6vvlTSYJM/rFq70YF963RUwA2WIvO1vmjx8t2gZT5j6s/
X-Received: by 2002:a05:6a21:99a3:b0:39b:d937:8010 with SMTP id adf61e73a8af0-3a08d8e076dmr45768555637.45.1777265700690;
        Sun, 26 Apr 2026 21:55:00 -0700 (PDT)
Received: from arch.localdomain ([2405:201:8043:c04b:e09f:2c00:55ad:2561])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703059fsm23361399a12.24.2026.04.26.21.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 21:55:00 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 27 Apr 2026 10:24:46 +0530
Message-ID: <20260427045446.16430-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026042618-whole-cassette-b15e@gregkh>
References: <2026042618-whole-cassette-b15e@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: debjeetbanerjee48@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ISADPEXR53MYJLI7LYOULW2BIJKEHAPR
X-Message-ID-Hash: ISADPEXR53MYJLI7LYOULW2BIJKEHAPR
X-Mailman-Approved-At: Mon, 27 Apr 2026 09:42:25 +0000
CC: debjeetbanerjee48@gmail.com, dtwlin@gmail.com, elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: uart: clear unsupported c_cflag bits in set_termios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ISADPEXR53MYJLI7LYOULW2BIJKEHAPR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D84D44700F4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,lists.linaro.org,vger.kernel.org,lists.linux.dev];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-0.839];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,greybus-dev-bounces@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]

gb_tty_set_termios() derives UART line configuration from a subset of
termios->c_cflag bits (CSIZE, CSTOPB, PARENB, PARODD, CMSPAR, CRTSCTS,
CLOCAL and CBAUD). Other bits are not interpreted by the driver and are
not represented in the Greybus UART protocol.

Mask unsupported c_cflag bits so that userspace-visible termios
reflects the supported bits implemented by the driver.

This addresses the existing FIXME.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
v2:
  - Clear unsupported c_cflag bits as suggested
  - Update comment to mention the change
---
 drivers/staging/greybus/uart.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..9c10e6baa7e0 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -495,7 +495,24 @@ static void gb_tty_set_termios(struct tty_struct *tty,
 
 	newline.data_bits = tty_get_char_size(termios->c_cflag);
 
-	/* FIXME: needs to clear unsupported bits in the termios */
+	/*
+	 * The Greybus UART driver only interprets a subset of termios
+	 * c_cflag bits when configuring line settings:
+	 *
+	 *   - CSIZE via tty_get_char_size() for data bits
+	 *   - CSTOPB for stop-bit format
+	 *   - PARENB, PARODD, CMSPAR for parity encoding
+	 *   - CRTSCTS for hardware flow control
+	 *   - CLOCAL for modem control handling
+	 *   - CBAUD via C_BAUD() for baud rate and B0 semantics
+	 *
+	 * Mask unsupported c_cflag bits.
+	 */
+	termios->c_cflag &= (CSIZE | CSTOPB |
+			     PARENB | PARODD | CMSPAR |
+			     CLOCAL | CRTSCTS |
+			     CBAUD);
+
 	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
 
 	if (C_BAUD(tty) == B0) {
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
