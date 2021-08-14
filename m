Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDAF3ECDDF
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 07:00:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DEB3E6098B
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 05:00:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B2FEC61A28; Mon, 16 Aug 2021 05:00:13 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51D82609BB;
	Mon, 16 Aug 2021 05:00:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 347706057D
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 14:56:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1EFB26101C; Sat, 14 Aug 2021 14:56:20 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com
 [209.85.218.51])
 by lists.linaro.org (Postfix) with ESMTPS id 189F36057D
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 14:56:18 +0000 (UTC)
Received: by mail-ej1-f51.google.com with SMTP id z20so23760885ejf.5
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 07:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tImfbxVWdTlhcDIkyDpmWJXKvDRSXiEiMFTfwAJNv9k=;
 b=EHOLnNLMMlJR/Uf4G7WZg2ue5EzYgozA1tZhnmkGZL5aUZNrMjUNaGz7u/HQFPrn8c
 GDxhbqm255pZS5aMxsgSHYKHdfCtFw8ipL0j/u5frb2Lrq7MHJi6rvj+X9/gkH6iDFLU
 hRC13RHdoKz3gyqxy4jY6XRXsutm8rz74PBKwdG5HCEPWdynaxmqCwlUck5pk+ZVxWJ5
 kh6ebzSSnO3dnfgQ5qM6xstAczJlXPk+huM+m/DMsQT6yjFjgjVwZEEdzhRSZ6cSvZZA
 4KjRQg5bPAx+cT06RkY65jihFJo0ugC00qH+ATWkNKe2zMVFwziGFmZ6Q1X9/KFQQv6w
 nIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tImfbxVWdTlhcDIkyDpmWJXKvDRSXiEiMFTfwAJNv9k=;
 b=Y31fu9u8UAo4yGKE9hjRcV2GNe4tPXYjU3AMe/aj5BAI8r54J0CmrFYlLu9KxEg5zR
 NKT0XNovdmpy+TUYrWmN6cWIe71/nbalX0L2N5CMa/7weqWkcNUeGpEwQC9XJfMkivA/
 WEFL9bS6uW9Y0XMng5lJFim81oVo5C4syUA9O0FYks3WkI9lnCMp67sqvms/owytu1UQ
 RJxB4hR039dL004mdQFej4QpaD/vcj9VjM72ULA3rZ8tHparYsjI/VV0zyeoeiyCAQFY
 Ixgicn5vajAaPektg9do6B56c6h8Vpt7mJHgKBTDsoWjjtpgjjffkTgl5zpXnpFfBMSz
 mzZg==
X-Gm-Message-State: AOAM5324j7JWmv6ceWG26HALFa/BZg3IzMuq3yZAuib6hKwI8ROzuqqr
 qdKcywPYYNTDhD+WVnHRxsI=
X-Google-Smtp-Source: ABdhPJy9N0iCyoePDC+ZEuwq4QPMU8YnqadyfCQ5pwETUuEVCcgbCTrHajg881i0eJusf9tYz2gnpg==
X-Received: by 2002:a17:906:b052:: with SMTP id
 bj18mr7840960ejb.55.1628952977036; 
 Sat, 14 Aug 2021 07:56:17 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
 by smtp.gmail.com with ESMTPSA id v23sm2336373edy.21.2021.08.14.07.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 07:56:16 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sat, 14 Aug 2021 16:56:13 +0200
Message-Id: <20210814145613.6493-1-fmdefrancesco@gmail.com>
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
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Convert greybus/uart.c from IDR to XArray. The abstract data type XArray
is more memory-efficient, parallelisable, and cache friendly. It takes
advantage of RCU to perform lookups without locking. Furthermore, IDR is
deprecated because XArray has a better (cleaner and more consistent) API.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/greybus/uart.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 73f01ed1e5b7..7c19156534ca 100644
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
@@ -67,7 +68,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
+static DEFINE_XARRAY(tty_minors);
 static DEFINE_MUTEX(table_lock);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
@@ -77,6 +78,7 @@ static int gb_uart_receive_data_handler(struct gb_operation *op)
 	struct tty_port *port = &gb_tty->port;
 	struct gb_message *request = op->request;
 	struct gb_uart_recv_data_request *receive_data;
+
 	u16 recv_data_size;
 	int count;
 	unsigned long tty_flags = TTY_NORMAL;
@@ -341,8 +343,8 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	xa_lock(&table_lock);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -353,19 +355,19 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 			mutex_unlock(&gb_tty->mutex);
 		}
 	}
-	mutex_unlock(&table_lock);
+	xa_unlock(&table_lock);
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
 
@@ -374,9 +376,7 @@ static void release_minor(struct gb_tty *gb_tty)
 	int minor = gb_tty->minor;
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
-	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
-	mutex_unlock(&table_lock);
+	xa_erase(&tty_minors, minor);
 }
 
 static int gb_tty_install(struct tty_driver *driver, struct tty_struct *tty)
@@ -982,7 +982,7 @@ static void gb_tty_exit(void)
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
