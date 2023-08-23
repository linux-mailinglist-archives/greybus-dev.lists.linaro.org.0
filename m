Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 19123785DF3
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 18:56:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29AD83F359
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Aug 2023 16:56:01 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	by lists.linaro.org (Postfix) with ESMTPS id B71AA40F72
	for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 16:55:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=nduEP8bW;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.175 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1bdbbede5d4so46402705ad.2
        for <greybus-dev@lists.linaro.org>; Wed, 23 Aug 2023 09:55:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692809751; x=1693414551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=al2JtYKzSPoEtXxtuAex2JbSGmsDr3Maq66EJ+WkRhA=;
        b=nduEP8bWTOwYVAqZ4L+OWlSc34J8S2gns/2m+/5Jq8jQEUYRJweS+2hVn3w9peg4/5
         GH9JbIQAtycDI9qpMmAqjPsO9tEj77RcLyHx/D0dFxPXOAQTZJPSOHXfzKMt/GPiWL3t
         sRPD4BHjA/+oCxY9AiPmlvwNDlMpewCr6u1ZGpuPoqV8DgeMB37DIGd9slZYwT3B7Vg3
         a1kP5Xf0/oGsg/1Hb/WSh6oD6iOuRIvS6yNQdjHnZa8KARbTxwyWDtRCxQNqUA8uT3EL
         SgbqIyXXtCov7ZtQ62HlCZkULiy3aNILBKJJ3BcHrZUYy5U3icRNoJ/jnLfhdEGC0MdH
         LWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692809751; x=1693414551;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=al2JtYKzSPoEtXxtuAex2JbSGmsDr3Maq66EJ+WkRhA=;
        b=H3wPBHFwThAY1TND0wdY8272Y8HvHw2Jqiyc1AB/rKhFev6ctDvM1zPOSOqxC87p1L
         eZTqjfLxHaGUJK8g82O5nJfseuJBzKnMIQQTZ+ugBJL/iudTV2TVp/DZHCGjMfYPUXRw
         BdzDJQmbFlCDWtdMdx9laXnbDvcOE1FDy8fn50pMidAwnun/7vuE09hFZfNIHcsYLmXo
         /RCzNRmfgW/Jmo2NwIWDFCCHaK1bsGLculy/l34vXTzCghq4dFVeqUjmrFVtefGzwWNA
         GjD+AKLpWqRyGuspRclNcZqsx4FJkXtU2/5Dh4SAxVTMe816j/hCidGDLaCify+0KPvh
         S+0g==
X-Gm-Message-State: AOJu0YxxiMKjkElKnzRe+PtmKeuXD1GQzqEZ4/v+RwLvDp7SOrhtF4Qq
	SDNIb0z/kB3YecYG0YNdFvfhy2S0vNuORKl9
X-Google-Smtp-Source: AGHT+IEVLwc2Q2dCBZNAmVdwHmC5mhHbL4TGUMMJ3GFbQjb//UO7HO/LND2jwINPRjC2R7rHMP80AQ==
X-Received: by 2002:a17:903:234d:b0:1c0:7e86:4f6 with SMTP id c13-20020a170903234d00b001c07e8604f6mr9732978plh.14.1692809751482;
        Wed, 23 Aug 2023 09:55:51 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id ix21-20020a170902f81500b001bb8895848bsm11256247plb.71.2023.08.23.09.55.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Aug 2023 09:55:51 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 23 Aug 2023 22:25:18 +0530
Message-ID: <20230823165520.181301-3-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230823165520.181301-1-ayushdevel1325@gmail.com>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: B71AA40F72
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.175:from];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: NU6MBU4CK7GP2LO5MA4JFGHZTN2TG4K4
X-Message-ID-Hash: NU6MBU4CK7GP2LO5MA4JFGHZTN2TG4K4
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/4] Add beagleplay greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NU6MBU4CK7GP2LO5MA4JFGHZTN2TG4K4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 .../greybus/beagleplay-greybus-driver.c       | 264 ++++++++++++++++++
 .../greybus/beagleplay-greybus-driver.h       |  28 ++
 2 files changed, 292 insertions(+)
 create mode 100644 drivers/staging/greybus/beagleplay-greybus-driver.c
 create mode 100644 drivers/staging/greybus/beagleplay-greybus-driver.h

diff --git a/drivers/staging/greybus/beagleplay-greybus-driver.c b/drivers/staging/greybus/beagleplay-greybus-driver.c
new file mode 100644
index 000000000000..1b4225a9fc8d
--- /dev/null
+++ b/drivers/staging/greybus/beagleplay-greybus-driver.c
@@ -0,0 +1,264 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Beagleplay Linux Driver for Greybus
+ *
+ * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
+ */
+
+#include "beagleplay-greybus-driver.h"
+#include "hdlc.h"
+#include <linux/crc-ccitt.h>
+#include <linux/device.h>
+#include <linux/gfp.h>
+#include <linux/greybus.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/printk.h>
+#include <linux/serdev.h>
+#include <linux/tty.h>
+#include <linux/tty_driver.h>
+
+#define BEAGLEPLAY_GREYBUS_DRV_VERSION "0.1.0"
+#define BEAGLEPLAY_GREYBUS_DRV_NAME "bcfgreybus"
+
+#define BEAGLEPLAY_GB_MAX_CPORTS 32
+
+static const struct of_device_id beagleplay_greybus_of_match[] = {
+	{
+		.compatible = "beagle,beagleplaygreybus",
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, beagleplay_greybus_of_match);
+
+static int beagleplay_greybus_serdev_write_locked(void *drvdata,
+						  const unsigned char *buf,
+						  size_t buf_len)
+{
+	struct beagleplay_greybus *beagleplay_greybus;
+
+	beagleplay_greybus = drvdata;
+	return serdev_device_write_buf(beagleplay_greybus->serdev, buf,
+				       buf_len);
+}
+
+static void
+beagleplay_greybus_handle_greybus_frame(struct beagleplay_greybus *bg,
+					u8 *buffer, size_t buffer_len)
+{
+	u16 cport_id;
+	struct gb_operation_msg_hdr *hdr =
+		(struct gb_operation_msg_hdr *)buffer;
+	memcpy(&cport_id, hdr->pad, sizeof(u16));
+	if (hdr->result) {
+		dev_warn(
+			&bg->serdev->dev,
+			"Failed Greybus Operation %u of Type %X on CPort %u with Status %u",
+			hdr->operation_id, hdr->type, cport_id, hdr->result);
+	} else {
+		dev_dbg(&bg->serdev->dev,
+			"Successful Greybus Operation %u of Type %X on CPort %u",
+			hdr->operation_id, hdr->type, cport_id);
+	}
+	greybus_data_rcvd(bg->gb_host_device, cport_id, buffer, buffer_len);
+}
+
+static void beagleplay_greybus_handle_dbg_frame(struct beagleplay_greybus *bg,
+						const char *buffer,
+						size_t buffer_len)
+{
+	char buf[RX_HDLC_PAYLOAD];
+
+	memcpy(buf, buffer, buffer_len);
+	buf[buffer_len] = 0;
+	dev_dbg(&bg->serdev->dev, "CC1352 Debug: %s", buf);
+}
+
+static void beagleplay_greybus_handle_hdlc_rx_frame(void *drv_data, u8 *buffer,
+						    size_t buffer_len,
+						    uint8_t address)
+{
+	struct beagleplay_greybus *beagleplay_greybus;
+
+	beagleplay_greybus = drv_data;
+
+	switch (address) {
+	case ADDRESS_DBG:
+		beagleplay_greybus_handle_dbg_frame(beagleplay_greybus, buffer,
+						    buffer_len);
+		break;
+	case ADDRESS_GREYBUS:
+		beagleplay_greybus_handle_greybus_frame(beagleplay_greybus,
+							buffer, buffer_len);
+		break;
+	default:
+		dev_warn(&beagleplay_greybus->serdev->dev,
+			 "Got Unknown Frame %u", address);
+	}
+}
+
+static int beagleplay_greybus_tty_receive(struct serdev_device *serdev,
+					  const unsigned char *data,
+					  size_t count)
+{
+	struct beagleplay_greybus *beagleplay_greybus;
+
+	beagleplay_greybus = serdev_device_get_drvdata(serdev);
+	return hdlc_rx(beagleplay_greybus->hdlc_drv, data, count);
+}
+
+static void beagleplay_greybus_tty_wakeup(struct serdev_device *serdev)
+{
+	struct beagleplay_greybus *beagleplay_greybus;
+
+	beagleplay_greybus = serdev_device_get_drvdata(serdev);
+	hdlc_tx_wakeup(beagleplay_greybus->hdlc_drv);
+}
+
+static struct serdev_device_ops beagleplay_greybus_ops = {
+	.receive_buf = beagleplay_greybus_tty_receive,
+	.write_wakeup = beagleplay_greybus_tty_wakeup,
+};
+
+static int gb_message_send(struct gb_host_device *hd, u16 cport_id,
+			   struct gb_message *message, gfp_t gfp_mask)
+{
+	struct beagleplay_greybus *beagleplay_greybus;
+	char block_payload[HDLC_MAX_BLOCK_SIZE];
+
+	dev_dbg(&hd->dev,
+		"Sending Greybus message with Operation %u, Type: %X on Cport %u",
+		message->header->operation_id, message->header->type, cport_id);
+
+	if (message->header->size > HDLC_MAX_BLOCK_SIZE) {
+		dev_err(&hd->dev, "Greybus message too big");
+		return -1;
+	}
+
+	beagleplay_greybus = dev_get_drvdata(&hd->dev);
+	memcpy(message->header->pad, &cport_id, sizeof(u16));
+	memcpy(&block_payload, message->header,
+	       sizeof(struct gb_operation_msg_hdr));
+	memcpy(&block_payload[sizeof(struct gb_operation_msg_hdr)],
+	       message->payload, message->payload_size);
+	hdlc_send_async(beagleplay_greybus->hdlc_drv, message->header->size,
+			&block_payload, ADDRESS_GREYBUS, 0x03);
+
+	greybus_message_sent(beagleplay_greybus->gb_host_device, message, 0);
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
+static void beagleplay_greybus_start_svc(struct beagleplay_greybus *bg)
+{
+	const u8 command[1] = { CONTROL_SVC_START };
+
+	hdlc_send_async(bg->hdlc_drv, sizeof(command), command, ADDRESS_CONTROL,
+			0x03);
+}
+
+static void beagleplay_greybus_stop_svc(struct beagleplay_greybus *bg)
+{
+	const u8 command = CONTROL_SVC_STOP;
+
+	hdlc_send_async(bg->hdlc_drv, 1, &command, ADDRESS_CONTROL, 0x03);
+}
+
+static int beagleplay_greybus_probe(struct serdev_device *serdev)
+{
+	struct beagleplay_greybus *bg;
+	u32 speed = 115200;
+	int ret = 0;
+
+	bg = devm_kmalloc(&serdev->dev, sizeof(struct beagleplay_greybus),
+			  GFP_KERNEL);
+
+	bg->serdev = serdev;
+
+	serdev_device_set_drvdata(serdev, bg);
+	serdev_device_set_client_ops(serdev, &beagleplay_greybus_ops);
+
+	ret = serdev_device_open(serdev);
+	if (ret) {
+		dev_err(&bg->serdev->dev, "Unable to Open Device");
+		return ret;
+	}
+
+	speed = serdev_device_set_baudrate(serdev, speed);
+	dev_info(&bg->serdev->dev, "Using baudrate %u\n", speed);
+
+	serdev_device_set_flow_control(serdev, false);
+
+	// Init HDLC
+	bg->hdlc_drv =
+		hdlc_init(&serdev->dev, beagleplay_greybus_serdev_write_locked,
+			  beagleplay_greybus_handle_hdlc_rx_frame);
+	if (!bg->hdlc_drv) {
+		dev_err(&serdev->dev, "Failed to initialize HDLC");
+		return -ENOMEM;
+	}
+
+	// Greybus setup
+	bg->gb_host_device =
+		gb_hd_create(&gb_hdlc_driver, &serdev->dev, TX_CIRC_BUF_SIZE,
+			     BEAGLEPLAY_GB_MAX_CPORTS);
+	if (IS_ERR(bg->gb_host_device)) {
+		dev_err(&bg->serdev->dev,
+			"Unable to create Greybus Host Device");
+		return -1;
+	}
+	ret = gb_hd_add(bg->gb_host_device);
+	if (ret) {
+		dev_err(&serdev->dev, "Failed to add Greybus Host Device");
+		return ret;
+	}
+	dev_set_drvdata(&bg->gb_host_device->dev, bg);
+
+	beagleplay_greybus_start_svc(bg);
+
+	dev_info(&bg->serdev->dev, "Successful Beagleplay Greybus Probe");
+
+	return 0;
+}
+
+static void beagleplay_greybus_remove(struct serdev_device *serdev)
+{
+	struct beagleplay_greybus *beagleplay_greybus =
+		serdev_device_get_drvdata(serdev);
+
+	dev_info(&beagleplay_greybus->serdev->dev,
+		 "Remove BeaglePlay Greybus Driver");
+
+	// Free greybus stuff
+	gb_hd_del(beagleplay_greybus->gb_host_device);
+	gb_hd_put(beagleplay_greybus->gb_host_device);
+
+	beagleplay_greybus_stop_svc(beagleplay_greybus);
+
+	hdlc_deinit(beagleplay_greybus->hdlc_drv);
+
+	serdev_device_close(serdev);
+}
+
+static struct serdev_device_driver beagleplay_greybus_driver = {
+	.probe = beagleplay_greybus_probe,
+	.remove = beagleplay_greybus_remove,
+	.driver = {
+	      .name = BEAGLEPLAY_GREYBUS_DRV_NAME,
+	      .of_match_table = of_match_ptr(beagleplay_greybus_of_match),
+	    },
+};
+
+module_serdev_device_driver(beagleplay_greybus_driver);
+
+MODULE_LICENSE("GPL v2");
+MODULE_AUTHOR("Ayush Singh <ayushdevel1325@gmail.com>");
+MODULE_DESCRIPTION("A Greybus driver for BeaglePlay");
+MODULE_VERSION(BEAGLEPLAY_GREYBUS_DRV_VERSION);
diff --git a/drivers/staging/greybus/beagleplay-greybus-driver.h b/drivers/staging/greybus/beagleplay-greybus-driver.h
new file mode 100644
index 000000000000..47b601b7fff4
--- /dev/null
+++ b/drivers/staging/greybus/beagleplay-greybus-driver.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0
+ *
+ * Copyright (c) 2023 Ayush Singh <ayushdevel1325@gmail.com>
+ */
+
+#ifndef BEAGLEPLAY_GREBUBS_DRIVER_H
+#define BEAGLEPLAY_GREBUBS_DRIVER_H
+
+#include "hdlc.h"
+#include <linux/greybus/hd.h>
+#include <linux/init.h>
+
+#define ADDRESS_GREYBUS 0x01
+#define ADDRESS_DBG 0x02
+#define ADDRESS_CONTROL 0x04
+
+#define CONTROL_SVC_START 0x01
+#define CONTROL_SVC_STOP 0x02
+
+struct beagleplay_greybus {
+	struct serdev_device *serdev;
+
+	struct hdlc_driver *hdlc_drv;
+
+	struct gb_host_device *gb_host_device;
+};
+
+#endif
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
