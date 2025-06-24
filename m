Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B725AE66D2
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Jun 2025 15:42:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B42B340431
	for <lists+greybus-dev@lfdr.de>; Tue, 24 Jun 2025 13:42:43 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	by lists.linaro.org (Postfix) with ESMTPS id 10EDC3EFDE
	for <greybus-dev@lists.linaro.org>; Tue, 24 Jun 2025 13:31:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=PHIi97cf;
	spf=none (lists.linaro.org: domain of brgl@bgdev.pl has no SPF policy when checking 209.85.221.47) smtp.mailfrom=brgl@bgdev.pl;
	dmarc=none
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a50fc7ac4dso307231f8f.0
        for <greybus-dev@lists.linaro.org>; Tue, 24 Jun 2025 06:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750771903; x=1751376703; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z0Du0WyQ1wf685TcUlV0nws22+DQO6O5SNDzfjdK144=;
        b=PHIi97cfSaZV28ktj++Nuoc5nMjKAALRMwx+mOpRBJa0omd3fYDC43uCWH2jhe9fTo
         ExrKPtCGNYEdqBfzdnUMG8gayRhAHNHKodGtZsr03AaUnNGV9eqtswNDD9x8qcU/8cID
         OL+xLJJ1CQirBUMJenoLcG/rQnoeUA5dWj7qDeoNpD9tWDFFichAGXvgmjJ9O5CMVOoT
         wNwrZpMxtU5CQgHy9kcTu6VK9KfOd28EWIR6T+/xUav71s8XwtiWPb/bVSXWcxkyLbX7
         2gOohDmEU5Pa1Lx7GSWSwPH3hjSDESQvwXUY+dcq8PggPLjyuM6FxYaonAsNxNN5Bleg
         FB8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750771903; x=1751376703;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z0Du0WyQ1wf685TcUlV0nws22+DQO6O5SNDzfjdK144=;
        b=q24JhBY2MPfNoqcAoU0DZWZETFtPkWl5/AjoMOaUZPY/0/jKftJ3XOSFr/VhRk9RNW
         /UUHYZlfVhp2qpMIhnhJhzeV7LIGY8eD+Wl+/Zy2grJu/DepK5zPWlBmogXbR9LDAgRT
         SwgqLGmDGt0wpWpmWkRjNK3M62GI54V02OCWM2AQXHxPi26l5cxjV/43b8rNU0b0BWUj
         reSd8d+vRrOlMM1O629/FH2ZlIWHEIdyd48tIZaKJhggYOXDep9HFRtmPdnSjWxAk+08
         tWFQDln1ZPQogk0UlK+9AauzJxqhAYMygsrjtQzCxFSVOp7S478aP9dowxXEeNorwrZG
         HIXg==
X-Gm-Message-State: AOJu0Yx5jK45WfDKZsBEC0ohAg9U3lV4qPhQDWUMPE/EnrzrKMWa/IAT
	RMOWSQmpsDXstGZBDfc0uMr1JtsGWWt16+4CZ7opmOg2uCbuWT6C3YuKSKNE/EatHjA=
X-Gm-Gg: ASbGncuZsupBPbj5QEpwPf2/DQh4/lk/iLvtaxSm6zC+l+jdaQh4wb2XmaByoKet38T
	2Bz3BXlLCaYSmWgzqCRu9heyvl08SFGc1TJG3rgVvb+zcXsTxaNUJbBKouvO1YHArF6D3scsAIp
	Gj4wkYJBzxBbMk2y9JvDBHOPBxD9LtUw3fjDOUER8DxjHaBbHUSpWhq9zwLCBScRTCw8cYw4XPD
	HfnkNj6Wzy7llvlr0GRr7h/O1Uze/5FkO3mY1b3oMK9+W6euO7t9Hxep4Vk+AKEKH3lNpSwsfj/
	u9YLMvU6FTMUcWzVM9k0WAvmwTZbH70qIEGuD8sRGjaFV78qONcZdEWmYTOKOMaCF3Nif9gPpw=
	=
X-Google-Smtp-Source: AGHT+IGAIE3Cb9saVkrbR0BA+3/0q3Lc+wPWBWW2QFFrws0xeoQg8CrHtwnyEaxIARx3hSsKbDBnIA==
X-Received: by 2002:a05:6000:4812:b0:3a5:85cb:e9f3 with SMTP id ffacd0b85a97d-3a6d12fb438mr13704051f8f.12.1750771902977;
        Tue, 24 Jun 2025 06:31:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:34d2:109c:3293:19e9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8069534sm1921749f8f.44.2025.06.24.06.31.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:31:42 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Ayush Singh <ayushdevel1325@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 24 Jun 2025 15:31:40 +0200
Message-ID: <20250624133140.77980-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 10EDC3EFDE
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bgdev-pl.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_NA(0.00)[bgdev.pl: no valid DMARC record];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.47:from];
	RCPT_COUNT_SEVEN(0.00)[7];
	DKIM_TRACE(0.00)[bgdev-pl.20230601.gappssmtp.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Action: no action
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GKSKBIPKVXRD5VIQAKL4WQJTTOUALJDW
X-Message-ID-Hash: GKSKBIPKVXRD5VIQAKL4WQJTTOUALJDW
X-Mailman-Approved-At: Tue, 24 Jun 2025 13:42:41 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: gb-beagleplay: remove unneeded calls to devm_gpiod_put()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GKSKBIPKVXRD5VIQAKL4WQJTTOUALJDW/>
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
Changes in v2:
- add a comment to gb_fw_init() saying it must only be called from
  probe()

 drivers/greybus/gb-beagleplay.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/greybus/gb-beagleplay.c b/drivers/greybus/gb-beagleplay.c
index da31f1131afc..9610f878da1b 100644
--- a/drivers/greybus/gb-beagleplay.c
+++ b/drivers/greybus/gb-beagleplay.c
@@ -1039,9 +1039,12 @@ static const struct fw_upload_ops cc1352_bootloader_ops = {
 	.cleanup = cc1352_cleanup
 };
 
+/*
+ * Must only be called from probe() as the devres resources allocated here
+ * will only be released on driver detach.
+ */
 static int gb_fw_init(struct gb_beagleplay *bg)
 {
-	int ret;
 	struct fw_upload *fwl;
 	struct gpio_desc *desc;
 
@@ -1060,29 +1063,17 @@ static int gb_fw_init(struct gb_beagleplay *bg)
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
