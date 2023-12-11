Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7911780C191
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Dec 2023 07:54:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 890C93EF33
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Dec 2023 06:54:40 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	by lists.linaro.org (Postfix) with ESMTPS id 5506443FB2
	for <greybus-dev@lists.linaro.org>; Mon, 11 Dec 2023 06:54:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=W6+kRawr;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.52 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-6d9d4193d94so3220140a34.3
        for <greybus-dev@lists.linaro.org>; Sun, 10 Dec 2023 22:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702277672; x=1702882472; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hc51N0Guq3dh4qtHiKdd3a9aKkvfTdIQRPa5z8w6MfI=;
        b=W6+kRawr0a6NsRg2wu12pDJfPJf9EsTjZJVY8btv8o/3mJmO25AzsrlsWAk5vLF/Mw
         TTlcY8TBa+8HMTMsX5F+s9ejK+4rYYUD2gGHSnn1E3+puwSEmDWtiHofLYlzyJR0sZK1
         fNzaQqczS0K8UX0nwq37gDXih3mYM3/+kKUeVDlSJoDLPeK5PvGMheYvLAZCopOR5n5i
         GLNFo7a54QbuzBjsvd1TbTiHfxemXgvIc9xbpD/CVs1quwgoZhRZNKOEVXcY6tUjx38g
         42fZ54L2OKlf/BD9cKUAM98AxoxaAxapo6BLGw4xUQ1yJ1TynyZoTUxwzzLdB8Uod7CL
         V6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702277672; x=1702882472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hc51N0Guq3dh4qtHiKdd3a9aKkvfTdIQRPa5z8w6MfI=;
        b=on7wG2txr2f1zk609gtWe3H9vZ/lRx4/IvlwDz2WUjlbnsV5r6AZhT6lWoqXMh6/+l
         FSebljzjnuLefIhgvwKQLlGHCJ70rJpmc8cck94LFCKlUSZtUADgs1BHU8bqphVXfFx5
         8gBwHZ5lRlCj36wkkhxvgb0I+6SJzisMJL0lNDcsx7Zg7kzTcbVqcGHFecbqVHpyRySG
         lg4uKy7Ax07Ji1cVQR21eQQAgs998ah5K3rfrvFPszYYVdcVDsRuCKg4MpO43Fu6lk9G
         U1XRwSgxN4HUXyPINtzGeeXw3E32Pj+BQf2YrkwyZAUjtyuYPOL0RziQJLFJWMQDI/U3
         8KgQ==
X-Gm-Message-State: AOJu0Yx0PCidhN6QR83/wSzqWgo0/8yBqT1iiV8XW5FTL0BjhdDcYDXA
	7e8FFKcekqslLX5IvGkDG+vR+uXNthY=
X-Google-Smtp-Source: AGHT+IGaDJwtovFWbUW/OCtOoXZjgCvKNh6kJN8YTIs9IpoZ8GpX+65B6q5nvjKSebbHFYqQtxvP3w==
X-Received: by 2002:a05:6830:914:b0:6d8:80a7:7e79 with SMTP id v20-20020a056830091400b006d880a77e79mr4893189ott.30.1702277671739;
        Sun, 10 Dec 2023 22:54:31 -0800 (PST)
Received: from toolbox.. ([103.46.201.248])
        by smtp.gmail.com with ESMTPSA id r1-20020a62e401000000b006ce91d27c72sm5751054pfh.175.2023.12.10.22.54.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 22:54:31 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon, 11 Dec 2023 12:24:18 +0530
Message-ID: <20231211065420.213664-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231211065420.213664-1-ayushdevel1325@gmail.com>
References: <20231211065420.213664-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 5506443FB2
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.52:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-ot1-f52.google.com:rdns,mail-ot1-f52.google.com:helo];
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
Message-ID-Hash: HE4ZASDJAOJZLXRSR7AXVL6U24QNVBU2
X-Message-ID-Hash: HE4ZASDJAOJZLXRSR7AXVL6U24QNVBU2
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, nm@ti.com, yujie.liu@intel.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH V2 1/1] greybus: gb-beagleplay: Remove use of pad bytes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HE4ZASDJAOJZLXRSR7AXVL6U24QNVBU2/>
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
 drivers/greybus/gb-beagleplay.c | 55 ++++++++++++++++++++++++---------
 1 file changed, 41 insertions(+), 14 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 1e70ff7e3da4..82dc8a25e6b9 100644
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
-		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
+		gb_frame->hdr.operation_id, gb_frame->hdr.type, cport_id, gb_frame->hdr.result);
 
-	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
+	greybus_data_rcvd(bg->gb_hd, cport_id, (u8 *)&gb_frame->hdr, gb_msg_len);
 }
 
 static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
@@ -336,10 +350,23 @@ static struct serdev_device_ops gb_beagleplay_ops = {
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
+ * Greybus HDLC frame has the following format:
+ * 1. le16 cport
+ * 2. gb_operation_msg_hdr msg_header
+ * 3. u8 *msg_payload
+ */
 static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_message *msg, gfp_t mask)
 {
 	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
-	struct hdlc_payload payloads[2];
+	struct hdlc_payload payloads[3];
 	__le16 cport_id = le16_to_cpu(cport);
 
 	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
@@ -348,14 +375,14 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
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
