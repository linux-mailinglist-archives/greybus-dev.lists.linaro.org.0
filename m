Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE7D4C13FF
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Feb 2022 14:21:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AF37D3EEAF
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Feb 2022 13:21:49 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id AB4183E824
	for <greybus-dev@lists.linaro.org>; Wed, 23 Feb 2022 13:21:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 570EE6154C;
	Wed, 23 Feb 2022 13:21:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46E9CC340F1;
	Wed, 23 Feb 2022 13:21:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1645622505;
	bh=J891fPbxn9Gpp05VyPJjZBwUp+b4P9oUiL8KTTGPsAY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=t7jQsuKZ/QzakEguwoidh6RwtgJW+7gV4yBiNTHmCzuLqQNcfgMAOpR3bHYUfwpud
	 iby/hY+HNQ6KYZU2OgXhKa6VUfIzugD3k+ZzovH6vPzAvXOw5XxjXAJFBCrhxLqEJz
	 R1xBfJCOcVKMcPjl0JGGZwSRZjuSae8sgvZHCX7i0W7kw5LeRVS4GhPCCoyZUvKBVj
	 +SJlH73idykERSltJQ56jIAHVuhJSv2xQVUobY784Z7/Nqx5r8ZXhbZWN6E/w42oL7
	 uMLOsi51sI6Apc35Htuz/YTU3VWyYt28UpLFNlyDjYi00eo1PHfjUp/qyi/Npgvb/J
	 NgeYJ5/fQN1JQ==
Date: Wed, 23 Feb 2022 14:21:42 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Message-ID: <YhY05uyl5dSVZH2W@ninjato>
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
References: <20220211181500.1856198-1-bigeasy@linutronix.de>
 <20220211181500.1856198-4-bigeasy@linutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220211181500.1856198-4-bigeasy@linutronix.de>
Message-ID-Hash: E7WCNADNMSZLUI5ZYQFFODR5LMIB2RLO
X-Message-ID-Hash: E7WCNADNMSZLUI5ZYQFFODR5LMIB2RLO
X-MailFrom: wsa@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 3/7] i2c: cht-wc: Use generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E7WCNADNMSZLUI5ZYQFFODR5LMIB2RLO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0620335007515396507=="


--===============0620335007515396507==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VtRlwyjbGA4QWudU"
Content-Disposition: inline


--VtRlwyjbGA4QWudU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 11, 2022 at 07:14:56PM +0100, Sebastian Andrzej Siewior wrote:
> Instead of manually disabling interrupts before invoking use
> generic_handle_irq_safe() which can be invoked with enabled and disabled
> interrupts.
>=20
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Acked-by: Wolfram Sang <wsa@kernel.org>

Applied to for-next, thanks!


--VtRlwyjbGA4QWudU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmIWNOYACgkQFA3kzBSg
KbY3wA//TjamDoM1RYB5FcX0sief36XT8hx1zX6EhhcmIdo2C581BZatcwCpXiRv
1FVIsWELccefkU4PfbjshEYUUcFw4c20vfK4XONM2KFJNC1+QQjo3jvX+WwLpZTG
r2Ir/RIwjUaLplFnqwA47P0pUXr4HBSoyNj51C8p1sih43BNFiiFC9H3/f9WeqyI
XK4qrW+VLToDZJ1HNDH3xdETdk6b5WoVOWBI4Pj91GipVx5kyyIfmk5Da18MeYeR
4cxyolwSQqSf6Uwsbt1g6ImmeoIThAWlw4MLGxwYo7vc7S6HMYgzhb0wYUNT0fbL
Kp98y7x1iXiQ+8m9uKiYHmmTZh3Tu2C/ahzzCCbFo7GHsoHHZoHPKFBqZee7imdc
xuUFyZ1u0fbx9wcjnDDGskeyVSz4RYx4CH9a5eS/fAxIEYYws70X+2OJX4YdmgI1
wy4WLxrTzYJWFe2XjVIS8R7aR6xrdiUukOVgOpqQRMkraCkxes9BEkcRCsmCaUY1
jxUoFqxts8j8VlBUgJ90liczQuB4FF+TNAwfFMhpB4G4aDgFllv8tVBa+b+UPuAn
c0JqbleZ0LohYl3mr570y2iB/uS6c+V+XBITmC92J1QYrfbJ9ee8KJwA6c2muViM
3ax/oU6oaEc/YpV+t9XReEvEfh/DhjFWuLytG6vUI8K4vS6KXSw=
=p68w
-----END PGP SIGNATURE-----

--VtRlwyjbGA4QWudU--

--===============0620335007515396507==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0620335007515396507==--
