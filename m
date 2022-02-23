Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 223A84C0C9B
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Feb 2022 07:36:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 066053EF09
	for <lists+greybus-dev@lfdr.de>; Wed, 23 Feb 2022 06:36:29 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 0964B3ECEE
	for <greybus-dev@lists.linaro.org>; Wed, 23 Feb 2022 06:36:25 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nMlG5-0006rq-22; Wed, 23 Feb 2022 07:36:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nMlG1-000lIt-F4; Wed, 23 Feb 2022 07:36:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nMlFz-004y2z-Mh; Wed, 23 Feb 2022 07:36:11 +0100
Date: Wed, 23 Feb 2022 07:36:08 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <20220223063608.gv2iaoek6rynjnbu@pengutronix.de>
References: <1644580947-8529-1-git-send-email-chensong_2000@189.cn>
MIME-Version: 1.0
In-Reply-To: <1644580947-8529-1-git-send-email-chensong_2000@189.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: VVCSP2VGQBOVB6CMTQXRQKEQHT4A66H5
X-Message-ID-Hash: VVCSP2VGQBOVB6CMTQXRQKEQHT4A66H5
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VVCSP2VGQBOVB6CMTQXRQKEQHT4A66H5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============1412497277002701010=="


--===============1412497277002701010==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dsrm2xhl5lm6tau4"
Content-Disposition: inline


--dsrm2xhl5lm6tau4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

orthogonal to the feedback you got for the protocol part, here some
thoughts to the PWM specific bits;

On Fri, Feb 11, 2022 at 08:02:27PM +0800, Song Chen wrote:
> Introduce apply in pwm_ops to replace legacy operations,
> like enable, disable, config and set_polarity.
>=20
> Signed-off-by: Song Chen <chensong_2000@189.cn>
>=20
> ---
> V2:
> 1, define duty_cycle and period as u64 in gb_pwm_config_operation.
> 2, define duty and period as u64 in gb_pwm_config_request.
> 3, disable before configuring duty and period if the eventual goal
>    is a disabled state.
> ---
>  drivers/staging/greybus/pwm.c             | 61 ++++++++++++-----------
>  include/linux/greybus/greybus_protocols.h |  4 +-
>  2 files changed, 34 insertions(+), 31 deletions(-)
>=20
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 891a6a672378..03c69db5b9be 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -89,7 +89,7 @@ static int gb_pwm_deactivate_operation(struct gb_pwm_ch=
ip *pwmc,
>  }
> =20
>  static int gb_pwm_config_operation(struct gb_pwm_chip *pwmc,
> -				   u8 which, u32 duty, u32 period)
> +				   u8 which, u64 duty, u64 period)
>  {
>  	struct gb_pwm_config_request request;
>  	struct gbphy_device *gbphy_dev;
> @@ -99,8 +99,8 @@ static int gb_pwm_config_operation(struct gb_pwm_chip *=
pwmc,
>  		return -EINVAL;
> =20
>  	request.which =3D which;
> -	request.duty =3D cpu_to_le32(duty);
> -	request.period =3D cpu_to_le32(period);
> +	request.duty =3D duty;
> +	request.period =3D period;

If you don't change the wire protocol, you want something like:

	if (period > U32_MAX)
		period =3D U32_MAX;

	if (duty > period)
		duty =3D period;

To further improve the PWM driver it would be great if you added a
paragraph about the details of its behaviour; in the format the other
drivers do that (see e.g. drivers/pwm/pwm-sifive.c). It should describe
the following properties:

 - Is a period completed when period/duty changes?
 - Is a period completed when the hardware is disabled?
 - How does the output behave on disable?

In this specific case I think there is also some rounding behaviour in
the backend?! If so, describing this would be good, too.

>  	gbphy_dev =3D to_gbphy_dev(pwmc->chip.dev);
>  	ret =3D gbphy_runtime_get_sync(gbphy_dev);
> @@ -204,43 +204,46 @@ static void gb_pwm_free(struct pwm_chip *chip, stru=
ct pwm_device *pwm)
>  	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
>  }
> =20
> -static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> -			 int duty_ns, int period_ns)
> +static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			const struct pwm_state *state)
>  {
> +	int err;
> +	bool enabled =3D pwm->state.enabled;
>  	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> =20
> -	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns);
> -};
> -
> -static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device =
*pwm,
> -			       enum pwm_polarity polarity)
> -{
> -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> -
> -	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
> -};
> +	/* set polarity */
> +	if (state->polarity !=3D pwm->state.polarity) {
> +		if (enabled) {
> +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> +			enabled =3D false;
> +		}
> +		err =3D gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polarit=
y);
> +		if (err)
> +			return err;
> +	}

This is copied from the legacy pwm handling in the pwm core. This is
good in principle. But if your hardware can change polarity without
stopping operation, that would be the thing to do. (The pwm core cannot
assume this, so it doesn't.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dsrm2xhl5lm6tau4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIV1dUACgkQwfwUeK3K
7AmSMgf0CVv4DE5aj42+pZS4w4G05NH6RjZczg1p6ylppMiQE86Jn/0wiksckSU2
kOqzbT4MxRlWzsqKKX22/1xf3IG6gCVjbvZOSdq7YBn/XtF10jp8xSJlQd7qajsT
vLybnzV9Ea23rLoTO/KKcQHpR5u02qvlbHz9M6SffUmBWWmgSFjNhRwyfl3XIKoz
c7Vl8qvoRpSL81H2e+QK32plCIkStyt7gQgk4jluZ3JS6Hu5FIHoP+h/zDaNT0IO
z9Ufd3lI0OmX11svFiBd3PhYG3PjgZ19UP2cXGqKpGPuJJyst8NHLCCVPqAEl0ew
TP6kkgDorY46gJfeC80tNzjERoDw
=dWMw
-----END PGP SIGNATURE-----

--dsrm2xhl5lm6tau4--

--===============1412497277002701010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============1412497277002701010==--
