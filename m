Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5682F49E112
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 12:33:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 86A923EE01
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 11:33:39 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 50600401E4
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 11:33:18 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643283197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVlPTMDntv41BuaIBVh4q/kKYYaaoCfGMJweU6kQ6GM=;
	b=1lx9niiI8RRioyHNdrmVhjrW1KCB/zoquFCf9TJgs2Uq21WSsw28rWdIvFUxceQvO6pJKF
	UiFUea6uHg2UdxjqRDa0qej1X8oQAfysrkyvWiYfq+TQgc2jWSXssQJm7sdYqPOj+n9oVD
	NajTw7lyWg33dfO29HLLLi3oSNpQMwI3rDam34WHPjIrnEuVJ/12Qys7Z0dn7PCA5iXbjx
	7KmYPa05CPQLX6xcxxXjcWGUk+twV/+l24UZN68nisyKE/CFXdCyuxwFKgA8+pooy32TSs
	Zme9QX79lV694NSsLuR8bWGZhEXT/AUxl2H/QOvKEi7eXWOSw+7VroIIIZjndQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643283197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVlPTMDntv41BuaIBVh4q/kKYYaaoCfGMJweU6kQ6GM=;
	b=Ez758sB8dJOJPOxiDBVk13iEEcMxNSfJ4V1ID+WIb76mNC9VLRRakMKQoXDdneK8cXd8R5
	UT5PsJEZNEqX3FBA==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Thu, 27 Jan 2022 12:33:02 +0100
Message-Id: <20220127113303.3012207-7-bigeasy@linutronix.de>
In-Reply-To: <20220127113303.3012207-1-bigeasy@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: LA4GQAHPVULTND7GWTDRWP47F36AXW74
X-Message-ID-Hash: LA4GQAHPVULTND7GWTDRWP47F36AXW74
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 6/7] net: usb: lan78xx: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LA4GQAHPVULTND7GWTDRWP47F36AXW74/>
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
 drivers/net/usb/lan78xx.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/net/usb/lan78xx.c b/drivers/net/usb/lan78xx.c
index b8e20a3f2b84e..415f16662f88e 100644
--- a/drivers/net/usb/lan78xx.c
+++ b/drivers/net/usb/lan78xx.c
@@ -1537,11 +1537,8 @@ static void lan78xx_status(struct lan78xx_net *dev, struct urb *urb)
 		netif_dbg(dev, link, dev->net, "PHY INTR: 0x%08x\n", intdata);
 		lan78xx_defer_kevent(dev, EVENT_LINK_RESET);
 
-		if (dev->domain_data.phyirq > 0) {
-			local_irq_disable();
-			generic_handle_irq(dev->domain_data.phyirq);
-			local_irq_enable();
-		}
+		if (dev->domain_data.phyirq > 0)
+			generic_handle_irq_safe(dev->domain_data.phyirq);
 	} else {
 		netdev_warn(dev->net,
 			    "unexpected interrupt: 0x%08x\n", intdata);
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
