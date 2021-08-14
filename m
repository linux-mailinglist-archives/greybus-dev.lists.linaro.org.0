Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7593ECDE1
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 07:00:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 28030634C9
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 05:00:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4B73362CF8; Mon, 16 Aug 2021 05:00:14 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9FC5B60B55;
	Mon, 16 Aug 2021 05:00:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3A2DD60ECA
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 17:57:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2BC17610C6; Sat, 14 Aug 2021 17:57:04 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by lists.linaro.org (Postfix) with ESMTPS id 1DE0860ECA
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 17:57:02 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id i22so1394911edq.11
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 10:57:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HroRd12HmrCYe8trgy762PzKYxaKFWieH1+iL5Ovs98=;
 b=ZSoVeipnm2sVJKSjl9rYDjsSY2G5ddE5AJt2kIszlfN39dX85Z/u5xM83scPUUCECw
 C/t6hJR1aBFCONYVeu3T5/DECj6VaPXbUpT+RcD5VrARCGFFruv17c7tu/ptBpYwt7yr
 ZVJLL1DoEOgU55gTt5nb41njsherhC+cIPbVy7Mq9P87+vU3ulhwdfnUgakdYgPvVeQv
 RdhmA9S5OVPrW9F/FRe+UNec5OG9X6k/zfqWiUM0HmcVXQS7JtDeVVv/GXJzipxs9kmP
 edmkjg2oVVr+md6c/5vGWBe7Rq8LRNfO4hjwt1pxoJihtwPIHCj2bs1Bs5949jPwBS0f
 Z1Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HroRd12HmrCYe8trgy762PzKYxaKFWieH1+iL5Ovs98=;
 b=jzz36ejJkLIDVrMlm2gSkulAw10CLkDSigeAPH6Zza9coqLBJdFW1I7oEKuLGxgs0q
 vyi4FtHSuIK6nkf59vs3hfQdI0w4DKuW71PLvGodnT+y49COQ4CCbJh9kwhnx3vv43FZ
 4TFZNai+fJI2J4kSl8G4TG/RNTfftmTSerTYwTyS0SeqhisqGrqwyGMYWKJ0qWe1ztZA
 J8otN7dpWN0ioJACt2skbFEl1KM/9xQdn9iVGICf/PnDXTRva7s3gu8I7acVXB0p9Xjt
 5KCHZkb8Yln+U/jgtfvmJIVvwV7ouNIphDfqwp/6mFTSdp64jLT1OQaZ8IbwEUoCv+sk
 79rQ==
X-Gm-Message-State: AOAM533s9K9fGuesw5GjwUHeH3g4dfTTCPUcVfW5nUnxdlvNmPOYJWPo
 vKUG3EiJL/ZJQuyGGt0aklg=
X-Google-Smtp-Source: ABdhPJzeqNfKAPjUM6vJITkB5K1o3SD6RGIcWXB1Y3f3ZpilwSnSHd+vP8PWUuoQOxH+Hna1Y2URQA==
X-Received: by 2002:aa7:cb19:: with SMTP id s25mr10529501edt.194.1628963820861; 
 Sat, 14 Aug 2021 10:57:00 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
 by smtp.gmail.com with ESMTPSA id j14sm2526614edk.7.2021.08.14.10.56.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 10:57:00 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sat, 14 Aug 2021 19:56:57 +0200
Message-Id: <20210814175657.13403-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 16 Aug 2021 05:00:10 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: Convert uart.c from IDR to
 XArray
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
 kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
is more memory-efficient, parallelisable, and cache friendly. It takes
advantage of RCU to perform lookups without locking. Furthermore, IDR is
deprecated because XArray has a better (cleaner and more consistent) API.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---

v1->v2:
	Fixed an issue found by the kernel test robot. It was due to
	passing to xa_*lock() the same old mutex that IDR used with
	the previous version of the code.

 drivers/staging/greybus/uart.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 73f01ed1e5b7..5bf993e40f84 100644
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
@@ -33,6 +33,7 @@
 #include "gbphy.h"
 
 #define GB_NUM_MINORS	16	/* 16 is more than enough */
+#define GB_RANGE_MINORS		XA_LIMIT(0, GB_NUM_MINORS)
 #define GB_NAME		"ttyGB"
 
 #define GB_UART_WRITE_FIFO_SIZE		PAGE_SIZE
@@ -67,8 +68,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
-static DEFINE_MUTEX(table_lock);
+static DEFINE_XARRAY(tty_minors);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
 {
@@ -77,6 +77,7 @@ static int gb_uart_receive_data_handler(struct gb_operation *op)
 	struct tty_port *port = &gb_tty->port;
 	struct gb_message *request = op->request;
 	struct gb_uart_recv_data_request *receive_data;
+
 	u16 recv_data_size;
 	int count;
 	unsigned long tty_flags = TTY_NORMAL;
@@ -341,8 +342,8 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	xa_lock(&tty_minors);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -353,19 +354,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 			mutex_unlock(&gb_tty->mutex);
 		}
 	}
-	mutex_unlock(&table_lock);
+	xa_unlock(&tty_minors);
 	return gb_tty;
 }
 
 static int alloc_minor(struct gb_tty *gb_tty)
 {
 	int minor;
+	int ret;
 
-	mutex_lock(&table_lock);
-	minor = idr_alloc(&tty_minors, gb_tty, 0, GB_NUM_MINORS, GFP_KERNEL);
-	mutex_unlock(&table_lock);
-	if (minor >= 0)
-		gb_tty->minor = minor;
+	ret = xa_alloc(&tty_minors, &minor, gb_tty, GB_RANGE_MINORS, GFP_KERNEL);
+	if (ret)
+		return ret;
+	gb_tty->minor = minor;
 	return minor;
 }
 
@@ -374,9 +375,7 @@ static void release_minor(struct gb_tty *gb_tty)
 	int minor = gb_tty->minor;
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
-	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
-	mutex_unlock(&table_lock);
+	xa_erase(&tty_minors, minor);
 }
 
 static int gb_tty_install(struct tty_driver *driver, struct tty_struct *tty)
@@ -982,7 +981,7 @@ static void gb_tty_exit(void)
 {
 	tty_unregister_driver(gb_tty_driver);
 	put_tty_driver(gb_tty_driver);
-	idr_destroy(&tty_minors);
+	xa_destroy(&tty_minors);
 }
 
 static const struct gbphy_device_id gb_uart_id_table[] = {
-- 
2.32.0

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
