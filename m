Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 81DE14C517D
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Feb 2022 23:26:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B11533ED09
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Feb 2022 22:26:51 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 6781A3ED09
	for <greybus-dev@lists.linaro.org>; Fri, 25 Feb 2022 22:26:49 +0000 (UTC)
Date: Fri, 25 Feb 2022 23:26:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1645828008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM69ukIcc+sQinY2YKTwfd9oNIY8JhhXQnOxkl9m0Q0=;
	b=apYRTZGkUwhJQy3iK89Ex8zi2TeQOYZaPphwXG6+B63KrUIE4UwUFOLSXKQGEF3dy50lO8
	hUX4KM7ty/jq+p1Zz1dkGlTg3PRIqnwmWC8ZVGtBZSmQy89fNfbGEnHbWs62aR6XyklSa9
	G78mAT+qCNqrJcCY/khaaSDj2Ua4dJwAFRvziyVAx/C+P8Wyk6GD64iRkYMGrb5v6UphCv
	+JBOZbxm6a8/H/Y5LJoCJQrlE2xadnlPEE2ciaduYFIR2yosk348vdCA48vs3p5me5PExC
	Piwl9BDIwBizU8+d3jvHWCxDE1YvQVdp9Ugde7bjNCYeCs11W4MvvIRh/MnRYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1645828008;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TM69ukIcc+sQinY2YKTwfd9oNIY8JhhXQnOxkl9m0Q0=;
	b=mHdIRy9t2j/YWSKES/TqV4YAvKAkxwqSgmtH0o0I0fco2UbTTdoVmaqGrvK14FfDWL8XUd
	SD+7/A6T+35pVYAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Wolfram Sang <wsa@kernel.org>
Message-ID: <YhlXplZCkflfkg1W@linutronix.de>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <20220211181500.1856198-3-bigeasy@linutronix.de>
 <YhY03EojmT3eaIcR@ninjato>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YhY03EojmT3eaIcR@ninjato>
Message-ID-Hash: AMWCFGTLFFXYPEWJJX37AXMYHPNWIWHE
X-Message-ID-Hash: AMWCFGTLFFXYPEWJJX37AXMYHPNWIWHE
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>, Michael Below <below@judiz.de>, Salvatore Bonaccorso <carnil@debian.org>, Oleksandr Natalenko <oleksandr@natalenko.name>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AMWCFGTLFFXYPEWJJX37AXMYHPNWIWHE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 2022-02-23 14:21:32 [+0100], Wolfram Sang wrote:
> Is this 5.17 material? Or is 5.18 fine, too?

5.18 is fine. I intend to push into the RT-stable trees and this can't
be backported without 1/7 and it does not affect !RT so I wouldn't
bother.

Sebastian
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
