Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BD227C696D8
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:39:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B349B3F85C
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:39:13 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	by lists.linaro.org (Postfix) with ESMTPS id 5E2143F80E
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 18:20:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=TL7L7Os+;
	spf=pass (lists.linaro.org: domain of ayaanmirzabaig85@gmail.com designates 209.85.214.175 as permitted sender) smtp.mailfrom=ayaanmirzabaig85@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-297d4a56f97so50479995ad.1
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 10:20:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763403613; x=1764008413; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bucROtgn/STqT4bhqnTMY3oezQn9xyysx1+bUbZKY+4=;
        b=TL7L7Os+Kl3EAl7F7Tw8iERfAp9AwwSB1xkrWs3qfkSN+zT8Hj2CUd/QJD7Pgw9MgR
         PDnsOvchSZX9xufmZm+LBml9CDOJI63RyR3493DeNpTTPe/YQanyZkyF//KKfhTsOw2M
         eYJnj5rjsAKPgV3kBAiW98huqSBGIwUiTAImATEzk211ycbUbNtcUVcx3mV7US9zEUb/
         tTAwmWiadky+OfxlFnztpagptli5IDjLNFLoq9jJ4JXm6Y4C/gpivzegSP81uabi/dsd
         rwJnSZXVDpahPvtmlBwNVtOR7gxXqaUufGq9TVSi7mQJZ9lJPSURR5fMYhf1PLe3nFGr
         e4pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763403613; x=1764008413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bucROtgn/STqT4bhqnTMY3oezQn9xyysx1+bUbZKY+4=;
        b=av0+BQs+HV6Eyh9H2VbJetFBkF2YYYJYsWRXnB7ojcGbAPIbTXTENG4gG6YEBi53tQ
         kAxML7F1hWCE0QkiaA54Ys4Sc5OnN8XT4BOIZMgA+ibFY9JGuWDp7gO9GVEc2PlFx6E5
         3U8l4aLL9xGHeDItDVcuGk4vSkevsWLxQ7sHUqzf/DjJ2E+Tmp4ddpdHdEzbuFs28F6D
         XjUL09Q6/W8qMDm1QVaV5PI/k9FWhkVUGENK5PE2FGUzsN/hN3NGAdbLYtrTpEL1rUKf
         VZui0Ff36DJnnPCVna7J8f7FRqCng/8OyNokhFJx63d4FiR9mC6ylhZeSYe3+clAaKXW
         PBEg==
X-Forwarded-Encrypted: i=1; AJvYcCWfMAR500IlzCxWr9eKse7JvqQbwGJYlwNlc4CTfpxXGUeqMy8cP1oDVW961FRXBjSsJfxgsJHCiYFpkg==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy6puPrcwTvOBJtTkOjE/+MK+rNhFRvmtVkkyy/raUz2LYNC8iO
	wEuD0Bm8awx/3jWLLDO/s5l6o72c+2B4DlVkWr1/f1UPWWgLdCYJPTC7
X-Gm-Gg: ASbGncuxReWNLdosJ2oTXcVNdBeeiExzGfjEl+8VxTAOax8TR/oduu0LAZ0Kh2StGeq
	arRCP6x7iZHmhiYVYJM/i6Lggc2a0PBdz4/T749KlzakDi98TykqdT5blQ2bsoyYlewwR4ISDTM
	qIsMnsaUGYKN778sIxEvKioEP2ZFK4ebDG4iBHIHuXiW1Homl2GFk8jkbJfJrnZ/gWdaSDAly7q
	N2zNhaCmkP3TKttePTdgL1r9PsuxEBAIRGMfBGAXaa3k+rYDZh3E6KvbQ05HNDEs58KG5eedvjt
	iPZXdUuGLYkCOO6C4b5rQnWyBuXw0/RaBGFpScepqlFnhQUGjawv/kDhACJiexysMOwlK7KmRG/
	+IIoz1JfKi9hNBHBEbT79bM6d7rxM6chZVa3YSTjREvgEZi0hkLzhMz/vicRJbjEJPe4v6bDJ1L
	Lv05QV0x3xvJNuRSrkq4tZhOGrUpdQN/ULZk+X
X-Google-Smtp-Source: AGHT+IHCG1I57PhkXgVunbfVpDgug6nMnuPc8ABXjNBzSPuu6XEewphO4qTiO29/jfl/HZzvxfMptg==
X-Received: by 2002:a17:903:3c47:b0:295:6d30:e268 with SMTP id d9443c01a7336-2986a755dfemr152593225ad.59.1763403613432;
        Mon, 17 Nov 2025 10:20:13 -0800 (PST)
Received: from ideapad.tail50fddd.ts.net ([139.5.199.69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c245fa1sm148446705ad.36.2025.11.17.10.20.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 10:20:13 -0800 (PST)
From: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 23:48:11 +0530
Message-ID: <20251117181818.118139-7-ayaanmirzabaig85@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
References: <20251117181818.118139-1-ayaanmirzabaig85@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.175:from];
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
X-Rspamd-Queue-Id: 5E2143F80E
X-Spamd-Bar: --
X-MailFrom: ayaanmirzabaig85@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HSAF5HUVOJZZQRYLLDKNVIC7M23ZRHMG
X-Message-ID-Hash: HSAF5HUVOJZZQRYLLDKNVIC7M23ZRHMG
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:36 +0000
CC: johan@kernel.org, elder@kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 06/13] staging: greybus: bootrom: remove obsolete FIXME about SVC parallel event handling
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HSAF5HUVOJZZQRYLLDKNVIC7M23ZRHMG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The MODE_SWITCH_TIMEOUT_MS constant included a FIXME suggesting the timeout
could be reduced once the SVC core supported parallel event processing.
Greybus SVC logic is stable today and no such change is planned, and the
existing timeout has been used reliably for years. Remove the 
obsolete FIXME and replace it with a descriptive comment.

Signed-off-by: Ayaan Mirza Baig <ayaanmirzabaig85@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index d4d86b3898de..156212301d58 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -17,10 +17,7 @@
 /* Timeout, in jiffies, within which the next request must be received */
 #define NEXT_REQ_TIMEOUT_MS	1000
 
-/*
- * FIXME: Reduce this timeout once svc core handles parallel processing of
- * events from the SVC, which are handled sequentially today.
- */
+/* Timeout for mode switching operations, based on current SVC behaviour */
 #define MODE_SWITCH_TIMEOUT_MS	10000
 
 enum next_request_type {
-- 
2.51.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
