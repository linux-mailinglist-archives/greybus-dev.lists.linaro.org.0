Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CF04D76F4D7
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Aug 2023 23:53:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3F203F055
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Aug 2023 21:53:02 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lists.linaro.org (Postfix) with ESMTPS id 8A8693F055
	for <greybus-dev@lists.linaro.org>; Thu,  3 Aug 2023 21:52:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=OGUpWfWm;
	spf=pass (lists.linaro.org: domain of laurent.pinchart@ideasonboard.com designates 213.167.242.64 as permitted sender) smtp.mailfrom=laurent.pinchart@ideasonboard.com;
	dmarc=none
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A5DF12CF;
	Thu,  3 Aug 2023 23:51:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1691099510;
	bh=4nr+pCFvRIDbDtYoKOpZHa11XbIzghHLOacwxCPgWv0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGUpWfWmlbDM/JBOqZX1yp/eoV/Rcz/Zn23aC6MnCRuqPimeo3C+zvWkqj5pmsWsF
	 qv0j+Fh16ePKbMCewYGqMvxtSv439imwpmCOJFWYpqy22mz/We9dKU4kmGbLhtt0OS
	 bhhdQ0NafJU6hdCRH2blWEIsRatPNcAPMTU3f7HU=
Date: Fri, 4 Aug 2023 00:53:00 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <20230803215300.GH27752@pendragon.ideasonboard.com>
References: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
 <20230803140633.138165-2-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803140633.138165-2-u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8A8693F055
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.90 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[213.167.242.64:from,213.243.189.158:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	R_SPF_ALLOW(-0.20)[+mx];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[ideasonboard.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:29169, ipnet:213.167.240.0/20, country:FR];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,linaro.org,bgdev.pl,kernel.org,chromium.org,intel.com,kwiboo.se,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,walle.cc,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org]
Message-ID-Hash: YXZVZIOJ2KET7NBL3DSVVDCALSRWWDXZ
X-Message-ID-Hash: YXZVZIOJ2KET7NBL3DSVVDCALSRWWDXZ
X-MailFrom: laurent.pinchart@ideasonboard.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Thierry Reding <thierry.reding@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <shc_work@mai
 l.ru>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jonathan =?utf-8?Q?Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, Orson Zhai <o
 rsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.
 org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YXZVZIOJ2KET7NBL3DSVVDCALSRWWDXZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgVXdlLA0KDQpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCg0KT24gVGh1LCBBdWcgMDMsIDIw
MjMgYXQgMDQ6MDY6MzFQTSArMDIwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEluc3Rl
YWQgb2YgcmVxdWlyaW5nIGVhY2ggZHJpdmVyIHRvIGNhcmUgZm9yIGFzc2lnbmluZyB0aGUgb3du
ZXIgbWVtYmVyDQo+IG9mIHN0cnVjdCBwd21fb3BzLCBoYW5kbGUgdGhhdCBpbXBsaWNpdGx5IHVz
aW5nIGEgbWFjcm8uIE5vdGUgdGhhdCB0aGUNCj4gb3duZXIgbWVtYmVyIGhhcyB0byBiZSBtb3Zl
ZCB0byBzdHJ1Y3QgcHdtX2NoaXAsIGFzIHRoZSBvcHMgc3RydWN0dXJlDQo+IHVzdWFsbHkgbGl2
ZXMgaW4gcmVhZC1vbmx5IG1lbW9yeSBhbmQgc28gY2Fubm90IGJlIG1vZGlmaWVkLg0KDQpXaGls
ZSB0ZWNobmljYWxseSBzcGVha2luZyB0aGUgb3BzIGFuZCBwd20gY2hpcCBjb3VsZCBiZSBwcm92
aWRlZCBieQ0KZGlmZmVyZW50IG1vZHVsZXMsIHN1Y2ggYSB1c2UgY2FzZSB3b3VsZCBsaWtlbHkg
cmVxdWlyZSBhIGhpZ2ggbGV2ZWwgb2YNCnNlbGYtaW5mbGljdGVkIHBhaW4sIHNvIEkgdGhpbmsg
dGhlIGNoYW5nZSBpcyBmaW5lLg0KDQo+IFRoZSB1cHNpZGUgaXMgdGhhdCBuZXcgbG93bGV2ZWwg
ZHJpdmVycyBjYW5ub3QgZm9yZ2V0IHRoZSBhc3NpZ25tZW50IGFuZA0KPiBzYXZlIG9uZSBsaW5l
IGVhY2guIFRoZSBwd20tY3JjIGRyaXZlciBkaWRuJ3QgYXNzaWduIC5vd25lciwgdGhhdCdzIG5v
dA0KPiBhIHByb2JsZW0gaW4gcHJhY3Rpc2UgdGhvdWdoIGFzIHRoZSBkcml2ZXIgY2Fubm90IGJl
IGNvbXBpbGVkIGFzIGENCj4gbW9kdWxlLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+ICBkcml2
ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS90aS1zbjY1ZHNpODYuYyB8ICAxIC0NCj4gIGRyaXZlcnMvbGVkcy9yZ2IvbGVk
cy1xY29tLWxwZy5jICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9jb3JlLmMgICAgICAgICAg
ICAgICAgICAgIHwgMjAgKysrKysrKysrKystLS0tLS0tLS0NCj4gIGRyaXZlcnMvcHdtL3B3bS1h
Yjg1MDAuYyAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tYXBwbGUuYyAg
ICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWF0bWVsLWhsY2RjLmMgICAg
ICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC10Y2IuYyAgICAgICAgICAgfCAg
MSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAg
ZHJpdmVycy9wd20vcHdtLWJjbS1pcHJvYy5jICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMv
cHdtL3B3bS1iY20ta29uYS5jICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20t
YmNtMjgzNS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWJlcmxpbi5j
ICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1icmNtc3RiLmMgICAgICAg
ICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tY2xrLmMgICAgICAgICAgICAgICAgIHwg
IDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWNscHM3MTF4LmMgICAgICAgICAgICB8ICAxIC0NCj4g
IGRyaXZlcnMvcHdtL3B3bS1jcm9zLWVjLmMgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJz
L3B3bS9wd20tZHdjLmMgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdt
LWVwOTN4eC5jICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1mc2wtZnRt
LmMgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20taGlidnQuYyAgICAgICAg
ICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWltZy5jICAgICAgICAgICAgICAgICB8
ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1pbXgtdHBtLmMgICAgICAgICAgICAgfCAgMSAtDQo+
ICBkcml2ZXJzL3B3bS9wd20taW14MS5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVy
cy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3
bS1pbnRlbC1sZ20uYyAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20taXFzNjIw
YS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLWp6NDc0MC5jICAgICAg
ICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1rZWVtYmF5LmMgICAgICAgICAgICAg
fCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tbHAzOTQzLmMgICAgICAgICAgICAgIHwgIDEgLQ0K
PiAgZHJpdmVycy9wd20vcHdtLWxwYzE4eHgtc2N0LmMgICAgICAgICB8ICAxIC0NCj4gIGRyaXZl
cnMvcHdtL3B3bS1scGMzMnh4LmMgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9w
d20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLW1lZGlh
dGVrLmMgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jICAgICAg
ICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tbWljcm9jaGlwLWNvcmUuYyAgICAg
IHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLW10ay1kaXNwLmMgICAgICAgICAgICB8ICAxIC0N
Cj4gIGRyaXZlcnMvcHdtL3B3bS1teHMuYyAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2
ZXJzL3B3bS9wd20tbnR4ZWMuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20v
cHdtLW9tYXAtZG10aW1lci5jICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1wY2E5
Njg1LmMgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tcHhhLmMgICAgICAg
ICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXJhc3BiZXJyeXBpLXBvZS5jICAg
ICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1yY2FyLmMgICAgICAgICAgICAgICAgfCAgMSAt
DQo+ICBkcml2ZXJzL3B3bS9wd20tcmVuZXNhcy10cHUuYyAgICAgICAgIHwgIDEgLQ0KPiAgZHJp
dmVycy9wd20vcHdtLXJvY2tjaGlwLmMgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdt
L3B3bS1yei1tdHUzLmMgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tc2Ft
c3VuZy5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jICAg
ICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1zbDI4Y3BsZC5jICAgICAgICAg
ICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tc3BlYXIuYyAgICAgICAgICAgICAgIHwgIDEg
LQ0KPiAgZHJpdmVycy9wd20vcHdtLXNwcmQuYyAgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRy
aXZlcnMvcHdtL3B3bS1zdGkuYyAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3
bS9wd20tc3RtMzItbHAuYyAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXN0
bTMyLmMgICAgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS1zdG1wZS5jICAg
ICAgICAgICAgICAgfCAgMSAtDQo+ICBkcml2ZXJzL3B3bS9wd20tc3VuNGkuYyAgICAgICAgICAg
ICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXN1bnBsdXMuYyAgICAgICAgICAgICB8ICAx
IC0NCj4gIGRyaXZlcnMvcHdtL3B3bS10ZWdyYS5jICAgICAgICAgICAgICAgfCAgMSAtDQo+ICBk
cml2ZXJzL3B3bS9wd20tdGllY2FwLmMgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9w
d20vcHdtLXRpZWhycHdtLmMgICAgICAgICAgICB8ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS10
d2wtbGVkLmMgICAgICAgICAgICAgfCAgMiAtLQ0KPiAgZHJpdmVycy9wd20vcHdtLXR3bC5jICAg
ICAgICAgICAgICAgICB8ICAyIC0tDQo+ICBkcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYyAgICAg
ICAgICAgIHwgIDEgLQ0KPiAgZHJpdmVycy9wd20vcHdtLXZ0ODUwMC5jICAgICAgICAgICAgICB8
ICAxIC0NCj4gIGRyaXZlcnMvcHdtL3B3bS14aWxpbnguYyAgICAgICAgICAgICAgfCAgMSAtDQo+
ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyAgICAgICAgIHwgIDEgLQ0KPiAgaW5jbHVk
ZS9saW51eC9wd20uaCAgICAgICAgICAgICAgICAgICB8ICA4ICsrKysrLS0tDQo+ICA2OCBmaWxl
cyBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA4MCBkZWxldGlvbnMoLSkNCg0KW3NuaXBdDQoN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL2NvcmUuYyBiL2RyaXZlcnMvcHdtL2NvcmUuYw0K
PiBpbmRleCBkYzY2ZTM0MDViZjUuLjk2MDY5YzZkM2Q2OSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9wd20vY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvcHdtL2NvcmUuYw0KPiBAQCAtODksMTMgKzg5
LDEzIEBAIHN0YXRpYyBpbnQgcHdtX2RldmljZV9yZXF1ZXN0KHN0cnVjdCBwd21fZGV2aWNlICpw
d20sIGNvbnN0IGNoYXIgKmxhYmVsKQ0KPiAgCWlmICh0ZXN0X2JpdChQV01GX1JFUVVFU1RFRCwg
JnB3bS0+ZmxhZ3MpKQ0KPiAgCQlyZXR1cm4gLUVCVVNZOw0KPiAgDQo+IC0JaWYgKCF0cnlfbW9k
dWxlX2dldChwd20tPmNoaXAtPm9wcy0+b3duZXIpKQ0KPiArCWlmICghdHJ5X21vZHVsZV9nZXQo
cHdtLT5jaGlwLT5vd25lcikpDQo+ICAJCXJldHVybiAtRU5PREVWOw0KPiAgDQo+ICAJaWYgKHB3
bS0+Y2hpcC0+b3BzLT5yZXF1ZXN0KSB7DQo+ICAJCWVyciA9IHB3bS0+Y2hpcC0+b3BzLT5yZXF1
ZXN0KHB3bS0+Y2hpcCwgcHdtKTsNCj4gIAkJaWYgKGVycikgew0KPiAtCQkJbW9kdWxlX3B1dChw
d20tPmNoaXAtPm9wcy0+b3duZXIpOw0KPiArCQkJbW9kdWxlX3B1dChwd20tPmNoaXAtPm93bmVy
KTsNCj4gIAkJCXJldHVybiBlcnI7DQo+ICAJCX0NCj4gIAl9DQo+IEBAIC0yNTMsMTQgKzI1Mywx
NCBAQCBzdGF0aWMgYm9vbCBwd21fb3BzX2NoZWNrKGNvbnN0IHN0cnVjdCBwd21fY2hpcCAqY2hp
cCkNCj4gIH0NCj4gIA0KPiAgLyoqDQo+IC0gKiBwd21jaGlwX2FkZCgpIC0gcmVnaXN0ZXIgYSBu
ZXcgUFdNIGNoaXANCj4gKyAqIF9fcHdtY2hpcF9hZGQoKSAtIHJlZ2lzdGVyIGEgbmV3IFBXTSBj
aGlwDQo+ICAgKiBAY2hpcDogdGhlIFBXTSBjaGlwIHRvIGFkZA0KDQpNaXNzaW5nIGRvY3VtZW50
YXRpb24gZm9yIHRoZSBuZXcgb3duZXIgcGFyYW1ldGVyLg0KDQo+ICAgKg0KPiAgICogUmVnaXN0
ZXIgYSBuZXcgUFdNIGNoaXAuDQo+ICAgKg0KPiAgICogUmV0dXJuczogMCBvbiBzdWNjZXNzIG9y
IGEgbmVnYXRpdmUgZXJyb3IgY29kZSBvbiBmYWlsdXJlLg0KPiAgICovDQo+IC1pbnQgcHdtY2hp
cF9hZGQoc3RydWN0IHB3bV9jaGlwICpjaGlwKQ0KPiAraW50IF9fcHdtY2hpcF9hZGQoc3RydWN0
IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgbW9kdWxlICpvd25lcikNCj4gIHsNCj4gIAlzdHJ1Y3Qg
cHdtX2RldmljZSAqcHdtOw0KPiAgCXVuc2lnbmVkIGludCBpOw0KPiBAQCAtMjcyLDYgKzI3Miw4
IEBAIGludCBwd21jaGlwX2FkZChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApDQo+ICAJaWYgKCFwd21f
b3BzX2NoZWNrKGNoaXApKQ0KPiAgCQlyZXR1cm4gLUVJTlZBTDsNCj4gIA0KPiArCWNoaXAtPm93
bmVyID0gb3duZXI7DQo+ICsNCj4gIAljaGlwLT5wd21zID0ga2NhbGxvYyhjaGlwLT5ucHdtLCBz
aXplb2YoKnB3bSksIEdGUF9LRVJORUwpOw0KPiAgCWlmICghY2hpcC0+cHdtcykNCj4gIAkJcmV0
dXJuIC1FTk9NRU07DQo+IEBAIC0zMDYsNyArMzA4LDcgQEAgaW50IHB3bWNoaXBfYWRkKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCkNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiAtRVhQT1JUX1NZ
TUJPTF9HUEwocHdtY2hpcF9hZGQpOw0KPiArRVhQT1JUX1NZTUJPTF9HUEwoX19wd21jaGlwX2Fk
ZCk7DQo+ICANCj4gIC8qKg0KPiAgICogcHdtY2hpcF9yZW1vdmUoKSAtIHJlbW92ZSBhIFBXTSBj
aGlwDQo+IEBAIC0zMzgsMTcgKzM0MCwxNyBAQCBzdGF0aWMgdm9pZCBkZXZtX3B3bWNoaXBfcmVt
b3ZlKHZvaWQgKmRhdGEpDQo+ICAJcHdtY2hpcF9yZW1vdmUoY2hpcCk7DQo+ICB9DQo+ICANCj4g
LWludCBkZXZtX3B3bWNoaXBfYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IHB3bV9jaGlw
ICpjaGlwKQ0KPiAraW50IF9fZGV2bV9wd21jaGlwX2FkZChzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0
cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IG1vZHVsZSAqb3duZXIpDQo+ICB7DQo+ICAJaW50
IHJldDsNCj4gIA0KPiAtCXJldCA9IHB3bWNoaXBfYWRkKGNoaXApOw0KPiArCXJldCA9IF9fcHdt
Y2hpcF9hZGQoY2hpcCwgb3duZXIpOw0KPiAgCWlmIChyZXQpDQo+ICAJCXJldHVybiByZXQ7DQo+
ICANCj4gIAlyZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgZGV2bV9wd21jaGlw
X3JlbW92ZSwgY2hpcCk7DQo+ICB9DQo+IC1FWFBPUlRfU1lNQk9MX0dQTChkZXZtX3B3bWNoaXBf
YWRkKTsNCj4gK0VYUE9SVF9TWU1CT0xfR1BMKF9fZGV2bV9wd21jaGlwX2FkZCk7DQo+ICANCj4g
IC8qKg0KPiAgICogcHdtX3JlcXVlc3RfZnJvbV9jaGlwKCkgLSByZXF1ZXN0IGEgUFdNIGRldmlj
ZSByZWxhdGl2ZSB0byBhIFBXTSBjaGlwDQo+IEBAIC05NzksNyArOTgxLDcgQEAgdm9pZCBwd21f
cHV0KHN0cnVjdCBwd21fZGV2aWNlICpwd20pDQo+ICAJcHdtX3NldF9jaGlwX2RhdGEocHdtLCBO
VUxMKTsNCj4gIAlwd20tPmxhYmVsID0gTlVMTDsNCj4gIA0KPiAtCW1vZHVsZV9wdXQocHdtLT5j
aGlwLT5vcHMtPm93bmVyKTsNCj4gKwltb2R1bGVfcHV0KHB3bS0+Y2hpcC0+b3duZXIpOw0KPiAg
b3V0Og0KPiAgCW11dGV4X3VubG9jaygmcHdtX2xvY2spOw0KPiAgfQ0KDQpbc25pcF0NCg0KPiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wd20uaCBiL2luY2x1ZGUvbGludXgvcHdtLmgNCj4g
aW5kZXggZDJmOWY2OTBhOWMxLi5kOWZhMDExNGVkZmEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUv
bGludXgvcHdtLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9wd20uaA0KPiBAQCAtMjc4LDcgKzI3
OCw2IEBAIHN0cnVjdCBwd21fb3BzIHsNCj4gIAkJICAgICBjb25zdCBzdHJ1Y3QgcHdtX3N0YXRl
ICpzdGF0ZSk7DQo+ICAJaW50ICgqZ2V0X3N0YXRlKShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0
cnVjdCBwd21fZGV2aWNlICpwd20sDQo+ICAJCQkgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpOw0K
PiAtCXN0cnVjdCBtb2R1bGUgKm93bmVyOw0KPiAgfTsNCj4gIA0KPiAgLyoqDQoNCk1pc3Npbmcg
ZG9jdW1lbnRhdGlvbiB1cGRhdGUgaGVyZSB0b28sIGZvciBib3RoIHB3bV9vcHMgYW5kIHB3bV9j
aGlwLg0KDQo+IEBAIC0yOTUsNiArMjk0LDcgQEAgc3RydWN0IHB3bV9vcHMgew0KPiAgc3RydWN0
IHB3bV9jaGlwIHsNCj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXY7DQo+ICAJY29uc3Qgc3RydWN0IHB3
bV9vcHMgKm9wczsNCj4gKwlzdHJ1Y3QgbW9kdWxlICpvd25lcjsNCj4gIAlpbnQgYmFzZTsNCj4g
IAl1bnNpZ25lZCBpbnQgbnB3bTsNCj4gIA0KPiBAQCAtMzg2LDEwICszODYsMTIgQEAgaW50IHB3
bV9jYXB0dXJlKHN0cnVjdCBwd21fZGV2aWNlICpwd20sIHN0cnVjdCBwd21fY2FwdHVyZSAqcmVz
dWx0LA0KPiAgaW50IHB3bV9zZXRfY2hpcF9kYXRhKHN0cnVjdCBwd21fZGV2aWNlICpwd20sIHZv
aWQgKmRhdGEpOw0KPiAgdm9pZCAqcHdtX2dldF9jaGlwX2RhdGEoc3RydWN0IHB3bV9kZXZpY2Ug
KnB3bSk7DQo+ICANCj4gLWludCBwd21jaGlwX2FkZChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApOw0K
PiAraW50IF9fcHdtY2hpcF9hZGQoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgbW9kdWxl
ICpvd25lcik7DQo+ICsjZGVmaW5lIHB3bWNoaXBfYWRkKGNoaXApIF9fcHdtY2hpcF9hZGQoY2hp
cCwgVEhJU19NT0RVTEUpDQo+ICB2b2lkIHB3bWNoaXBfcmVtb3ZlKHN0cnVjdCBwd21fY2hpcCAq
Y2hpcCk7DQo+ICANCj4gLWludCBkZXZtX3B3bWNoaXBfYWRkKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IHB3bV9jaGlwICpjaGlwKTsNCj4gK2ludCBfX2Rldm1fcHdtY2hpcF9hZGQoc3RydWN0
IGRldmljZSAqZGV2LCBzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBtb2R1bGUgKm93bmVy
KTsNCj4gKyNkZWZpbmUgZGV2bV9wd21jaGlwX2FkZChkZXYsIGNoaXApIF9fZGV2bV9wd21jaGlw
X2FkZChkZXYsIGNoaXAsIFRISVNfTU9EVUxFKQ0KPiAgDQo+ICBzdHJ1Y3QgcHdtX2RldmljZSAq
cHdtX3JlcXVlc3RfZnJvbV9jaGlwKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwNCj4gIAkJCQkJIHVu
c2lnbmVkIGludCBpbmRleCwNCg0KLS0gDQpSZWdhcmRzLA0KDQpMYXVyZW50IFBpbmNoYXJ0DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNj
cmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
