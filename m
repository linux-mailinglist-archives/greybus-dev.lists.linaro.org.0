Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F822D02C79
	for <lists+greybus-dev@lfdr.de>; Thu, 08 Jan 2026 13:57:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7D0113F776
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jan 2026 12:57:36 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by lists.linaro.org (Postfix) with ESMTPS id 6B3FE3F779
	for <greybus-dev@lists.linaro.org>; Thu,  8 Jan 2026 10:37:16 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=LwDTlnx0;
	spf=pass (lists.linaro.org: domain of chaitanyamishra.ai@gmail.com designates 209.85.216.41 as permitted sender) smtp.mailfrom=chaitanyamishra.ai@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34f2a0c4574so2426365a91.1
        for <greybus-dev@lists.linaro.org>; Thu, 08 Jan 2026 02:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767868635; x=1768473435; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1U5zRO+SPCwAl2mrA9Yp8CsA/asNYhp8z8hd3Fhm+uM=;
        b=LwDTlnx0BbLt9PwMC569tv1KSoHTtzQ8MszLkJwD4LOViPFAmzJJXSbKrrtnsQ5AWl
         /uKLpXICTsY/qYGezKRrNtNDYU0pwjyFAU248eboIq25REeaIuDdLpGarNNXKPSnImQB
         +a7PctYw3GZThd5Zl3cp05GISr2arQahnhAlt0aF+4yvJEO1EC4HslW37lqmG16GgTCT
         YbhEH8tSKH1gX/tI3CRTZnSPDqjdIsL81kg7RKCtjeF5Bx5Wyg5nDZZUzhLNWmBOkl18
         2lXipg5mJXdGE1szvFEK1/I58rXIfCtC/M4I01gAx62kIcrV3BNPo1fs0PirslEbMq2o
         /QmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767868635; x=1768473435;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1U5zRO+SPCwAl2mrA9Yp8CsA/asNYhp8z8hd3Fhm+uM=;
        b=LyYEYoqOQd8eOVMQ3ydZvgfwQrhDQbU9auFQI2AFbN+MiK0oHxqlMIZid37gBOe+Ir
         juug92BNBzNwPn6eiF6rAxPINB0bIxCffyaz6TB7Fiwu6bGvniXsdv9aebGmzRvwRs1a
         H3MdXXhiEPNYrgo5UGD6iFZRT4ss3dZUP00rUK1ba1F/rmw3NPClYkJObxo4IF8HMd0j
         E9JUfOGJVGVz510ELOXuya4FkkeZv6Mj86ByoNj83DH0CdhyHo1V2gbcE9cy/09FTBAn
         //JSP85zfisaXorLaZVShTY4e8eMQ2ipF3eeWdL89IM/+JsufT2UBTw6olLOCckW/X2p
         xYlA==
X-Gm-Message-State: AOJu0Yx3BqkswgnKa06xGnwL+stFybwTaUj4DeKi6+xZBjHkalQne71V
	m5C8XF8HpXInJmw/2b5PkMcOdtVUdMEusjCL/JJSU6wy2iONaJ8jdr+Y
X-Gm-Gg: AY/fxX6EMx/wo9cMkLrh3SLlZKrLAUkOB9qJzfGiOzRM0osICjMvjbYANPSOuXA1mN8
	6rOwFPerK4aSoggSdFeqMZ7L3lM2TGGPg01p4BJBsH2tQ3fM3zpKW8ZrGyzKoknMGylibRcic5A
	3XFi/V8re46uOFRjg2Ktnjvj3Hvd5OafSrWI+kQQ54QSMQtEROLB07a8hMmCgwTYCFhqCOQ9BBy
	OqgcnLEfLgrkcU8tU0deP6k7soh1KEOQbI0HAvG9e7dVZj1WknfAiD2JOOY6GJbOtysrNz+SETM
	kZM1RK0nkx4QfutK97UQKlD92+mvzC+nequMJblfUZ0D5fdJJQP0HcbscGsBS8nNr+vPWcRGeGg
	S4kV4XE9lBqoYwHdiPD8iqXSmBahfqFHvmb/653sGVQZN1uvMlt0HFytFh9DKgUnbq7KoXC5YSv
	0VB8/UOwtVJ8uiRQ0m8R3IozK4F2T3PJSBmw6awQqCuNcZns05H5RPH87Hzgg=
X-Google-Smtp-Source: AGHT+IENIC3sjHqbdW2Eie4AgrjdVb6lo91WKNEjcp3xXk4I2aUvrWqa1grnwsWHVXwR65QMhFLxZg==
X-Received: by 2002:a17:90b:1c87:b0:34c:9cf7:60ab with SMTP id 98e67ed59e1d1-34f68c62b63mr4446553a91.32.1767868635449;
        Thu, 08 Jan 2026 02:37:15 -0800 (PST)
Received: from localhost.localdomain ([2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8dd2sm74838715ad.82.2026.01.08.02.37.12
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Jan 2026 02:37:15 -0800 (PST)
From: Chaitanya Mishra <chaitanyamishra.ai@gmail.com>
To: rmfrfs@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu,  8 Jan 2026 16:07:00 +0530
Message-ID: <20260108103700.15384-1-chaitanyamishra.ai@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Rspamd-Queue-Id: 6B3FE3F779
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.41:from];
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
	DNSWL_BLOCKED(0.00)[2409:40e3:44:c9c0:8d34:cc3d:a8c9:1a48:received,209.85.216.41:from];
	RCPT_COUNT_SEVEN(0.00)[8];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: chaitanyamishra.ai@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: SHBIEA2KNUQBX2YG5B6WWH77QMVBY4FS
X-Message-ID-Hash: SHBIEA2KNUQBX2YG5B6WWH77QMVBY4FS
X-Mailman-Approved-At: Thu, 08 Jan 2026 12:57:34 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, chaitanyamishra.ai@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: lights: avoid NULL deref
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SHBIEA2KNUQBX2YG5B6WWH77QMVBY4FS/>
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
 drivers/staging/greybus/light.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index e509fdc715db..4c9ad9ea8827 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -1008,14 +1008,14 @@ static int gb_lights_light_config(struct gb_lights *glights, u8 id)
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
+	light->channels_count = conf.channel_count;
 
 	/* First we collect all the configurations for all channels */
 	for (i = 0; i < light->channels_count; i++) {
-- 
2.50.1 (Apple Git-155)

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
