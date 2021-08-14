Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D17F3ECDE0
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 07:00:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E0B9C634C7
	for <lists+greybus-dev@lfdr.de>; Mon, 16 Aug 2021 05:00:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1240160AD0; Mon, 16 Aug 2021 05:00:14 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C228D610C6;
	Mon, 16 Aug 2021 05:00:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5BF4360ECA
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 18:11:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4485F610C6; Sat, 14 Aug 2021 18:11:37 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by lists.linaro.org (Postfix) with ESMTPS id 3959860ECA
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 18:11:35 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id b15so24245576ejg.10
 for <greybus-dev@lists.linaro.org>; Sat, 14 Aug 2021 11:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HroRd12HmrCYe8trgy762PzKYxaKFWieH1+iL5Ovs98=;
 b=Qd3IPhzhatP3qAPIfGyD0FPyGBfD3JED6WHZdddh3tMRygq1BjKtDQsPFLof+NGPq9
 S2/zzTgzqfZ0GqttvfWXMaIQonB3EZQHotdcIY5lbHTvXfP8lEX2DzPSJZEo+T3mVRVk
 TE/32LC6fvEB4K2w6EjcZZMZlU9PiCDSmB6j1BuRwv3s1YDgRxOAk1HbYUDmFJcoEv4p
 NY4/DlFR7V5/UB9t393YTtNuehR/JpCtISx+0i2vEJVmYnwejeZiTSKtCktXSNVjvGaM
 Vk/A4cZ76fVTOc2EBnE7HxgP5H3WaHajbKBdxmlfHw2M3nEpc0NHbm+tqzm71WJl/5PO
 sbAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HroRd12HmrCYe8trgy762PzKYxaKFWieH1+iL5Ovs98=;
 b=BLadx4Ar80aj3js6luORwDUdZqHbUjFbSKzgmN/ud0Ix8W32wOa9/SNlRnOGZ1dz7Q
 EJqqdpv/FYi6xMhTd99hEkQVJ/Lbh2XbSjNd/sUcQRRXb8p0E6X1bUHP9pehmgv75pgU
 +Q1OYuKMteKVLVjNsXbGv3Sl2p7M+VcT/Sn7rD2vLKExVbF5WafjQwlX0JtJ9kuSF4JI
 QXUSpO1SDnF1kQ4i4K7DoNp20vo2Ib79OKDb4vRZ4+eUhV6xR4eXME2bR2KUfHR4yNpG
 WIJsBDagrMIUnEBdO4Lg3+EaD5Ut/qgp6WewFxxXcYdlX1oUgdFvYjnvG1Wi7RK2IHxz
 qdzQ==
X-Gm-Message-State: AOAM532CRSirO5JAcjz4Cl8JHoUVTulgKuQB8DEmhPk9GLYxpuTuk6sl
 tVhB5jRG6srpTpV6hCrSywo=
X-Google-Smtp-Source: ABdhPJy+9MC4Tbn8SqweBJ7OV7wehX53FRl+nRPdIw7sUHqhXOCtu9KA96mk6bqKECYnenGrt5a2Ow==
X-Received: by 2002:a17:906:c013:: with SMTP id
 e19mr8517616ejz.389.1628964694186; 
 Sat, 14 Aug 2021 11:11:34 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-109-211.retail.telecomitalia.it. [79.22.109.211])
 by smtp.gmail.com with ESMTPSA id e22sm2500749eds.45.2021.08.14.11.11.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Aug 2021 11:11:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sat, 14 Aug 2021 20:11:30 +0200
Message-Id: <20210814181130.21383-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 16 Aug 2021 05:00:10 +0000
Subject: [greybus-dev] [PATCH v2] staging: greybus: Convert uart.c from IDR
 to XArray
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
