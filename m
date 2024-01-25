Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4069783DD7B
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 16:28:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4500F40121
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 15:28:46 +0000 (UTC)
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	by lists.linaro.org (Postfix) with ESMTPS id 63AAC3F3AC
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 14:14:39 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=collabora.com header.s=mail header.b=nSMrqxBc;
	dmarc=pass (policy=quarantine) header.from=collabora.com;
	spf=pass (lists.linaro.org: domain of angelogioacchino.delregno@collabora.com designates 46.235.227.194 as permitted sender) smtp.mailfrom=angelogioacchino.delregno@collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706192078;
	bh=xuWotEzSelSVBqWujYKbIOXX960an6aLcCPwqSUkjtM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nSMrqxBc5B0zoxSh7oM+5Fjyr3Ev/UxHPkW05LIh9tqvVs8PD+gCaNAqlz5QsrhBH
	 HbSRK9bawmsg86dsQH2IjMpDCUePRyRF5oM8aEVzAti4uMMz1HRIpPYLi32u2KBQJ+
	 AliVBErnUM3jUPU81ZHJPCNYmhPMgUeAyPCVcAL4Hih1LBsQ2CGmIALnpwgLpButSL
	 rbFGcAbYC6BY3TnD/ujgbQgo1zc9++xbkTUK6KOdcjliB5wx4T3j9bIncv2DioZft3
	 9ALNYJlMlexd763yE/DkmWdIt93ZLBCvhepEUEmz9UsnHPTMiD95fyECCAAuyLjyhN
	 8xG5LCL5+b38A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 3B7E43782057;
	Thu, 25 Jan 2024 14:14:35 +0000 (UTC)
Message-ID: <4079a650-74a6-49bc-87a9-c5729fb6e8d1@collabora.com>
Date: Thu, 25 Jan 2024 15:14:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-pwm@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Benson Leung <bleung@chromium.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Paul Cercueil <paul@crapouillou.net>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <1cae6f73264ab313205eaa9483251f7aaf259cb4.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 63AAC3F3AC
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.39 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:46.235.227.194:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	ONCE_RECEIVED(0.10)[];
	XM_UA_NO_VERSION(0.01)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[collabora.com:email,collabora.com:dkim,madrid.collaboradmins.com:helo,madrid.collaboradmins.com:rdns];
	FREEMAIL_TO(0.00)[pengutronix.de,vger.kernel.org,tuxon.dev,microchip.com,bootlin.com,broadcom.com,chromium.org,kernel.org,crapouillou.net,gmail.com,linaro.org,baylibre.com,dabbelt.com,sifive.com,foss.st.com,csie.org,sholland.org,intel.com,linux.intel.com,suse.de,ffwll.ch,linuxfoundation.org];
	FREEMAIL_CC(0.00)[pengutronix.de,lists.infradead.org,broadcom.com,chromium.org,lists.linux.dev,gmail.com,nxp.com,vger.kernel.org,baylibre.com,googlemail.com,samsung.com,st-md-mailman.stormreply.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,lists.linaro.org];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCVD_COUNT_ONE(0.00)[1];
	RCPT_COUNT_GT_50(0.00)[58];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:44684, ipnet:46.235.224.0/21, country:GB];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-MailFrom: angelogioacchino.delregno@collabora.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5527HW764QRZLJYEPKXJGSGVVCNPDSMN
X-Message-ID-Hash: 5527HW764QRZLJYEPKXJGSGVVCNPDSMN
X-Mailman-Approved-At: Fri, 26 Jan 2024 15:28:22 +0000
CC: kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, Douglas Anderson <dianders@chromium.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 003/111] pwm: Provide a macro to get the parent device of a given chip
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5527HW764QRZLJYEPKXJGSGVVCNPDSMN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SWwgMjUvMDEvMjQgMTM6MDgsIFV3ZSBLbGVpbmUtS8O2bmlnIGhhIHNjcml0dG86DQo+IEN1cnJl
bnRseSBhIHB3bV9jaGlwIHN0b3JlcyBpbiBpdHMgc3RydWN0IGRldmljZSAqZGV2IG1lbWJlciBh
IHBvaW50ZXINCj4gdG8gdGhlIHBhcmVudCBkZXZpY2UuIFByZXBhcmluZyBhIGNoYW5nZSB0aGF0
IGVtYmVkcyBhIGZ1bGwgc3RydWN0DQo+IGRldmljZSBpbiBzdHJ1Y3QgcHdtX2NoaXAsIHRoaXMg
YWNjZXNzb3IgbWFjcm8gc2hvdWxkIGJlIHVzZWQgaW4gYWxsDQo+IGRyaXZlcnMgZGlyZWN0bHkg
YWNjZXNzaW5nIGNoaXAtPmRldiBub3cuIFRoaXMgd2F5IHN0cnVjdCBwd21fY2hpcCBhbmQNCj4g
dGhpcyBtYWNybyBjYW4gYmUgY2hhbmdlZCB3aXRob3V0IGhhdmluZyB0byB0b3VjaCBhbGwgZHJp
dmVycyBpbiB0aGUNCj4gc2FtZSBjaGFuZ2Ugc2V0Lg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdl
IEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0KUmV2aWV3
ZWQtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJl
Z25vQGNvbGxhYm9yYS5jb20+DQoNCj4gLS0tDQo+ICAgaW5jbHVkZS9saW51eC9wd20uaCB8IDUg
KysrKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9wd20uaCBiL2luY2x1ZGUvbGludXgvcHdtLmgNCj4gaW5kZXgg
OGZmZTlhZTdhMjNhLi5kNzk2NjkxOGYzMDEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgv
cHdtLmgNCj4gKysrIGIvaW5jbHVkZS9saW51eC9wd20uaA0KPiBAQCAtMjg5LDYgKzI4OSwxMSBA
QCBzdHJ1Y3QgcHdtX2NoaXAgew0KPiAgIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdtczsNCj4gICB9
Ow0KPiAgIA0KPiArc3RhdGljIGlubGluZSBzdHJ1Y3QgZGV2aWNlICpwd21jaGlwX3BhcmVudChz
dHJ1Y3QgcHdtX2NoaXAgKmNoaXApDQo+ICt7DQo+ICsJcmV0dXJuIGNoaXAtPmRldjsNCj4gK30N
Cj4gKw0KPiAgICNpZiBJU19FTkFCTEVEKENPTkZJR19QV00pDQo+ICAgLyogUFdNIHVzZXIgQVBJ
cyAqLw0KPiAgIGludCBwd21fYXBwbHlfbWlnaHRfc2xlZXAoc3RydWN0IHB3bV9kZXZpY2UgKnB3
bSwgY29uc3Qgc3RydWN0IHB3bV9zdGF0ZSAqc3RhdGUpOw0KDQoNCg0KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBl
bWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
