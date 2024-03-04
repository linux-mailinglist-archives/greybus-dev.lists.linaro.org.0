Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF4686FA6C
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 08:04:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B0FBB3F0A4
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 07:04:57 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	by lists.linaro.org (Postfix) with ESMTPS id 4DCC53F0A4
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 07:04:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=zcsCyXLg;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.221.50 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33d568fbf62so2103759f8f.3
        for <greybus-dev@lists.linaro.org>; Sun, 03 Mar 2024 23:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709535891; x=1710140691; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RTu2QOOVQbOweB1LGR/BRbdQUT3nXvJVjgo89rA8a4=;
        b=zcsCyXLgALR9c7IxSZ263fWdf6BxZEeyIaho+wZc5i/0qZsGRhOw4V5f16ZlKAt05r
         rYBqBAjPjMR4cansFNmJCg66qKxkBHAP2xvO5sOZPNWRzqbG+gaz3H4uihcR//If9COa
         SMBdwNrFk2SuWedHDzeqVyhlGXiU7O9wyq8WQjJ+OfyfCJH0RlbZryPZ/BwG/XWBvHZu
         wxyQLgVCBwQb9G2OWTWyB8UiKQsSZEdvcWmjQRm9SlfEMt9caUKS0BNKpSVaEU2IotMm
         +6gyZkKnl1atzGzI5sUmIrkf0Pu/QV7ntvovDW1sNP5WC6o42scDe23TJQkrdNvxzIcy
         B4gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709535891; x=1710140691;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RTu2QOOVQbOweB1LGR/BRbdQUT3nXvJVjgo89rA8a4=;
        b=SNYxLioHp2hY1py0vShQiYQiQYPgWgNjhk2gY4bUYnCxgUlr7Xn3J2AHixIRnVbsO2
         k06swQtQkWl69/PBKUT6rAPpN2AxI0v/1HR6c83CrbTETLqgtTblhFUjOVJmicHxCdTz
         8vpkbtjpqaWCXq9yDo47klEByNXYNLY4cFva8kP/zgmq7ZJRBO5DE+UzuhMI93ljBtFk
         y1uWfDH13LcRiCrxnjTl6INcSNyfk6sqAPPL79KzworuLzia+uwCvkU0U699Ggcn5WHz
         EgwztYc4LTDGKxwRlegfu/6+rpA1d0N2yBZx4MvSWMkRDkQMpCrkRxUIiNTMk9VYnXla
         wjsA==
X-Forwarded-Encrypted: i=1; AJvYcCV90A+mLDF/PbDlwH4AabxDEhSeE4XeZMTYa4vLy9q126Cka1NRxmqGYN3Jx7o1R42ye0BVJBjpGv+NZa4yPZQkmC8SyV/7sR3cWfBx
X-Gm-Message-State: AOJu0YyYzL4FZwEo4S+lkdE1eDsV3yyiyosR14V2Ph3M30glV8C5KPX1
	dFonJ3mlXEb3Up/JMiL28o6mO6IQLP5ZTB7g3xEDmvbNG63kn6RUcSxVfHyBfudF9Q==
X-Google-Smtp-Source: AGHT+IFc4xUICRVVStYlfPV57gzFOOaMSvfieW4xk8n3smggrfWI5KpXmkdHe/qcd3sZ3tLX4YTRXQ==
X-Received: by 2002:adf:9c8b:0:b0:33d:47d6:c159 with SMTP id d11-20020adf9c8b000000b0033d47d6c159mr5733432wre.12.1709535891433;
        Sun, 03 Mar 2024 23:04:51 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id r18-20020adfca92000000b0033dcc0d1399sm11375456wrh.25.2024.03.03.23.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Mar 2024 23:04:51 -0800 (PST)
Date: Mon, 4 Mar 2024 10:04:48 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <379c0cb4-39e0-4293-8a18-c7b1298e5420@moroto.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4DCC53F0A4
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.50:from];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linaro.org:+]
Message-ID-Hash: A7HIHUA2NDY26H6B5GVX56PNCZETM3C2
X-Message-ID-Hash: A7HIHUA2NDY26H6B5GVX56PNCZETM3C2
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: fix get_channel_from_mode() failure path
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/A7HIHUA2NDY26H6B5GVX56PNCZETM3C2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The get_channel_from_mode() function is supposed to return the channel
which matches the mode.  But it has a bug where if it doesn't find a
matching channel then it returns the last channel.  It should return
NULL instead.

Also remove an unnecessary NULL check on "channel".

Fixes: 2870b52bae4c ("greybus: lights: add lights implementation")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/staging/greybus/light.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/light.c b/drivers/staging/greybus/light.c
index d62f97249aca..a5c2fe963866 100644
--- a/drivers/staging/greybus/light.c
+++ b/drivers/staging/greybus/light.c
@@ -95,15 +95,15 @@ static struct led_classdev *get_channel_cdev(struct gb_channel *channel)
 static struct gb_channel *get_channel_from_mode(struct gb_light *light,
 						u32 mode)
 {
-	struct gb_channel *channel = NULL;
+	struct gb_channel *channel;
 	int i;
 
 	for (i = 0; i < light->channels_count; i++) {
 		channel = &light->channels[i];
-		if (channel && channel->mode == mode)
-			break;
+		if (channel->mode == mode)
+			return channel;
 	}
-	return channel;
+	return NULL;
 }
 
 static int __gb_lights_flash_intensity_set(struct gb_channel *channel,
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
