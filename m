Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKY7JFJboWmDsQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 09:52:34 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 267541B4B96
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 09:52:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 408D8400F5
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Feb 2026 08:52:33 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	by lists.linaro.org (Postfix) with ESMTPS id 592E83F962
	for <greybus-dev@lists.linaro.org>; Fri, 27 Feb 2026 06:52:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="G5QR/xML";
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.216.42 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3594623766eso1146959a91.1
        for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 22:52:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772175157; x=1772779957; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/me4FJ+d1aVpAIXm0mJoiSYOgYUY6c5yW2UB1Oq5vLw=;
        b=G5QR/xMLwKTP7ZUQoe5OPbRPQM86rclIcVGDRuIAsYZ34+Qfdlbd7qxrN18Ay4ItjL
         Ape5aalvOphI4pGaAMu8HNesWWFiynhzmeHp7FXGFcfSsu9vCpUzt/nH3W1SHi3YAYnx
         YJBOtEilo90VxzNBdHLkHvZ+7qcPEu/V/gAWoY+lekqMelqw5uwloK9KTGfdDkQZjgQ3
         LoWI46LgIBArIb5P61RiV59bPt+DkXk4YpX4O/eRXrlY2AvWbgIhrJ407xmCuLH2T7w2
         tFMbO5xd4TKBsehdF6/cy2WjC4HECT+hwwtCAiD4EmDLBjZk0HnT5HI6UbgfGyGnFVbP
         uBPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772175157; x=1772779957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/me4FJ+d1aVpAIXm0mJoiSYOgYUY6c5yW2UB1Oq5vLw=;
        b=o/i2dOZc5e9w1iS7ItULMzKUjugLz/qg4JWDUBm0MNlF892wZJWl0kz4RvcgmD4bs3
         erh96Iecyh/OkXbci8TbHghOTjHHa7qYTrLdcbnOjDJzqDMGh1wfZGouZP0TzvD0vazD
         lgfCYfF+fnEEMYSK4Rih/TPmOefTJmPO6QjGKwPcearUB03zFInnh0uiEsbLSZl1tj7L
         I6pvBu3F9zIj7+w+9RE0wNXH3hwWtsPT17e3xrz4TA+bThAyy9b5Y/A/XYzVcMprFEXR
         fFCxErffv2seamldOme03CRjHhkVapoxozKM9FePNqd4n2mI+hReV9kHnJ2lkvFV7FFN
         8L4A==
X-Forwarded-Encrypted: i=1; AJvYcCUwNW0+UbCXXoOymFaFVfpYdbdaTeE7BOXqh8KWvXowSZplQ5D9YoHbx2w4Kw8swNY0lelNM4G2f2ibmg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxXhUBmgGyNbIgCtpq7D5IGoD64uet/+h+DLxsZf5CrfWuZ+fQ7
	zbLNK8pjwJVu0c3E79c1/5XwMPhOJRSzuWfmMCWN3C8RWHsEuyFkuiEL
X-Gm-Gg: ATEYQzwiScI9MCjGz9LONE+TTF77Cwy5mGBschqKDLHuf8LAU/V3dn+ftQOT5LIwdyK
	8IKDdiKBmJy3nAxfQNpumg4qenZblxaVATGGqVLnZ6VD0jm0GHYrT1p/xD79sZVNCQiX+Fi4W+h
	VmLBuxnFaB3fvfDhpTu8f5Po3O381yObfY1dFfNMEaeZOENCFVJ0ZhBsRSR5qdHHAeT+BMDIQWb
	ha9GqZuislDId10CEcgsXXC54XyZD5A8TedCrMAHsJaXW6yK6om5MvWmCx/vyUeZZttuEE9Gkvy
	6bSJNGgLYupmbXSPycuUMxGhzsPnV53XsUV1ZSRj5suWBJhM84B/teeigXnfcwFCztH7Q4TxmIy
	GVoG+Ox0CYnfK7X8t39evNuvMd7bGedznjX1gXvkW1uZVjjaIW8fRzBZTHc8bhWfTliEIq6vcwM
	woZLPOVQxALtuG0/oXnFZIogjdWyC+O8h+ynUbiYAX24Loig==
X-Received: by 2002:a17:90b:4b49:b0:359:7eb:d91d with SMTP id 98e67ed59e1d1-35965ceb5d7mr1683755a91.26.1772175157281;
        Thu, 26 Feb 2026 22:52:37 -0800 (PST)
Received: from fedora ([2409:40e5:11f9:3821:4f9f:ee0b:d955:3519])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3593dcad6ddsm4149788a91.1.2026.02.26.22.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 22:52:36 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Date: Fri, 27 Feb 2026 12:22:20 +0530
Message-ID: <20260227065220.8039-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aZ_9V7cldGzWNDrb@stanley.mountain>
References: <aZ_9V7cldGzWNDrb@stanley.mountain>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6MXEMCJC3HOLGOYLX7C53XBGMV7ELEWG
X-Message-ID-Hash: 6MXEMCJC3HOLGOYLX7C53XBGMV7ELEWG
X-Mailman-Approved-At: Fri, 27 Feb 2026 08:52:27 +0000
CC: dan.carpenter@linaro.org, dtwlin@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: uart: add descriptive lock comments
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6MXEMCJC3HOLGOYLX7C53XBGMV7ELEWG/>
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 267541B4B96
X-Rspamd-Action: no action

Replace vague lock comments with specific descriptions of
what data each lock protects:
- read_lock: protects iocount and oldcount
- write_lock: protects write_fifo and credits
- mutex: protects disconnected state

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/uart.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index fe554eba555a..1e51818e34a8 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -50,12 +50,12 @@ struct gb_tty {
 	unsigned int minor;
 	unsigned char clocal;
 	bool disconnected;
-	spinlock_t read_lock;		/* protects read operations */
-	spinlock_t write_lock;		/* protects write operations */
+	spinlock_t read_lock;		/* protects iocount and oldcount */
+	spinlock_t write_lock;		/* protects write_fifo and credits */
 	struct async_icount iocount;
 	struct async_icount oldcount;
 	wait_queue_head_t wioctl;
-	struct mutex mutex;		/* serializes port operations */
+	struct mutex mutex;		/* protects disconnected state */
 	u8 ctrlin;	/* input control lines */
 	u8 ctrlout;	/* output control lines */
 	struct gb_uart_set_line_coding_request line_coding;
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
