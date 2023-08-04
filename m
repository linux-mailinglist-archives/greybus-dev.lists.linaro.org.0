Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3871B771D75
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Aug 2023 11:50:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D54913F4C9
	for <lists+greybus-dev@lfdr.de>; Mon,  7 Aug 2023 09:50:24 +0000 (UTC)
Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	by lists.linaro.org (Postfix) with ESMTPS id 395BD3EBFD
	for <greybus-dev@lists.linaro.org>; Fri,  4 Aug 2023 18:52:28 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=mlUliX93;
	spf=pass (lists.linaro.org: domain of andy.shevchenko@gmail.com designates 209.85.160.45 as permitted sender) smtp.mailfrom=andy.shevchenko@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-1bed90ee8b7so1522550fac.0
        for <greybus-dev@lists.linaro.org>; Fri, 04 Aug 2023 11:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691175147; x=1691779947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HItNTIMvCIXfonBezfurR93L/l9UQl6IcmZ4tatzJA=;
        b=mlUliX93F5qFHHI1eoLLCSxrP0sRwTu71E0+0iF7A2cwIL58bh7yKQ2Zd6VhPOrrVR
         4WdI+88TPtQ+l7NhMMov1wuxD/H4Wfpqib7Yg1CqBoLVgI9m47L6ZB6NS2aAqZe2o87V
         jYs5ldnsb607oh+VfEDrtHDLtwbY6DO6R6Ugm+ofDucq4j8Xc5ioeiscE+q98v0yR9a3
         RDVFTtbnWiWvOcsAhM3mLGK8JySKNDA30p9zWKdJUEpFB63B4SH4l7UsNu010WqETrWY
         l4LdvmiG2xu7jdQFyaLi3vGEmIrG+6Q/NS66/vkYPDGplv0UaIiAPepVwHTI+A+HM11B
         lAaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691175147; x=1691779947;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4HItNTIMvCIXfonBezfurR93L/l9UQl6IcmZ4tatzJA=;
        b=GaPgGffNdxqYAVoEHyf3M4KQD536IGHVeQoyX7UPb/OtCLOBrjocNcomUwMvpnluxP
         RUQTADjoZxTMaZzYzAqeh0cm66EpP+61GOwySAwseT6g6as23eigUf3eIJj1tw5ts+Y7
         Y9uT/KEGntVTpqrA1T/iKbEF+r+LusZ7bX+7dtZlm5qm4K5PkOU+iK8THI4nDsPAkg3x
         maDfdz3VvjYkITA6crdxgyHUEgD1KmCjiuaRjmeBLoeliprs9TEczK4qPtqIsxail4kV
         ot3GLwRJJLwuszrkwuMIyVrzcfTuIALEZOscwTuCGqMZUsxP8vAhixqFtJuT22RQal9J
         P/BA==
X-Gm-Message-State: AOJu0YxgBYxURBn883SIykuTJAVm8IZK6j+CzkS7rG5tQRa97SH1wbTr
	hw9enHzW81BgMl/BUG4A7NgQ+q0dkUCubR1kKQg=
X-Google-Smtp-Source: AGHT+IGzp9pVDMXWry56NsZy1Wlu+pLORC3ORFvtBGhMu6TYOCe+P8wMbQo5bZqDncwUMYd/rqllnaxHLBBvOMv3P6I=
X-Received: by 2002:a05:6870:ac2a:b0:1be:feb0:33ff with SMTP id
 kw42-20020a056870ac2a00b001befeb033ffmr2969895oab.6.1691175147496; Fri, 04
 Aug 2023 11:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de> <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 4 Aug 2023 21:51:51 +0300
Message-ID: <CAHp75Vfr2VrKXiOnM7=+K6MvOdCdy52xb5PB+dzKMeHonF04eQ@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 395BD3EBFD
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.45:from];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.160.45:from];
	TAGGED_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,linaro.org,bgdev.pl,kernel.org,chromium.org,intel.com,kwiboo.se,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,walle.cc,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,quicinc.com,z3ntu.xyz,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_GT_50(0.00)[89];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[]
X-MailFrom: andy.shevchenko@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GV3RAQHCPI54HZGVIJTXOQFQK533WA35
X-Message-ID-Hash: GV3RAQHCPI54HZGVIJTXOQFQK533WA35
X-Mailman-Approved-At: Mon, 07 Aug 2023 09:50:19 +0000
CC: Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.
 fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive
 .com>, Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-
 kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GV3RAQHCPI54HZGVIJTXOQFQK533WA35/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA1OjI44oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcNCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOg0KPg0KPiBJbnN0ZWFkIG9mIHJlcXVp
cmluZyBlYWNoIGRyaXZlciB0byBjYXJlIGZvciBhc3NpZ25pbmcgdGhlIG93bmVyIG1lbWJlcg0K
PiBvZiBzdHJ1Y3QgcHdtX29wcywgaGFuZGxlIHRoYXQgaW1wbGljaXRseSB1c2luZyBhIG1hY3Jv
LiBOb3RlIHRoYXQgdGhlDQo+IG93bmVyIG1lbWJlciBoYXMgdG8gYmUgbW92ZWQgdG8gc3RydWN0
IHB3bV9jaGlwLCBhcyB0aGUgb3BzIHN0cnVjdHVyZQ0KPiB1c3VhbGx5IGxpdmVzIGluIHJlYWQt
b25seSBtZW1vcnkgYW5kIHNvIGNhbm5vdCBiZSBtb2RpZmllZC4NCj4NCj4gVGhlIHVwc2lkZSBp
cyB0aGF0IG5ldyBsb3dsZXZlbCBkcml2ZXJzIGNhbm5vdCBmb3JnZXQgdGhlIGFzc2lnbm1lbnQg
YW5kDQoNCmxvdyBsZXZlbA0KDQo+IHNhdmUgb25lIGxpbmUgZWFjaC4gVGhlIHB3bS1jcmMgZHJp
dmVyIGRpZG4ndCBhc3NpZ24gLm93bmVyLCB0aGF0J3Mgbm90DQo+IGEgcHJvYmxlbSBpbiBwcmFj
dGlzZSB0aG91Z2ggYXMgdGhlIGRyaXZlciBjYW5ub3QgYmUgY29tcGlsZWQgYXMgYQ0KPiBtb2R1
bGUuDQoNCi4uLg0KDQo+ICBkcml2ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwg
IDEgLQ0KDQpBY2tlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwu
Y29tPiAjIEludGVsIExQU1MNCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkFuZHkgU2hldmNo
ZW5rbw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8g
dW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5h
cm8ub3JnCg==
