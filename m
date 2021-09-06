Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 49668401B68
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Sep 2021 14:48:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C44363239
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Sep 2021 12:48:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6021C6323F; Mon,  6 Sep 2021 12:48:11 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E3C9B63231;
	Mon,  6 Sep 2021 12:48:08 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B783E60FFA
 for <greybus-dev@lists.linaro.org>; Mon,  6 Sep 2021 12:48:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AD30F6322E; Mon,  6 Sep 2021 12:48:07 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 81B0660FFA
 for <greybus-dev@lists.linaro.org>; Mon,  6 Sep 2021 12:48:05 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E9F86101C;
 Mon,  6 Sep 2021 12:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630932484;
 bh=/ST7X1c8DQCgiY0ou0QT7ESHMj9xrSDt45dcYJeTI6s=;
 h=From:To:Cc:Subject:Date:From;
 b=Hb5DLefgMiRLLs3wpEyKeNKxcxpbPi0GZGjRlW9F1ZDNLReahO5kZ1ILLkAS8C4Av
 SuFFBunuJTqsIiPRplbBWRvkofr4O+63MkH3twp30T73/lyjhKOxX7G0EeXpX5dcdp
 /o3mPq7cjD60TOuYOAVLTeQwMKAi0b00wtKrMhlXvtqjkcuc/bDdk4B4HgNUpMw50f
 J4cyXs3lw2bhxMY/s5JfxLsaOl+jpfZICHwFy1CiIy09jsbBLDIYpVcsEjNy0T3Tfr
 Iz/jzEE9Yyfj6zfBPHClxSCaKUx6yjWFVdzmhxPjIhFgA1rCNNh1HU9jd3ZrxuooGg
 Yy6CNLOfhALJQ==
Received: from johan by xi with local (Exim 4.94.2)
 (envelope-from <johan@kernel.org>)
 id 1mNE2R-0005pf-MK; Mon, 06 Sep 2021 14:47:51 +0200
From: Johan Hovold <johan@kernel.org>
To: David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  6 Sep 2021 14:45:38 +0200
Message-Id: <20210906124538.22358-1-johan@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH] staging: greybus: uart: fix tty use after free
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
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

User space can hold a tty open indefinitely and tty drivers must not
release the underlying structures until the last user is gone.

Switch to using the tty-port reference counter to manage the life time
of the greybus tty state to avoid use after free after a disconnect.

Fixes: a18e15175708 ("greybus: more uart work")
Cc: stable@vger.kernel.org      # 4.9
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/uart.c | 62 ++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 73f01ed1e5b7..a943fce322be 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -761,6 +761,17 @@ static void gb_tty_port_shutdown(struct tty_port *port)
 	gbphy_runtime_put_autosuspend(gb_tty->gbphy_dev);
 }
 
+static void gb_tty_port_destruct(struct tty_port *port)
+{
+	struct gb_tty *gb_tty = container_of(port, struct gb_tty, port);
+
+	if (gb_tty->minor != GB_NUM_MINORS)
+		release_minor(gb_tty);
+	kfifo_free(&gb_tty->write_fifo);
+	kfree(gb_tty->buffer);
+	kfree(gb_tty);
+}
+
 static const struct tty_operations gb_ops = {
 	.install =		gb_tty_install,
 	.open =			gb_tty_open,
@@ -786,6 +797,7 @@ static const struct tty_port_operations gb_port_ops = {
 	.dtr_rts =		gb_tty_dtr_rts,
 	.activate =		gb_tty_port_activate,
 	.shutdown =		gb_tty_port_shutdown,
+	.destruct =		gb_tty_port_destruct,
 };
 
 static int gb_uart_probe(struct gbphy_device *gbphy_dev,
@@ -798,17 +810,11 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	int retval;
 	int minor;
 
-	gb_tty = kzalloc(sizeof(*gb_tty), GFP_KERNEL);
-	if (!gb_tty)
-		return -ENOMEM;
-
 	connection = gb_connection_create(gbphy_dev->bundle,
 					  le16_to_cpu(gbphy_dev->cport_desc->id),
 					  gb_uart_request_handler);
-	if (IS_ERR(connection)) {
-		retval = PTR_ERR(connection);
-		goto exit_tty_free;
-	}
+	if (IS_ERR(connection))
+		return PTR_ERR(connection);
 
 	max_payload = gb_operation_get_payload_size_max(connection);
 	if (max_payload < sizeof(struct gb_uart_send_data_request)) {
@@ -816,13 +822,23 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 		goto exit_connection_destroy;
 	}
 
+	gb_tty = kzalloc(sizeof(*gb_tty), GFP_KERNEL);
+	if (!gb_tty) {
+		retval = -ENOMEM;
+		goto exit_connection_destroy;
+	}
+
+	tty_port_init(&gb_tty->port);
+	gb_tty->port.ops = &gb_port_ops;
+	gb_tty->minor = GB_NUM_MINORS;
+
 	gb_tty->buffer_payload_max = max_payload -
 			sizeof(struct gb_uart_send_data_request);
 
 	gb_tty->buffer = kzalloc(gb_tty->buffer_payload_max, GFP_KERNEL);
 	if (!gb_tty->buffer) {
 		retval = -ENOMEM;
-		goto exit_connection_destroy;
+		goto exit_put_port;
 	}
 
 	INIT_WORK(&gb_tty->tx_work, gb_uart_tx_write_work);
@@ -830,7 +846,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	retval = kfifo_alloc(&gb_tty->write_fifo, GB_UART_WRITE_FIFO_SIZE,
 			     GFP_KERNEL);
 	if (retval)
-		goto exit_buf_free;
+		goto exit_put_port;
 
 	gb_tty->credits = GB_UART_FIRMWARE_CREDITS;
 	init_completion(&gb_tty->credits_complete);
@@ -844,7 +860,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 		} else {
 			retval = minor;
 		}
-		goto exit_kfifo_free;
+		goto exit_put_port;
 	}
 
 	gb_tty->minor = minor;
@@ -853,9 +869,6 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 	init_waitqueue_head(&gb_tty->wioctl);
 	mutex_init(&gb_tty->mutex);
 
-	tty_port_init(&gb_tty->port);
-	gb_tty->port.ops = &gb_port_ops;
-
 	gb_tty->connection = connection;
 	gb_tty->gbphy_dev = gbphy_dev;
 	gb_connection_set_data(connection, gb_tty);
@@ -863,7 +876,7 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 
 	retval = gb_connection_enable_tx(connection);
 	if (retval)
-		goto exit_release_minor;
+		goto exit_put_port;
 
 	send_control(gb_tty, gb_tty->ctrlout);
 
@@ -890,16 +903,10 @@ static int gb_uart_probe(struct gbphy_device *gbphy_dev,
 
 exit_connection_disable:
 	gb_connection_disable(connection);
-exit_release_minor:
-	release_minor(gb_tty);
-exit_kfifo_free:
-	kfifo_free(&gb_tty->write_fifo);
-exit_buf_free:
-	kfree(gb_tty->buffer);
+exit_put_port:
+	tty_port_put(&gb_tty->port);
 exit_connection_destroy:
 	gb_connection_destroy(connection);
-exit_tty_free:
-	kfree(gb_tty);
 
 	return retval;
 }
@@ -930,15 +937,10 @@ static void gb_uart_remove(struct gbphy_device *gbphy_dev)
 	gb_connection_disable_rx(connection);
 	tty_unregister_device(gb_tty_driver, gb_tty->minor);
 
-	/* FIXME - free transmit / receive buffers */
-
 	gb_connection_disable(connection);
-	tty_port_destroy(&gb_tty->port);
 	gb_connection_destroy(connection);
-	release_minor(gb_tty);
-	kfifo_free(&gb_tty->write_fifo);
-	kfree(gb_tty->buffer);
-	kfree(gb_tty);
+
+	tty_port_put(&gb_tty->port);
 }
 
 static int gb_tty_init(void)
-- 
2.32.0

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
