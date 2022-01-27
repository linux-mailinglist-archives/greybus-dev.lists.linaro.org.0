Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA6A49E851
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 18:03:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E8F5D401DF
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 17:03:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 41D883EBD6
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 17:03:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 70659CE22DD;
	Thu, 27 Jan 2022 17:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBA39C340E4;
	Thu, 27 Jan 2022 17:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643303013;
	bh=94at8KQ2mwsXO6lk24alNapdJfEz9l+tLpUbw2MGJvE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wmf8Qp2UPnOHrkmSywJK8a/3xwloHfqdLJaQGPzTEyXHv1ngZEGOfUey0llaGmUtJ
	 9bRxfCFiIfdU+SSAmIA/XMy6r1dtROtxkgGUUOb22VZSFd/DWpPzz5YgFLHhSRxYAf
	 SDy2sm7w6olVU7bBXg8q/RTximr2sx7SGgW0HD8rTWlL3B5nGjp7HuoEcZ1EP5jJZ0
	 CpinGI4Yg6vIgl/XXcyRP8O7VKL8KPQBAMrUTXwdcKW5U5BXcVA4G4AoiWAA5qw9sQ
	 gfTDs41o4tX2M2glfUB8hlmgtgt4ScJq8Vx0JbT04x+QbE4qPoIeo83WpH3a8cPlX8
	 rhB18IUNLt0hg==
Date: Thu, 27 Jan 2022 18:03:29 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YfLQYa5aKJKs7ZUe@shikoro>
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
	Woojung Huh <woojung.huh@microchip.com>
References: <20220127113303.3012207-1-bigeasy@linutronix.de>
 <20220127113303.3012207-2-bigeasy@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220127113303.3012207-2-bigeasy@linutronix.de>
Message-ID-Hash: 6GQHGGB3FYIAPYNFFES35Y3XGQRHJABP
X-Message-ID-Hash: 6GQHGGB3FYIAPYNFFES35Y3XGQRHJABP
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6GQHGGB3FYIAPYNFFES35Y3XGQRHJABP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0638232508626195647=="


--===============0638232508626195647==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="isj9qhmX5nh2QcHe"
Content-Disposition: inline


--isj9qhmX5nh2QcHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Sebastian,

> +/**
> + * generic_handle_irq_safe - Invoke the handler for a particular irq

This is the same desc as for generic_handle_irq(). I suggest to add
something like "from any context" to have some distinction.

> + * This function must be called either from an IRQ context with irq regs
> + * initialized or with care from any context.

I think "with care" is not obvious enough. Can you describe it a little?

Thanks for this work,

   Wolfram

--isj9qhmX5nh2QcHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHy0F0ACgkQFA3kzBSg
KbYGfg/8DbJCFJiQlAG3Yv27Ey+1jfWpgmNZZdoSSO8hcxHmT8ATT7qQPDNw1JXL
Q0dObGbaNCO1fyflMSd/VBwblWRgGeN6Y7oOgdC5EMTuwAeyvimXPi5rXdEw+xjN
+Hn0VMPv7QIlqyU8a4E3pew1u07eW9drEah3FB/hrWmouw2lAbE6/p4q5JEkhzUN
/WG8yZzNR8EBUPHQ2eX3Mt2rFViy26AhI+Z0dmJ0O+63CCd6B53RV7AloT/+aGWn
0XN/CqEKg9I7A22st4lC9nlhhmdviksGYmZiIzbsTLwH+eZBjnQv4eZ4XAHYQEUn
7Brexu5x9VpcSa668q7AhdbAzBbeo5K2hT0/i1H+HCSqfmIiY039H5mD+fF5m4xd
C7a4zBBDA5aj0U4Yf3a8pz3DGW7l1196nYET9nC8DN6t97xbaXVeGG2UzYybKv8X
Oq1rruBjdjf2exYIzHAWZ0OBDdn+OfzixKn9MgG/GNS2JJhoIq8s0nt2zbHLkR86
cTRblvFyxk4CZ7cRnglREQAWQTd8MElkFNwIlE4dBQ4FYFkpTdOG3URgZu/m7Gly
8D4B9fMVaoZ6WtzrZ8qZn4zJ5Qm7InR/3C9+TBxPsB2L3vXXOHSYaJYKlUS2OUOZ
5KNoLxPEoRXl0NSvTv5bsRER+Dvlezf4x/F5nQPkgdq5lNcdRgE=
=I3gu
-----END PGP SIGNATURE-----

--isj9qhmX5nh2QcHe--

--===============0638232508626195647==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0638232508626195647==--
