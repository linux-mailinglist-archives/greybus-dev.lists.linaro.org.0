Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC057F663B
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:28:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 123B940A18
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:28:12 +0000 (UTC)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	by lists.linaro.org (Postfix) with ESMTPS id 206CC40F82
	for <greybus-dev@lists.linaro.org>; Sat, 18 Nov 2023 18:05:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=S46a5IqY;
	spf=pass (lists.linaro.org: domain of hkallweit1@gmail.com designates 209.85.208.41 as permitted sender) smtp.mailfrom=hkallweit1@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-543456dbd7bso7982867a12.1
        for <greybus-dev@lists.linaro.org>; Sat, 18 Nov 2023 10:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700330711; x=1700935511; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZEQQ4sBftaBxEQfqkfYlxYDOwzoa8t3+UXmC0vdAGio=;
        b=S46a5IqYx83XHWy8c9OAsyk5D2ngSOQrlyquFSjyMZgbLrCqSsBBA/iwY1qyoa5w4d
         wytocHtKofkZUp3LB+5zymRJojbLAgWNk64tH7Fb8pcvCEaauT6FT70X/Uc1AV5cTuqe
         Huip57nfYzL4CihvIiQc2iBmUGuVZ0ql0tdJyMC9EoSELwqgKaxr3LkYWiWWtGR2euXX
         StFFDXoOl8cYbruTq329s2N0o1SrQsF630qRfa8201sItWkOXA4d9P9i0TowZJOg9SiE
         VEaG+XxV5PcJdRa9JlYtkUKDDRF4kt8IE777jZ4SZSUMtaTzXFwk+dzACTa6f9bmyd6t
         apGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700330711; x=1700935511;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZEQQ4sBftaBxEQfqkfYlxYDOwzoa8t3+UXmC0vdAGio=;
        b=dW1eMAT4i0Pvldd78vjPCEDRT+J0pgq2e0jbN4XIIeZCywMCkH+Sbb1Z3rMqIyeKHC
         p9ttc98qaeam6XAIsvOQT7mQDQ4jWYK+81BHsrHYls5Zv+oJCe23gUIKqHBaF993h5Kd
         dvL8Bsl4XzWMpZmi+jwTj7DBc+W3xp/+vW8v2PL3y+yqycnwHv4TAVNuxDgzV0EpzkHa
         DR8dGAxJFlqcfrbSdDfLtF1fK/DN6bUJwKn4eTyCbwilmJ4MEw6B+xgsGhgES6IhMRVM
         TX+lsEE/UevWXPBgAUDLJ312susVXxGCfQxj8kWy9pJl77ZnN12ZdTlx9/+ySYsfev2j
         +Dew==
X-Gm-Message-State: AOJu0YwXhoi/YQ7dMUYs2L5N1Mf0Knxn9Pkpwrt0QGpBDEcPv7BUdKVk
	vd7JzcGzzlpfLWXXCUxlnwY=
X-Google-Smtp-Source: AGHT+IGYLilIkdrNACXRJAHaolL+uXijwWBEXjtZAesjgsYT4+SMXgcWH+uTG6gF4MPghLKCC6/PYA==
X-Received: by 2002:a17:907:d21:b0:9f4:1bd6:2d26 with SMTP id gn33-20020a1709070d2100b009f41bd62d26mr10976580ejc.0.1700330710912;
        Sat, 18 Nov 2023 10:05:10 -0800 (PST)
Received: from zotac.lan. (dynamic-2a01-0c22-77bf-8300-2223-08ff-fe18-0310.c22.pool.telefonica.de. [2a01:c22:77bf:8300:2223:8ff:fe18:310])
        by smtp.gmail.com with ESMTPSA id m20-20020a1709062b9400b009f2c769b4ebsm2079456ejg.151.2023.11.18.10.05.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Nov 2023 10:05:10 -0800 (PST)
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wolfram Sang <wsa@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>
Date: Sat, 18 Nov 2023 19:04:56 +0100
Message-ID: <20231118180504.1785-3-hkallweit1@gmail.com>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231118180504.1785-1-hkallweit1@gmail.com>
References: <20231118180504.1785-1-hkallweit1@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 206CC40F82
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.41:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: hkallweit1@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: H3RJMRESBQPEEBYISKFIDNTAFH2VSWDB
X-Message-ID-Hash: H3RJMRESBQPEEBYISKFIDNTAFH2VSWDB
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:27:50 +0000
CC: linux-i2c@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 02/10] drivers/staging/greybus/i2c.c: Don't let i2c adapters declare I2C_CLASS_SPD support if they support I2C_CLASS_HWMON
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H3RJMRESBQPEEBYISKFIDNTAFH2VSWDB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

After removal of the legacy eeprom driver the only remaining I2C
client device driver supporting I2C_CLASS_SPD is jc42. Because this
driver also supports I2C_CLASS_HWMON, adapters don't have to
declare support for I2C_CLASS_SPD if they support I2C_CLASS_HWMON.
It's one step towards getting rid of I2C_CLASS_SPD mid-term.

Series was created supported by Coccinelle and its splitpatch.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

---
 drivers/staging/greybus/i2c.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/i2c.c b/drivers/staging/greybus/i2c.c
index de2f6516d..22325ab9d 100644
--- a/drivers/staging/greybus/i2c.c
+++ b/drivers/staging/greybus/i2c.c
@@ -264,7 +264,7 @@ static int gb_i2c_probe(struct gbphy_device *gbphy_dev,
 	/* Looks good; up our i2c adapter */
 	adapter = &gb_i2c_dev->adapter;
 	adapter->owner = THIS_MODULE;
-	adapter->class = I2C_CLASS_HWMON | I2C_CLASS_SPD;
+	adapter->class = I2C_CLASS_HWMON;
 	adapter->algo = &gb_i2c_algorithm;
 
 	adapter->dev.parent = &gbphy_dev->dev;

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
