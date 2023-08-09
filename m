Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D716E77B7A4
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Aug 2023 13:32:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 738443EA1B
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Aug 2023 11:32:23 +0000 (UTC)
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	by lists.linaro.org (Postfix) with ESMTPS id 7339C3EC47
	for <greybus-dev@lists.linaro.org>; Wed,  9 Aug 2023 13:38:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=walle.cc header.s=mail2022082101 header.b=r4wKl3ih;
	spf=pass (lists.linaro.org: domain of michael@walle.cc designates 159.69.201.130 as permitted sender) smtp.mailfrom=michael@walle.cc;
	dmarc=pass (policy=quarantine) header.from=walle.cc
Received: from 3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 18516124F;
	Wed,  9 Aug 2023 15:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1691588293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8Btky6tTdvG25ZLsauzNmPRJKTtp0p2jrZzqQzvClL8=;
	b=r4wKl3ihNbNJWLLG5hf4K10pWKB/qcqJZWT79pdX14Hwy6cFCNoDp523ysrGvSxR0hF0sV
	S19UUVxjs0tcqcFDwaa/NkVjQnAj2+cyBE5RQNYWGpyiW44j/FWxQygtTL+wtS+237ZPBi
	AtOsW9She/DFFxiMreuzoOh5io7RuXTgqIlbCCUn4LHHa90Z+A4PZo97sfdrSy4KQLmkYs
	hhFi301ZV0pK+bOMSJlqwINPWSXFfHk08E4h61f4wk1UScNwCWh6iBthi3AlIm+EDBA4U6
	GVakjg8rtPJGDbRJZnIXlKnvbOR8bknUPLybW2kI3kAAfIaJexJ1gSpJk2GYOw==
MIME-Version: 1.0
Date: Wed, 09 Aug 2023 15:38:12 +0200
From: Michael Walle <michael@walle.cc>
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Message-ID: <a6ba206a709b2f4f1c817df8c868a683@walle.cc>
X-Sender: michael@walle.cc
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7339C3EC47
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.90 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[walle.cc,quarantine];
	RCVD_IN_DNSWL_HI(-0.50)[159.69.201.130:from];
	R_DKIM_ALLOW(-0.20)[walle.cc:s=mail2022082101];
	R_SPF_ALLOW(-0.20)[+mx];
	ONCE_RECEIVED(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,linaro.org,bgdev.pl,kernel.org,chromium.org,intel.com,kwiboo.se,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,quicinc.com,z3ntu.xyz,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[88];
	ARC_NA(0.00)[];
	RCVD_IN_DNSWL_FAIL(0.00)[2a01:4f8:c0c:9d57::1:server fail];
	RCVD_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[walle.cc:+];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	MIME_TRACE(0.00)[0:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: michael@walle.cc
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4COB5YRMQVN6TTMZGPCKRJ5QDNK6PDZH
X-Message-ID-Hash: 4COB5YRMQVN6TTMZGPCKRJ5QDNK6PDZH
X-Mailman-Approved-At: Mon, 14 Aug 2023 11:32:17 +0000
CC: Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.
 fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?Q?Jonathan_Neusch?= =?UTF-8?Q?=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.wa
 lmsley@sifive.com>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradea
 d.org, chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4COB5YRMQVN6TTMZGPCKRJ5QDNK6PDZH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGksDQoNCj4gSW5zdGVhZCBvZiByZXF1aXJpbmcgZWFjaCBkcml2ZXIgdG8gY2FyZSBmb3IgYXNz
aWduaW5nIHRoZSBvd25lciBtZW1iZXINCj4gb2Ygc3RydWN0IHB3bV9vcHMsIGhhbmRsZSB0aGF0
IGltcGxpY2l0bHkgdXNpbmcgYSBtYWNyby4gTm90ZSB0aGF0IHRoZQ0KPiBvd25lciBtZW1iZXIg
aGFzIHRvIGJlIG1vdmVkIHRvIHN0cnVjdCBwd21fY2hpcCwgYXMgdGhlIG9wcyBzdHJ1Y3R1cmUN
Cj4gdXN1YWxseSBsaXZlcyBpbiByZWFkLW9ubHkgbWVtb3J5IGFuZCBzbyBjYW5ub3QgYmUgbW9k
aWZpZWQuDQo+IA0KPiBUaGUgdXBzaWRlIGlzIHRoYXQgbmV3IGxvd2xldmVsIGRyaXZlcnMgY2Fu
bm90IGZvcmdldCB0aGUgYXNzaWdubWVudCANCj4gYW5kDQo+IHNhdmUgb25lIGxpbmUgZWFjaC4g
VGhlIHB3bS1jcmMgZHJpdmVyIGRpZG4ndCBhc3NpZ24gLm93bmVyLCB0aGF0J3Mgbm90DQo+IGEg
cHJvYmxlbSBpbiBwcmFjdGlzZSB0aG91Z2ggYXMgdGhlIGRyaXZlciBjYW5ub3QgYmUgY29tcGls
ZWQgYXMgYQ0KPiBtb2R1bGUuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5p
ZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KDQouLi4NCg0KPiAgZHJpdmVycy9w
d20vcHdtLXNsMjhjcGxkLmMgICAgICAgICAgICB8ICAxIC0NCg0KQWNrZWQtYnk6IE1pY2hhZWwg
V2FsbGUgPG1pY2hhZWxAd2FsbGUuY2M+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMt
ZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
