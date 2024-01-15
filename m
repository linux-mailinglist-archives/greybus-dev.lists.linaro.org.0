Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 0188482E1A9
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jan 2024 21:22:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 167223F4FF
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jan 2024 20:22:11 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 9A48A3F360
	for <greybus-dev@lists.linaro.org>; Mon, 15 Jan 2024 20:22:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSJ-0004fv-Vc; Mon, 15 Jan 2024 21:21:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSC-0005fw-T0; Mon, 15 Jan 2024 21:21:04 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rPTSC-000N73-2E;
	Mon, 15 Jan 2024 21:21:04 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, 15 Jan 2024 21:12:46 +0100
Message-ID: <cover.1705348269.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6320; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=4XhGTLODNw8yhIWMecN5LnSB/9sNwzZ7ZtVxoa/j52s=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlpZHAtVz/M7HYOTe/qdG2V00aOQMH7pbvHciH8 Vd+hMtY79eJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZaWRwAAKCRCPgPtYfRL+ TmMcB/9KE9qwNyMSSIfdofdQbKyCv4Jl+hXy0kKEYM/VNzbklICtWwj9498FhxF8B9thFSDK3gp DulZCe7rJn+MKx/eJphonzR1LVWev1YTJ2kkqaeBZRIN4i1mYHInwS35ESw2q+zwzVxxA5C1ESX kW25rOyy4D74faKClkI6O9XJ8+8hTw+2V1FDTJCM3vzxmqJnOLbi+YQW48FklGIPMoSqjx8aCyd SI61u1H7VyOe/EymwrynrT3G6SCnlHBYtfL1qLmsfALHT2BaON0BD/T5W5/wZjxuPBbtdlD253K rqyhVZMP3ez427R7zZKU1qhJqs7O6YTGrydt0et9PARzYGe0
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,pengutronix.de,kernel.org,intel.com,redhat.com,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,linaro.org,linuxfoundation.org,ansari.sh,linux.intel.com,huawei.com,digiteqautomotive.com,netup.ru,arndb.de,nod.at,ti.com,sntech.de,alsa-project.org,lists.infradead.org,googlemail.com,microchip.com,raritan.com,chromium.org,lists.linux.dev,amd.com,collabora.com,suse.de,ravnborg.org,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,iki.fi,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[91];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9A48A3F360
X-Spamd-Bar: /
Message-ID-Hash: HJBY62T3HCQR7FIP5IK4NDLBIKD6M3LF
X-Message-ID-Hash: HJBY62T3HCQR7FIP5IK4NDLBIKD6M3LF
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-spi@vger.kernel.org, kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Martin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab <mche
 hab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Heiko Stuebner <heiko@sntech.de>, Linus Walleij <linus.walleij@linaro.org>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, Rob Herring <robh@kernel.org>, linux-mtd@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio
  <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Kalle Valo <k
 valo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HJBY62T3HCQR7FIP5IK4NDLBIKD6M3LF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8sDQoNCkluIGNvbW1pdCA4Y2FhYjc1ZmQyYzIgKCJzcGk6IEdlbmVyYWxpemUgU1BJICJt
YXN0ZXIiIHRvICJjb250cm9sbGVyIiIpDQpzb21lIGZ1bmN0aW9ucyB3ZXJlIHJlbmFtZWQuIEZ1
cnRoZXIgc29tZSBjb21wYXQgZGVmaW5lcyB3ZXJlIGludHJvZHVjZWQNCnRvIG1hcCB0aGUgb2xk
IG5hbWVzIHRvIHRoZSBuZXcgb25lcy4NCg0KSW4gdGhpcyBzZXJpZXMgYWxsIGRyaXZlcnMgc3Rp
bGwgdXNpbmcgdGhlIG9sZCBuYW1lcyBhcmUgY2hhbmdlZCB0byB1c2UNCnRoZSBuZXcgb25lcyBh
bmQgdGhlbiBpbiBwYXRjaCAjMzIgdGhlIGNvbXBhdCBkZWZpbmVzIGFyZSBkcm9wcGVkLg0KVmFy
aWFibGVzIGFuZCBzdHJ1Y3QgbWVtYmVycyBvZiB0eXBlIHBvaW50ZXIgdG8gc3RydWN0IHNwaV9j
b250cm9sbGVyIHRoYXQgd2VyZQ0KbmFtZWQgIm1hc3RlciIgKG1hdGNoaW5nIHRoZSBvbGQgbmFt
ZSBvZiBzcGlfY29udHJvbGxlcikgd2VyZSByZW5hbWVkIHRvDQoiY3RsciIsIHdoaWNoIHNsaWdo
dGx5IGluY3JlYXNlZCB0aGUgY291bnQgb2YgdG91Y2hlZCBsaW5lcywgYnV0IGlzIG5pY2UNCmZv
ciBjb25zaXN0ZW5jeS4NCg0KUGF0Y2ggIzE4IGFuZCAjMTkgdG91Y2ggdGhlIHNhbWUgZHJpdmVy
LCBvdGhlcndpc2UgdGhlIHBhdGNoZXMgIzEgLSAjMzENCmFyZSBwYWlyd2lzZSBpbmRlcGVuZGVu
dCBhbmQgY291bGQgYmUgYXBwbGllZCBieSB0aGVpciByZXNwZWN0aXZlDQptYWludGFpbmVycy4g
VGhlIGFsdGVybmF0aXZlIGlzIHRvIGxldCBhbGwgcGF0Y2hlcyBnbyB2aWEgdGhlIHNwaSB0cmVl
Lg0KTWFyaywgd2hhdCdzIHlvdXIgcHJlZmVyZW5jZSBoZXJlPw0KDQpQYXRjaCAjMzMgdXBkYXRl
cyB0aGUgZG9jdW1lbnRhdGlvbi4gKFRoaXMgb25lIGlzIGEgYml0IGZ1enp5LCBiZWNhdXNlDQpp
dCBhbHNvIGRvZXMgc29tZSBzL21hc3Rlci9ob3N0LyB3aGljaCBkb2Vzbid0IG1hdGNoIHRoZSBy
ZW1haW5kZXIgb2YNCnRoZSBzZXJpZXMpLiBBbHNvIHBhdGNoICMxOCBpcyBhbiBpbXByb3ZlbWVu
dCBJIG5vdGljZWQgd2hpbGUgdG91Y2hpbmcNCnRoaXMgZHJpdmVyIHRoYXQgZG9lc24ndCBtYXRj
aCB0aGUgc2VyaWVzJyB0b3BpYy4gSSBzdGlsbCBrZXB0IGl0DQppbmNsdWRlZCBoZXJlLiBJZiB5
b3Ugc2hvdWxkIG5vdCBsaWtlIGl0LCBpdCBjYW4ganVzdCBiZSBkcm9wcGVkLg0KDQpCZXN0IHJl
Z2FyZHMNClV3ZQ0KDQpVd2UgS2xlaW5lLUvDtm5pZyAoMzMpOg0KICBmcGdhOiBpY2U0MC1zcGk6
IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIGllZWU4
MDIxNTQ6IGNhODIxMDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJv
bGxlciINCiAgaWlvOiBhZGM6IGFkX3NpZ21hX2RlbHRhOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJ
ICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBJbnB1dDogcHhzcGFkIC0gZm9sbG93IHJlbmFt
aW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgSW5wdXQ6IHN5bmFwdGljcy1y
bWk0IC0gZm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAg
bWVkaWE6IG1nYjQ6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xs
ZXIiDQogIG1lZGlhOiBuZXR1cF91bmlkdmI6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiDQogIG1lZGlhOiB1c2IvbXNpMjUwMDogRm9sbG93IHJlbmFtaW5n
IG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgbWVkaWE6IHY0bDItc3ViZGV2OiBG
b2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBtaXNjOiBn
ZWhjLWFjaGM6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIi
DQogIG1tYzogbW1jX3NwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29u
dHJvbGxlciINCiAgbXRkOiBkYXRhZmxhc2g6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiDQogIG10ZDogcmF3bmFuZDogZnNsX2VsYmM6IExldCAucHJvYmUg
cmV0cnkgaWYgbG9jYWwgYnVzIGlzIG1pc3NpbmcNCiAgbmV0OiBrczg4NTE6IEZvbGxvdyByZW5h
bWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIG5ldDogdmVydGV4Y29tOiBt
c2UxMDJ4OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0K
ICBwbGF0Zm9ybS9jaHJvbWU6IGNyb3NfZWNfc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJt
YXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBzcGk6IGJpdGJhbmc6IEZvbGxvdyByZW5hbWluZyBv
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
YzogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgdmlk
ZW86IGZiZGV2OiBtbXA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRy
b2xsZXIiDQogIHdpZmk6IGxpYmVydGFzOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIi
IHRvICJjb250cm9sbGVyIg0KICBzcGk6IGZzbC1saWI6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkg
Im1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIHNwaTogRHJvcCBjb21wYXQgbGF5ZXIgZnJvbSBy
ZW5hbWluZyAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgRG9jdW1lbnRhdGlvbjogc3BpOiBV
cGRhdGUgZG9jdW1lbnRhdGlvbiBmb3IgcmVuYW1pbmcgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIi
DQoNCiAuLi4vZHJpdmVyLWFwaS9kcml2ZXItbW9kZWwvZGV2cmVzLnJzdCAgICAgICAgfCAgMiAr
LQ0KIERvY3VtZW50YXRpb24vc3BpL3NwaS1zdW1tYXJ5LnJzdCAgICAgICAgICAgICB8IDc0ICsr
KysrKysrKy0tLS0tLS0tLS0NCiBkcml2ZXJzL2NoYXIvdHBtL3RwbV90aXNfc3BpX21haW4uYyAg
ICAgICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvZnBnYS9pY2U0MC1zcGkuYyAgICAgICAgICAgICAg
ICAgICAgICB8ICA0ICstDQogZHJpdmVycy9paW8vYWRjL2FkX3NpZ21hX2RlbHRhLmMgICAgICAg
ICAgICAgIHwgMTQgKystLQ0KIGRyaXZlcnMvaW5wdXQvam95c3RpY2svcHN4cGFkLXNwaS5jICAg
ICAgICAgICB8ICA0ICstDQogZHJpdmVycy9pbnB1dC9ybWk0L3JtaV9zcGkuYyAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL21lZGlhL3BjaS9tZ2I0L21nYjRfY29yZS5jICAgICAg
ICAgICAgfCAxNCArKy0tDQogLi4uL21lZGlhL3BjaS9uZXR1cF91bmlkdmIvbmV0dXBfdW5pZHZi
X3NwaS5jIHwgNDggKysrKysrLS0tLS0tDQogZHJpdmVycy9tZWRpYS91c2IvbXNpMjUwMC9tc2ky
NTAwLmMgICAgICAgICAgIHwgMzggKysrKystLS0tLQ0KIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3Jl
L3Y0bDItc3BpLmMgICAgICAgICAgICB8ICA0ICstDQogZHJpdmVycy9taXNjL2dlaGMtYWNoYy5j
ICAgICAgICAgICAgICAgICAgICAgIHwgIDggKy0NCiBkcml2ZXJzL21tYy9ob3N0L21tY19zcGku
YyAgICAgICAgICAgICAgICAgICAgfCAgNiArLQ0KIGRyaXZlcnMvbXRkL2RldmljZXMvbXRkX2Rh
dGFmbGFzaC5jICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9tdGQvbmFuZC9yYXcvZnNsX2Vs
YmNfbmFuZC5jICAgICAgICAgIHwgIDMgKy0NCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyZWwv
a3M4ODUxX3NwaS5jICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3ZlcnRleGNv
bS9tc2UxMDJ4LmMgICAgICB8ICAyICstDQogZHJpdmVycy9uZXQvaWVlZTgwMjE1NC9jYTgyMTAu
YyAgICAgICAgICAgICAgIHwgIDIgKy0NCiAuLi4vbmV0L3dpcmVsZXNzL21hcnZlbGwvbGliZXJ0
YXMvaWZfc3BpLmMgICAgfCAgMiArLQ0KIGRyaXZlcnMvcGxhdGZvcm0vY2hyb21lL2Nyb3NfZWNf
c3BpLmMgICAgICAgICB8ICA4ICstDQogZHJpdmVycy9zcGkvc3BpLWF0aDc5LmMgICAgICAgICAg
ICAgICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL3NwaS9zcGktYml0YmFuZy5jICAgICAgICAg
ICAgICAgICAgICAgfCA2NCArKysrKysrKy0tLS0tLS0tDQogZHJpdmVycy9zcGkvc3BpLWJ1dHRl
cmZseS5jICAgICAgICAgICAgICAgICAgIHwgIDYgKy0NCiBkcml2ZXJzL3NwaS9zcGktY2FkZW5j
ZS1xdWFkc3BpLmMgICAgICAgICAgICAgfCAgNyArLQ0KIGRyaXZlcnMvc3BpL3NwaS1jYXZpdW0u
YyAgICAgICAgICAgICAgICAgICAgICB8ICA2ICstDQogZHJpdmVycy9zcGkvc3BpLWNhdml1bS5o
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3NwaS9zcGktZGF2aW5jaS5j
ICAgICAgICAgICAgICAgICAgICAgfCAgNiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1mc2wtbGliLmMg
ICAgICAgICAgICAgICAgICAgICB8IDE0ICsrLS0NCiBkcml2ZXJzL3NwaS9zcGktZ2VuaS1xY29t
LmMgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1ncGlvLmMgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9zcGkvc3BpLWxtNzBsbHAuYyAg
ICAgICAgICAgICAgICAgICAgIHwgIDYgKy0NCiBkcml2ZXJzL3NwaS9zcGktbG9vcGJhY2stdGVz
dC5jICAgICAgICAgICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvc3BpL3NwaS1vYy10aW55LmMgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICstDQogZHJpdmVycy9zcGkvc3BpLW9tYXAtdXdpcmUuYyAg
ICAgICAgICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL3NwaS9zcGktc2xhdmUtbXQyN3h4LmMg
ICAgICAgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3BpL3NwaS14aWxpbnguYyAgICAgICAg
ICAgICAgICAgICAgICB8ICA0ICstDQogZHJpdmVycy9zcGkvc3BpLXh0ZW5zYS14dGZwZ2EuYyAg
ICAgICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3NwaS9zcGkuYyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3BpL3NwaWRldi5jICAgICAgICAgICAgICAg
ICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9zdGFnaW5nL2ZidGZ0L2ZidGZ0LWNvcmUuYyAg
ICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zcGlsaWIuYyAgICAg
ICAgICAgICAgfCA2NiArKysrKysrKy0tLS0tLS0tLQ0KIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMv
bWF4MzQyMF91ZGMuYyAgICAgICAgICB8ICAyICstDQogZHJpdmVycy92aWRlby9mYmRldi9tbXAv
aHcvbW1wX3NwaS5jICAgICAgICAgIHwgMjYgKysrLS0tLQ0KIGluY2x1ZGUvbGludXgvc3BpL3Nw
aS5oICAgICAgICAgICAgICAgICAgICAgICB8IDIwICstLS0tDQogaW5jbHVkZS9saW51eC9zcGkv
c3BpX2JpdGJhbmcuaCAgICAgICAgICAgICAgIHwgIDIgKy0NCiBpbmNsdWRlL21lZGlhL3Y0bDIt
Y29tbW9uLmggICAgICAgICAgICAgICAgICAgfCAgNiArLQ0KIDQ2IGZpbGVzIGNoYW5nZWQsIDI0
OSBpbnNlcnRpb25zKCspLCAyNjcgZGVsZXRpb25zKC0pDQoNCg0KYmFzZS1jb21taXQ6IDhkMDRh
N2UyZWUzZmQ2YWFiYjgwOTZiMDBjNjRkYjBkNzM1YmM4NzQNCi0tIA0KMi40My4wDQoNCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJl
IHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
