Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361D4B2C7C
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 19:15:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 850CC3EEB6
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 18:15:25 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 808B53EEB2
	for <greybus-dev@lists.linaro.org>; Fri, 11 Feb 2022 18:15:17 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644603316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Rf56x1+Ad9rEt91/emuxS1F2pB4aiqCl6htULN1OW8=;
	b=LchHan5TX6agjdim4dt+UPKaRjNJpZCZdn17aiPGBGe97pGsT3FtcRNNhlF3GC/cXHKCpw
	Z9C3ha2WLtqm2BUN5hLJoh1FCyXnvy/pXO0PuHAN47g8EksqwkNJElM2DBNG3Wm1sBuatm
	GdNGfnaZ8BMNCaCWC659M+ZxWLQfZCxc9CuYx9cGxQGS0VfRaJqBtew87tHT65RXckjiPX
	BdN7dV4yVaWjwpPkMSkBZ0C2i2pgMRXdifeFbiX4Q6xDs7J1nQfNmrAs8zCFRFUg1Egztu
	5UHdFHcxuBZN9ngMFATPIZEvkaYT3obAGepyZRT46XRqJfHqFp51vvFuu15qtA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644603316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Rf56x1+Ad9rEt91/emuxS1F2pB4aiqCl6htULN1OW8=;
	b=3KjVfpW7VDjW0vSYVcWiBhYkT1kUMMT3/hcg6t0USTDFn6O02udQdcj7IiM1Q3ZhUFNgAc
	4sOF6cXimOuRYZAQ==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Fri, 11 Feb 2022 19:14:58 +0100
Message-Id: <20220211181500.1856198-6-bigeasy@linutronix.de>
In-Reply-To: <20220211181500.1856198-1-bigeasy@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: ZKNO7HXYSUOPEZDZGBFIRKRVVAQCUV5K
X-Message-ID-Hash: ZKNO7HXYSUOPEZDZGBFIRKRVVAQCUV5K
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 5/7] mfd: ezx-pcap: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZKNO7HXYSUOPEZDZGBFIRKRVVAQCUV5K/>
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
---
 drivers/mfd/ezx-pcap.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/mfd/ezx-pcap.c b/drivers/mfd/ezx-pcap.c
index 70fa18b04ad2b..b14d3f98e1ebd 100644
--- a/drivers/mfd/ezx-pcap.c
+++ b/drivers/mfd/ezx-pcap.c
@@ -193,13 +193,11 @@ static void pcap_isr_work(struct work_struct *work)
 		ezx_pcap_write(pcap, PCAP_REG_MSR, isr | msr);
 		ezx_pcap_write(pcap, PCAP_REG_ISR, isr);
 
-		local_irq_disable();
 		service = isr & ~msr;
 		for (irq = pcap->irq_base; service; service >>= 1, irq++) {
 			if (service & 1)
-				generic_handle_irq(irq);
+				generic_handle_irq_safe(irq);
 		}
-		local_irq_enable();
 		ezx_pcap_write(pcap, PCAP_REG_MSR, pcap->msr);
 	} while (gpio_get_value(pdata->gpio));
 }
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
