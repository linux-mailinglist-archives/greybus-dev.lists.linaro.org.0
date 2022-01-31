Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A9C4A41E9
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 12:10:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4A283ED9F
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 11:10:10 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 656303ED9F
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 11:10:05 +0000 (UTC)
Date: Mon, 31 Jan 2022 12:10:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643627404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VU/JLz6tZsfDSK1NGHlZJZDBKesuKZckLqSjhO2EaU4=;
	b=MlRIySoABztrXXhRXSWmvo2UV3/cD+W5Hip49G7RuhEGWfXMve9+967C7hina7NbgL0gsA
	aUsyVHVYqGGLzEAbCDnSBVARPcsyU62kssRd0FSyDb89J9lITtt7CgXLZ0DSZlUdLN5T/w
	qHNlm/789QXdfRSQ37F2M6KewwXuqn/+0LdECa+8B6SFUBy6IZuEV8ZmutujHGlddT6mSy
	LNUV9GJiEmtcb0UHeocT/ZyR7a+euq531BP7TAhXOFfSViefgJbswq1Ben8f0CIQKhfO4J
	DX/KxI7Aj22VxGxM8DU0CabHTBLnbrQsayoEQ4Y/4pFVta2+UVm6Q+TlXVYbSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643627404;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=VU/JLz6tZsfDSK1NGHlZJZDBKesuKZckLqSjhO2EaU4=;
	b=EsmtkMsJP6d5SP/mA+91F7XriKaPzaz7coj7QQMGILO4ncBzqs3VZj2EY51lcXyjhTegar
	UlifgoPYSZH9lYAA==
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
Message-ID: <YffDiv+NNWYFXJkX@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-4-bigeasy@linutronix.de>
 <YfLThZsBwAucs2vp@shikoro>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfLThZsBwAucs2vp@shikoro>
Message-ID-Hash: VQPMZRTM33CFQCHNQGBO3C7FL3CFOQ2L
X-Message-ID-Hash: VQPMZRTM33CFQCHNQGBO3C7FL3CFOQ2L
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/7] i2c: cht-wc: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VQPMZRTM33CFQCHNQGBO3C7FL3CFOQ2L/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-01-27 18:16:53 [+0100], Wolfram Sang wrote:
> On Thu, Jan 27, 2022 at 12:32:59PM +0100, Sebastian Andrzej Siewior wrote:
> > Instead of manually disabling interrupts before invoking use
> > generic_handle_irq() which can be invoked with enabled and disabled
> 
> generic_handle_irq_safe()

Yes, thank you.

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
