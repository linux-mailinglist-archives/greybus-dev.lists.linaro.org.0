Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE6B4B6FD1
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 16:34:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A0C3A3EE8A
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Feb 2022 15:33:59 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 6D6043ED38
	for <greybus-dev@lists.linaro.org>; Tue, 15 Feb 2022 15:33:56 +0000 (UTC)
Date: Tue, 15 Feb 2022 16:33:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644939235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fo3G255rStH8Du8K9gC/4Oh74dENohOh6rR9zxNrm7k=;
	b=XUlLU3y8E7KMImLqhqzV4hl9D+jJ9rjIrS+mUfV5bV0v5J2CRECN+P3KG/vjZD7sSoaYsk
	GY5LSWdSZjpGWh76k4nF1Onmv9A6XCGLbQL0QYJVeDRjTonCcIOUPninA0ulfxFM/hVNSg
	ENch2bFq2JnUN5XMpsY2wU+SQMfqJhD+a7PLZB/+cnLDxhXwsnZY1ioGfrcoq5hoJoFmnU
	MRS9p+efKSnsj73i2n2cTObxd3+PNgnL3f5SJe/USqyKkjbGLL/E12Rupg15tkLrPoWeVa
	gtf8ingSKcqdI3Evhjdj6dR6MeZKGsoyWRe11dtBSMAouuG+26XXfOS6Nvn2+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644939235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fo3G255rStH8Du8K9gC/4Oh74dENohOh6rR9zxNrm7k=;
	b=UIMOEVLl4BOgnwWtzIvKmG/pUXYmNgTYSRB16jg5vzp7F8ph7KiVCrzNBEaPZ7fz/HkQpN
	ai9g52CGNZvW22CA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Lee Jones <lee.jones@linaro.org>
Message-ID: <YgvH4ROUQVgusBdA@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com>
 <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgvD1HpN2oyalDmj@google.com>
Message-ID-Hash: UKD5PHEVW6AWVBV4JX52EUOXJEQ5D7LJ
X-Message-ID-Hash: UKD5PHEVW6AWVBV4JX52EUOXJEQ5D7LJ
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UKD5PHEVW6AWVBV4JX52EUOXJEQ5D7LJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-02-15 15:16:36 [+0000], Lee Jones wrote:
> On Tue, 15 Feb 2022, Sebastian Andrzej Siewior wrote:
> 
> > On 2022-02-15 14:36:01 [+0000], Lee Jones wrote:
> > > Do we really need to coordinate this series cross-subsystem?
> > 
> > I would suggest to merge it via irq subsystem but I leave the logistics
> > to tglx.
> 
> Could you answer by other questions too please?

I don't think that I can answer them. I said I leave the logistics to
tglx.

This can go via one merge via irq. This can also go differently i.e.
feature branch on top of 5.17-rc1 (with 1/7) which is merge into each
subsystem and then the "feature" on top.

Either way it remains bisect-able since each driver is changed
individually. There is no need to merge them in one go but since it is
that small it probably makes sense. But I don't do the logistics here.

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
