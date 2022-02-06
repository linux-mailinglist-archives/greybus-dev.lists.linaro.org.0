Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AAFCA4AB1F3
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Feb 2022 21:11:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5E65F3EEC7
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Feb 2022 20:11:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id DFA8E3ECF2
	for <greybus-dev@lists.linaro.org>; Sun,  6 Feb 2022 20:11:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id EF281B80DE4;
	Sun,  6 Feb 2022 20:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10199C340E9;
	Sun,  6 Feb 2022 20:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1644178272;
	bh=jljw/NXDE01h/Pq3byW2tpFU83OPdtk2kq8rd42Jk1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nhvpRiAHeyPnhoPW5AJYz7sXsz9qtFaixezo/f6lKIoTinmiRK/0KfhqtTjkJMiZA
	 C1eoikWCvjFFaQoyqdBqnt61Sxj9tcqo0hoj4c33suJ2iCZVvxedjh6hh9d879NQUy
	 D91VqLaA4kYzRnFvGL+lqISffF5jEMJeJz/KehV/F5DPWnP4iRK5HBxqJZ8N5Qpqov
	 u/68l4FbFrs1dFjSIxxVA0bjW0xDBeDhMAwDNgmwQeGdSpN03gGah6Mw9+50+gKID4
	 mgmnJ0HiCVk6qrLd1K0L185npwEZ8epAYyk8NiTmVh/xeQiJvC8hROwGWHFXO+yTZR
	 g2rbP6e0rw9Lw==
Date: Sun, 6 Feb 2022 21:11:06 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YgArWgyvy9xF3V5Q@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20220131123404.175438-1-bigeasy@linutronix.de>
 <20220131123404.175438-2-bigeasy@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220131123404.175438-2-bigeasy@linutronix.de>
Message-ID-Hash: J6EGXSDWDM6MBIIMBA4C4MXR23LUKNYJ
X-Message-ID-Hash: J6EGXSDWDM6MBIIMBA4C4MXR23LUKNYJ
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>, Oleksandr Natalenko <oleksandr@natalenko.name>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/J6EGXSDWDM6MBIIMBA4C4MXR23LUKNYJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7549688306354537072=="


--===============7549688306354537072==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="agAcRzQ1V4vmM4bn"
Content-Disposition: inline


--agAcRzQ1V4vmM4bn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> + * This function can be called any context (IRQ or process context). It will

"from any context"

> + * report an error if not invoked from IRQ context and the irq has been marked
> + * to enforce IRQ-contex only.

"IRQ-context"

Other than that, the paragraph is really helpful now IMO. So with the
above fixed, you may add:

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--agAcRzQ1V4vmM4bn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIAK1UACgkQFA3kzBSg
KbbBQA//be5yTyPptkcw8xl8xEjjuosJmrSOMBREgzarO4DbrPX/pC/W0Nak54bs
UnjGfnRDFQXa2krCIIbZmmwtCLKftVVbqB5eFFJ/Y6uM/pa2hKgli0sNfHJ2p++i
jT01vDRqxEjyA795yxeF8nD3/xkmIM49A5hbPq7yW6YTGF8VJ6Qhe+5vWpMoNqFH
6KoSHGUFpwCgVBEadLhdV8a0OpSrjPTs+MOZhWL+IIpb3Ay+tztQpUL1f2ncnlG/
Sq5E7KPuKem03swyvKmFcn1fl+R3eLy7ueoHbXeyfKDi8eqLImP1ZYwfq0K+LwKK
O2LHRkXcrPnHM/lSt9dQDbJNY9J6wzav77BzF9zS8e23KhPlTlidSDHWwgtkq2vj
yr825hAIMoecoj8t4pgpSDYyyw9rnSeGwmB7AFWZctzLoaLtdGBZrIZKJv4ZM5bH
p79anJodYwJEVRRvj3t1ZA+vH8n4TThUG6RFWV18a9rLUi1N/YvwsZO7wTf9Msw6
lnL8iMPAcHpx0byMztoiHybZsmoV4eKGteuu1dwt0CK7Vz1MMKOgQKkLtq1NzWUe
5DEWew6kXfumd6/yxKJV4i0Zj21mzkjWAtFYk/JXenTGN42RRCErqCFCbZ2qOHq/
26QRgRBrQ+i9B3h91gLA2r7T7+UTcboUEhA8zhvvf8omx/gYw0M=
=mPjB
-----END PGP SIGNATURE-----

--agAcRzQ1V4vmM4bn--

--===============7549688306354537072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7549688306354537072==--
