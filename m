Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1747EB16E
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Nov 2023 15:01:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E6D75411F3
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Nov 2023 14:01:25 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	by lists.linaro.org (Postfix) with ESMTPS id D872240D2C
	for <greybus-dev@lists.linaro.org>; Tue, 14 Nov 2023 14:01:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=bz2HIcrI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.173 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1cc2f17ab26so41526105ad.0
        for <greybus-dev@lists.linaro.org>; Tue, 14 Nov 2023 06:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699970477; x=1700575277; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LPaXAqYY/yDcBKqyxlX4UqgDs4pXQVFVUpt4WE1cEdQ=;
        b=bz2HIcrI+jSJr17UBSU1rF0wI9GF7a0Rxvk6vKIl9taEbCzuwyCWz3UAQTRR8U+UJC
         Jiqxb2Wa1iW4OdK7B2OWu2FYeOi91Qj7x4c0km1x28j6NsqKghmrZDE/ga350vj/0/7K
         wQaSkwIsa/zF6r8mjaW/MI+PMetKiUhix7tp9fKv2pMX9/ZQFYvyyJORT3d7UJRtbmpw
         JDcfKqsFcZ0xfhgBAh9NttJqiT8BIvLDlJOo+M/Tc7okw7vs86g1vO049sCHmRoyf3DG
         ZERcY+N8GAhL4YpGXviGRXWtxdVx3cR3cvf9fqBfbB0BFlEI1wFYFbeUAt19YqG96Z3z
         qBEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699970477; x=1700575277;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LPaXAqYY/yDcBKqyxlX4UqgDs4pXQVFVUpt4WE1cEdQ=;
        b=fGGaGHvhjhB6/frq5w5YqsabI+hQLm0/xecabUPl07/TcoW/BA1HDN5xX22ncbJWnW
         uVvZElfipyhBBViFFedOjOm0P+Te6FyGRVHemjV7BJFHMYEUKpFDR8Vk1MBdfc+mpOIb
         Fs26dhTAWf3AyWaEkgdqaGThzIpPLfj0ydDsQEVljNra+6zqXGjVfcVu64yPyBWo0RnO
         upAaSY+dVMWOyPqlzYojqtiC5NKGGv1DC4edpRegQatflCED+uajZRN3Ml2RP74br3co
         UbkkKvHNQ7EqJZsFlLBa+8QBHvYk1MfxtSFHE1AqdwNkykGJgR4LzmWW7ooqNmAgPp0T
         g46w==
X-Gm-Message-State: AOJu0YwOGK/oQPZid0De30/bJqmfunpS/CjPjozYJg8/ZCA/PS0+cwcB
	zIQ7GcYnivryrGwh1dEegDw/m192nQ4=
X-Google-Smtp-Source: AGHT+IEoHhyrD/xuzw14KbeXzPEVZjc1R4xA1mhgyGBfGzYY6Y9jBHpZuSq+LvdRsFrMDvr7dsHpjg==
X-Received: by 2002:a17:902:ce0f:b0:1cc:7a8e:606b with SMTP id k15-20020a170902ce0f00b001cc7a8e606bmr3017314plg.43.1699970476774;
        Tue, 14 Nov 2023 06:01:16 -0800 (PST)
Received: from toolbox.iitism.net ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id c5-20020a170902c1c500b001cc31dcec49sm5654521plc.146.2023.11.14.06.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:01:15 -0800 (PST)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Tue, 14 Nov 2023 19:31:02 +0530
Message-ID: <20231114140103.784484-1-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D872240D2C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.173:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,vger.kernel.org,intel.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
Message-ID-Hash: K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO
X-Message-ID-Hash: K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Ayush Singh <ayushdevel1325@gmail.com>, johan@kernel.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: gb-beagleplay: fix restricted __le16 degrades to integer warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7UJ6PEAWBLNDMHLT2IO6OP5LQISHRUO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

greybus message header->size are of type __le16, so to fix this warnings
we are using le16_to_cpu() macros.

Reported-by: kernel test robot <yujie.liu@intel.com>
Closes: https://lore.kernel.org/r/202311072329.Xogj7hGW-lkp@intel.com/
Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/greybus/gb-beagleplay.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index 43318c1993ba..b3f47b5cbbfa 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -344,7 +344,7 @@ static int gb_message_send(struct gb_host_device *hd, u16 cport, struct gb_messa
 	dev_dbg(&hd->dev, "Sending greybus message with Operation %u, Type: %X on Cport %u",
 		msg->header->operation_id, msg->header->type, cport);
 
-	if (msg->header->size > RX_HDLC_PAYLOAD)
+	if (le16_to_cpu(msg->header->size) > RX_HDLC_PAYLOAD)
 		return dev_err_probe(&hd->dev, -E2BIG, "Greybus message too big");
 
 	memcpy(msg->header->pad, &cport, sizeof(cport));
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
