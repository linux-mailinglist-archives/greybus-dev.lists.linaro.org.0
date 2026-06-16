Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +GroMqNTMmqTygUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 09:58:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B761697525
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 09:58:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Uu3o1kyo;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E78740A52
	for <lists+greybus-dev@lfdr.de>; Wed, 17 Jun 2026 07:58:26 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	by lists.linaro.org (Postfix) with ESMTPS id 4D449401BA
	for <greybus-dev@lists.linaro.org>; Tue, 16 Jun 2026 19:07:14 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c858014845aso73193a12.1
        for <greybus-dev@lists.linaro.org>; Tue, 16 Jun 2026 12:07:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781636833; x=1782241633; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tzZlidm2qPXvg0e3PNYKFDx1qe9VwZ9guLj+3iKFXvk=;
        b=Uu3o1kyoNlxeXouu4Qabef7GUQ0K9/pE1CaLC/QIql5O7XY/EQZxxYfAKz1G9AyKzN
         VawBXzZebdMvrSS2mBOaqs5Rn1nCvPqER9zvK9s+coSRUkqlF0A/pDhNyVNNfTex0lo7
         LOiXy99Ebm5yvoaglhZgUJg6w9J1RAtSCI4W2LNkDpG2PyTQyOTALOWKx2J0W8rm8JYy
         xjMtowBgxdVPam6iaOSJsfUC8owertYPXdMu816tH0w8UK3UwNM4MYvym3nhqs4LF1Ks
         zJY/o9zGe9w56Wq4JMlusIInC/Jt54Nl4WoGF/JFbHYIhNME0RnmreuSgKk5WNtYm16l
         85Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781636833; x=1782241633;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tzZlidm2qPXvg0e3PNYKFDx1qe9VwZ9guLj+3iKFXvk=;
        b=GttNYJrqrhpvTxU9CkJwYFjulodnwCh0c/hPdREYjsKsaEG+CkZoX1xZN5E1hZN43G
         BGfJd4wRESRELpCwyUhivE9fci1zuqtF+k2S3dy41OPXzUjWRcxuG12nve6szb8VDrWe
         VcHu+WRsoQK6AxFr5fpWeCpFAhDh0RmIGLOvbshkdCjCoKmSiVGFlqDQNiOpwcjUFXzM
         ts+CJ4mRuLYyHZ/D4sQcEYvbG9NDohVwT1i1nSifAWjrrVGGY4xG1iil4PlwJzfgC11T
         zGMgiQ2Z94UUFEoPzig1Mbf7EnTLR5i8ELNHuOYM+hbvcWCjJ3Ozd3xOjQs0bJ84iVJg
         tlgg==
X-Gm-Message-State: AOJu0YzSD1h8/DanVR8DuTK91Ads57EfpXBw1bKXwUFj2d7Gbf3T1mTv
	oomms9g7nqJ1jCNguGt7zf3Fn+wP8JYBU9iOPkpQ9WTAL4uSH5AQF2ZK
X-Gm-Gg: Acq92OFec0CAz+SqHMYmxxqUNMpMXHGH1jvxHf0VAqB2TLU2kaFqzwgDi0lI3hfSW9C
	zpqhpY6Wj+z3hYhKI5HgXOFS2H/zKILUT+cK74zYYm2I7MRX8L/+MwyoB1lvSvLPin6zbTJOqTt
	UyiPuvCeO1entXVsvNwG/AdVnuvmlG7Uh0+utu+P5V/nx24bKf/w+QzmTPG4AA6it840sDXquiW
	GAPOpAQ7zYIfgNJ/rnhWU0aK4eIYrlx+ToOWLe+LA8/oBZoYU3TcXB8ABRbZwDq3GowxIXInOXy
	CAIlmF3Hca17OwsOeWOOdm4WMxNzLhrUefs2y1AdhxMpv0FHEhyBvQyCAVInU1HXVcOYYvvLz1Z
	R9o89LZdicetp4UaXrgW/Ri08pYbQ92ci6qKcc+ByE/stg8dw0SOrInKikBKb9Qyk7zCaScC+sI
	G+0S5G6pG7btGei2Klv4xGPizf0GjM66w+2qhkLctzZ2YwBkYXwZZTfGlDxuvo+Jn0OSj2lY+zh
	JHyzPf+eQU0nS70bRxnz/CjCjuUTOUGqDvS51d/8TuRYXKPMjPJI/kyr6LpOhRxTvntxm5bVw==
X-Received: by 2002:a05:6a20:4329:b0:3b4:613f:90b1 with SMTP id adf61e73a8af0-3b8a8e39cecmr813920637.16.1781636833301;
        Tue, 16 Jun 2026 12:07:13 -0700 (PDT)
Received: from bloom.localdomain (S010680dac2bce256.cg.shawcable.net. [174.0.186.197])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434accbc89sm14125521b3a.15.2026.06.16.12.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 12:07:12 -0700 (PDT)
From: Jack Lee <skunkolee@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Tue, 16 Jun 2026 12:07:03 -0700
Message-ID: <20260616190703.28411-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: skunkolee@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VPELU44Z7RZLBA3ODVVOVH2FXLDJU4SL
X-Message-ID-Hash: VPELU44Z7RZLBA3ODVVOVH2FXLDJU4SL
X-Mailman-Approved-At: Wed, 17 Jun 2026 07:58:18 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Jack Lee <skunkolee@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: replace IDR with XArray
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VPELU44Z7RZLBA3ODVVOVH2FXLDJU4SL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dtwlin@gmail.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:skunkolee@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[skunkolee@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skunkolee@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 3B761697525

DEFINE_IDR is deprecated in favor of XArray. Convert tty_minors
from IDR to XArray, replacing idr_alloc, idr_find, idr_remove and
idr_destroy with their xa_alloc, xa_load, xa_erase and xa_destroy
equivalents.

Signed-off-by: Jack Lee <skunkolee@gmail.com>
---
 drivers/staging/greybus/uart.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..30afcd0caa14 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,13 +22,13 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
 #include <linux/workqueue.h>
 #include <linux/completion.h>
 #include <linux/greybus.h>
+#include <linux/xarray.h>
 
 #include "gbphy.h"
 
@@ -67,7 +67,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY_ALLOC(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -342,7 +342,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 	struct gb_tty *gb_tty;
 
 	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -359,14 +359,13 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	int ret;
 
-	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
-	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
-	return minor;
+	ret = xa_alloc(&tty_minors, &gb_tty->minor, gb_tty,
+		       XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
+	if (ret)
+		return ret;
+	return gb_tty->minor;
 }
 
 static void release_minor(struct gb_tty *gb_tty)
@@ -375,7 +374,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +983,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
