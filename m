Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F0A90231B
	for <lists+greybus-dev@lfdr.de>; Mon, 10 Jun 2024 15:53:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C201F40EC1
	for <lists+greybus-dev@lfdr.de>; Mon, 10 Jun 2024 13:53:28 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by lists.linaro.org (Postfix) with ESMTPS id 59ED03F65B
	for <greybus-dev@lists.linaro.org>; Mon, 10 Jun 2024 13:53:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ti.com header.s=ti-com-17Q1 header.b=R5dpanIH;
	spf=pass (lists.linaro.org: domain of afd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=afd@ti.com;
	dmarc=pass (policy=quarantine) header.from=ti.com
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45ADrEnM106139;
	Mon, 10 Jun 2024 08:53:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718027595;
	bh=N1OeRdjzW2BDag8v1tJ9PaBomBTrv4HOdNeEt9jOvL4=;
	h=From:To:CC:Subject:Date;
	b=R5dpanIHD8xp+zZ9FCfRboABUCL0j8vAM+IngPcWLc5WWLJi3tWixDRewaPa9XouT
	 xj6IwZL4zBbtIlCFWCJCGoQijtQWIlU2SCvNC9/GgcEw7XvitmqqNm08rm1I1ml3RF
	 b1E5MJS1TlMZBC20LTH6zfu3GFmkJ6BRGRvhYa8w=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45ADrEWN099130
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 10 Jun 2024 08:53:14 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 10
 Jun 2024 08:53:14 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 10 Jun 2024 08:53:14 -0500
Received: from lelvsmtp5.itg.ti.com ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45ADrEoG032480;
	Mon, 10 Jun 2024 08:53:14 -0500
From: Andrew Davis <afd@ti.com>
To: Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski
	<brgl@bgdev.pl>, Jonathan Corbet <corbet@lwn.net>,
        Rui Miguel Silva
	<rmfrfs@gmail.com>, Johan Hovold <johan@kernel.org>,
        Alex Elder
	<elder@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 10 Jun 2024 08:53:13 -0500
Message-ID: <20240610135313.142571-1-afd@ti.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 59ED03F65B
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:198.47.19.0/24];
	R_DKIM_ALLOW(-0.20)[ti.com:s=ti-com-17Q1];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:161, ipnet:198.47.19.0/24, country:US];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,bgdev.pl,lwn.net,gmail.com,kernel.org,linuxfoundation.org];
	NEURAL_HAM(-0.00)[-1.000];
	URIBL_BLOCKED(0.00)[ti.com:dkim,ti.com:email];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+]
Message-ID-Hash: HEPPA256VNH6ME2KSEBBSIVDXAKCRM5M
X-Message-ID-Hash: HEPPA256VNH6ME2KSEBBSIVDXAKCRM5M
X-MailFrom: afd@ti.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, Andrew Davis <afd@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] gpiolib: Remove data-less gpiochip_add() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HEPPA256VNH6ME2KSEBBSIVDXAKCRM5M/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

GPIO chips should be added with driver-private data associated with the
chip. If none is needed, NULL can be used. All users already do this
except one, fix that here. With no more users of the base gpiochip_add()
we can drop this function so no more users show up later.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 Documentation/driver-api/gpio/driver.rst | 5 ++---
 drivers/staging/greybus/gpio.c           | 2 +-
 include/linux/gpio/driver.h              | 4 ----
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index e541bd2e898b5..ae433261e11a0 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -69,9 +69,8 @@ driver code:
 
 The code implementing a gpio_chip should support multiple instances of the
 controller, preferably using the driver model. That code will configure each
-gpio_chip and issue gpiochip_add(), gpiochip_add_data(), or
-devm_gpiochip_add_data().  Removing a GPIO controller should be rare; use
-gpiochip_remove() when it is unavoidable.
+gpio_chip and issue gpiochip_add_data() or devm_gpiochip_add_data(). Removing
+a GPIO controller should be rare; use gpiochip_remove() when it is unavoidable.
 
 Often a gpio_chip is part of an instance-specific structure with states not
 exposed by the GPIO interfaces, such as addressing, power management, and more.
diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 2a115a8fc263f..5217aacfcf54c 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -579,7 +579,7 @@ static int gb_gpio_probe(struct gbphy_device *gbphy_dev,
 	if (ret)
 		goto exit_line_free;
 
-	ret = gpiochip_add(gpio);
+	ret = gpiochip_add_data(gpio, NULL);
 	if (ret) {
 		dev_err(&gbphy_dev->dev, "failed to add gpio chip: %d\n", ret);
 		goto exit_line_free;
diff --git a/include/linux/gpio/driver.h b/include/linux/gpio/driver.h
index 0032bb6e7d8fe..6d31388dde0ab 100644
--- a/include/linux/gpio/driver.h
+++ b/include/linux/gpio/driver.h
@@ -632,10 +632,6 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	devm_gpiochip_add_data_with_key(dev, gc, data, NULL, NULL)
 #endif /* CONFIG_LOCKDEP */
 
-static inline int gpiochip_add(struct gpio_chip *gc)
-{
-	return gpiochip_add_data(gc, NULL);
-}
 void gpiochip_remove(struct gpio_chip *gc);
 int devm_gpiochip_add_data_with_key(struct device *dev, struct gpio_chip *gc,
 				    void *data, struct lock_class_key *lock_key,
-- 
2.39.2

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
