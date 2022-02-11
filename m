Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9229C4B2C79
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 19:15:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C3F3B3EEA3
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 18:15:21 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 171073EEA3
	for <greybus-dev@lists.linaro.org>; Fri, 11 Feb 2022 18:15:16 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644603315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Cnx2U3ehecH1EXxHKkd2xHBgTX+RcdbAsjgFaXCm/o=;
	b=YZ2aHIHsD3RWbbdNTfg/nEFEtQHZr31lprXJboGVJI224gluh9gtvnKfHyGVWj60rEWUr/
	DAZumWiOCGMCrl0FIMaD0+Fl161Sx7vAUaQ2gaSAgMmefx8F/fgucRrqjmu/V1OKPhOlPE
	dJCurBSE+tULZwKRyy18s8Zg/iPOcSuNvS3orzlwdE+y8Z0hJLEMN3sX5XQt24bWRG2TWI
	mMR3stxnfg7xbFXYHKcpU6wsFGxLOR8rZEW1uUrXDt/I6CbPtGUR5J/j4qe8NyohcDOzXj
	gF7ST1PivBuZr68N4ubPOyz6h4VeLySJtoB549IFV5oPP2237lLBl2AfQUE1Aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644603315;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4Cnx2U3ehecH1EXxHKkd2xHBgTX+RcdbAsjgFaXCm/o=;
	b=PJrnP0HKK3oE2sDAfnkGEx4hPVdxi/YqKdzCfqnBTYMf81IAZlyROFp+ej2ZXqduNASxfV
	yajtfT0Zfq/+BGDA==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Fri, 11 Feb 2022 19:14:55 +0100
Message-Id: <20220211181500.1856198-3-bigeasy@linutronix.de>
In-Reply-To: <20220211181500.1856198-1-bigeasy@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: 6YQFPEQUQ3N2M7U5MTNK7P3LTKGTY7JS
X-Message-ID-Hash: 6YQFPEQUQ3N2M7U5MTNK7P3LTKGTY7JS
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michael Below <below@judiz.de>, Salvatore Bonaccorso <carnil@debian.org>, Oleksandr Natalenko <oleksandr@natalenko.name>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6YQFPEQUQ3N2M7U5MTNK7P3LTKGTY7JS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The i2c-i801 driver invokes i2c_handle_smbus_host_notify() from his
interrupt service routine. On PREEMPT_RT i2c-i801's handler is forced
threaded with enabled interrupts which leads to a warning by
handle_irq_event_percpu() assuming that irq_default_primary_handler()
enabled interrupts.

i2c-i801's interrupt handler can't be made non-threaded because the
interrupt line is shared with other devices.

Use generic_handle_irq_safe() which can invoked with disabled and enabled
interrupts.

Reported-by: Michael Below <below@judiz.de>
Link: https://bugs.debian.org/1002537
Cc: Salvatore Bonaccorso <carnil@debian.org>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Acked-by: Wolfram Sang <wsa@kernel.org>
---
 drivers/i2c/i2c-core-base.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index 2c59dd748a49f..3f9e5303b6163 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1424,7 +1424,7 @@ int i2c_handle_smbus_host_notify(struct i2c_adapter *adap, unsigned short addr)
 	if (irq <= 0)
 		return -ENXIO;
 
-	generic_handle_irq(irq);
+	generic_handle_irq_safe(irq);
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
