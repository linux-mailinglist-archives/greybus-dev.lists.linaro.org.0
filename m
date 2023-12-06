Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2359C807356
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 16:06:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 33DC33EF7C
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 15:06:23 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id 4F2D5440EA
	for <greybus-dev@lists.linaro.org>; Wed,  6 Dec 2023 15:06:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Uk1xpuLH;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.177 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-6cea1522303so133147b3a.1
        for <greybus-dev@lists.linaro.org>; Wed, 06 Dec 2023 07:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701875174; x=1702479974; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wvGGeUhAcBlY5JsYq0v3hWMNXvHne0yXH5FlnUniu4=;
        b=Uk1xpuLHxjET2Y5RdRNJTJHXaIrD1OwMbwZNg8dNqbZXT/2yHi1rSH8g07Hs2LKPk+
         cWjfmeD6z8Rv4v7ovo/xWDudmMKgQm9IWgVmY6HjzCNE+hoGg6ozJY2pfqXR0rC4G+qK
         TPld0hxUq8hO9wzz+GAtgceQcrxt7zWpjv3TY+B805SEFmckhQAERtAHKwMzzRz4e/4j
         wQzDDR3zL/1rEafU+1LKiHmNPGpJM1b3KN1FyMm0gN7CQeJxSoYkpSZCLvofeGcQGZup
         xoG1c9CykvdtUuejIFpzNq2yKjXre1Ec0Vw2O2YSDDQSqZ5Iwn5frlQDKf09MBYiBHp5
         FICw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701875174; x=1702479974;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wvGGeUhAcBlY5JsYq0v3hWMNXvHne0yXH5FlnUniu4=;
        b=LazHdQrtBjWdX4o1JOa31KaLIQb+IKdDibtygNuNn04xbzhpBx7Ydm+GEnecvp0V66
         bQR8N66T5D0lKez5vUBYHy6gdwAyzAdcm0pZq/2Iqu3NsSt4VG/yPeMwEmGsjhjTx49S
         p3sreO6+QZsm2H4Qkhk2BeAPMubTbz9eLRq1HXaOFNoMQ1VcWZAZkY3bBUp51fpGkwj+
         N367irmqyFM3Fx2BMWFLGCeupzO/XpV+/8qbZQf4vCwPRC1Jr0nYFkav1g0xjyzP1bpq
         II1zYGnsjPTVSAvEq6ZGIAix5S54BKnbsMw1ZyrPsyHILqD/4R/5c/1q21NpUayjBHBZ
         1iQQ==
X-Gm-Message-State: AOJu0YwLe9qT6ENjGrisrGX32mqcBc2+ZYkiMi3F7Ls4RCtFfnDKTTr8
	o2WRzzY7XhXTIG+HQ6PtIY6HpTrYeKnzjQ==
X-Google-Smtp-Source: AGHT+IHBbuqWhu8nKhe+H9p6HqLEg9xo+xunL7MYEGAAVkWuTI3aJsFG2pqQgZkaRdr6gs+jjP6Uaw==
X-Received: by 2002:a05:6a20:5141:b0:18f:97c:4f6d with SMTP id b1-20020a056a20514100b0018f097c4f6dmr532514pzc.121.1701875174553;
        Wed, 06 Dec 2023 07:06:14 -0800 (PST)
Received: from toolbox.. ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id s5-20020a625e05000000b006ce7ed5ba41sm96885pfb.55.2023.12.06.07.06.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 07:06:14 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed,  6 Dec 2023 20:36:00 +0530
Message-ID: <20231206150602.176574-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206150602.176574-1-ayushdevel1325@gmail.com>
References: <20231206150602.176574-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4F2D5440EA
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.177:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pf1-f177.google.com:rdns,mail-pf1-f177.google.com:helo];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,beagleboard.org,ti.com,intel.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: KAS7KI6JUB7J3YNHTHUFMNF2GVTWZWRE
X-Message-ID-Hash: KAS7KI6JUB7J3YNHTHUFMNF2GVTWZWRE
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KAS7KI6JUB7J3YNHTHUFMNF2GVTWZWRE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make gb-beagleplay greybus spec compliant by using a wrapper around HDLC
payload to include cport information.

Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
Reported-by: kernel test robot <yujie.liu@intel.com>
Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/greybus/gb-beagleplay.c | 44 +++++++++++++++++++++++----------
 1 file changed, 31 insertions(+), 13 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 1e70ff7e3da4..fb40ade9364f 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -85,17 +85,35 @@ struct hdlc_payload {
 	void *buf;
 };
 
+/**
+ * struct hdlc_greybus_frame - Structure to represent greybus HDLC frame
+ *
+ * @cport: cport id
+ * @hdr: greybus operation header
+ * @payload: greybus message payload
+ */
+struct hdlc_greybus_frame {
+	__le16 cport;
+	struct gb_operation_msg_hdr hdr;
+	u8 payload[];
+} __packed;
+
 static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
 {
-	u16 cport_id;
-	struct gb_operation_msg_hdr *hdr = (struct gb_operation_msg_hdr *)buf;
+	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
+	u16 cport_id = le16_to_cpu(gb_frame->cport);
 
-	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
+	/* Ensure that the greybus message is valid */
+	if (le16_to_cpu(gb_frame->hdr.size) > len - sizeof(cport_id)) {
+		dev_warn_ratelimited(&bg->sd->dev, "Invalid/Incomplete greybus message");
+		return;
+	}
 
 	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
-		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
+		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);
 
-	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
+	greybus_data_rcvd(bg->gb_hd, cport_id, &buf[sizeof(cport_id)],
+			  le16_to_cpu(gb_frame->hdr.size));
 }
 
 static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
@@ -339,7 +357,7 @@ static struct serdev_device_ops gb_beagleplay_ops = {
 static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
 {
 	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
-	struct hdlc_payload payloads[2];
+	struct hdlc_payload payloads[3];
 	__le16 cport_id = le16_to_cpu(cport);
 
 	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
@@ -348,14 +366,14 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
 	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
 		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
 
-	memcpy(msg->header->pad, &cport_id, sizeof(cport_id));
-
-	payloads[0].buf = msg->header;
-	payloads[0].len = sizeof(*msg->header);
-	payloads[1].buf = msg->payload;
-	payloads[1].len = msg->payload_size;
+	payloads[0].buf = &cport_id;
+	payloads[0].len = sizeof(cport_id);
+	payloads[1].buf = msg->header;
+	payloads[1].len = sizeof(*msg->header);
+	payloads[2].buf = msg->payload;
+	payloads[2].len = msg->payload_size;
 
-	hdlc_tx_frames(bg, ADDRESS_GREYBUS, 0x03, payloads, 2);
+	hdlc_tx_frames(bg, ADDRESS_GREYBUS, 0x03, payloads, 3);
 	greybus_message_sent(bg->gb_hd, msg, 0);
 
 	return 0;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
