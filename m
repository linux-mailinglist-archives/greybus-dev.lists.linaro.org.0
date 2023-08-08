Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A311773A66
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Aug 2023 15:18:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C65E3EC24
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Aug 2023 13:18:49 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	by lists.linaro.org (Postfix) with ESMTPS id 101063EC14
	for <greybus-dev@lists.linaro.org>; Tue,  8 Aug 2023 13:18:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=iy7zswmt;
	spf=pass (lists.linaro.org: domain of linus.walleij@linaro.org designates 209.85.128.170 as permitted sender) smtp.mailfrom=linus.walleij@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-5768a7e3adbso95604517b3.0
        for <greybus-dev@lists.linaro.org>; Tue, 08 Aug 2023 06:18:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691500721; x=1692105521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
        b=iy7zswmtYx6ZYNzYmCG5rqHRjdv+HqB8GrEKYccjle/8dJ9x1OShHO9OgMow0zFYho
         RJhCC40wkFuTTf25ecgjND4T7pSlTzynELSybpF4Tq9lm0vpF/1WhH9PVjPDo3D92r0t
         vE0MwfGWmp5O6GeDRRPpN190ezwOTKyeDzoh+6spHPvGNcXvDC15NYX5Fh6AdODwNh9i
         u+xgCMzltAjprgtTTXUMnRSMUGU88rU5hQybpWcAAj9weIpW1fiVIhA90pqCkvmL6npO
         3XYinfPiJb8jbNTnaImLtOznhk/zT3v7clUSSq2VXwojFDvEIz4Ap+Wto2wlmlxEy3FT
         jTzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691500721; x=1692105521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cCJVGIzRWp3n6+ocRSshdb4+bDJCLF8hHPywBz67DZU=;
        b=VqGKMFrFud5rUbcP9lG/mCh1M7vZ0Rlg4xuHCuogk2aGkzlTga0Y4fopXaorWV6qTk
         y+eVxwlxqB+BPJGybiCjuR9iho6ny9bagDxii4BhekP+9MEnXj5+IqO5Y/soIwNvlgbM
         aXm6awCzpuuTiVQQYmL0vFT8LaVEDynZAFK9xM51++sNR734x02uszvgH+Rv1fvHEUSi
         GZNFG/OSYHMTRtWr1c6CRww3HYDEdqLcYRcJKn8Hpu0NlAqhOBdXgtwT41kA98tYnomR
         fN5RmzjILrjusGBikxE6o/goHjg+8qTeYa/VJYcnOV0tmsGPOPeb4rlpZ06ffzDvg1on
         Gg7A==
X-Gm-Message-State: AOJu0Ywuen+qS5L3XDm03OIxXmvQX0p2l/ZYnN1eg5CYYpriCoF4Seby
	xUpHPrhGvC7rutnGT8+rAJMXpq8Au13lZlAmje3UEqRJ
X-Google-Smtp-Source: AGHT+IGCQegfute4wq8vuctRCNyh2F9D25HtOrYRCxA1KPyHbK9gB5btAs+lYOVd+Us7kHls2/CFh6KxK9tgT70dyU8=
X-Received: by 2002:a25:d14e:0:b0:cee:80e:23af with SMTP id
 i75-20020a25d14e000000b00cee080e23afmr3349036ybg.11.1691500721596; Tue, 08
 Aug 2023 06:18:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 8 Aug 2023 15:18:30 +0200
Message-ID: <CACRpkdZ4OqLywBhCkDmA6bEkf3rfHpCODba9Rhx36fuP8ywt6Q@mail.gmail.com>
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 101063EC14
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-6.00 / 15.00];
	DWL_DNSWL_HI(-3.50)[linaro.org:dkim];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ONE(0.00)[1];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ideasonboard.com,bgdev.pl,kernel.org,chromium.org,intel.com,linaro.org,kwiboo.se,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,walle.cc,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,quicinc.com,z3ntu.xyz,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[linaro.org:email,linaro.org:dkim];
	RCPT_COUNT_GT_50(0.00)[88];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.170:from]
Message-ID-Hash: BTTKGY6RQYYAQ423AH5PBI3PYIYJ4T3C
X-Message-ID-Hash: BTTKGY6RQYYAQ423AH5PBI3PYIYJ4T3C
X-MailFrom: linus.walleij@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Thierry Reding <thierry.reding@gmail.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <
 shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, O
 rson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, chrome-platfor
 m@lists.linux.dev, linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 0/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BTTKGY6RQYYAQ423AH5PBI3PYIYJ4T3C/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBBdWcgNCwgMjAyMyBhdCA0OjI44oCvUE0gVXdlIEtsZWluZS1Lw7ZuaWcNCjx1Lmts
ZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOg0KDQo+IChpbXBsaWNpdCkgdjEgb2Yg
dGhpcyBzZXJpZXMgY2FuIGJlIGZvdW5kIGF0DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXB3bS8yMDIzMDgwMzE0MDYzMy4xMzgxNjUtMS11LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGUgLg0KPg0KPiBDaGFuZ2VzIHNpbmNlIHRoZW4gb25seSBhZmZlY3QgZG9jdW1lbnRhdGlv
biB0aGF0IEkgbWlzc2VkIHRvIGFkYXB0IGJlZm9yZS4NCj4gVGhhbmtzIHRvIExhdXJlbnQgZm9y
IGNhdGNoaW5nIHRoYXQNCj4NCj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0KPg0KPiBVd2UgS2xlaW5l
LUvDtm5pZyAoMik6DQo+ICAgcHdtOiBNYW5hZ2Ugb3duZXIgYXNzaWdubWVudCBpbXBsaWNpdGx5
IGZvciBkcml2ZXJzDQo+ICAgcHdtOiBjcmM6IEFsbG93IGNvbXBpbGF0aW9uIGFzIG1vZHVsZSBh
bmQgd2l0aCBDT01QSUxFX1RFU1QNCg0KQ2xlYXJseSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8hIE5p
Y2UgcGF0Y2hlcy4NClJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxp
bmFyby5vcmc+DQoNCllvdXJzLA0KTGludXMgV2FsbGVpag0KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0
byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
