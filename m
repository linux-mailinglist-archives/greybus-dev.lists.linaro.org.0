Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B3D85EDF8
	for <lists+greybus-dev@lfdr.de>; Thu, 22 Feb 2024 01:27:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C047440B3E
	for <lists+greybus-dev@lfdr.de>; Thu, 22 Feb 2024 00:27:27 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id EB2B144306
	for <greybus-dev@lists.linaro.org>; Thu, 15 Feb 2024 11:48:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raaCf-0007ES-Uk; Thu, 15 Feb 2024 12:46:57 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raaCW-000sHg-HB; Thu, 15 Feb 2024 12:46:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raaCW-005KD7-12;
	Thu, 15 Feb 2024 12:46:48 +0100
Date: Thu, 15 Feb 2024 12:46:48 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, James Clark <james.clark@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Mark Brown <broonie@kernel.org>,
	Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>, Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
	Hans de Goede <hdegoede@redhat.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <mwalle@kernel.org>, Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>, Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>, Kees Cook <keescook@chromium.org>, Rob Herring <robh@kernel.org>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <frrn4vofjuskb67rxrgnwqrsqioonglp7nidoueumgw2hemhxq@6hrsnivgobuw>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EB2B144306
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+mx];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,vger.kernel.org,lists.freedesktop.org,ideasonboard.com,samsung.com,lists.infradead.org,gmail.com,st-md-mailman.stormreply.com,rosenzweig.io,baylibre.com,lists.linux.dev,broadcom.com,nxp.com,kwiboo.se,googlemail.com,lists.linaro.org,kernel.org,pengutronix.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_GT_50(0.00)[104];
	FREEMAIL_TO(0.00)[vger.kernel.org,lwn.net,huawei.com,arm.com,linux.intel.com,kernel.org,marcan.st,svenpeter.dev,tuxon.dev,microchip.com,bootlin.com,broadcom.com,mail.ru,chromium.org,pengutronix.de,crapouillou.net,mleia.com,linaro.org,redhat.com,gmail.com,collabora.com,baylibre.com,gmx.net,sntech.de,dabbelt.com,sifive.com,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,bgdev.pl,intel.com,suse.de,ffwll.ch,ucw.cz,quicinc.com,linuxfoundation.org];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	R_DKIM_NA(0.00)[]
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: MZHE4GZAKLB4WO2ZXWYSZ3ATTZ7CBSHN
X-Message-ID-Hash: MZHE4GZAKLB4WO2ZXWYSZ3ATTZ7CBSHN
X-Mailman-Approved-At: Thu, 22 Feb 2024 00:27:17 +0000
CC: Douglas Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Alim Akhtar <alim.akhtar@samsung.com>, Guenter Roeck <groeck@chromium.org>, linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Jerome Brunet <jbrunet@baylibre.com>, chrome-platform@lists.linux.dev, linux-samsung-soc@vger.kernel.org, linux-staging@lists.linux.dev, linux-rockchip@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, linux-leds@vger.kernel.org, linux-sunxi@lists.linux.dev, Jonas Karlman <jonas@kwiboo.se>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-
 amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-mips@vger.kernel.org, asahi@lists.linux.dev, kernel@pengutronix.de, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MZHE4GZAKLB4WO2ZXWYSZ3ATTZ7CBSHN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============7566505635582885517=="


--===============7566505635582885517==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t4o747itgdnx5oup"
Content-Disposition: inline


--t4o747itgdnx5oup
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Feb 14, 2024 at 10:30:47AM +0100, Uwe Kleine-K=F6nig wrote:
> this is v6 of the series introducing better lifetime tracking for
> pwmchips that addresses (for now theoretic) lifetime issues of pwm
> chips. Addressing these is a necessary precondition to introduce chardev
> support for PWMs.
>=20
> Locking got more complicated due to non-sleeping chips, so I dropped
> the character device patch because it got still more incomplete now.
> Also I'm not yet entirely sure about patches #162 and #163 and I expect
> them to change before they can go in. My plan for the next merge window
> is to get the patches in up to #160. After that the addition of chardev
> support (including correct locking) can continue without having to touch
> the lowlevel driver. So the idea of this series is to get the driver
> adaptions out of the way as this requires some cross-tree coordination.
>=20
> The patches that touch files outside of drivers/pwm include:
>=20
>  - gpio: mvebu: Make use of devm_pwmchip_alloc() function
>    It already has an Ack by Linus Walleij.
>=20
>  - drm/bridge: ti-sn65dsi86: Make use of pwmchip_parent() accessor
>  - drm/bridge: ti-sn65dsi86: Make use of devm_pwmchip_alloc() function
>    The 2nd already has an Ack by Douglas Anderson which I tend to assume
>    good enough to merge this via my pwm tree, too. An Ack for the first
>    patch would be nice.
>=20
>  - leds: qcom-lpg: Make use of devm_pwmchip_alloc() function
>    Already has an Ack by Lee Jones.
>=20
>  - staging: greybus: pwm: Change prototype of helpers to prepare further =
changes
>  - staging: greybus: pwm: Make use of pwmchip_parent() accessor
>  - staging: greybus: pwm: Rely on pwm framework to pass a valid hwpwm
>  - staging: greybus: pwm: Drop unused gb_connection_set_data()
>  - staging: greybus: pwm: Rework how the number of PWM lines is determined
>  - staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
>    The greybus patches already got an Ack by Greg Kroah-Hartman in an
>    earlier series, but I dropped it as the patches changed considerably.

After getting the needed acks, I pushed out this series in

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

up to patch #161.

(But don't let you stop looking at the changes, reviews are still
welcome.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t4o747itgdnx5oup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXN+acACgkQj4D7WH0S
/k6nrwf9Huw1P/RTRggrOHnHFRGpBXi+TWvCPbsOC65CPiHeI7iVxtq/vUtQ4A6L
CNA0O2W96568TwCEnxxCI6Be+7t8/H/Xb+oTs0yb6hblYkDhxYrXz+wAtoCTWOM8
MI6xhfufB/JvOhgeX0iVMIx/TOc7gDY0wnFCS7bE15PPxMTjb1yF9Uo3az97CIld
AF8InyaA81p8dcTlhmHzMa59LEFqoPzmNoySKqTIII7UuHmQRXOqV1RuEmKxN9Ho
yRvisZgaqoinb8K7tXdw6G8HErBcN1aHM4OQBkZWI0ufVRNzQ8gT1sfoaRlsilOv
yc/xo9Wl8bLPEKrjcpb9Hv/C+LgzyQ==
=hkRd
-----END PGP SIGNATURE-----

--t4o747itgdnx5oup--

--===============7566505635582885517==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============7566505635582885517==--
