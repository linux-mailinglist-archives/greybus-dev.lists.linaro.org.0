Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 700CB4B0A37
	for <lists+greybus-dev@lfdr.de>; Thu, 10 Feb 2022 11:04:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DD9E3EE9E
	for <lists+greybus-dev@lfdr.de>; Thu, 10 Feb 2022 10:04:01 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id DC2983EE8A
	for <greybus-dev@lists.linaro.org>; Thu, 10 Feb 2022 10:03:58 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nI6Im-00011D-CV; Thu, 10 Feb 2022 11:03:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nI6Ii-00FgSL-CN; Thu, 10 Feb 2022 11:03:43 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nI6Ig-00EMKr-Tm; Thu, 10 Feb 2022 11:03:42 +0100
Date: Thu, 10 Feb 2022 11:03:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <20220210100342.q2t4ykgyymjzr3fj@pengutronix.de>
References: <1644483902-9200-1-git-send-email-chensong_2000@189.cn>
MIME-Version: 1.0
In-Reply-To: <1644483902-9200-1-git-send-email-chensong_2000@189.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: 5UUYPZTG2YN4WBXW2HS2TKRVPLNGHTMT
X-Message-ID-Hash: 5UUYPZTG2YN4WBXW2HS2TKRVPLNGHTMT
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5UUYPZTG2YN4WBXW2HS2TKRVPLNGHTMT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0700389518066121721=="


--===============0700389518066121721==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2eicqlj24ajfowz"
Content-Disposition: inline


--c2eicqlj24ajfowz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 10, 2022 at 05:05:02PM +0800, Song Chen wrote:
> Introduce apply in pwm_ops to replace legacy operations,
> like enable, disable, config and set_polarity.
>=20
> Signed-off-by: Song Chen <chensong_2000@189.cn>
> ---
>  drivers/staging/greybus/pwm.c | 46 +++++++++++++++--------------------
>  1 file changed, 19 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
> index 891a6a672378..e1889cf979b2 100644
> --- a/drivers/staging/greybus/pwm.c
> +++ b/drivers/staging/greybus/pwm.c
> @@ -204,43 +204,35 @@ static void gb_pwm_free(struct pwm_chip *chip, stru=
ct pwm_device *pwm)
>  	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
>  }
> =20
> -static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> -			 int duty_ns, int period_ns)
> -{
> -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> -
> -	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns);
> -};
> -
> -static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_device =
*pwm,
> -			       enum pwm_polarity polarity)
> +static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			const struct pwm_state *state)
>  {
> +	int ret;
>  	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> =20
> -	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
> -};
> -
> -static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> -{
> -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> +	/* set period and duty cycle*/
> +	ret =3D gb_pwm_config_operation(pwmc, pwm->hwpwm, state->duty_cycle, st=
ate->period);

gb_pwm_config_operation's 3rd parameter is an u32, so you're loosing
bits here as state->duty_cycle is a u64. Ditto for period.

Also it would be nice if you go from

	.duty_cycle =3D A, .period =3D B, .enabled =3D 1

to

	.duty_cycle =3D C, .period =3D D, .enabled =3D 0

that C/D wasn't visible on the output pin. So please disable earlier
(but keep enable at the end).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--c2eicqlj24ajfowz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIE4vsACgkQwfwUeK3K
7AkEpgf+NdtDJKYavGime3N4rxugOTI4u9kbDL4z7GiAYjXWb3aqvB8ZsjirVc7i
o5Iyf7fCb0IP/4Vc2N6ndkRlBlr8FGcsgC7MlRq3T89Z5eJvpbAlWzIxFovJclmE
9TwGI0GHXH8It4I4p2hB0mtSwwyfuwB6vj+v8kEv+13niJA3MuIFaWWW5SayW0Ep
HF4ovCusOjE7Q3L7r8ebGNUoLz3Ku0u8EPoqc5/gnqUz9lmGrwpPB/rGJerJyLuq
RCDmQSB2+/ChdzV9Lb8adWrDv81fnxi7Va9wTwqFPXR/cAXkko9gGow/RioUL3g0
df5QN/eWXnu0TUW5XBEv2l3NvffGAw==
=MnRK
-----END PGP SIGNATURE-----

--c2eicqlj24ajfowz--

--===============0700389518066121721==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0700389518066121721==--
