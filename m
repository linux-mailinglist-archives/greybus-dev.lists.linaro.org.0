Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67382F145
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jan 2024 16:19:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 27E9143F08
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Jan 2024 15:19:22 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 07E383E930
	for <greybus-dev@lists.linaro.org>; Tue, 16 Jan 2024 15:19:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPlD8-0000tu-OV; Tue, 16 Jan 2024 16:18:42 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPlD0-000Gxt-VX; Tue, 16 Jan 2024 16:18:34 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPlD0-0011AW-2X;
	Tue, 16 Jan 2024 16:18:34 +0100
Date: Tue, 16 Jan 2024 16:18:34 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Message-ID: <l4azekfj7hduzi4wcyphispst46fi3m5ams65nzer2ai6upoxw@3p2uki626ytt>
References: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
 <3404c9af-6c11-45d7-9ba4-a120e21e407e@sirena.org.uk>
MIME-Version: 1.0
In-Reply-To: <3404c9af-6c11-45d7-9ba4-a120e21e407e@sirena.org.uk>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	FREEMAIL_CC(0.00)[sntech.de,glider.be,linaro.org,lists.freedesktop.org,bootlin.com,raritan.com,datenfreihafen.org,lists.infradead.org,redhat.com,kernel.org,linuxfoundation.org,vger.kernel.org,pengutronix.de,alsa-project.org,yandex.ru,gmail.com,google.com,arm.com,chromium.org,amarulasolutions.com,lists.linux.dev,metafoo.de,analog.com,gmx.de,intel.com,amd.com,googlemail.com,lists.linaro.org,iki.fi,davemloft.net,ravnborg.org,lwn.net,arndb.de,huawei.com,ansari.sh,digiteqautomotive.com,ti.com,netup.ru,nod.at,ziepe.ca,linux.intel.com,collabora.com,microchip.com,suse.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_GT_50(0.00)[91];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 07E383E930
X-Spamd-Bar: -------
Message-ID-Hash: 2GNJSW2LRWMEFXTLTWUM5KXL36ETSNFV
X-Message-ID-Hash: 2GNJSW2LRWMEFXTLTWUM5KXL36ETSNFV
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Heiko Stuebner <heiko@sntech.de>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, dri-devel@lists.freedesktop.org, Miquel Raynal <miquel.raynal@bootlin.com>, Ronald Wahl <ronald.wahl@raritan.com>, Stefan Schmidt <stefan@datenfreihafen.org>, libertas-dev@lists.infradead.org, Javier Martinez Canillas <javierm@redhat.com>, Alex Elder <elder@kernel.org>, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, linux-spi@vger.kernel.org, kernel@pengutronix.de, linux-media@vger.kernel.org, linux-wpan@vger.kernel.org, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-doc@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>, Max Filippov <jcmvbkbc@gmail.com>, Eric Dumazet <edumazet@google.com>, James Clark <james.clark@arm.com>, Guenter Roeck <groeck@chromium.org>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, chrome-platform@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Henneric
 h@analog.com>, Viresh Kumar <vireshk@kernel.org>, Helge Deller <deller@gmx.de>, Wu Hao <hao.wu@intel.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, greybus-dev@lists.linaro.org, Bjorn Helgaas <bhelgaas@google.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Aaro Koskinen <aaro.koskinen@iki.fi>, "David S. Miller" <davem@davemloft.net>, Jarkko Sakkinen <jarkko@kernel.org>, linux-integrity@vger.kernel.org, Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, Herve Codina <herve.codina@bootlin.com>, linux-iio@vger.kernel.org, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-fbdev@vger.kernel.org, linux-mtd@lists.infradead.org, Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, linux-staging@lists.linux.dev, Jernej Skrabec <jernej.sk
 rabec@gmail.com>, linux-input@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, Moritz Fischer <mdf@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, Benson Leung <bleung@chromium.org>, Rayyan Ansari <rayyan@ansari.sh>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-mmc@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, Xu Yilun <yilun.xu@intel.com>, Alexander Aring <alex.aring@gmail.com>, Vignesh Raghavendra <vigneshr@ti.com>, Peter Huewe <peterhuewe@gmx.de>, Sergey Kozlov <serjk@netup.ru>, Richard Weinberger <richard@nod.at>, Jason Gunthorpe <jgg@ziepe.ca>, Jakub Kicinski <kuba@kernel.org>, Kalle Valo <kvalo@kernel.org>, Johan Hovold <johan@kernel.org>, linux-mediatek@lists.infradead.org, Tzung-Bi Shih <tzungbi@kernel.org>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shev
 chenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, netdev@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2GNJSW2LRWMEFXTLTWUM5KXL36ETSNFV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============2914276999006328498=="


--===============2914276999006328498==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ojpgqs276usvjple"
Content-Disposition: inline


--ojpgqs276usvjple
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Mark,

On Tue, Jan 16, 2024 at 02:40:39PM +0000, Mark Brown wrote:
> On Mon, Jan 15, 2024 at 09:12:46PM +0100, Uwe Kleine-K=F6nig wrote:
>=20
> > In commit 8caab75fd2c2 ("spi: Generalize SPI "master" to "controller"")
> > some functions were renamed. Further some compat defines were introduced
> > to map the old names to the new ones.
>=20
> > Patch #18 and #19 touch the same driver, otherwise the patches #1 - #31
> > are pairwise independent and could be applied by their respective
> > maintainers. The alternative is to let all patches go via the spi tree.
> > Mark, what's your preference here?
>=20
> I don't have a strong preference here, I'm happy to take all the patches
> if the maintainers for the other subsystem are OK with that - ideally
> I'd apply things at -rc1 but the timeline is a bit tight there.  I think
> my plan here unless anyone objects (or I notice something myself) will
> be to queue things at -rc3, please shout if that doesn't seem
> reasonable.

=46rom my side there is no rush, we lived with these defines since
4.13-rc1. Applying them during the next merge window is fine for me.

Anyhow, I intend to resend the series for the feedback I received after
-rc1. Up to you when you want to apply it. Watching out for offending
patches using lore shouldn't be a big thing and I can do that.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ojpgqs276usvjple
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWmnkkACgkQj4D7WH0S
/k7Jlgf/bxg8PBfYKKX7PvDPgT3ZVpLLtWReyLQDBjEkSddRCSKzwPE5dQsE6TGF
pkpgz7Za7CnFfHKtW25alERgnrqA9inDitGvBoBIVgSHPf6GJsGOPVLhziEMU9t1
tBlCUkInYGMvS/Gn5tOoSjNLmapgV8tiNzeos6MHWZzdKpWIzj6SBNH72Bof8kUq
R287GggNJ2PLZa24vL2Pct4BZIfpbD+n1o6O62edEmpGe17xuDkSNfjirG7MojjX
vAtAlEpsLidT0eabHr4XkgyBSQZLwlh1OdReMiXhtK5GM3Oh9R4Y2XVhUq83hKSl
5zzsBEXwEe1w3pKgGJnCD1jxAAcJ9A==
=Sz6E
-----END PGP SIGNATURE-----

--ojpgqs276usvjple--

--===============2914276999006328498==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============2914276999006328498==--
