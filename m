Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A544BD971
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Feb 2022 12:33:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EFB883EEE8
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Feb 2022 11:33:06 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 305833EEDA
	for <greybus-dev@lists.linaro.org>; Mon, 21 Feb 2022 11:33:04 +0000 (UTC)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1645443182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DDK33/3302m/AxEjlqU7JR5WuOZd5Q+b5EdJBto11HM=;
	b=4YWj9EREiqE/4z9lRjzJiDCe2ileZomSn6vZTDKEA8y5hupG1tPoR9ME40N7lwiDuHKnd6
	bcQu7W7k5DaojT3yK5NmzHCUrcF1n8VlVruftElI4NfwOO8ZQPS3UnAfpZb8xa/xHf/iqP
	i5I/K0uVgBgff9mnMZa0DYj/Kapi0TG3lgoiu+44QmimuDoQM3430lXOiok7/pUQia5GpH
	Ylj14nB7AMUylwdSAC/roiPE0FO9S6u7A7esTSu4jHDP9twbIL+yA6N2rmuvblNGmoKJTQ
	ZVXctRztuqb5og+i/uU7LPW3OfyMcFO7dLcu04vjiF2XKZMsKMpzgB5Ud+K9Fw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1645443182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=DDK33/3302m/AxEjlqU7JR5WuOZd5Q+b5EdJBto11HM=;
	b=DzX8bC47wbA5MEoCl2FNLvxhuTBdRP0FKtqmoDsNab1UVrwMOS5/w3bVrPlaMJTRrjXqJy
	jWEr89tMGCNNl/DA==
To: Lee Jones <lee.jones@linaro.org>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>
In-Reply-To: <87a6ekleye.ffs@tglx>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <Ygu6UewoPbYC9yPa@google.com> <Ygu9xtrMxxq36FRH@linutronix.de>
 <YgvD1HpN2oyalDmj@google.com> <YgvH4ROUQVgusBdA@linutronix.de>
 <YgvJ1fCUYmaV0Mbx@google.com> <87a6ekleye.ffs@tglx>
Date: Mon, 21 Feb 2022 12:33:02 +0100
Message-ID: <875yp8laj5.ffs@tglx>
MIME-Version: 1.0
Message-ID-Hash: O65DO7UI6HO2HCFW5FOAQVIJPPJCXD7U
X-Message-ID-Hash: O65DO7UI6HO2HCFW5FOAQVIJPPJCXD7U
X-MailFrom: tglx@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O65DO7UI6HO2HCFW5FOAQVIJPPJCXD7U/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Lee & al!

On Mon, Feb 21 2022 at 10:57, Thomas Gleixner wrote:
> On Tue, Feb 15 2022 at 15:42, Lee Jones wrote:
>> What is your preference Thomas?
>
> I suggest doing it the following way:
>
>  1) I apply 1/7 on top of -rc5 and tag it

That's what I did now. The tag to pull from is:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq-api-2022-02-21

>  2) Driver maintainers who want to merge via their trees pull that tag
>     apply the relevant driver changes
>
>  3) I collect the leftovers and merge them via irq/core

So everyone who wants to merge the relevant driver changes, please pull
and let me know which driver patch(es) you merged. I'll pick up the
leftovers after -rc6.

Thanks,

        tglx
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
