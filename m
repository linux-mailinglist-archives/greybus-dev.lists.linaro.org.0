Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 74C127BB0B7
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 06:12:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 710A73EAB2
	for <lists+greybus-dev@lfdr.de>; Fri,  6 Oct 2023 04:12:26 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	by lists.linaro.org (Postfix) with ESMTPS id D347B4105B
	for <greybus-dev@lists.linaro.org>; Fri,  6 Oct 2023 04:12:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=bxioLe9a;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.181 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-690f7d73a3aso1531663b3a.0
        for <greybus-dev@lists.linaro.org>; Thu, 05 Oct 2023 21:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696565535; x=1697170335; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RhxtYJtKo2wrA2mnlY2uVNR1/R6xYu/SxMam4+YMn18=;
        b=bxioLe9a8xF24Ev59zX6ejKA8grKRNNMtpq8ZpFOr9YK541r9c2q+b/GsUlcdITC72
         DAsbJx36GhuYx1CofrbTENnM7Hhra6BYdgw0kUHm08XRJj1bpXLRFhgHOiYucVG+EfpB
         SUGxejIBDddJRXliIWag7GFMEt0+qld8tj4aM2UUqNO9KAVmkInhXgluOj730ADEBwRC
         1LKG4/jmXWnLMQF75KvTTVfFNxiHGdQyvtIlZav8heQo6WSQHPzxOAIfunmSmrO7K/cQ
         0rUjhM2qBK5kJrDohw1BY8VXqijkNiJClwbWdEx9d2+dUy/D+Bs5iUSmYKUnFCgFN+yz
         CM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696565535; x=1697170335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RhxtYJtKo2wrA2mnlY2uVNR1/R6xYu/SxMam4+YMn18=;
        b=TMMVA0mT5WbKp1/x+Ns3Nvp8mWytSUNqikQ0MZsQDhhUpIzAJmkw/rjcF25InRMxDV
         jUBSy08ymjGAoF8IYtI9c/URqTRaYB71UzM4H+WhM2JvNxHDL2Ijz2BnuYyKHPqbSbrM
         UUPDBeu+eVr9237pSdx2xxgg8g0o/BONnxechymL3MFzf8buE0VpBGRdYiGxSEvzNsb/
         29TrFc27KEyvoSe1JmCpnVJylmfcgeIJwOF0ne3KEK8vwaWAat/slhHMTc0nRxbDMq4O
         fK5wKg8SJown30XrwqPbi5VYMYZ/Xs5OhP1MCPC7HPM3WEbcJ+n5tDiy/DVHI0jHXSFY
         C/Ug==
X-Gm-Message-State: AOJu0YzfaH99btl1Ml9dNt8TLn5Rt4GeDUJ2Xoykos5v719cYk52vz25
	19Fbensg7azoiIVerU+kHGwhG7Q8h/8ajw==
X-Google-Smtp-Source: AGHT+IFdV7Pl67+Ei0XQhrpyMqbIyTF/mC/D2GqkMcAcwjuxeJeJ88FbLdV02gqsIRxP3PfRbvyBZw==
X-Received: by 2002:a05:6a20:d403:b0:15e:ab6:6e24 with SMTP id il3-20020a056a20d40300b0015e0ab66e24mr6160590pzb.27.1696565535429;
        Thu, 05 Oct 2023 21:12:15 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79391000000b00694fee1011asm401131pfe.208.2023.10.05.21.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 21:12:14 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Fri,  6 Oct 2023 09:40:32 +0530
Message-ID: <20231006041035.652841-3-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231006041035.652841-1-ayushdevel1325@gmail.com>
References: <20231006041035.652841-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.181:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	URIBL_BLOCKED(0.00)[beagleboard.org:url,linaro.org:email];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,linuxfoundation.org,beagleboard.org,ti.com,linaro.org,kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D347B4105B
Message-ID-Hash: HZQNWJRBQ222X4JF4OM2OX3Y7RKHSGL4
X-Message-ID-Hash: HZQNWJRBQ222X4JF4OM2OX3Y7RKHSGL4
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, vaishnav@beagleboard.org, nm@ti.com, krzysztof.kozlowski+dt@linaro.org, johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v8 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HZQNWJRBQ222X4JF4OM2OX3Y7RKHSGL4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Add the Greybus host driver for BeaglePlay board by BeagleBoard.org.

The current greybus setup involves running SVC in a user-space
application (GBridge) and using netlink to communicate with kernel
space. GBridge itself uses wpanusb kernel driver, so the greybus messages
travel from kernel space (gb_netlink) to user-space (GBridge) and then
back to kernel space (wpanusb) before reaching CC1352.

This driver directly communicates with CC1352 (running SVC Zephyr
application). Thus, it simplifies the complete greybus setup eliminating
user-space GBridge.

This driver is responsible for the following:
- Start SVC (CC1352) on driver load.
- Send/Receive Greybus messages to/from CC1352 using HDLC over UART.
- Print Logs from CC1352.
- Stop SVC (CC1352) on driver load.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 MAINTAINERS                     |   1 +
 drivers/greybus/Kconfig         |  10 +
 drivers/greybus/Makefile        |   2 +
 drivers/greybus/gb-beagleplay.c | 501 ++++++++++++++++++++++++++++++++
 4 files changed, 514 insertions(+)
 create mode 100644 drivers/greybus/gb-beagleplay.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 5467669d7963..d87e30626a6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8974,6 +8974,7 @@ M:	Ayush Singh <ayushdevel1325@gmail.com>
 L:	greybus-dev@lists.linaro.org (moderated for non-subscribers)
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/ti,cc1352p7.yaml
+F:	drivers/greybus/gb-beagleplay.c
 
 GREYBUS SUBSYSTEM
 M:	Johan Hovold <johan@kernel.org>
diff --git a/drivers/greybus/Kconfig b/drivers/greybus/Kconfig
index 78ba3c3083d5..033d31dbf3b8 100644
--- a/drivers/greybus/Kconfig
+++ b/drivers/greybus/Kconfig
@@ -17,6 +17,16 @@ menuconfig GREYBUS
 
 if GREYBUS
 
+config GREYBUS_BEAGLEPLAY
+	tristate "Greybus BeaglePlay driver"
+	depends on SERIAL_DEV_BUS
+	help
+	  Select this option if you have a BeaglePlay where CC1352
+	  co-processor acts as Greybus SVC.
+
+	  To compile this code as a module, chose M here: the module
+	  will be called gb-beagleplay.ko
+
 config GREYBUS_ES2
 	tristate "Greybus ES3 USB host controller"
 	depends on USB
diff --git a/drivers/greybus/Makefile b/drivers/greybus/Makefile
index 9bccdd229aa2..d986e94f8897 100644
--- a/drivers/greybus/Makefile
+++ b/drivers/greybus/Makefile
@@ -18,6 +18,8 @@ obj-$(CONFIG_GREYBUS)		+= greybus.o
 # needed for trace events
 ccflags-y += -I$(src)
 
+obj-$(CONFIG_GREYBUS_BEAGLEPLAY)	+= gb-beagleplay.o
+
 # Greybus Host controller drivers
 gb-es2-y := es2.o
 
diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
new file mode 100644
index 000000000000..43318c1993ba
--- /dev/null
+++ b/drivers/greybus/gb-beagleplay.c
@@ -0,0 +1,501 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Beagleplay Linux Driver for Greybus
+ *
+ * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
+ * Copyright (c) 2023 BeagleBoard.org Foundation
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
+#define RX_HDLC_PAYLOAD 256
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
+#define GB_MAX_CPORTS 32
+
+/**
+ * struct gb_beagleplay - BeaglePlay Greybus driver
+ *
+ * @sd: underlying serdev device
+ *
+ * @gb_hd: greybus host device
+ *
+ * @tx_work: hdlc transmit work
+ * @tx_producer_lock: hdlc transmit data producer lock. acquired when appending data to buffer.
+ * @tx_consumer_lock: hdlc transmit data consumer lock. acquired when sending data over uart.
+ * @tx_circ_buf: hdlc transmit circular buffer.
+ * @tx_crc: hdlc transmit crc-ccitt fcs
+ *
+ * @rx_buffer_len: length of receive buffer filled.
+ * @rx_buffer: hdlc frame receive buffer
+ * @rx_in_esc: hdlc rx flag to indicate ESC frame
+ */
+struct gb_beagleplay {
+	struct serdev_device *sd;
+
+	struct gb_host_device *gb_hd;
+
+	struct work_struct tx_work;
+	spinlock_t tx_producer_lock;
+	spinlock_t tx_consumer_lock;
+	struct circ_buf tx_circ_buf;
+	u16 tx_crc;
+
+	u16 rx_buffer_len;
+	bool rx_in_esc;
+	u8 rx_buffer[MAX_RX_HDLC];
+};
+
+/**
+ * struct hdlc_payload - Structure to represent part of HDCL frame payload data.
+ *
+ * @len: buffer length in bytes
+ * @buf: payload buffer
+ */
+struct hdlc_payload {
+	u16 len;
+	void *buf;
+};
+
+static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
+{
+	u16 cport_id;
+	struct gb_operation_msg_hdr *hdr = (struct gb_operation_msg_hdr *)buf;
+
+	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
+
+	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
+		hdr->operation_id, hdr->type, cport_id, hdr->result);
+
+	greybus_data_rcvd(bg->gb_hd, cport_id, buf, len);
+}
+
+static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
+{
+	dev_dbg(&bg->sd->dev, "CC1352 Log: %.*s", (int)len, buf);
+}
+
+/**
+ * hdlc_write() - Consume HDLC Buffer.
+ * @bg: beagleplay greybus driver
+ *
+ * Assumes that consumer lock has been acquired.
+ */
+static void hdlc_write(struct gb_beagleplay *bg)
+{
+	int written;
+	/* Start consuming HDLC data */
+	int head = smp_load_acquire(&bg->tx_circ_buf.head);
+	int tail = bg->tx_circ_buf.tail;
+	int count = CIRC_CNT_TO_END(head, tail, TX_CIRC_BUF_SIZE);
+	const unsigned char *buf = &bg->tx_circ_buf.buf[tail];
+
+	if (count > 0) {
+		written = serdev_device_write_buf(bg->sd, buf, count);
+
+		/* Finish consuming HDLC data */
+		smp_store_release(&bg->tx_circ_buf.tail, (tail + written) & (TX_CIRC_BUF_SIZE - 1));
+	}
+}
+
+/**
+ * hdlc_append() - Queue HDLC data for sending.
+ * @bg: beagleplay greybus driver
+ * @value: hdlc byte to transmit
+ *
+ * Assumes that producer lock as been acquired.
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
+		dev_warn(&bg->sd->dev, "Tx circ buf full");
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
+static void hdlc_append_tx_buf(struct gb_beagleplay *bg, const u8 *buf, u16 len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		hdlc_append_tx_u8(bg, buf[i]);
+}
+
+static void hdlc_append_tx_crc(struct gb_beagleplay *bg)
+{
+	bg->tx_crc ^= 0xffff;
+	hdlc_append_escaped(bg, bg->tx_crc & 0xff);
+	hdlc_append_escaped(bg, (bg->tx_crc >> 8) & 0xff);
+}
+
+static void hdlc_transmit(struct work_struct *work)
+{
+	struct gb_beagleplay *bg = container_of(work, struct gb_beagleplay, tx_work);
+
+	spin_lock_bh(&bg->tx_consumer_lock);
+	hdlc_write(bg);
+	spin_unlock_bh(&bg->tx_consumer_lock);
+}
+
+static void hdlc_tx_frames(struct gb_beagleplay *bg, u8 address, u8 control,
+			   const struct hdlc_payload payloads[], size_t count)
+{
+	size_t i;
+
+	spin_lock(&bg->tx_producer_lock);
+
+	hdlc_append_tx_frame(bg);
+	hdlc_append_tx_u8(bg, address);
+	hdlc_append_tx_u8(bg, control);
+
+	for (i = 0; i < count; ++i)
+		hdlc_append_tx_buf(bg, payloads[i].buf, payloads[i].len);
+
+	hdlc_append_tx_crc(bg);
+	hdlc_append_tx_frame(bg);
+
+	spin_unlock(&bg->tx_producer_lock);
+
+	schedule_work(&bg->tx_work);
+}
+
+static void hdlc_tx_s_frame_ack(struct gb_beagleplay *bg)
+{
+	hdlc_tx_frames(bg, bg->rx_buffer[0], (bg->rx_buffer[1] >> 1) & 0x7, NULL, 0);
+}
+
+static void hdlc_rx_frame(struct gb_beagleplay *bg)
+{
+	u16 crc, len;
+	u8 ctrl, *buf;
+	u8 address = bg->rx_buffer[0];
+
+	crc = crc_ccitt(0xffff, bg->rx_buffer, bg->rx_buffer_len);
+	if (crc != 0xf0b8) {
+		dev_warn_ratelimited(&bg->sd->dev, "CRC failed from %02x: 0x%04x", address, crc);
+		return;
+	}
+
+	ctrl = bg->rx_buffer[1];
+	buf = &bg->rx_buffer[2];
+	len = bg->rx_buffer_len - 4;
+
+	/* I-Frame, send S-Frame ACK */
+	if ((ctrl & 1) == 0)
+		hdlc_tx_s_frame_ack(bg);
+
+	switch (address) {
+	case ADDRESS_DBG:
+		hdlc_rx_dbg_frame(bg, buf, len);
+		break;
+	case ADDRESS_GREYBUS:
+		hdlc_rx_greybus_frame(bg, buf, len);
+		break;
+	default:
+		dev_warn_ratelimited(&bg->sd->dev, "unknown frame %u", address);
+	}
+}
+
+static int hdlc_rx(struct gb_beagleplay *bg, const u8 *data, size_t count)
+{
+	size_t i;
+	u8 c;
+
+	for (i = 0; i < count; ++i) {
+		c = data[i];
+
+		switch (c) {
+		case HDLC_FRAME:
+			if (bg->rx_buffer_len)
+				hdlc_rx_frame(bg);
+
+			bg->rx_buffer_len = 0;
+			break;
+		case HDLC_ESC:
+			bg->rx_in_esc = true;
+			break;
+		default:
+			if (bg->rx_in_esc) {
+				c ^= 0x20;
+				bg->rx_in_esc = false;
+			}
+
+			if (bg->rx_buffer_len < MAX_RX_HDLC) {
+				bg->rx_buffer[bg->rx_buffer_len] = c;
+				bg->rx_buffer_len++;
+			} else {
+				dev_err_ratelimited(&bg->sd->dev, "RX Buffer Overflow");
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
+	bg->tx_circ_buf.buf = devm_kmalloc(&bg->sd->dev, TX_CIRC_BUF_SIZE, GFP_KERNEL);
+	if (!bg->tx_circ_buf.buf)
+		return -ENOMEM;
+
+	bg->rx_buffer_len = 0;
+	bg->rx_in_esc = false;
+
+	return 0;
+}
+
+static void hdlc_deinit(struct gb_beagleplay *bg)
+{
+	flush_work(&bg->tx_work);
+}
+
+static int gb_tty_receive(struct serdev_device *sd, const unsigned char *data, size_t count)
+{
+	struct gb_beagleplay *bg = serdev_device_get_drvdata(sd);
+
+	return hdlc_rx(bg, data, count);
+}
+
+static void gb_tty_wakeup(struct serdev_device *serdev)
+{
+	struct gb_beagleplay *bg = serdev_device_get_drvdata(serdev);
+
+	schedule_work(&bg->tx_work);
+}
+
+static struct serdev_device_ops gb_beagleplay_ops = {
+	.receive_buf = gb_tty_receive,
+	.write_wakeup = gb_tty_wakeup,
+};
+
+static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
+{
+	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
+	struct hdlc_payload payloads[2];
+
+	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
+		msg->header->operation_id, msg->header->type, cport);
+
+	if (msg->header->size > RX_HDLC_PAYLOAD)
+		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
+
+	memcpy(msg->header->pad, &cport, sizeof(cport));
+
+	payloads[0].buf = msg->header;
+	payloads[0].len = sizeof(*msg->header);
+	payloads[1].buf = msg->payload;
+	payloads[1].len = msg->payload_size;
+
+	hdlc_tx_frames(bg, ADDRESS_GREYBUS, 0x03, payloads, 2);
+	greybus_message_sent(bg->gb_hd, msg, 0);
+
+	return 0;
+}
+
+static void gb_message_cancel(struct gb_message *message)
+{
+}
+
+static struct gb_hd_driver gb_hdlc_driver = { .message_send = gb_message_send,
+					      .message_cancel = gb_message_cancel };
+
+static void gb_beagleplay_start_svc(struct gb_beagleplay *bg)
+{
+	const u8 command = CONTROL_SVC_START;
+	const struct hdlc_payload payload = { .len = 1, .buf = (void *)&command };
+
+	hdlc_tx_frames(bg, ADDRESS_CONTROL, 0x03, &payload, 1);
+}
+
+static void gb_beagleplay_stop_svc(struct gb_beagleplay *bg)
+{
+	const u8 command = CONTROL_SVC_STOP;
+	const struct hdlc_payload payload = { .len = 1, .buf = (void *)&command };
+
+	hdlc_tx_frames(bg, ADDRESS_CONTROL, 0x03, &payload, 1);
+}
+
+static void gb_greybus_deinit(struct gb_beagleplay *bg)
+{
+	gb_hd_del(bg->gb_hd);
+	gb_hd_put(bg->gb_hd);
+}
+
+static int gb_greybus_init(struct gb_beagleplay *bg)
+{
+	int ret;
+
+	bg->gb_hd = gb_hd_create(&gb_hdlc_driver, &bg->sd->dev, TX_CIRC_BUF_SIZE, GB_MAX_CPORTS);
+	if (IS_ERR(bg->gb_hd)) {
+		dev_err(&bg->sd->dev, "Failed to create greybus host device");
+		return PTR_ERR(bg->gb_hd);
+	}
+
+	ret = gb_hd_add(bg->gb_hd);
+	if (ret) {
+		dev_err(&bg->sd->dev, "Failed to add greybus host device");
+		goto free_gb_hd;
+	}
+	dev_set_drvdata(&bg->gb_hd->dev, bg);
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
+	serdev_device_close(bg->sd);
+}
+
+static int gb_serdev_init(struct gb_beagleplay *bg)
+{
+	int ret;
+
+	serdev_device_set_drvdata(bg->sd, bg);
+	serdev_device_set_client_ops(bg->sd, &gb_beagleplay_ops);
+	ret = serdev_device_open(bg->sd);
+	if (ret)
+		return dev_err_probe(&bg->sd->dev, ret, "Unable to open serial device");
+
+	serdev_device_set_baudrate(bg->sd, 115200);
+	serdev_device_set_flow_control(bg->sd, false);
+
+	return 0;
+}
+
+static int gb_beagleplay_probe(struct serdev_device *serdev)
+{
+	int ret = 0;
+	struct gb_beagleplay *bg;
+
+	bg = devm_kmalloc(&serdev->dev, sizeof(*bg), GFP_KERNEL);
+	if (!bg)
+		return -ENOMEM;
+
+	bg->sd = serdev;
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
+		.compatible = "ti,cc1352p7",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, gb_beagleplay_of_match);
+
+static struct serdev_device_driver gb_beagleplay_driver = {
+	.probe = gb_beagleplay_probe,
+	.remove = gb_beagleplay_remove,
+	.driver = {
+		.name = "gb_beagleplay",
+		.of_match_table = gb_beagleplay_of_match,
+	},
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
