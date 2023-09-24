Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AFEA87AC7C2
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 13:38:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C05AC40F3E
	for <lists+greybus-dev@lfdr.de>; Sun, 24 Sep 2023 11:38:41 +0000 (UTC)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	by lists.linaro.org (Postfix) with ESMTPS id 6619A40F42
	for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 11:38:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=A+wNTG8d;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-578d0dcd4e1so2754530a12.2
        for <greybus-dev@lists.linaro.org>; Sun, 24 Sep 2023 04:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695555513; x=1696160313; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xs+e2DvRCJu24FAC1rzhbizY0OQKaeiMtpfRhhb/MLo=;
        b=A+wNTG8doFHP8chK3wXqvaEbZm59Nsxq6ouTSkkPBCosKNi+tmWlaDUFDjlRSakMug
         yyz47+vnRD0D5KTasTomSGPygFuUjEKbfWrgdMEaUabD+BW2fdVubbDQ5hfQ/gZN3U/E
         EBJ8+0q4nvz5ShC2MksUmsgwfT/vjJrV3o5Ds1jtdVnX6QLj5SKWKNMULTtthuJHVK7s
         qyLxLxqlKmzFEXXQPrYBd1HhTscBafcZuCIfnDAoy0DQHNF59rVA/dPMeoHf5haVB6O+
         y5eFGnSlZNAhgcbwsNFUDKdLTIYVkCEJxO/mhrsb4it3r9q4ml0+OQxh6N64BVE7j/y/
         528Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695555513; x=1696160313;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xs+e2DvRCJu24FAC1rzhbizY0OQKaeiMtpfRhhb/MLo=;
        b=gFI6NMWaWo8bW3bZ65/wQM7XsgaN4Ska791UMRLC8JMpoJntK7fHC/L+4JSwvm/DbU
         WYM1v4/bBHMi6/Xm7U5/KNDuMHjOhi4FDtOZGgsKzR/xiu6acyGPJkBdiKGqa4fAnAjg
         FjzRHqEvEstNXDAnYZRkRVxL3PAzwMHXXj6L30mjkBC+EjjS4mPLFaQtLOgsbyK7N3Uv
         +/FQCZBB5LHhDuaO1fpyG/RduSXKX3CNbO19o0uNz4nI22yjAFKt2cBWIvt6w43FlWVL
         D/TF98VbUxGeC71+6pCCgyGCh0p6jr15OYoIMA2vHFMClveBRoRQPSVN9u8A1G/c1iM7
         KVSg==
X-Gm-Message-State: AOJu0Yz2nyTEUZcEzy/6FpxZAfbwHEZPGQIjza/w3V4wYmZoyyBy8NT8
	xwqgglD1hJWqt03qkfb3vk12j5WI+LFrlA==
X-Google-Smtp-Source: AGHT+IHmliz+zjFLG/FaZbwmfSf48T5Pc1V8Kf8pbzmRFoOE624MOEttSuhYzjS7gKtDyPvHP0718A==
X-Received: by 2002:a05:6a20:9496:b0:15d:2bff:77b with SMTP id hs22-20020a056a20949600b0015d2bff077bmr2584055pzb.34.1695555513050;
        Sun, 24 Sep 2023 04:38:33 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id s2-20020a17090a6e4200b002775281b9easm422376pjm.50.2023.09.24.04.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Sep 2023 04:38:32 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun, 24 Sep 2023 17:06:58 +0530
Message-ID: <20230924113725.164948-3-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230924113725.164948-1-ayushdevel1325@gmail.com>
References: <20230924113725.164948-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.215.172:from];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6619A40F42
Message-ID-Hash: QENBC6II3RCBNJFYIRFIFB7V3N5MKWI4
X-Message-ID-Hash: QENBC6II3RCBNJFYIRFIFB7V3N5MKWI4
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QENBC6II3RCBNJFYIRFIFB7V3N5MKWI4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the Greybus host driver for BeaglePlay board by BeagleBoard.org.

Current beagleconnect setup involves running SVC in a user-space
application (GBridge) and using netlink to communicate with kernel
space. GBridge itself uses wpanusb kernel driver for communication with
CC1325, so the greybus messages travel from kernel space (gb_netlink) to
user-space (GBridge) and then back to kernel space (wpanusb) before
reaching CC1352.

gb-beagleplay directly communicates with CC1352 (running Zephyr
application). Thus, it simplifies the complete beagleconnect setup
eliminating user-space GBridge.

This driver is responsible for the following:
- Start SVC (CC1352) on driver load.
- Send/Receive Greybus messages to/from CC1352 using HDLC over UART.
- Print Logs from CC1352.
- Stop SVC (CC1352) on driver load.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 MAINTAINERS                     |   1 +
 drivers/greybus/Kconfig         |  10 +
 drivers/greybus/Makefile        |   4 +-
 drivers/greybus/gb-beagleplay.c | 526 ++++++++++++++++++++++++++++++++
 4 files changed, 539 insertions(+), 2 deletions(-)
 create mode 100644 drivers/greybus/gb-beagleplay.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 9d1b49a6dfad..3cbf2c87fb14 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8974,6 +8974,7 @@ M:	Ayush Singh <ayushdevel1325@gmail.com>
 L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/serial/beaglecc1352.yaml
+F:	drivers/greybus/gb-beagleplay.c
 
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
index 78ba3c3083d5..07e3119e2faa 100644
--- a/drivers/greybus/Kconfig
+++ b/drivers/greybus/Kconfig
@@ -17,6 +17,16 @@ menuconfig GREYBUS
 
 if GREYBUS
 
+config GREYBUS_BEAGLEPLAY
+	tristate "Greybus BeaglePlay driver"
+	depends on TTY
+	help
+	  Select this option if you have a BeaglePlay where CC1352
+		co-processor acts as Greybus SVC.
+
+	  To compile this code as a module, chose M here: the module
+	  will be called gb-beagleplay.ko
+
 config GREYBUS_ES2
 	tristate "Greybus ES3 USB host controller"
 	depends on USB
diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
index 9bccdd229aa2..15a84a83788d 100644
--- a/drivers/greybus/Makefile
+++ b/drivers/greybus/Makefile
@@ -18,9 +18,9 @@ obj-$(CONFIG_GREYBUS)		+= greybus.o
 # needed for trace events
 ccflags-y += -I$(src)
 
+obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+= gb-beagleplay.o
+
 # Greybus Host controller drivers
 gb-es2-y := es2.o
 
 obj-$(CONFIG_GREYBUS_ES2)	+= gb-es2.o
-
-
diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
new file mode 100644
index 000000000000..39d87ef3b8fc
--- /dev/null
+++ b/drivers/greybus/gb-beagleplay.c
@@ -0,0 +1,526 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Beagleplay Linux Driver for Greybus
+ *
+ * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
+ * Copyright (c) 2023  BeagleBoard.org Foundation
+ */
+
+#include <linux/gfp.h>
+#include <linux/greybus.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/printk.h>
+#include <linux/serdev.h>
+#include <linux/tty.h>
+#include <linux/tty_driver.h>
+#include <linux/greybus/hd.h>
+#include <linux/init.h>
+#include <linux/device.h>
+#include <linux/crc-ccitt.h>
+#include <linux/circ_buf.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define RX_HDLC_PAYLOAD 1024
+#define CRC_LEN 2
+#define MAX_RX_HDLC (1 + RX_HDLC_PAYLOAD + CRC_LEN)
+#define TX_CIRC_BUF_SIZE 1024
+
+#define ADDRESS_GREYBUS 0x01
+#define ADDRESS_DBG 0x02
+#define ADDRESS_CONTROL 0x03
+
+#define HDLC_FRAME 0x7E
+#define HDLC_ESC 0x7D
+#define HDLC_XOR 0x20
+
+#define CONTROL_SVC_START 0x01
+#define CONTROL_SVC_STOP 0x02
+
+/* The maximum number of CPorts supported by Greybus Host Device */
+#define BEAGLEPLAY_GB_MAX_CPORTS 32
+
+/*
+ * BeaglePlay Greybus driver
+ *
+ * @serdev: Serdev device
+ *
+ * @gb_host_device: greybud host device
+ *
+ * @tx_work: transmit work
+ * @tx_producer_lock: transmit producer lock
+ * @tx_consumer_lock: transmit consumer lock
+ * @tx_circ_buf: transmit circular buffer
+ * @tx_crc: HDCL CRC
+ * @tx_ack_seq: current TX ACK sequence number
+ *
+ * @rx_buffer_len: Rx buffer length
+ * @rx_in_esc: Rx Flag to indicate if ESC
+ * @rx_buffer: Rx buffer
+ */
+struct gb_beagleplay {
+	struct serdev_device *serdev;
+
+	struct gb_host_device *gb_host_device;
+
+	struct work_struct tx_work;
+	/* tx_producer_lock: HDLC producer lock */
+	spinlock_t tx_producer_lock;
+	/* tx_consumer_lock: HDLC consumer lock */
+	spinlock_t tx_consumer_lock;
+	struct circ_buf tx_circ_buf;
+	u16 tx_crc;
+	u8 tx_ack_seq;
+
+	u16 rx_buffer_len;
+	u8 rx_in_esc;
+	u8 rx_buffer[MAX_RX_HDLC];
+};
+
+struct hdlc_payload {
+	u16 length;
+	void *payload;
+};
+
+static void hdlc_handle_greybus_frame(struct gb_beagleplay *bg, u8 *buffer,
+				      size_t buffer_len)
+{
+	u16 cport_id;
+	struct gb_operation_msg_hdr *hdr =
+		(struct gb_operation_msg_hdr *)buffer;
+
+	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
+
+	dev_dbg(&bg->serdev->dev,
+		"Greybus Operation %u of Type %X on CPort %u with Status %u Received",
+		hdr->operation_id, hdr->type, cport_id, hdr->result);
+
+	greybus_data_rcvd(bg->gb_host_device, cport_id, buffer, buffer_len);
+}
+
+static void hdlc_handle_dbg_frame(struct gb_beagleplay *bg, const char *buffer,
+				  size_t buffer_len)
+{
+	dev_dbg(&bg->serdev->dev, "CC1352 Debug: %.*s", (int)buffer_len,
+		buffer);
+}
+
+/*
+ * Consume HDLC Buffer. This function assumes that consumer lock has been acquired.
+ */
+static void hdlc_write(struct gb_beagleplay *bg)
+{
+	/* Start consuning HDLC data */
+	int head = smp_load_acquire(&bg->tx_circ_buf.head);
+	int tail = bg->tx_circ_buf.tail;
+	int count = CIRC_CNT_TO_END(head, tail, TX_CIRC_BUF_SIZE);
+	const unsigned char *buf = &bg->tx_circ_buf.buf[tail];
+	int written;
+
+	if (count > 0) {
+		written = serdev_device_write_buf(bg->serdev, buf, count);
+
+		/* Finish consuming HDLC data */
+		smp_store_release(&bg->tx_circ_buf.tail,
+				  (tail + written) & (TX_CIRC_BUF_SIZE - 1));
+	}
+}
+
+/*
+ * Queue HDLC data for sending. This function assumes that producer lock as been acquired.
+ */
+static void hdlc_append(struct gb_beagleplay *bg, u8 value)
+{
+	int tail, head = bg->tx_circ_buf.head;
+
+	while (true) {
+		tail = READ_ONCE(bg->tx_circ_buf.tail);
+
+		if (CIRC_SPACE(head, tail, TX_CIRC_BUF_SIZE) >= 1) {
+			bg->tx_circ_buf.buf[head] = value;
+
+			/* Finish producing HDLC byte */
+			smp_store_release(&bg->tx_circ_buf.head,
+					  (head + 1) & (TX_CIRC_BUF_SIZE - 1));
+			return;
+		}
+		dev_warn(&bg->serdev->dev, "Tx circ buf full");
+		usleep_range(3000, 5000);
+	}
+}
+
+static void hdlc_append_escaped(struct gb_beagleplay *bg, u8 value)
+{
+	if (value == HDLC_FRAME || value == HDLC_ESC) {
+		hdlc_append(bg, HDLC_ESC);
+		value ^= HDLC_XOR;
+	}
+	hdlc_append(bg, value);
+}
+
+static void hdlc_append_tx_frame(struct gb_beagleplay *bg)
+{
+	bg->tx_crc = 0xFFFF;
+	hdlc_append(bg, HDLC_FRAME);
+}
+
+static void hdlc_append_tx_u8(struct gb_beagleplay *bg, u8 value)
+{
+	bg->tx_crc = crc_ccitt(bg->tx_crc, &value, 1);
+	hdlc_append_escaped(bg, value);
+}
+
+static void hdlc_append_tx_buffer(struct gb_beagleplay *bg, const u8 *buffer,
+				  size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		hdlc_append_tx_u8(bg, buffer[i]);
+}
+
+static void hdlc_append_tx_crc(struct gb_beagleplay *bg)
+{
+	bg->tx_crc ^= 0xffff;
+	hdlc_append_escaped(bg, bg->tx_crc & 0xff);
+	hdlc_append_escaped(bg, (bg->tx_crc >> 8) & 0xff);
+}
+
+static void hdlc_handle_rx_frame(struct gb_beagleplay *bg)
+{
+	u8 address = bg->rx_buffer[0];
+	char *buffer = &bg->rx_buffer[2];
+	size_t buffer_len = bg->rx_buffer_len - 4;
+
+	switch (address) {
+	case ADDRESS_DBG:
+		hdlc_handle_dbg_frame(bg, buffer, buffer_len);
+		break;
+	case ADDRESS_GREYBUS:
+		hdlc_handle_greybus_frame(bg, buffer, buffer_len);
+		break;
+	default:
+		dev_warn_ratelimited(&bg->serdev->dev, "Got Unknown Frame %u",
+				     address);
+	}
+}
+
+static void hdlc_transmit(struct work_struct *work)
+{
+	struct gb_beagleplay *bg =
+		container_of(work, struct gb_beagleplay, tx_work);
+
+	spin_lock_bh(&bg->tx_consumer_lock);
+	hdlc_write(bg);
+	spin_unlock_bh(&bg->tx_consumer_lock);
+}
+
+static void hdlc_send_async(struct gb_beagleplay *bg, u8 address, u8 control,
+			    const struct hdlc_payload payloads[], size_t count)
+{
+	size_t i;
+
+	/*
+	 * HDLC_FRAME
+	 * 0 address : 0x01
+	 * 1 control : 0x03
+	 * contents
+	 * x/y crc
+	 * HDLC_FRAME
+	 */
+
+	spin_lock(&bg->tx_producer_lock);
+
+	hdlc_append_tx_frame(bg);
+	hdlc_append_tx_u8(bg, address);
+	hdlc_append_tx_u8(bg, control);
+	for (i = 0; i < count; ++i) {
+		hdlc_append_tx_buffer(bg, payloads[i].payload,
+				      payloads[i].length);
+	}
+	hdlc_append_tx_crc(bg);
+	hdlc_append_tx_frame(bg);
+
+	spin_unlock(&bg->tx_producer_lock);
+
+	schedule_work(&bg->tx_work);
+}
+
+static void hdlc_send_s_frame_ack(struct gb_beagleplay *bg)
+{
+	hdlc_send_async(bg, bg->rx_buffer[0], (bg->rx_buffer[1] >> 1) & 0x7,
+			NULL, 0);
+}
+
+static int hdlc_rx(struct gb_beagleplay *bg, const u8 *data, size_t count)
+{
+	u16 crc_check;
+	size_t i;
+	u8 c, ctrl;
+
+	for (i = 0; i < count; ++i) {
+		c = data[i];
+
+		switch (c) {
+		case HDLC_FRAME:
+			if (bg->rx_buffer_len) {
+				crc_check = crc_ccitt(0xffff, bg->rx_buffer,
+						      bg->rx_buffer_len);
+				if (crc_check == 0xf0b8) {
+					ctrl = bg->rx_buffer[1];
+					if ((ctrl & 1) == 0) {
+						/* I-Frame, send S-Frame ACK */
+						hdlc_send_s_frame_ack(bg);
+					}
+					hdlc_handle_rx_frame(bg);
+				} else {
+					dev_warn_ratelimited(
+						&bg->serdev->dev,
+						"CRC Failed from %02x: 0x%04x",
+						bg->rx_buffer[0], crc_check);
+				}
+			}
+			bg->rx_buffer_len = 0;
+			break;
+		case HDLC_ESC:
+			bg->rx_in_esc = 1;
+			break;
+		default:
+			if (bg->rx_in_esc) {
+				c ^= 0x20;
+				bg->rx_in_esc = 0;
+			}
+
+			if (bg->rx_buffer_len < MAX_RX_HDLC) {
+				bg->rx_buffer[bg->rx_buffer_len] = c;
+				bg->rx_buffer_len++;
+			} else {
+				dev_err_ratelimited(&bg->serdev->dev,
+						    "RX Buffer Overflow");
+				bg->rx_buffer_len = 0;
+			}
+		}
+	}
+
+	return count;
+}
+
+static int hdlc_init(struct gb_beagleplay *bg)
+{
+	INIT_WORK(&bg->tx_work, hdlc_transmit);
+	spin_lock_init(&bg->tx_producer_lock);
+	spin_lock_init(&bg->tx_consumer_lock);
+	bg->tx_circ_buf.head = 0;
+	bg->tx_circ_buf.tail = 0;
+
+	bg->tx_circ_buf.buf =
+		devm_kmalloc(&bg->serdev->dev, TX_CIRC_BUF_SIZE, GFP_KERNEL);
+	if (!bg->tx_circ_buf.buf)
+		return -ENOMEM;
+
+	bg->rx_buffer_len = 0;
+	bg->rx_in_esc = 0;
+
+	return 0;
+}
+
+static void hdlc_deinit(struct gb_beagleplay *bg)
+{
+	flush_work(&bg->tx_work);
+}
+
+static int gb_beagleplay_tty_receive(struct serdev_device *serdev,
+				     const unsigned char *data, size_t count)
+{
+	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
+
+	return hdlc_rx(bg, data, count);
+}
+
+static void beagleplay_greybus_tty_wakeup(struct serdev_device *serdev)
+{
+	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
+
+	schedule_work(&bg->tx_work);
+}
+
+static struct serdev_device_ops gb_beagleplay_ops = {
+	.receive_buf = gb_beagleplay_tty_receive,
+	.write_wakeup = beagleplay_greybus_tty_wakeup,
+};
+
+static int gb_message_send(struct gb_host_device *hd, u16 cport_id,
+			   struct gb_message *msg, gfp_t gfp_mask)
+{
+	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
+	struct hdlc_payload payloads[2];
+
+	dev_dbg(&hd->dev,
+		"Sending Greybus message with Operation %u, Type: %X on Cport %u",
+		msg->header->operation_id, msg->header->type, cport_id);
+
+	if (msg->header->size > RX_HDLC_PAYLOAD) {
+		dev_err(&hd->dev, "Greybus message too big");
+		return -E2BIG;
+	}
+
+	memcpy(msg->header->pad, &cport_id, sizeof(cport_id));
+
+	payloads[0].payload = msg->header;
+	payloads[0].length = sizeof(*msg->header);
+	payloads[1].payload = msg->payload;
+	payloads[1].length = msg->payload_size;
+
+	hdlc_send_async(bg, ADDRESS_GREYBUS, 0x03, payloads, 2);
+	greybus_message_sent(bg->gb_host_device, msg, 0);
+
+	return 0;
+}
+
+static void gb_message_cancel(struct gb_message *message)
+{
+}
+
+static struct gb_hd_driver gb_hdlc_driver = { .message_send = gb_message_send,
+					      .message_cancel =
+						      gb_message_cancel };
+
+static void gb_beagleplay_start_svc(struct gb_beagleplay *bg)
+{
+	const u8 command = CONTROL_SVC_START;
+	const struct hdlc_payload payload = { .length = 1,
+					      .payload = (void *)&command };
+
+	hdlc_send_async(bg, ADDRESS_CONTROL, 0x03, &payload, 1);
+}
+
+static void gb_beagleplay_stop_svc(struct gb_beagleplay *bg)
+{
+	const u8 command = CONTROL_SVC_STOP;
+	const struct hdlc_payload payload = { .length = 1,
+					      .payload = (void *)&command };
+
+	hdlc_send_async(bg, ADDRESS_CONTROL, 0x03, &payload, 1);
+}
+
+static void gb_greybus_deinit(struct gb_beagleplay *bg)
+{
+	gb_hd_del(bg->gb_host_device);
+	gb_hd_put(bg->gb_host_device);
+}
+
+static int gb_greybus_init(struct gb_beagleplay *bg)
+{
+	int ret;
+
+	bg->gb_host_device = gb_hd_create(&gb_hdlc_driver, &bg->serdev->dev,
+					  TX_CIRC_BUF_SIZE,
+					  BEAGLEPLAY_GB_MAX_CPORTS);
+	if (IS_ERR(bg->gb_host_device)) {
+		return dev_err_probe(&bg->serdev->dev,
+				     PTR_ERR(bg->gb_host_device),
+				     "Unable to create Greybus Host Device");
+	}
+	ret = gb_hd_add(bg->gb_host_device);
+	if (ret) {
+		dev_err(&bg->serdev->dev, "Failed to add Greybus Host Device");
+		goto free_gb_hd;
+	}
+	dev_set_drvdata(&bg->gb_host_device->dev, bg);
+
+	return 0;
+
+free_gb_hd:
+	gb_greybus_deinit(bg);
+	return ret;
+}
+
+static void gb_serdev_deinit(struct gb_beagleplay *bg)
+{
+	serdev_device_close(bg->serdev);
+}
+
+static int gb_serdev_init(struct gb_beagleplay *bg)
+{
+	u32 speed = 115200;
+	int ret;
+
+	serdev_device_set_drvdata(bg->serdev, bg);
+	serdev_device_set_client_ops(bg->serdev, &gb_beagleplay_ops);
+	ret = serdev_device_open(bg->serdev);
+	if (ret) {
+		return dev_err_probe(&bg->serdev->dev, ret,
+				     "Unable to Open Serial Device");
+	}
+	speed = serdev_device_set_baudrate(bg->serdev, speed);
+	serdev_device_set_flow_control(bg->serdev, false);
+
+	return 0;
+}
+
+static int gb_beagleplay_probe(struct serdev_device *serdev)
+{
+	int ret = 0;
+	struct gb_beagleplay *bg =
+		devm_kmalloc(&serdev->dev, sizeof(*bg), GFP_KERNEL);
+
+	if (!bg)
+		return -ENOMEM;
+
+	bg->serdev = serdev;
+	ret = gb_serdev_init(bg);
+	if (ret)
+		return ret;
+
+	ret = hdlc_init(bg);
+	if (ret)
+		goto free_serdev;
+
+	ret = gb_greybus_init(bg);
+	if (ret)
+		goto free_hdlc;
+
+	gb_beagleplay_start_svc(bg);
+
+	return 0;
+
+free_hdlc:
+	hdlc_deinit(bg);
+free_serdev:
+	gb_serdev_deinit(bg);
+	return ret;
+}
+
+static void gb_beagleplay_remove(struct serdev_device *serdev)
+{
+	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
+
+	gb_greybus_deinit(bg);
+	gb_beagleplay_stop_svc(bg);
+	hdlc_deinit(bg);
+	gb_serdev_deinit(bg);
+}
+
+static const struct of_device_id gb_beagleplay_of_match[] = {
+	{
+		.compatible = "beagle,play-cc1352",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, gb_beagleplay_of_match);
+
+static struct serdev_device_driver gb_beagleplay_driver = {
+	.probe = gb_beagleplay_probe,
+	.remove = gb_beagleplay_remove,
+	.driver = {
+	      .name = "gb_beagleplay",
+	      .of_match_table = gb_beagleplay_of_match,
+	    },
+};
+
+module_serdev_device_driver(gb_beagleplay_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Ayush Singh <ayushdevel1325@gmail.com>");
+MODULE_DESCRIPTION("A Greybus driver for BeaglePlay");
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
