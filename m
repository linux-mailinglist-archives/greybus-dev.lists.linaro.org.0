Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 72CA54A596C
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Feb 2022 10:45:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9834E3EE18
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Feb 2022 09:45:38 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id DFB6F3EE04
	for <greybus-dev@lists.linaro.org>; Tue,  1 Feb 2022 09:45:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DE8B2B8018A;
	Tue,  1 Feb 2022 09:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B061BC340EB;
	Tue,  1 Feb 2022 09:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643708733;
	bh=MdErCthUfXwIMsMrpwhF/rPVygWP2deZtH4s9Fv9QMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C44sCAaJEvPyJHh+AcUv43SuqCvTXQZGEIwVN3ocROKifl7mguDUBDImrPQ7wQxFv
	 B/aOg6wDv0t3KthsBqjzjScooiRKE9ubLupZJBnzmKvPcIRsGY8LinhOn43mFpF4IP
	 KwQDW7ds5jViZCIF9W34wYdY3yCrThx9nmnZ6vgpit6jJDI/2A+dyX42lUWuRfnQiZ
	 5KoxK/7LLx0LXJFg143vsjRmpiXNYOgl1gwgt02kk2O1y2YYRlyrngtzMoJGP7U/7X
	 reWjsk6E2ODJeP6lkqFJkDE2UfjJeaU+IUEikY2sRutpWEFRXeW7dwqs8b9FxzaWTJ
	 NbuaCm0qqSh9A==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nEpiv-0000sL-1O; Tue, 01 Feb 2022 10:45:17 +0100
Date: Tue, 1 Feb 2022 10:45:17 +0100
From: Johan Hovold <johan@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YfkBLesNdsxJMbxm@hovoldconsulting.com>
References: <20220131123404.175438-1-bigeasy@linutronix.de>
 <20220131123404.175438-8-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220131123404.175438-8-bigeasy@linutronix.de>
Message-ID-Hash: UUCAIMOYJXHTUMURH2DFK4EDUAA6WTUO
X-Message-ID-Hash: UUCAIMOYJXHTUMURH2DFK4EDUAA6WTUO
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 7/7] staging: greybus: gpio: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UUCAIMOYJXHTUMURH2DFK4EDUAA6WTUO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On Mon, Jan 31, 2022 at 01:34:04PM +0100, Sebastian Andrzej Siewior wrote:
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq_safe() which can be invoked with enabled and disabled
> interrupts.
> 
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Acked-by: Johan Hovold <johan@kernel.org>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
