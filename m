Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 529C1D02C92
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 13:57:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7059A401B1
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 12:57:50 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	by lists.linaro.org (Postfix) with ESMTPS id 82F363F80E
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 11:07:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Z+UzyYPT;
	spf=pass (lists.linaro.org: domain of chaitanyamishra.ai@gmail.com designates 209.85.216.43 as permitted sender) smtp.mailfrom=chaitanyamishra.ai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-34ca40c1213so1803820a91.0
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 03:07:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767870478; x=1768475278; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ovFL0ZgJ05PmQmmqASFpLTQJxg5CpaLFBPgcpKVwojw=;
        b=Z+UzyYPTfF8yOQUuNiqt5fsoqzuTmqXh8JSg3VuVZNW2msrik1ohB1i/IZrs2vLYwz
         cTDH8nqVXm9EjRYrQcf2WSjQrgOmsJzPRbLypvmoRRALFCryfGuTUMeKv1WObdXqRbq/
         /difjvQAzDtALh9U9mLsdwtWgy2PuhOCJiPJNpPUGcPoihrvSyiHeqY3cHsIumBrFNnG
         KnWld8fF9qVpxMyY/4esImRSkI7xyE4yZgFfyjLGrLALMeTEdjEVPGBXD6SXJ6miz+xq
         EeU3ztOR6yFN179pcLM3JMt6N4/5/eN0WnznJgEXuupGTMGrs7k+bhJTFADeLSRQsOuH
         sg+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767870478; x=1768475278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ovFL0ZgJ05PmQmmqASFpLTQJxg5CpaLFBPgcpKVwojw=;
        b=YQnwpzPy/GTWZwYni+7+cDV+Ihg1m8rVOY9PcDnNAqPGzEdE6O5BfyxFPwN7+4BNLH
         FVxCIjeXLBP6dJghhEpofao+eGHmnLEBcgfDxD/au3siTUW82XMuv5qsPsz1T/vpatqv
         BeY0D0SrPuRv351AY6gZzNFk+6IIdGTmMon3Jg01rd+4yJSqF1jvjIcy/c4CaqYYPKzP
         KwYCPV3tmvdxy7z8tf5sIDXuRTlUzXgJdlzq4qtiD6ytyjHBRIkxt+kARpG6HDwFq7kn
         R8ZJ7yw6sEy+B37RL15zxbjA0x/YHEMTiw+Pnb+y17zK20YyYr9XtnJw5cpKkJZOXnZL
         xEbQ==
X-Gm-Message-State: AOJu0YyJ/dEzog1M9gN9lyjM68jYixQ//tLhd+zk0z4M3UeeYRaKN0bN
	2Eqxoi0SYw4TpSAjFBzuKkky+731A5v/1++geLvyZHmTD9ngq6j/GAx5
X-Gm-Gg: AY/fxX7C5iFAA3/vEJ+7RbDxqmgDcVAXl6Wj++AJNe13/H7rycWgJ1/4QXXqTNaDzsd
	pB/bhjZhP8MvZ8hh2i+htBW1bYKc4qGIibqz87S54/VdkZwO9PGaVpVYvZC1yAZkqwlK1t0Ydsh
	gqTgi7V6J1tjtiJHB2BbLgonxtRoBHT6ZElvwGJOWY+SmLSGUqQr7c52Ntu0SpCE8yQZnoIbCAQ
	osFzinK6OOb5C07Itja2WxdhnTHl1UOoHelexMuHnYMj3IPAwyfOzoaHB8fpPyjkcfqCeEkz96s
	7SbtMnWTRY9yymnZZTcSWq4CFAqTnQelwmsoff0/ssDXAadt08DUdTeWvPNSk6kAr0I8vPXF90G
	1AG/ONQ9gk0Sh2cRJhSx3HXY93o7moyhvzb0KCq6A7DnVIHcrxJ2oqeo1ZM2IHzXoFWfeKGMwFk
	O6lMyB7uvePxCckcPSDDhyhMH0x/PVYNRS0YehamKT5fgLcQ60XwjD10brhA8=
X-Google-Smtp-Source: AGHT+IEZGNq/qjuxwRs95G5htBzgGzwouoNNR9bUa0QHpgSKCZ7OD2+N2vgHG9VLs/ENE1zoFdn6zg==
X-Received: by 2002:a17:90b:1802:b0:34c:a015:9cb0 with SMTP id 98e67ed59e1d1-34f68c91343mr5167636a91.22.1767870477529;
        Thu, 08 Jan 2026 03:07:57 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34f5f84ef1dsm7712096a91.0.2026.01.08.03.07.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 03:07:57 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  8 Jan 2026 16:37:43 +0530
Message-ID: <20260108110743.28579-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
References: <20260108104947.23767-1-chaitanyamishra.ai@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 82F363F80E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.43:from];
	MIME_GOOD(-0.10)[text/plain];
	URIBL_BLOCKED(0.00)[conf.name:url,mail-pj1-f43.google.com:helo,mail-pj1-f43.google.com:rdns];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	DNSWL_BLOCKED(0.00)[2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48:received];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.216.43:from];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: chaitanyamishra.ai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: K4AP63BAIY5TRKRDEN7IKMPBUTSCELWY
X-Message-ID-Hash: K4AP63BAIY5TRKRDEN7IKMPBUTSCELWY
X-Mailman-Approved-At: Thu, 08 Jan 2026 12:57:34 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, chaitanyamishra.ai@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K4AP63BAIY5TRKRDEN7IKMPBUTSCELWY/>
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
Changes in v3:
- Add version changelog below the --- line (no code changes).

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
