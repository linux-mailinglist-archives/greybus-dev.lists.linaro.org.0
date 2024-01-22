Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1612F837265
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jan 2024 20:24:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1AAAF43FCD
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jan 2024 19:24:27 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id C9DAA43E82
	for <greybus-dev@lists.linaro.org>; Mon, 22 Jan 2024 19:24:19 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Om7TXwRG;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of jic23@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=jic23@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7EAD7CE2C65;
	Mon, 22 Jan 2024 19:24:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBDEC433C7;
	Mon, 22 Jan 2024 19:23:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705951455;
	bh=MEXKZHQkB/IyiyQVHXrZDxlLURiVSiUhivYGVZLcqn0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Om7TXwRG+RLb91NjkMlGtbBbQYrAGinHi8YBBuORygdejt7BZ+vQd9Bqs0sBl/BxP
	 VCw1yjmez+FHyuigs8WrRG3xG5dxGPTpaOT2qYeFl6QHLeQijLl0kkOlguh3EaCef5
	 +AkOU52pnihuLtq9XxoisJbYHmdBJ7MWGdIGbaT+Hqd1d3bAs/JdGsBZD+YdEjOqeP
	 eiYtqYfgWpXt9iSL4haLcS9baDm6slcDBeeq4Pri4phWer/ACYdMdlNEE7R3pgjieo
	 tFpdEkRwqJLtm9GAX85YeLj+l6gbxcnR7JUDJE+8uHr22Geysx+TUOYD6M7QtotXaK
	 eSyrD1CGdOh3w==
Date: Mon, 22 Jan 2024 19:23:43 +0000
From: Jonathan Cameron <jic23@kernel.org>
To: Mark Brown <broonie@kernel.org>
Message-ID: <20240122192343.148a0b6d@jic23-huawei>
In-Reply-To: <e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
	<e62cdf7f-ce58-4f46-a0a0-25ce9fb271b1@sirena.org.uk>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.40; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C9DAA43E82
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-6.00 / 15.00];
	REPLY(-4.00)[];
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
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	MIME_TRACE(0.00)[0:+];
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
Message-ID-Hash: XOVYBB6ZDDNZI52D3ZCB6EBTYIXWU2RF
X-Message-ID-Hash: XOVYBB6ZDDNZI52D3ZCB6EBTYIXWU2RF
X-MailFrom: jic23@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>, kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Martin Tuma <martin.tuma@digiteqautomot
 ive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Pali =?UTF-8?B?Um9ow6Fy?= <pali@kernel.org>, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Ko
 nrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.c
 om>, Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XOVYBB6ZDDNZI52D3ZCB6EBTYIXWU2RF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMiBKYW4gMjAyNCAxODoxODoyMiArMDAwMA0KTWFyayBCcm93biA8YnJvb25pZUBr
ZXJuZWwub3JnPiB3cm90ZToNCg0KPiBPbiBNb24sIEphbiAyMiwgMjAyNCBhdCAwNzowNjo1NVBN
ICswMTAwLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4gDQo+ID4gTm90ZSB0aGF0IEpvbmF0
aGFuIENhbWVyb24gaGFzIGFscmVhZHkgYXBwbGllZCBwYXRjaCAzIHRvIGhpcyB0cmVlLCBpdA0K
PiA+IGRpZG4ndCBhcHBlYXIgaW4gYSBwdWJsaWMgdHJlZSB0aG91Z2ggeWV0LiBJIHN0aWxsIGlu
Y2x1ZGVkIGl0IGhlcmUgdG8NCj4gPiBtYWtlIHRoZSBrZXJuZWwgYnVpbGQgYm90cyBoYXBweS4g
IA0KPiANCj4gSXQncyBhbHNvIGdvaW5nIHRvIGJlIG5lZWRlZCBmb3IgYnVpbGRhYmlsaXR5IG9m
IHRoZSBlbmQgb2YgdGhlIHNlcmllcy4NCg0KQWguICBJIHRob3VnaHQgaW50ZW50IHdhcyB0byBz
cGxpdCB0aGlzIGFjcm9zcyBhbGwgdGhlIGRpZmZlcmVudCB0cmVlcw0KdGhlbiBkbyB0aGUgZmlu
YWwgcGF0Y2ggb25seSBhZnRlciB0aGV5IHdlcmUgYWxsIGdvbmU/DQoNCkknbSBmaW5lIHdpdGgg
aXQgZ29pbmcgYWxsIGluIG9uZSBnbyBpZiBwZW9wbGUgcHJlZmVyIHRoYXQuDQoNCk15IHRyZWUg
d2lsbCBiZSBvdXQgaW4gYSBmZXcgbWlucy4gV2FzIGp1c3Qgd2FpdGluZyB0byByZWJhc2Ugb24g
cmMxDQp3aGljaCBJJ3ZlIGp1c3QgZG9uZS4NCg0KSm9uYXRoYW4NCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAt
LSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1h
aWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
