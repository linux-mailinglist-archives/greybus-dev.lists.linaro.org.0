Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C121280340B
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Dec 2023 14:10:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7832343C40
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Dec 2023 13:10:31 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id 141D543C25
	for <greybus-dev@lists.linaro.org>; Mon,  4 Dec 2023 13:10:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=aACqTzgX;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1cfb4d28c43so14942645ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 04 Dec 2023 05:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701695424; x=1702300224; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YEZs6AO2flglBsYRf33FcA1+MeCcJm84o+twFj/3LKE=;
        b=aACqTzgXXUDC+SnLBiJT+FFB4nIv38lYeNzeIKdYFIQUqs3u6wTI4oFb4orBjrg1wo
         aKeZGmELqA6ezMjdtzggtj2IRQn6B8g6UZZ5kWHgCuj7HuvIqkpOdZui7qXXvhFih1B8
         nYZO3WX1zLDlLl4RJH/9mobbib1fLvglYngciERst6EIggbFQCdz4QN/pXbKwN8nmf0A
         92vi9r+1wDujAanxCP+0dhmeui3LJ5ICe1y8SJs9QifD3qUPyoM99ZF3gJy5MXgm82sB
         XQNtJyNzpHpiBqiyLbJVoM0t+WN0JdQGiAta+sjeijviecmT6q4BxlWoKyVq7tAmQ7Vz
         ogKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701695424; x=1702300224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YEZs6AO2flglBsYRf33FcA1+MeCcJm84o+twFj/3LKE=;
        b=YIDDYM6y+qY69UVeXh3gzjg9UW3olLtur1cFNicPS1Ys8dnhS2piluDiYMcVcNGe5X
         fi2i68UHMAd67THZb2PBbRTBYeHGWFIHEGpFh5+gViifrG7LaX0h3U+LQSdx/VVaKzo4
         a78cYyva7DQSJ+0Z5QntRrB+sHI5mDS1t7QC0T7sf5MjecCCMruj9e6WGt5IzhImFi52
         FXlMKGyF1/6n4NXrKJnSnCp+pgtlaOFJeviTZ9xmfuMAW3xEBMB2RipNI6f2exHFQcVU
         inJfD23DjuyMqpN7exWhBPu3DDaYMnBJs2w4tjnaPEGFb7DXO/NKip19mV9rCiCG9rky
         lUqA==
X-Gm-Message-State: AOJu0YySeWVLjBp5aJg4K8OEFvF4M6K8NKs/9rN1GP6qlI3kJCN/sVZG
	ozJ/RBA4rBoAOTy/plEkZuP7CpjXJzg=
X-Google-Smtp-Source: AGHT+IHVwYDW/+AveIbbt3flWO2G/FHnnRggyK48A9y0xbcxJ0x7dKWE6auKMZM89BN3OFNPUmw62A==
X-Received: by 2002:a17:903:191:b0:1d0:727b:251d with SMTP id z17-20020a170903019100b001d0727b251dmr1325812plg.137.1701695423710;
        Mon, 04 Dec 2023 05:10:23 -0800 (PST)
Received: from toolbox.. ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id e5-20020a170902744500b001d049ef0c1fsm6699156plt.190.2023.12.04.05.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Dec 2023 05:10:23 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon,  4 Dec 2023 18:40:06 +0530
Message-ID: <20231204131008.384583-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Queue-Id: 141D543C25
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,beagleboard.org,intel.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: ZAVYPDTH3SEOU77I5R7VGPXKI3GOMWAX
X-Message-ID-Hash: ZAVYPDTH3SEOU77I5R7VGPXKI3GOMWAX
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZAVYPDTH3SEOU77I5R7VGPXKI3GOMWAX/>
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
V3:
- Fix endiness while sending.
V2: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/thread/L53UN5ROSG4M6OE7CU5Y3L5F44T6ZPCC/
- Ensure endianess for header->pad
V1: https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO/

 drivers/greybus/gb-beagleplay.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 43318c1993ba..8b21c3e1e612 100644
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
+	__le16 cport_id = cpu_to_le16(cport);
 
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
