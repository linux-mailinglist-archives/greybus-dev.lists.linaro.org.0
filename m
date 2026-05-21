Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJPwIyQuD2r+HQYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 18:09:08 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 547A15A8EBC
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 18:09:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B7344098F
	for <lists+greybus-dev@lfdr.de>; Thu, 21 May 2026 16:09:07 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	by lists.linaro.org (Postfix) with ESMTPS id 421683F751
	for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 10:13:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BvDbCOUL;
	spf=pass (lists.linaro.org: domain of luizcarlosmdea@gmail.com designates 209.85.217.50 as permitted sender) smtp.mailfrom=luizcarlosmdea@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-63a3977145fso1796243137.1
        for <greybus-dev@lists.linaro.org>; Thu, 21 May 2026 03:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779358402; x=1779963202; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rILg+oMh1z0s8sO4ABPHVZeTYgFcKY4qxnY9gNQ6FeI=;
        b=BvDbCOULJd9Ghv+GP6aRyjD6l5kgZiP6jHLM5gn76xBE2NsvxF5DIn9R8CXefvdHGp
         Eq+gIDkm9OoZ8lWln+x89sJB3ZoSkaScWGYREuqVhdscNt3+lgsxbBqIl6rl9wrVtCc3
         DEjukSfPbGDwfvBTnHt7Cbn9ftSs59VOhvEnYFjVlMl5nrJGDlzPqBSpNnYcOPKh29Oh
         fvySVRoh5D5QnedLQ7U0ibIUWm7RQ8q5/InchQZcOrTg2oAb8PnKJm8uAwMEjEhwZkSx
         IjETi21EatDDRD6Ae+fq0FHHYWWy1Xdj6+pFaCug69PDocfGr4Iuei8VwolVuAav8Nzp
         0fqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779358402; x=1779963202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rILg+oMh1z0s8sO4ABPHVZeTYgFcKY4qxnY9gNQ6FeI=;
        b=Ij0AyEAZWfweAUJW0N/9p+qEr+IaqsE2UN/qA5AuT01HhgC0moV7K5Ds5uW5+PWkxL
         LXLK6+gdaQuAfz9zvKF012A1bvBo51lxxrGm65izOytEKftAQ/o5ermj0YRUeMrC0JfO
         u5BHlEqBQIIr9h6nasMMFfK+D1yDVN4n9XZHK3ct5vgu2U1j8eSGVrLMzCow1eDfYyiz
         xekimQrYo5148ES3bENh0miCWUMt1zWwSaMbGcGC1rWjGfuzF/AwbF1UnbyjcSWXE0s0
         CdUdZGcBDM7aS8/+xF3wMXP0eGfGUcfWGJ209r+qIaOdduLERsii85wT4OBlFioIEScK
         sAJA==
X-Forwarded-Encrypted: i=1; AFNElJ/zApZi/LaaGpmpoW0ETtzjXmGUaFeUhJAPVqXtge0PCYHZDe1Nf7b3uF03zmSQ2OYL3OXaeraxGM6t3w==@lists.linaro.org
X-Gm-Message-State: AOJu0YyI4MFfox3l9HEGr+1QKxU3Z8LU1gKnrAXFnv683b3YaFRGIqmb
	KzIUo/iHcEUln5BWkRLfkIFLARwHpWU/aR62JGaZhc36lnvVcAiXk9rh
X-Gm-Gg: Acq92OHQVjKPmVpbZT+YTP4cHtrbZuttX7X6bSL6/MRXv6CbHX3f3+K2KfcOwMDsyNE
	fvsSWUgCZhup6I6PGFbdT0OFLwRTkJNa25zmUa9hpwvifVfnLPoBmFBBlNPj1CUvvMqO/gcriRL
	CUz5/tm9yjrmN/Ye/6hyQ0y6eNkIigZxlIVb6B+t90Dt2XX2fYgI+RgPqO/mG6K0xxADaP64rwd
	vKHLdYzYVm3+whyzp87kSud5B0jz93gvX8s5+7eTZvit4s3O1WmhrlM0GhJ4yV3bIHJvuixkjw8
	677lLgT8l0hgU1abvHnziITYHZFh900FtEmD0S8fhLEyEjDzw8JplVsLNrZujXltmVvWhUjDaKN
	W/F+WnFnGdjDRkSvtUhVdVq/TuAIxxlLwuXw5uECfehPrZQ4Oi7IcZHlz5a9+F5njAQF0gqZ3AQ
	xzHr6h8P1xnwClh1M9BnhaAqa1C0/J/sM=
X-Received: by 2002:a05:6102:3ec5:b0:650:aa33:5dd7 with SMTP id ada2fe7eead31-6738b86eb96mr974309137.2.1779358401570;
        Thu, 21 May 2026 03:13:21 -0700 (PDT)
Received: from arch ([186.195.35.248])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5857361b267sm136686e0c.11.2026.05.21.03.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 03:13:20 -0700 (PDT)
From: Luiz Carlos <luizcarlosmdea@gmail.com>
To: David Lin <dtwlin@gmail.com>
Date: Thu, 21 May 2026 07:12:45 -0300
Message-ID: <20260521101245.5540-1-luizcarlosmdea@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <2026052154-spearmint-eleven-1121@gregkh>
References: <2026052154-spearmint-eleven-1121@gregkh>
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: luizcarlosmdea@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XZFNZKJ6CNMNJ2PSFNAP46KFXWZ3S4RS
X-Message-ID-Hash: XZFNZKJ6CNMNJ2PSFNAP46KFXWZ3S4RS
X-Mailman-Approved-At: Thu, 21 May 2026 16:08:59 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Luiz Carlos <luizcarlosmdea@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: uart: document locking and fix indentation
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XZFNZKJ6CNMNJ2PSFNAP46KFXWZ3S4RS/>
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
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[luizcarlosmdea@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email]
X-Rspamd-Queue-Id: 547A15A8EBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add comments describing what the lock fields in struct gb_tty
protect, and fix the indentation of the
wait_for_completion_timeout() call.

Signed-off-by: Luiz Carlos <luizcarlosmdea@gmail.com>
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
