Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E44B6F66
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 15:50:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 750853EE86
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 14:50:53 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 8F6303E825
	for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 14:50:50 +0000 (UTC)
Date: Tue, 15 Feb 2022 15:50:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644936648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipSRQfa6UIjEiEWlLrIVz6abv3g7iod4IaRrr/RJMrk=;
	b=xK6+Uw/pq6yA+MSuOsm5RMMpP6S6CSqFAOtgJlROqOhRqW0L5FYMVHEoFx9FEBD1g87c8J
	Hkj7CKLBNk3+jdRQ2jPf/qOVmYfroHz4LLGxsK78Evi+xc2XpFv3qLij1GbXyuhIhOTsvB
	YbQz0Utnu2orN8bufazagopdGHaKe7pOOszWq2x0W477Hw21j3Aqh8XX0zOreczWP00pmF
	xi5ZWdZrN9Mre9U+rNdXkLortKL+i0ng975WAmbXwi2oWxC5wmXj9pB/Y71XGzqVlaxLcJ
	1pL/A6wjNEJQ+G5SuhV5vAUJP1B2wELaiFqVfyYloZbsQ2wrjNVqUJfSwwCxbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644936648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ipSRQfa6UIjEiEWlLrIVz6abv3g7iod4IaRrr/RJMrk=;
	b=UC9OLWjhpk9QTLHPdXI5gsmcyGj7qN3h6zOIE4bZBBE0/Eq3PVOsrG/TU7/btaq2JtDWm9
	z5XntHoRJVFbJEAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <Ygu9xtrMxxq36FRH@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Ygu6UewoPbYC9yPa@google.com>
Message-ID-Hash: C3YZ6SMMZLJGNW6WD25SVZUEIYGFPVI5
X-Message-ID-Hash: C3YZ6SMMZLJGNW6WD25SVZUEIYGFPVI5
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/C3YZ6SMMZLJGNW6WD25SVZUEIYGFPVI5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-02-15 14:36:01 [+0000], Lee Jones wrote:
> Do we really need to coordinate this series cross-subsystem?

I would suggest to merge it via irq subsystem but I leave the logistics
to tglx.

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
