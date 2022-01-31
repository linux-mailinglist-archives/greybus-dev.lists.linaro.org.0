Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F404A4300
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 12:16:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EF3C83EE23
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 11:16:16 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 0C8203EE1F
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 11:16:12 +0000 (UTC)
Date: Mon, 31 Jan 2022 12:16:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643627771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ll9KYARRuBZxRo09tM644QKrs5m7bsyeSqNKNu1Ai5c=;
	b=QJK53clJumtX9s0dxa4QZmUp1wdIpcTFOVfNRju6Mii59Nhxumj5PbxnCD4YIG6qIWTVVG
	9L7zxyNwgikDsUUyIwuFK79UyAeB34C+zuMtZVMYKBmjkuR9krx0gpQDlQPK4+LdR/hKIO
	glESyBcvyQY/QjgcDDId0hHYsvzPtwUcRjmBx6KqGp8v/FiZfC/U1uDAy8SOrpX4zhIQlZ
	7cbm/5T0Ho6nnUB/CjuX0+tMSEIVp+RcWNWYTuPWnyoNOgoq9jUcEt0XYk+6vRxVBq2GUG
	lYIpoR7WuPpkoKOyFN212omM6hjlz6bith9xh+KRpvxYnyQJZncfYA0ZyoDiaA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643627771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Ll9KYARRuBZxRo09tM644QKrs5m7bsyeSqNKNu1Ai5c=;
	b=3nJZTRll2KKofcUlVbQaYLwLfUrkueiuloW8jj5eVHwVhU6NIL3VsqQeF07eMJyqEHZJnY
	e4MwZh8L7xEN4GCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <YffE+XxLpFKw+7HS@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-5-bigeasy@linutronix.de>
 <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44b42c37-67a4-1d20-e2ff-563d4f9bfae2@gmail.com>
Message-ID-Hash: WZQZSRJNTLXNL2MUNL4JM43IN45VCSNM
X-Message-ID-Hash: WZQZSRJNTLXNL2MUNL4JM43IN45VCSNM
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 4/7] mfd: hi6421-spmi-pmic: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WZQZSRJNTLXNL2MUNL4JM43IN45VCSNM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-01-28 13:23:08 [+0300], Sergei Shtylyov wrote:
> On 1/27/22 2:33 PM, Sebastian Andrzej Siewior wrote:
> 
> > generic_handle_irq() is invoked from a regular interrupt service
> > routing. This handler will become a forced-threaded handler on
> 
>    s/routing/routine/?

Yes, thank you.

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
