Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 36154D02C7F
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 13:57:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51AE24017C
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 12:57:42 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	by lists.linaro.org (Postfix) with ESMTPS id 5679F3F779
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 10:50:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=B90SWBwR;
	spf=pass (lists.linaro.org: domain of chaitanyamishra.ai@gmail.com designates 209.85.216.49 as permitted sender) smtp.mailfrom=chaitanyamishra.ai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34ab8e0df53so2576600a91.3
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 02:50:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767869399; x=1768474199; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EjN6KRy96rZIFzVOVO0pR3xnbF0qB/QSbEh6qKIJyEw=;
        b=B90SWBwRF4fAjNGVBRFppu0M4K6cpFdLnnonWuU81NnrSR7xEIRpNVVjAM/Buvy1NJ
         d4KOnBkHC+R+AZUpeBtlMyZE33alG6ffUqE05sNGufPo6Z1vmKBl/25PmQcpHG5B9bth
         TDmf73NGS4ZcxWYiB2vHJyjvOLpD6GvmT2NhPDgdIMdZeziXy+Quww15TtcJwW1cOseR
         ZyLU6sGvD8Zi3pf4iDFICbuTXmIdd90KL04w5bE/HCRhQxWkE3UpRb5V/OAUrM6mzJtX
         fhdnMf7ENhjBzla8IFooPUeuyrqKGKiW7dBd5/pHjmy9T+fin4YX6YSF2FJ7G0efglwJ
         Evkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767869399; x=1768474199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EjN6KRy96rZIFzVOVO0pR3xnbF0qB/QSbEh6qKIJyEw=;
        b=EjrF0CtOkDAH9oBrDloDmQrzVjNTrDZ+Jd7zFVwQn4LFcXWwMrzDTxlxkXHCO4wfnS
         Mj3MOF/GazBhG75CUec69kCrpSveSQ4lDIbJ7poadxsVtIxIAWI6zntVBS+vi7FKQ1Vt
         oSOiW/UBfbfWOGo2fHCP5WMx2I3xzDvwHzw5o4V/JxvIY3j6V/jHCi69AU00gzigO09Y
         aHlF5T0bTuoz6YazhTBfJ4D3DsgLOGjyYtnQvT4pFkDI0R9T2iEaVq4uUTPPj8hQHOgt
         yP1ppSyL8yvygML4IWymKfIfCtabcEByImnxv9HMuIF47muoSj/WsawE5UY1bQDmZy5a
         ZMlA==
X-Gm-Message-State: AOJu0Yy0s5k56Rlueta89gGAOtFbPm7pwndBLyhDOt+6HzZGr1LXbX7p
	U1gQo4awb6Sbhmm/T7RXObL5F13RCz9Vl9o7mJrmLL8/TUQDmUzui5n8
X-Gm-Gg: AY/fxX6jwJDr5KUO9H0JN51YjAQVlx/YkyHkVWenWlB6bOZRfSn+8zt7dsdMNZbivKf
	gn5FERMUJzNTlOvdOolaqCGbhp6slqRDVDx1ySYxZVj5GboBnRY2ttuwxUb7oBfhzbdaJc0I40N
	YAfBa14a4LcaUzwsdB8IjQ5tjNEMCbTAfvxBhbGpeuSSKapvI/oAzV2pHBHi+TScQ0jC4GoXR8P
	FzQGDfuwplfMjgVXec4CSxztqVQium8K0Z/cTY0i6QzuMetPwD2hQXaolLyk2NaZycusmKsFzc4
	cYM1IQiUnU2KjdLD6BD5b9r/7njvNHz0y5VE8LbcBAP3GTDyebzMjbj4eKUqNMXID7F7kZehRHW
	lETycw5d8tTUxwjR9NkR/m3/aquFH2kTF023JAErCs+GCUYRON42bo3zK6uLyRp1G2KC5PgANrD
	qjPnT2NXRF6IROdV9p1TU32IldIiuriXgIDCjriLd9cNo4X9a9AsafOi1CRX5ZhsDKDzPDOg==
X-Google-Smtp-Source: AGHT+IEJg51776qmQRAec7r8Q56/vKAE9mkMRebfFBTyZn5YX2SzdAZ6YmZhM3qPZ58Jcn4GN6R1tg==
X-Received: by 2002:a17:90b:5211:b0:34a:b8e0:dd59 with SMTP id 98e67ed59e1d1-34f68b9a218mr5550827a91.15.1767869399399;
        Thu, 08 Jan 2026 02:49:59 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819baa192b3sm7391855b3a.11.2026.01.08.02.49.56
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 02:49:59 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  8 Jan 2026 16:19:47 +0530
Message-ID: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
References: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 5679F3F779
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.49:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	DNSWL_BLOCKED(0.00)[209.85.216.49:from,2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48:received];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: chaitanyamishra.ai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KJQDVFTD4DWBHHDGONXJ4KTOSTISMO2K
X-Message-ID-Hash: KJQDVFTD4DWBHHDGONXJ4KTOSTISMO2K
X-Mailman-Approved-At: Thu, 08 Jan 2026 12:57:34 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, chaitanyamishra.ai@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KJQDVFTD4DWBHHDGONXJ4KTOSTISMO2K/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

gb_lights_light_config() stores channel_count before allocating the
channels array. If kcalloc() fails, gb_lights_release() iterates the
non-zero count and dereferences light->channels, which is NULL.

Allocate channels first and only then publish channels_count so the
cleanup path can't walk a NULL pointer.

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
---
 drivers/staging/greybus/light.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..38c233a706c4 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1008,14 +1008,18 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
 	if (!strlen(conf.name))
 		return -EINVAL;
 
-	light->channels_count = conf.channel_count;
 	light->name = kstrndup(conf.name, NAMES_MAX, GFP_KERNEL);
 	if (!light->name)
 		return -ENOMEM;
-	light->channels = kcalloc(light->channels_count,
+	light->channels = kcalloc(conf.channel_count,
 				  sizeof(struct gb_channel), GFP_KERNEL);
 	if (!light->channels)
 		return -ENOMEM;
+	/*
+	 * Publish channels_count only after channels allocation so cleanup
+	 * doesn't walk a NULL channels pointer on allocation failure.
+	 */
+	light->channels_count = conf.channel_count;
 
 	/* First we collect all the configurations for all channels */
 	for (i = 0; i < light->channels_count; i++) {
-- 
2.50.1 (Apple Git-155)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
