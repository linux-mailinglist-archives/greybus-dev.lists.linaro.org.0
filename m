Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B696815EDF
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Dec 2023 13:11:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7CAED40B25
	for <lists+greybus-dev@lfdr.de>; Sun, 17 Dec 2023 12:11:49 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	by lists.linaro.org (Postfix) with ESMTPS id 251E240B22
	for <greybus-dev@lists.linaro.org>; Sun, 17 Dec 2023 12:11:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=W3S8QEyd;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.174 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-6cea0fd9b53so977694b3a.1
        for <greybus-dev@lists.linaro.org>; Sun, 17 Dec 2023 04:11:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702815103; x=1703419903; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5B3mqHNd69pjnnaemv6zfW1NjSV7fm40AY3sI1VM7k=;
        b=W3S8QEydX4KCXNN/cYn4kWyGnUHDrahBz71Hu2SWOTNTJOCOFpavouHuiy3W9tAbA+
         8D+1mt7AMZCBcp19LCHN23WgvXuWiVktlB2Sj5tZXsvnikkFz9zjudl0Rwz3+35bjV6P
         8yHzxD8smlQSyIGzLYBUZ5A9YFZL57qrS7Vd6Q05lOWCnhR1z8OvxxRruc1YqPIOKQIH
         4UgKgAym+AR6n87eq7JYfLg8Xx+7/xJ6r0F7js+NfCvtF7zRcAIPj4oteBftevLZoPDj
         jQHPbVnKgtZdM4FBSjopYpP1vTmWWWjmXZeSWRrb60XZvvCNt7FWSCchxQQhW0hax+ik
         K/Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702815103; x=1703419903;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5B3mqHNd69pjnnaemv6zfW1NjSV7fm40AY3sI1VM7k=;
        b=FtLDKC/iUrcg/Pn5dE7D91jHyBipNeqPlTp0piMM8o0fzjrLndABDolGm8sn2QTa4O
         tlXedL85DHOvtGSctO9Bhbn/+YUeIe8cxrpvZtUotR/pFcidan7n0zIltJOoTnkyfbmm
         tTUKbYGTADMiBSoQhKAW7JztGxYnf8BHLEbkmpr3iPRjN6GuNNfAw4vabzoOfceWagsR
         pY8EAWGkPjcsXLrmBYxDpkOwbnXKrsF9HBJNWWd8DCGKM9yEGbdJxVnBWk6rNi4ARjim
         L1eomobJn7WODwfDWW06/UdgiQHun1UhBfTA1mmNoRP3PRHDc6tHvkgUCEollD31/PI4
         4piA==
X-Gm-Message-State: AOJu0Yxn6pp59xR249xKiG+VshCedC+w0KmMzlBOq7fJClSyoBqfZd/W
	fyZg2O5ChnO8cS/4FWk4Zb38v9Xl0t8=
X-Google-Smtp-Source: AGHT+IEIl3lE8PgaTlWXLssdOfGnOLCyI5FbaO77WvwU17J9L/pW22HtRy3t9oF4ZVNI5Y/gpt7u4A==
X-Received: by 2002:a05:6a00:88c:b0:6ce:2731:d5c4 with SMTP id q12-20020a056a00088c00b006ce2731d5c4mr8114366pfj.53.1702815103381;
        Sun, 17 Dec 2023 04:11:43 -0800 (PST)
Received: from toolbox.. ([2406:3003:2007:229e:ac29:68d8:877:4f72])
        by smtp.gmail.com with ESMTPSA id it21-20020a056a00459500b006d5a62c612asm890156pfb.215.2023.12.17.04.11.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 04:11:43 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun, 17 Dec 2023 17:41:32 +0530
Message-ID: <20231217121133.74703-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231217121133.74703-1-ayushdevel1325@gmail.com>
References: <20231217121133.74703-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.174:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,beagleboard.org,ti.com,intel.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 251E240B22
X-Spamd-Bar: ------
Message-ID-Hash: LRYMR45ASBGH2O2UB7GVXWAPJMPILBFS
X-Message-ID-Hash: LRYMR45ASBGH2O2UB7GVXWAPJMPILBFS
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH V3 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LRYMR45ASBGH2O2UB7GVXWAPJMPILBFS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Make gb-beagleplay greybus spec compliant by moving cport information to
transport layer instead of using `header->pad` bytes.

Greybus HDLC frame now has the following payload:
1. le16 cport
2. gb_operation_msg_hdr msg_header
3. u8 *msg_payload

Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/greybus/gb-beagleplay.c | 58 ++++++++++++++++++++++++---------
 1 file changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 43318c1993ba..7d98ae1a8263 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -85,17 +85,31 @@ struct hdlc_payload {
 	void *buf;
 };
 
+/**
+ * struct hdlc_greybus_frame - Structure to represent greybus HDLC frame payload
+ *
+ * @cport: cport id
+ * @hdr: greybus operation header
+ * @payload: greybus message payload
+ *
+ * The HDLC payload sent over UART for greybus address has cport preappended to greybus message
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
-
-	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
+	struct hdlc_greybus_frame *gb_frame = (struct hdlc_greybus_frame *)buf;
+	u16 cport_id = le16_to_cpu(gb_frame->cport);
+	u16 gb_msg_len = le16_to_cpu(gb_frame->hdr.size);
 
 	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
-		hdr->operation_id, hdr->type, cport_id, hdr->result);
+		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);
 
-	greybus_data_rcvd(bg->gb_hd, cport_id, buf, len);
+	greybus_data_rcvd(bg->gb_hd, cport_id, (u8 *)&gb_frame->hdr, gb_msg_len);
 }
 
 static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
@@ -336,25 +350,39 @@ static struct serdev_device_ops gb_beagleplay_ops = {
 	.write_wakeup = gb_tty_wakeup,
 };
 
+/**
+ * gb_message_send() - Send greybus message using HDLC over UART
+ *
+ * @hd: pointer to greybus host device
+ * @cport: AP cport where message originates
+ * @msg: greybus message to send
+ * @mask: gfp mask
+ *
+ * Greybus HDLC frame has the following payload:
+ * 1. le16 cport
+ * 2. gb_operation_msg_hdr msg_header
+ * 3. u8 *msg_payload
+ */
 static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
 {
 	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
-	struct hdlc_payload payloads[2];
+	struct hdlc_payload payloads[3];
+	__le16 cport_id = cpu_to_le16(cport);
 
 	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
 		msg->header->operation_id, msg->header->type, cport);
 
-	if (msg->header->size > RX_HDLC_PAYLOAD)
+	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
 		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
 
-	memcpy(msg->header->pad, &cport, sizeof(cport));
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
