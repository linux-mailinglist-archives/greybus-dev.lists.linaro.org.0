Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E073FAA43
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Aug 2021 11:23:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE4BB623DC
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Aug 2021 09:23:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 678EE62164; Sun, 29 Aug 2021 09:23:05 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DA5B360B5F;
	Sun, 29 Aug 2021 09:23:02 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BC9F660788
 for <greybus-dev@lists.linaro.org>; Sun, 29 Aug 2021 09:23:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A95F660B23; Sun, 29 Aug 2021 09:23:01 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com
 [209.85.218.52])
 by lists.linaro.org (Postfix) with ESMTPS id 9B68960788
 for <greybus-dev@lists.linaro.org>; Sun, 29 Aug 2021 09:22:59 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id h9so24072896ejs.4
 for <greybus-dev@lists.linaro.org>; Sun, 29 Aug 2021 02:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+dqt6XS4ZNHrivjUXrH9fxmNodvBLxJ0+D0nFk09Hs=;
 b=JU8XOd2b7Xq5IKjUsiaaBVKqQ3ZtsFJwsPoNIih8o+KUk46lR4ecr611my62NK94Z5
 cLZlHegUnhQo6eN7sxiYLPLd8CIrtDYVLdwdtExbixGnYWFDEtkzsa11hQ/XG2rPr6mj
 RFadpuwGKvGyQGDZtydcVxY6RyAFMU1Tw44uD4EZhKQhbEUw4IVrdf0EK0tkinCyvFCO
 +lotJf7sryrklWXPjz0BHrU88LxcL6cgcP6lFcUZCXcQFP2d9RNBKMCdmK/CvckqjQwJ
 98Zcc5y4MDfDcgf5akQMDpnikq15HZn3lw+PvDjhQNydQomY60Im6u5BjleJdZ2rEZmX
 bUdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=e+dqt6XS4ZNHrivjUXrH9fxmNodvBLxJ0+D0nFk09Hs=;
 b=Vv9D0YP2Qp1U10N7dY3gfdSy7cpJsIwdl/Ox5PhTXsORGSpfGBL2O2eCNcEQYFwCMZ
 Z2Ns9x0fjWnexMWpsDWFgQU8JvEv2GVvs+PwpKrr8N8f3nQtSVyZjEBJ7RT/qZHZaBUb
 cu/NbIa4x4JWDrxFIbxb2FPIuGEsYsh5qGsSj1klMu+soAAWrCMusxPYtq5Avb9GsCWm
 sBcEtu5an19eAPZVccSGgBFkO8ReLF5w88KyBnmxoUw8IkrzCdQYnfX0EQVkfo+vg7PE
 x3y3SNPdg1bILUv9Cy15oQL9bRx5u7P77ks5CcR5A4ywSklEDOpX0i/7xvy2n2OI5rDo
 jTeg==
X-Gm-Message-State: AOAM533vghU0h5xG7i1x29k7+O7akgyECzuD4D6W9bXr3LO6YcHjdEl5
 noclEtCbQwGT9P5FxofKmkp0+mBwo6U=
X-Google-Smtp-Source: ABdhPJy6D7wvo+5iCtrPdFblc/OhtL1DNGesRrmldOnErYS5oePwvizVmEzgWREo4pwFRIlztOd93g==
X-Received: by 2002:a17:907:628d:: with SMTP id
 nd13mr19549239ejc.7.1630228978627; 
 Sun, 29 Aug 2021 02:22:58 -0700 (PDT)
Received: from localhost.localdomain
 (host-79-22-100-164.retail.telecomitalia.it. [79.22.100.164])
 by smtp.gmail.com with ESMTPSA id u4sm610916ejc.19.2021.08.29.02.22.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 02:22:57 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Date: Sun, 29 Aug 2021 11:22:50 +0200
Message-Id: <20210829092250.25379-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH v4] staging: greybus: Convert uart.c from IDR
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

v3->v4: 
	Remove mutex_lock/unlock around xa_load(). These locks seem to
	be unnecessary because there is a 1:1 correspondence between
	a specific minor and its gb_tty and there is no reference
	counting. I think that the RCU locks used inside xa_load()
	are sufficient to protect this API from returning an invalid
	gb_tty in case of concurrent access. Some more considerations 
	on this topic are in the following message to linux-kernel list:
	https://lore.kernel.org/lkml/3554184.2JXonMZcNW@localhost.localdomain/
v2->v3:
        Fix some issues according to a review by Alex Elder <elder@ieee.org>
v1->v2:
        Fix an issue found by the kernel test robot. It is due to
        passing to xa_*lock() the same old mutex that IDR used with
        the previous version of the code.

 drivers/staging/greybus/uart.c | 32 ++++++++++++++------------------
 1 file changed, 14 insertions(+), 18 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 73f01ed1e5b7..f66983adb51b 100644
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
@@ -32,8 +32,9 @@
 
 #include "gbphy.h"
 
-#define GB_NUM_MINORS	16	/* 16 is more than enough */
-#define GB_NAME		"ttyGB"
+#define GB_NUM_MINORS		16	/* 16 is more than enough */
+#define GB_RANGE_MINORS		XA_LIMIT(0, GB_NUM_MINORS)
+#define GB_NAME			"ttyGB"
 
 #define GB_UART_WRITE_FIFO_SIZE		PAGE_SIZE
 #define GB_UART_WRITE_ROOM_MARGIN	1	/* leave some space in fifo */
@@ -67,8 +68,7 @@ struct gb_tty {
 };
 
 static struct tty_driver *gb_tty_driver;
-static DEFINE_IDR(tty_minors);
-static DEFINE_MUTEX(table_lock);
+static DEFINE_XARRAY(tty_minors);
 
 static int gb_uart_receive_data_handler(struct gb_operation *op)
 {
@@ -341,8 +341,7 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 {
 	struct gb_tty *gb_tty;
 
-	mutex_lock(&table_lock);
-	gb_tty = idr_find(&tty_minors, minor);
+	gb_tty = xa_load(&tty_minors, minor);
 	if (gb_tty) {
 		mutex_lock(&gb_tty->mutex);
 		if (gb_tty->disconnected) {
@@ -353,19 +352,18 @@ static struct gb_tty *get_gb_by_minor(unsigned int minor)
 			mutex_unlock(&gb_tty->mutex);
 		}
 	}
-	mutex_unlock(&table_lock);
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
 
@@ -374,9 +372,7 @@ static void release_minor(struct gb_tty *gb_tty)
 	int minor = gb_tty->minor;
 
 	gb_tty->minor = 0;	/* Maybe should use an invalid value instead */
-	mutex_lock(&table_lock);
-	idr_remove(&tty_minors, minor);
-	mutex_unlock(&table_lock);
+	xa_erase(&tty_minors, minor);
 }
 
 static int gb_tty_install(struct tty_driver *driver, struct tty_struct *tty)
@@ -837,7 +833,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 
 	minor = alloc_minor(gb_tty);
 	if (minor < 0) {
-		if (minor == -ENOSPC) {
+		if (minor == -EBUSY) {
 			dev_err(&gbphy_dev->dev,
 				"no more free minor numbers\n");
 			retval = -ENODEV;
@@ -982,7 +978,7 @@ static void gb_tty_exit(void)
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
