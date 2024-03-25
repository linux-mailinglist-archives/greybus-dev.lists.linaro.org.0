Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3838688A322
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 14:52:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4930D40A05
	for <lists+greybus-dev@lfdr.de>; Mon, 25 Mar 2024 13:52:57 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 15C7940B42
	for <greybus-dev@lists.linaro.org>; Mon, 25 Mar 2024 02:13:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=bUL61oDb;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of patchwork-bot+chrome-platform@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=patchwork-bot+chrome-platform@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9561FCE0F95;
	Mon, 25 Mar 2024 02:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76189C43394;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711332787;
	bh=aJvg1KH6joFG6oJkgTHoc61lNEcN6UYDL94Kek/0h5A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bUL61oDb/M+5KYmdH9GZAQdZT3PYKaJ010SbGP/0QAETJ2gY+Rxd19+hfItokn4fc
	 qXm+5UshaVvnLaKO+h8US6GsQq7XoxEkTJDEVJIEaNCFv8M2uUBhoQrMAu3fisTCQo
	 B4fRFMNeMscSki123E/z54cBRXf+v5p5HhYpLJ3jJtc1OvR7VQslOwZ36RRz8NHOez
	 HFUH5lzzeG0rrZGBHCyr2OTeNZB2H2sILwj6OEqE53Bfd2qCAI/Z34pAg9I1JWd2Cn
	 dq/bNtJWoCPVpzv9DjBiOxvAIfXazxrFfLBNOkzXYWWq5P+zSQavVa4Lgiia++T7N2
	 7rjlBqvf/ljRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
	by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5AFA0D2D0E0;
	Mon, 25 Mar 2024 02:13:07 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
From: patchwork-bot+chrome-platform@kernel.org
Message-Id: 
 <171133278736.9916.5526869645378949035.git-patchwork-notify@kernel.org>
Date: Mon, 25 Mar 2024 02:13:07 +0000
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org
X-Rspamd-Queue-Id: 15C7940B42
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	FORGED_RECIPIENTS(2.00)[m:=?utf-8?q?Uwe_Kleine-K=C3=B6nig_=3Cu=2Ekleine-koenig=40pengutronix=2Ede=3E?=@ci.codeaurora.org,m:linux-pwm@vger.kernel.org,m:corbet@lwn.net,m:Jonathan.Cameron@huawei.com,m:james.clark@arm.com,m:andriy.shevchenko@linux.intel.com,m:broonie@kernel.org,m:marcan@marcan.st,m:sven@svenpeter.dev,m:claudiu.beznea@tuxon.dev,m:nicolas.ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:florian.fainelli@broadcom.com,m:rjui@broadcom.com,m:sbranden@broadcom.com,m:shc_work@mail.ru,m:bleung@chromium.org,m:p.zabel@pengutronix.de,m:shawnguo@kernel.org,m:s.hauer@pengutronix.de,m:paul@crapouillou.net,m:vz@mleia.com,m:mika.westerberg@linux.intel.com,m:andy@kernel.org,m:linus.walleij@linaro.org,m:hdegoede@redhat.com,m:ilpo.jarvinen@linux.intel.com,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:neil.armstrong@linaro.org,m:khilman@baylibre.com,m:conor.dooley@microchip.com,m:daire.mcnamara@microchip.com,m:j.neuschaefer@gmx.net,m:heiko@sntech.de,m:krzysztof.k
 ozlowski@linaro.org,m:palmer@dabbelt.com,m:paul.walmsley@sifive.com,m:mwalle@kernel.org,m:orsonzhai@gmail.com,m:baolin.wang@linux.alibaba.com,m:zhang.lyra@gmail.com,m:fabrice.gasnier@foss.st.com,m:mcoquelin.stm32@gmail.com,m:alexandre.torgue@foss.st.com,m:wens@csie.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:hammerh0314@gmail.com,m:thierry.reding@gmail.com,m:jonathanh@nvidia.com,m:nobuhiro1.iwamatsu@toshiba.co.jp,m:sean.anderson@seco.com,m:michal.simek@amd.com,m:brgl@bgdev.pl,m:andrzej.hajda@intel.com,m:rfoss@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:daniel@ffwll.ch,m:pavel@ucw.cz,m:lee@kernel.org,m:quic_amelende@quicinc.com,m:quic_bjorande@quicinc.com,m:keescook@chromium.org,m:robh@kernel.org,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:kernel@pengutronix.de,m:linux-doc@vger.kernel.org,m:alyssa@rosenzweig.io,m:asahi@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:bcm-ke
 rnel-feedback-list@broadcom.com,m:linux-rpi-kernel@lists.infradead.org,m:groeck@chromium.org,m:chrome-platform@lists.linux.dev,m:festevam@gmail.com,m:linux-imx@nxp.com,m:linux-mips@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:platform-driver-x86@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:linux-amlogic@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:alim.akhtar@samsung.com,m:linux-samsung-soc@vger.kernel.org,m:linux-stm32@st-md-mailman.stormreply.com,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:dianders@chromium.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,s:greybus-dev@lists.linaro.org];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_NO_DN(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lwn.net,huawei.com,arm.com,linux.intel.com,kernel.org,marcan.st,svenpeter.dev,tuxon.dev,microchip.com,bootlin.com,broadcom.com,mail.ru,chromium.org,pengutronix.de,crapouillou.net,mleia.com,linaro.org,redhat.com,gmail.com,collabora.com,baylibre.com,gmx.net,sntech.de,dabbelt.com,sifive.com,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,bgdev.pl,intel.com,suse.de,ffwll.ch,ucw.cz,quicinc.com,linuxfoundation.org,rosenzweig.io,lists.linux.dev,lists.infradead.org,nxp.com,googlemail.com,samsung.com,st-md-mailman.stormreply.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[chrome-platform];
	RCPT_COUNT_GT_50(0.00)[105];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: patchwork-bot+chrome-platform@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NKZJR53K2A7UBEBQO64ZYVXLCX7LR3LJ
X-Message-ID-Hash: NKZJR53K2A7UBEBQO64ZYVXLCX7LR3LJ
X-Mailman-Approved-At: Mon, 25 Mar 2024 13:52:37 +0000
CC: linux-pwm@vger.kernel.org, corbet@lwn.net, Jonathan.Cameron@huawei.com, james.clark@arm.com, andriy.shevchenko@linux.intel.com, broonie@kernel.org, marcan@marcan.st, sven@svenpeter.dev, claudiu.beznea@tuxon.dev, nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, florian.fainelli@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com, shc_work@mail.ru, bleung@chromium.org, p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de, paul@crapouillou.net, vz@mleia.com, mika.westerberg@linux.intel.com, andy@kernel.org, linus.walleij@linaro.org, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org, khilman@baylibre.com, conor.dooley@microchip.com, daire.mcnamara@microchip.com, j.neuschaefer@gmx.net, heiko@sntech.de, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, mwalle@kernel.org, orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail
 .com, fabrice.gasnier@foss.st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, hammerh0314@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com, nobuhiro1.iwamatsu@toshiba.co.jp, sean.anderson@seco.com, michal.simek@amd.com, brgl@bgdev.pl, andrzej.hajda@intel.com, rfoss@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch, pavel@ucw.cz, lee@kernel.org, quic_amelende@quicinc.com, quic_bjorande@quicinc.com, keescook@chromium.org, robh@kernel.org, johan@kernel.org, elder@kernel.org, kernel@pengutronix.de, linux-doc@vger.kernel.org, alyssa@rosenzweig.io, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, linux-rpi-kernel@lists.infradead.org, groeck@chromium.org, chrome-platform@lists.linux.dev, festevam@gmail.com, linux-imx@nxp.com, linux-mips@vger.kernel.org, linux-gpio@vger.kernel.org, pla
 tform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, alim.akhtar@samsung.com, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, dianders@chromium.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, gustavoars@kernel.org, linux-hardening@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v6 000/164] pwm: Improve lifetime tracking for pwm_chips
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DFCJFDAYKPFHVO3O5N4WRJ3KTVRMBPX5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

SGVsbG86DQoNClRoaXMgc2VyaWVzIHdhcyBhcHBsaWVkIHRvIGNocm9tZS1wbGF0Zm9ybS9saW51
eC5naXQgKGZvci1uZXh0KQ0KYnkgVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0Bw
ZW5ndXRyb25peC5kZT46DQoNCk9uIFdlZCwgMTQgRmViIDIwMjQgMTA6MzA6NDcgKzAxMDAgeW91
IHdyb3RlOg0KPiBIZWxsbywNCj4gDQo+IHRoaXMgaXMgdjYgb2YgdGhlIHNlcmllcyBpbnRyb2R1
Y2luZyBiZXR0ZXIgbGlmZXRpbWUgdHJhY2tpbmcgZm9yDQo+IHB3bWNoaXBzIHRoYXQgYWRkcmVz
c2VzIChmb3Igbm93IHRoZW9yZXRpYykgbGlmZXRpbWUgaXNzdWVzIG9mIHB3bQ0KPiBjaGlwcy4g
QWRkcmVzc2luZyB0aGVzZSBpcyBhIG5lY2Vzc2FyeSBwcmVjb25kaXRpb24gdG8gaW50cm9kdWNl
IGNoYXJkZXYNCj4gc3VwcG9ydCBmb3IgUFdNcy4NCj4gDQo+IFsuLi5dDQoNCkhlcmUgaXMgdGhl
IHN1bW1hcnkgd2l0aCBsaW5rczoNCiAgLSBbdjYsMDAxLzE2NF0gcHdtOiBQcm92aWRlIGFuIGlu
bGluZSBmdW5jdGlvbiB0byBnZXQgdGhlIHBhcmVudCBkZXZpY2Ugb2YgYSBnaXZlbiBjaGlwDQog
ICAgaHR0cHM6Ly9naXQua2VybmVsLm9yZy9jaHJvbWUtcGxhdGZvcm0vYy80ZTU5MjY3YzdhMjAN
CiAgLSBbdjYsMDAzLzE2NF0gcHdtOiBQcm92aWRlIHB3bWNoaXBfYWxsb2MoKSBmdW5jdGlvbiBh
bmQgYSBkZXZtIHZhcmlhbnQgb2YgaXQNCiAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nocm9t
ZS1wbGF0Zm9ybS9jLzAyNDkxM2RiZjk5Zg0KICAtIFt2NiwwMjkvMTY0XSBwd206IGNyb3MtZWM6
IENoYW5nZSBwcm90b3R5cGUgb2YgaGVscGVycyB0byBwcmVwYXJlIGZ1cnRoZXIgY2hhbmdlcw0K
ICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2hyb21lLXBsYXRmb3JtL2MvNzI1NmMyZTc5Yjhl
DQogIC0gW3Y2LDAzMC8xNjRdIHB3bTogY3Jvcy1lYzogTWFrZSB1c2Ugb2YgcHdtY2hpcF9wYXJl
bnQoKSBhY2Nlc3Nvcg0KICAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvY2hyb21lLXBsYXRmb3Jt
L2MvMTlhNTY4YThkM2M0DQogIC0gW3Y2LDAzMS8xNjRdIHB3bTogY3Jvcy1lYzogTWFrZSB1c2Ug
b2YgZGV2bV9wd21jaGlwX2FsbG9jKCkgZnVuY3Rpb24NCiAgICBodHRwczovL2dpdC5rZXJuZWwu
b3JnL2Nocm9tZS1wbGF0Zm9ybS9jLzQ1MmJlOTQyMWVkYQ0KDQpZb3UgYXJlIGF3ZXNvbWUsIHRo
YW5rIHlvdSENCi0tIA0KRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4NCmh0dHBzOi8va29yZy5k
b2NzLmtlcm5lbC5vcmcvcGF0Y2h3b3JrL3B3Ym90Lmh0bWwNCg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
