Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798EAD50C4
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 12:03:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29FBC44802
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Jun 2025 10:03:31 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 82700444A2
	for <greybus-dev@lists.linaro.org>; Wed, 11 Jun 2025 10:03:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=rU7fDQ+5;
	spf=pass (lists.linaro.org: domain of jirislaby@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=jirislaby@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 475465C57EC;
	Wed, 11 Jun 2025 10:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A41EC4CEF4;
	Wed, 11 Jun 2025 10:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749636206;
	bh=KpqxD4POGHfy23PplJeilT9uuVSTNzfSBk37cW0+nQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rU7fDQ+5pTYxH0ytcyrwQgoHOCsVbLm5NnmPR4QFM0EM7EYgtNRw+LFFxwP/Hhvao
	 RIt1V9+ZnGAgKnDI6H/E4rtFQMXK/OetCGUZs/5SVxBGM3dOb202foEfio4q9rZdM8
	 /9O1Q0cFZ39DFXyVVZ9SHjAtKdBm9c4dRuuf2uOdhp6eKCde1oiDfHR1ENgAK1nG8C
	 yXw+d0dOokqHgp6SFTQPGfBbmouyYt6/EtfGIqbM3KdlFyrIEEaieGuf750zrtL3+Q
	 xe4o9rTBfWY92n/+czgIgmUxYeaQUROIjdvAi5IkXrVpA5nAA/Kd5+4no3uz4J2TAB
	 r3iVHsKUHwmXg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Date: Wed, 11 Jun 2025 12:02:47 +0200
Message-ID: <20250611100319.186924-2-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250611100319.186924-1-jirislaby@kernel.org>
References: <20250611100319.186924-1-jirislaby@kernel.org>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux-pingi.de,gmail.com,suse.com,holtmann.org,lists.linaro.org,lists.linux.dev];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DNSWL_BLOCKED(0.00)[100.75.92.58:received,139.178.84.217:from];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Queue-Id: 82700444A2
X-Spamd-Bar: -
Message-ID-Hash: JSAZVPX6NNRIDBGO5KZGWP2QCRS6KS5F
X-Message-ID-Hash: JSAZVPX6NNRIDBGO5KZGWP2QCRS6KS5F
X-MailFrom: jirislaby@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Karsten Keil <isdn@linux-pingi.de>, David Lin <dtwlin@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Oliver Neukum <oneukum@suse.com>, Marcel Holtmann <marcel@holtmann.org>, Johan Hedberg <johan.hedberg@gmail.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, netdev@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, linux-bluetooth@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 01/33] tty: introduce and use tty_port_tty_vhangup() helper
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JSAZVPX6NNRIDBGO5KZGWP2QCRS6KS5F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This code (tty_get -> vhangup -> tty_put) is repeated on few places.
Introduce a helper similar to tty_port_tty_hangup() (asynchronous) to
handle even vhangup (synchronous).

And use it on those places.

In fact, reuse the tty_port_tty_hangup()'s code and call tty_vhangup()
depending on a new bool parameter.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Karsten Keil <isdn@linux-pingi.de>
Cc: David Lin <dtwlin@gmail.com>
Cc: Johan Hovold <johan@kernel.org>
Cc: Alex Elder <elder@kernel.org>
Cc: Oliver Neukum <oneukum@suse.com>
Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
---
Cc: netdev@vger.kernel.org
Cc: greybus-dev@lists.linaro.org
Cc: linux-staging@lists.linux.dev
Cc: linux-usb@vger.kernel.org
Cc: linux-bluetooth@vger.kernel.org
---
 drivers/isdn/capi/capi.c         |  8 +-------
 drivers/staging/greybus/uart.c   |  7 +------
 drivers/tty/serial/serial_core.c |  7 +------
 drivers/tty/tty_port.c           | 12 ++++++++----
 drivers/usb/class/cdc-acm.c      |  7 +------
 drivers/usb/serial/usb-serial.c  |  7 +------
 include/linux/tty_port.h         | 12 +++++++++++-
 net/bluetooth/rfcomm/tty.c       |  7 +------
 8 files changed, 25 insertions(+), 42 deletions(-)

diff --git a/drivers/isdn/capi/capi.c b/drivers/isdn/capi/capi.c
index 70dee9ad4bae..78e6e7748fb9 100644
--- a/drivers/isdn/capi/capi.c
+++ b/drivers/isdn/capi/capi.c
@@ -306,15 +306,9 @@ static void capincci_alloc_minor(struct capidev *cdev, struct capincci *np)
 static void capincci_free_minor(struct capincci *np)
 {
 	struct capiminor *mp = np->minorp;
-	struct tty_struct *tty;
 
 	if (mp) {
-		tty = tty_port_tty_get(&mp->port);
-		if (tty) {
-			tty_vhangup(tty);
-			tty_kref_put(tty);
-		}
-
+		tty_port_tty_vhangup(&mp->port);
 		capiminor_free(mp);
 	}
 }
diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 308ed1ca9947..10df5c37c83e 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -916,7 +916,6 @@ static void gb_uart_remove(struct gbphy_device *gbphy_dev)
 {
 	struct gb_tty *gb_tty = gb_gbphy_get_data(gbphy_dev);
 	struct gb_connection *connection = gb_tty->connection;
-	struct tty_struct *tty;
 	int ret;
 
 	ret = gbphy_runtime_get_sync(gbphy_dev);
@@ -929,11 +928,7 @@ static void gb_uart_remove(struct gbphy_device *gbphy_dev)
 	wake_up_all(&gb_tty->wioctl);
 	mutex_unlock(&gb_tty->mutex);
 
-	tty = tty_port_tty_get(&gb_tty->port);
-	if (tty) {
-		tty_vhangup(tty);
-		tty_kref_put(tty);
-	}
+	tty_port_tty_vhangup(&gb_tty->port);
 
 	gb_connection_disable_rx(connection);
 	tty_unregister_device(gb_tty_driver, gb_tty->minor);
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 1f7708a91fc6..d6485714eb0f 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -3209,7 +3209,6 @@ static void serial_core_remove_one_port(struct uart_driver *drv,
 	struct uart_state *state = drv->state + uport->line;
 	struct tty_port *port = &state->port;
 	struct uart_port *uart_port;
-	struct tty_struct *tty;
 
 	mutex_lock(&port->mutex);
 	uart_port = uart_port_check(state);
@@ -3228,11 +3227,7 @@ static void serial_core_remove_one_port(struct uart_driver *drv,
 	 */
 	tty_port_unregister_device(port, drv->tty_driver, uport->line);
 
-	tty = tty_port_tty_get(port);
-	if (tty) {
-		tty_vhangup(port->tty);
-		tty_kref_put(tty);
-	}
+	tty_port_tty_vhangup(port);
 
 	/*
 	 * If the port is used as a console, unregister it
diff --git a/drivers/tty/tty_port.c b/drivers/tty/tty_port.c
index 4af1fbf73f51..903eebdbe12d 100644
--- a/drivers/tty/tty_port.c
+++ b/drivers/tty/tty_port.c
@@ -396,15 +396,19 @@ EXPORT_SYMBOL(tty_port_hangup);
  * @port: tty port
  * @check_clocal: hang only ttys with %CLOCAL unset?
  */
-void tty_port_tty_hangup(struct tty_port *port, bool check_clocal)
+void __tty_port_tty_hangup(struct tty_port *port, bool check_clocal, bool async)
 {
 	struct tty_struct *tty = tty_port_tty_get(port);
 
-	if (tty && (!check_clocal || !C_CLOCAL(tty)))
-		tty_hangup(tty);
+	if (tty && (!check_clocal || !C_CLOCAL(tty))) {
+		if (async)
+			tty_hangup(tty);
+		else
+			tty_vhangup(tty);
+	}
 	tty_kref_put(tty);
 }
-EXPORT_SYMBOL_GPL(tty_port_tty_hangup);
+EXPORT_SYMBOL_GPL(__tty_port_tty_hangup);
 
 /**
  * tty_port_tty_wakeup - helper to wake up a tty
diff --git a/drivers/usb/class/cdc-acm.c b/drivers/usb/class/cdc-acm.c
index c2ecfa3c8349..f9171fbedf5c 100644
--- a/drivers/usb/class/cdc-acm.c
+++ b/drivers/usb/class/cdc-acm.c
@@ -1571,7 +1571,6 @@ static int acm_probe(struct usb_interface *intf,
 static void acm_disconnect(struct usb_interface *intf)
 {
 	struct acm *acm = usb_get_intfdata(intf);
-	struct tty_struct *tty;
 	int i;
 
 	/* sibling interface is already cleaning up */
@@ -1598,11 +1597,7 @@ static void acm_disconnect(struct usb_interface *intf)
 	usb_set_intfdata(acm->data, NULL);
 	mutex_unlock(&acm->mutex);
 
-	tty = tty_port_tty_get(&acm->port);
-	if (tty) {
-		tty_vhangup(tty);
-		tty_kref_put(tty);
-	}
+	tty_port_tty_vhangup(&acm->port);
 
 	cancel_delayed_work_sync(&acm->dwork);
 
diff --git a/drivers/usb/serial/usb-serial.c b/drivers/usb/serial/usb-serial.c
index 7266558d823a..c78ff40b1e5f 100644
--- a/drivers/usb/serial/usb-serial.c
+++ b/drivers/usb/serial/usb-serial.c
@@ -1176,7 +1176,6 @@ static void usb_serial_disconnect(struct usb_interface *interface)
 	struct usb_serial *serial = usb_get_intfdata(interface);
 	struct device *dev = &interface->dev;
 	struct usb_serial_port *port;
-	struct tty_struct *tty;
 
 	/* sibling interface is cleaning up */
 	if (!serial)
@@ -1191,11 +1190,7 @@ static void usb_serial_disconnect(struct usb_interface *interface)
 
 	for (i = 0; i < serial->num_ports; ++i) {
 		port = serial->port[i];
-		tty = tty_port_tty_get(&port->port);
-		if (tty) {
-			tty_vhangup(tty);
-			tty_kref_put(tty);
-		}
+		tty_port_tty_vhangup(&port->port);
 		usb_serial_port_poison_urbs(port);
 		wake_up_interruptible(&port->port.delta_msr_wait);
 		cancel_work_sync(&port->work);
diff --git a/include/linux/tty_port.h b/include/linux/tty_port.h
index 08f89a598366..021f9a8415c0 100644
--- a/include/linux/tty_port.h
+++ b/include/linux/tty_port.h
@@ -232,7 +232,7 @@ bool tty_port_carrier_raised(struct tty_port *port);
 void tty_port_raise_dtr_rts(struct tty_port *port);
 void tty_port_lower_dtr_rts(struct tty_port *port);
 void tty_port_hangup(struct tty_port *port);
-void tty_port_tty_hangup(struct tty_port *port, bool check_clocal);
+void __tty_port_tty_hangup(struct tty_port *port, bool check_clocal, bool async);
 void tty_port_tty_wakeup(struct tty_port *port);
 int tty_port_block_til_ready(struct tty_port *port, struct tty_struct *tty,
 		struct file *filp);
@@ -251,4 +251,14 @@ static inline int tty_port_users(struct tty_port *port)
 	return port->count + port->blocked_open;
 }
 
+static inline void tty_port_tty_hangup(struct tty_port *port, bool check_clocal)
+{
+	__tty_port_tty_hangup(port, check_clocal, true);
+}
+
+static inline void tty_port_tty_vhangup(struct tty_port *port)
+{
+	__tty_port_tty_hangup(port, false, false);
+}
+
 #endif
diff --git a/net/bluetooth/rfcomm/tty.c b/net/bluetooth/rfcomm/tty.c
index 21a5b5535ebc..827dfbe66085 100644
--- a/net/bluetooth/rfcomm/tty.c
+++ b/net/bluetooth/rfcomm/tty.c
@@ -438,7 +438,6 @@ static int __rfcomm_release_dev(void __user *arg)
 {
 	struct rfcomm_dev_req req;
 	struct rfcomm_dev *dev;
-	struct tty_struct *tty;
 
 	if (copy_from_user(&req, arg, sizeof(req)))
 		return -EFAULT;
@@ -464,11 +463,7 @@ static int __rfcomm_release_dev(void __user *arg)
 		rfcomm_dlc_close(dev->dlc, 0);
 
 	/* Shut down TTY synchronously before freeing rfcomm_dev */
-	tty = tty_port_tty_get(&dev->port);
-	if (tty) {
-		tty_vhangup(tty);
-		tty_kref_put(tty);
-	}
+	tty_port_tty_vhangup(&dev->port);
 
 	if (!test_bit(RFCOMM_TTY_OWNED, &dev->status))
 		tty_port_put(&dev->port);
-- 
2.49.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
