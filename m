Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 122CE6C361F
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 16:47:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F387A43E63
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 15:47:43 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 25B083EEF8
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 15:47:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1peeCx-0004fu-Rx; Tue, 21 Mar 2023 16:47:31 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1peeCw-005is5-0N; Tue, 21 Mar 2023 16:47:30 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1peeCv-006nh6-05; Tue, 21 Mar 2023 16:47:29 +0100
Date: Tue, 21 Mar 2023 16:47:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Message-ID: <20230321154728.3r7ut3rl2pccmo2e@pengutronix.de>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1274302b52ae905dab6f75377d625598facbbdf1.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 25B083EEF8
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.50)[2a0a:edc0:0:900:1d::77:received,2a0a:edc0:0:c01:1d::a2:received,85.220.165.71:from];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,lists.linaro.org,vger.kernel.org,inria.fr];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de]
Message-ID-Hash: CPWEWZVYFUSPXMAUA54CFIWGGBYLUU5N
X-Message-ID-Hash: CPWEWZVYFUSPXMAUA54CFIWGGBYLUU5N
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/3] staging: greybus: use inline function for macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CPWEWZVYFUSPXMAUA54CFIWGGBYLUU5N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============4088874183022833778=="


--===============4088874183022833778==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="spy665gboibxpu7h"
Content-Disposition: inline


--spy665gboibxpu7h
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

just some nitpicks:

On Tue, Mar 21, 2023 at 01:04:33AM +0200, Menna Mahmoud wrote:
> Convert `to_gbphy_dev` and `to_gbphy_driver` macros into a
> static inline function.
>=20
> it is not great to have macro that use `container_of` macro,

s/it/It/; s/macro/macros/; s/use/use the/;

> because from looking at the definition one cannot tell what type
> it applies to.
> [...]
> -#define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
> +static inline struct gbphy_device *to_gbphy_dev(const struct device *d)

drivers/staging/greybus/gbphy.c always passes a variable named
"dev" to this macro. So I'd call the parameter "dev", too, instead of
"d". This is also a more typical name for variables of that type.

> +{
> +	return container_of(d, struct gbphy_device, dev);
> +}
> [...]
>  };
> -#define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
> +static inline struct gbphy_driver *to_gbphy_driver(struct device_driver =
*d)
> +{
> +	return container_of(d, struct gbphy_driver, driver);
> +}

With a similar reasoning (and also to not have "d"s that are either
device or device_driver) I'd recommend "drv" here.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--spy665gboibxpu7h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQZ0Y8ACgkQj4D7WH0S
/k4qLAf+OTmsDZSmp40zMixg9DyMOELi6eqVdtJNU0qCtkilPtrhsOc1vhA3SamR
4rtAve/7j2BN+tb4WuiZ7YwaMXs5KJ3RItbk5imECAeAvRY0BDfHHJUZY2DrBSEY
LyRButIl87Gx7CVaylbyORucxyTsU1h/Pj94t5kxAp9Xa5zkSaFwBxh3rP2L5bjd
nxyRUG7tt+LYeR8+53BlcQqRARzpeiunRsIp3HhiPIi819GZEJh6eDEGNbTUYRED
uzyBRgvEL47X2nJZG6d8TgcGWlUicJyqBMDeQavLQxMlb8URXu2qUCfph/gscRi3
1xxyP135o/YY4eUmw3946Nxbj2t0oA==
=eLyP
-----END PGP SIGNATURE-----

--spy665gboibxpu7h--

--===============4088874183022833778==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============4088874183022833778==--
