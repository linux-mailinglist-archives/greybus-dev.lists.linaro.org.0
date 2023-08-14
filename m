Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 87E9A77B2BB
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Aug 2023 09:41:35 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13AC03EA1B
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Aug 2023 07:41:34 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	by lists.linaro.org (Postfix) with ESMTPS id EF16F3EA1B
	for <greybus-dev@lists.linaro.org>; Mon, 14 Aug 2023 07:41:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=c2ibWsrt;
	spf=pass (lists.linaro.org: domain of neil.armstrong@linaro.org designates 209.85.128.48 as permitted sender) smtp.mailfrom=neil.armstrong@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fe1a17f983so36191205e9.3
        for <greybus-dev@lists.linaro.org>; Mon, 14 Aug 2023 00:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691998886; x=1692603686;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
        b=c2ibWsrtxlpOl2l93H8I7dwO30O1xssdh4p/RrE2q8N2J8sUQOiLfPy4jrHUDNecWQ
         B9Xl7UbuevI0/fpeC3Cqz4JjJBdAc1fM3Sx+NRxxOWZwKyMRK3wSy1FRjBCN1vRcCJ3V
         iNaGpXWAcpuPTu7ilq8+T4iAp1Du1dTft6ZdWvtZ4YteQjS4RMAl8rEkUzkK3U48fPQ3
         Ta+6PDHsz/O7Bxk8FyAYZKsv9wLW0hBYeG+zmWBSRbPB9cFQZwP3sWc7W4O0II/GdFDH
         XLs0zYerpdo1H3GjEXSiYzl+d1vN7CnfVNDwP6MnTibEClBZjnwlup1Vh8wpi7JEvqyE
         zjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691998886; x=1692603686;
        h=content-transfer-encoding:in-reply-to:organization:references:cc:to
         :content-language:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zitqku576TZpQnQPr3Oh2ohHuEFbeZPBBxEvo1sZc+Q=;
        b=FMt1HY8tv5JNazNIj+iwKuQMlKxhr+vC1xc+/gn0GNwESVsz6nG6uUk6BrwAmOOpxk
         IE+iHJC8+3fBlElJntJt6gZZeCyWkEsWcI3n0x0ukMvWqrWNnHkzWVVeaMYjb0hR28Z3
         RRURjzjs6aZv97J7gYxrcUfKT271zPON2/bMaU0StE8hkKJjAbtiCJ8fvje3AEu2vmbl
         Qcvqi0c8cCYVZLDKPeCTpKYf0ht0/9RszGSXVYg8gzylRtUXqkGxmybni5+zo6wihUlT
         w8JMEzhEc30TS8whVENhisaw/nrcrIGy6Wg/4UVGNhVKUv3xxJ1aSk0sK65usV6esYqE
         frxA==
X-Gm-Message-State: AOJu0YwG2rPNi9zhrU7sKN587LWdb+lz7LhyI10M6H5O3jA82srxWsO+
	RFAto+lWhWYO8JSijGnMVo+QOw4O
X-Google-Smtp-Source: AGHT+IFYfAjXxtZPBAO6xzW1e3FH1h7mkoQ3yNtVsbL8sLdvSW5eTgH/X76mW18QMBp5iOQDIcXGqw==
X-Received: by 2002:adf:ee87:0:b0:317:5e0d:c249 with SMTP id b7-20020adfee87000000b003175e0dc249mr6776837wro.35.1691998885785;
        Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0? ([2a01:e0a:982:cbb0:a3d8:b217:d82c:9bc0])
        by smtp.gmail.com with ESMTPSA id k3-20020a5d6283000000b00317643a93f4sm13507243wru.96.2023.08.14.00.41.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Aug 2023 00:41:25 -0700 (PDT)
Message-ID: <81500a13-0fed-e9d4-7f51-552b888a98e1@linaro.org>
Date: Mon, 14 Aug 2023 09:41:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
References: <20230804142707.412137-1-u.kleine-koenig@pengutronix.de>
 <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
Organization: Linaro Developer Services
In-Reply-To: <20230804142707.412137-2-u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EF16F3EA1B
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[linaro.org,bgdev.pl,kernel.org,chromium.org,intel.com,kwiboo.se,gmail.com,ffwll.ch,ucw.cz,marcan.st,svenpeter.dev,rosenzweig.io,microchip.com,bootlin.com,broadcom.com,mail.ru,pengutronix.de,nxp.com,crapouillou.net,mleia.com,baylibre.com,googlemail.com,collabora.com,gmx.net,sntech.de,samsung.com,dabbelt.com,sifive.com,walle.cc,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,linuxfoundation.org,quicinc.com,z3ntu.xyz,vger.kernel.org,lists.freedesktop.org,lists.linux.dev,lists.infradead.org,st-md-mailman.stormreply.com,lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.48:from];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_TLS_LAST(0.00)[];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[linaro.org:+];
	FREEMAIL_TO(0.00)[pengutronix.de,gmail.com,ideasonboard.com];
	RCPT_COUNT_GT_50(0.00)[88];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org]
Message-ID-Hash: LC7FXJXL3N6EONC4EA4XSIX33DDLVMCI
X-Message-ID-Hash: LC7FXJXL3N6EONC4EA4XSIX33DDLVMCI
X-MailFrom: neil.armstrong@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, Douglas Anderson <dianders@chromium.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, Shawn G
 uo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?Q?Jonathan_Neusch=c3=a4fer?= <j.neuschaefer@gmx.net>, Heiko Stuebner <heiko@sntech.de>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Michael Walle <michael@walle.cc>, Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.
 lyra@gmail.com>, Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Anjelique Melendez <quic_amelende@quicinc.com>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Luca Weiss <luca@z3ntu.xyz>, Bjorn Andersson <quic_bjorande@quicinc.com>, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev, linux-mips@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-riscv@lists
 .infradead.org, linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Reply-To: neil.armstrong@linaro.org
Subject: [greybus-dev] Re: [PATCH v2 1/2] pwm: Manage owner assignment implicitly for drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LC7FXJXL3N6EONC4EA4XSIX33DDLVMCI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMDQvMDgvMjAyMyAxNjoyNywgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6DQo+IEluc3RlYWQg
b2YgcmVxdWlyaW5nIGVhY2ggZHJpdmVyIHRvIGNhcmUgZm9yIGFzc2lnbmluZyB0aGUgb3duZXIg
bWVtYmVyDQo+IG9mIHN0cnVjdCBwd21fb3BzLCBoYW5kbGUgdGhhdCBpbXBsaWNpdGx5IHVzaW5n
IGEgbWFjcm8uIE5vdGUgdGhhdCB0aGUNCj4gb3duZXIgbWVtYmVyIGhhcyB0byBiZSBtb3ZlZCB0
byBzdHJ1Y3QgcHdtX2NoaXAsIGFzIHRoZSBvcHMgc3RydWN0dXJlDQo+IHVzdWFsbHkgbGl2ZXMg
aW4gcmVhZC1vbmx5IG1lbW9yeSBhbmQgc28gY2Fubm90IGJlIG1vZGlmaWVkLg0KPiANCj4gVGhl
IHVwc2lkZSBpcyB0aGF0IG5ldyBsb3dsZXZlbCBkcml2ZXJzIGNhbm5vdCBmb3JnZXQgdGhlIGFz
c2lnbm1lbnQgYW5kDQo+IHNhdmUgb25lIGxpbmUgZWFjaC4gVGhlIHB3bS1jcmMgZHJpdmVyIGRp
ZG4ndCBhc3NpZ24gLm93bmVyLCB0aGF0J3Mgbm90DQo+IGEgcHJvYmxlbSBpbiBwcmFjdGlzZSB0
aG91Z2ggYXMgdGhlIGRyaXZlciBjYW5ub3QgYmUgY29tcGlsZWQgYXMgYQ0KPiBtb2R1bGUuDQo+
IA0KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBl
bmd1dHJvbml4LmRlPg0KPiAtLS0NCj4gICBkcml2ZXJzL2dwaW8vZ3Bpby1tdmVidS5jICAgICAg
ICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGktc242NWRzaTg2LmMg
fCAgMSAtDQo+ICAgZHJpdmVycy9sZWRzL3JnYi9sZWRzLXFjb20tbHBnLmMgICAgICB8ICAxIC0N
Cj4gICBkcml2ZXJzL3B3bS9jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgMjQgKysrKysrKysr
KysrKystLS0tLS0tLS0tDQo+ICAgZHJpdmVycy9wd20vcHdtLWFiODUwMC5jICAgICAgICAgICAg
ICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tYXBwbGUuYyAgICAgICAgICAgICAgIHwgIDEg
LQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC1obGNkYy5jICAgICAgICAgfCAgMSAtDQo+ICAg
ZHJpdmVycy9wd20vcHdtLWF0bWVsLXRjYi5jICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJz
L3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3
bS1iY20taXByb2MuYyAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLWJjbS1r
b25hLmMgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tYmNtMjgzNS5jICAg
ICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1iZXJsaW4uYyAgICAgICAgICAg
ICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLWJyY21zdGIuYyAgICAgICAgICAgICB8ICAx
IC0NCj4gICBkcml2ZXJzL3B3bS9wd20tY2xrLmMgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAg
IGRyaXZlcnMvcHdtL3B3bS1jbHBzNzExeC5jICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVy
cy9wd20vcHdtLWNyb3MtZWMuYyAgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9w
d20tZHdjLmMgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1lcDkz
eHguYyAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLWZzbC1mdG0uYyAg
ICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20taGlidnQuYyAgICAgICAgICAg
ICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1pbWcuYyAgICAgICAgICAgICAgICAgfCAg
MSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLWlteC10cG0uYyAgICAgICAgICAgICB8ICAxIC0NCj4g
ICBkcml2ZXJzL3B3bS9wd20taW14MS5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZl
cnMvcHdtL3B3bS1pbXgyNy5jICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20v
cHdtLWludGVsLWxnbS5jICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20taXFz
NjIwYS5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1qejQ3NDAuYyAg
ICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLWtlZW1iYXkuYyAgICAgICAg
ICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tbHAzOTQzLmMgICAgICAgICAgICAgIHwg
IDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1scGMxOHh4LXNjdC5jICAgICAgICAgfCAgMSAtDQo+
ICAgZHJpdmVycy9wd20vcHdtLWxwYzMyeHguYyAgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2
ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdt
L3B3bS1tZWRpYXRlay5jICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLW1l
c29uLmMgICAgICAgICAgICAgICB8ICAxIC0NCg0KQWNrZWQtYnk6IE5laWwgQXJtc3Ryb25nIDxu
ZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPiAjIHB3bS1tZXNvbg0KDQo+ICAgZHJpdmVycy9wd20v
cHdtLW1pY3JvY2hpcC1jb3JlLmMgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tbXRr
LWRpc3AuYyAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1teHMuYyAgICAg
ICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLW50eGVjLmMgICAgICAgICAg
ICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tb21hcC1kbXRpbWVyLmMgICAgICAgIHwg
IDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1wY2E5Njg1LmMgICAgICAgICAgICAgfCAgMSAtDQo+
ICAgZHJpdmVycy9wd20vcHdtLXB4YS5jICAgICAgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2
ZXJzL3B3bS9wd20tcmFzcGJlcnJ5cGktcG9lLmMgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdt
L3B3bS1yY2FyLmMgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLXJl
bmVzYXMtdHB1LmMgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tcm9ja2NoaXAu
YyAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1yei1tdHUzLmMgICAgICAg
ICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLXNhbXN1bmcuYyAgICAgICAgICAgICB8
ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMgICAgICAgICAgICAgIHwgIDEgLQ0K
PiAgIGRyaXZlcnMvcHdtL3B3bS1zbDI4Y3BsZC5jICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJp
dmVycy9wd20vcHdtLXNwZWFyLmMgICAgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3
bS9wd20tc3ByZC5jICAgICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1z
dGkuYyAgICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLXN0bTMyLWxw
LmMgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20tc3RtMzIuYyAgICAgICAg
ICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS1zdG1wZS5jICAgICAgICAgICAgICAg
fCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLXN1bjRpLmMgICAgICAgICAgICAgICB8ICAxIC0N
Cj4gICBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRy
aXZlcnMvcHdtL3B3bS10ZWdyYS5jICAgICAgICAgICAgICAgfCAgMSAtDQo+ICAgZHJpdmVycy9w
d20vcHdtLXRpZWNhcC5jICAgICAgICAgICAgICB8ICAxIC0NCj4gICBkcml2ZXJzL3B3bS9wd20t
dGllaHJwd20uYyAgICAgICAgICAgIHwgIDEgLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS10d2wtbGVk
LmMgICAgICAgICAgICAgfCAgMiAtLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS10d2wuYyAgICAgICAg
ICAgICAgICAgfCAgMiAtLQ0KPiAgIGRyaXZlcnMvcHdtL3B3bS12aXNjb250aS5jICAgICAgICAg
ICAgfCAgMSAtDQo+ICAgZHJpdmVycy9wd20vcHdtLXZ0ODUwMC5jICAgICAgICAgICAgICB8ICAx
IC0NCj4gICBkcml2ZXJzL3B3bS9wd20teGlsaW54LmMgICAgICAgICAgICAgIHwgIDEgLQ0KPiAg
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jICAgICAgICAgfCAgMSAtDQo+ICAgaW5jbHVk
ZS9saW51eC9wd20uaCAgICAgICAgICAgICAgICAgICB8IDEwICsrKysrKy0tLS0NCj4gICA2OCBm
aWxlcyBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCA4MiBkZWxldGlvbnMoLSkNCj4gDQoNCjxz
bmlwPg0KDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYyBiL2RyaXZlcnMv
cHdtL3B3bS1tZXNvbi5jDQo+IGluZGV4IDI1NTE5Y2RkYzJhOS4uNWJlYTUzMjQzZWQyIDEwMDY0
NA0KPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tbWVzb24uYw0KPiArKysgYi9kcml2ZXJzL3B3bS9w
d20tbWVzb24uYw0KPiBAQCAtMzM1LDcgKzMzNSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcHdt
X29wcyBtZXNvbl9wd21fb3BzID0gew0KPiAgIAkuZnJlZSA9IG1lc29uX3B3bV9mcmVlLA0KPiAg
IAkuYXBwbHkgPSBtZXNvbl9wd21fYXBwbHksDQo+ICAgCS5nZXRfc3RhdGUgPSBtZXNvbl9wd21f
Z2V0X3N0YXRlLA0KPiAtCS5vd25lciA9IFRISVNfTU9EVUxFLA0KPiAgIH07DQo+ICAgDQo+ICAg
c3RhdGljIGNvbnN0IGNoYXIgKiBjb25zdCBwd21fbWVzb244Yl9wYXJlbnRfbmFtZXNbXSA9IHsN
Cg0KPHNuaXA+DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlz
dHMubGluYXJvLm9yZwo=
