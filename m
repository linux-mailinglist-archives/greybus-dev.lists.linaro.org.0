Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4600FC696DB
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 644F33F911
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:18 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 3BF643F8F2
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=OqQ2Q9GN;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-297ec50477aso33494955ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403616; x=1764008416; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UjqzAiWwrsjclt01pIzrstO3S2VH3ET/FvdQWeF1I34=;
        b=OqQ2Q9GN3Nrjd0nZfyi01R/+ncuLpdln0LDqYaJUw2N8ikdGlCbPPAfWXA/FLbygf+
         kIYHKcjsAmVX/uqcE/5YVPRF8stKHsY0ddDfJ8BaDwVUkf9IVp0Cf/q2Pe/R8ev7qr8B
         mE0pAAuuCgsY3i/R58/CsjJG0WGbLOeW8b2xqGx9Ye0WgoEW+kbo4TvwBinmMAiOFmX6
         EcitlLdTJLdZMY9haEbxksB9k/GBeSx+SckXFwy9Y/P8K/R4iq6DKHUikcy3wXOzARE2
         CiPoFL6uDVjq3cF6x3ww6Q4ZdPEODY3d0cYcu2o9+GEITJ/y9yMk37xH1Rucm8gMykSL
         16ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403616; x=1764008416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UjqzAiWwrsjclt01pIzrstO3S2VH3ET/FvdQWeF1I34=;
        b=K6wt55JN9CHNAiwgFzmgx2pQNyTs28+4R9Ncuhe3k23d431ECn4gf/wW9qCEJjJatp
         Y6mgUa+M4wo4Kn94fkKyUM/9IAPQsznouxuNZp7CAJCQc/SKPGXPIC3Lo1xhyKT+TTjZ
         J97pbhbtK8mkrXyMt+5Gg9V9Cz87uT99d6v9Q/jNt+YunXpzqaUqB3q7cA2/6SFfFz4e
         c5sLV4M2WZDhRc0j7Y3qJTM9cR2eX7RB0tfWD+FBBaBk55geYood2l6flk255611V/SG
         pDfBZ5k/V7seh94aaqM1WewINR3tkweuECyLnef9kkyTYSUxeUxgDecaysFcu8V9CUPG
         p2/g==
X-Forwarded-Encrypted: i=1; AJvYcCUaQIicf5WtNlxGsIrPlyOq8DJdjTTqYJidReGg25VB2UPmnGC7p9C33Sr3C1ROhRTCbvq3zt+cz2D4XQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YyBRcMPPxxoj8fk+LA97nWDT+J+KhgjRswRuZBpmSsEdj/LdiaG
	btYwtynQvASaWUar8cJWAF5eMlv23h5BsJwbEdNyXLoZE67wcFc+NgiH
X-Gm-Gg: ASbGnctpMdqsl135ENthRHOjL+cSz2F6nMWB2xP0rBb0l8FRrN8ckFSbFJqifAgrgUL
	hN2OnggtLYC+dvWrVZfVCMzV5aMSch1SeyLWe0dYOcQ6bnuJbMUP+CZpScH1iO0G3NnR5niM+gc
	04hU/KOUDIvN4Kc+5leNzVi6hZ47Bq1TwMctKgVXn85CjsfnC3IxP0t79GorZwXS0I1xGM5cCad
	Vnzn5HEeEZqjqSutLjiZKWM28hcBJfg1ceDluttdRquxtrj1g2nhzM5mEvwX41IhFZvBnHl7C4j
	sqsbXPkc1GQ7dWUoeFSzFCUfbNvgXqKcpZam7gIxF8Ynhj67C0tTG5qF4jj13ZBX3tBGL5jcANj
	YXysKYVvfDzRNnTCPCyXYJI6bdxLDwvrM9F3crc+BoO8K8EfyXab8pnbYun/vjiqQOdvM/QPN0v
	JrSEZ285Yh9IZQwD5nxsT+w1smXPis/o1tW6/y10RxKCuS/CI=
X-Google-Smtp-Source: AGHT+IGNimAp9gYrPl/7sxgvmOA2TeakVUZuDDuPhX4tty8w/qcb119YFa07lwgYOGmZvI04rl3s+w==
X-Received: by 2002:a17:903:2990:b0:295:6117:c597 with SMTP id d9443c01a7336-299f54f6849mr3201775ad.5.1763403616359;
        Mon, 17 Nov 2025 10:20:16 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:16 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:12 +0530
Message-ID: <20251117181818.118139-8-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 3BF643F8F2
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YSDSLIAF5TTPCSANC7NU26BY7X657Q7E
X-Message-ID-Hash: YSDSLIAF5TTPCSANC7NU26BY7X657Q7E
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:37 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 07/13] staging: greybus: bootrom: remove obsolete FIXME around firmware filename logging
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YSDSLIAF5TTPCSANC7NU26BY7X657Q7E/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A historical FIXME suggested converting a dev_info() message to dev_dbg()
after all Greybus modules reported valid IDs. Greybus hardware is stable
today and the firmware filename is still useful to log at info level, so
remove the obsolete FIXME and keep the existing behaviour. Replace it with
a concise descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 156212301d58..8665be86dae6 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -165,10 +165,7 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
+	/* Log the firmware filename being requested */
 	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
 
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
