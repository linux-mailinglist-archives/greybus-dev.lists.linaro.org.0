Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EB835847581
	for <lists+greybus-dev@lfdr.de>; Fri,  2 Feb 2024 18:00:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0929B40C73
	for <lists+greybus-dev@lfdr.de>; Fri,  2 Feb 2024 17:00:05 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 783313F36D
	for <greybus-dev@lists.linaro.org>; Thu,  1 Feb 2024 21:47:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="KYhAJw//";
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of jarkko@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=jarkko@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 88A646218F;
	Thu,  1 Feb 2024 21:47:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEB5C433C7;
	Thu,  1 Feb 2024 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706824052;
	bh=ONdXqAS27cKeOgWX4XGTKCxg4rE0mzWElHVnnYMMb0Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYhAJw//yARcM3TA6pVCkI4LUiBLE5XWbQdyIJ2IOE9XeeW9PXuRT0u1fpPxxrkwp
	 Hurjt/dBf8xwi23T1FksMdv9e36XHyjvhrDNFhBSr1xRnTYLMYbJE3ILCL/Xokm/MD
	 5zQO0eFXQidwjXeacacwmmo5pMdGivYcXVl5OsSlyzb4uDD6zF3QHkW/ipNCSyCrkX
	 ruFySuh4tDJV4Rf4YFiYpBgTsdWdhvZKAcl5M+3wneiWVFJ2zo1QtBfWDecyRoxa73
	 fETXEmGDyXWVSu/j1Xloaznpi7OcrAoyx70CgInqn+hTw2H52XDK3rA5SorsXzUwVT
	 KByKrTZWMbAOA==
Mime-Version: 1.0
Date: Thu, 01 Feb 2024 23:47:13 +0200
Message-Id: <CYU2MG4IOJ0Q.2UJOTK999FCCC@suppilovahvero>
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Mark Brown" <broonie@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.15.2
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
 <2024012417-prissy-sworn-bc55@gregkh>
 <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
In-Reply-To: <c1e38a30-5075-4d01-af24-ac684e77cf29@sirena.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 783313F36D
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.50 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,linaro.org,ansari.sh,linux.intel.com,huawei.com,digiteqautomotive.com,netup.ru,arndb.de,nod.at,ti.com,sntech.de,amd.com,alsa-project.org,lists.infradead.org,googlemail.com,glider.be,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,rowland.harvard.edu,iki.fi,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[90];
	DKIM_TRACE(0.00)[kernel.org:+]
X-MailFrom: jarkko@kernel.org
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
Message-ID-Hash: WO5BOLBBIKEKR5L5M6EKVL2VLWVQBZ3Y
X-Message-ID-Hash: WO5BOLBBIKEKR5L5M6EKVL2VLWVQBZ3Y
X-Mailman-Approved-At: Fri, 02 Feb 2024 16:59:59 +0000
CC: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Marti
 n Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn 
 Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.co
 m>, Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WO5BOLBBIKEKR5L5M6EKVL2VLWVQBZ3Y/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gV2VkIEphbiAyNCwgMjAyNCBhdCA3OjIyIFBNIEVFVCwgTWFyayBCcm93biB3cm90ZToNCj4g
T24gV2VkLCBKYW4gMjQsIDIwMjQgYXQgMDk6MTM6NDlBTSAtMDgwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOg0KPiA+IE9uIE1vbiwgSmFuIDIyLCAyMDI0IGF0IDA3OjA2OjU1UE0gKzAxMDAs
IFV3ZSBLbGVpbmUtS8O2bmlnIHdyb3RlOg0KPg0KPiA+ID4gTm90ZSB0aGF0IEpvbmF0aGFuIENh
bWVyb24gaGFzIGFscmVhZHkgYXBwbGllZCBwYXRjaCAzIHRvIGhpcyB0cmVlLCBpdA0KPiA+ID4g
ZGlkbid0IGFwcGVhciBpbiBhIHB1YmxpYyB0cmVlIHRob3VnaCB5ZXQuIEkgc3RpbGwgaW5jbHVk
ZWQgaXQgaGVyZSB0bw0KPiA+ID4gbWFrZSB0aGUga2VybmVsIGJ1aWxkIGJvdHMgaGFwcHkuDQo+
DQo+ID4gQXJlIHdlIHN1cHBvc2VkIHRvIHRha2UgdGhlIGluZGl2aWR1YWwgY2hhbmdlcyBpbiBv
dXIgZGlmZmVyZW50DQo+ID4gc3Vic3lzdGVtIHRyZWVzLCBvciBkbyB5b3Ugd2FudCB0aGVtIGFs
bCB0byBnbyB0aHJvdWdoIHRoZSBzcGkgdHJlZT8NCj4NCj4gR2l2ZW4gdGhhdCB0aGUgZmluYWwg
cGF0Y2ggcmVtb3ZlcyB0aGUgbGVnYWN5IGludGVyZmFjZXMgSSdtIGV4cGVjdGluZw0KPiB0byB0
YWtlIHRoZW0gdmlhIFNQSS4NCg0KKzENCg0KbGVhc3QgZnVzcyBhcHByb2FjaA0KDQpCUiwgSmFy
a2tvDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFy
by5vcmcK
