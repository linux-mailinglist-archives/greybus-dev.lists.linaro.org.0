Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B1C6C36E2
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 17:26:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 01FA03EC46
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 16:26:44 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 808333EBA6
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:26:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1peeoh-0001Tm-NK; Tue, 21 Mar 2023 17:26:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1peeog-005jOR-PC; Tue, 21 Mar 2023 17:26:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1peeof-006oMY-H4; Tue, 21 Mar 2023 17:26:29 +0100
Date: Tue, 21 Mar 2023 17:26:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Julia Lawall <julia.lawall@inria.fr>
Message-ID: <20230321162629.rjmivzhbdy4pcgii@pengutronix.de>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de>
 <82a4e5f1-a1f2-c70-3645-9464ccb17bab@inria.fr>
MIME-Version: 1.0
In-Reply-To: <82a4e5f1-a1f2-c70-3645-9464ccb17bab@inria.fr>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 808333EBA6
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_CC(0.00)[gmail.com,linuxfoundation.org,lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de]
Message-ID-Hash: DX7X2KXWU3M6YZFA35IM7PH7JSU6M7P7
X-Message-ID-Hash: DX7X2KXWU3M6YZFA35IM7PH7JSU6M7P7
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DX7X2KXWU3M6YZFA35IM7PH7JSU6M7P7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============5900633106307311445=="


--===============5900633106307311445==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d5lucct4g3gdijlv"
Content-Disposition: inline


--d5lucct4g3gdijlv
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 21, 2023 at 04:59:49PM +0100, Julia Lawall wrote:
>=20
>=20
> On Tue, 21 Mar 2023, Uwe Kleine-K=F6nig wrote:
>=20
> > Hello,
> >
> > just some nitpicks:
> >
> > On Tue, Mar 21, 2023 at 01:04:33AM +0200, Menna Mahmoud wrote:
> > > Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> > > static inline function.
> > >
> > > it is not great to have macro that use `container_of` macro,
> >
> > s/it/It/; s/macro/macros/; s/use/use the/;
> >
> > > because from looking at the definition one cannot tell what type
> > > it applies to.
> > > [...]
> > > -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> > > +static inline struct gbphy_device *to_gbphy_dev(const struct device =
*d)
> >
> > drivers/staging/greybus/gbphy.c always passes a variable named
> > "dev" to this macro. So I'd call the parameter "dev", too, instead of
> > "d". This is also a more typical name for variables of that type.
>=20
> I argued against that.  Because then there are two uses of dev
> in the argument of container_of, and they refer to completely different
> things.  It's true that by the way container_of works, it's fine, but it
> may be misleading.

Hmm, that seems to be subjective, but I have less problems with that
than with using "d" for a struct device (or a struct device_driver).
I'd even go so far as to consider it nice if they are identical.

Maybe that's because having the first and third argument identical is
quite common:

	$ git grep -P 'container_of\((?<ident>[A-Za-z_0-9-]*)\s*,[^,]*,\s*\g{ident=
}\s*\)' | wc -l
	5940

which is >44% of all the usages

	$ git grep -P 'container_of\((?<ident>[A-Za-z_0-9-]*)\s*,[^,]*,\s*(?&ident=
)\s*\)' | wc -l
	13362

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--d5lucct4g3gdijlv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQZ2rQACgkQj4D7WH0S
/k5Wjwf9GmB1nEoIhAtbkSezDUMGtnRIA0mIAQmDVWMFAWrWo0IhdD4gZoKb2hCr
cEG/usN3hNJoAnAHWzqmj20sOmxunSQjZzQKu1bxVf15CWKctvGeuX5aV41O8dTf
oJjy7kz1tYX431ygPRw0ntOmU+M5r4C8qoABawI7WPKZF0BEDq74a1R7FHd4zU9t
apiR76rkekQ2ZCMoOrilxTwCvJxjPcDNiKRugqOVWTKw324hhH+CnOqJIVF7fJ/8
v3F8hUC8WDFEYxjBlXk+YIINGFArv4hJpZOQsJcenURyv/s0WEzAsf0h+W/WFvOA
zD6QBpes1fBCwoRoC7uQ5vkI2aDHJg==
=Wojb
-----END PGP SIGNATURE-----

--d5lucct4g3gdijlv--

--===============5900633106307311445==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============5900633106307311445==--
