Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 304BBC696E1
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5877B3F92C
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id BBFB53F8F0
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=QPfAu+a4;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29812589890so59749975ad.3
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403622; x=1764008422; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=neAc1fzEywgbonmaIJCf4t+yzsh2psg4rz9WiqXqPHw=;
        b=QPfAu+a4/ny+wSIWoATdW4HV41uIlIndhfT96AP1EfQ1qM+E0RF9kkPiO8VorOAn6d
         2E36Ax2n5xGKH8GOOtYffv93p7Si00vX1cqXcSqlb9eW67H3S5atd8qbww0d1E/Ma00E
         /eYLDWqvabucf2qtWZorfIlZbhXDTur7VNbpmaF7vRxf06HIRtMly4sf3ZkrPXm7S4cA
         TibT/104U4CkPUkzF0G4UdpI35zLizu9HVyxuwvuHydtQe1aujKzjxhktqQvud2QdCha
         9TBZI21yidtOtXdSVhoL0F5k+COnisRNRkzGA8hB0PJ7KhQoDOPj5cvUDz7USLLk6UEF
         EWvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403622; x=1764008422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=neAc1fzEywgbonmaIJCf4t+yzsh2psg4rz9WiqXqPHw=;
        b=YSC5MYcFgWc9Tl+Z/SOdLiK+gCZ9Fi8tclDzsNjVI5U0ojM57s7JKl6Jc4E5JQwjZv
         pzJyEj9ZuOXRmH83x4u27BVFFXe4pP2CKV5snABqyP2SKeeA6U38vw4bcNF+UgJiHy3Z
         +U/vMdWXhjkcyMdS1th+K2FCiL4Iz5vYbK3EN7gzXcTmJVan5M05d8ktOaCwWuvH/dio
         qTfksXTAkkRaWaY0+0sZPfVg6oe2vT1AAN9F9aqWNOGeghP9axhYVjJRrUkhvkBRGuRW
         X8t39fqBXfJqdNth4hTO9tcK2evn83V3Y9AWqzlApdaDs8GHb8ufazjj4/L5NY5TWHZp
         uASw==
X-Forwarded-Encrypted: i=1; AJvYcCXlZ120T9gR4poCslkbp44oWCVdOFDeuGCkhlKr0/sNkLWePKTbSSI8dZnejh05QSDnj2J/bOBZX9W1OQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxHQL2oCdFr93AG8zthp85SIHJcs8NSiWJRJeec4/tAVO1PsOv/
	BFbS90TaMvjHWazqyHxlk/24UfDlUb15R6eYZP5RBF10MVYE++6eyNsZYRB9HA==
X-Gm-Gg: ASbGncsDYt+PGU3XmtSGV3HuY707YQuiH28Mg2ingQPZal0Hzzd+0J/TfBzT6BAM49i
	CVZf//AiNcZxoBa8hOZwe/r+33YdsnM7BKzodjXYH7Q/9J0CGeyQMTGbpuHeFoeYdmIDX8XoXBN
	BoC5SUmjtmT/o3WSoc5bmnU+nBVlhsJZ/WA5P8X/fapQWmxaxP8aokK/TXhZw1C0Eqhs1WoPfPt
	hXB1bZoM+JJU25aENSXHyvohE+iWY2DncFNXH6E9Kk5gWPv2hjrS2wExo4VxzmTIeiftNvXNrqZ
	UNgwQpMszNDV7BYSED5jW+D0lCEagLuVMwRJd6svd+5u89FYAFkRXJNjfDncTBCB0TRNqplh9pk
	Bt7uW1SpPpL5RXueE/VTrhl40vqzKysHXlT3DSCOKZmj1JD1Y80FO61QhFYCFN8P3LWKKLJEvCe
	QYp/hDCgmlfKAeX3ehaj646/mVpWd7LTXSN4LKbyeuAniR5bw=
X-Google-Smtp-Source: AGHT+IHvlrw9H7LOPt7/x1QP7pbZWINFKvZSD2bl+TGs70GnuxLQ8m0Evz2VyuGAaA8HOQe3/n8img==
X-Received: by 2002:a17:903:244a:b0:298:1422:510d with SMTP id d9443c01a7336-2986a7435cfmr172152565ad.48.1763403621825;
        Mon, 17 Nov 2025 10:20:21 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:21 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:14 +0530
Message-ID: <20251117181818.118139-10-ayaanmirzabaig85@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
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
X-Rspamd-Queue-Id: BBFB53F8F0
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XM7FP3TVE6LPVEYWVIEU3NHWDPVWV7EZ
X-Message-ID-Hash: XM7FP3TVE6LPVEYWVIEU3NHWDPVWV7EZ
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:55 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 09/13] staging: greybus: loopback: remove incorrect FIXME about async wait
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XM7FP3TVE6LPVEYWVIEU3NHWDPVWV7EZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The comment suggested that gb_loopback_async_wait_all() was redundant
because the connection is disabled earlier. Disabling a Greybus
connection prevents new requests but does not guarantee that previously
submitted asynchronous operations have completed. The wait is still
required for safe teardown.

Remove the incorrect FIXME and replace it with a descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/loopback.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..0a5827e1a8c7 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -1110,11 +1110,7 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
 	gb_connection_latency_tag_disable(gb->connection);
 	debugfs_remove(gb->file);
 
-	/*
-	 * FIXME: gb_loopback_async_wait_all() is redundant now, as connection
-	 * is disabled at the beginning and so we can't have any more
-	 * incoming/outgoing requests.
-	 */
+	/* Ensure all outstanding async loopback requests have completed */
 	gb_loopback_async_wait_all(gb);
 
 	spin_lock_irqsave(&gb_dev.lock, flags);
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
