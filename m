Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D09B04A4070
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 11:47:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 88E303EE31
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 10:47:37 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 4D5453EE23
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 10:47:33 +0000 (UTC)
Date: Mon, 31 Jan 2022 11:47:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643626051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvT+96WC4xlc86N7eSlAFMmOlclUSR1CkGpGq2QgIX8=;
	b=KZMyEJRre/OttTzp9HkeBp+HSKli3uTN429Y3mRSBq/r1Mpxrd1Ltk29IKGetZ97dQ0I2j
	Ga6uTRd1q1TzAkUfqqU5SpZ5bMaBwFDStAYV/5QXO1WDzMGVq36JOqnfHHvv9RC6RXKK5I
	ZRmJKVhJrSR/OWPcmrLv2OLnTKwexMDSzxhF3mXSTUr8V9Wmd2vDYkAkZBCsyfPwBldb6U
	/kvmF5kGEZdEqh1YWN8yMzfYI5LYYlfHwgHYNPZ8YnVNB3QewJ00Yj7kgfgVEkfXalxS9t
	tQ6pwHXaeSPRG4AnB85Kx9l8O2eTGhhPLzBpx3nf8TIssmpitr7feb+kQkvnkw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643626051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=IvT+96WC4xlc86N7eSlAFMmOlclUSR1CkGpGq2QgIX8=;
	b=cVrD8VA+0PMCB+FD65Xrt8Wz4qGuljy8hfkRLVd7SpOP0A49Uyb3uF79h/L8DsKn3i3/TB
	ONpvSGGPh4iijGBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Wolfram Sang <wsa@kernel.org>, greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>
Message-ID: <Yfe+QRJh8OIPSuD1@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
 <YfLQYa5aKJKs7ZUe@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfLQYa5aKJKs7ZUe@shikoro>
Message-ID-Hash: FRJMSITIDSWLRJKR3M3B655DL3VUU5QK
X-Message-ID-Hash: FRJMSITIDSWLRJKR3M3B655DL3VUU5QK
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FRJMSITIDSWLRJKR3M3B655DL3VUU5QK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-01-27 18:03:29 [+0100], Wolfram Sang wrote:
> Hi Sebastian,
Hi Wolfram,

> > +/**
> > + * generic_handle_irq_safe - Invoke the handler for a particular irq
> 
> This is the same desc as for generic_handle_irq(). I suggest to add
> something like "from any context" to have some distinction.

There is something later but let me reword that.

> > + * This function must be called either from an IRQ context with irq regs
> > + * initialized or with care from any context.
> 
> I think "with care" is not obvious enough. Can you describe it a little?

Yeah, will do.

> Thanks for this work,
> 
>    Wolfram

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
