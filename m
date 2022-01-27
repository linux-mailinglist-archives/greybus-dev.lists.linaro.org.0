Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AF849E8AD
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 18:17:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 625EF401DE
	for <lists+greybus-dev@lfdr.de>; Thu, 27 Jan 2022 17:17:04 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id D932D3ECF2
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 17:16:58 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 014D1B8136A;
	Thu, 27 Jan 2022 17:16:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC363C340E4;
	Thu, 27 Jan 2022 17:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1643303816;
	bh=3sFJxFok/Vm/LJYDlprm0kpc3VVV7j3cv3+yv3y74tc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lRgNkVCXGYtS9/yVBxqt81L7KoXwjFl8Kxpt0mAadOFijduZpkvG6B2OrlC83ca0N
	 K1mwC3rv7XJXEGNIBZCJsiULlfXxRu6QvNpbXnc9NmrxwARRL359qr8NZcqzBaqvDD
	 g1KXUkFPNHCYX69BLh/w++PetyJY2fX/WIMv+KiFry6DxFpLLILybA118xe/IagYVe
	 iZtXr4Oj/k4rPZDTy9woATJtIz6/pwaFz55ZYPmBPABRgPNrOEekCZQCvEAt7wGvRk
	 ub/Y7RqWQu+052uUtGB+V0fw8Q7L7KnQcnJSpsnzT7IXdUf8Jn6iOXnngq8inlAz4v
	 Mko0As2NX5EYA==
Date: Thu, 27 Jan 2022 18:16:53 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YfLThZsBwAucs2vp@shikoro>
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
 <20220127113303.3012207-4-bigeasy@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220127113303.3012207-4-bigeasy@linutronix.de>
Message-ID-Hash: 2UM2ALD6BZK6YYXOYRXUSCWAXD3EPJ37
X-Message-ID-Hash: 2UM2ALD6BZK6YYXOYRXUSCWAXD3EPJ37
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 3/7] i2c: cht-wc: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2UM2ALD6BZK6YYXOYRXUSCWAXD3EPJ37/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2544965984480616862=="


--===============2544965984480616862==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ohdBGZcj3HIE2DHF"
Content-Disposition: inline


--ohdBGZcj3HIE2DHF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 27, 2022 at 12:32:59PM +0100, Sebastian Andrzej Siewior wrote:
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq() which can be invoked with enabled and disabled

generic_handle_irq_safe()

> interrupts.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Besides that:

Acked-by: Wolfram Sang <wsa@kernel.org>


--ohdBGZcj3HIE2DHF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmHy04QACgkQFA3kzBSg
KbbuBBAApe83Cdzr4jHFw/VgdFhkEaqQ9GyIOEbk07yeaTzSKFdMhAJ2mOYFSmix
BUdKMer4wLUbUw6p8Ogbzh8T5sTB5l36hfLUOFwoQ8dkHCciS+kpdE7oFh8CgudM
6a2YN8hRxy9pQpxiJhQr9VyLERzoaTsaBMs9wo/H/gbsl4BkmxwLhBGMJrt9MJC+
x/yIg6r5AmKf4ItMr320DU60tQac0el75+yYq57M6nNIA+PUYV0ZaAS1r1tGHJxM
nBFDUDrWEvfXHV/HNCl4Gw7FTyhFpSxe+H8RsNZHH76qgykMc+KeDnN8Qb4gfMFg
U9YRMu7Q6Azv8wpSgtDN+7bINtLAdkj7WywkyWbnLKTi/2nXFuCLXjff0zGbfP1K
V47ntKY5eoXyEw26FjkXkBTepxGJWy+gY/2c688nCaFAWVYcKxxs1+mGxqhnf2+M
/O6utGhd2xInMPSTRNEG0WnPOWMNcjUcBUV2kDprYuMJbSGaHklBB8SuZv7M9uOu
rdHSlJny2chnQBTZOj/ECP10oJXKjCCaSax8YHBuVd12F01wCmiTfx9s7F4SqIXU
2X0rqY3PhCOPgfptwL1RwkEPxl5MEygPZju7i+1X9dscmZLQeQ4nBdPIH9bUs9s+
Onbqlw/siGuuqSQ0qpvx5xxU0bchZ/Ra0dexsTEkSsgI509vNJQ=
=xbBq
-----END PGP SIGNATURE-----

--ohdBGZcj3HIE2DHF--

--===============2544965984480616862==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2544965984480616862==--
