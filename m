Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 807B04A41E6
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 12:07:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A07983EE23
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 11:07:57 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 481813ED9F
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 11:07:53 +0000 (UTC)
Date: Mon, 31 Jan 2022 12:07:50 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643627272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZ2f6mxJtMd++5Aml5rgNLLSnjcWCv443/ajj7HSqQo=;
	b=H7sx3pRzJHs2iSgUDPf/9+DKJAQHt0np+pCaCdI+Ffi232MTfpVtlOijisw4TtgPa3KVaT
	bNORJUrty8/GGtFI1qKf1WVuvW4Ci3Ly0dfhBMIYtmaQWjHck7DDl2soXrVFPn5VDlduyn
	oGD7LifyA365+7K8lYlyf/gateZqhErFd7NrEDXuN39w904LIrV7coW/7bBcWc7mkU8vHi
	JwHBiqMFl2mUvs5bLgAZY+LglkvJs+um0fXck7OxYIX8xGzAZt0cgFaWAYOBVSewL39uW2
	+dgVGYthpNPJLJUVA6VakYI3XwoZoHJP2Gcu52wyLvOn6mdZx9L9rh8cc8su5Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643627272;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wZ2f6mxJtMd++5Aml5rgNLLSnjcWCv443/ajj7HSqQo=;
	b=kzgTFt+D+034T01mnmcXciv1jHrUGkWJ38AFDFX50eklm0gwKWXdMojKgeBSU+4Rw+9DPy
	5ED8sSRdw15wHbBQ==
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
	Woojung Huh <woojung.huh@microchip.com>,
	Michael Below <below@judiz.de>,
	Salvatore Bonaccorso <carnil@debian.org>
Message-ID: <YffDBiITSRQQXnVh@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-3-bigeasy@linutronix.de>
 <YfLSNNDVtAFx1P9u@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfLSNNDVtAFx1P9u@shikoro>
Message-ID-Hash: LURKFLMQ54OEGR3EYTMWD5G45ZFQIEGH
X-Message-ID-Hash: LURKFLMQ54OEGR3EYTMWD5G45ZFQIEGH
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LURKFLMQ54OEGR3EYTMWD5G45ZFQIEGH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-01-27 18:11:16 [+0100], Wolfram Sang wrote:
> 
> I guess you want this to go together with patch 1, so:
> 
> Acked-by: Wolfram Sang <wsa@kernel.org>
> 
> I agree with adding the kernel bugzilla entry at least:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=202453
> 
> Probably the others which Oleksandr metioned, too.

No, they are not relevant because none of them can be reproduced on a
v5.12+ kernel or any of <v5.12 stable maintained trees.

They triggered in the past only with the `threadirqs' option on the
commandline and this has been fixed by commit
   81e2073c175b8 ("genirq: Disable interrupts for force threaded handlers")

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
