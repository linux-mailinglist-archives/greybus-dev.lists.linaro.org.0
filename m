Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C427802198
	for <lists+greybus-dev@lfdr.de>; Sun,  3 Dec 2023 08:53:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 633753F98B
	for <lists+greybus-dev@lfdr.de>; Sun,  3 Dec 2023 07:53:35 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	by lists.linaro.org (Postfix) with ESMTPS id 0C1A93F98B
	for <greybus-dev@lists.linaro.org>; Sun,  3 Dec 2023 07:53:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=GRtu6cty;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.176 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6cb55001124so3498361b3a.0
        for <greybus-dev@lists.linaro.org>; Sat, 02 Dec 2023 23:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701590008; x=1702194808; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A333Tym+pDimr9g/5OsWQd95HIDuYjW7G190dYNC2Ek=;
        b=GRtu6cty0My3LcEApUAuSzlOEtTiu79rqzz4OkMBqUON12UE+BfSPMuRTXtOAf/Xzw
         4ic+vD9CAdZEjf+BoGNDAmxYkX4JNJgN5AsLLTz/n9cgpixwyGP7YxQfpmvHg/yIHhsb
         Kn7cHeBIJ3De2m6pypKAxqnzt7ZPpmnWSKQNzG4ke+6AZmuvMUI/OsTb+gebV6iS2ael
         Ly8yt5LLyWrokACuHOwxamEWxvVIjmWvmVPuUgY4M5XbkDFJquIEvwig3lxNSRNibNgg
         YCjeB4Iwfx1e/6SL5sUskpKJe11z5M91RwhDxddRE32/1Ze85aP3fAatDrg3xBk6rdKG
         JVIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701590008; x=1702194808;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A333Tym+pDimr9g/5OsWQd95HIDuYjW7G190dYNC2Ek=;
        b=QpLb4Skb+NtIqNFny3TAHs1Moa1J00WOD5KJOG0WAhUHYV4IfoasRVZif+oyNZ8wVY
         8eXsptalkK918x4js7Pp//r8SGQSTBgrq/MWEEKDQ0oq6lKtzpF1x/4bbzveVrOxiGEl
         ti8Rzf5TYOAz/uwnbF7mVAnBQedV5mG7vJPdaH1OUBxI0g593KAfMa5VzLSNGPEE1rnS
         63oPtHijY4YY02mv0rGtYiAFclvRkWzeHLbc6gZEQBK6pdQPFm7WESgiWBmlvIkY8j1O
         SosH+OufMkmM+4uJp05eMtRyowch0EPZxhe62pEUWEeqWSthAOy157XT02dN1gLy08V4
         pPmw==
X-Gm-Message-State: AOJu0YyGI1Q/MO0sbtqmJUdAF1rLHj2S0JKeJMSXTlrTCa2bWy75KmPs
	W6z7k6a0hQpF0tiCTNMWaiKegPTr4/k=
X-Google-Smtp-Source: AGHT+IEaeL/QJUdEdhw/TrA3CYikpm+3TLZXcxTxVLYZN1Kjy15Y7lh8gDlEDa6EJxRaf7uouhxGYQ==
X-Received: by 2002:a05:6a20:8427:b0:18a:e4ed:cc41 with SMTP id c39-20020a056a20842700b0018ae4edcc41mr2910284pzd.23.1701590008172;
        Sat, 02 Dec 2023 23:53:28 -0800 (PST)
Received: from toolbox.. ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id e15-20020aa78c4f000000b006ce4c7ba448sm280491pfd.25.2023.12.02.23.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Dec 2023 23:53:27 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun,  3 Dec 2023 13:23:10 +0530
Message-ID: <20231203075312.255233-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 0C1A93F98B
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.176:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,beagleboard.org,intel.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC
X-Message-ID-Hash: L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH V2] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Ensure that the following values are little-endian:
- header->pad (which is used for cport_id)
- header->size

Fixes: ec558bbfea67 ("greybus: Add BeaglePlay Linux Driver")
Reported-by: kernel test robot <yujie.liu@intel.com>
Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
V2:
- Ensure endianess for header->pad
V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO/

 drivers/greybus/gb-beagleplay.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 43318c1993ba..1e70ff7e3da4 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -93,9 +93,9 @@ static void hdlc_rx_greybus_frame(struct gb_beagleplay *bg, u8 *buf, u16 len)
 	memcpy(&cport_id, hdr->pad, sizeof(cport_id));
 
 	dev_dbg(&bg->sd->dev, "Greybus Operation %u type %X cport %u status %u received",
-		hdr->operation_id, hdr->type, cport_id, hdr->result);
+		hdr->operation_id, hdr->type, le16_to_cpu(cport_id), hdr->result);
 
-	greybus_data_rcvd(bg->gb_hd, cport_id, buf, len);
+	greybus_data_rcvd(bg->gb_hd, le16_to_cpu(cport_id), buf, len);
 }
 
 static void hdlc_rx_dbg_frame(const struct gb_beagleplay *bg, const char *buf, u16 len)
@@ -340,14 +340,15 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
 {
 	struct gb_beagleplay *bg = dev_get_drvdata(&hd->dev);
 	struct hdlc_payload payloads[2];
+	__le16 cport_id = le16_to_cpu(cport);
 
 	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
 		msg->header->operation_id, msg->header->type, cport);
 
-	if (msg->header->size > RX_HDLC_PAYLOAD)
+	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
 		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
 
-	memcpy(msg->header->pad, &cport, sizeof(cport));
+	memcpy(msg->header->pad, &cport_id, sizeof(cport_id));
 
 	payloads[0].buf = msg->header;
 	payloads[0].len = sizeof(*msg->header);
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
