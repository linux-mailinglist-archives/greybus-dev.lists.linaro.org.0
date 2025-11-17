Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 50CA2C696F3
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7ABA93F95E
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:44 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	by lists.linaro.org (Postfix) with ESMTPS id 9F5E03F80B
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=R0oRVdz+;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.179 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2957850c63bso47840245ad.0
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403634; x=1764008434; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JP2wrZeI6D9TXpbQnvPHW7fbQMn9CB3PYna6fF90LSo=;
        b=R0oRVdz+yBj0T30RQtSJ9Alix9IzRiRfSIwrVonUUeWeu9EbvSUUQ5IE1zT/gmtov3
         z1F/PZ/WaJXal3+d9WGubdhX4YWIKGNE08AE8ZPsDeLB7abCUA6TNSliYLqlN+I2CeBA
         fkfp43xH06AJTD01Gcq+8UvH9mRbF74TmXFSYRf/7Njgnz+kpaqZYa9l5exjo33L7EA2
         1P+pnSOuWpbkG8Azz/mNrmttFY8zOjyKzngxo1DIpXeV0YNvOAJGO/fVP50NnYdWtYGG
         LEfSjnOGil/+WBTT147D1WVMageYWOxm+n+6+k2fNVngBxUct8k77zd/Rx39YPaxk+Zj
         xqCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403634; x=1764008434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JP2wrZeI6D9TXpbQnvPHW7fbQMn9CB3PYna6fF90LSo=;
        b=Rjl/v1yXblsTmcnQm2qIwJNtWHGF03bObqHMS8y1YLgqUT/kHjiHysn+LYKWFQg6Bn
         HbmlmAbnE+inB63Vk0jfjjNnZdrI0BSXWXJQdlN4UVEvg92gTw793DubbohIwcoUHSJf
         bsxyvXAtgEO1hbmPOEVBhvUHOUgU77bL0A3Au+aBoy+jMKgw9tvxGCKR2DcQNd+q59SV
         vTX55XxfdkkIyDOYKsdeDL3b4whlLmbJafWuUwW0A+7Ni7hQsjepSJl/FDVybX7Uict4
         zP1vZ2bQF0Vdd/xBLW/A32Him0qmqU3XLW87wXYPVbCrx/OvFE6OFgZV9pHO+jA2Kx16
         t7AQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVttiVQ7RTnbPPuo1tD+lJZ96CUm71Rf4ErN7ilTKeXqcdmb6JmZmrB7qUeX29EAj78kMfk83Fm/6aCQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YwLmV7L4ddS/Kof/AwMuXrJTQE1zfpqjC3HA5RHBMlQsoFuiAkG
	LbIUECKb5sbxcGfrdqnulBd5Ng0VDvqrjIZpcaW8GTAnmLODtqmj/ay+
X-Gm-Gg: ASbGncuTX2QRPfwVAOx2eWvgJURj0KFAK/z3Rau3GxBD4ohs083AbwpbsaDgrpmpgN7
	rmUSQIKWamguY/nXIEdgcEPA4pGz4vqTq7J6MDgJVMPVoqzG8dfHh8zPcyWX1e+y4+xBJez3hHM
	27pHATJX67Qfmq6yyQQHjbY8ymGo1sTqtL1FWk8Dr8lHHvuvn0L9elxX4XO3DlspuQ2KbHnOY2P
	W7YjQ4BzlOoGms9v/9/yFHxgPwrnZmWIIQpPs1nAqyuScpeyoJJwCj+eZbRclQlCRvshlYudWDj
	GTed09dcVCGsVVhnEwTybLC3TWffpe9pQ9q6iZHLTto/gRTToqtFUaBBvO6RCNnuEngcse1dkx3
	hHmDYt8mHcAktNHaU+CuKYA6SeChFURud3eZMKN9cLI+aQOx8nW8eD6qyImXYuVSsWUsS2lOPxn
	JwXLlrqTH/krpUHrdly5AF1W+c6Ayy9gUfuB6varjRHDDHKlE=
X-Google-Smtp-Source: AGHT+IGhTPF1sTHa6cqCXg3SnMdIuxMoLuexsuKyRYKG+8XU0Zaj4kyV9wlnF7kX64s4nA48+hQdHw==
X-Received: by 2002:a17:903:1a28:b0:297:e1f5:190b with SMTP id d9443c01a7336-299f55a1accmr2855585ad.22.1763403633764;
        Mon, 17 Nov 2025 10:20:33 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:33 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:18 +0530
Message-ID: <20251117181818.118139-14-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.179:from];
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
X-Rspamd-Queue-Id: 9F5E03F80B
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MDXWA7RULUEE4DT36E5ITHV7HYWI56TG
X-Message-ID-Hash: MDXWA7RULUEE4DT36E5ITHV7HYWI56TG
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:57 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 13/13] staging: greybus: usb: remove obsolete FIXME about bridged-PHY support
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MDXWA7RULUEE4DT36E5ITHV7HYWI56TG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The USB bridged-PHY protocol has never been supported by the upstream
USB core and cannot function. Remove the obsolete FIXME and 
keep the protocol disabled with a straightforward explanatory comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/usb.c | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/staging/greybus/usb.c b/drivers/staging/greybus/usb.c
index 1502641f5dbb..e1c9966ab678 100644
--- a/drivers/staging/greybus/usb.c
+++ b/drivers/staging/greybus/usb.c
@@ -194,23 +194,10 @@ static int gb_usb_probe(struct gbphy_device *gbphy_dev,
 	if (retval)
 		goto exit_connection_destroy;
 
-	/*
-	 * FIXME: The USB bridged-PHY protocol driver depends on changes to
-	 *        USB core which are not yet upstream.
-	 *
-	 *        Disable for now.
-	 */
-	if (1) {
+	/* The USB bridged-PHY protocol is not supported by upstream USB core */
 		dev_warn(dev, "USB protocol disabled\n");
 		retval = -EPROTONOSUPPORT;
 		goto exit_connection_disable;
-	}
-
-	retval = usb_add_hcd(hcd, 0, 0);
-	if (retval)
-		goto exit_connection_disable;
-
-	return 0;
 
 exit_connection_disable:
 	gb_connection_disable(connection);
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
