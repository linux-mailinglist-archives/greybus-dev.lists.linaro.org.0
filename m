Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B87392C80
	for <lists+greybus-dev@lfdr.de>; Thu, 27 May 2021 13:19:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3D13160B3A
	for <lists+greybus-dev@lfdr.de>; Thu, 27 May 2021 11:19:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A8C8560B3B; Thu, 27 May 2021 11:19:33 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C54C60ADB;
	Thu, 27 May 2021 11:19:31 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DF99160A07
 for <greybus-dev@lists.linaro.org>; Thu, 27 May 2021 11:19:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DD96F60A9E; Thu, 27 May 2021 11:19:30 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by lists.linaro.org (Postfix) with ESMTPS id C7FD160A07
 for <greybus-dev@lists.linaro.org>; Thu, 27 May 2021 11:19:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 9E1E3EA0;
 Thu, 27 May 2021 07:19:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 27 May 2021 07:19:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm3; bh=pxbfaKHZCWhDsU417t7PbYheLV0
 CKla7WFFalm7HeDo=; b=ApMqyhI6EVnRc++Z05YAXBN7FW3NUxuNtbJJ2qyq+2T
 4GdhVD4k3p+RHfDiNcuSh/lXOd0MXL1cvqwsWp6HX2/O9aRzuaTPra2/rYut7h/M
 Z96yTiPn3OtYxA2hlKGD2+tTbhS9EgXhVSuiaokwiyGoBsYvcqepqZqxvGTol8ee
 hGkjt1o5vkROka8VFCTqRzva+CPDEQBECkUjLPrZj0h5cKG+0we86xYU7GjDf6YP
 dvwWuM+38KA7Xn7gylupTfN+xNWxWBYKO30VsUj429JDSQrmWUxuzYob2FPsj5jx
 1xpzXI6ZRzvgg2OIk8tWlN/naH4pOHXBkXWxUSeXiww==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=pxbfaK
 HZCWhDsU417t7PbYheLV0CKla7WFFalm7HeDo=; b=NuYhZ584AGa0KqO7IxOaX5
 MOeadV0ooXqjnkyx+TnWSqE8hc6ChnzJbTq9Ws4cseUHeWpqXi38wv+FLIi24lj4
 vRitZXrvy8kEkDhmxNZ+mfKIqXITR4S7Mz5swiThHWPZRL2886hvWD17yDHUz5Ps
 qIAngkwXW7szJmw5dDRVcqyXLCW8mrytUTzpveXEw55LywTuNErGBtwVnGdcXCf+
 KMK0f2zfFQaaLSssGwO7TDzdoDUhh2WArVBiU0cuGAzBO+O3Tpyw+PFbv6G7VP01
 VcXGdRvOUkof01wPvB7MXfqFaK5F3LoT8Orwz67jYmOV2t1XRcFBAzSA8ElG69BA
 ==
X-ME-Sender: <xms:PoCvYHB7j-syPjgEXUy_7rHrjuyliBvtWTn_pgE-aDASdB7qQK_WZw>
 <xme:PoCvYNhKNGgf7Df110Tv0n-_fc8xCElHuIf9r7HIv6P9zZpkSBtY2pOvzAylPriD9
 xdWlQnlWF3N1g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdekhedggedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcu
 mffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefgteefff
 etvdffledtgeduudetffdutdduveefvedtueegueeggfeiteehfeetfeenucffohhmrghi
 nhepghhithhhuhgsrdgtohhmnecukfhppeekfedrkeeirdejgedrieegnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepghhrvghgsehkrhhorghh
 rdgtohhm
X-ME-Proxy: <xmx:PoCvYClGAqAGdiL2NTE-R1wrpQkAd41pidgPLu8GQo-dRoHl1AEIHg>
 <xmx:PoCvYJwhsKyF-03cEFosq_FTCJacZOyqhsjqp62cfY5ewaFo-9y8Og>
 <xmx:PoCvYMQ7REUh7TAYKwQL3gndCP_pNJcVoe3Nxhgap8OZo4hF5DxL0w>
 <xmx:P4CvYHJEd4LdFzxUQ7lp0D5-c8OakJSe7w-wMlCNpqTWx_BbQOerGQ>
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 by mail.messagingengine.com (Postfix) with ESMTPA;
 Thu, 27 May 2021 07:19:26 -0400 (EDT)
Date: Thu, 27 May 2021 13:19:24 +0200
From: Greg KH <greg@kroah.com>
To: Anuj Deshpande <anuj@makerville.io>
Message-ID: <YK+APDfOunPnL1Cj@kroah.com>
References: <CA+5xZ=RwozcYBrQaCgkTuah8e=UDnw9cmFMkkEYmCK8jC+QbOA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+5xZ=RwozcYBrQaCgkTuah8e=UDnw9cmFMkkEYmCK8jC+QbOA@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] Support for ADC
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: greybus-dev@lists.linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

On Thu, May 27, 2021 at 01:32:57PM +0530, Anuj Deshpande wrote:
> Hi
> 
> I was looking at the Zephyr for Greybus
> <https://github.com/cfriedt/greybus-for-zephyr/> work, and realized that
> the actual spec for greybus doesn't actually have support for ADC. My
> usecase is to use the ADCs on an attached microcontroller as if they are
> native ADCs on a Linux machine.
> 
> I understand this is more complicated than it looks - because unlike a
> GPIO, or I2C, there's no such thing as a native ADC for the Linux side of
> things. Have I understood that correctly?
> 
> I stumbled into the IIO subsystem for such requirements where there's some
> analog sensor that would need to be read - but that would not work through
> a microcontroller like my use case.
> 
> If one were to look at adding such support, what would they need? Is this
> something that's been discussed before? Would love to understand this a bit
> more, and potentially contribute.

This was talked about unofficially when we were creating the protocol
and we considered making an IIO driver, or maybe a IIO-HID driver (for
the types that HID supports), but it never got very far.

You could always just use the serial class and talk to the device like a
"fake serial device" if that works, but then you loose all of the IIO
user/kernel api functionality.

So, sorry, there isn't a solution for this yet, but if you wanted to
work on creating such a class device, I know I would not object :)

thanks,

greg k-h
_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
