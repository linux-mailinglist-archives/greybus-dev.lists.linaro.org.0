Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BC754550CE8
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Jun 2022 22:25:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A88E23F1D1
	for <lists+greybus-dev@lfdr.de>; Sun, 19 Jun 2022 20:25:13 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id E3DD63ECBD
	for <greybus-dev@lists.linaro.org>; Sun, 19 Jun 2022 20:25:10 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o31Tj-0001i2-RS; Sun, 19 Jun 2022 22:25:03 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o31Td-001Vpv-6C; Sun, 19 Jun 2022 22:24:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o31Td-00HRae-Vz; Sun, 19 Jun 2022 22:24:57 +0200
Date: Sun, 19 Jun 2022 22:24:50 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Song Chen <chensong_2000@189.cn>
Message-ID: <20220619202450.c2ixwemrbwp2sazt@pengutronix.de>
References: <1647597432-27586-1-git-send-email-chensong_2000@189.cn>
MIME-Version: 1.0
In-Reply-To: <1647597432-27586-1-git-send-email-chensong_2000@189.cn>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: SKFNBRLEEQX3VE264OFPN62LRZ2B3KYP
X-Message-ID-Hash: SKFNBRLEEQX3VE264OFPN62LRZ2B3KYP
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, elder@linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SKFNBRLEEQX3VE264OFPN62LRZ2B3KYP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============5703663664966639809=="


--===============5703663664966639809==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5jkw6rzfmqkhrj35"
Content-Disposition: inline


--5jkw6rzfmqkhrj35
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Mar 18, 2022 at 05:57:12PM +0800, Song Chen wrote:
> Introduce newer .apply function in pwm_ops to replace legacy operations
> including enable, disable, config and set_polarity.
>=20
> This guarantees atomic changes of the pwm controller configuration.
>=20
> Signed-off-by: Song Chen <chensong_2000@189.cn>

for the record: This patch was applied by Greg, I'm marking it as
"handled elsewhere" in the pwm patchwork.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5jkw6rzfmqkhrj35
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKvhg8ACgkQwfwUeK3K
7AmNLQgAgW5qLr1UcrL5DrcIQNINK32n730Ls2hUGI/4QcZxbJfI+42XR2JJAtY8
zGdWSiy7adHCdo4xPHTCGYYfYvP56MMFe3+5pgvrgvP+wjg6b40vmthvZJT5njZU
LO30ySHraprHm9ju74JLWacI+ChO5ecDbj2kbDvTMftnWd5t7UkpkIH5dcMdOtso
kEpXl5GtpYXDle+1vhgqT+Goy2103t4YF2s4ArfikN/kSxlCQ2eWHWTMkprkILGm
0h5HrrMEmcuLD8PHqk2n0tqrjNcZHVvMatdRnXEG1jzzv53eTrOrvT1IRvfxM1F+
sPsuSMuSIxxWQ0B4PNjjJVCGAM2SVg==
=5fqr
-----END PGP SIGNATURE-----

--5jkw6rzfmqkhrj35--

--===============5703663664966639809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============5703663664966639809==--
