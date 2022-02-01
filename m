Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E28DF4A59D6
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Feb 2022 11:19:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13B553EE25
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Feb 2022 10:19:37 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 578C03EB81
	for <greybus-dev@lists.linaro.org>; Tue,  1 Feb 2022 10:19:33 +0000 (UTC)
Date: Tue, 1 Feb 2022 11:19:30 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643710772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zVdXAdiNqZMNia/PwsDvpt2M8XBenqRQG89XO/wiab4=;
	b=KXw/EDrVIZ/6ANYE1s/ntwpB5rm6HXp5v29EJvDmBXlD3E5ckVQCfM9INzRPucFx+J0QrR
	/C6MHGFj9Do7dLjR2XrJweA6K2W82N5K/Y7y56ENVZVVz+xnhVYmhHZ53gmo/IM/zcPcvq
	4OXstFQir5GZip47n3IUb1bqooBwxqc/daBEjLcPc3jMhlpXDR/ji8HTPI/7XpHhOqPDXv
	6GJWngijUjNffZyBKv1Uyl9sIh8BugZvfKyCj+nCYpEsoTWEAbIuz5Q+DT0i6MUceHKBeu
	rBOItXhzwZeSFO7nVTkVO03lWctqUhnc9WJORnRcMtrqITmiyPcidcQSnsEz/g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643710772;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zVdXAdiNqZMNia/PwsDvpt2M8XBenqRQG89XO/wiab4=;
	b=a4oNUHgytQlrI+TzuXy04pTpxNHDI9KwLTajCUbChXnHl8pdfUAmf7J1XQs8E/HCP9gXo4
	2ECBoqyJhI1D+iDg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YfkJMtW3Cc1ixGtS@linutronix.de>
References: <20220131123404.175438-1-bigeasy@linutronix.de>
 <20220131123404.175438-5-bigeasy@linutronix.de>
 <YfgGG0v/zhQp41tr@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfgGG0v/zhQp41tr@google.com>
Message-ID-Hash: Q4AANMNFFP6AS64M2GQCIC4ANA3VHU5A
X-Message-ID-Hash: Q4AANMNFFP6AS64M2GQCIC4ANA3VHU5A
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2.1 4/7] misc: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q4AANMNFFP6AS64M2GQCIC4ANA3VHU5A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

generic_handle_irq() is invoked from a regular interrupt service
routine. This handler will become a forced-threaded handler on
PREEMPT_RT and will be invoked with enabled interrupts. The
generic_handle_irq() must be invoked with disabled interrupts in order
to avoid deadlocks.

Instead of manually disabling interrupts before invoking use
generic_handle_irq_safe() which can be invoked with enabled and disabled
interrupts.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/misc/hi6421v600-irq.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/misc/hi6421v600-irq.c b/drivers/misc/hi6421v600-irq.c
index 1c763796cf1fa..caa3de37698b0 100644
--- a/drivers/misc/hi6421v600-irq.c
+++ b/drivers/misc/hi6421v600-irq.c
@@ -117,8 +117,8 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void *__priv)
 			 * If both powerkey down and up IRQs are received,
 			 * handle them at the right order
 			 */
-			generic_handle_irq(priv->irqs[POWERKEY_DOWN]);
-			generic_handle_irq(priv->irqs[POWERKEY_UP]);
+			generic_handle_irq_safe(priv->irqs[POWERKEY_DOWN]);
+			generic_handle_irq_safe(priv->irqs[POWERKEY_UP]);
 			pending &= ~HISI_IRQ_POWERKEY_UP_DOWN;
 		}
 
@@ -126,7 +126,7 @@ static irqreturn_t hi6421v600_irq_handler(int irq, void *__priv)
 			continue;
 
 		for_each_set_bit(offset, &pending, BITS_PER_BYTE) {
-			generic_handle_irq(priv->irqs[offset + i * BITS_PER_BYTE]);
+			generic_handle_irq_safe(priv->irqs[offset + i * BITS_PER_BYTE]);
 		}
 	}
 
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
