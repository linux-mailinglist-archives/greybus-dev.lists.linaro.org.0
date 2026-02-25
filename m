Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sOvFKjdFn2m5ZgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:53:43 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 461A919C78D
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 19:53:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E7349402B2
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 18:53:39 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by lists.linaro.org (Postfix) with ESMTPS id F02C8402B2
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 18:39:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=G0nhSFgT;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.210.174 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-824a9348603so19170b3a.2
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 10:39:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772044741; x=1772649541; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4HRybFjotBo7xCavdJbzXBhAVjefd7vNccK+edsdN5M=;
        b=G0nhSFgTfCr5evF6Vseuv7owS61DB793qEZVRrVIrIaHsaEVf9hCI3/xxJscu/oDno
         KBrIAxO+ykE40Rbawe3Gf1xE1koNLcAQK2f6A8OWmTNnD7IhD6gVa+bzRe5zNQTkMl+9
         Brr8ibZWvNZPeyA/w001I+i7r8rLYw8v+4NdzK1Kk0XGpo5PXQyVJSama+en3e8IwacA
         qWfy0ZG/JFGy4QB73piQJb/sb6WW9nQo5pallREzb3jv94Z/gY58x9GRreCNHa8xOaPM
         OInYED7I4LWdraJyhTVxDHP9f5h2mfwj66agJT3zpUfGhAYUJOSdhCDG2ZktWPF087yc
         U19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772044741; x=1772649541;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HRybFjotBo7xCavdJbzXBhAVjefd7vNccK+edsdN5M=;
        b=u1cR25/ViWKLxVUmvqbe+C6/fLApkd9wLd6IJMgDLWUVTHwSo7GnjXM9+fu+hYeoAq
         QLoEXGG1U2f/DR5m5fz3qRkVid9vIepSSo/Wa8+4jY6qTONPJij2ydWaB7ZIr/gI1eNG
         OFLJhTWCVnbNXOMojQw8BrE1xjj9/s6Z5EFTgCBTLMrwumigOghckVJrOrpD8gztpwHB
         mLRtUom2wC4aHyMuyrOFXJZyiiXh8AcFaqD+sly41V3I3qnSOkNKJP92dDCsB4qyFA19
         r5Lk/P8Ydriaf7DsPuYUMpho0a4cbMyIgdeasaR9Psu00gvQSxjAL8oqzv2qjIjHWkIo
         zSNw==
X-Gm-Message-State: AOJu0YzF7HG+NIgR1EIaADJV2xtFZmhq2d6QqZiO8b2tkzU2YeG0TAHH
	Iryr+bPomttNGRSI0NJY14rBHiLPyUJl2ZHTWEoi4lZlsQ69HCUBTsob
X-Gm-Gg: ATEYQzz7ZVfriWol/9+mjotp+25tx3W8fTqs6nI67E2XJi3pp9jDHTHjVkw1mg9Qu43
	rPRAPdKrEtxBiMJFNURPCe/acClrqhf1dxQ6ep2b8tlWL6HrXFTZ51tbtLZTskXJE0cs2Jp1h8e
	KVqs4g0fUFigYtWzF3XnKDY/gPnqLYP96aewsq3ofhQ2IfLiysdMOz8j9bvDQBHErkBOYdoqBta
	2hSa/miCmwkEMGTPRDLCN7QdlWkdN/H+5Yp514SJkCjTU38pYS18or30O/WWoeEFx0QxmZ9TMsH
	lVJNxrUKsC4Fmngfw6VbioJpGaPtXAACT4WkgNdDtabasM1cfemTuY5KBanePBBG/qUYBRmrb1/
	/IKQE3ozNzLxTIABV8i9+za/3Td+wAX4COu/pdYO3mIsf9oH0wLtqFODaMjXqZEXYjJqezccROS
	24DDkIsfwwtq9ZIR1chiwdAEZvWDVQ5uD9QDQ=
X-Received: by 2002:a05:6a21:9d48:b0:35d:d477:a7f3 with SMTP id adf61e73a8af0-39545ed2be5mr14317467637.20.1772044740790;
        Wed, 25 Feb 2026 10:39:00 -0800 (PST)
Received: from fedora ([2409:40e5:105a:d068:a95a:8654:94eb:1089])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c70b724321esm14010380a12.16.2026.02.25.10.38.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 10:39:00 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: David Lin <dtwlin@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 26 Feb 2026 00:08:35 +0530
Message-ID: <20260225183836.20434-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: I4HU5EPITVJTCY7UWF4V7FQUF4Y2MWIW
X-Message-ID-Hash: I4HU5EPITVJTCY7UWF4V7FQUF4Y2MWIW
X-Mailman-Approved-At: Wed, 25 Feb 2026 18:53:37 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: uart: fix style issues
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/I4HU5EPITVJTCY7UWF4V7FQUF4Y2MWIW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.996];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 461A919C78D
X-Rspamd-Action: no action

Fix checkpatch.pl warnings by adding comments to mutex and spinlocks,
and fixing alignment to match open parenthesis.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..1d2c4ef70865 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock;		/* protects read operations */
+	spinlock_t write_lock;		/* protects write operations */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex;		/* serializes port operations */
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
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
