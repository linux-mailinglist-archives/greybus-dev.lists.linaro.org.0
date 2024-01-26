Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F94F83DD7F
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 16:28:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 67F4640075
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 15:28:58 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	by lists.linaro.org (Postfix) with ESMTPS id 19BE03F00C
	for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 14:56:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=MbVI4LiA;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.41 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-io1-f41.google.com with SMTP id ca18e2360f4ac-7bedd61c587so23170739f.2
        for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 06:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706280999; x=1706885799; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wWtORc4HyTExlEpsqVhVjCB+kJhCKFinGlYPLAuyejg=;
        b=MbVI4LiA4R3KBxsseGQjm9C6flR2i674ABdXo5dA/blyBGGsiqUwoQA8/jt6TWaFbY
         UhanzM4xwWLbpGmERHJUnVabL7ua3pdJ/uUN4Qa1PBJthx/UjjNNveu+6B3YT0gNzrHU
         oPDcRcA1aOjKsRjdDGQY3jEYF9UnsJgbAhtFI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706280999; x=1706885799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wWtORc4HyTExlEpsqVhVjCB+kJhCKFinGlYPLAuyejg=;
        b=oDumdDD15cyqniXNY0J3cwNg0Iy2fu83m6S4xqYAJTPxU86/BEBXg+xEhae1g6HgE8
         KESoRbq65G1VxsCtLLs6J1t79TbVctQleR2yco0hNGqr26OfoPjBNKsP9QVMbPkVt2Wd
         jLnluJmoie64rnUpv7lYW6lefAETbKzRTcravNWNyvI39QLqOoo17rBrJsG+PFoGl7br
         wy0rQON7ViWe0PrbuUMWUCuYBx2qVr7WVmxVGrptOClIvg+25+Ph+VHNLGdCFGdGQUVO
         AQFT7MFER7Liea0L/aYUg6OYPn2peXguosRwxJL+DyN7Gy4J1SGs5elIFLFFGBawS1tt
         kaZQ==
X-Gm-Message-State: AOJu0Yy389p426kqnFAhPGuZ/LoFi3aRSbQsbRIXHb1aGTeVl+1Z/HVd
	luS26FChZRaHWHNwt2lepfVyDJ5+wP64YhG0+m4WoCYIQsO7aJCVT9pDXyY6Ng==
X-Google-Smtp-Source: AGHT+IE7L+Lf4nGmf8jBYvWvUbBMIPYEUcZmRKhPCMfOv7qLIoTicpYxj6Q75lc9mf95xYawNxxN/g==
X-Received: by 2002:a6b:4f13:0:b0:7bf:d2f2:3732 with SMTP id d19-20020a6b4f13000000b007bfd2f23732mr41889iob.19.1706280997488;
        Fri, 26 Jan 2024 06:56:37 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id m8-20020a056638224800b00470a4791160sm46771jas.109.2024.01.26.06.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 06:56:37 -0800 (PST)
Message-ID: <db05fb6a-2ea5-4e00-ac03-adc1897d96de@ieee.org>
Date: Fri, 26 Jan 2024 08:56:33 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>,
 linux-pwm@vger.kernel.org, Hector Martin <marcan@marcan.st>,
 Sven Peter <sven@svenpeter.dev>, Nicolas Ferre
 <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Alexander Shiyan <shc_work@mail.ru>, Benson Leung <bleung@chromium.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Paul Cercueil <paul@crapouillou.net>, Vladimir Zapolskiy <vz@mleia.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Heiko Stuebner <heiko@sntech.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Michael Walle <mwalle@kernel.org>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Hammer Hsieh <hammerh0314@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Sean Anderson <sean.anderson@seco.com>, Michal Simek <michal.simek@amd.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski
 <brgl@bgdev.pl>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Robert Foss <rfoss@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 Anjelique Melendez <quic_amelende@quicinc.com>,
 Andi Shyti <andi.shyti@kernel.org>, Lu Hongfei <luhongfei@vivo.com>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Luca Weiss <luca@z3ntu.xyz>,
 Johan Hovold <johan@kernel.org>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <f59b1a4a8d6fba65e4d3e8698310c9cb1d4c43ce.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 19BE03F00C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.49 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,rosenzweig.io,lists.linux.dev,lists.infradead.org,broadcom.com,chromium.org,gmail.com,nxp.com,baylibre.com,googlemail.com,samsung.com,st-md-mailman.stormreply.com,ideasonboard.com,kwiboo.se,lists.freedesktop.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[pengutronix.de,lwn.net,linuxfoundation.org,linux.intel.com,huawei.com,google.com,arm.com,vger.kernel.org,marcan.st,svenpeter.dev,microchip.com,bootlin.com,tuxon.dev,broadcom.com,mail.ru,chromium.org,kernel.org,crapouillou.net,mleia.com,redhat.com,gmail.com,collabora.com,linaro.org,baylibre.com,gmx.net,sntech.de,dabbelt.com,sifive.com,linux.alibaba.com,foss.st.com,csie.org,sholland.org,nvidia.com,toshiba.co.jp,seco.com,amd.com,bgdev.pl,intel.com,suse.de,ffwll.ch,ucw.cz,quicinc.com,vivo.com,z3ntu.xyz];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.41:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_GT_50(0.00)[100];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: V7BJAT65OUW57K4W24N3VKZIXKBYAAO2
X-Message-ID-Hash: V7BJAT65OUW57K4W24N3VKZIXKBYAAO2
X-Mailman-Approved-At: Fri, 26 Jan 2024 15:28:24 +0000
CC: linux-doc@vger.kernel.org, kernel@pengutronix.de, Alyssa Rosenzweig <alyssa@rosenzweig.io>, asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-mediatek@lists.infradead.org, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org, Douglas Anderson <dianders@chromium.org>, Laurent Pinchart <Laurent.pinchart@ide
 asonboard.com>, Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 040/111] pwm: Provide devm_pwmchip_alloc() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V7BJAT65OUW57K4W24N3VKZIXKBYAAO2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMS8yNS8yNCA2OjA5IEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4gVGhpcyBmdW5j
dGlvbiBhbGxvY2F0ZXMgYSBzdHJ1Y3QgcHdtX2NoaXAgYW5kIGRyaXZlciBkYXRhLiBDb21wYXJl
ZCB0bw0KPiB0aGUgc3RhdHVzIHF1byB0aGUgc3BsaXQgaW50byBwd21fY2hpcCBhbmQgZHJpdmVy
IGRhdGEgaXMgbmV3LCBvdGhlcndpc2UNCj4gaXQgZG9lc24ndCBjaGFuZ2UgYW55dGhpbmcgcmVs
ZXZhbnQgKHlldCkuDQo+IA0KPiBUaGUgaW50ZW50aW9uIGlzIHRoYXQgYWZ0ZXIgYWxsIGRyaXZl
cnMgYXJlIHN3aXRjaGVkIHRvIHVzZSB0aGlzDQo+IGFsbG9jYXRpb24gZnVuY3Rpb24sIGl0cyBw
b3NzaWJsZSB0byBhZGQgYSBzdHJ1Y3QgZGV2aWNlIHRvIHN0cnVjdA0KPiBwd21fY2hpcCB0byBw
cm9wZXJseSB0cmFjayB0aGUgbGF0dGVyJ3MgbGlmZXRpbWUgd2l0aG91dCB0b3VjaGluZyBhbGwN
Cj4gZHJpdmVycyBhZ2Fpbi4gUHJvcGVyIGxpZmV0aW1lIHRyYWNraW5nIGlzIGEgbmVjZXNzYXJ5
IHByZWNvbmRpdGlvbiB0bw0KPiBpbnRyb2R1Y2UgY2hhcmFjdGVyIGRldmljZSBzdXBwb3J0IGZv
ciBQV01zICh0aGF0IGltcGxlbWVudHMgYXRvbWljDQo+IHNldHRpbmcgYW5kIGRvZXNuJ3Qgc3Vm
ZmVyIGZyb20gdGhlIHN5c2ZzIG92ZXJoZWFkIG9mIHRoZSAvc3lzL2NsYXNzL3B3bQ0KPiB1c2Vy
c3BhY2Ugc3VwcG9ydCkuDQo+IA0KPiBUaGUgbmV3IGZ1bmN0aW9uIHB3bWNoaXBfcHJpdigpIChv
YnZpb3VzbHk/KSBvbmx5IHdvcmtzIGZvciBjaGlwcw0KPiBhbGxvY2F0ZWQgd2l0aCBkZXZtX3B3
bWNoaXBfYWxsb2MoKS4NCg0KSSB0aGluayB0aGlzIGxvb2tzIGdvb2QuICBUd28gcXVlc3Rpb25z
Og0KLSBTaG91bGQgeW91IGV4cGxpY2l0bHkgYWxpZ24gdGhlIHByaXZhdGUgZGF0YT8gIE9yIGRv
IHlvdSBiZWxpZXZlDQogICB0aGUgZGVmYXVsdCBhbGlnbm1lbnQgKGN1cnJlbnRseSBwb2ludGVy
IHNpemUgYWxpZ25lZCkgaXMgYWRlcXVhdGU/DQotIElzIHRoZXJlIGEgbm9uLWRldnJlcyB2ZXJz
aW9uIG9mIHRoZSBhbGxvY2F0aW9uIGZ1bmN0aW9uPw0KDQoJCQkJCS1BbGV4DQoNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9u
aXguZGU+DQo+IC0tLQ0KPiAgIC4uLi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZyZXMucnN0
ICAgICAgICB8ICAxICsNCj4gICBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvcHdtLnJzdCAgICAg
ICAgICAgICAgfCAxMCArKysrLS0tLQ0KPiAgIGRyaXZlcnMvcHdtL2NvcmUuYyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB8IDI1ICsrKysrKysrKysrKysrKysrKysNCj4gICBpbmNsdWRlL2xp
bnV4L3B3bS5oICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArKw0KPiAgIDQgZmlsZXMg
Y2hhbmdlZCwgMzMgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1n
aXQgYS9Eb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QgYi9E
b2N1bWVudGF0aW9uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QNCj4gaW5kZXgg
YzVmOTlkODM0ZWM1Li5lNGRmNzJjNDA4ZDIgMTAwNjQ0DQo+IC0tLSBhL0RvY3VtZW50YXRpb24v
ZHJpdmVyLWFwaS9kcml2ZXItbW9kZWwvZGV2cmVzLnJzdA0KPiArKysgYi9Eb2N1bWVudGF0aW9u
L2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QNCj4gQEAgLTQyMCw2ICs0MjAsNyBA
QCBQT1dFUg0KPiAgICAgZGV2bV9yZWJvb3RfbW9kZV91bnJlZ2lzdGVyKCkNCj4gICANCj4gICBQ
V00NCj4gKyAgZGV2bV9wd21jaGlwX2FsbG9jKCkNCj4gICAgIGRldm1fcHdtY2hpcF9hZGQoKQ0K
PiAgICAgZGV2bV9wd21fZ2V0KCkNCj4gICAgIGRldm1fZndub2RlX3B3bV9nZXQoKQ0KPiBkaWZm
IC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QgYi9Eb2N1bWVudGF0aW9u
L2RyaXZlci1hcGkvcHdtLnJzdA0KPiBpbmRleCAzYzI4Y2NjNGI2MTEuLmNlZTY2YzdmMDMzNSAx
MDA2NDQNCj4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QNCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3B3bS5yc3QNCj4gQEAgLTE0MywxMSArMTQzLDExIEBA
IHRvIGltcGxlbWVudCB0aGUgcHdtXyooKSBmdW5jdGlvbnMgaXRzZWxmLiBUaGlzIG1lYW5zIHRo
YXQgaXQncyBpbXBvc3NpYmxlDQo+ICAgdG8gaGF2ZSBtdWx0aXBsZSBQV00gZHJpdmVycyBpbiB0
aGUgc3lzdGVtLiBGb3IgdGhpcyByZWFzb24gaXQncyBtYW5kYXRvcnkNCj4gICBmb3IgbmV3IGRy
aXZlcnMgdG8gdXNlIHRoZSBnZW5lcmljIFBXTSBmcmFtZXdvcmsuDQo+ICAgDQo+IC1BIG5ldyBQ
V00gY29udHJvbGxlci9jaGlwIGNhbiBiZSBhZGRlZCB1c2luZyBwd21jaGlwX2FkZCgpIGFuZCBy
ZW1vdmVkDQo+IC1hZ2FpbiB3aXRoIHB3bWNoaXBfcmVtb3ZlKCkuIHB3bWNoaXBfYWRkKCkgdGFr
ZXMgYSBmaWxsZWQgaW4gc3RydWN0DQo+IC1wd21fY2hpcCBhcyBhcmd1bWVudCB3aGljaCBwcm92
aWRlcyBhIGRlc2NyaXB0aW9uIG9mIHRoZSBQV00gY2hpcCwgdGhlDQo+IC1udW1iZXIgb2YgUFdN
IGRldmljZXMgcHJvdmlkZWQgYnkgdGhlIGNoaXAgYW5kIHRoZSBjaGlwLXNwZWNpZmljDQo+IC1p
bXBsZW1lbnRhdGlvbiBvZiB0aGUgc3VwcG9ydGVkIFBXTSBvcGVyYXRpb25zIHRvIHRoZSBmcmFt
ZXdvcmsuDQo+ICtBIG5ldyBQV00gY29udHJvbGxlci9jaGlwIGNhbiBiZSBhbGxvY2F0ZWQgdXNp
bmcgZGV2bV9wd21jaGlwX2FsbG9jLCB0aGVuIGFkZGVkDQo+ICt1c2luZyBwd21jaGlwX2FkZCgp
IGFuZCByZW1vdmVkIGFnYWluIHdpdGggcHdtY2hpcF9yZW1vdmUoKS4gcHdtY2hpcF9hZGQoKQ0K
PiArdGFrZXMgYSBmaWxsZWQgaW4gc3RydWN0IHB3bV9jaGlwIGFzIGFyZ3VtZW50IHdoaWNoIHBy
b3ZpZGVzIGEgZGVzY3JpcHRpb24gb2YNCj4gK3RoZSBQV00gY2hpcCwgdGhlIG51bWJlciBvZiBQ
V00gZGV2aWNlcyBwcm92aWRlZCBieSB0aGUgY2hpcCBhbmQgdGhlDQo+ICtjaGlwLXNwZWNpZmlj
IGltcGxlbWVudGF0aW9uIG9mIHRoZSBzdXBwb3J0ZWQgUFdNIG9wZXJhdGlvbnMgdG8gdGhlIGZy
YW1ld29yay4NCj4gICANCj4gICBXaGVuIGltcGxlbWVudGluZyBwb2xhcml0eSBzdXBwb3J0IGlu
IGEgUFdNIGRyaXZlciwgbWFrZSBzdXJlIHRvIHJlc3BlY3QgdGhlDQo+ICAgc2lnbmFsIGNvbnZl
bnRpb25zIGluIHRoZSBQV00gZnJhbWV3b3JrLiBCeSBkZWZpbml0aW9uLCBub3JtYWwgcG9sYXJp
dHkNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL2NvcmUuYyBiL2RyaXZlcnMvcHdtL2NvcmUu
Yw0KPiBpbmRleCAxYjRjM2QwY2FhODIuLmI4MjFhMmIwYjE3MiAxMDA2NDQNCj4gLS0tIGEvZHJp
dmVycy9wd20vY29yZS5jDQo+ICsrKyBiL2RyaXZlcnMvcHdtL2NvcmUuYw0KPiBAQCAtNDU0LDYg
KzQ1NCwzMSBAQCBvZl9wd21fc2luZ2xlX3hsYXRlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgY29u
c3Qgc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqYXJncykNCj4gICB9DQo+ICAgRVhQT1JUX1NZTUJP
TF9HUEwob2ZfcHdtX3NpbmdsZV94bGF0ZSk7DQo+ICAgDQo+ICtzdGF0aWMgdm9pZCAqcHdtY2hp
cF9wcml2KHN0cnVjdCBwd21fY2hpcCAqY2hpcCkNCj4gK3sNCj4gKwlyZXR1cm4gKHZvaWQgKilj
aGlwICsgc2l6ZW9mKCpjaGlwKTsNCj4gK30NCj4gKw0KPiArc3RydWN0IHB3bV9jaGlwICpkZXZt
X3B3bWNoaXBfYWxsb2Moc3RydWN0IGRldmljZSAqcGFyZW50LCB1bnNpZ25lZCBpbnQgbnB3bSwg
c2l6ZV90IHNpemVvZl9wcml2KQ0KPiArew0KPiArCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsNCj4g
KwlzaXplX3QgYWxsb2Nfc2l6ZTsNCj4gKw0KPiArCWFsbG9jX3NpemUgPSBzaXplX2FkZChzaXpl
b2YoKmNoaXApLCBzaXplb2ZfcHJpdik7DQo+ICsNCj4gKwljaGlwID0gZGV2bV9remFsbG9jKHBh
cmVudCwgYWxsb2Nfc2l6ZSwgR0ZQX0tFUk5FTCk7DQo+ICsJaWYgKCFjaGlwKQ0KPiArCQlyZXR1
cm4gRVJSX1BUUigtRU5PTUVNKTsNCj4gKw0KPiArCWNoaXAtPmRldiA9IHBhcmVudDsNCj4gKwlj
aGlwLT5ucHdtID0gbnB3bTsNCj4gKw0KPiArCXB3bWNoaXBfc2V0X2RydmRhdGEoY2hpcCwgcHdt
Y2hpcF9wcml2KGNoaXApKTsNCj4gKw0KPiArCXJldHVybiBjaGlwOw0KPiArfQ0KPiArRVhQT1JU
X1NZTUJPTF9HUEwoZGV2bV9wd21jaGlwX2FsbG9jKTsNCj4gKw0KPiAgIHN0YXRpYyB2b2lkIG9m
X3B3bWNoaXBfYWRkKHN0cnVjdCBwd21fY2hpcCAqY2hpcCkNCj4gICB7DQo+ICAgCWlmICghY2hp
cC0+ZGV2IHx8ICFjaGlwLT5kZXYtPm9mX25vZGUpDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L3B3bS5oIGIvaW5jbHVkZS9saW51eC9wd20uaA0KPiBpbmRleCAyYzQ5ZDJmZTJmZTcuLjhi
Yzc1MDRhYTdkNCAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS9saW51eC9wd20uaA0KPiArKysgYi9p
bmNsdWRlL2xpbnV4L3B3bS5oDQo+IEBAIC00MDMsNiArNDAzLDggQEAgc3RhdGljIGlubGluZSBi
b29sIHB3bV9taWdodF9zbGVlcChzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQ0KPiAgIGludCBwd21f
Y2FwdHVyZShzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLCBzdHJ1Y3QgcHdtX2NhcHR1cmUgKnJlc3Vs
dCwNCj4gICAJCXVuc2lnbmVkIGxvbmcgdGltZW91dCk7DQo+ICAgDQo+ICtzdHJ1Y3QgcHdtX2No
aXAgKmRldm1fcHdtY2hpcF9hbGxvYyhzdHJ1Y3QgZGV2aWNlICpwYXJlbnQsIHVuc2lnbmVkIGlu
dCBucHdtLCBzaXplX3Qgc2l6ZW9mX3ByaXYpOw0KPiArDQo+ICAgaW50IF9fcHdtY2hpcF9hZGQo
c3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3QgbW9kdWxlICpvd25lcik7DQo+ICAgI2RlZmlu
ZSBwd21jaGlwX2FkZChjaGlwKSBfX3B3bWNoaXBfYWRkKGNoaXAsIFRISVNfTU9EVUxFKQ0KPiAg
IHZvaWQgcHdtY2hpcF9yZW1vdmUoc3RydWN0IHB3bV9jaGlwICpjaGlwKTsNCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
