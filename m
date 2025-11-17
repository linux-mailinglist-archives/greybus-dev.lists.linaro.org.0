Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D09EC696DE
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0A7623F91A
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:23 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	by lists.linaro.org (Postfix) with ESMTPS id EBF213F8F0
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=aJoOVjNS;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.180 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-29568d93e87so41722745ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403619; x=1764008419; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40ftHNyvGt0UU//dIiejgHUaxmho18NPHFMlv2BK3B4=;
        b=aJoOVjNS+TfpOPpRlNMXg9ert36k06I6CNcd1TVq2EzhbT08RL9KDzUDHs8QAGa9cP
         SrM2cmUFpSzXLx7WFfAOfU2c4fc60fNmpNi9iRifuKuLiCzPRiimHkS8AKE5Ku92hdjw
         L6jmBFjM+viw5E9Y6RkCnZ1DRWlNAJjwU4+OD+hPnOJm26x3mMyfAuyeYy+61XH9ymrP
         5/CkrY3Haa5+BMAa1crygO4CmZZs9jAElpz1dbhIrqn2TXc/coVmWjdErKVjGtF4vAuH
         +uHY/5eWn2PMSCxy3q+fzSyZqD9M4ietqJ0/hcRkiYjrlhlBDMFhlvwEPjJdWQRPqXMr
         IsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403619; x=1764008419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=40ftHNyvGt0UU//dIiejgHUaxmho18NPHFMlv2BK3B4=;
        b=wcWM96zeYCsOYusLBKYC0x+OXC5yK/02ZAgPj72QbfMqP6f1L7qforYNOYqh4kCmst
         ashetN9+ZGQxa3YCZMX/Cm34oX6nuKYgVOo4lDCQcXMAdTDtn28+3rf/0sBjL5wI0FvN
         CnkGGhAzEYTF32Jqv6Aq5vKC7RPpGxmwuJyrJdSaSvlsDBYhHqs6yRiZ121AldqdiA6+
         Iqrg4i8/r5yGwe74NFTVzqdSqHdeNK5H63MyLkBXheZ0zGxVzA6yRiimMbeQ2YRVuTRM
         dAFPvwjBNgTIena+hK0lKOGmTCoYv5+SEZ3HhMXuWZWssEyChZ4ZNEBE2nchATdNnPDK
         FMpw==
X-Forwarded-Encrypted: i=1; AJvYcCUkndFj+mWV1pVFv/w6pDjR3dZsESE3UjoLyKjHZt3ENEoweTCg3DMCDQBnPx9hIiUwisSZcBOhSVjnog==@lists.linaro.org
X-Gm-Message-State: AOJu0Yz3WRI36BnjijKUNqM6slWfNIqkHBtWitoHU6tkS5MqkIYpiweU
	Cl75zH8MAfTU6vd5YdKpHU2nO3CC7n8ak9nF8JvV8B8XC1ChJZ4mk/tK
X-Gm-Gg: ASbGncuyXVAduHS6Izj6k2+sO9sXYOaR5S80XT/DAZ37BTrT+L5IoaF2rBSwQvBoE84
	SuOtcKFtTX34j1iNsop/JDSstKOkph4++RhIXdsZkhR06lsBEvfUORaMHDaUvJXPG6MRGCD4Gbj
	V3Za4R4btfp7U+BNTahsz6jQ+HIhy8H/xkRKX7g3SB81gPPhpGGTvsShtCL9OXt12Nk4CRTxJMG
	28Tst3t8JtldLeVzO/sjOzKnptDfqEJmkUMUuhcPNxE3Lyv1sBwzEtBN4lgeEO5OetefMR5UaA7
	CwXgtrD0rNc3DxSr+ZsCiGHMfkcdh8xEM7r4vOmPOhxZ3cIiZc9PCWv9WeGypjO9XSlPRJzx6hY
	SGmy0v6CjVKQaMSGq96/+O6mol/4sbAIi+Nru9laQNoDRBKSJt4nlxF8P8ETlE6vowkU01TwidA
	FQVoxHC5Xf8hq40aA970+0cnemrUIDzhOdxulBpNE6S257UlQ=
X-Google-Smtp-Source: AGHT+IE0KnzPY3MqJ8kJIDZCYQ2VDJ9zxNa+tuMPkEvayegIewOFLVBC1q+5J/+tEzFJMFCy1Ojpkg==
X-Received: by 2002:a17:902:d54f:b0:295:615d:f1d2 with SMTP id d9443c01a7336-2986a752816mr173821305ad.48.1763403619092;
        Mon, 17 Nov 2025 10:20:19 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:18 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:13 +0530
Message-ID: <20251117181818.118139-9-ayaanmirzabaig85@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.180:from];
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
X-Rspamd-Queue-Id: EBF213F8F0
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YHQZKEN7VAKVILVXNVJFVGWT27M2T4T2
X-Message-ID-Hash: YHQZKEN7VAKVILVXNVJFVGWT27M2T4T2
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:54 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 08/13] staging: greybus: fw-core: remove obsolete S2 Loader runtime PM FIXME
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YHQZKEN7VAKVILVXNVJFVGWT27M2T4T2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

A historical FIXME indicated that this autosuspend call could be removed
once the S2 Loader supported runtime PM. That hardware is no longer
supported and Greybus runtime PM is stable as-is, so the FIXME is
obsolete. Remove it and replace it with a descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index 0fb15a60412f..b9e989a99f06 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -208,7 +208,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 
 	greybus_set_drvdata(bundle, fw_core);
 
-	/* FIXME: Remove this after S2 Loader gets runtime PM support */
+	/* Drop runtime PM reference unless the interface disables PM */
 	if (!(bundle->intf->quirks & GB_INTERFACE_QUIRK_NO_PM))
 		gb_pm_runtime_put_autosuspend(bundle);
 
@@ -233,7 +233,7 @@ static void gb_fw_core_disconnect(struct gb_bundle *bundle)
 	struct gb_fw_core *fw_core = greybus_get_drvdata(bundle);
 	int ret;
 
-	/* FIXME: Remove this after S2 Loader gets runtime PM support */
+	/* Get runtime PM reference unless interface disables PM */
 	if (!(bundle->intf->quirks & GB_INTERFACE_QUIRK_NO_PM)) {
 		ret = gb_pm_runtime_get_sync(bundle);
 		if (ret)
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
