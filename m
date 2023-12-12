Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F28780F8DC
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Dec 2023 22:05:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B9A3343D43
	for <lists+greybus-dev@lfdr.de>; Tue, 12 Dec 2023 21:05:19 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 2424D3F98C
	for <greybus-dev@lists.linaro.org>; Tue, 12 Dec 2023 21:05:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD9wF-0001Oy-5K; Tue, 12 Dec 2023 22:05:11 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD9wE-00FQEY-2C; Tue, 12 Dec 2023 22:05:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rD9wD-001snP-Ol; Tue, 12 Dec 2023 22:05:09 +0100
Date: Tue, 12 Dec 2023 22:05:09 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Message-ID: <20231212210509.focpb63fbmahqij3@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <ZXM4CdJxg-XrYhkn@orome.fritz.box>
 <20231208185033.e6ty2cajcfle6dgk@pengutronix.de>
 <ZXbzcFTnDTKoZAta@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZXbzcFTnDTKoZAta@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Queue-Id: 2424D3F98C
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: MGNHCVWGMVRAZAR7C3XMSEVXJLX4UYVG
X-Message-ID-Hash: MGNHCVWGMVRAZAR7C3XMSEVXJLX4UYVG
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-leds@vger.kernel.org, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, greybus-dev@lists.linaro.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, asahi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 000/115] pwm: Fix lifetime issues for pwm_chips
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MGNHCVWGMVRAZAR7C3XMSEVXJLX4UYVG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7312881373889375350=="


--===============7312881373889375350==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gyt34nc3mm25zmmf"
Content-Disposition: inline


--gyt34nc3mm25zmmf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Mon, Dec 11, 2023 at 12:33:04PM +0100, Thierry Reding wrote:
> On Fri, Dec 08, 2023 at 07:50:33PM +0100, Uwe Kleine-K=F6nig wrote:
> > You don't need to touch all drivers because you didn't change struct
> > pwm_chip::dev yet. (If you really want, you don't need to change that,
> > but then you have some duplication as chip->dev holds the same value as
> > priv->dev.parent in the end.)
>=20
> I don't think that's a problem. These are for two logically separate
> things, after all.

How are they different? I'd say one is the initializer for the other and
(ideally) unused after that. With that interpretation they are indeed
different, but then it's ugly that the initializer keeps staying around.

> Duplication can also sometimes be useful to simplify
> things. There are plently of cases where we use local variables for the
> same reason.

local variables go away though after the respective function is left.
chip->dev and its copy priv->dev.parent stay around for the full
lifetime of the chip.

> > > @@ -58,23 +60,24 @@ static struct pwm_chip *pwmchip_find_by_name(cons=
t char *name)
> > > =20
> > >  static int pwm_device_request(struct pwm_device *pwm, const char *la=
bel)
> > >  {
> > > +	struct pwm_chip *chip =3D pwm->priv->chip;
> >=20
> > With my approach getting the chip of a struct pwm_device is only one
> > pointer dereference away. You need two.
>=20
> None of the functions here are called very often, so even if this isn't
> optimized away it would hardly matter.

I'd say pwm_apply_state() at least matters. Also I think that making a
slow path quicker is a good thing.=20

I wonder how we'll converge to an approach that can go into the
mainline given that we both have our strong opinions.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gyt34nc3mm25zmmf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV4ywQACgkQj4D7WH0S
/k4AOQf/Rn+1it6Pa2jcb+shcSHEefw76NASZ1jTJwzdnczaZca+4/TdY0/HLE/V
27TLO93Qd9e4o0E4uFjg/T9KbZy+cu9WxiCJ9LgBEhgPaLIWe9opiDarsy2BNLJi
e6lERFOmyBoG3USP7t/iEQn5C+0+gC6/pcPVWk8TJO/mc2kr8ioQRsaHtaE0AsX0
hpZS0GH+ypW5d1saF+TMkSDV4QUzmTaXxsSDqG9/vnXhjln6wlriyIo2gJI2qQ6R
gBrGVWoz8SnG3OjfGZwo9KhL+KPTbjIba4erb1KbE9j9Ul7c3xF/nA6GcTwU/IcQ
6WQMUp7Ez5oG8txpknnsR9R2Iimimw==
=APXJ
-----END PGP SIGNATURE-----

--gyt34nc3mm25zmmf--

--===============7312881373889375350==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7312881373889375350==--
