Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4768B6C6A13
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 14:54:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4E7933EC33
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 13:54:51 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lists.linaro.org (Postfix) with ESMTPS id 4CE833E975
	for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 09:04:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=hoFy1YlM;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.216.51 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id mp3-20020a17090b190300b0023fcc8ce113so1281445pjb.4
        for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 02:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=hoFy1YlM+Ou4lh0YKLuMnMSIdbLbE14MqBS1SC7KjUNh2kF/qIvdI94Q/6Pf6fQYgD
         SLOV7FX4N/holaDTDjRHZYO5HjilL5W6VQ/vdCtKhXubLcAQBRhJvxnItxYn4W3Eoqkn
         qGZdnJtgtBoUwyYEJUkd/ZhRZ16fPJiij1SSdyQrqqoAWQ5/R8L774dQwWWPYDjV444G
         8sUCpfgwE2HbjBA/hwPluQ53d9VYOftWc/jM7PE8763T7HywEa+7U8M+nzXd2hsKbyWq
         eYeA5Z65UH7hAE1wRhvXz2D9i6gGDFXwp+uXSIZ3X4415fvat6tbxl4r5ewZEaIsLvZW
         ga5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OjcZplfqBfGxkesm/SQ2YHNMoUVOYWANADhv4EwbVKw=;
        b=OKZROT0SdPPiL1xo0EKa8g916yuydW4bFdFpYnui7ObZT7YwMoTkFmtrygf41G1MAG
         zDGHqzvfzoZgw83DZ2r1epIou0vtW9f6tPxxwK1/9b7ttRM0bYxInH5jB95WmST474Ie
         NKzD07DJo8or+XTO1eXEYVqsUTL3uZfR5Y0bg8bsZI0Hq9lkTdsH8uY0galSxQKdRXG4
         Jovu6gDHXCSN8NEz7mve5kxSvHw3toLx9IBWq2f2rhf3Y3w5eQH8VTsh6xQvAh86Zk2Z
         UijlFqcNEfZWoaQPh+uh6BjvMTwMgGqA/8HMiYSqlzJMzEvPdT7hpZfOtHiTMR3Zm78+
         Eb9Q==
X-Gm-Message-State: AO0yUKUTzEAm1MCPUWOfPR90F8klusyG7EPEZbvrYjNiRGFgStTmiMui
	1fxNlGxRYjTFOg0DISeCiDQ=
X-Google-Smtp-Source: AK7set/oTTiOrApmUymSuNVVr+CSlC/dlZSzh452dlK3gzZb5t+MSmqd5fk4C8IAizbPWqksg3qEQQ==
X-Received: by 2002:a17:903:247:b0:19a:9880:175f with SMTP id j7-20020a170903024700b0019a9880175fmr6518482plh.51.1679562247398;
        Thu, 23 Mar 2023 02:04:07 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005034a57b963sm11277116pgt.58.2023.03.23.02.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:04:06 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Thu, 23 Mar 2023 02:03:34 -0700
Message-Id: <92e39b9957a1863d13fc5ce9e346e99c68550fa3.1679558269.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679558269.git.sumitraartsy@gmail.com>
References: <cover.1679558269.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4CE833E975
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[117.207.139.205:received,209.85.216.51:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.51:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PETQVS64EB3GMZC7C6BQFYFVTC7JT6TE
X-Message-ID-Hash: PETQVS64EB3GMZC7C6BQFYFVTC7JT6TE
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:54:41 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/3] Staging: greybus: Convert macro gpio_chip_to_gb_gpio_controller to an inline function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PETQVS64EB3GMZC7C6BQFYFVTC7JT6TE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert 'gpio_chip_to_gb_gpio_controller' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/greybus/gpio.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index d729b922a750..2a115a8fc263 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -41,8 +41,11 @@ struct gb_gpio_controller {
 	struct irq_chip		irqc;
 	struct mutex		irq_lock;
 };
-#define gpio_chip_to_gb_gpio_controller(chip) \
-	container_of(chip, struct gb_gpio_controller, chip)
+
+static inline struct gb_gpio_controller *gpio_chip_to_gb_gpio_controller(struct gpio_chip *chip)
+{
+	return container_of(chip, struct gb_gpio_controller, chip);
+}
 
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
 {
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
