Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 747BD770310
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Aug 2023 16:29:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 219CF3F0CD
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Aug 2023 14:29:20 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id EB48E3F055
	for <greybus-dev@lists.linaro.org>; Fri,  4 Aug 2023 14:29:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRvm6-0004IB-Ta; Fri, 04 Aug 2023 16:27:30 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRvlq-0015pr-7N; Fri, 04 Aug 2023 16:27:14 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRvlp-00AP9T-ET; Fri, 04 Aug 2023 16:27:13 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Date: Fri,  4 Aug 2023 16:27:05 +0200
Message-Id: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3888; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=WJTkGffvizVTFrYhxlEwf33iXK2vZsfEyb81l68zhLY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkzQq2XhI0XPWVJKyF8jw9e0hP8cj3HpRdpwKrd oYg1lISRdWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZM0KtgAKCRCPgPtYfRL+ TlmxCACDstGNt8tomXEi1DwnNXDEZlZ/KVZke1AiXVnPIS/ZhVJ94U5aOYapSgAJmHQnzwqgK6z fFWv33dvGgXeSNfMfc82iKjHC0i9u6CpVTKzbkS7CkjLhfefThMzfQsEY6GCcrMBu/Hi+5qaaif ZRymzwLw6Gc4g1La1KPC1OIUlenMjcfHXUKhPwvyeIbrhx8wfU40+IFtYHvBhQqi9/e0I3woRF5 t77a20hH5LhbiKKLjmZ4ZMWDDvSLhjnPg8HbbOUIIqRM1op7uN5Uog1iEYusHzAGP9NsS1utfon xzuuuXTkvCvNrk46p97AVUuT3gZdhE7Ekvy+UO0zlQA3SpbS
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EB48E3F055
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,ideasonboard.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	RCPT_COUNT_GT_50(0.00)[88];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	URIBL_BLOCKED(0.00)[metis.ext.pengutronix.de:helo,metis.ext.pengutronix.de:rdns];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,chromium.org,intel.com,kwiboo.se,gmail.com,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,walle.cc,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,quicinc.com,z3ntu.xyz,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de]
Message-ID-Hash: 3MK4K44JKQEBAFVOEVN2DTTJWPR3OTLR
X-Message-ID-Hash: 3MK4K44JKQEBAFVOEVN2DTTJWPR3OTLR
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wa
 ng@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, linux-am
 logic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3MK4K44JKQEBAFVOEVN2DTTJWPR3OTLR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCihpbXBsaWNpdCkgdjEgb2YgdGhpcyBzZXJpZXMgY2FuIGJlIGZvdW5kIGF0DQpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1wd20vMjAyMzA4MDMxNDA2MzMuMTM4MTY1LTEt
dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlIC4NCg0KQ2hhbmdlcyBzaW5jZSB0aGVuIG9u
bHkgYWZmZWN0IGRvY3VtZW50YXRpb24gdGhhdCBJIG1pc3NlZCB0byBhZGFwdCBiZWZvcmUuDQpU
aGFua3MgdG8gTGF1cmVudCBmb3IgY2F0Y2hpbmcgdGhhdA0KDQpCZXN0IHJlZ2FyZHMNClV3ZQ0K
DQpVd2UgS2xlaW5lLUvDtm5pZyAoMik6DQogIHB3bTogTWFuYWdlIG93bmVyIGFzc2lnbm1lbnQg
aW1wbGljaXRseSBmb3IgZHJpdmVycw0KICBwd206IGNyYzogQWxsb3cgY29tcGlsYXRpb24gYXMg
bW9kdWxlIGFuZCB3aXRoIENPTVBJTEVfVEVTVA0KDQogZHJpdmVycy9ncGlvL2dwaW8tbXZlYnUu
YyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RpLXNuNjVkc2k4
Ni5jIHwgIDEgLQ0KIGRyaXZlcnMvbGVkcy9yZ2IvbGVkcy1xY29tLWxwZy5jICAgICAgfCAgMSAt
DQogZHJpdmVycy9wd20vS2NvbmZpZyAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0NCiBkcml2
ZXJzL3B3bS9jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKysrKysrKystLS0t
LS0tLS0tDQogZHJpdmVycy9wd20vcHdtLWFiODUwMC5jICAgICAgICAgICAgICB8ICAxIC0NCiBk
cml2ZXJzL3B3bS9wd20tYXBwbGUuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdt
L3B3bS1hdG1lbC1obGNkYy5jICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWF0bWVs
LXRjYi5jICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAg
ICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1iY20taXByb2MuYyAgICAgICAgICAgfCAg
MSAtDQogZHJpdmVycy9wd20vcHdtLWJjbS1rb25hLmMgICAgICAgICAgICB8ICAxIC0NCiBkcml2
ZXJzL3B3bS9wd20tYmNtMjgzNS5jICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3
bS1iZXJsaW4uYyAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWJyY21zdGIu
YyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tY2xrLmMgICAgICAgICAgICAg
ICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1jbHBzNzExeC5jICAgICAgICAgICAgfCAgMSAt
DQogZHJpdmVycy9wd20vcHdtLWNyYy5jICAgICAgICAgICAgICAgICB8ICA1ICsrKystDQogZHJp
dmVycy9wd20vcHdtLWNyb3MtZWMuYyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9w
d20tZHdjLmMgICAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1lcDkzeHgu
YyAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWZzbC1mdG0uYyAgICAgICAg
ICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20taGlidnQuYyAgICAgICAgICAgICAgIHwgIDEg
LQ0KIGRyaXZlcnMvcHdtL3B3bS1pbWcuYyAgICAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVy
cy9wd20vcHdtLWlteC10cG0uYyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20t
aW14MS5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1pbXgyNy5jICAg
ICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWludGVsLWxnbS5jICAgICAgICAg
ICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20taXFzNjIwYS5jICAgICAgICAgICAgIHwgIDEgLQ0K
IGRyaXZlcnMvcHdtL3B3bS1qejQ3NDAuYyAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9w
d20vcHdtLWtlZW1iYXkuYyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tbHAz
OTQzLmMgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1scGMxOHh4LXNjdC5j
ICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWxwYzMyeHguYyAgICAgICAgICAgICB8
ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRy
aXZlcnMvcHdtL3B3bS1tZWRpYXRlay5jICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20v
cHdtLW1lc29uLmMgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tbWljcm9j
aGlwLWNvcmUuYyAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1tdGstZGlzcC5jICAgICAg
ICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLW14cy5jICAgICAgICAgICAgICAgICB8ICAx
IC0NCiBkcml2ZXJzL3B3bS9wd20tbnR4ZWMuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZl
cnMvcHdtL3B3bS1vbWFwLWRtdGltZXIuYyAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdt
LXBjYTk2ODUuYyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tcHhhLmMgICAg
ICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1yYXNwYmVycnlwaS1wb2UuYyAg
ICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXJjYXIuYyAgICAgICAgICAgICAgICB8ICAxIC0N
CiBkcml2ZXJzL3B3bS9wd20tcmVuZXNhcy10cHUuYyAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMv
cHdtL3B3bS1yb2NrY2hpcC5jICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXJ6
LW10dTMuYyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tc2Ftc3VuZy5jICAg
ICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1zaWZpdmUuYyAgICAgICAgICAgICAg
fCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXNsMjhjcGxkLmMgICAgICAgICAgICB8ICAxIC0NCiBk
cml2ZXJzL3B3bS9wd20tc3BlYXIuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdt
L3B3bS1zcHJkLmMgICAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXN0aS5j
ICAgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tc3RtMzItbHAuYyAgICAg
ICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1zdG0zMi5jICAgICAgICAgICAgICAgfCAg
MSAtDQogZHJpdmVycy9wd20vcHdtLXN0bXBlLmMgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2
ZXJzL3B3bS9wd20tc3VuNGkuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3
bS1zdW5wbHVzLmMgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXRlZ3JhLmMg
ICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tdGllY2FwLmMgICAgICAgICAg
ICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS10aWVocnB3bS5jICAgICAgICAgICAgfCAgMSAt
DQogZHJpdmVycy9wd20vcHdtLXR3bC1sZWQuYyAgICAgICAgICAgICB8ICAyIC0tDQogZHJpdmVy
cy9wd20vcHdtLXR3bC5jICAgICAgICAgICAgICAgICB8ICAyIC0tDQogZHJpdmVycy9wd20vcHdt
LXZpc2NvbnRpLmMgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tdnQ4NTAwLmMg
ICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS14aWxpbnguYyAgICAgICAgICAg
ICAgfCAgMSAtDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgICAgICAgICB8ICAxIC0N
CiBpbmNsdWRlL2xpbnV4L3B3bS5oICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKysrLS0tLQ0K
IDcwIGZpbGVzIGNoYW5nZWQsIDI2IGluc2VydGlvbnMoKyksIDg1IGRlbGV0aW9ucygtKQ0KDQoN
CmJhc2UtY29tbWl0OiAzY2NiMTc5YWE0MGQ5MzFlYjAwZWY4OTEwZDdiODEyYTk1NjU5NTYzDQot
LSANCjIuNDAuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxp
c3RzLmxpbmFyby5vcmcK
