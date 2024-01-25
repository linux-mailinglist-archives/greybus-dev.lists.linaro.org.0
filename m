Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C2483C243
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 13:13:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3CC8840C81
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 12:13:45 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id B103A3F00C
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 12:13:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZB-0003Ze-Mz; Thu, 25 Jan 2024 13:10:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ6-002HOt-Gy; Thu, 25 Jan 2024 13:10:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rSyZ6-007myG-1E;
	Thu, 25 Jan 2024 13:10:40 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 25 Jan 2024 13:08:25 +0100
Message-ID: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=SfOslAbsyBLEr/955V0luBriAR1MBuqlRLojueDMWPA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlsk89sMCb69Ns1+4RognQQiOh0kwtwTRgZqZe7 Qr1BL64ZR+JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZbJPPQAKCRCPgPtYfRL+ Tm5ICACqUZnuAnSjFfXrvBpLBI7tlj8WA+HQMKQ6Zc+N4XX6ETnakaKJsM+x6j+q4etOxq2c/gZ zxT7BpN14RbPiCl4D8hdIHJMFSxpOXgFMhHn6G0CiQZKij7FYNQcIit0BAKORd4VGZ3VwABrQ/Y OjjIIjxHWR1qdMK2N2kNbFpbTf4/2PRkxMHdXTJcAMAnSGWqM6H23gUlqytwn6NbEab8dDUgmkC dj7M9Z8Ubq9AofnoudLfMHIY54wLfZ0PkykBosZOeOLWLjqyM0qMfK6/MVn1CgVUVr75LWffVka lOK3tBDX44i4Xzm74nXYI2dfx77u3aY3K3mXE4UoCo8Z6Cl7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B103A3F00C
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
	FREEMAIL_TO(0.00)[vger.kernel.org,tuxon.dev,microchip.com,bootlin.com,broadcom.com,chromium.org,kernel.org,pengutronix.de,crapouillou.net,gmail.com,collabora.com,linaro.org,baylibre.com,dabbelt.com,sifive.com,foss.st.com,csie.org,sholland.org,intel.com,linux.intel.com,suse.de,ffwll.ch,linuxfoundation.org];
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	URIBL_BLOCKED(0.00)[metis.whiteo.stw.pengutronix.de:helo,metis.whiteo.stw.pengutronix.de:rdns,pengutronix.de:email];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,broadcom.com,chromium.org,lists.linux.dev,gmail.com,nxp.com,vger.kernel.org,baylibre.com,googlemail.com,samsung.com,st-md-mailman.stormreply.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,lists.linaro.org];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[58];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[]
Message-ID-Hash: NY5XHD52QGZFTLQMPJNJTLQHB244KCL2
X-Message-ID-Hash: NY5XHD52QGZFTLQMPJNJTLQHB244KCL2
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v5 003/111] pwm: Provide a macro to get the parent device of a given chip
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NY5XHD52QGZFTLQMPJNJTLQHB244KCL2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q3VycmVudGx5IGEgcHdtX2NoaXAgc3RvcmVzIGluIGl0cyBzdHJ1Y3QgZGV2aWNlICpkZXYgbWVt
YmVyIGEgcG9pbnRlcg0KdG8gdGhlIHBhcmVudCBkZXZpY2UuIFByZXBhcmluZyBhIGNoYW5nZSB0
aGF0IGVtYmVkcyBhIGZ1bGwgc3RydWN0DQpkZXZpY2UgaW4gc3RydWN0IHB3bV9jaGlwLCB0aGlz
IGFjY2Vzc29yIG1hY3JvIHNob3VsZCBiZSB1c2VkIGluIGFsbA0KZHJpdmVycyBkaXJlY3RseSBh
Y2Nlc3NpbmcgY2hpcC0+ZGV2IG5vdy4gVGhpcyB3YXkgc3RydWN0IHB3bV9jaGlwIGFuZA0KdGhp
cyBtYWNybyBjYW4gYmUgY2hhbmdlZCB3aXRob3V0IGhhdmluZyB0byB0b3VjaCBhbGwgZHJpdmVy
cyBpbiB0aGUNCnNhbWUgY2hhbmdlIHNldC4NCg0KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1L
w7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCi0tLQ0KIGluY2x1ZGUvbGlu
dXgvcHdtLmggfCA1ICsrKysrDQogMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQ0KDQpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9wd20uaCBiL2luY2x1ZGUvbGludXgvcHdtLmgNCmlu
ZGV4IDhmZmU5YWU3YTIzYS4uZDc5NjY5MThmMzAxIDEwMDY0NA0KLS0tIGEvaW5jbHVkZS9saW51
eC9wd20uaA0KKysrIGIvaW5jbHVkZS9saW51eC9wd20uaA0KQEAgLTI4OSw2ICsyODksMTEgQEAg
c3RydWN0IHB3bV9jaGlwIHsNCiAJc3RydWN0IHB3bV9kZXZpY2UgKnB3bXM7DQogfTsNCiANCitz
dGF0aWMgaW5saW5lIHN0cnVjdCBkZXZpY2UgKnB3bWNoaXBfcGFyZW50KHN0cnVjdCBwd21fY2hp
cCAqY2hpcCkNCit7DQorCXJldHVybiBjaGlwLT5kZXY7DQorfQ0KKw0KICNpZiBJU19FTkFCTEVE
KENPTkZJR19QV00pDQogLyogUFdNIHVzZXIgQVBJcyAqLw0KIGludCBwd21fYXBwbHlfbWlnaHRf
c2xlZXAoc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3Rh
dGUpOw0KLS0gDQoyLjQzLjANCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
