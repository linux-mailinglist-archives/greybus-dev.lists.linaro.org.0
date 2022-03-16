Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 50DB54DB627
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Mar 2022 17:29:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 60B6D401F2
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Mar 2022 16:29:26 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 86BFF401CE
	for <greybus-dev@lists.linaro.org>; Wed, 16 Mar 2022 16:29:23 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1nUWWK-000210-Aj; Wed, 16 Mar 2022 17:29:08 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nUWWH-0015JU-Ji; Wed, 16 Mar 2022 17:29:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1nUWWF-009aRe-Jt; Wed, 16 Mar 2022 17:29:03 +0100
Date: Wed, 16 Mar 2022 17:29:03 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Elder <elder@ieee.org>
Message-ID: <20220316162903.kwkfefyznvopvr5g@pengutronix.de>
References: <1647397285-30061-1-git-send-email-chensong_2000@189.cn>
 <49f18070-0215-8475-907b-487d1e01c15c@ieee.org>
MIME-Version: 1.0
In-Reply-To: <49f18070-0215-8475-907b-487d1e01c15c@ieee.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: M7ZD32EIBAXBJBYDI3NWMCCIR7ZARA5S
X-Message-ID-Hash: M7ZD32EIBAXBJBYDI3NWMCCIR7ZARA5S
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Song Chen <chensong_2000@189.cn>, johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M7ZD32EIBAXBJBYDI3NWMCCIR7ZARA5S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============8771444767407311505=="


--===============8771444767407311505==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cxcpsasgt2uw47h7"
Content-Disposition: inline


--cxcpsasgt2uw47h7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 16, 2022 at 10:14:30AM -0500, Alex Elder wrote:
> On 3/15/22 9:21 PM, Song Chen wrote:
> > diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pw=
m.c
> > index 891a6a672378..3add3032678b 100644
> > --- a/drivers/staging/greybus/pwm.c
> > +++ b/drivers/staging/greybus/pwm.c
> > @@ -204,43 +204,54 @@ static void gb_pwm_free(struct pwm_chip *chip, st=
ruct pwm_device *pwm)
> >   	gb_pwm_deactivate_operation(pwmc, pwm->hwpwm);
> >   }
> > -static int gb_pwm_config(struct pwm_chip *chip, struct pwm_device *pwm,
> > -			 int duty_ns, int period_ns)
> > +static int gb_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> > +			const struct pwm_state *state)
> >   {
> > +	int err;
> > +	bool enabled =3D pwm->state.enabled;
> > +	u64 period =3D state->period;
> > +	u64 duty_cycle =3D state->duty_cycle;
>=20
> The use of local variables here is inconsistent, and that
> can be confusing.  Specifically, the "enabled" variable
> represents the *current* state, while the "period" and
> "duty_cycle" variables represent the *desired* state.  To
> avoid confusion, if you're going to use local variables
> like that, they should all represent *either* the current
> state *or* the new state.  Please update your patch to
> do one or the other.

IMHO that it overly picky. I'm ok with the usage as is.

> >   	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> > -	return gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_ns, period_ns);
> > -};
> > +	/* set polarity */
> > +	if (state->polarity !=3D pwm->state.polarity) {
> > +		if (enabled) {
> > +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> > +			enabled =3D false;
> > +		}
> > +		err =3D gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, state->polar=
ity);
> > +		if (err)
> > +			return err;
> > +	}
> > -static int gb_pwm_set_polarity(struct pwm_chip *chip, struct pwm_devic=
e *pwm,
> > -			       enum pwm_polarity polarity)
> > -{
> > -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> > +	if (!state->enabled) {
> > +		if (enabled)
> > +			gb_pwm_disable_operation(pwmc, pwm->hwpwm);
> > +		return 0;
>=20
> If you are disabling the device, you return without updating the
> period and duty cycle.  But you *do* set polarity.  Is that
> required by the PWM API?  (I don't actually know.)  Or can the
> polarity setting be simply ignored as well if the new state is
> disabled?

All is well here. A disabled PWM is expected to emit the inactive level.
So polarity matters, duty and period don't.

> Also, if the polarity changed, the device will have already been
> disabled above, so there's no need to do so again (and perhaps
> it might be a bad thing to do twice?).

That won't happen, because if the device was disabled for the polarity
change, enabled =3D false. In fact that is the purpose of the local
variable.

> > +	}
> > -	return gb_pwm_set_polarity_operation(pwmc, pwm->hwpwm, polarity);
> > -};
>=20
> Since you're clamping the values to 32 bits here, your comment
> should explain why (because Greybus uses 32-bit values here,
> while the API supports 64 bit values).  That would be a much
> more useful piece of information than "set period and duty cycle".
>=20
> > +	/* set period and duty cycle*/
>=20
> Include a space before "*/" in your comments.

ack

> > +	if (period > U32_MAX)
> > +		period =3D U32_MAX;
> > -static int gb_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
> > -{
> > -	struct gb_pwm_chip *pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> > +	if (duty_cycle > period)
> > +		duty_cycle =3D period;
> > -	return gb_pwm_enable_operation(pwmc, pwm->hwpwm);
> > -};
> > +	err =3D gb_pwm_config_operation(pwmc, pwm->hwpwm, duty_cycle, period);
> > +	if (err)
> > +		return err;
>=20
> What if the new state set usage_power to true?  It would
> be ignored here.  Is it OK to silently ignore it?  Even
> if it is, a comment about that would be good to see, so
> we know it's intentional.

ignoring usage_power is OK. All but a single driver do it that way.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--cxcpsasgt2uw47h7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIyEEwACgkQwfwUeK3K
7AmO3Qf/SsTZlRSlCJmtso96gQJnzXFI1Ofx73IRpFAE0VVMWbQAAd0Gq+mB+lY0
FPaB79Bx114E3tibvrAnOODi6ATJBGbqjkdj0q5oO0ZcK2b2ia5JZofdnHaCIWMJ
KLuofdGhcVyc3eIXSkSxNpew5HvMTyCaeKiyfLb9rqnv9ZPMcsLQ3LCWS1jffAv1
yPyWQW/C0K8OhKOOWglhkKdQNJ6BHPpBInYzX+OoaBKOUN8BRXUmh8VJqyRvp/Gv
ToyE/PJBuzPd13ND7rF6BwmSW4hZ3zgFvINeWCf7DtoZxTQRZ/xbn5td7U46RPv2
c/DFTosHasBcdtgV7+BQ1PrXegtLgw==
=98PH
-----END PGP SIGNATURE-----

--cxcpsasgt2uw47h7--

--===============8771444767407311505==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============8771444767407311505==--
