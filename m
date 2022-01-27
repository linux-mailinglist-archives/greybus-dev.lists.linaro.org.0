Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EE49E106
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 12:33:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 952FE401DF
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 11:33:18 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 7D9153EE01
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 11:33:13 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643283192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mYuhfjkgxLhE5J8QB5lsf+7ptUPDT96pRbbQPehAdC8=;
	b=XZCFerNUAmzCKjtqqGZwMhE9HSLl1QSDm2Q8IIOFsTVkH0Ajuh7tbVE3b450WaT3A5txzB
	h+M8uUgiQFmnLlpOlJR8+PZ6naF2+gpYPSawH9bTTZb6jMnXy8q7msFSx34FUYYiPT+Z8o
	kg0PCUg5FDRvNQn/tNgZYUtv5fmgkeUg+W2ouBsbS3Uyz+6iilSrRrSf3ZaPp5brxJ0tWg
	8rU+bFShHVDZmV4DlAxV/xw/Ub2+a9arOZc4gCByObSBEJS2rUqzLr5/AGk0jA7oonhXdJ
	SiGhhT4K75i/WNxqqMQc2k/ucIbPqYMekysfWa6QeXXYxFppvAvz9TtPOj48Ng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643283192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mYuhfjkgxLhE5J8QB5lsf+7ptUPDT96pRbbQPehAdC8=;
	b=GhwP9tvTaIPi+tfKsIwn4x++BLWbtaW9ubbbR0b2mwK09vTxnXqK716l0qaHvLBem+lW0L
	odIz4rEwqEU8I/Bw==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Thu, 27 Jan 2022 12:32:56 +0100
Message-Id: <20220127113303.3012207-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: 3SEUJK47Y2BJCZCUGG4JQCGHLOSEFX4G
X-Message-ID-Hash: 3SEUJK47Y2BJCZCUGG4JQCGHLOSEFX4G
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3SEUJK47Y2BJCZCUGG4JQCGHLOSEFX4G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

generic_handle_irq() must be used from primary IRQ-handler (chain
handler/ interrupt controller entry). It is low level code and the
function expects that interrupts are disabled at entry point.

This isn't the case for invocations from tasklets, workqueues or the
primary interrupt handler on PREEMPT_RT. Once this gets noticed a
"local_irq_disable|safe()" is added. To avoid further confusion this
series adds generic_handle_irq_safe() which can be used from any context
and adds a few user.

Sebastian


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
