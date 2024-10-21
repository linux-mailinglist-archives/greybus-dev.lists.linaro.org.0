Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B470B9A5972
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Oct 2024 06:21:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3B148448E5
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Oct 2024 04:20:59 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	by lists.linaro.org (Postfix) with ESMTPS id A4D183F466
	for <greybus-dev@lists.linaro.org>; Mon, 21 Oct 2024 02:32:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=PIoPbb9Q;
	spf=pass (lists.linaro.org: domain of rosenp@gmail.com designates 209.85.210.182 as permitted sender) smtp.mailfrom=rosenp@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e67d12d04so3096062b3a.1
        for <greybus-dev@lists.linaro.org>; Sun, 20 Oct 2024 19:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729477940; x=1730082740; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JWG/7LkAlgP90UDcguaLP9EXEksqFk5VlcNJRKMNtNM=;
        b=PIoPbb9QgOzR02f1bVEbajavC8jn2YuIfjClquyXk+AuZDTR7TvqOddzyqZp9P15VX
         u4qDO5dfV1T0mDA8M4v4UIDYx/iNP5N6d8qQN+fxwKa/NhOHAykS2Db9w3hhN4zemLZf
         c2JxMtZC67PrKbmUXgKKfXUXYdp8tLJjiqgQeWfKVMLVv+pEjAVS5g2fjGcwqzDBSOyf
         N865x1f/HT2MAHEIGrG5bX9/Rts1szz9M1cuDPKVjLL255SEucur8w+imriKQLtxMWf7
         WNlckUjkXgeRbxJQa6O6mZAT/cGV7S1sqThaZu0KW6RTQVnilQpcdNv1GKlg6ayg2bUo
         UJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729477940; x=1730082740;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWG/7LkAlgP90UDcguaLP9EXEksqFk5VlcNJRKMNtNM=;
        b=AbRh0llIcD1gfp7V0yLb8hFFIMk8kq2udbHHv+8dNXFpixyElfVCo/6ufnwKC4pVH6
         MQ+yAU0QQe5clYtE724gIZFY8gIxCsxpFxrkSsYsWw0zYxjk7fKOUW/hCR7ZPwcVC+en
         JtIHN+TRzaDx1y7XXJ8xtA5vApghp6wI8bNIN36u+XXsHOykfi61UFGdZ/2SQ/Xf+c9i
         5tMuOjz1s0IrzqdolQ4ZBDhccEMT9CeN5WbsNkI/P3h1ecnAPcQMuyUmQiSlcDeU4MX9
         yVP99lMcvwkDXm9Axjsw4ew7hhkMmNHLs08MPZoiOYsgbiOKL4ylyQMndnyebRCGYrvY
         j1pA==
X-Forwarded-Encrypted: i=1; AJvYcCXirIlmBOx2ZJEPtUW+48zapTIlqzlYzQs3Ze0UK+EcX5d5GLsqjsVXYJmzpmXJk5otcXqZoscr43OeYg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxBraQ7i5dNcUMk9tBB0iW69xZdTwolV6ZIVRfAVIUyhpdKrs1u
	3gY9BYfq6KfK7GlhcwPrysv5gEJum+4xLKmmiJZJFbspq2dwiyFv
X-Google-Smtp-Source: AGHT+IFYyk8CVrDwkRticBp6a2dhSCiUkF6YX3DPNYLpCeSb/uvVMWqMV67+Y7VVEu3+lA81yhm5ag==
X-Received: by 2002:a05:6a20:e605:b0:1d9:ce8:35aa with SMTP id adf61e73a8af0-1d92c590f39mr13959549637.49.1729477939747;
        Sun, 20 Oct 2024 19:32:19 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8200:dab8::a86])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0f64cfsm15969195ad.284.2024.10.20.19.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 19:32:19 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-staging@lists.linux.dev
Date: Sun, 20 Oct 2024 19:32:17 -0700
Message-ID: <20241021023217.319545-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.182:from];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.210.182:from];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A4D183F466
X-Spamd-Bar: --
X-MailFrom: rosenp@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7NVOLHYI2TM2WD4KSTHU6F7WZ3SSVYIW
X-Message-ID-Hash: 7NVOLHYI2TM2WD4KSTHU6F7WZ3SSVYIW
X-Mailman-Approved-At: Mon, 21 Oct 2024 04:20:55 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: gpio: use gpiochip_get_data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7NVOLHYI2TM2WD4KSTHU6F7WZ3SSVYIW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of container_of, we can populate gpiochip_add_data 's last
parameter and use gpiochip_get_data. It seems to be the standard.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/staging/greybus/gpio.c | 33 ++++++++++++++-------------------
 1 file changed, 14 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 9b26e148d40f..16bcf7fc8158 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -42,11 +42,6 @@ struct gb_gpio_controller {
 	struct mutex		irq_lock;
 };
 
-static inline struct gb_gpio_controller *gpio_chip_to_gb_gpio_controller(struct gpio_chip *chip)
-{
-	return container_of(chip, struct gb_gpio_controller, chip);
-}
-
 static struct gpio_chip *irq_data_to_gpio_chip(struct irq_data *d)
 {
 	return d->domain->host_data;
@@ -278,7 +273,7 @@ static void _gb_gpio_irq_set_type(struct gb_gpio_controller *ggc,
 static void gb_gpio_irq_mask(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 
 	line->masked = true;
@@ -288,7 +283,7 @@ static void gb_gpio_irq_mask(struct irq_data *d)
 static void gb_gpio_irq_unmask(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 
 	line->masked = false;
@@ -298,7 +293,7 @@ static void gb_gpio_irq_unmask(struct irq_data *d)
 static int gb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 	struct device *dev = &ggc->gbphy_dev->dev;
 	u8 irq_type;
@@ -336,7 +331,7 @@ static int gb_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 static void gb_gpio_irq_bus_lock(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	mutex_lock(&ggc->irq_lock);
 }
@@ -344,7 +339,7 @@ static void gb_gpio_irq_bus_lock(struct irq_data *d)
 static void gb_gpio_irq_bus_sync_unlock(struct irq_data *d)
 {
 	struct gpio_chip *chip = irq_data_to_gpio_chip(d);
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	struct gb_gpio_line *line = &ggc->lines[d->hwirq];
 
 	if (line->irq_type_pending) {
@@ -407,21 +402,21 @@ static int gb_gpio_request_handler(struct gb_operation *op)
 
 static int gb_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	return gb_gpio_activate_operation(ggc, (u8)offset);
 }
 
 static void gb_gpio_free(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	gb_gpio_deactivate_operation(ggc, (u8)offset);
 }
 
 static int gb_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	u8 which;
 	int ret;
 
@@ -435,7 +430,7 @@ static int gb_gpio_get_direction(struct gpio_chip *chip, unsigned int offset)
 
 static int gb_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	return gb_gpio_direction_in_operation(ggc, (u8)offset);
 }
@@ -443,14 +438,14 @@ static int gb_gpio_direction_input(struct gpio_chip *chip, unsigned int offset)
 static int gb_gpio_direction_output(struct gpio_chip *chip, unsigned int offset,
 				    int value)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	return gb_gpio_direction_out_operation(ggc, (u8)offset, !!value);
 }
 
 static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	u8 which;
 	int ret;
 
@@ -464,7 +459,7 @@ static int gb_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 
 	gb_gpio_set_value_operation(ggc, (u8)offset, !!value);
 }
@@ -472,7 +467,7 @@ static void gb_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 static int gb_gpio_set_config(struct gpio_chip *chip, unsigned int offset,
 			      unsigned long config)
 {
-	struct gb_gpio_controller *ggc = gpio_chip_to_gb_gpio_controller(chip);
+	struct gb_gpio_controller *ggc = gpiochip_get_data(chip);
 	u32 debounce;
 
 	if (pinconf_to_config_param(config) != PIN_CONFIG_INPUT_DEBOUNCE)
@@ -579,7 +574,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	if (ret)
 		goto exit_line_free;
 
-	ret = gpiochip_add_data(gpio, NULL);
+	ret = gpiochip_add_data(gpio, ggc);
 	if (ret) {
 		dev_err(&gbphy_dev->dev, "failed to add gpio chip: %d\n", ret);
 		goto exit_line_free;
-- 
2.47.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
