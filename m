Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF50836F14
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jan 2024 19:09:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EE2DF43D44
	for <lists+greybus-dev@lfdr.de>; Mon, 22 Jan 2024 18:09:16 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 9A6803EFEA
	for <greybus-dev@lists.linaro.org>; Mon, 22 Jan 2024 18:09:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiY-0001lP-N0; Mon, 22 Jan 2024 19:08:18 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiS-001ePE-PM; Mon, 22 Jan 2024 19:08:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rRyiS-005Zwj-1m;
	Mon, 22 Jan 2024 19:08:12 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 22 Jan 2024 19:06:55 +0100
Message-ID: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5874; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=r4hNLx1axTK9D2SO1h2Nidy6wdhcdwS0oI6JMP4mupU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlrq7CRGL5rco/IZ7baQyO1t3S9it11eXvRLZKR GbQbTfz3/2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZa6uwgAKCRCPgPtYfRL+ TlSmB/4k7WiBaRL3saK9pl+Gkw8Hqk7HVFstVTQ/rkaYbIsJGY0xZw8/1EJjSObFeB+APA4aMQh I79wzfj/BAi6u9wIsVNiQ9y/G7wHtwifXCuuRBAfRSQICGNo++YWb4VjoViqUrlwFz1on55YRHO fF0At9RAUzuTpDwaPQlercYTSV2fRZOyE6oFjYu50ibPS5RDRAlt5RMXKu+KeNvZIt1a7rYblZd 3X+5IV8boWAzqfA2x+ESE9bxy64tcf4U55YuI4LIo7T/6pTUUmJEXiJK3Hqi+KdRcDIt0RoY0Co KLQSX3Yu+cnQoWcdVVqzWe5P2RjCFOxbxIHkvh+IxoWx5PzK
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9A6803EFEA
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[renesas];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.961];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,linaro.org,ansari.sh,linux.intel.com,huawei.com,digiteqautomotive.com,netup.ru,arndb.de,linuxfoundation.org,nod.at,ti.com,sntech.de,amd.com,alsa-project.org,lists.infradead.org,googlemail.com,glider.be,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,rowland.harvard.edu,iki.fi,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[90];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[]
Message-ID-Hash: E66TKXHHORRWSYL5QPSROH23UKSLFLFJ
X-Message-ID-Hash: E66TKXHHORRWSYL5QPSROH23UKSLFLFJ
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Martin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab <m
 chehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linar
 o.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Kalle Valo <kvalo@kernel.or
 g>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E66TKXHHORRWSYL5QPSROH23UKSLFLFJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCnRoaXMgaXMgdjIgb2YgdGhpcyBwYXRjaCBzZXQuDQoNCkNoYW5nZXMgc2luY2Ug
KGltcGxpY2l0KSB2MSwgc2VudCB3aXRoIE1lc3NhZ2UtSWQ6DQpjb3Zlci4xNzA1MzQ4MjY5Lmdp
dC51LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU6DQoNCiAtIFJlYmFzZSB0byB2Ni44LXJj
MQ0KIC0gRml4IGEgYnVpbGQgZmFpbHVyZSBvbiBzaA0KIC0gQWRkZWQgdGhlIHRhZ3MgcmVjZWl2
ZWQgaW4gKGltcGxpY2l0KSB2MS4NCg0KVGhlIHNsYXZlLW10Mjd4eCBkcml2ZXIgbmVlZHMgc29t
ZSBtb3JlIHdvcmsuIFRoZSBwYXRjaCBwcmVzZW50ZWQgaGVyZQ0KaXMgZW5vdWdoIGhvd2V2ZXIg
dG8gZ2V0IHJpZCBvZiB0aGUgZGVmaW5lcyBoYW5kbGVkIGluIHBhdGNoIDMyLg0KQ2xlYW5pbmcg
dGhhdCB1cCBpcyBvdXQtb2Ytc2NvcGUgZm9yIHRoaXMgc2VyaWVzLCBzbyBJJ2xsIGRlbGF5IHRo
YXQNCnVudGlsIGxhdGVyLg0KDQpOb3RlIHRoYXQgSm9uYXRoYW4gQ2FtZXJvbiBoYXMgYWxyZWFk
eSBhcHBsaWVkIHBhdGNoIDMgdG8gaGlzIHRyZWUsIGl0DQpkaWRuJ3QgYXBwZWFyIGluIGEgcHVi
bGljIHRyZWUgdGhvdWdoIHlldC4gSSBzdGlsbCBpbmNsdWRlZCBpdCBoZXJlIHRvDQptYWtlIHRo
ZSBrZXJuZWwgYnVpbGQgYm90cyBoYXBweS4NCg0KQmVzdCByZWdhcmRzDQpVd2UNCg0KVXdlIEts
ZWluZS1Lw7ZuaWcgKDMzKToNCiAgZnBnYTogaWNlNDAtc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2Yg
U1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBpZWVlODAyMTU0OiBjYTgyMTA6IEZvbGxv
dyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIGlpbzogYWRjOiBh
ZF9zaWdtYV9kZWx0YTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0bw0KICAgICJj
b250cm9sbGVyIg0KICBJbnB1dDogcHhzcGFkIC0gZm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFz
dGVyIiB0byAiY29udHJvbGxlciINCiAgSW5wdXQ6IHN5bmFwdGljcy1ybWk0IC0gZm9sbG93IHJl
bmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0bw0KICAgICJjb250cm9sbGVyIg0KICBtZWRpYTogbWdi
NDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgbWVk
aWE6IG5ldHVwX3VuaWR2YjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29u
dHJvbGxlciINCiAgbWVkaWE6IHVzYi9tc2kyNTAwOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJt
YXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBtZWRpYTogdjRsMi1zdWJkZXY6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIG1pc2M6IGdlaGMtYWNoYzog
Rm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgbW1jOiBt
bWNfc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0K
ICBtdGQ6IGRhdGFmbGFzaDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29u
dHJvbGxlciINCiAgbXRkOiByYXduYW5kOiBmc2xfZWxiYzogTGV0IC5wcm9iZSByZXRyeSBpZiBs
b2NhbCBidXMgaXMgbWlzc2luZw0KICBuZXQ6IGtzODg1MTogRm9sbG93IHJlbmFtaW5nIG9mIFNQ
SSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgbmV0OiB2ZXJ0ZXhjb206IG1zZTEwMng6IEZv
bGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8NCiAgICAiY29udHJvbGxlciINCiAgcGxh
dGZvcm0vY2hyb21lOiBjcm9zX2VjX3NwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVy
IiB0bw0KICAgICJjb250cm9sbGVyIg0KICBzcGk6IGJpdGJhbmc6IEZvbGxvdyByZW5hbWluZyBv
ZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIHNwaTogY2FkZW5jZS1xdWFkc3BpOiBE
b24ndCBlbWl0IGVycm9yIG1lc3NhZ2Ugb24gYWxsb2NhdGlvbiBlcnJvcg0KICBzcGk6IGNhZGVu
Y2UtcXVhZHNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxl
ciINCiAgc3BpOiBjYXZpdW06IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNv
bnRyb2xsZXIiDQogIHNwaTogZ2VuaS1xY29tOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIg0KICBzcGk6IGxvb3BiYWNrLXRlc3Q6IEZvbGxvdyByZW5hbWlu
ZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIHNwaTogc2xhdmUtbXQyN3h4OiBG
b2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBzcGk6IHNw
aWRldjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAg
c3RhZ2luZzogZmJ0ZnQ6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRy
b2xsZXIiDQogIHN0YWdpbmc6IGdyZXlidXM6IHNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAi
bWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgdHBtX3Rpc19zcGk6IEZvbGxvdyByZW5hbWluZyBv
ZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIHVzYjogZ2FkZ2V0OiBtYXgzNDIwX3Vk
YzogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0bw0KICAgICJjb250cm9sbGVyIg0K
ICB2aWRlbzogZmJkZXY6IG1tcDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAi
Y29udHJvbGxlciINCiAgd2lmaTogbGliZXJ0YXM6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1h
c3RlciIgdG8gImNvbnRyb2xsZXIiDQogIHNwaTogZnNsLWxpYjogRm9sbG93IHJlbmFtaW5nIG9m
IFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgc3BpOiBEcm9wIGNvbXBhdCBsYXllciBm
cm9tIHJlbmFtaW5nICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBEb2N1bWVudGF0aW9uOiBz
cGk6IFVwZGF0ZSBkb2N1bWVudGF0aW9uIGZvciByZW5hbWluZyAibWFzdGVyIiB0bw0KICAgICJj
b250cm9sbGVyIg0KDQogLi4uL2RyaXZlci1hcGkvZHJpdmVyLW1vZGVsL2RldnJlcy5yc3QgICAg
ICAgIHwgIDIgKy0NCiBEb2N1bWVudGF0aW9uL3NwaS9zcGktc3VtbWFyeS5yc3QgICAgICAgICAg
ICAgfCA3NCArKysrKysrKystLS0tLS0tLS0tDQogZHJpdmVycy9jaGFyL3RwbS90cG1fdGlzX3Nw
aV9tYWluLmMgICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL2ZwZ2EvaWNlNDAtc3BpLmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvaWlvL2FkYy9hZF9zaWdtYV9kZWx0
YS5jICAgICAgICAgICAgICB8IDE0ICsrLS0NCiBkcml2ZXJzL2lucHV0L2pveXN0aWNrL3BzeHBh
ZC1zcGkuYyAgICAgICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvaW5wdXQvcm1pNC9ybWlfc3BpLmMg
ICAgICAgICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9tZWRpYS9wY2kvbWdiNC9tZ2I0X2Nv
cmUuYyAgICAgICAgICAgIHwgMTQgKystLQ0KIC4uLi9tZWRpYS9wY2kvbmV0dXBfdW5pZHZiL25l
dHVwX3VuaWR2Yl9zcGkuYyB8IDQ4ICsrKysrKy0tLS0tLQ0KIGRyaXZlcnMvbWVkaWEvdXNiL21z
aTI1MDAvbXNpMjUwMC5jICAgICAgICAgICB8IDM4ICsrKysrLS0tLS0NCiBkcml2ZXJzL21lZGlh
L3Y0bDItY29yZS92NGwyLXNwaS5jICAgICAgICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvbWlzYy9n
ZWhjLWFjaGMuYyAgICAgICAgICAgICAgICAgICAgICB8ICA4ICstDQogZHJpdmVycy9tbWMvaG9z
dC9tbWNfc3BpLmMgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0NCiBkcml2ZXJzL210ZC9kZXZp
Y2VzL210ZF9kYXRhZmxhc2guYyAgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvbXRkL25hbmQv
cmF3L2ZzbF9lbGJjX25hbmQuYyAgICAgICAgICB8ICAzICstDQogZHJpdmVycy9uZXQvZXRoZXJu
ZXQvbWljcmVsL2tzODg1MV9zcGkuYyAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL25ldC9ldGhlcm5l
dC92ZXJ0ZXhjb20vbXNlMTAyeC5jICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvbmV0L2llZWU4MDIx
NTQvY2E4MjEwLmMgICAgICAgICAgICAgICB8ICAyICstDQogLi4uL25ldC93aXJlbGVzcy9tYXJ2
ZWxsL2xpYmVydGFzL2lmX3NwaS5jICAgIHwgIDIgKy0NCiBkcml2ZXJzL3BsYXRmb3JtL2Nocm9t
ZS9jcm9zX2VjX3NwaS5jICAgICAgICAgfCAgOCArLQ0KIGRyaXZlcnMvc3BpL3NwaS1hdGg3OS5j
ICAgICAgICAgICAgICAgICAgICAgICB8ICA0ICstDQogZHJpdmVycy9zcGkvc3BpLWJpdGJhbmcu
YyAgICAgICAgICAgICAgICAgICAgIHwgNjQgKysrKysrKystLS0tLS0tLQ0KIGRyaXZlcnMvc3Bp
L3NwaS1idXR0ZXJmbHkuYyAgICAgICAgICAgICAgICAgICB8ICA2ICstDQogZHJpdmVycy9zcGkv
c3BpLWNhZGVuY2UtcXVhZHNwaS5jICAgICAgICAgICAgIHwgIDcgKy0NCiBkcml2ZXJzL3NwaS9z
cGktY2F2aXVtLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQ0KIGRyaXZlcnMvc3BpL3Nw
aS1jYXZpdW0uaCAgICAgICAgICAgICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9zcGkvc3Bp
LWRhdmluY2kuYyAgICAgICAgICAgICAgICAgICAgIHwgIDYgKy0NCiBkcml2ZXJzL3NwaS9zcGkt
ZnNsLWxpYi5jICAgICAgICAgICAgICAgICAgICAgfCAxNCArKy0tDQogZHJpdmVycy9zcGkvc3Bp
LWdlbmktcWNvbS5jICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3NwaS9zcGkt
Z3Bpby5jICAgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1s
bTcwbGxwLmMgICAgICAgICAgICAgICAgICAgICB8ICA2ICstDQogZHJpdmVycy9zcGkvc3BpLWxv
b3BiYWNrLXRlc3QuYyAgICAgICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL3NwaS9zcGktb2Mt
dGlueS5jICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1vbWFw
LXV3aXJlLmMgICAgICAgICAgICAgICAgICB8ICA0ICstDQogZHJpdmVycy9zcGkvc3BpLXNoLXNj
aS5jICAgICAgICAgICAgICAgICAgICAgIHwgMTAgKy0tDQogZHJpdmVycy9zcGkvc3BpLXNsYXZl
LW10Mjd4eC5jICAgICAgICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3NwaS9zcGkteGlsaW54
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvc3BpL3NwaS14dGVuc2Et
eHRmcGdhLmMgICAgICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9zcGkvc3BpLmMgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3NwaS9zcGlkZXYuYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3RhZ2luZy9mYnRmdC9mYnRm
dC1jb3JlLmMgICAgICAgICAgICB8ICA0ICstDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3Bp
bGliLmMgICAgICAgICAgICAgIHwgNjYgKysrKysrKystLS0tLS0tLS0NCiBkcml2ZXJzL3VzYi9n
YWRnZXQvdWRjL21heDM0MjBfdWRjLmMgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvbW1wL2h3L21tcF9zcGkuYyAgICAgICAgICB8IDI2ICsrKy0tLS0NCiBpbmNsdWRlL2xp
bnV4L3NwaS9zcGkuaCAgICAgICAgICAgICAgICAgICAgICAgfCAyMCArLS0tLQ0KIGluY2x1ZGUv
bGludXgvc3BpL3NwaV9iaXRiYW5nLmggICAgICAgICAgICAgICB8ICAyICstDQogaW5jbHVkZS9t
ZWRpYS92NGwyLWNvbW1vbi5oICAgICAgICAgICAgICAgICAgIHwgIDYgKy0NCiA0NyBmaWxlcyBj
aGFuZ2VkLCAyNTQgaW5zZXJ0aW9ucygrKSwgMjcyIGRlbGV0aW9ucygtKQ0KDQoNCmJhc2UtY29t
bWl0OiA2NjEzNDc2ZTIyNWUwOTBjYzlhYWQ0OWJlN2ZhNTA0ZTI5MGRkMzNkDQotLSANCjIuNDMu
MA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFy
by5vcmcK
