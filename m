Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2419A851810
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Feb 2024 16:33:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AE4EC442ED
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Feb 2024 15:33:27 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id C37403F47A
	for <greybus-dev@lists.linaro.org>; Mon, 12 Feb 2024 15:33:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Co2aU8UO;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of broonie@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=broonie@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E07B860BAD;
	Mon, 12 Feb 2024 15:33:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD66C433F1;
	Mon, 12 Feb 2024 15:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707752000;
	bh=GFsfkdOmJKsuZtWQAq7OhjxHg4IKHiDCDNVd+Gd58aw=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Co2aU8UOdKL4W8SUaaEqV0BTVAuiZ9niMqI5QuXmkWRQqRD+bsuUp32djuJPfJQ7M
	 J0AdS/WqPhUm+WDhNwj0PIl1NFZPSx4kaz74w8AVaBO2niEWSvmitVVz0AuwMwTUcd
	 8MtOvRT2s7ojnBMUpDpCQjuzEzxH0//zOgasqtDHJDU6fjIDBJFEa6lJkzge7aVnIn
	 65sRlXZGfvNWKRj6hhoF+/MvmClp/yoVXWTT6Lqc/PTFBqTwhuA4fpNCA+K8uTOths
	 DH2aamg+A5g3aeMmWit1ZUc4X0oSEYy8EtlcvJyPFhdziLYkgWINAXOkx2oWF2pGNL
	 vlKQQFPbdC2Dw==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
References: <cover.1705944943.git.u.kleine-koenig@pengutronix.de>
Message-Id: <170775198078.46149.4700126128576800564.b4-ty@kernel.org>
Date: Mon, 12 Feb 2024 15:33:00 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-a684c
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C37403F47A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[renesas];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,linaro.org,ansari.sh,linux.intel.com,huawei.com,digiteqautomotive.com,netup.ru,arndb.de,linuxfoundation.org,nod.at,ti.com,sntech.de,amd.com,alsa-project.org,lists.infradead.org,googlemail.com,glider.be,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,rowland.harvard.edu,iki.fi,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[90];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: GC5ZHABCHG4U2NKELFSMFK5V3WCYR2ZJ
X-Message-ID-Hash: GC5ZHABCHG4U2NKELFSMFK5V3WCYR2ZJ
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-input@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Rayyan Ansari <rayyan@ansari.sh>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, Martin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab <m
 chehab@kernel.org>, linux-media@vger.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Michal Simek <michal.simek@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Geert Uytterhoeven <geert+renesas@glider.be>, =?utf-8?q?Pali_Roh=C3=A1r?= <pali@kernel.org>, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linar
 o.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Alan Stern <stern@rowland.harvard.edu>, Aaro Koskinen <aaro.koskinen@iki.fi>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Kalle Valo <kvalo@kernel.or
 g>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, James Clark <james.clark@arm.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: (subset) [PATCH v2 00/33] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GC5ZHABCHG4U2NKELFSMFK5V3WCYR2ZJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gTW9uLCAyMiBKYW4gMjAyNCAxOTowNjo1NSArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6DQo+IHRoaXMgaXMgdjIgb2YgdGhpcyBwYXRjaCBzZXQuDQo+IA0KPiBDaGFuZ2VzIHNpbmNl
IChpbXBsaWNpdCkgdjEsIHNlbnQgd2l0aCBNZXNzYWdlLUlkOg0KPiBjb3Zlci4xNzA1MzQ4MjY5
LmdpdC51LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU6DQo+IA0KPiAgLSBSZWJhc2UgdG8g
djYuOC1yYzENCj4gIC0gRml4IGEgYnVpbGQgZmFpbHVyZSBvbiBzaA0KPiAgLSBBZGRlZCB0aGUg
dGFncyByZWNlaXZlZCBpbiAoaW1wbGljaXQpIHYxLg0KPiANCj4gWy4uLl0NCg0KQXBwbGllZCB0
bw0KDQogICBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9i
cm9vbmllL3NwaS5naXQgZm9yLW5leHQNCg0KVGhhbmtzIQ0KDQpbMDEvMzNdIGZwZ2E6IGljZTQw
LXNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAg
ICAgICAgY29tbWl0OiAyMjdhYjczYjg5ZDY2ZTMwNjRiM2MyYmNiNWZlMzgyYjE4MTU3NjNkDQpb
MDIvMzNdIGllZWU4MDIxNTQ6IGNhODIxMDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVy
IiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAxNjdiNzg0NDY3MDZiYjRkMTlmN2Rk
OTNjYTMyMGFlZDI1YWUxYmJkDQpbMDMvMzNdIGlpbzogYWRjOiBhZF9zaWdtYV9kZWx0YTogRm9s
bG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29t
bWl0OiAyNzgwZTdiNzE2YTYwNTc4MWRiZWU3NTNlZjQ5ODNkNzc1YTY1NDI3DQpbMDQvMzNdIElu
cHV0OiBweHNwYWQgLSBmb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9s
bGVyIg0KICAgICAgICBjb21taXQ6IGE3OGFjZWM1M2I4NTI0NTkzYWZlZWQ3MjU4YTQ0MmFkYzM0
NTA4MTgNClswNS8zM10gSW5wdXQ6IHN5bmFwdGljcy1ybWk0IC0gZm9sbG93IHJlbmFtaW5nIG9m
IFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAxMjQ1NjMzYzYx
YmFmMTU5ZmNjMTMwM2Q3ZjA4NTVmNDk4MzFiOWMxDQpbMDYvMzNdIG1lZGlhOiBtZ2I0OiBGb2xs
b3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21t
aXQ6IDJjMmY5M2ZiZmJhNzE4NmNjMDgxZTIzMTIwZjE2OWVhYzNiNWI2MmENClswNy8zM10gbWVk
aWE6IG5ldHVwX3VuaWR2YjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29u
dHJvbGxlciINCiAgICAgICAgY29tbWl0OiBjZmExM2E2NGJkNjMxZDhmMDRhMWMzODU5MjM3MDZm
Y2VmOWE2M2VkDQpbMDgvMzNdIG1lZGlhOiB1c2IvbXNpMjUwMDogRm9sbG93IHJlbmFtaW5nIG9m
IFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiBkZDg2OGFlNjQ2
ZDU3NzBmODBmOTBkYzA1NmQwNmViMmU2ZDM5YzYyDQpbMDkvMzNdIG1lZGlhOiB2NGwyLXN1YmRl
djogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAg
ICAgY29tbWl0OiBkOTIwYjNhNjcyYjdmNzljZDEzYjM0MTIzNGFlYmQ0OTIzM2Y4MzZjDQpbMTAv
MzNdIG1pc2M6IGdlaGMtYWNoYzogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAi
Y29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAyNmRjZjA5ZWU1ZDljZWJhMmM2MjdhZTNiYTE3
NGEyMjlmMjU2MzhmDQpbMTEvMzNdIG1tYzogbW1jX3NwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQ
SSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiBiMGE2Nzc2ZTUzNDAz
YWEzODA0MTFmMmE0M2NkZWZiOWYwMGZmNTBhDQpbMTIvMzNdIG10ZDogZGF0YWZsYXNoOiBGb2xs
b3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21t
aXQ6IDQ0ZWU5OThkYjllZWY4NGJmMDA1YzM5NDg2NTY2YTY3Y2IwMTgzNTQNClsxNC8zM10gbmV0
OiBrczg4NTE6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIi
DQogICAgICAgIGNvbW1pdDogMWNjNzExYTcyYWU3ZmQ0NGU5MDgzOWYwYzhkMzIyNjY2NGRlNTVh
Mg0KWzE1LzMzXSBuZXQ6IHZlcnRleGNvbTogbXNlMTAyeDogRm9sbG93IHJlbmFtaW5nIG9mIFNQ
SSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiA3OTY5Yjk4YjgwYzAz
MzJmOTQwYzU0N2Y4NDY1MGEyMGFhYjMzODQxDQpbMTYvMzNdIHBsYXRmb3JtL2Nocm9tZTogY3Jv
c19lY19zcGk6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIi
DQogICAgICAgIGNvbW1pdDogODVhZDBlYzA0OWE3NzFjNDkxMGM4YWViYjJkMGJkOWNlOTMxMWZk
OQ0KWzE3LzMzXSBzcGk6IGJpdGJhbmc6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIg
dG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogMjI1OTIzMzExMGQ5MDA1OTE4N2M1YmE3
NTUzN2ViOTNlYmE4NDE3Yg0KWzE4LzMzXSBzcGk6IGNhZGVuY2UtcXVhZHNwaTogRG9uJ3QgZW1p
dCBlcnJvciBtZXNzYWdlIG9uIGFsbG9jYXRpb24gZXJyb3INCiAgICAgICAgY29tbWl0OiBlNzEw
MTFkYWNjMzQxM2JlZDQxMThkMmM0MmYxMDczNmZmY2Q3NjJjDQpbMTkvMzNdIHNwaTogY2FkZW5j
ZS1xdWFkc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVy
Ig0KICAgICAgICBjb21taXQ6IDI4ZTU5ZDhiZjFhY2UwZGRmMDVmOTg5YTQ4ZDY4MjRkNzU3MzEy
NjcNClsyMC8zM10gc3BpOiBjYXZpdW06IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIg
dG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogMTc0N2ZiZGVkYmE4YjZiM2ZkNDU5ODk1
ZWQ1ZDU3ZTUzNDU0OTg4NA0KWzIxLzMzXSBzcGk6IGdlbmktcWNvbTogRm9sbG93IHJlbmFtaW5n
IG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAxNGNlYTky
MzM4YTA3NzZjMTYxNTk5NDE1MGU3MzhhYzBmNWZiYjJjDQpbMjIvMzNdIHNwaTogbG9vcGJhY2st
dGVzdDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAg
ICAgICAgY29tbWl0OiAyYzIzMTBjMTdmYWMxM2FhN2U3ODc1NmQ3ZjM3ODBjNzg5MWY5Mzk3DQpb
MjMvMzNdIHNwaTogc2xhdmUtbXQyN3h4OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIi
IHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IDgxOTdiMTM2YmJiZTY0YTdjYWIxMDIw
YTRiMDY3MDIwZTU5NzdkOTgNClsyNC8zM10gc3BpOiBzcGlkZXY6IEZvbGxvdyByZW5hbWluZyBv
ZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogZDkzNGNkNmYw
ZTVkMDA1Mjc3MjYxMmRiNGIwN2RmNjBjYjlkYTM4Nw0KWzI1LzMzXSBzdGFnaW5nOiBmYnRmdDog
Rm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAg
Y29tbWl0OiBiYmQyNWQ3MjYwZWVlYWVmODlmNzM3MWNiYWRjZDMzZGQ3ZjdiZmY5DQpbMjYvMzNd
IHN0YWdpbmc6IGdyZXlidXM6IHNwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0
byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiBlZTNjNjY4ZGRhM2QyNzgzYjBmZmY0MDkx
NDYxMzU2ZmUwMDBlNGQ4DQpbMjcvMzNdIHRwbV90aXNfc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2Yg
U1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IGI2YWYxNGVhY2M4
ODE0YjA5ODZlMjA1MDdkZjQyM2NlYmU5ZmQ4NTkNClsyOC8zM10gdXNiOiBnYWRnZXQ6IG1heDM0
MjBfdWRjOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0K
ICAgICAgICBjb21taXQ6IDhjNzE2ZjRhM2Q0ZmNiZWM5NzYyNDdlMzQ0M2QzNmNiYzI0YzA1MTIN
ClsyOS8zM10gdmlkZW86IGZiZGV2OiBtbXA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogYjIzMDMxZTczMGU3MmVjOTA2N2I3
YzM4YzI1ZTc3NmM1ZTI3ZTExNg0KWzMwLzMzXSB3aWZpOiBsaWJlcnRhczogRm9sbG93IHJlbmFt
aW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAzMDA2
MGQ1N2NlZTE5NGQ2YjcwMjgzZjJmYWY3ODdlMmZkYzYxYjZlDQpbMzEvMzNdIHNwaTogZnNsLWxp
YjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAg
ICAgY29tbWl0OiA4MDExODVlZmEyNDAyZGNlNTc4Mjg5MzBlOTY4NDg4NGZjOGQ2MmRhDQpbMzIv
MzNdIHNwaTogRHJvcCBjb21wYXQgbGF5ZXIgZnJvbSByZW5hbWluZyAibWFzdGVyIiB0byAiY29u
dHJvbGxlciINCiAgICAgICAgY29tbWl0OiA2MjBkMjY5ZjI5YTU2OWJhMzc0MTljYzAzY2YxZGEy
ZDU1ZjYyNTJhDQpbMzMvMzNdIERvY3VtZW50YXRpb246IHNwaTogVXBkYXRlIGRvY3VtZW50YXRp
b24gZm9yIHJlbmFtaW5nICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6
IDc2YjMxZWI0YzJkYTNkZGIzMTk1Y2MxNGY2YWFkMjQ5MDhhZGY1MjQNCg0KQWxsIGJlaW5nIHdl
bGwgdGhpcyBtZWFucyB0aGF0IGl0IHdpbGwgYmUgaW50ZWdyYXRlZCBpbnRvIHRoZSBsaW51eC1u
ZXh0DQp0cmVlICh1c3VhbGx5IHNvbWV0aW1lIGluIHRoZSBuZXh0IDI0IGhvdXJzKSBhbmQgc2Vu
dCB0byBMaW51cyBkdXJpbmcNCnRoZSBuZXh0IG1lcmdlIHdpbmRvdyAob3Igc29vbmVyIGlmIGl0
IGlzIGEgYnVnIGZpeCksIGhvd2V2ZXIgaWYNCnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4g
dGhlIHBhdGNoIG1heSBiZSBkcm9wcGVkIG9yIHJldmVydGVkLg0KDQpZb3UgbWF5IGdldCBmdXJ0
aGVyIGUtbWFpbHMgcmVzdWx0aW5nIGZyb20gYXV0b21hdGVkIG9yIG1hbnVhbCB0ZXN0aW5nDQph
bmQgcmV2aWV3IG9mIHRoZSB0cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGlu
ZyBwcm9ibGVtcyBhbmQNCnNlbmQgZm9sbG93dXAgcGF0Y2hlcyBhZGRyZXNzaW5nIGFueSBpc3N1
ZXMgdGhhdCBhcmUgcmVwb3J0ZWQgaWYgbmVlZGVkLg0KDQpJZiBhbnkgdXBkYXRlcyBhcmUgcmVx
dWlyZWQgb3IgeW91IGFyZSBzdWJtaXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5DQpzaG91bGQg
YmUgc2VudCBhcyBpbmNyZW1lbnRhbCB1cGRhdGVzIGFnYWluc3QgY3VycmVudCBnaXQsIGV4aXN0
aW5nDQpwYXRjaGVzIHdpbGwgbm90IGJlIHJlcGxhY2VkLg0KDQpQbGVhc2UgYWRkIGFueSByZWxl
dmFudCBsaXN0cyBhbmQgbWFpbnRhaW5lcnMgdG8gdGhlIENDcyB3aGVuIHJlcGx5aW5nDQp0byB0
aGlzIG1haWwuDQoNClRoYW5rcywNCk1hcmsNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
