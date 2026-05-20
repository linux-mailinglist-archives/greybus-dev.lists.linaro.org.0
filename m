Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE1QNJhuDWp9xQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 20 May 2026 10:19:36 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA07589948
	for <lists+greybus-dev@lfdr.de>; Wed, 20 May 2026 10:19:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3D0A240973
	for <lists+greybus-dev@lfdr.de>; Wed, 20 May 2026 08:19:35 +0000 (UTC)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com [209.85.222.41])
	by lists.linaro.org (Postfix) with ESMTPS id 80F99406A1
	for <greybus-dev@lists.linaro.org>; Wed, 20 May 2026 02:44:06 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="dSiU1/5P";
	spf=pass (lists.linaro.org: domain of luizcarlosmdea@gmail.com designates 209.85.222.41 as permitted sender) smtp.mailfrom=luizcarlosmdea@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ua1-f41.google.com with SMTP id a1e0cc1a2514c-9568159ee07so2939544241.1
        for <greybus-dev@lists.linaro.org>; Tue, 19 May 2026 19:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779245046; x=1779849846; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dp0vCDZPCe1rJMQjdKdJy1wpPdZpOogFV+3zlUS9uqk=;
        b=dSiU1/5Pyl2y5kmzxss0LhUMIQluML+Zn71qSdr7O3gG+Sna5C5/CD6WZHbkQCqWlT
         2QFiGyDTVLZChD8xkqJrwQ8iJ+sIFSCs+ajG+Zwn0s6kc+D68YqKdsoTQcrGnlbUNty0
         wioquk8Jeux/Vq664LjT2OoQLq2wtbqwCkZGR5oGcxI8dQtzceQpVKqhtqc1tRcBmvWV
         EAj7zjZql2Nfi+Xw+5I+ugJuZBB2SLfk4Pupq3FpbVMxrMkn/KDmOVB1dvbdNls7qBHR
         3F9Y5DF9HmZ34b2P3DbZyP3wALc9UALyIz1LthheDvKLaN7eWFJPlUf1B059A4L3kcr6
         FKWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779245046; x=1779849846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dp0vCDZPCe1rJMQjdKdJy1wpPdZpOogFV+3zlUS9uqk=;
        b=PUku3Gq54J9fFcBRMvwr6VBxcGCrbUd66vWZYMnMj5OVZWyT5ttQ0UMKu4b4T2qGL3
         sWjxHsdcJTJa1Oh16a+YzxfW842qZEHmu932IevfzrDRxDv9UvJtGrQV1WeFHIv2eWk5
         gcNhoCHcP8o4CzE7Wn68da9NGfHSBwhgdpEOvSNU2GbZQ3WAAogQuZvTrL1KI9W8/8zn
         N5nA8q2GTgzohlIbVy2+xLPH4zSQDkTSPFJ3NwODOp1adOsnhz9rmQ8QW6ss9PEevgt0
         jUR0uZtMUw8La6ZB69n2umnismIakyzENjHf4/L0nXGLYWzPOgncC5LQEgNByAEStPHn
         zQNw==
X-Forwarded-Encrypted: i=1; AFNElJ+gobL7CfKhD/nwmUT1WZ/sF+Cn9pn0CaVmHxsAavpK9k3HdfphJWI2hO6hd76O9ZHtiGCbu2EIX5RwHw==@lists.linaro.org
X-Gm-Message-State: AOJu0YwYS7H83dgqWQ2s7+riNdV4YfXGaTQ+F40pjwybQQqR2vxfm2aJ
	p4sTus4YQDSwnYPRWZd+hCPHVvOvBgHEJPTk+yC/T/aMfu00xgodfzsH
X-Gm-Gg: Acq92OGl99/xiro78NkfD7XijIzAWzxUS3IjMvT089KroH4WRMvOPeuJpCck/pCMqku
	OjctCmHb4w46Q3YG4pZ3+AQv8DgKY9eWueAkpBOWrIKDFqMoSPICxarj9lBAaFOPL8LGqBgQOUN
	sCOlUDvqdV/TyPoXMc/q3M5gL4gO7opaYnID+yOpQS5F9G/1Hnp7Pt5rvvSKMLqAqizaImVr/9W
	QwVgmJhbA0eBUVY5pqUrGZ+e9Q4/jHGU/raNJ1ayZTMfkUKzd3E7FwSoTXPMZAEXtTyg8brB7V+
	buThpfjFxQje020YiZUWZzomnnrBut8kKm5OIizwo81y80irtZzG81FCwOjbM57d1oPfs9YaFVm
	E+ssvg7Rkae8nEP3eORYE0dygYPvLDtUNnWiuyx/77117jmDNQ5pgqb6ZRjj482UQOAlTnJQX5Q
	gfY1H9marJN6H1MP0yKBFE
X-Received: by 2002:a05:6102:6051:b0:634:8685:d335 with SMTP id ada2fe7eead31-63a3ec8c2efmr11368508137.14.1779245045997;
        Tue, 19 May 2026 19:44:05 -0700 (PDT)
Received: from arch ([186.195.35.248])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-95fc2fbe40esm7063186241.11.2026.05.19.19.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 19:44:05 -0700 (PDT)
From: AkaLuiz <luizcarlosmdea@gmail.com>
To: David Lin <dtwlin@gmail.com>
Date: Tue, 19 May 2026 23:41:28 -0300
Message-ID: <20260520024128.68942-1-luizcarlosmdea@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: luizcarlosmdea@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NOWZXK7X5MV6DLHBXS57CADVGP7UZPAY
X-Message-ID-Hash: NOWZXK7X5MV6DLHBXS57CADVGP7UZPAY
X-Mailman-Approved-At: Wed, 20 May 2026 08:19:18 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, AkaLuiz <luizcarlosmdea@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: document locking and fix indentation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NOWZXK7X5MV6DLHBXS57CADVGP7UZPAY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[luizcarlosmdea@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: AAA07589948
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add comments describing what the lock fields in struct gb_tty
protect, and fix the indentation of the
wait_for_completion_timeout() call.

Signed-off-by: AkaLuiz <luizcarlosmdea@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..85586e9a4341 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock; /* protects iocount and oldcount for TIOCMIWAIT */
+	spinlock_t write_lock; /* protects write_fifo and credits */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex; /* protects disconnected during lookup and removal */
 	u8 ctrlin;	/* input control lines */
 	u8 ctrlout;	/* output control lines */
 	struct gb_uart_set_line_coding_request line_coding;
@@ -318,7 +318,7 @@ static int gb_uart_wait_for_all_credits(struct gb_tty *gb_tty)
 		return 0;
 
 	ret = wait_for_completion_timeout(&gb_tty->credits_complete,
-			msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
+					  msecs_to_jiffies(GB_UART_CREDIT_WAIT_TIMEOUT_MSEC));
 	if (!ret) {
 		dev_err(&gb_tty->gbphy_dev->dev,
 			"time out waiting for credits\n");
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
