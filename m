Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB6F76EBD9
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Aug 2023 16:09:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2293343F03
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Aug 2023 14:09:05 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 05B113E9F1
	for <greybus-dev@lists.linaro.org>; Thu,  3 Aug 2023 14:08:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRYyZ-0006mV-Nr; Thu, 03 Aug 2023 16:06:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRYyN-000rBF-In; Thu, 03 Aug 2023 16:06:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qRYyM-00A9kB-Jk; Thu, 03 Aug 2023 16:06:38 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Date: Thu,  3 Aug 2023 16:06:30 +0200
Message-Id: <20230803140633.138165-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4136; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=fUIfC654WxtfT7CEJ8mGT4DHYTt22edc6EeQOO0mgBU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBky7RhOm8jkQTlEYB5GsZS8El0/H9apHFEdsZFO x8y+5Ja40OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZMu0YQAKCRCPgPtYfRL+ TsJcB/90L6hN+ip+TjX3AzflYEmXfAvsD7DvqLlndSD4q7tLpczaexF3R7J6u81XciSqOUe2jgL ZFH92dwUdpov0xdqiWraRK+aZJ+b0W4jpGsrqqlhoMdolr0pAB7fIFytPguywOKD62dbKy1CvL1 Dhl29UAwsXqsIV7jcTR/3lRLsFUwN9/STI8/IVeD4JJHoLv16c1Q61uVC/I22L/ivskcK9F/YQX 7it5vFhz9lfLpr79GuNQ3+d+atoBJRDfjCnDak/HWaR9JRk7b7F8pb+oq6ih+R2INrvw1jlBxDW 1b3cg6OWSLaXTh/Y3/NSkgaZz/kG8/JbVRjAFD6tfDS0KfZO
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 05B113E9F1
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_TO(0.00)[gmail.com];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	MIME_TRACE(0.00)[0:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,chromium.org,intel.com,ideasonboard.com,kwiboo.se,gmail.com,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,walle.cc,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_RCPT(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de]
Message-ID-Hash: 5EMLVBLEJ4OGF75RWJ4SSX4UVEO3IYNG
X-Message-ID-Hash: 5EMLVBLEJ4OGF75RWJ4SSX4UVEO3IYNG
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <s
 hc_work@mail.ru>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?utf-8?q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, Or
 son Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists
 .infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5EMLVBLEJ4OGF75RWJ4SSX4UVEO3IYNG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCndoaWxlIHdvcmtpbmcgb24gdGhlIHB3bSBjb3JlIEkgbm90aWNlZCB0aGF0IHB3
bS1jcmMgZG9lc24ndCBhc3NpZ24NCi5vd25lciBpbiBpdHMgcHdtX29wcyBzdHJ1Y3R1cmUuIFRo
aXMgaXNuJ3QgYSBwcm9ibGVtIGluIHByYWN0aXNlIHRob3VnaA0KYXMgdGhpcyBkcml2ZXIgY2Fu
IG9ubHkgYmUgY29tcGlsZWQgYnVpbHQtaW4gKHVwIHRvIG5vdykuDQoNClN0aWxsIHByZXZlbnQg
ZnV0dXJlIHB3bSBkcml2ZXJzIG5vdCBhc3NpZ25pbmcgLm93bmVyIGJ5IHdyYXBwaW5nDQpwd21j
aGlwX2FkZCgpIGluIGEgbWFjcm8gdGhhdCBhdXRvbWF0ZXMgb3duZXIgaGFuZGxpbmcgc2ltcGxp
ZnlpbmcgZWFjaA0KZHJpdmVyIGEgKHRpbnkpIGJpdC4NCg0KSSBhbHNvIGZvdW5kIHRoYXQgdGhl
cmUgaXMgbm8gaGFyZCByZWFzb24gdG8gb25seSBjb21waWxlIHB3bS1jcmMgYXMgYQ0KYnVpbHQt
aW4gb24geDg2LCBzbyB0aGlzIGxpbWl0YXRpb24gaXMgbGlmdGVkIGluIHRoZSBzZWNvbmQgcGF0
Y2guDQoNCkJlc3QgcmVnYXJkcw0KVXdlDQoNClV3ZSBLbGVpbmUtS8O2bmlnICgyKToNCiAgcHdt
OiBNYW5hZ2Ugb3duZXIgYXNzaWdubWVudCBpbXBsaWNpdGx5IGZvciBkcml2ZXJzDQogIHB3bTog
Y3JjOiBBbGxvdyBjb21waWxhdGlvbiBhcyBtb2R1bGUgYW5kIHdpdGggQ09NUElMRV9URVNUDQoN
CiBkcml2ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMv
Z3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMgfCAgMSAtDQogZHJpdmVycy9sZWRzL3JnYi9s
ZWRzLXFjb20tbHBnLmMgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9LY29uZmlnICAgICAgICAg
ICAgICAgICAgIHwgIDQgKystLQ0KIGRyaXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAgICAgICAg
ICAgfCAyMCArKysrKysrKysrKy0tLS0tLS0tLQ0KIGRyaXZlcnMvcHdtL3B3bS1hYjg1MDAuYyAg
ICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWFwcGxlLmMgICAgICAgICAgICAg
ICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tYXRtZWwtaGxjZGMuYyAgICAgICAgIHwgIDEgLQ0K
IGRyaXZlcnMvcHdtL3B3bS1hdG1lbC10Y2IuYyAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9w
d20vcHdtLWF0bWVsLmMgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tYmNt
LWlwcm9jLmMgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1iY20ta29uYS5jICAg
ICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWJjbTI4MzUuYyAgICAgICAgICAgICB8
ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tYmVybGluLmMgICAgICAgICAgICAgIHwgIDEgLQ0KIGRy
aXZlcnMvcHdtL3B3bS1icmNtc3RiLmMgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20v
cHdtLWNsay5jICAgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tY2xwczcx
MXguYyAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1jcmMuYyAgICAgICAgICAg
ICAgICAgfCAgNSArKysrLQ0KIGRyaXZlcnMvcHdtL3B3bS1jcm9zLWVjLmMgICAgICAgICAgICAg
fCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWR3Yy5jICAgICAgICAgICAgICAgICB8ICAxIC0NCiBk
cml2ZXJzL3B3bS9wd20tZXA5M3h4LmMgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdt
L3B3bS1mc2wtZnRtLmMgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWhpYnZ0
LmMgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20taW1nLmMgICAgICAgICAg
ICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1pbXgtdHBtLmMgICAgICAgICAgICAgfCAg
MSAtDQogZHJpdmVycy9wd20vcHdtLWlteDEuYyAgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2
ZXJzL3B3bS9wd20taW14MjcuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3
bS1pbnRlbC1sZ20uYyAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWlxczYyMGEu
YyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tano0NzQwLmMgICAgICAgICAg
ICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1rZWVtYmF5LmMgICAgICAgICAgICAgfCAgMSAt
DQogZHJpdmVycy9wd20vcHdtLWxwMzk0My5jICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJz
L3B3bS9wd20tbHBjMTh4eC1zY3QuYyAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1s
cGMzMnh4LmMgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLWxwc3MuYyAgICAg
ICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tbWVkaWF0ZWsuYyAgICAgICAgICAg
IHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1tZXNvbi5jICAgICAgICAgICAgICAgfCAgMSAtDQog
ZHJpdmVycy9wd20vcHdtLW1pY3JvY2hpcC1jb3JlLmMgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3
bS9wd20tbXRrLWRpc3AuYyAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1teHMu
YyAgICAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLW50eGVjLmMgICAgICAg
ICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tb21hcC1kbXRpbWVyLmMgICAgICAgIHwg
IDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1wY2E5Njg1LmMgICAgICAgICAgICAgfCAgMSAtDQogZHJp
dmVycy9wd20vcHdtLXB4YS5jICAgICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9w
d20tcmFzcGJlcnJ5cGktcG9lLmMgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1yY2FyLmMg
ICAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXJlbmVzYXMtdHB1LmMgICAg
ICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tcm9ja2NoaXAuYyAgICAgICAgICAgIHwgIDEg
LQ0KIGRyaXZlcnMvcHdtL3B3bS1yei1tdHUzLmMgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVy
cy9wd20vcHdtLXNhbXN1bmcuYyAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20t
c2lmaXZlLmMgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1zbDI4Y3BsZC5j
ICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXNwZWFyLmMgICAgICAgICAgICAg
ICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tc3ByZC5jICAgICAgICAgICAgICAgIHwgIDEgLQ0K
IGRyaXZlcnMvcHdtL3B3bS1zdGkuYyAgICAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9w
d20vcHdtLXN0bTMyLWxwLmMgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tc3Rt
MzIuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS1zdG1wZS5jICAgICAg
ICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgICAgICB8
ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAgICAgICAgIHwgIDEgLQ0KIGRy
aXZlcnMvcHdtL3B3bS10ZWdyYS5jICAgICAgICAgICAgICAgfCAgMSAtDQogZHJpdmVycy9wd20v
cHdtLXRpZWNhcC5jICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9wd20tdGllaHJw
d20uYyAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvcHdtL3B3bS10d2wtbGVkLmMgICAgICAg
ICAgICAgfCAgMiAtLQ0KIGRyaXZlcnMvcHdtL3B3bS10d2wuYyAgICAgICAgICAgICAgICAgfCAg
MiAtLQ0KIGRyaXZlcnMvcHdtL3B3bS12aXNjb250aS5jICAgICAgICAgICAgfCAgMSAtDQogZHJp
dmVycy9wd20vcHdtLXZ0ODUwMC5jICAgICAgICAgICAgICB8ICAxIC0NCiBkcml2ZXJzL3B3bS9w
d20teGlsaW54LmMgICAgICAgICAgICAgIHwgIDEgLQ0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3B3bS5jICAgICAgICAgfCAgMSAtDQogaW5jbHVkZS9saW51eC9wd20uaCAgICAgICAgICAgICAg
ICAgICB8ICA4ICsrKysrLS0tDQogNzAgZmlsZXMgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKSwg
ODMgZGVsZXRpb25zKC0pDQoNCg0KYmFzZS1jb21taXQ6IDNjY2IxNzlhYTQwZDkzMWViMDBlZjg5
MTBkN2I4MTJhOTU2NTk1NjMNCi0tIA0KMi4zOS4yDQoNCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8g
Z3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
