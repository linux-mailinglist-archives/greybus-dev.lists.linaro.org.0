Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C4183B2B2
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 21:02:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CB9C643E78
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 20:02:51 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id ED8AC3F0C8
	for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 20:02:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=TIXWtyFH;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of jic23@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=jic23@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 66341CE321D;
	Wed, 24 Jan 2024 20:02:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9C4C433F1;
	Wed, 24 Jan 2024 20:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706126562;
	bh=jfXWrPM5ALhDnKgFnFkdz4CMio32hmCt3xWSsf12HKU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TIXWtyFH5yxUa2sKS25qW3wOvsP8Ed2klnxIK0jQEvMXqnYVHZWCU0zqLjO7+ilCR
	 JWdnVZmbglYShezSvqIcZWDN/Vh46HywERZIGBwdalc9QELX9rTL+upLtWfATkdWgT
	 WOJSdLKuC7J9/6NYjh+DNGAalqkPr+gBHAK+jK1uAFFeeu8RJwLSBlu58kMYFUoEl1
	 Yp7MPDfACwXPwjaV1u4/U968HoLm30T94Tl/mdr2QRYc4fOG1E9E30BuK8sKFpJ4U8
	 n+9CHV5JSYN6y7zhCegxJ1IM+OVstyfug/6ZJ17Jvqz0l9lgm0LjUJl94LQR9K86D2
	 ni5ld1wGOGq1w==
Date: Wed, 24 Jan 2024 20:02:07 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org
Message-ID: <20240124200207.7e02b501@jic23-huawei>
In-Reply-To: <20240122192343.148a0b6d@jic23-huawei>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
	<20240122192343.148a0b6d@jic23-huawei>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.40; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: ED8AC3F0C8
X-Spamd-Bar: -
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,linaro.org,ansari.sh,linux.intel.com,huawei.com,digiteqautomotive.com,netup.ru,arndb.de,linuxfoundation.org,nod.at,ti.com,sntech.de,amd.com,alsa-project.org,lists.infradead.org,googlemail.com,glider.be,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,rowland.harvard.edu,iki.fi,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[90];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: ZTYAQZ6B53Q5L3FXMPMW4RUAGZT5WREA
X-Message-ID-Hash: ZTYAQZ6B53Q5L3FXMPMW4RUAGZT5WREA
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Martin Tuma <martin.tuma@digiteqautomot
 ive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@
 linaro.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Kalle Valo <kvalo@kern
 el.org>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZTYAQZ6B53Q5L3FXMPMW4RUAGZT5WREA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMiBKYW4gMjAyNCAxOToyMzo0MyArMDAwMA0KSm9uYXRoYW4gQ2FtZXJvbiA8amlj
MjNAa2VybmVsLm9yZz4gd3JvdGU6DQoNCj4gT24gTW9uLCAyMiBKYW4gMjAyNCAxODoxODoyMiAr
MDAwMA0KPiBNYXJrIEJyb3duIDxicm9vbmllQGtlcm5lbC5vcmc+IHdyb3RlOg0KPiANCj4gPiBP
biBNb24sIEphbiAyMiwgMjAyNCBhdCAwNzowNjo1NVBNICswMTAwLCBVd2UgS2xlaW5lLUvDtm5p
ZyB3cm90ZToNCj4gPiAgIA0KPiA+ID4gTm90ZSB0aGF0IEpvbmF0aGFuIENhbWVyb24gaGFzIGFs
cmVhZHkgYXBwbGllZCBwYXRjaCAzIHRvIGhpcyB0cmVlLCBpdA0KPiA+ID4gZGlkbid0IGFwcGVh
ciBpbiBhIHB1YmxpYyB0cmVlIHRob3VnaCB5ZXQuIEkgc3RpbGwgaW5jbHVkZWQgaXQgaGVyZSB0
bw0KPiA+ID4gbWFrZSB0aGUga2VybmVsIGJ1aWxkIGJvdHMgaGFwcHkuICAgIA0KPiA+IA0KPiA+
IEl0J3MgYWxzbyBnb2luZyB0byBiZSBuZWVkZWQgZm9yIGJ1aWxkYWJpbGl0eSBvZiB0aGUgZW5k
IG9mIHRoZSBzZXJpZXMuICANCj4gDQo+IEFoLiAgSSB0aG91Z2h0IGludGVudCB3YXMgdG8gc3Bs
aXQgdGhpcyBhY3Jvc3MgYWxsIHRoZSBkaWZmZXJlbnQgdHJlZXMNCj4gdGhlbiBkbyB0aGUgZmlu
YWwgcGF0Y2ggb25seSBhZnRlciB0aGV5IHdlcmUgYWxsIGdvbmU/DQo+IA0KPiBJJ20gZmluZSB3
aXRoIGl0IGdvaW5nIGFsbCBpbiBvbmUgZ28gaWYgcGVvcGxlIHByZWZlciB0aGF0Lg0KPiANCj4g
TXkgdHJlZSB3aWxsIGJlIG91dCBpbiBhIGZldyBtaW5zLiBXYXMganVzdCB3YWl0aW5nIHRvIHJl
YmFzZSBvbiByYzENCj4gd2hpY2ggSSd2ZSBqdXN0IGRvbmUuDQo+IA0KPiBKb25hdGhhbg0KPiAN
Cg0KRHJvcHBlZCBmcm9tIG15IHRyZWUuDQoNCkFja2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxK
b25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
