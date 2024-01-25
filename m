Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5126883CDD4
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 21:55:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4F59840F0B
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 20:55:18 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id F1A053F38E
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 20:55:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6kK-0000q6-2e; Thu, 25 Jan 2024 21:54:48 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6kE-002MbB-Qk; Thu, 25 Jan 2024 21:54:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rT6kE-0088NE-2C;
	Thu, 25 Jan 2024 21:54:42 +0100
Date: Thu, 25 Jan 2024 21:54:42 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Florian Fainelli <florian.fainelli@broadcom.com>
Message-ID: <h4l5ki3mvayfmfb73jnrokmxu3p2ewutihx4rytefmpce7bcxq@nhsyy2fw6fds>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
 <c89cbecf-253d-4a2c-8782-304b7b620175@broadcom.com>
 <e3xeos2rtfydqj3hz3ql7xkon3aa3aingww7q5lpb3xa4arqrs@6jgwfrgay4le>
MIME-Version: 1.0
In-Reply-To: <e3xeos2rtfydqj3hz3ql7xkon3aa3aingww7q5lpb3xa4arqrs@6jgwfrgay4le>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F1A053F38E
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
	URIBL_BLOCKED(0.00)[pengutronix.de:url,pengutronix.de:email];
	TAGGED_RCPT(0.00)[];
	R_DKIM_NA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	FREEMAIL_CC(0.00)[bootlin.com,chromium.org,samsung.com,foss.st.com,lists.freedesktop.org,microchip.com,crapouillou.net,ideasonboard.com,intel.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,baylibre.com,lists.linux.dev,vger.kernel.org,kernel.org,sholland.org,csie.org,broadcom.com,nxp.com,suse.de,kwiboo.se,googlemail.com,pengutronix.de,linux.intel.com,lists.linaro.org,sifive.com,ffwll.ch,collabora.com,linaro.org,linuxfoundation.org,tuxon.dev,dabbelt.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DMARC_NA(0.00)[pengutronix.de]
Message-ID-Hash: AYKD5EW2C7VA7EGUR7MJQF5PPRSGTY4G
X-Message-ID-Hash: AYKD5EW2C7VA7EGUR7MJQF5PPRSGTY4G
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>, Douglas Anderson <dianders@chromium.org>, Alim Akhtar <alim.akhtar@samsung.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, dri-devel@lists.freedesktop.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Paul Cercueil <paul@crapouillou.net>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org, Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Samuel Holland <samuel@sholland.org>, Kevin Hilman <khilman@baylibre.com>, linux-staging@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@
 nxp.com>, linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Johan Hovold <johan@kernel.org>, Maxime Ripard <mripard@kernel.org>, greybus-dev@lists.linaro.org, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Benson Leung <bleung@chromium.org>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>, Alex Elder <elder@kernel.org>, Scott Branden <sbranden@broadcom
 .com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device of a given chip
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AYKD5EW2C7VA7EGUR7MJQF5PPRSGTY4G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============6137817165377483916=="


--===============6137817165377483916==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2cxtxp6sbv6wwe5j"
Content-Disposition: inline


--2cxtxp6sbv6wwe5j
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 25, 2024 at 09:29:37PM +0100, Uwe Kleine-K=F6nig wrote:
> On Thu, Jan 25, 2024 at 11:32:47AM -0800, Florian Fainelli wrote:
> > On 1/25/24 04:08, Uwe Kleine-K=F6nig wrote:
> > > Currently a pwm_chip stores in its struct device *dev member a pointer
> > > to the parent device. Preparing a change that embeds a full struct
> > > device in struct pwm_chip, this accessor macro should be used in all
> > > drivers directly accessing chip->dev now. This way struct pwm_chip and
> > > this macro can be changed without having to touch all drivers in the
> > > same change set.
> > >=20
> > > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > Nit: this is not a macro but an inline function.
>=20
> Oh right, it used to be a macro, but I changed that. I made the commit
> log read:
>=20
>     pwm: Provide an inline function to get the parent device of a given c=
hip
>=20
>     Currently a pwm_chip stores in its struct device *dev member a pointer
>     to the parent device. Preparing a change that embeds a full struct
>     device in struct pwm_chip, this accessor function should be used in a=
ll
>     drivers directly accessing chip->dev now. This way struct pwm_chip and
>     this new function can be changed without having to touch all drivers =
in
>     the same change set.

While looking into further feedback, I noticed I did the same mistake in
all the patches that convert the drivers to use this function. I did

	git filter-branch --msg-filter 'sed "s/Make use of pwmchip_parent() macro/=
Make use of pwmchip_parent() accessor/; s/commit as struct pwm_chip::dev, u=
se the macro/commit as struct pwm_chip::dev, use the accessor/; s/provided =
for exactly this purpose./function provided for exactly this purpose./"' li=
nus/master..

on my branch to make the typical commit log read:

	pwm: atmel: Make use of pwmchip_parent() accessor
=09
	struct pwm_chip::dev is about to change. To not have to touch this
	driver in the same commit as struct pwm_chip::dev, use the accessor
	function provided for exactly this purpose.

I wont resend the whole series if this is the only change to it.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2cxtxp6sbv6wwe5j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWyypEACgkQj4D7WH0S
/k5psggAul+UfI+G8dHEaH2KDgkBUUlYZUwuEaOFluY8XF2KWBYgzrV6GTSkw5wT
Me32hGYPzkH5GThVge4EwflIY6st1Dpe7hApskZcERowT4iaqpLmRhMLJSfbNFFL
TKdck+IYqa1cFxKcnCqPr5UHCx9DR2zJulclKHey+IaAQbbiSZ7PXqTliJidSqA4
gcZdCllP/NksXCjwuu7f3ffFYfT4eD4biOf/g24aQx4AkSSB/1xPNtYnwHwe9U7Q
NfCN0EtnmSN3qHIMZQ0v8PHGjfE/VvFR+cIRqaher18JI/FRZFfNPMhT1hniO7vh
qGInsEnK5ClF+KhK7XpBNiDRRAyXtw==
=6bo9
-----END PGP SIGNATURE-----

--2cxtxp6sbv6wwe5j--

--===============6137817165377483916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============6137817165377483916==--
