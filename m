Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C2883DF5B
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 17:59:35 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 64E7B43CC4
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 16:59:34 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id E2DCD3F00C
	for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 16:59:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPY4-0002Qf-3X; Fri, 26 Jan 2024 17:59:24 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPY3-002YBo-Go; Fri, 26 Jan 2024 17:59:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPY3-008nkw-1P;
	Fri, 26 Jan 2024 17:59:23 +0100
Date: Fri, 26 Jan 2024 17:59:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Elder <elder@ieee.org>
Message-ID: <yqq3vzx2pni75kx3rhamngrbudcikngcrhvdcvrl45kfz5ypni@mjttju35xhhx>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <fb29256a7f2dcda5ae92119997ac717a6280911f.1706182805.git.u.kleine-koenig@pengutronix.de>
 <4980ba8e-081f-47c3-aa63-a972a266577a@ieee.org>
MIME-Version: 1.0
In-Reply-To: <4980ba8e-081f-47c3-aa63-a972a266577a@ieee.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E2DCD3F00C
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	NEURAL_HAM(-0.00)[-0.973];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[3];
	ARC_NA(0.00)[]
Message-ID-Hash: QCVZSNTYT5IZSL5KIHMCVD4SNDB6FHDK
X-Message-ID-Hash: QCVZSNTYT5IZSL5KIHMCVD4SNDB6FHDK
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 106/111] staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QCVZSNTYT5IZSL5KIHMCVD4SNDB6FHDK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============5877646291522416468=="


--===============5877646291522416468==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4p5vvjyq24h4p6cg"
Content-Disposition: inline


--4p5vvjyq24h4p6cg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Fri, Jan 26, 2024 at 09:08:15AM -0600, Alex Elder wrote:
> On 1/25/24 6:10 AM, Uwe Kleine-K=F6nig wrote:
> > +	chip =3D devm_pwmchip_alloc(&gbphy_dev->dev, response.count, sizeof(*=
pwmc));
> > +	if (IS_ERR(chip)) {
> > +		ret =3D PTR_ERR(chip);
> > +		goto exit_connection_destroy;
> >   	}
> > +	pwmc =3D pwm_chip_to_gb_pwm_chip(chip);
> >   	pwmc->connection =3D connection;
> > +
> >   	gb_connection_set_data(connection, pwmc);
> > -	gb_gbphy_set_data(gbphy_dev, pwmc);
> > +	gb_gbphy_set_data(gbphy_dev, chip);
>=20
> I'm pretty sure driver data should still be the Greybus
> structure, otherwise you're really changing the way this
> works (most likely in a way that's different from other
> Greybus drivers.

The problem is that you cannot easily get the chip from pwmc unless you
add a pointer to struct gb_pwm_chip.

Regarding your other feedback: You're right, this patch is more
intrusive than it should be. I wonder what went wrong. I'll do some
research and rework accordingly. Probably I squashed some things
together that should be separate patches.

thanks for your feedback
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4p5vvjyq24h4p6cg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWz5OoACgkQj4D7WH0S
/k4KUQf6A/sgEifOotxBqJrMFHbcBLDZMvOpGfnsNRoeIX4hfmvwVlk7CJwLen3a
hPGCRnc6Gd9YQ3mkZD09npNW/l96CyNrmWV0i0Rk1+InyOgkv2dGjy0hBmOujHoG
FJQ8Pz2ZSSf214erEmsId9DMz+PlePGMSklbbGRifPLHQXRdXsa7261fkMj4iBhI
TOuucEJK4giG3YooM9Dk6z6Z2g6ihIdBtiJ4B3j9bXJn16fFSQzbsX/iKpJbIcOH
7biM2E/2Hz/01qoI9kQ5BUYJXGqoxhbh7zcxmUQJddhnfLvbFVjHsEpyl/apLGfE
KOeinhjrzCD3Z1rSvLZ9iOkS07qEgw==
=2yZJ
-----END PGP SIGNATURE-----

--4p5vvjyq24h4p6cg--

--===============5877646291522416468==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============5877646291522416468==--
