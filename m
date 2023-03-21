Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DD6E6C3735
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 17:43:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32FC343E59
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 16:43:12 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 68EF73EC46
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:43:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pef4e-0003Cx-Tg; Tue, 21 Mar 2023 17:43:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pef4e-005jSE-25; Tue, 21 Mar 2023 17:43:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pef4d-006oRj-BW; Tue, 21 Mar 2023 17:42:59 +0100
Date: Tue, 21 Mar 2023 17:42:59 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Message-ID: <20230321164259.nt6varbc6v6bavrz@pengutronix.de>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de>
 <7c883bac-382c-b429-ab21-4675dce02474@gmail.com>
MIME-Version: 1.0
In-Reply-To: <7c883bac-382c-b429-ab21-4675dce02474@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 68EF73EC46
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,lists.linaro.org,vger.kernel.org,inria.fr];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de]
Message-ID-Hash: G4K3AZN4IDWP375GWRRLJJF4R5TO5T7P
X-Message-ID-Hash: G4K3AZN4IDWP375GWRRLJJF4R5TO5T7P
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/G4K3AZN4IDWP375GWRRLJJF4R5TO5T7P/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4182972106981763248=="


--===============4182972106981763248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ycczzpqu7aadwq6j"
Content-Disposition: inline


--ycczzpqu7aadwq6j
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 06:25:29PM +0200, Menna Mahmoud wrote:
>=20
> On =D9=A2=D9=A1=E2=80=8F/=D9=A3=E2=80=8F/=D9=A2=D9=A0=D9=A2=D9=A3 =D9=A1=
=D9=A7:=D9=A4=D9=A7, Uwe Kleine-K=C3=B6nig wrote:
> > Hello,
> >=20
> > just some nitpicks:
> >=20
> > On Tue, Mar 21, 2023 at 01:04:33AM +0200, Menna Mahmoud wrote:
> > > Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> > > static inline function.
> > >=20
> > > it is not great to have macro that use `container_of` macro,
> > s/it/It/; s/macro/macros/; s/use/use the/;
> Okay, I will fix it.
> >=20
> > > because from looking at the definition one cannot tell what type
> > > it applies to.
> > > [...]
> > > -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> > > +static inline struct gbphy_device *to_gbphy_dev(const struct device =
*d)
> > drivers/staging/greybus/gbphy.c always passes a variable named
> > "dev" to this macro. So I'd call the parameter "dev", too, instead of
> > "d". This is also a more typical name for variables of that type.
> >=20
> > > +{
> > > +	return container_of(d, struct gbphy_device, dev);
> > > +}
> > > [...]
> > >   };
> > > -#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driv=
er)
> > > +static inline struct gbphy_driver *to_gbphy_driver(struct device_dri=
ver *d)
> > > +{
> > > +	return container_of(d, struct gbphy_driver, driver);
> > > +}
> > With a similar reasoning (and also to not have "d"s that are either
> > device or device_driver) I'd recommend "drv" here.
>=20
>=20
> please check this with Julia, because she said they should different.

At least use "_dev" instead of "d" which seems to be a common idiom,
too:

	$ git grep -P 'container_of\(_(?<ident>[A-Za-z_0-9-]*)\s*,[^,]*,\s*\g{iden=
t}\s*\)' | wc -l
	570

("drv" should be fine, because the third argument is "driver" there.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ycczzpqu7aadwq6j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQZ3pIACgkQj4D7WH0S
/k5pUQf/XJUDV6EvqcrGxi++Gu/Dk83CxxiHdJnuv3linIJyLi93tZYagEMj773b
zxh1hIg8sW9OY0D/5HIkMjjhziTA432DNiFWW85/B+eOduuRE2fQHZ8kHOMiXH+R
P2k2cPlJLW9pV3n6odYFqmn0BGoQvgOAgDUfftIgZ6Wfc6bEX7cl7rOAXaPxrz+s
b0hgLYCkQJ5x19/n6JmO6eQq3IvCZyye8y2NgU28gHQ7tCDy3M4cy4o6rM+45GOP
QnptwPU1+WnnmOfztzLTGFZwVnQs/t0rKMn7yC6cu0WdbPtILq8ug+ZE5Rx4cRv5
VmFAwNr1gpOVs8Yix3vuHqXFhvTk6Q==
=iXWj
-----END PGP SIGNATURE-----

--ycczzpqu7aadwq6j--

--===============4182972106981763248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4182972106981763248==--
