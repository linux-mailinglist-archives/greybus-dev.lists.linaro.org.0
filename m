Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C30D14B1F27
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 08:16:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F21B33EEA0
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 07:16:17 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id E2DA63EBD6
	for <greybus-dev@lists.linaro.org>; Fri, 11 Feb 2022 07:16:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nIQA4-00080h-L9; Fri, 11 Feb 2022 08:16:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nIQA2-00FsF7-41; Fri, 11 Feb 2022 08:16:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nIQA0-00FVX2-Hx; Fri, 11 Feb 2022 08:16:04 +0100
Date: Fri, 11 Feb 2022 08:16:01 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <20220211071601.4rpfbkit6c6dre2o@pengutronix.de>
References: <1644483902-9200-1-git-send-email-chensong_2000@189.cn>
 <20220210100342.q2t4ykgyymjzr3fj@pengutronix.de>
 <6acc4f74-31a1-75b2-f7e8-610aac7b0ec8@189.cn>
MIME-Version: 1.0
In-Reply-To: <6acc4f74-31a1-75b2-f7e8-610aac7b0ec8@189.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: Q2VGY7ZWEOP5K6CXB7COSZHELR73KOOT
X-Message-ID-Hash: Q2VGY7ZWEOP5K6CXB7COSZHELR73KOOT
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q2VGY7ZWEOP5K6CXB7COSZHELR73KOOT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1268702507159890100=="


--===============1268702507159890100==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4uvzh3zwoqsfhh25"
Content-Disposition: inline


--4uvzh3zwoqsfhh25
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello ,

On Fri, Feb 11, 2022 at 11:06:33AM +0800, Song Chen wrote:
> =E5=9C=A8 2022/2/10 18:03, Uwe Kleine-K=C3=B6nig =E5=86=99=E9=81=93:
> > On Thu, Feb 10, 2022 at 05:05:02PM +0800, Song Chen wrote:
> > > Introduce apply in pwm_ops to replace legacy operations,
> > > like enable, disable, config and set_polarity.
> > >=20
> > > Signed-off-by: Song Chen <chensong_2000@189.cn>
> > > ---
> > >   drivers/staging/greybus/pwm.c | 46 +++++++++++++++-----------------=
---
> > >   1 file changed, 19 insertions(+), 27 deletions(-)
> > >=20
> > > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/=
pwm.c
> > > index 891a6a672378..e1889cf979b2 100644
> > > --- a/drivers/staging/greybus/pwm.c
> > > +++ b/drivers/staging/greybus/pwm.c
> > > @@ -204,43 +204,35 @@ static void gb_pwm_free(struct pwm_chip *chip, =
struct pwm_device *pwm)
> > >   	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
> > >   }
> > > -static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *p=
wm,
> > > -			 int duty_ns, int period_ns)
> > > -{
> > > -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> > > -
> > > -	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns=
);
> > > -};
> > > -
> > > -static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_dev=
ice *pwm,
> > > -			       enum pwm_polarity polarity)
> > > +static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> > > +			const struct pwm_state *state)
> > >   {
> > > +	int ret;
> > >   	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> > > -	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
> > > -};
> > > -
> > > -static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *p=
wm)
> > > -{
> > > -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> > > +	/* set period and duty cycle*/
> > > +	ret =3D gb_pwm_config_operation(pwmc, pwm->hwpwm, state->duty_cycle=
, state->period);
> >=20
> > gb_pwm_config_operation's 3rd parameter is an u32, so you're loosing
> > bits here as state->duty_cycle is a u64. Ditto for period.
>=20
> originally, pwm_apply_state --> pwm_apply_legacy --> gb_pwm_config -->
> gb_pwm_config_operation is also loosing bits, does it mean greybus can li=
ve
> with that?

This is true, I tried to address that, but Thierry had concerns.
(https://lore.kernel.org/all/20210312212119.1342666-1-u.kleine-koenig@pengu=
tronix.de/
was the patch I suggested.)

> Or redefine gb_pwm_config_request, switch duty and period to __le64?

Don't use __le64, this is only for representing (little endian) register
values. u64 would be the right one.

> > Also it would be nice if you go from
> >=20
> > 	.duty_cycle =3D A, .period =3D B, .enabled =3D 1
> >=20
> > to
> >=20
> > 	.duty_cycle =3D C, .period =3D D, .enabled =3D 0
> >=20
> > that C/D wasn't visible on the output pin. So please disable earlier
> > (but keep enable at the end).
>=20
> sorry, i don't quite understand this part,

To reexplain: If your hardware is configured for

	.duty_cycle =3D A, .period =3D B, .enabled =3D 1

and pwm_apply is called with

	.duty_cycle =3D C, .period =3D D, .enabled =3D 0

you configured the registers for .duty_cycle and .period first and only
then disable the PWM. This usually results in glitches because the
hardware shortly runs with

	.duty_cycle =3D C, .period =3D D, .enabled =3D 1

=2E So the idea is, to disable before configuring duty and period if the
eventual goal is a disabled state.

> but is below code looking good to
> you?
>=20
> static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> 			const struct pwm_state *state)
> {
> 	int err;
> 	bool enabled =3D pwm->state.enabled;
> 	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
>=20
> 	/* set polarity */
> 	if (state->polarity !=3D pwm->state.polarity) {
> 		if (enabled) {
> 			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> 			enabled =3D false;
> 		}
> 		err =3D gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polarity=
);
> 		if (err)
> 			return err;
> 	}
>=20
> 	if (!state->enabled) {
> 		if (enabled)
> 			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> 		return 0;
> 	}
>=20
> 	/* set period and duty cycle*/
> 	err =3D gb_pwm_config_operation(pwmc, pwm->hwpwm, state->duty_cycle, sta=
te->period);
> 	if (err)
> 		return err;
>=20
> 	/* enable/disable */
> 	if (!enabled)
> 		return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
>=20
> 	return 0;
> }

This looks good.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4uvzh3zwoqsfhh25
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIGDS4ACgkQwfwUeK3K
7Am4Swf/fRC0YxhvtfvXu7F5wTiw0DISARXIcUo+WNZjzbRrdqiuyMU0kdINclS6
DGgUPllv8eP6rdbHPnWw7VAxLroCiLbTgcc4VadCHTQ8q7iO5g4UAAt7GF9e+/b7
77fxEoYnUioiTchIRtFIX3mPK4v68L/StS302zWzBAp9SzaWae1gQ2Ud81yziVw0
Upcds7jfVzJZo2VRsls+1TbHoS+dZwSOjSMMLDi/rT86/GFKffmJnO6jGCB5Q+VM
M1f2diC81YMoMVu3gWQwWo+ywWrowzzZfLf1GN8OAx1zcUroi6u1Xo8NKxNfe7lN
oRL+5rwSAg0EQTe3mzBujOaMH0wScQ==
=TkTq
-----END PGP SIGNATURE-----

--4uvzh3zwoqsfhh25--

--===============1268702507159890100==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1268702507159890100==--
