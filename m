Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF1284757E
	for <lists+greybus-dev@lfdr.de>; Fri,  2 Feb 2024 17:59:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9C34B3F1C9
	for <lists+greybus-dev@lfdr.de>; Fri,  2 Feb 2024 16:59:52 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 332013F352
	for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 17:12:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPjB-0003h4-L9; Fri, 26 Jan 2024 18:10:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPiw-002YFi-JY; Fri, 26 Jan 2024 18:10:38 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rTPiw-008oFN-1F;
	Fri, 26 Jan 2024 18:10:38 +0100
Date: Fri, 26 Jan 2024 18:10:38 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Alex Elder <elder@ieee.org>
Message-ID: <zjt3r6z5ilpffh26qidwp3axpnvfkwcrwanrtjjm2kscpdovuz@ppcrdlhmqiqq>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
 <db05fb6a-2ea5-4e00-ac03-adc1897d96de@ieee.org>
MIME-Version: 1.0
In-Reply-To: <db05fb6a-2ea5-4e00-ac03-adc1897d96de@ieee.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 332013F352
X-Spamd-Bar: -------
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
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,linux.intel.com,huawei.com,google.com,arm.com,vger.kernel.org,marcan.st,svenpeter.dev,microchip.com,bootlin.com,tuxon.dev,broadcom.com,mail.ru,chromium.org,kernel.org,pengutronix.de,crapouillou.net,mleia.com,redhat.com,gmail.com,collabora.com,linaro.org,baylibre.com,gmx.net,sntech.de,dabbelt.com,sifive.com,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,bgdev.pl,intel.com,suse.de,ffwll.ch,ucw.cz,quicinc.com,vivo.com,z3ntu.xyz,lists.freedesktop.org,ideasonboard.com,samsung.com,lists.infradead.org,st-md-mailman.stormreply.com,rosenzweig.io,lists.linux.dev,nxp.com,kwiboo.se,googlemail.com,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_GT_50(0.00)[100];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	R_DKIM_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de]
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: ZUXBHKSCDDPRICAUBARIQ3O4DJ7HZ6RP
X-Message-ID-Hash: ZUXBHKSCDDPRICAUBARIQ3O4DJ7HZ6RP
X-Mailman-Approved-At: Fri, 02 Feb 2024 16:59:48 +0000
CC: Jonathan Corbet <corbet@lwn.net>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>, linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil 
 Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <mwalle@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.and
 erson@seco.com>, Michal Simek <michal.simek@amd.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, Andi Shyti <andi.shyti@kernel.org>, Lu Hongfei <luhongfei@vivo.com>, Bjorn Andersson <quic_bjorande@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>, Johan Hovold <johan@kernel.org>, Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org, Fabio Est
 evam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-mips@vger.kernel.org, asahi@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 040/111] pwm: Provide devm_pwmchip_alloc() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZUXBHKSCDDPRICAUBARIQ3O4DJ7HZ6RP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============3193873930486560781=="


--===============3193873930486560781==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="b26sjadvk3fz44v6"
Content-Disposition: inline


--b26sjadvk3fz44v6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Alex,

On Fri, Jan 26, 2024 at 08:56:33AM -0600, Alex Elder wrote:
> On 1/25/24 6:09 AM, Uwe Kleine-K=F6nig wrote:
> > This function allocates a struct pwm_chip and driver data. Compared to
> > the status quo the split into pwm_chip and driver data is new, otherwise
> > it doesn't change anything relevant (yet).
> >=20
> > The intention is that after all drivers are switched to use this
> > allocation function, its possible to add a struct device to struct
> > pwm_chip to properly track the latter's lifetime without touching all
> > drivers again. Proper lifetime tracking is a necessary precondition to
> > introduce character device support for PWMs (that implements atomic
> > setting and doesn't suffer from the sysfs overhead of the /sys/class/pwm
> > userspace support).
> >=20
> > The new function pwmchip_priv() (obviously?) only works for chips
> > allocated with devm_pwmchip_alloc().
>=20
> I think this looks good.  Two questions:
> - Should you explicitly align the private data?  Or do you believe
>   the default alignment (currently pointer size aligned) is adequate?

I'm not aware of a requirement for a higher order alignment (but I might
well miss something). I did my tests on arm, nothing exploded there.
Maybe the conservative approach of asserting the same alignment as
kmalloc would be a good idea. I'll think and research about that.

iio uses ARCH_DMA_MINALIGN, net uses 32 (NETDEV_ALIGN).

> - Is there a non-devres version of the allocation function?

Patch #109 introduces a non-devres variant. As it's not used it's a
static function though. Can easily be changed is a use case pops up.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--b26sjadvk3fz44v6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWz540ACgkQj4D7WH0S
/k4oQwf+Nnq9bGZWZrbCQsHJYB54zfZt1whu2kQgdRMIQzT8HP7NadKhFCqs3Ob6
5xwIwbIpdczrpzHM25+5ZrTBiH5oSQ/Si0YMzglndL8Tm59GEJxcKoorYpDNplJR
xHL2owB7VgG87fFIvSCe163biS2vI/gIjAGvL9bpzcSH62Eq7EO3APk7Hx+h7d9e
QHLzzUmpN9JlrzYOhKE7Pu7/iVFPNqNb7FQtAOnamXe0kRLs05649mgdJ9q30gS8
imf9reDedsSG7sHM5NjtZpBQpF9H3vulzuGbH2MH2jNDLjtcpvUXUZpfijLN69iQ
GqSwNOqcwcXljLsP1A1wM8snNwzi/A==
=cXfD
-----END PGP SIGNATURE-----

--b26sjadvk3fz44v6--

--===============3193873930486560781==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============3193873930486560781==--
