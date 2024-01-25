Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A022583C252
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 13:14:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A7B3740123
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 12:14:29 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 070F53F00C
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 12:14:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZH-00048C-Nh; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZD-002HR8-To; Thu, 25 Jan 2024 13:10:47 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZD-007n0k-2K;
	Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Alexander Shiyan <shc_work@mail.ru>,
	Benson Leung <bleung@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	=?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
	Heiko Stuebner <heiko@sntech.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <mwalle@kernel.org>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sean Anderson <sean.anderson@seco.com>,
	Michal Simek <michal.simek@amd.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Anjelique Melendez <quic_amelende@quicinc.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Lu Hongfei <luhongfei@vivo.com>,
	Bjorn Andersson <quic_bjorande@quicinc.com>,
	Luca Weiss <luca@z3ntu.xyz>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 25 Jan 2024 13:09:01 +0100
Message-ID: <1c873808bfc93ab51f49be799334dee6e8ab398a.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1920; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=xFZHrY/7C9PRNt99L0vl8g6j3yX1l4H0eIirFXKiC6s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9naZ43cfZqRmm0PAwRVRHazfdHqUBSCmiRl 7SkEynbJGKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPZwAKCRCPgPtYfRL+ TqyWB/0Xq9H2qxz5a4NBliO3W2OBOYrNCAIPS+YFIK+/psR+8hFCNvRcL8LkTcvrGhz+wH1p+Pb F64/cTSgbYddbvZjoDx1kSNtuKvpvYsZy3B/swnxRBzzhjM4qRl0nLRqI7tuxKsMoJ6KChrenmP ZHuoEbNaT3Jq0uJ3jCQX+OWAPfMUgSkbUr5A7m+b7JrBvE1+EcTZ0ltF9cqru7Gex1/GIk5STLR s4XqyNlr+QqQS2lKFYFTNPQKFohdM4YpL+GcQjYEZZG2zihg6J+r6Mx1mefplrODntBtd+WIXCL uGNCMjCbN1xcJ1N2Xx2QisJNxxGcBaZCqQD7Iqx5HLe1eACQ
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 070F53F00C
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[vger.kernel.org,marcan.st,svenpeter.dev,microchip.com,bootlin.com,tuxon.dev,broadcom.com,mail.ru,chromium.org,kernel.org,pengutronix.de,crapouillou.net,mleia.com,redhat.com,linux.intel.com,gmail.com,collabora.com,linaro.org,baylibre.com,gmx.net,sntech.de,dabbelt.com,sifive.com,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,bgdev.pl,intel.com,suse.de,ffwll.ch,ucw.cz,quicinc.com,vivo.com,z3ntu.xyz,linuxfoundation.org];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	URIBL_BLOCKED(0.00)[metis.whiteo.stw.pengutronix.de:helo,metis.whiteo.stw.pengutronix.de:rdns,pengutronix.de:email];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,rosenzweig.io,lists.linux.dev,lists.infradead.org,broadcom.com,chromium.org,gmail.com,nxp.com,vger.kernel.org,baylibre.com,googlemail.com,samsung.com,st-md-mailman.stormreply.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[94];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[]
Message-ID-Hash: UM2WHQMWCESHTZXTG36Q4UEY6SD6WHTL
X-Message-ID-Hash: UM2WHQMWCESHTZXTG36Q4UEY6SD6WHTL
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kernel@pengutronix.de, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlm
 an <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5 039/111] pwm: Provide wrappers for storing and getting driver private data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UM2WHQMWCESHTZXTG36Q4UEY6SD6WHTL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlc2UgZnVuY3Rpb25zIGFyZSB1c2VmdWwgdG8gc3RvcmUgYW5kIHF1ZXJ5IGRyaXZlciBwcml2
YXRlIGRhdGEgYQ0KQWZ0ZXIgc3RydWN0IHB3bV9jaGlwIGdvdCBpdHMgb3duIHN0cnVjdCBkZXZp
Y2UsIHRoaXMgY2FuIG1ha2UgdXNlIG9mDQpkZXZfZ2V0X2RydmRhdGEoKSBhbmQgZGV2X3NldF9k
cnZkYXRhKCkgb24gdGhhdCBkZXZpY2UuICBUaGVzZSBmdW5jdGlvbnMNCmFyZSByZXF1aXJlZCBh
bHJlYWR5IG5vdyB0byBjb252ZXJ0IGRyaXZlcnMgdG8gcHdtY2hpcF9hbGxvYygpIHdoaWNoDQpt
dXN0IGhhcHBlbiBiZWZvcmUgY2hhbmdpbmcgcHdtX2NoaXA6OmRldi4NCg0KU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCi0t
LQ0KIGluY2x1ZGUvbGludXgvcHdtLmggfCAyMCArKysrKysrKysrKysrKysrKysrKw0KIDEgZmls
ZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspDQoNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3B3bS5oIGIvaW5jbHVkZS9saW51eC9wd20uaA0KaW5kZXggZDc5NjY5MThmMzAxLi4yYzQ5ZDJm
ZTJmZTcgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2xpbnV4L3B3bS5oDQorKysgYi9pbmNsdWRlL2xp
bnV4L3B3bS5oDQpAQCAtMjcyLDYgKzI3Miw3IEBAIHN0cnVjdCBwd21fb3BzIHsNCiAgKiBAbnB3
bTogbnVtYmVyIG9mIFBXTXMgY29udHJvbGxlZCBieSB0aGlzIGNoaXANCiAgKiBAb2ZfeGxhdGU6
IHJlcXVlc3QgYSBQV00gZGV2aWNlIGdpdmVuIGEgZGV2aWNlIHRyZWUgUFdNIHNwZWNpZmllcg0K
ICAqIEBhdG9taWM6IGNhbiB0aGUgZHJpdmVyJ3MgLT5hcHBseSgpIGJlIGNhbGxlZCBpbiBhdG9t
aWMgY29udGV4dA0KKyAqIEBkcml2ZXJfZGF0YTogUHJpdmF0ZSBwb2ludGVyIGZvciBkcml2ZXIg
c3BlY2lmaWMgaW5mbw0KICAqIEBwd21zOiBhcnJheSBvZiBQV00gZGV2aWNlcyBhbGxvY2F0ZWQg
YnkgdGhlIGZyYW1ld29yaw0KICAqLw0KIHN0cnVjdCBwd21fY2hpcCB7DQpAQCAtMjg2LDYgKzI4
Nyw3IEBAIHN0cnVjdCBwd21fY2hpcCB7DQogCWJvb2wgYXRvbWljOw0KIA0KIAkvKiBvbmx5IHVz
ZWQgaW50ZXJuYWxseSBieSB0aGUgUFdNIGZyYW1ld29yayAqLw0KKwl2b2lkICpkcml2ZXJfZGF0
YTsNCiAJc3RydWN0IHB3bV9kZXZpY2UgKnB3bXM7DQogfTsNCiANCkBAIC0yOTQsNiArMjk2LDI0
IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRldmljZSAqcHdtY2hpcF9wYXJlbnQoc3RydWN0IHB3
bV9jaGlwICpjaGlwKQ0KIAlyZXR1cm4gY2hpcC0+ZGV2Ow0KIH0NCiANCitzdGF0aWMgaW5saW5l
IHZvaWQgKnB3bWNoaXBfZ2V0X2RydmRhdGEoc3RydWN0IHB3bV9jaGlwICpjaGlwKQ0KK3sNCisJ
LyoNCisJICogQWZ0ZXIgcHdtX2NoaXAgZ290IGEgZGVkaWNhdGVkIHN0cnVjdCBkZXZpY2UsIHRo
aXMgY2FuIGJlIHJlcGxhY2VkIGJ5DQorCSAqIGRldl9nZXRfZHJ2ZGF0YSgmY2hpcC0+ZGV2KTsN
CisJICovDQorCXJldHVybiBjaGlwLT5kcml2ZXJfZGF0YTsNCit9DQorDQorc3RhdGljIGlubGlu
ZSB2b2lkIHB3bWNoaXBfc2V0X2RydmRhdGEoc3RydWN0IHB3bV9jaGlwICpjaGlwLCB2b2lkICpk
YXRhKQ0KK3sNCisJLyoNCisJICogQWZ0ZXIgcHdtX2NoaXAgZ290IGEgZGVkaWNhdGVkIHN0cnVj
dCBkZXZpY2UsIHRoaXMgY2FuIGJlIHJlcGxhY2VkIGJ5DQorCSAqIGRldl9zZXRfZHJ2ZGF0YSgm
Y2hpcC0+ZGV2LCBkYXRhKTsNCisJICovDQorCWNoaXAtPmRyaXZlcl9kYXRhID0gZGF0YTsNCit9
DQorDQogI2lmIElTX0VOQUJMRUQoQ09ORklHX1BXTSkNCiAvKiBQV00gdXNlciBBUElzICovDQog
aW50IHB3bV9hcHBseV9taWdodF9zbGVlcChzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLCBjb25zdCBz
dHJ1Y3QgcHdtX3N0YXRlICpzdGF0ZSk7DQotLSANCjIuNDMuMA0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
