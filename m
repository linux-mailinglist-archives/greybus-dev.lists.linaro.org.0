Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8C7AD3D45
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Jun 2025 17:34:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DAA024447E
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Jun 2025 15:34:17 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	by lists.linaro.org (Postfix) with ESMTPS id 2100A44439
	for <greybus-dev@lists.linaro.org>; Tue, 10 Jun 2025 15:20:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=bgdev-pl.20230601.gappssmtp.com header.s=20230601 header.b=Ufmb52RZ;
	spf=none (lists.linaro.org: domain of brgl@bgdev.pl has no SPF policy when checking 209.85.221.52) smtp.mailfrom=brgl@bgdev.pl;
	dmarc=none
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a5123c1533so3191073f8f.2
        for <greybus-dev@lists.linaro.org>; Tue, 10 Jun 2025 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749568842; x=1750173642; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pedIUwRN3D7qvw8UIlmZrCckR2WX2CSjcTaVtRgsTAo=;
        b=Ufmb52RZ0+N0BnW/HSoTPi6916Tnxv8jcpKkkk0LXgu9UDIoYdxr8GllV2+5OXuJkP
         WfJdF2c3L1uyYBoeAPVh+lhaXKKcl5qr2Eif8L4hM/YK/xeGZeo6DczHwgq/b03c9ORd
         OYGM22GkkaCEyBPtqrdhXzcq42/hyC0nmKcswaP33gVbp/ZY8VF4xd0ofI419D7v50BO
         17cTDCQ+kemxflXmHVgZqRFhy+tp/NSTwz+6n0pniboP/0gMqGyMuAFzyg/CCbGFNROf
         2t4ur0MmCobz2iyszwr8wW857pYa8S7SILshrYhLIcLt+9eszCZ/xsDCTa6Wyy/PmoAM
         ePFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568842; x=1750173642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pedIUwRN3D7qvw8UIlmZrCckR2WX2CSjcTaVtRgsTAo=;
        b=twUkBLFyZK6EGNEc3jjYnHlgkIn/X4rC5EPXNvg4FOBP7JK2IIwStUFJwGBCsWRoCC
         9bzROdNihWP/fD8pIrLw7QQO4mSILQaEWGUKvADLlF9vosTEOT/sOS+eGjYEPvdZVBF3
         cLiCtQGbp7UtwcfSPXZDh9JQnI0EDJv8jP8gQk72NyrU7Qf47v5VaWi1xvmyq6ipnC/+
         JMCUaEU4nJXT/SaL2ZrjYSnVzEMtItXqycFfGkBZep32LEPZGZmzNmZDR8droh9QFbaJ
         x6APwWdpnXSyKrW+Ef/2PGRFi5LP7dKhEFrjSqro1qLQXGtNoeLaw6UaDMi+iyeSrzDh
         6TcA==
X-Gm-Message-State: AOJu0YyiU05NsNldLlT/uPA0SHb6MSDy4S28tz9iHgNYaC5fs0UXMF29
	Te4bek1BI2irdYpDb1No2M4pBh56DW8oC/Pe2xNm0zPOPuVrvHLIWkqjcGe0OiHWLzs=
X-Gm-Gg: ASbGncth9iwcB8ADQ0jyQG2tiqE+HWrJH7binoxneyXroGrn0nWMYKHlI36m+3QE02F
	/k4dIv5m6ieC/tO+fnyjV1tWTQraxzyx5E2PdcIG/war5pNEKQecFYI9wHE2WLZNWu49PVyjZWc
	GA9qvrPsfaNE6X1I5n9x5Q27RZf89qbxhiwvxqCCsnxYtzjDxgMo6f20okUSKUey13c+nkB6tqb
	bhFV9P6IA77ChaMyXbvX5NEdD87YG/o0H2vo8jnHmEBmab/G9xZPxyn0lkzkCW6k8q/0d6Y/+WY
	V+HenXyzZEdwDeFNnfQHKYzLJFGr+cRrGIH7pEt1Uw16mjAPR8603/e3bQ0WFJgfUHnECNQ=
X-Google-Smtp-Source: AGHT+IFDGGWE1z6DBNuxPQdlOoATNSHUMRrZOzpLgsWsb9C2dYFqKHbu0/aBJ7qfKFllqnf+O89l6w==
X-Received: by 2002:a05:6000:4305:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a5319ba2bcmr13714922f8f.7.1749568842105;
        Tue, 10 Jun 2025 08:20:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm146708685e9.38.2025.06.10.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:20:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 10 Jun 2025 17:20:36 +0200
Message-ID: <20250610152036.86099-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-1.80 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[bgdev-pl.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.52:from];
	DMARC_NA(0.00)[bgdev.pl: no valid DMARC record];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	DWL_DNSWL_BLOCKED(0.00)[gappssmtp.com:dkim];
	DKIM_TRACE(0.00)[bgdev-pl.20230601.gappssmtp.com:+];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DNSWL_BLOCKED(0.00)[209.85.221.52:from];
	RCVD_TLS_LAST(0.00)[];
	R_SPF_NA(0.00)[no SPF record]
X-Rspamd-Queue-Id: 2100A44439
X-Spamd-Bar: -
X-MailFrom: brgl@bgdev.pl
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DTXSU2MVON6JKQ3NBQBOHS7E2EULL5ZA
X-Message-ID-Hash: DTXSU2MVON6JKQ3NBQBOHS7E2EULL5ZA
X-Mailman-Approved-At: Tue, 10 Jun 2025 15:34:14 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove unnecessary GPIO line direction check
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DTXSU2MVON6JKQ3NBQBOHS7E2EULL5ZA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/staging/greybus/gpio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index f81c34160f720..1280530c8987a 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -192,12 +192,6 @@ static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 	struct gb_gpio_set_value_request request;
 	int ret;
 
-	if (ggc->lines[which].direction == 1) {
-		dev_warn(dev, "refusing to set value of input gpio %u\n",
-			 which);
-		return -EPERM;
-	}
-
 	request.which = which;
 	request.value = value_high ? 1 : 0;
 	ret = gb_operation_sync(ggc->connection, GB_GPIO_TYPE_SET_VALUE,
-- 
2.48.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
