Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 54E6583DF98
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 18:14:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4DC1A43CC4
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 17:14:39 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 562433F352
	for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 17:14:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPmf-0003vn-Nk; Fri, 26 Jan 2024 18:14:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPmf-002YGA-7l; Fri, 26 Jan 2024 18:14:29 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPmf-008oT4-0V;
	Fri, 26 Jan 2024 18:14:29 +0100
Date: Fri, 26 Jan 2024 18:14:29 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Elder <elder@ieee.org>
Message-ID: <l42gon3id2p7ehdvjc2zcj4ahgd22m725yirgcuqetnd2pfhad@6mewdz4i5xgh>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <57b2e034d878c39d472d9dfc86b2c39272e4eabf.1706182805.git.u.kleine-koenig@pengutronix.de>
 <c796d34c-0076-488b-9643-8ecfdaa2a32b@ieee.org>
MIME-Version: 1.0
In-Reply-To: <c796d34c-0076-488b-9643-8ecfdaa2a32b@ieee.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 562433F352
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	NEURAL_HAM(-0.00)[-0.994];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: ZKHHXTKBXIL47QU4GKJZYNMYNCKPVNL2
X-Message-ID-Hash: ZKHHXTKBXIL47QU4GKJZYNMYNCKPVNL2
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-pwm@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 038/111] staging: greybus: pwm: Make use of pwmchip_parent() macro
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZKHHXTKBXIL47QU4GKJZYNMYNCKPVNL2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============6875707895331965997=="


--===============6875707895331965997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qiqb4v3sx4xw4gdb"
Content-Disposition: inline


--qiqb4v3sx4xw4gdb
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 08:46:15AM -0600, Alex Elder wrote:
> On 1/25/24 6:09 AM, Uwe Kleine-K=F6nig wrote:
> > struct pwm_chip::dev is about to change. To not have to touch this
> > driver in the same commit as struct pwm_chip::dev, use the macro
> > provided for exactly this purpose.
> >=20
> > Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> I think I'd rather see the footprint of your change be much
> smaller than it is.  Please see below.

You have noticed already yourself while reviewing a later patch touching
this driver. But to be explicit here: Later it's not trivial any more to
get the pwm_chip from a gb_pwm_chip. So I changed some functions to take
a pwm_chip. This should be mentioned in the commit log though. I will
improve that in the next iteration, and maybe split the introduction of
pwmchip_parent() and the parameter changes in two changes.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qiqb4v3sx4xw4gdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWz6HQACgkQj4D7WH0S
/k4vxAgAr3AbG7WHZligA2jnIr7gC0knu3X7hvuS58RJ39M626cMpiZPxvdEn5on
tOVqvo1fz72b68cpUPvAh+CQ5tIg+qlu9GeRLXnsNvgUhWChvb6GFOiXBz8fU0Sy
PhS1Lfs+NdR14MiXSa7uM+3CCPWBt+JTvXojt8tHTnLGu4Bl+/xRY5HHyXOmkHzV
vuNj1Azx8bg5t3v+yRMLwhc8ZxvXYTRlvVxYlHipG10UysqU6PJm+KbxiVEsZk6J
jfs9KknSSWrG7UrA9Vi3XvFQPlQnYwn+9Kpo7Y3sMtElUFq+3TsxY5XBAcrAx7+6
fBUslROYRaSbva5wiEUiKVvYvRDc1A==
=JArl
-----END PGP SIGNATURE-----

--qiqb4v3sx4xw4gdb--

--===============6875707895331965997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============6875707895331965997==--
