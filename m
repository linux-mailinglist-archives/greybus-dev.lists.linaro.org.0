Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA154B6FED
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 16:46:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29B0A3EE85
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 15:46:14 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id CF0433E825
	for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 15:46:11 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:46:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644939970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qEoj4mtlQVRRs6/6d8GaUUFXpcwiomjAL9sone681ow=;
	b=X6gZDDvzy0Gw2Py/F4ZZoB+hsDF5zDkWf7v971/LigaPKniUQS9BxooEKi3qlcTq0f193Z
	CZxTojO+cQrmdhEA8CRFICdpq0BO75E3qthBj42SqEKI1hjUPiIrJ7lf9tz3kddCuESPP6
	rqH7Pn/mlXpAlnJZuWF/LMSj1oUdnJdtQbIsmb4p/KqFElPxNDP46Q/0fm46RciJzL32DY
	ylg8/zeKzuKvYkJuZ4zafaXtui/p2e+iZVE6T3DJnHn2CYnm9rKK2KMF2jZWLPFN0rEIUa
	v/3g8mtYoT2OEhbtl55rZD3PhB+XqzewGsHq0w1R3Ft90LWNorPKUpR7bxG7qw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644939970;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qEoj4mtlQVRRs6/6d8GaUUFXpcwiomjAL9sone681ow=;
	b=biMHfMQ835e1UpRnlTmHgGmqBm5gQcME2t7bLKWswSicWiCwflGxTeRUn8J1nxOLr0sS1U
	0FmWvII7n7PGbABw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YgvKwd525feJkBHV@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
 <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgvJ1fCUYmaV0Mbx@google.com>
Message-ID-Hash: GUP75OSDI52RKXENA6US6MMCSMQDISN5
X-Message-ID-Hash: GUP75OSDI52RKXENA6US6MMCSMQDISN5
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GUP75OSDI52RKXENA6US6MMCSMQDISN5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-02-15 15:42:13 [+0000], Lee Jones wrote:
> So there aren't any hard dependencies between the driver changes?

Correct. #2 - #7 depend on #1. The order of #2+ is not relevant.

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
