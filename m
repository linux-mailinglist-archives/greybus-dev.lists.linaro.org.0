Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7366D4C8E8D
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Mar 2022 16:06:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BBA73EEAA
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Mar 2022 15:06:21 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id E71EA3EEAA
	for <greybus-dev@lists.linaro.org>; Tue,  1 Mar 2022 15:06:18 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E0F6CB81B0F;
	Tue,  1 Mar 2022 15:06:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE474C340EE;
	Tue,  1 Mar 2022 15:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1646147176;
	bh=3rErMr8HPx66Jp00WJd9yEBIjWGz3wiDvsGrMjqCVAg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hdimVuBrc+VRHT8NLNPkQIB6GizNq9maujOWeKdrDVMnAQYQRm2LmLfzNyF3wvOIJ
	 LBPsO/PCcc0nroUoIJq2MjkInjaELLtHkyQoLGJe71NL8il9/nIPKnGZXr1aqh+Ewl
	 x0SXQafhrW9XgowgZPXdWiYFTSdagsEyygI5xMqlQZmR0/HpQFgjRac148KyG9Ga3k
	 LCSsMK9o31q24sTrg7XobBbuSAz6jK5XDrjkIPg2tO6ICqV2e+kEF1RZm9Oib5f+Mb
	 jXdbH8GJA204lhfUZtooGpel8rzHa7B6xg3a76EPzfr+sB/H2rDARzNB+6M0se5UrN
	 HNubxkMRCB/cw==
Date: Tue, 1 Mar 2022 16:06:13 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <Yh42ZZFFcXnXqS5K@ninjato>
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
	Michael Below <below@judiz.de>,
	Salvatore Bonaccorso <carnil@debian.org>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <20220211181500.1856198-3-bigeasy@linutronix.de>
 <YhY03EojmT3eaIcR@ninjato>
 <YhlXplZCkflfkg1W@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <YhlXplZCkflfkg1W@linutronix.de>
Message-ID-Hash: XB77CWZQIBZ6S32MTWPSMPVDW7ZVSEIF
X-Message-ID-Hash: XB77CWZQIBZ6S32MTWPSMPVDW7ZVSEIF
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>, Michael Below <below@judiz.de>, Salvatore Bonaccorso <carnil@debian.org>, Oleksandr Natalenko <oleksandr@natalenko.name>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XB77CWZQIBZ6S32MTWPSMPVDW7ZVSEIF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============8048565025474506021=="


--===============8048565025474506021==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vly9pc/cg0xZd513"
Content-Disposition: inline


--vly9pc/cg0xZd513
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 25, 2022 at 11:26:46PM +0100, Sebastian Andrzej Siewior wrote:
> On 2022-02-23 14:21:32 [+0100], Wolfram Sang wrote:
> > Is this 5.17 material? Or is 5.18 fine, too?
>=20
> 5.18 is fine. I intend to push into the RT-stable trees and this can't
> be backported without 1/7 and it does not affect !RT so I wouldn't
> bother.

Ok, applied to for-next then. Thanks for the heads up!


--vly9pc/cg0xZd513
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIeNmQACgkQFA3kzBSg
KbbfYxAAgtOpVKmeFifH+JWyqT1mW6M6PKCY098U/utaJDTEnIPOnkUsMe4spnDs
TctqYaihXKSZf9UxlJhVPZ/ZIRHYSA+KF14IDEeLzkL49d4ojSGarl893u0l7bx2
6aQQeO3oJT4dGN7ohZsg2AYD6ym1baCtAH+zimu6hPacRHgucRh+0IvjYxgioXg3
rhYauOkmcDPxqPvS33shdRagDKbjZ3V+HqswU2FGmLEMCTOxNhvDw4q7mUsAsIqO
Ct370v13+nH6HQlXaOMzzIGROyz3GO3Xo/ZOYJdRsp/UCRHIMHabGMvyFBX5p4Hj
gAyWkNCqvLJdzYNmqtosc6r0iQFuZSUItW/wM+kHpwwwdOsup5n7QY7uBp78G6Ea
eRZJmC80xn3HEZ75FJTkT6aHucCZApCT3uBViUVwOA34fQYuujCcHvhuCEkGeJz5
kNdx6JdigSxX40Re7h6/ac1sz2EXm4CxmcFzQm10AFjJjjdzU2+zIqi/tk/6J+yS
oR2DR95lglxohOmzidOAL/qTmBNdeh+eQL0Ta9JJqSnVnRWCzu5iTzt/PXo8Vs5N
4cg8cpOAOFtYwxQrF1JaHgCStljwQbBp+IHBaJbOtzBYaLA3HoETlXLv/7opaFk4
+rw1pWvsOmQkGbFW/n+eVO0aYMnOMFGx8AOuKco5SQ73Otp5GSM=
=3Lg4
-----END PGP SIGNATURE-----

--vly9pc/cg0xZd513--

--===============8048565025474506021==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============8048565025474506021==--
