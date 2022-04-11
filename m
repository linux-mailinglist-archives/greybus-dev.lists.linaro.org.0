Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE084FB838
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 11:49:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2A1B3402DB
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 09:49:57 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id D20C23EE8D
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 09:49:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 638556115F;
	Mon, 11 Apr 2022 09:49:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF3B5C385A4;
	Mon, 11 Apr 2022 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649670593;
	bh=HxQyupQVbUT1wMb+7QkCEhG41GvtEjdzH8+zfey9Uhk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f86/hSXI5mP40YWFYD9fDqvcCPsrifXBqj/DiJfXrNEiWAMT+KJPxX+sriedSI+p5
	 nw5fjOabOax34kl/+jwFCdF2HDMLegPyj1lCuiVhYImcCBCBnL/SIvIe8FvdLDtNB1
	 NXp5LvG/Ltr0ZoWz81tNPLJMD+tBu5mu3oXF0En/y5l9SnZh5ygLTRMsFbynAhbeeL
	 Zh3cuVaDJuuY4h+NoEnawVQMt6TqFisI9ZRFN614GC4Zaev703x+Gxw/M6R3ZmHgFS
	 8ZBp1p/wGSZF5sEC0OEKrqOy0FbMb9MeUSLol+deD+9nNXjuwgodsBqZ0Fo2UBf7nE
	 xN0KPYugWC0gQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1ndqg7-0003ei-1Y; Mon, 11 Apr 2022 11:49:47 +0200
Date: Mon, 11 Apr 2022 11:49:47 +0200
From: Johan Hovold <johan@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YlP5u0+u7zlJSJxW@hovoldconsulting.com>
References: <20220411083118.200663-1-u.kleine-koenig@pengutronix.de>
 <YlPxIWfaFoQxW63Z@hovoldconsulting.com>
 <20220411094828.p3bjyioocuzhvqs7@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220411094828.p3bjyioocuzhvqs7@pengutronix.de>
Message-ID-Hash: EUN5LJN7EIWHQ4UNIEGRBZU6J5F32JCP
X-Message-ID-Hash: EUN5LJN7EIWHQ4UNIEGRBZU6J5F32JCP
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Drop assignment to struct pwm_chip::base
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EUN5LJN7EIWHQ4UNIEGRBZU6J5F32JCP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1721592715967449801=="


--===============1721592715967449801==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fj993QbPu9hDgNXl"
Content-Disposition: inline


--Fj993QbPu9hDgNXl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 11:48:28AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Apr 11, 2022 at 11:13:05AM +0200, Johan Hovold wrote:
> > On Mon, Apr 11, 2022 at 10:31:18AM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > Since commit f9a8ee8c8bcd ("pwm: Always allocate PWM chip base ID
> > > dynamically") the value held in base isn't used any more in the PWM
> > > framework. All PMWs get assigned a dynamic ID, so the assignment is
> > > redundant and can be dropped.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > > ---
> > >  drivers/staging/greybus/pwm.c | 1 -
> > >  1 file changed, 1 deletion(-)
> > >=20
> > > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/=
pwm.c
> > > index ad20ec24031e..3fda172239d2 100644
> > > --- a/drivers/staging/greybus/pwm.c
> > > +++ b/drivers/staging/greybus/pwm.c
> > > @@ -297,7 +297,6 @@ static int gb_pwm_probe(struct gbphy_device *gbph=
y_dev,
> > > =20
> > >  	pwm->dev =3D &gbphy_dev->dev;
> > >  	pwm->ops =3D &gb_pwm_ops;
> > > -	pwm->base =3D -1;			/* Allocate base dynamically */
> > >  	pwm->npwm =3D pwmc->pwm_max + 1;
> > > =20
> > >  	ret =3D pwmchip_add(pwm);
> > >=20
> > > base-commit: 3123109284176b1532874591f7c81f3837bbdc17
> >=20
> > I'd prefer if you added a "pwm: " module prefix to the summary (even if
> > the previous patch to this driver didn't have that).
> >=20
> > Looks good to me otherwise:
> >=20
> > Reviewed-by: Johan Hovold <johan@kernel.org>
>=20
> Am I supposed to resend with the changed subject? Who will pick this up?

Please do. Greg will pick it up. Thanks.

Johan

--Fj993QbPu9hDgNXl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQHbPq+cpGvN/peuzMLxc3C7H1lCAUCYlP5tgAKCRALxc3C7H1l
CFGaAP47zksuZIKY6wzZOLp845c4JAIbSwiqx5Im2+8q0UCOCwD8C7l57Ddqi864
PKeawbayXPwlyvGu2po4hzsrtD0A+A8=
=GQdn
-----END PGP SIGNATURE-----

--Fj993QbPu9hDgNXl--

--===============1721592715967449801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1721592715967449801==--
