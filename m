Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E555D785DF5
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 18:56:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 01C593EF24
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 16:56:07 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id B1BB340F68
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 16:55:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=LOTTFMxY;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.171 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf55a81eeaso27451525ad.0
        for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809754; x=1693414554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2dUna/ipJS5bYmVYPJsqfLRP4fiy+lisBgOUPmzkVRQ=;
        b=LOTTFMxYGDYWkhAg4aGWqH+qvudLFv36F16rAObA8qCFyfC8wIrofp1nzVgID/3D8U
         9vOH/LFYi657DzH51zg6nsbH3xNCLZ27adY19T96w6MrN8qriw6pLXuBJqqIWD0Ganxa
         o/tqQI1k9T0TperCTd8LOairFnh4eVIeMPq0y29/tsA8/3PMx1DDN+zH22CbyGAaFDSp
         8ReWK7MMYoO44wtwBtseo8Bpkb6jsihiBjmlKtCna/NNe3R4TOz8s64Cz9OZmRPTPeWH
         Yjb+XD1+7QGCEanJTg2NAxBFC8sUoq/V632IuV5Ls+P3WHZjryuIz/zieeUQXLwKO3Zi
         1rGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809754; x=1693414554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2dUna/ipJS5bYmVYPJsqfLRP4fiy+lisBgOUPmzkVRQ=;
        b=QXvHIIPq3BCoPd9pFKeXFqEBSFzwX/s6c//RMBiJ1Dzp9c0to/T5fEAh0iRlnXI/PR
         ARnbRwfGFxZMyBVHWz2uc+0awsoBCu6bEoLbZj15vKCEflCR9cUOWbw6cCtR/U4uh2je
         Voz0n1l9Zqvniih1u9WWFn4HPn231DVGok5t2KMswoe+s3fESLVUMctfkZPvS3klsgWP
         ujr3/FiUxzGtjvIzcrkxV+g9u5s32KRXoCXFrQ5RFMWIMvGVcB+/dLE1L1s9B5z26ETG
         NdOOy+F3ZGE6WdSiqboXEpyCrxOlceo5tmLOw6KnIQsq8+UJ9GeZqkgXEekbHuGz5X9I
         zyLg==
X-Gm-Message-State: AOJu0Yw9J4Yj+t5lW4UgahwBchv5hDr/B3AmyoKK2dhDJA3RTxk0Ojc8
	uBaw/rynCL0g39KhKDmT3QxIelWVOCOjD2YO
X-Google-Smtp-Source: AGHT+IEu53pkDJWpNpjwuBqUudnZeSHXc3ipljNSAMukZWuaaduPPyaXUjniWi3ARt4lF/pVo+v0dw==
X-Received: by 2002:a17:903:187:b0:1be:e873:38b0 with SMTP id z7-20020a170903018700b001bee87338b0mr12156385plg.59.1692809754401;
        Wed, 23 Aug 2023 09:55:54 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id ix21-20020a170902f81500b001bb8895848bsm11256247plb.71.2023.08.23.09.55.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:55:54 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 23 Aug 2023 22:25:19 +0530
Message-ID: <20230823165520.181301-4-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823165520.181301-1-ayushdevel1325@gmail.com>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: B1BB340F68
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,kernel.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: EUXBXTRDMPTVX4N4IZ4NLGGYH3KNW74X
X-Message-ID-Hash: EUXBXTRDMPTVX4N4IZ4NLGGYH3KNW74X
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/4] Add HDLC helper for beagleplay driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EUXBXTRDMPTVX4N4IZ4NLGGYH3KNW74X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This file provides functions that allow sending and recieving async HDLC
frames over any transport. Currently only tested with UART.

I am not quite sure where these files should go so I have put them close
to Beagleplay greybus driver for now.

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/staging/greybus/hdlc.c | 229 +++++++++++++++++++++++++++++++++
 drivers/staging/greybus/hdlc.h | 137 ++++++++++++++++++++
 2 files changed, 366 insertions(+)
 create mode 100644 drivers/staging/greybus/hdlc.c
 create mode 100644 drivers/staging/greybus/hdlc.h

diff --git a/drivers/staging/greybus/hdlc.c b/drivers/staging/greybus/hdlc.c
new file mode 100644
index 000000000000..079d4c10e476
--- /dev/null
+++ b/drivers/staging/greybus/hdlc.c
@@ -0,0 +1,229 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
+ */
+
+#include "hdlc.h"
+#include <linux/device.h>
+#include <linux/crc-ccitt.h>
+#include <linux/serdev.h>
+
+static void hdlc_write_locked(struct hdlc_driver *drv)
+{
+	// must be locked already
+	int head = smp_load_acquire(&drv->tx_circ_buf.head);
+	int tail = drv->tx_circ_buf.tail;
+	int count = CIRC_CNT_TO_END(head, tail, TX_CIRC_BUF_SIZE);
+	int written;
+
+	if (count >= 1) {
+		written = drv->hdlc_send_frame_cb(dev_get_drvdata(drv->parent),
+						  &drv->tx_circ_buf.buf[tail],
+						  count);
+
+		/* Finish consuming HDLC data */
+		smp_store_release(&drv->tx_circ_buf.tail,
+				  (tail + written) & (TX_CIRC_BUF_SIZE - 1));
+	}
+}
+
+static void hdlc_append(struct hdlc_driver *drv, u8 value)
+{
+	// must be locked already
+	int head, tail;
+
+	head = drv->tx_circ_buf.head;
+
+	while (true) {
+		tail = READ_ONCE(drv->tx_circ_buf.tail);
+
+		if (CIRC_SPACE(head, tail, TX_CIRC_BUF_SIZE) >= 1) {
+			drv->tx_circ_buf.buf[head] = value;
+
+			/* Finish producing HDLC byte */
+			smp_store_release(&drv->tx_circ_buf.head,
+					  (head + 1) & (TX_CIRC_BUF_SIZE - 1));
+			return;
+		}
+		dev_warn(drv->parent, "Tx circ buf full\n");
+		usleep_range(3000, 5000);
+	}
+}
+
+static void hdlc_append_escaped(struct hdlc_driver *drv, u8 value)
+{
+	if (value == HDLC_FRAME || value == HDLC_ESC) {
+		hdlc_append(drv, HDLC_ESC);
+		value ^= HDLC_XOR;
+	}
+	hdlc_append(drv, value);
+}
+
+static void hdlc_append_tx_frame(struct hdlc_driver *drv)
+{
+	drv->tx_crc = 0xFFFF;
+	hdlc_append(drv, HDLC_FRAME);
+}
+
+static void hdlc_append_tx_u8(struct hdlc_driver *drv, u8 value)
+{
+	drv->tx_crc = crc_ccitt(drv->tx_crc, &value, 1);
+	hdlc_append_escaped(drv, value);
+}
+
+static void hdlc_append_tx_buffer(struct hdlc_driver *drv, const void *buffer,
+				  size_t len)
+{
+	size_t i;
+
+	for (i = 0; i < len; i++)
+		hdlc_append_tx_u8(drv, ((u8 *)buffer)[i]);
+}
+
+static void hdlc_append_tx_crc(struct hdlc_driver *drv)
+{
+	drv->tx_crc ^= 0xffff;
+	hdlc_append_escaped(drv, drv->tx_crc & 0xff);
+	hdlc_append_escaped(drv, (drv->tx_crc >> 8) & 0xff);
+}
+
+static void hdlc_handle_rx_frame(struct hdlc_driver *drv)
+{
+	u8 address = drv->rx_buffer[0];
+	char *buf = &drv->rx_buffer[2];
+	size_t buf_len = drv->rx_buffer_len - 4;
+
+	drv->hdlc_process_frame_cb(dev_get_drvdata(drv->parent), buf, buf_len,
+				   address);
+}
+
+static void hdlc_transmit(struct work_struct *work)
+{
+	struct hdlc_driver *drv =
+		container_of(work, struct hdlc_driver, tx_work);
+
+	spin_lock_bh(&drv->tx_consumer_lock);
+	hdlc_write_locked(drv);
+	spin_unlock_bh(&drv->tx_consumer_lock);
+}
+
+static void hdlc_send_s_frame_ack(struct hdlc_driver *drv)
+{
+	u8 address = drv->rx_buffer[0];
+
+	hdlc_send_async(drv, 0, NULL, address, (drv->rx_buffer[1] >> 1) & 0x7);
+}
+
+int hdlc_rx(struct hdlc_driver *drv, const unsigned char *data, size_t count)
+{
+	u16 crc_check;
+	size_t i;
+	u8 c, ctrl;
+
+	for (i = 0; i < count; ++i) {
+		c = data[i];
+
+		switch (c) {
+		case HDLC_FRAME: {
+			if (drv->rx_buffer_len) {
+				crc_check = crc_ccitt(0xffff, drv->rx_buffer,
+						      drv->rx_buffer_len);
+
+				if (crc_check == 0xf0b8) {
+					ctrl = drv->rx_buffer[1];
+					if ((ctrl & 1) == 0) {
+						// I-Frame, send S-Frame ACK
+						hdlc_send_s_frame_ack(drv);
+					}
+
+					hdlc_handle_rx_frame(drv);
+				} else {
+					dev_err(drv->parent,
+						"CRC Failed from %02x: 0x%04x\n",
+						drv->rx_buffer[0], crc_check);
+				}
+			}
+			drv->rx_buffer_len = 0;
+			break;
+		}
+		case HDLC_ESC:
+			drv->rx_in_esc = 1;
+			break;
+		default:
+			if (drv->rx_in_esc) {
+				c ^= 0x20;
+				drv->rx_in_esc = 0;
+			}
+
+			if (drv->rx_buffer_len < MAX_RX_HDLC) {
+				drv->rx_buffer[drv->rx_buffer_len] = c;
+				drv->rx_buffer_len++;
+			} else {
+				// buffer overflow
+				dev_err(drv->parent, "RX Buffer Overflow\n");
+				drv->rx_buffer_len = 0;
+			}
+		}
+	}
+
+	return count;
+}
+
+struct hdlc_driver *hdlc_init(struct device *parent,
+			      hdlc_send_frame_callback hdlc_send_frame_cb,
+			      hdlc_process_frame_callback hdlc_process_frame_cb)
+{
+	struct hdlc_driver *drv;
+
+	drv = devm_kmalloc(parent, sizeof(*drv), GFP_KERNEL);
+	if (!drv)
+		goto early_exit;
+
+	drv->parent = parent;
+	INIT_WORK(&drv->tx_work, hdlc_transmit);
+	drv->hdlc_send_frame_cb = hdlc_send_frame_cb;
+	spin_lock_init(&drv->tx_producer_lock);
+	spin_lock_init(&drv->tx_consumer_lock);
+	drv->tx_circ_buf.head = 0;
+	drv->tx_circ_buf.tail = 0;
+	drv->tx_circ_buf.buf =
+		devm_kmalloc(parent, TX_CIRC_BUF_SIZE, GFP_KERNEL);
+	drv->rx_buffer_len = 0;
+	drv->rx_in_esc = 0;
+	drv->hdlc_process_frame_cb = hdlc_process_frame_cb;
+
+	return drv;
+
+early_exit:
+	return NULL;
+}
+
+void hdlc_deinit(struct hdlc_driver *drv)
+{
+	flush_work(&drv->tx_work);
+}
+
+void hdlc_send_async(struct hdlc_driver *drv, u16 length, const void *buffer,
+		     u8 address, u8 control)
+{
+	// HDLC_FRAME
+	// 0 address : 0x01
+	// 1 control : 0x03
+	// contents
+	// x/y crc
+	// HDLC_FRAME
+
+	spin_lock(&drv->tx_producer_lock);
+
+	hdlc_append_tx_frame(drv);
+	hdlc_append_tx_u8(drv,
+			  address); // address
+	hdlc_append_tx_u8(drv, control); // control
+	hdlc_append_tx_buffer(drv, buffer, length);
+	hdlc_append_tx_crc(drv);
+	hdlc_append_tx_frame(drv);
+
+	spin_unlock(&drv->tx_producer_lock);
+
+	schedule_work(&drv->tx_work);
+}
diff --git a/drivers/staging/greybus/hdlc.h b/drivers/staging/greybus/hdlc.h
new file mode 100644
index 000000000000..7eae10871f88
--- /dev/null
+++ b/drivers/staging/greybus/hdlc.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
+ */
+
+#ifndef _HDLC_H
+#define _HDLC_H
+
+#include <linux/circ_buf.h>
+#include <linux/types.h>
+#include <linux/workqueue.h>
+
+#define MAX_RX_HDLC (1 + RX_HDLC_PAYLOAD + CRC_LEN)
+#define RX_HDLC_PAYLOAD 1024
+#define CRC_LEN 2
+#define TX_CIRC_BUF_SIZE 1024
+
+#define HDLC_FRAME 0x7E
+#define HDLC_ESC 0x7D
+#define HDLC_XOR 0x20
+
+#define HDLC_MAX_BLOCK_SIZE 512
+
+/*
+ * Callback to process a complete HDLC frame
+ *
+ * @param drvdata of hdlc device registered
+ * @param buffer of hdlc block
+ * @param length of buffer
+ * @param HDLC address
+ */
+typedef void (*hdlc_process_frame_callback)(void *, u8 *, size_t, uint8_t);
+
+/*
+ * Callback to send HDLC frame
+ *
+ * @param drvdata of hdlc device registered
+ * @param buffer of hdlc block
+ * @param length of buffer
+ */
+typedef int (*hdlc_send_frame_callback)(void *, const unsigned char *, size_t);
+
+/*
+ * HDLC driver
+ *
+ * @param device HDLC driver is using
+ *
+ * @param callback called when hdlc block is received
+ * @param callback called to send hdlc block
+ *
+ * @param transmit work
+ * @param transmit producer lock
+ * @param transmit consumer lock
+ * @param transmit circular buffer
+ * @param HDCL CRC
+ * @param current TX ACK sequence number
+ *
+ * @param Rx buffer length
+ * @param Rx HDLC block address
+ * @param Rx Flag to indicate if ESC
+ * @parma Rx buffer
+ */
+struct hdlc_driver {
+	struct device *parent;
+
+	hdlc_process_frame_callback hdlc_process_frame_cb;
+	hdlc_send_frame_callback hdlc_send_frame_cb;
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
+	u8 rx_buffer[HDLC_MAX_BLOCK_SIZE];
+};
+
+/*
+ * Queue data to be sent as an HDLC block
+ *
+ * @param hdlc driver
+ * @param buffer length
+ * @param buffer
+ * @param address
+ * @param control
+ */
+void hdlc_send_async(struct hdlc_driver *drv, u16 buffer_length,
+		     const void *buffer, u8 address, u8 control);
+
+/*
+ * Add HDCL data for processing
+ *
+ * @param hdlc driver
+ * @param buffer
+ * @param buffer length
+ *
+ * @return number of bytes processed
+ */
+int hdlc_rx(struct hdlc_driver *drv, const unsigned char *buffer,
+	    size_t buffer_length);
+
+/*
+ * Initialize HDLC
+ *
+ * @param device to use
+ * @param callback to send HDLC block
+ * @param callback to process hdlc frame
+ *
+ * @return hdlc driver allocated on heap
+ */
+struct hdlc_driver *hdlc_init(struct device *drv,
+			      hdlc_send_frame_callback send_frame_cb,
+			      hdlc_process_frame_callback process_frame_cb);
+
+/*
+ * De-initialize HDLC
+ *
+ * @param hdlc driver
+ */
+void hdlc_deinit(struct hdlc_driver *drv);
+
+/*
+ * Wakeup Tx
+ *
+ * @param hdlc_driver
+ */
+static inline void hdlc_tx_wakeup(struct hdlc_driver *drv)
+{
+	schedule_work(&drv->tx_work);
+}
+
+#endif
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
