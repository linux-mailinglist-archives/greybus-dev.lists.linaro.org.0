Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA5883CD78
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 21:31:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C23B43F2A
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 20:31:13 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 5ACDE3F38E
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 20:31:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6M4-0007oq-4x; Thu, 25 Jan 2024 21:29:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6Ly-002MWh-9O; Thu, 25 Jan 2024 21:29:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6Ly-0087Xo-0R;
	Thu, 25 Jan 2024 21:29:38 +0100
Date: Thu, 25 Jan 2024 21:29:37 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <e3xeos2rtfydqj3hz3ql7xkon3aa3aingww7q5lpb3xa4arqrs@6jgwfrgay4le>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
 <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5ACDE3F38E
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+mx];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	URIBL_BLOCKED(0.00)[metis.whiteo.stw.pengutronix.de:helo,metis.whiteo.stw.pengutronix.de:rdns];
	TAGGED_RCPT(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,tuxon.dev,microchip.com,bootlin.com,broadcom.com,chromium.org,kernel.org,pengutronix.de,crapouillou.net,gmail.com,collabora.com,linaro.org,baylibre.com,dabbelt.com,sifive.com,foss.st.com,csie.org,sholland.org,intel.com,linux.intel.com,suse.de,ffwll.ch,linuxfoundation.org,lists.freedesktop.org,ideasonboard.com,samsung.com,lists.infradead.org,st-md-mailman.stormreply.com,lists.linux.dev,nxp.com,kwiboo.se,googlemail.com,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[pengutronix.de]
Message-ID-Hash: SDDMF2KEJHOZB2JIPGYPEB4HB274YGB6
X-Message-ID-Hash: SDDMF2KEJHOZB2JIPGYPEB4HB274YGB6
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Andrzej Hajda <andrzej.hajda@intel.
 com>, Robert Foss <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, greybus-dev@lists.linar
 o.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Douglas Anderson <dianders@chromium.org>, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device of a given chip
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SDDMF2KEJHOZB2JIPGYPEB4HB274YGB6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2889682507331350968=="


--===============2889682507331350968==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qxr7wcriw2tz34lp"
Content-Disposition: inline


--qxr7wcriw2tz34lp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 11:32:47AM -0800, Florian Fainelli wrote:
> On 1/25/24 04:08, Uwe Kleine-K=F6nig wrote:
> > Currently a pwm_chip stores in its struct device *dev member a pointer
> > to the parent device. Preparing a change that embeds a full struct
> > device in struct pwm_chip, this accessor macro should be used in all
> > drivers directly accessing chip->dev now. This way struct pwm_chip and
> > this macro can be changed without having to touch all drivers in the
> > same change set.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
>=20
> Nit: this is not a macro but an inline function.

Oh right, it used to be a macro, but I changed that. I made the commit
log read:

    pwm: Provide an inline function to get the parent device of a given chip

    Currently a pwm_chip stores in its struct device *dev member a pointer
    to the parent device. Preparing a change that embeds a full struct
    device in struct pwm_chip, this accessor function should be used in all
    drivers directly accessing chip->dev now. This way struct pwm_chip and
    this new function can be changed without having to touch all drivers in
    the same change set.

Thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qxr7wcriw2tz34lp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWyxLEACgkQj4D7WH0S
/k5nkwf9F+1G1rrz7HMmMk0kkol6Q/0nb8baCUPdKhCcHXWnUrkFf+l8BvLEafhy
6D5c/214tles7OGu5Mgkku0rW4Ae8+sq9Ho2OEJEpVsSuULPwv3+L44VQzZgsjD6
ULcEcc1vul0iOpwJ0bTHeMqX+P3OENhi72tUDh+NQNnml8ZgePsTI2Ef8agexXAb
7GLAE/AnRbi3bqcn5XzmIjskyMJfwOT4AvyHWPzzM1sGWfGPOiDp8e2cQXNsUywY
IZ1X1op4Eax4/Yg/DB2uED0doQLAwJct5JLN/G+Dfx6EReTyA39z64IHPuxNmCXA
REKDvLe8LO4A9v/JIUQuiwXHBcbjLQ==
=k1zn
-----END PGP SIGNATURE-----

--qxr7wcriw2tz34lp--

--===============2889682507331350968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2889682507331350968==--
