Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E62A649E10D
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 12:33:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2157D401D5
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 11:33:23 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 4D287401C5
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 11:33:15 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643283194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7B20wzlMtToieI5G7tCnCKu5TFMOwHYL5yYAy+C5s0=;
	b=JBkP8NyESqVS1Hlzz9WJk5NOcg243nCN04rH587WjPfrsgbMd+GF/cLL/KbCXARSBGy1te
	hnCMEdp37RY02ygC9IbYA60OWJRD5q7sv+jMgvDu1eUKskhYRm8bG1FdR30mutei0b5Wi4
	0k2g6OoFCBnXNs6C8CXFmSE+P3tuS6qhvlOyeWawldEug7w4y5qGsgUCe8Ca2Q1TguzFAY
	VtqdCdIlbp3ysKNH7OdDI0WzDdkrdnrKM/ELtMGf8lwFX15SItsdZSArQhIdQB4OHefEDF
	pAiL+soouMZwsuDsrY0hfyAN42JEj2I+goxptLQyo3+9vr4MAWvXSJMxVycebA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643283194;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=i7B20wzlMtToieI5G7tCnCKu5TFMOwHYL5yYAy+C5s0=;
	b=rx72YmxkZxACjESl0FCo5J02aVqivX+TAKPihjEbioTCo9OxW5XT5J4ODTO61qpGacEqwu
	WPl6X2GShe2I5oAw==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Thu, 27 Jan 2022 12:32:57 +0100
Message-Id: <20220127113303.3012207-2-bigeasy@linutronix.de>
In-Reply-To: <20220127113303.3012207-1-bigeasy@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: 74EQTFI3EJPJP3FW4WS2V7L746C43P46
X-Message-ID-Hash: 74EQTFI3EJPJP3FW4WS2V7L746C43P46
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/74EQTFI3EJPJP3FW4WS2V7L746C43P46/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Provide generic_handle_irq_safe() which can be used can used from any
context.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/irqdesc.h |  1 +
 kernel/irq/irqdesc.c    | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/irqdesc.h b/include/linux/irqdesc.h
index 93d270ca0c567..a77584593f7d1 100644
--- a/include/linux/irqdesc.h
+++ b/include/linux/irqdesc.h
@@ -160,6 +160,7 @@ static inline void generic_handle_irq_desc(struct irq_desc *desc)
 
 int handle_irq_desc(struct irq_desc *desc);
 int generic_handle_irq(unsigned int irq);
+int generic_handle_irq_safe(unsigned int irq);
 
 #ifdef CONFIG_IRQ_DOMAIN
 /*
diff --git a/kernel/irq/irqdesc.c b/kernel/irq/irqdesc.c
index 2267e6527db3c..97223df2f460e 100644
--- a/kernel/irq/irqdesc.c
+++ b/kernel/irq/irqdesc.c
@@ -662,6 +662,27 @@ int generic_handle_irq(unsigned int irq)
 }
 EXPORT_SYMBOL_GPL(generic_handle_irq);
 
+/**
+ * generic_handle_irq_safe - Invoke the handler for a particular irq
+ * @irq:	The irq number to handle
+ *
+ * Returns:	0 on success, or -EINVAL if conversion has failed
+ *
+ * This function must be called either from an IRQ context with irq regs
+ * initialized or with care from any context.
+ */
+int generic_handle_irq_safe(unsigned int irq)
+{
+	unsigned long flags;
+	int ret;
+
+	local_irq_save(flags);
+	ret = handle_irq_desc(irq_to_desc(irq));
+	local_irq_restore(flags);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(generic_handle_irq_safe);
+
 #ifdef CONFIG_IRQ_DOMAIN
 /**
  * generic_handle_domain_irq - Invoke the handler for a HW irq belonging
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
