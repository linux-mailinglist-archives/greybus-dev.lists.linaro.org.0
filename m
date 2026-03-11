Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yErKMU/1sWl7HQAAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 00:05:51 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B89426B1FD
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2026 00:05:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D4C03F76C
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 23:05:50 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lists.linaro.org (Postfix) with ESMTPS id 3B5D73F903
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 19:42:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=hKG6dtxN;
	spf=pass (lists.linaro.org: domain of rj5547884@gmail.com designates 209.85.216.51 as permitted sender) smtp.mailfrom=rj5547884@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35a04d6aeb0so138403a91.0
        for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 12:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773258145; x=1773862945; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MIt/lxrkvODN0l6RiEURES04wifHtipdKzjIGMWChwE=;
        b=hKG6dtxNso0etTE/k3s0Gk4GYYDceni1R8fHxbv9LyMUoMnZuE2lt5gaGDQxJcs2fW
         2OKIe3asiUSXDRJ7sj8Vyx1hArxE3xJ4lB8xQ+Po/RwHsxGIl00I/dNeGxrCuKdgVlwb
         OGbGNJ/8td9xUMBU0Yqb920O7HH7SdpM7YAaKGwV+R0fJVV0wEgo6UhACGmNkqVpbrgU
         650s88soXqL/kU3wJVezn1wIpai7fUaAv1u5QP+rfWbnesqRyjPHsN8/wkvZKjlml0/R
         eWQpP7BBy8rs3TDj4AkZjHuxdNZxz9Sib1hYJyAMwQ/FC+igcr8NRi3Kf/ZyD87ZyLm8
         yN9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773258145; x=1773862945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MIt/lxrkvODN0l6RiEURES04wifHtipdKzjIGMWChwE=;
        b=n4TVtFczEb5p35WS3/PkoZm2CMxU9wpqIKccQxxyywa4Dn8Wwe6giqOPGqQYEkD+1x
         3CHzxrYr8dfzFe+8jmUILlNNWl/+l723UznKG1N1zxC6gZsFhmYhTOcqQPF9fwxampl7
         rvrToOxoitQFuzUGlBLJ4qHEqEmoh0iQ5os78NW1lGo4HGb3M0z1NQQ+kcSCYccyJWum
         EYYswNLHp7a4cIvkVanV/MuL5y+mDUoQ3VnpuG8Lh3tOhl07axaU6LI3jjOM1NgG0Lrs
         1Fhn/BSm+phv5gbYSNfVlNzgzHWayRAA76ZtjcO2S8ScanYWA5RKqgp/e4fCM19mcSI0
         2uRA==
X-Gm-Message-State: AOJu0YwGtW/p63oKByLdZYMAV6sKbBSEabp8LjIceBNSC4+XuJneX2fz
	crgKydydoiI3ioNnrQnvkJYcJXsv4kok8MxJQwahXtHbIK8yzQxYSk9Z
X-Gm-Gg: ATEYQzxrRGQKrR6fqb6pb/hfc0GWFc+jH5y6zQp4ya1J+OfvPoLki1Ho/UH3hKo+9K6
	K0+08l4T62xAw603mDWe7xmnU/B+8izMqQJ6stoBL0ngeiR9uBRKYwx6MgDcgDudrWrvBwRZJ+N
	FyDsuDs5H5Fc4eqMVCH1BXkQiD2qXcqA9c3PbbZSPCGfEGsfEynFqmsPBF6jc9M6OPli7bFeLvh
	n+dQV5I4c59Y+j0spJt7OTyMNzGQ7ucLnF5wpSBVeC5KsuRTDuV4uJAn+H+a8MdhRvduJ3NJMPs
	7tf6LsZs3JuvmviK10OJnkmxwnYJrmm3zZzFENwTRBJ1A6qyJjBMbMCDTZg/GZ9J4atERd3XYhQ
	O/SbaVhvLrR+Z8ECdszJaXkKIPbvloBS0IDSDOtys+4h/Bn3MEI6vcjWy0RgBkD7RTfIOVXw5bd
	XfpoAFN60lNobd2QXTwvL43/8l186lg1qL9tc436AvvsWw
X-Received: by 2002:a17:90b:28c4:b0:359:409:49bf with SMTP id 98e67ed59e1d1-35a0129e642mr3487580a91.21.1773258145140;
        Wed, 11 Mar 2026 12:42:25 -0700 (PDT)
Received: from hyd-e160-a08-1-06.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a02ba23adsm2965131a91.0.2026.03.11.12.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 12:42:24 -0700 (PDT)
From: Rahul Joshi <rj5547884@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu, 12 Mar 2026 01:12:00 +0530
Message-Id: <20260311194200.542783-1-rj5547884@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rj5547884@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HYWECWUE4M55BHI2HWREN6EBGBSBMPSH
X-Message-ID-Hash: HYWECWUE4M55BHI2HWREN6EBGBSBMPSH
X-Mailman-Approved-At: Wed, 11 Mar 2026 23:05:48 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rahul Joshi <rj5547884@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: uart: replace DEFINE_IDR with DEFINE_XARRAY_ALLOC
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HYWECWUE4M55BHI2HWREN6EBGBSBMPSH/>
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
	R_SPF_ALLOW(-0.20)[+mx];
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
	NEURAL_SPAM(0.00)[0.803];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 3B89426B1FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

DEFINE_IDR is deprecated in favour of DEFINE_XARRAY_ALLOC. Replace the
tty_minors IDR with an XArray and update all call sites:

  idr_alloc()  -> xa_alloc()
  idr_find()   -> xa_load()
  idr_remove() -> xa_erase()
  idr_destroy() -> xa_destroy()

Also remove the now-unused <linux/idr.h> include and add
<linux/xarray.h>.

Signed-off-by: Rahul Joshi <rj5547884@gmail.com>
---
 drivers/staging/greybus/uart.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 7d060b4cd33d..bed3f35a6ec2 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -22,7 +22,7 @@
 #include <linux/serial.h>
 #include <linux/tty_driver.h>
 #include <linux/tty_flip.h>
-#include <linux/idr.h>
+#include <linux/xarray.h>
 #include <linux/fs.h>
 #include <linux/kdev_t.h>
 #include <linux/kfifo.h>
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
@@ -359,14 +359,18 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
-	int minor;
+	int retval;
+	u32 index;
 
 	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
+	retval = xa_alloc(&tty_minors, &index, gb_tty,
+			  XA_LIMIT(0, GB_NUM_MINORS - 1), GFP_KERNEL);
 	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
-	return minor;
+	if (retval < 0)
+		return retval;
+
+	gb_tty->minor = index;
+	return index;
 }
 
 static void release_minor(struct gb_tty *gb_tty)
@@ -375,7 +379,7 @@ static void release_minor(struct gb_tty *gb_tty)
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
 	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
+	xa_erase(&tty_minors, minor);
 	mutex_unlock(&table_lock);
 }
 
@@ -984,7 +988,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	tty_driver_kref_put(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
