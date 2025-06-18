Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C22ADEA5E
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jun 2025 13:38:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0285745557
	for <lists+greybus-dev@lfdr.de>; Wed, 18 Jun 2025 11:38:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	by lists.linaro.org (Postfix) with ESMTPS id 2B3C144105
	for <greybus-dev@lists.linaro.org>; Wed, 18 Jun 2025 08:21:27 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=JYkmh+Ub;
	spf=none (lists.linaro.org: domain of brgl@bgdev.pl has no SPF policy when checking 209.85.221.41) smtp.mailfrom=brgl@bgdev.pl;
	dmarc=none
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a365a6804eso4911001f8f.3
        for <greybus-dev@lists.linaro.org>; Wed, 18 Jun 2025 01:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750234886; x=1750839686; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IZ5scaCVp5KEqpX+ht0jMpyjJqTR7FlxiD0v3xWbRwM=;
        b=JYkmh+UbYcaDBpgrOSjs7jqzxYZDzxmLoCz2W6wDyzEPKvocVSdxx2RfTFYE5lCU7J
         59/3ym/GsNdDwnjdC5KAb3vO68YMoIiN0+QzdLjJWujPypgjUrMkcwv50RscNKTA6xP9
         CDIHOhomdIv0LUIKY9e3rFrGWfQM5FqlfjaYnqjzRbdhO4RlIiFzTR3cvhy0hM/e4dDB
         7d3BLo869cOYbtpA3MMyhdmlz6pwCqF+tKRZdJysvHrlM2fESfBbO5Lm462rr93WDusq
         DbHGRmwpVUkAUQ1/Yo/TA0GDRBK9ulQJWzjcnGJ4LtYn0M8bvAqNbgMjJzlh/MDvwp4s
         LHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234886; x=1750839686;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IZ5scaCVp5KEqpX+ht0jMpyjJqTR7FlxiD0v3xWbRwM=;
        b=pgnUuyJFFv8FO38+QjK2zXMyc6hOnnhpHQrE1V0y4NcB6gqHDZMTLQJd9kNU8pIYcq
         KMxTNE9O7I4Rruo3C0iKy0M8JFbhqG8fsZ1krtnUol7lAf8TNyqVR+PJc9CFqvoVdzgT
         BlQhBqBLF+x3cedg/t6xiVx2UFzU4fJL+PTvsTw8PNVzyWVedM5LocNvDwN12PRQ0IZz
         Vjn8/weNHz3e8K+NhyLT+SEYuLmvYDYUx5qSFvsp2S/xqi21dD7FqN3d17+CXse/d1qW
         OYD31Tc6V5tqZbyjbxj3rf7G+svoOzBjpied3qogm4uo24WFsb00Pts+wD8gbhUNUXKI
         MFpQ==
X-Gm-Message-State: AOJu0YxcgS6XXm8qArRiAjNLbCgSl4FG/3A13G3rb/FkaoBSnahtHHWq
	v8BUSvZZwXCcXQfpzvxeJm/zgpPOh886MyFpIXJZKDq7ncIAjq+QzhCvvo0/nPF3vsE=
X-Gm-Gg: ASbGncuI/fraV/hPk5W22sOFJ2AxVMsFFOTMnb7U7Egk/PkpYQ7vkYIKRtOsxtxj2U/
	Ru4tj8ntzFoPsUXJYJYNlQ3YrjpCS03eReOVMxQ6YiLd4rZHbIvBe8XUro/NGUiDQM9bEily+aH
	zUzgEetBqiwi7alMltznBUsAn2w2U1qcXGQTpZUL6h5qES5F8chG5r650pDf/MPHAGx1mYqrakK
	F+OC00my/R86jU1JDzs6757ShgiGaFO2mZzrOAUw6yyMLCUtNc9wZ7jtXJFD38/y0zx8LfFHQ8a
	Q9oq2ALWrsL5LwAjL47Tqwta04reFCeN7iq/ex8aMgDNWkTpXQ2JsL1Dj7Fmbg==
X-Google-Smtp-Source: AGHT+IFPk9BFd/vAWuocXcPkSq7/gvcXxQNi7IAayr4dvxQB0rDp+2lbpNZPuSLuXz9prs46BK1xLg==
X-Received: by 2002:a05:6000:4025:b0:3a4:e844:745d with SMTP id ffacd0b85a97d-3a572e6a1e9mr12817093f8f.56.1750234886010;
        Wed, 18 Jun 2025 01:21:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b08c7csm16437260f8f.50.2025.06.18.01.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 01:21:25 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ayush Singh <ayushdevel1325@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 18 Jun 2025 10:20:00 +0200
Message-ID: <20250618082000.36039-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bgdev-pl.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,bgdev.pl:mid,bgdev-pl.20230601.gappssmtp.com:dkim,mail-wr1-f41.google.com:rdns,mail-wr1-f41.google.com:helo];
	DMARC_NA(0.00)[bgdev.pl: no valid DMARC record];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[bgdev-pl.20230601.gappssmtp.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.221.41:from];
	DNSWL_BLOCKED(0.00)[2a01:cb1d:dc:7e00:ad8:9ec2:efc8:7797:received];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.41:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Queue-Id: 2B3C144105
X-Spamd-Bar: -
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: T4SVRFNTOZG4CQV5JPDWKL23G27WAKSK
X-Message-ID-Hash: T4SVRFNTOZG4CQV5JPDWKL23G27WAKSK
X-Mailman-Approved-At: Wed, 18 Jun 2025 11:38:47 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: gb-beagleplay: remove unneeded calls to devm_gpiod_put()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/T4SVRFNTOZG4CQV5JPDWKL23G27WAKSK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

gb_fw_init() is only called in this driver's probe() and we abort the
probing if it fails. This means that calling devm_gpiod_put() in error
path is not required as devres will already manage the releasing of the
resources when the device is detached.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/greybus/gb-beagleplay.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index da31f1131afc..1ea48b71a030 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -1041,7 +1041,6 @@ static const struct fw_upload_ops cc1352_bootloader_ops = {
 
 static int gb_fw_init(struct gb_beagleplay *bg)
 {
-	int ret;
 	struct fw_upload *fwl;
 	struct gpio_desc *desc;
 
@@ -1060,29 +1059,17 @@ static int gb_fw_init(struct gb_beagleplay *bg)
 	bg->bootloader_backdoor_gpio = desc;
 
 	desc = devm_gpiod_get(&bg->sd->dev, "reset", GPIOD_IN);
-	if (IS_ERR(desc)) {
-		ret = PTR_ERR(desc);
-		goto free_boot;
-	}
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
 	bg->rst_gpio = desc;
 
 	fwl = firmware_upload_register(THIS_MODULE, &bg->sd->dev, "cc1352p7",
 				       &cc1352_bootloader_ops, bg);
-	if (IS_ERR(fwl)) {
-		ret = PTR_ERR(fwl);
-		goto free_reset;
-	}
+	if (IS_ERR(fwl))
+		return PTR_ERR(fwl);
 	bg->fwl = fwl;
 
 	return 0;
-
-free_reset:
-	devm_gpiod_put(&bg->sd->dev, bg->rst_gpio);
-	bg->rst_gpio = NULL;
-free_boot:
-	devm_gpiod_put(&bg->sd->dev, bg->bootloader_backdoor_gpio);
-	bg->bootloader_backdoor_gpio = NULL;
-	return ret;
 }
 
 static void gb_fw_deinit(struct gb_beagleplay *bg)
-- 
2.48.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
