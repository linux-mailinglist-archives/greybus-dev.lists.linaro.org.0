Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C26A4B2C7E
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 19:15:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8256C3EEAF
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 18:15:28 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 985283EEC2
	for <greybus-dev@lists.linaro.org>; Fri, 11 Feb 2022 18:15:18 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644603317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IuoNc+UWwZXKcOsPOEqlxYI2AFgB+PxAmhNQBVvZYk=;
	b=tyfJGhse34IHkzEJRWlrJtA0Oc15FsGnW/DrJdsSpNXgvVyC7vvKnwuUZYvTPDv794z5g5
	WLuMa6u70ITvCipSrElXENioDEaAx7PVop0wggJM6jsohFCdAXOMm6qB9Ag+JYIblUSA2L
	25RgKRbGSe/8cox8BoPaA+UaUOgNlBKIh6KKa65xAxIP1CnvQqh3lCIN2u9LIatLH+8s5p
	V0717GDsVTZGKvYSwBRYY/zVEGqPUkj+t+ZklV2ziSZOv5U5jdBttfDwJONGkqAv+DuOJi
	coHTW8ECPDIflGcHETGrs0L5Xikum3UdKB+l6lno/1G5jmbqChKarRUHgGD1iw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644603317;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7IuoNc+UWwZXKcOsPOEqlxYI2AFgB+PxAmhNQBVvZYk=;
	b=3WNFUDrYJCRoKYi7lRw4iOjzlkKKK/mibHyET6iEg04XS8vM5eFyRgH+jWbWuEX09LCekS
	jR7gqSHUktVV+1Cw==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Fri, 11 Feb 2022 19:15:00 +0100
Message-Id: <20220211181500.1856198-8-bigeasy@linutronix.de>
In-Reply-To: <20220211181500.1856198-1-bigeasy@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: VKZ26LF7SVWLS42UNRZCUTUIKGRORA6N
X-Message-ID-Hash: VKZ26LF7SVWLS42UNRZCUTUIKGRORA6N
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 7/7] staging: greybus: gpio: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VKZ26LF7SVWLS42UNRZCUTUIKGRORA6N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of manually disabling interrupts before invoking use
generic_handle_irq_safe() which can be invoked with enabled and disabled
interrupts.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/gpio.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 7e6347fe93f99..8a7cf1d0e9688 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -391,10 +391,7 @@ static int gb_gpio_request_handler(struct gb_operation *op)
 		return -EINVAL;
 	}
 
-	local_irq_disable();
-	ret = generic_handle_irq(irq);
-	local_irq_enable();
-
+	ret = generic_handle_irq_safe(irq);
 	if (ret)
 		dev_err(dev, "failed to invoke irq handler\n");
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
