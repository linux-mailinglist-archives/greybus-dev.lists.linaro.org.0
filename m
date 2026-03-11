Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDfEH+W8sWmxEwAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 20:05:09 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4830F26904A
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 20:05:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61235402C9
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 19:05:08 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 98240402B0
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 18:41:32 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Q86JYfNd;
	spf=pass (lists.linaro.org: domain of rj5547884@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=rj5547884@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ad9a9be502so1793055ad.0
        for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 11:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773254492; x=1773859292; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm6aBQFmhV5MNb69YAxeMe+wLv1vCAxTIamZijo4ixo=;
        b=Q86JYfNd5qyM1GBRDnNgZOmSk5jVWZxePspZLbZ2niJ9j6T68W/ldfZnhQIeNEm2Hu
         mmHzgkFXfgSeFQQO7c6NeqRVpj4+yULpOWVZpDHSrt9jJnUbpj0dHGHd0OczRfWJAQRu
         dmMd5f5ZKCgID+qwM49j7EClRvuTklPSCLhXi9oe5seRQW7SHs/qg8t4Gp2sNEZ70L2a
         Nx/B7vtwJRLTImgF9wzWf8SOJmWSUoTsL32GcKHMM41aUgLKB88uBAuu7Z7h+lh3aGS8
         qy3nxoXgeJkOPYowDozp3K3tBwmTY27dcvg4U4q61ltrdbRs4MZNqHEqLC9pvT+SIe7D
         D7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773254492; x=1773859292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jm6aBQFmhV5MNb69YAxeMe+wLv1vCAxTIamZijo4ixo=;
        b=JPlXN/DMc7iAQNa0aArqFQYCcxnJvMs3vK4t6Bj5DD971m1EwewTZ7ctMA6J0Bbxg7
         ci93zzYGHOwEmTb38IL8PkzO/gH1e0Jyazi/wTUYYZUrhFW8JSwfSppqdz9fmpQOa2XK
         x4n+LOW/FleQnwAzhI3PoOqYcMDOWZOQvQdG1Idc+q+aFVAvS23s5anqWUi+q60oOkjz
         MWyICzPpVdBcF2XAIi8Z8TUJfhiXjgkLCgC8zYIL8I3Q3yvJikqEXhOMyw1zQZ7ojrmJ
         WSrqOl1MIq2jgub0gI30pge31nKodzQLnDRf0E+/fszrrCLEJacYTSF/Q4hI9gOLipGL
         mwlA==
X-Gm-Message-State: AOJu0Yz1WVjw542GEUx2ktsq9f7OXkrEMqFAYvdsdE3EzImCGk0zSrL7
	vKTbuDo6Us6jvXf7SLlOK7Kpaus3RLNxiGMep/H7HX390RbIqz/ZUEyf
X-Gm-Gg: ATEYQzySIw7rN+81jKjDlMRWcKi9OsqAXg4HPwOBH9SFjdLRldgJUmOofbzWclgldBA
	rlQH6RUklzdCXNlyujt6SaPDI44S7ieM4czLRfLpdDwEtc257scyaHlrSL5AzEMLNMu9+gk4XhQ
	TeVWcx/bVV8IlIsKugYgt8uAms3C8CFIVRJYnHhglm3bhiBhbDl0zMMUNLYXQFP74IGZrFYoSkx
	FKsVUcCQq7X9kAniTdnKfyW0i4vqO64395vwM0v5/Pr+lUHIIi3ATzb8NN0HnjZ4AyfyMQcU4r2
	hQ5MRri2Ds80z48rvI9buLfCm48tQO+X+4dxjM/WC4wFq8LiROqyh1TMhXXgCFubb809KkeuS2v
	DtfnzqIlSuVmVL9rD0iBgpboBPeJ+VirP9rDeUywhg0/5KbIz2A0BinA/eJMM+m7WF+NxaQ0Q7X
	yyf3uQNLTXADLbymQIeia+QB0mmnqtP3WwzSNDqNQKYXda
X-Received: by 2002:a17:902:ef4c:b0:2ae:aba2:f915 with SMTP id d9443c01a7336-2aeae7ba3b6mr37880165ad.21.1773254491602;
        Wed, 11 Mar 2026 11:41:31 -0700 (PDT)
Received: from hyd-e160-a08-1-06.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aeae35f0dbsm30211155ad.69.2026.03.11.11.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 11:41:31 -0700 (PDT)
From: Rahul Joshi <rj5547884@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu, 12 Mar 2026 00:11:04 +0530
Message-Id: <20260311184104.499201-1-rj5547884@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rj5547884@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GT6X4CYJDOMS3VBFJW7ZKSPPZDINESNX
X-Message-ID-Hash: GT6X4CYJDOMS3VBFJW7ZKSPPZDINESNX
X-Mailman-Approved-At: Wed, 11 Mar 2026 19:05:03 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rahul Joshi <rj5547884@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: add comments to locks and fix alignment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GT6X4CYJDOMS3VBFJW7ZKSPPZDINESNX/>
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
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NEQ_ENVFROM(0.00)[rj5547884@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.796];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 4830F26904A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The spinlock_t and struct mutex members in struct gb_tty lack
comments describing what they protect, which is required by the
kernel coding style.

Also fix the alignment of the wait_for_completion_timeout() call
in gb_uart_wait_for_all_credits() to match the open parenthesis.

Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
---
 drivers/staging/greybus/uart.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..52a84a68049c 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;
-	spinlock_t write_lock;
+	spinlock_t read_lock;	/* protects iocount and oldcount */
+	spinlock_t write_lock;	/* protects write_fifo and credits */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;
+	struct mutex mutex;	/* protects disconnected flag and device state */
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
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
