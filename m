Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BDAEE83DD79
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 16:28:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAA0D40EBF
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 15:28:33 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 6E9723F00C
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 12:14:34 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZH-00049s-NK; Thu, 25 Jan 2024 13:10:51 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZE-002HRD-5b; Thu, 25 Jan 2024 13:10:48 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZD-007n0n-33;
	Thu, 25 Jan 2024 13:10:47 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	James Clark <james.clark@arm.com>,
	linux-pwm@vger.kernel.org,
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
	Alex Elder <elder@kernel.org>
Date: Thu, 25 Jan 2024 13:09:02 +0100
Message-ID: <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4472; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=Y70kt1S+wDMGZ2Y6dT7JBGkOh38DPB/mz0c9lW1w+go=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk9o1J7Qn6pSUgc2O5FQOVH47M2tNWcGfyzpg KqN39khZuCJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPaAAKCRCPgPtYfRL+ Tl7sCACDg65PvULF2T57x8s2GOVh8qHAOM4G2fEdFZQeFhZiTply5wW+kG5bIM1JAdU3cAiM96g uzfqnkdy2Mt6/lWu6ZhjqOk/xYUO80eOZ5e8cyRhQLGb4VsogRhDSOKSAf4k0fkzTYCdCM3jfwP QGXt5GRUeYGJVhDmUC7m1wai9vWlfWG8IXkVbSYnX3LqEAl0A40uaffDMUtp2bFtgHNqtqbGhx6 bM/vJXjzuqiGa8jiFMTuJ50PRpeh9o/6cre0EhT+nv5GQHpRaGSKnNf/E7Q0CK0tiRGYs7M9t6g 2w/lsv8+vxgUQ7yjIC7YwrqDMXW1+x7YTS/xwh76REfV7L9/
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6E9723F00C
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
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,linux.intel.com,huawei.com,google.com,arm.com,vger.kernel.org,marcan.st,svenpeter.dev,microchip.com,bootlin.com,tuxon.dev,broadcom.com,mail.ru,chromium.org,kernel.org,pengutronix.de,crapouillou.net,mleia.com,redhat.com,gmail.com,collabora.com,linaro.org,baylibre.com,gmx.net,sntech.de,dabbelt.com,sifive.com,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,bgdev.pl,intel.com,suse.de,ffwll.ch,ucw.cz,quicinc.com,vivo.com,z3ntu.xyz];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	URIBL_BLOCKED(0.00)[metis.whiteo.stw.pengutronix.de:helo,metis.whiteo.stw.pengutronix.de:rdns,pengutronix.de:email];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,rosenzweig.io,lists.linux.dev,lists.infradead.org,broadcom.com,chromium.org,gmail.com,nxp.com,baylibre.com,googlemail.com,samsung.com,st-md-mailman.stormreply.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[100];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[]
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: JZOVTQO44V2GI4PDJHBXMV2DI7SCF5V4
X-Message-ID-Hash: JZOVTQO44V2GI4PDJHBXMV2DI7SCF5V4
X-Mailman-Approved-At: Fri, 26 Jan 2024 15:28:21 +0000
CC: linux-doc@vger.kernel.org, kernel@pengutronix.de, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Laurent Pinchart <Laurent.pinchart@ide
 asonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5 040/111] pwm: Provide devm_pwmchip_alloc() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JZOVTQO44V2GI4PDJHBXMV2DI7SCF5V4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBmdW5jdGlvbiBhbGxvY2F0ZXMgYSBzdHJ1Y3QgcHdtX2NoaXAgYW5kIGRyaXZlciBkYXRh
LiBDb21wYXJlZCB0bw0KdGhlIHN0YXR1cyBxdW8gdGhlIHNwbGl0IGludG8gcHdtX2NoaXAgYW5k
IGRyaXZlciBkYXRhIGlzIG5ldywgb3RoZXJ3aXNlDQppdCBkb2Vzbid0IGNoYW5nZSBhbnl0aGlu
ZyByZWxldmFudCAoeWV0KS4NCg0KVGhlIGludGVudGlvbiBpcyB0aGF0IGFmdGVyIGFsbCBkcml2
ZXJzIGFyZSBzd2l0Y2hlZCB0byB1c2UgdGhpcw0KYWxsb2NhdGlvbiBmdW5jdGlvbiwgaXRzIHBv
c3NpYmxlIHRvIGFkZCBhIHN0cnVjdCBkZXZpY2UgdG8gc3RydWN0DQpwd21fY2hpcCB0byBwcm9w
ZXJseSB0cmFjayB0aGUgbGF0dGVyJ3MgbGlmZXRpbWUgd2l0aG91dCB0b3VjaGluZyBhbGwNCmRy
aXZlcnMgYWdhaW4uIFByb3BlciBsaWZldGltZSB0cmFja2luZyBpcyBhIG5lY2Vzc2FyeSBwcmVj
b25kaXRpb24gdG8NCmludHJvZHVjZSBjaGFyYWN0ZXIgZGV2aWNlIHN1cHBvcnQgZm9yIFBXTXMg
KHRoYXQgaW1wbGVtZW50cyBhdG9taWMNCnNldHRpbmcgYW5kIGRvZXNuJ3Qgc3VmZmVyIGZyb20g
dGhlIHN5c2ZzIG92ZXJoZWFkIG9mIHRoZSAvc3lzL2NsYXNzL3B3bQ0KdXNlcnNwYWNlIHN1cHBv
cnQpLg0KDQpUaGUgbmV3IGZ1bmN0aW9uIHB3bWNoaXBfcHJpdigpIChvYnZpb3VzbHk/KSBvbmx5
IHdvcmtzIGZvciBjaGlwcw0KYWxsb2NhdGVkIHdpdGggZGV2bV9wd21jaGlwX2FsbG9jKCkuDQoN
ClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0
cm9uaXguZGU+DQotLS0NCiAuLi4vZHJpdmVyLWFwaS9kcml2ZXItbW9kZWwvZGV2cmVzLnJzdCAg
ICAgICAgfCAgMSArDQogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QgICAgICAgICAg
ICAgIHwgMTAgKysrKy0tLS0NCiBkcml2ZXJzL3B3bS9jb3JlLmMgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAyNSArKysrKysrKysrKysrKysrKysrDQogaW5jbHVkZS9saW51eC9wd20uaCAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKysNCiA0IGZpbGVzIGNoYW5nZWQsIDMzIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9u
L2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QgYi9Eb2N1bWVudGF0aW9uL2RyaXZl
ci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QNCmluZGV4IGM1Zjk5ZDgzNGVjNS4uZTRkZjcy
YzQwOGQyIDEwMDY0NA0KLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL2RyaXZlci1tb2Rl
bC9kZXZyZXMucnN0DQorKysgYi9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVs
L2RldnJlcy5yc3QNCkBAIC00MjAsNiArNDIwLDcgQEAgUE9XRVINCiAgIGRldm1fcmVib290X21v
ZGVfdW5yZWdpc3RlcigpDQogDQogUFdNDQorICBkZXZtX3B3bWNoaXBfYWxsb2MoKQ0KICAgZGV2
bV9wd21jaGlwX2FkZCgpDQogICBkZXZtX3B3bV9nZXQoKQ0KICAgZGV2bV9md25vZGVfcHdtX2dl
dCgpDQpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QgYi9Eb2N1
bWVudGF0aW9uL2RyaXZlci1hcGkvcHdtLnJzdA0KaW5kZXggM2MyOGNjYzRiNjExLi5jZWU2NmM3
ZjAzMzUgMTAwNjQ0DQotLS0gYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcHdtLnJzdA0KKysr
IGIvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QNCkBAIC0xNDMsMTEgKzE0MywxMSBA
QCB0byBpbXBsZW1lbnQgdGhlIHB3bV8qKCkgZnVuY3Rpb25zIGl0c2VsZi4gVGhpcyBtZWFucyB0
aGF0IGl0J3MgaW1wb3NzaWJsZQ0KIHRvIGhhdmUgbXVsdGlwbGUgUFdNIGRyaXZlcnMgaW4gdGhl
IHN5c3RlbS4gRm9yIHRoaXMgcmVhc29uIGl0J3MgbWFuZGF0b3J5DQogZm9yIG5ldyBkcml2ZXJz
IHRvIHVzZSB0aGUgZ2VuZXJpYyBQV00gZnJhbWV3b3JrLg0KIA0KLUEgbmV3IFBXTSBjb250cm9s
bGVyL2NoaXAgY2FuIGJlIGFkZGVkIHVzaW5nIHB3bWNoaXBfYWRkKCkgYW5kIHJlbW92ZWQNCi1h
Z2FpbiB3aXRoIHB3bWNoaXBfcmVtb3ZlKCkuIHB3bWNoaXBfYWRkKCkgdGFrZXMgYSBmaWxsZWQg
aW4gc3RydWN0DQotcHdtX2NoaXAgYXMgYXJndW1lbnQgd2hpY2ggcHJvdmlkZXMgYSBkZXNjcmlw
dGlvbiBvZiB0aGUgUFdNIGNoaXAsIHRoZQ0KLW51bWJlciBvZiBQV00gZGV2aWNlcyBwcm92aWRl
ZCBieSB0aGUgY2hpcCBhbmQgdGhlIGNoaXAtc3BlY2lmaWMNCi1pbXBsZW1lbnRhdGlvbiBvZiB0
aGUgc3VwcG9ydGVkIFBXTSBvcGVyYXRpb25zIHRvIHRoZSBmcmFtZXdvcmsuDQorQSBuZXcgUFdN
IGNvbnRyb2xsZXIvY2hpcCBjYW4gYmUgYWxsb2NhdGVkIHVzaW5nIGRldm1fcHdtY2hpcF9hbGxv
YywgdGhlbiBhZGRlZA0KK3VzaW5nIHB3bWNoaXBfYWRkKCkgYW5kIHJlbW92ZWQgYWdhaW4gd2l0
aCBwd21jaGlwX3JlbW92ZSgpLiBwd21jaGlwX2FkZCgpDQordGFrZXMgYSBmaWxsZWQgaW4gc3Ry
dWN0IHB3bV9jaGlwIGFzIGFyZ3VtZW50IHdoaWNoIHByb3ZpZGVzIGEgZGVzY3JpcHRpb24gb2YN
Cit0aGUgUFdNIGNoaXAsIHRoZSBudW1iZXIgb2YgUFdNIGRldmljZXMgcHJvdmlkZWQgYnkgdGhl
IGNoaXAgYW5kIHRoZQ0KK2NoaXAtc3BlY2lmaWMgaW1wbGVtZW50YXRpb24gb2YgdGhlIHN1cHBv
cnRlZCBQV00gb3BlcmF0aW9ucyB0byB0aGUgZnJhbWV3b3JrLg0KIA0KIFdoZW4gaW1wbGVtZW50
aW5nIHBvbGFyaXR5IHN1cHBvcnQgaW4gYSBQV00gZHJpdmVyLCBtYWtlIHN1cmUgdG8gcmVzcGVj
dCB0aGUNCiBzaWduYWwgY29udmVudGlvbnMgaW4gdGhlIFBXTSBmcmFtZXdvcmsuIEJ5IGRlZmlu
aXRpb24sIG5vcm1hbCBwb2xhcml0eQ0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL2NvcmUuYyBi
L2RyaXZlcnMvcHdtL2NvcmUuYw0KaW5kZXggMWI0YzNkMGNhYTgyLi5iODIxYTJiMGIxNzIgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL3B3bS9jb3JlLmMNCisrKyBiL2RyaXZlcnMvcHdtL2NvcmUuYw0K
QEAgLTQ1NCw2ICs0NTQsMzEgQEAgb2ZfcHdtX3NpbmdsZV94bGF0ZShzdHJ1Y3QgcHdtX2NoaXAg
KmNoaXAsIGNvbnN0IHN0cnVjdCBvZl9waGFuZGxlX2FyZ3MgKmFyZ3MpDQogfQ0KIEVYUE9SVF9T
WU1CT0xfR1BMKG9mX3B3bV9zaW5nbGVfeGxhdGUpOw0KIA0KK3N0YXRpYyB2b2lkICpwd21jaGlw
X3ByaXYoc3RydWN0IHB3bV9jaGlwICpjaGlwKQ0KK3sNCisJcmV0dXJuICh2b2lkICopY2hpcCAr
IHNpemVvZigqY2hpcCk7DQorfQ0KKw0KK3N0cnVjdCBwd21fY2hpcCAqZGV2bV9wd21jaGlwX2Fs
bG9jKHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgdW5zaWduZWQgaW50IG5wd20sIHNpemVfdCBzaXpl
b2ZfcHJpdikNCit7DQorCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsNCisJc2l6ZV90IGFsbG9jX3Np
emU7DQorDQorCWFsbG9jX3NpemUgPSBzaXplX2FkZChzaXplb2YoKmNoaXApLCBzaXplb2ZfcHJp
dik7DQorDQorCWNoaXAgPSBkZXZtX2t6YWxsb2MocGFyZW50LCBhbGxvY19zaXplLCBHRlBfS0VS
TkVMKTsNCisJaWYgKCFjaGlwKQ0KKwkJcmV0dXJuIEVSUl9QVFIoLUVOT01FTSk7DQorDQorCWNo
aXAtPmRldiA9IHBhcmVudDsNCisJY2hpcC0+bnB3bSA9IG5wd207DQorDQorCXB3bWNoaXBfc2V0
X2RydmRhdGEoY2hpcCwgcHdtY2hpcF9wcml2KGNoaXApKTsNCisNCisJcmV0dXJuIGNoaXA7DQor
fQ0KK0VYUE9SVF9TWU1CT0xfR1BMKGRldm1fcHdtY2hpcF9hbGxvYyk7DQorDQogc3RhdGljIHZv
aWQgb2ZfcHdtY2hpcF9hZGQoc3RydWN0IHB3bV9jaGlwICpjaGlwKQ0KIHsNCiAJaWYgKCFjaGlw
LT5kZXYgfHwgIWNoaXAtPmRldi0+b2Zfbm9kZSkNCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L3B3bS5oIGIvaW5jbHVkZS9saW51eC9wd20uaA0KaW5kZXggMmM0OWQyZmUyZmU3Li44YmM3NTA0
YWE3ZDQgMTAwNjQ0DQotLS0gYS9pbmNsdWRlL2xpbnV4L3B3bS5oDQorKysgYi9pbmNsdWRlL2xp
bnV4L3B3bS5oDQpAQCAtNDAzLDYgKzQwMyw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwd21fbWln
aHRfc2xlZXAoc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkNCiBpbnQgcHdtX2NhcHR1cmUoc3RydWN0
IHB3bV9kZXZpY2UgKnB3bSwgc3RydWN0IHB3bV9jYXB0dXJlICpyZXN1bHQsDQogCQl1bnNpZ25l
ZCBsb25nIHRpbWVvdXQpOw0KIA0KK3N0cnVjdCBwd21fY2hpcCAqZGV2bV9wd21jaGlwX2FsbG9j
KHN0cnVjdCBkZXZpY2UgKnBhcmVudCwgdW5zaWduZWQgaW50IG5wd20sIHNpemVfdCBzaXplb2Zf
cHJpdik7DQorDQogaW50IF9fcHdtY2hpcF9hZGQoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1
Y3QgbW9kdWxlICpvd25lcik7DQogI2RlZmluZSBwd21jaGlwX2FkZChjaGlwKSBfX3B3bWNoaXBf
YWRkKGNoaXAsIFRISVNfTU9EVUxFKQ0KIHZvaWQgcHdtY2hpcF9yZW1vdmUoc3RydWN0IHB3bV9j
aGlwICpjaGlwKTsNCi0tIA0KMi40My4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1
cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
