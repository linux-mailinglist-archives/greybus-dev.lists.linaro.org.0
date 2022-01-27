Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 147C249E113
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 12:33:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4878D401C5
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 11:33:43 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id C1EF6401E2
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 11:33:18 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643283197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnqBSA0fX+jQu5NWHLqll8brJ7sQU9NzIdODqyqj1bE=;
	b=Q+dMM7Q2U8ZnFsJmtKBKMyTFK/NwRUspp1jHd025ymaNdAH5HG9m0qiDDdFo+8SsD1OOSq
	XhdLxpNsvdbW3GHcLOPc9t7tE2/yeZ1SAyZyAkZL+bCN7Eq4cuaHr7Ns4HSm8F2SYw6BMV
	YyOss4QzJNl8H6ssjX9r65ps2LL8mLpE9DFH17Tk8InkYZ05Tp/Vsres/zQ6VXQN75xqSo
	+uBsTPjrrVLXC9cAVrMcId5bJ9xPB6pcor8DdgeKkLo8tnIds7qf5yp6MhfUA+VGr9td0R
	OuHLpeSt61TkUDdzwZiKsAf+o7YQ2uaCnLw78ftXIZrhfEpcRRi8vkfeGsz+jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643283197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZnqBSA0fX+jQu5NWHLqll8brJ7sQU9NzIdODqyqj1bE=;
	b=HfV/uD24kkWJpBncedkJYbJ9LHCd+gIicOaa3Ov9P9oJotKouxwL0LxvVjE4w8l7PdLzLT
	s7HbM7nauDjMhFDw==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Thu, 27 Jan 2022 12:33:03 +0100
Message-Id: <20220127113303.3012207-8-bigeasy@linutronix.de>
In-Reply-To: <20220127113303.3012207-1-bigeasy@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: D36NET27HPYNLVGAFE7EDUGSRL5VPGLG
X-Message-ID-Hash: D36NET27HPYNLVGAFE7EDUGSRL5VPGLG
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 7/7] staging: greybus: gpio: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D36NET27HPYNLVGAFE7EDUGSRL5VPGLG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Instead of manually disabling interrupts before invoking use
generic_handle_irq() which can be invoked with enabled and disabled
interrupts.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
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
