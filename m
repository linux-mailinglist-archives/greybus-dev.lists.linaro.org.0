Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QH4sOKzg5WmlowEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 10:15:40 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A1642809C
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 10:15:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5790E404D1
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 08:15:39 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id E7C253F859
	for <greybus-dev@lists.linaro.org>; Sun, 19 Apr 2026 03:27:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="n/m+ee6j";
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of debjeetbanerjee48@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=debjeetbanerjee48@gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b2503753efso18820655ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 18 Apr 2026 20:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776569232; x=1777174032; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FpvRvMQTPx9sUe9bSbatRTALRpCc/0zQhkXDO/h/Er0=;
        b=n/m+ee6jw49TLW9u9cx5PF4+WEpNq37C34e4ZwnQtkACeGzpQlOcjCGzZ5oGv7NmTL
         LRvL2KrAKv0+1zPZXg2ygGbV4GiPM9kHKk/umtPacMNXpN5Ghw3DRVB7aN8UsQ9m8ZV2
         Y2fU3c6s8QgsVNxWN+nAAi8uW0u6ulIThmYSR3V8SK+yYQBNgqfb1nm//q5wSxxuykaT
         4v0KPKkWMfFi0dDwqGEVCb1tyg/q3QCgwBh0B/Jr/zFwVi0yIsxqSxVs6LEwWl+3+nwl
         M0Fnc28iFNWkyn5ydlna2gbyqW/cs+0wU6t/KN1ekVRmSbAdliI4lRU1PjPlwUPsxmEH
         dg3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776569232; x=1777174032;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FpvRvMQTPx9sUe9bSbatRTALRpCc/0zQhkXDO/h/Er0=;
        b=c+00BxEGmR5ontUY2KoZ0gml3fJzet+PIH1aRQkZ34py8tY2ybA9sLimyN8f1l/Txn
         RLVLEFgo7mP1ix00Wr9MbbAwoiB/kWrdkyoHgTNP8FXdgd3Jawyu28HVIWVfKGfOFrF0
         InctCzDQM+fJKsZV1OURQBeccsTlXYFmy2wVz0tyQZSZJOVmVMyF/A89QQeNNUxR/VCr
         I6Vtno4rdDoJ8yv1O3rwlAzk7jQBkr6BP9NqqxvPDlc63fLAyRczr5LI+6wu1Sc/MvIy
         NLfsQCwEVt0f4vyuexfZ4lUGngktpA0etHcV1ZTM7obw7wTsmfz65nX4KgTyRPN4huLK
         BuAA==
X-Forwarded-Encrypted: i=1; AFNElJ+dEVhvsINuB87MpY0vFW8QV/f/sZIGXBuijs6tyqZX25ClxlYH23XOQfEMHQF0lWMk02uv07ZrlYDKHw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzYhIVa5+n5ttknI8Bl4M7Ike6tE3AKQvTrJ9gJcFPhUVmj7Oll
	YTLjC6+C9PTkIVsknocOb+DiT5aPcRIYfx3ohl+7ECJiGlHNbQkKtRL8
X-Gm-Gg: AeBDietDQn6J3rJM4l/50FTcewFW+hSJoRGuP7xdDYRdkuAy5AL3JBe+LfSoXkNua3f
	B6ZIM7IRpOOpZQMJevL/Xvk60szTQlfigk8RiLklRWknIS/V4FjemnhCk57NUuQF3F6x5hIF8yP
	Y/00tdpyw4vBEdOWVY04rdnAMsOWffGnqqjZeUmf8e5SvksEnQPZD+dh9x1J96R7RBUofrE5dR5
	cjf+MSZoWOXnmjgCZZqwInTLlv0qDmdULAT1FESzLrPV3yr9h4oh1P3S5Oexk8zF3nM28VfqWmw
	aUpA1hrsQ9aHF784T8a5bPrnjX/NufvncwQdu57lGZAFd93TxE1jVMyFRbyAVdiTD7j0JASf+Au
	lt3/QJefPkEhnF3eNXYM43qunCHrPEXOcliCEWxnE0zGMYaI3ieJxZLZ86ipxnqtDqBekzzDTNH
	VDjIxHGNARrpici+PSHeDezXmob1pdCspeQ/8/4itR97UT5OZPt8Zq
X-Received: by 2002:a17:902:e184:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2b5f9ecd237mr64143525ad.15.1776569231931;
        Sat, 18 Apr 2026 20:27:11 -0700 (PDT)
Received: from arch.localdomain ([103.182.132.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cf3bsm74202655ad.44.2026.04.18.20.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 20:27:11 -0700 (PDT)
From: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
To: dtwlin@gmail.com
Date: Sun, 19 Apr 2026 08:56:32 +0530
Message-ID: <20260419032632.35351-1-debjeetbanerjee48@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: debjeetbanerjee48@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: JJSQY6OSWEM66KMHNP2AKBB47FTKQP6Y
X-Message-ID-Hash: JJSQY6OSWEM66KMHNP2AKBB47FTKQP6Y
X-Mailman-Approved-At: Mon, 20 Apr 2026 08:15:37 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, debjeetbanerjee48@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: document c_cflag handling in set_termios
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JJSQY6OSWEM66KMHNP2AKBB47FTKQP6Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[28];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[debjeetbanerjee48@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 75A1642809C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

gb_tty_set_termios() derives UART line configuration from a subset of
termios->c_cflag bits, namely CSIZE, CSTOPB, PARENB, PARODD, CMSPAR,
CRTSCTS, CLOCAL and CBAUD. Other c_cflag bits are not interpreted by
the driver and are not represented in the Greybus UART protocol
messages.

The existing FIXME suggests clearing unsupported bits from termios.
However, the driver already limits its behavior to the supported subset
when constructing line coding, and unused bits are effectively ignored.
No invalid or unsupported values are propagated to the hardware.

Replace the FIXME with a comment documenting which c_cflag bits are
consumed by the driver and clarifying that other bits are ignored.

No functional change intended.

Signed-off-by: Debjeet Banerjee <debjeetbanerjee48@gmail.com>
---
 drivers/staging/greybus/uart.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..49d685a6ad8c 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -494,8 +494,20 @@ static void gb_tty_set_termios(struct tty_struct *tty,
 				(termios->c_cflag & CMSPAR ? 2 : 0) : 0;
 
 	newline.data_bits = tty_get_char_size(termios->c_cflag);
-
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
+	 * Other c_cflag bits are ignored as they are not represented in
+	 * the Greybus UART protocol.
+	 */
 	gb_tty->clocal = ((termios->c_cflag & CLOCAL) != 0);
 
 	if (C_BAUD(tty) == B0) {
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
