Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D653C696D5
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 72E4A3F943
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:09 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 761403F80E
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=lNjSlEMS;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2956d816c10so48709945ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403610; x=1764008410; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/zl9EMXpVNyBJNhHhexUPn0nO02fOhckk1ZQIRmn1n8=;
        b=lNjSlEMSbDebDmpfdmAs3aCuPILQ563xSrE5iXend8cc86syxQ+1WjvmrKKsThQ6gJ
         o/Zv79Kx3mEsVnxUP2PrGSZ8Yj0UuHoJio59TUe4pnwvvw+QmWS2jBmwKmvaVggUBHbW
         5+taCcEu91wEwJsp+KwdvlM+fRWJdkM7rpfd1ghbqveZ2e3bwC+PJTSIWI06B4GtHsJR
         pNwqQiyPN4kJ3P7Xo8ymVyUwgs0F8Sz1vZdvW6MykPrDpqQRJaVtfszzkIbWOo0+8EE5
         eYyVCHzommJzJXNyGSl67UZvUPfCcU/JHDYZhp0IjE8q55Pbr2hkgvSYskgS0/2Xl2jq
         hOow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403611; x=1764008411;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/zl9EMXpVNyBJNhHhexUPn0nO02fOhckk1ZQIRmn1n8=;
        b=qxYZJ9BThk8fwN50RuPFc5KEvquJfH629F265KgZTvHgtAW13wEkb9qX02pcw0BEDb
         5eqoEJG6gDUSsV1wcksJYlrhcFoUiWXnvOjH0jUG/q2YWNjPzv3Q1jhr711CqP8e7xwI
         XIa3nKo/QkQwmMGDjlJ+89x6YZ30F4GSL7r95FNockq8suUXYzcLzSNLIUboJM8/xvyp
         /fjYjUD3KoL7kzR6thvHNc56dYH4CK4NuGciHQKSTt4l2sPKMWszRuS43WyClvDrLN0T
         X2/jA6p0dF+i5/v+vVlNxwbDz5lPUSob7Sp9fwempr+Ux3m3lwbpVTnKUPkUeIRa+LUd
         xbgw==
X-Forwarded-Encrypted: i=1; AJvYcCXVF/IHctT+e/1TeQEyaORjAO2GjMTozDD6DwPSCdLt7uMUHYynhVi8Qlt5YvyUSLjkNQilQcxpCE3Rhg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxUpRy3OZlaA54OprJHawbLcBtONKBGjD5Fiv0Y5nT8fzy0jPMy
	riEetfoWtr+oFvZnl/PKha2zl+suzUKgHUq/MHGEgPvFDkt1Rk98/bVI
X-Gm-Gg: ASbGncuwilsE1LyQgZ+npOktrNN0S61iK55Y0nIEtoy1CjEvzbuHEMlXivLDlKGGVQw
	cmuhR/Jfhfel/g4DviWWYn3JAiTHQMGesauf3trNToAxuwNFpsWWaF3768ln0MqSUfpYCQn+MuL
	FyPNAq8wtqERCbYzKuNCK79FztIEoQMRxnBSkTv80Mo7tPiqunX5ZlPC8Q/wtic2Fc6ltjBYzEv
	mkBStlDvtId/UKzMAiqcATRzftkjODHgNHcXcsrQxuTb80BAAnHJ2UWfTI3I42yOMbeF8lgr6Zk
	nipDBdQHVWUvwBwr4mdF7EK7q+bKjWfdMkTL2QNLHgjc9skMgirYTfyCBV+ijNvAKgCTgey64dC
	cXGrA6GebVCMDW2rR86Gh+5NwKQg9U1GidcNtwFiyKncdfUevy6nfCCVzu95kl9fowBVgzttjTC
	sBvlswKf4Z7pGE8DHdjShc9fAsJxoOI0AyVipD8UZiPRv206Q=
X-Google-Smtp-Source: AGHT+IGuwynby04MgCea7V3BgAbsj3sQvzf+jr8IFztcIAGNF9QO1r6tdOHmQhyLrO8P5X7tL8cPCg==
X-Received: by 2002:a17:903:46c4:b0:297:e3f5:4a20 with SMTP id d9443c01a7336-2986a6f540dmr145141315ad.26.1763403610602;
        Mon, 17 Nov 2025 10:20:10 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:10 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:10 +0530
Message-ID: <20251117181818.118139-6-ayaanmirzabaig85@gmail.com>
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
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.linux.dev,lists.linaro.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 761403F80E
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TX6ML3V5P6OD7BRYI2CWLYRYSNWW3TL6
X-Message-ID-Hash: TX6ML3V5P6OD7BRYI2CWLYRYSNWW3TL6
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:36 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 05/13] staging: greybus: audio: remove obsolete FIXME and document topology ownership
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TX6ML3V5P6OD7BRYI2CWLYRYSNWW3TL6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

gb_audio_gb_get_topology() allocates the topology buffer using kzalloc()
and transfers ownership to the codec module. The buffer is already freed
on error via the free_topology label and during disconnect in
gb_audio_disconnect(). Remove the outdated FIXME and replace it with a
comment documenting the ownership semantics.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/audio_module.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_module.c b/drivers/staging/greybus/audio_module.c
index 12c376c477b3..c7deeb99a41c 100644
--- a/drivers/staging/greybus/audio_module.c
+++ b/drivers/staging/greybus/audio_module.c
@@ -305,8 +305,10 @@ static int gb_audio_probe(struct gb_bundle *bundle,
 	gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
 
 	/*
-	 * FIXME: malloc for topology happens via audio_gb driver
-	 * should be done within codec driver itself
+	 * The topology buffer is allocated by gb_audio_gb_get_topology()
+	 * and ownership is transferred to this codec module.
+	 * The codec is responsible for freeing the returned topology
+	 * on error and on module removal.
 	 */
 	ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, &topology);
 	if (ret) {
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
