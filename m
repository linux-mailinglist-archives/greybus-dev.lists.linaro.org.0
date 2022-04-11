Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9262D4FB81F
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 11:48:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C224E402C6
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 09:48:42 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id E284A3EC04
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 09:48:40 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndqew-0007Wn-LH; Mon, 11 Apr 2022 11:48:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndqew-002MOW-Rx; Mon, 11 Apr 2022 11:48:33 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndqeu-002ZP9-Dx; Mon, 11 Apr 2022 11:48:32 +0200
Date: Mon, 11 Apr 2022 11:48:28 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20220411094828.p3bjyioocuzhvqs7@pengutronix.de>
References: <20220411083118.200663-1-u.kleine-koenig@pengutronix.de>
 <YlPxIWfaFoQxW63Z@hovoldconsulting.com>
MIME-Version: 1.0
In-Reply-To: <YlPxIWfaFoQxW63Z@hovoldconsulting.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: MR7SX6AHSHJKGFM54FTTKUJGNCEI6S4S
X-Message-ID-Hash: MR7SX6AHSHJKGFM54FTTKUJGNCEI6S4S
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Drop assignment to struct pwm_chip::base
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MR7SX6AHSHJKGFM54FTTKUJGNCEI6S4S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7335052089142725319=="


--===============7335052089142725319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ghzdgkbdd4wniguk"
Content-Disposition: inline


--ghzdgkbdd4wniguk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 11, 2022 at 11:13:05AM +0200, Johan Hovold wrote:
> On Mon, Apr 11, 2022 at 10:31:18AM +0200, Uwe Kleine-K=F6nig wrote:
> > Since commit f9a8ee8c8bcd ("pwm: Always allocate PWM chip base ID
> > dynamically") the value held in base isn't used any more in the PWM
> > framework. All PMWs get assigned a dynamic ID, so the assignment is
> > redundant and can be dropped.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/staging/greybus/pwm.c | 1 -
> >  1 file changed, 1 deletion(-)
> >=20
> > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pw=
m.c
> > index ad20ec24031e..3fda172239d2 100644
> > --- a/drivers/staging/greybus/pwm.c
> > +++ b/drivers/staging/greybus/pwm.c
> > @@ -297,7 +297,6 @@ static int gb_pwm_probe(struct gbphy_device *gbphy_=
dev,
> > =20
> >  	pwm->dev =3D &gbphy_dev->dev;
> >  	pwm->ops =3D &gb_pwm_ops;
> > -	pwm->base =3D -1;			/* Allocate base dynamically */
> >  	pwm->npwm =3D pwmc->pwm_max + 1;
> > =20
> >  	ret =3D pwmchip_add(pwm);
> >=20
> > base-commit: 3123109284176b1532874591f7c81f3837bbdc17
>=20
> I'd prefer if you added a "pwm: " module prefix to the summary (even if
> the previous patch to this driver didn't have that).
>=20
> Looks good to me otherwise:
>=20
> Reviewed-by: Johan Hovold <johan@kernel.org>

Am I supposed to resend with the changed subject? Who will pick this up?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ghzdgkbdd4wniguk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmJT+WkACgkQwfwUeK3K
7AnKYwgAnW/zOynyHe8zLts2pqMiWAedcxs30iTv3pXkbNu2QwlSv9KYaFSeKxRs
csjh8i7+ZryfUBLCL+racxiEuS9a27s2GmvtfqDms87qExdk9z4bkeYE9f1xdEAk
ONnqLdn/ua5uZ/MPPhdOIf+JewiYTlIivB5JlFo9eaftBjK/7H36Doolp2vC33TS
FOIf44BCP9+D8+ztfhnAUk04zGl8PeOETxPrNNtN30qlE7k/b8fEabReamxvTFP+
V71PPzhHg1sAh2/rrUpelo3dgtGfWH2yHkg351yydjFCLdQFc3Tx8x3ChSegX7Es
Z7WGWO8nmQmNIddyW9TJaLc841hXvw==
=b02P
-----END PGP SIGNATURE-----

--ghzdgkbdd4wniguk--

--===============7335052089142725319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7335052089142725319==--
