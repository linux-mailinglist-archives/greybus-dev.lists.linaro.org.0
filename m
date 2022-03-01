Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE054C980C
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Mar 2022 22:57:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 63DDB3EECB
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Mar 2022 21:57:18 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 849563EE74
	for <greybus-dev@lists.linaro.org>; Tue,  1 Mar 2022 21:57:15 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nPAUT-000784-AN; Tue, 01 Mar 2022 22:57:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nPAUO-0025cA-NW; Tue, 01 Mar 2022 22:57:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nPAUN-006MiB-Cs; Tue, 01 Mar 2022 22:56:59 +0100
Date: Tue, 1 Mar 2022 22:56:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <20220301215659.kj2wwrijkdmkmces@pengutronix.de>
References: <1645780561-18481-1-git-send-email-chensong_2000@189.cn>
MIME-Version: 1.0
In-Reply-To: <1645780561-18481-1-git-send-email-chensong_2000@189.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: YPUL3UZBRMWGIU6XAE52HK3AFBKMMPMK
X-Message-ID-Hash: YPUL3UZBRMWGIU6XAE52HK3AFBKMMPMK
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YPUL3UZBRMWGIU6XAE52HK3AFBKMMPMK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0755800915632081313=="


--===============0755800915632081313==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r726a4xrd7fvdsa6"
Content-Disposition: inline


--r726a4xrd7fvdsa6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Feb 25, 2022 at 05:16:01PM +0800, Song Chen wrote:
> Introduce apply in pwm_ops to replace legacy operations,
> like enable, disable, config and set_polarity.
>=20
> Signed-off-by: Song Chen <chensong_2000@189.cn>
>=20
> ---
> v2:
> 1, define duty_cycle and period as u64 in gb_pwm_config_operation.
> 2, define duty and period as u64 in gb_pwm_config_request.
> 3, disable before configuring duty and period if the eventual goal
>    is a disabled state.
>=20
> v3:
> Regarding duty_cycle and period, I read more discussion in this thread,
> min, warn or -EINVAL, seems no perfect way acceptable for everyone.
> How about we limit their value to INT_MAX and throw a warning at the
> same time when they are wrong?

My position is that the driver should implement the biggest possible
period not bigger than the requested period. That's how all new drivers
behave since I care for reviewing PWM stuff. So capping to U32_MAX as is
(nearly) done below is good in my book.

> ---
>  drivers/staging/greybus/pwm.c | 66 +++++++++++++++++++++--------------
>  1 file changed, 40 insertions(+), 26 deletions(-)
>=20
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 891a6a672378..3ec5bc54d616 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -204,43 +204,57 @@ static void gb_pwm_free(struct pwm_chip *chip, stru=
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
> +	u64 period =3D state->period;
> +	u64 duty_cycle =3D state->duty_cycle;
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

So polarity can only be switched with the PWM off?

> +			enabled =3D false;
> +		}
> +		err =3D gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polarit=
y);
> +		if (err)
> +			return err;
> +	}
> =20
> -static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> -{
> -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> +	if (!state->enabled) {
> +		if (enabled)
> +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> +		return 0;
> +	}
> =20
> -	return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
> -};
> +	/* set period and duty cycle*/
> +	if (period > INT_MAX) {

Given that in gb_pwm_config_operation the parameters are u32, I suggest
to use U32_MAX here instead of INT_MAX.

> +		period =3D INT_MAX;
> +		dev_warn(chip->dev, "period is %llu ns, out of range\n", state->period=
);

Please drop this warning. That's a bad one because it can be triggered
=66rom userspace.

> +	}
> +	if (duty_cycle > INT_MAX) {
> +		duty_cycle =3D INT_MAX;
> +		dev_warn(chip->dev,
> +			 "duty cycle is %llu ns, out of range\n", state->duty_cycle);
> +	}
> +	err =3D gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_cycle, period);

Is it clear how gb_pwm_config_operation rounds? If yes, please document
this. I also wonder if you could implement (in a separate change)
=2Eget_state().

> +	if (err)
> +		return err;
> =20
> -static void gb_pwm_disable(struct pwm_chip *chip, struct pwm_device *pwm)
> -{
> -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> +	/* enable/disable */
> +	if (!enabled)
> +		return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
> =20
> -	gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> -};
> +	return 0;
> +}
> =20
>  static const struct pwm_ops gb_pwm_ops =3D {
>  	.request =3D gb_pwm_request,
>  	.free =3D gb_pwm_free,
> -	.config =3D gb_pwm_config,
> -	.set_polarity =3D gb_pwm_set_polarity,
> -	.enable =3D gb_pwm_enable,
> -	.disable =3D gb_pwm_disable,
> +	.apply =3D gb_pwm_apply,
>  	.owner =3D THIS_MODULE,

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--r726a4xrd7fvdsa6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIelqYACgkQwfwUeK3K
7Alwdgf8D5edHsZr1Jb77yd52CbV7Xj8gYkfrZr+ooB/WCOoZuP+kcZstYUzHHsR
C2j7TfDQf5nr+GPyklBi58xyR9UcKazNRi4nxDWApeUauJLnuVfxog0jLv6XuBau
QhAWJcd7tCgMbXb8/Ca8VcKHWD5xpUqveGomRHfN2tqw/FbCJeHK35JGnOyazXmR
f1AwLvDaumNGCM4KgizkSmji6v3HWihpm5DbW89feVCSARufNky3BWBmH3xapBH8
FmZlabb4V+YgP5Je+4+VIX0R1ch425hktZiBFLuo7jMkF/NNtaTahQSad+gITwDH
TtV0UMkiwvIGGReYUY3qL5be4/BRDw==
=mFjh
-----END PGP SIGNATURE-----

--r726a4xrd7fvdsa6--

--===============0755800915632081313==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0755800915632081313==--
