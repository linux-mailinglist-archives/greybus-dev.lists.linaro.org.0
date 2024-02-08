Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7794084EA3F
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Feb 2024 22:22:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03F8144263
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Feb 2024 21:22:00 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 62E3844175
	for <greybus-dev@lists.linaro.org>; Thu,  8 Feb 2024 21:21:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=L5BmvqcR;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of broonie@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=broonie@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9718260B33;
	Thu,  8 Feb 2024 21:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 289CDC433F1;
	Thu,  8 Feb 2024 21:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707427313;
	bh=oqvxtofftemHVkqCtUvTHWJMUcVkNerevyhL33rOVTg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=L5BmvqcRkgnwQazmD6GNbT/V4WhBK5Jh6gNZcDqvZtq3vD3bjm4E5j4iLEoOGBSf2
	 9F9jyrrWriCDl5Wu0BAXPhkb1g056buOTe2Ztq7rnNXkEo1LQlxR/MS5DrRDwOGECL
	 PzXvkI3prpHFsJQ85rgk8WagJHAGPijl/nL+cwohJK5pgSdWN4EVlzkTj2GSjD78+U
	 Do4/ScbKYtsrkZ/UX5X3+BMEO6gp6SsFMVnpleSnv3fJUOOdIaypIpDthmOW76tyzt
	 Evsw5NI06O+Mh6/qIrxzDT3P++ocGhgYPwbeQwHydxaTl96OS/0UKdfbCWCgOU5q38
	 wcv+IJzWFU9dQ==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
In-Reply-To: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
Message-Id: <170742729486.2266792.11643460714402047207.b4-ty@kernel.org>
Date: Thu, 08 Feb 2024 21:21:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev-0438c
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 62E3844175
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
	TAGGED_RCPT(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,huawei.com,linuxfoundation.org,linux.intel.com,linaro.org,digiteqautomotive.com,netup.ru,arndb.de,nod.at,ti.com,amd.com,alsa-project.org,lists.infradead.org,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,ravnborg.org,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: XF4L4ZEDAPYTQNK7ECB6NZDNU5E6TCKU
X-Message-ID-Hash: XF4L4ZEDAPYTQNK7ECB6NZDNU5E6TCKU
X-MailFrom: broonie@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-input@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vg
 er.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek
 @lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 00/32] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XF4L4ZEDAPYTQNK7ECB6NZDNU5E6TCKU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

T24gV2VkLCAwNyBGZWIgMjAyNCAxOTo0MDoxNCArMDEwMCwgVXdlIEtsZWluZS1Lw7ZuaWcgd3Jv
dGU6DQo+IENoYW5nZXMgc2luY2UgdjINCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LXNwaS9jb3Zlci4xNzA1OTQ0OTQzLmdpdC51LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUp
Og0KPiANCj4gIC0gRHJvcCBwYXRjaCAibXRkOiByYXduYW5kOiBmc2xfZWxiYzogTGV0IC5wcm9i
ZSByZXRyeSBpZiBsb2NhbCBidXMgaXMNCj4gICAgbWlzc2luZyIgd2hpY2ggZG9lc24ndCBiZWxv
bmcgaW50byB0aGlzIHNlcmllcy4NCj4gIC0gRml4IGEgYnVpbGQgZmFpbHVyZSBub3RpY2VkIGJ5
IHRoZSBrZXJuZWwgYnVpbGQgYm90IGluDQo+ICAgIGRyaXZlcnMvc3BpL3NwaS1hdTE1NTAuYy4g
KEkgZmFpbGVkIHRvIGNhdGNoIHRoaXMgYmVjYXVzZSB0aGlzIGRyaXZlcg0KPiAgICBpcyBtaXBz
IG9ubHksIGJ1dCBub3QgZW5hYmxlZCBpbiBhIG1pcHMgYWxsbW9kY29uZmlnLiBUaGF0J3MgYSBi
aXQNCj4gICAgdW5mb3J0dW5hdGUsIGJ1dCBub3QgZWFzaWx5IGZpeGFibGUuKQ0KPiAgLSBBZGQg
dGhlIFJldmlld2VkLWJ5OiBhbmQgQWNrZWQtYnk6IHRhZ3MgSSByZWNlaXZlZCBmb3IgdjIuDQo+
IA0KPiBbLi4uXQ0KDQpBcHBsaWVkIHRvDQoNCiAgIGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHVi
L3NjbS9saW51eC9rZXJuZWwvZ2l0L2Jyb29uaWUvc3BpLmdpdCBmb3ItbmV4dA0KDQpUaGFua3Mh
DQoNClswMS8zMl0gZnBnYTogaWNlNDAtc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IDIyN2FiNzNiODlkNjZlMzA2NGIz
YzJiY2I1ZmUzODJiMTgxNTc2M2QNClswMi8zMl0gaWVlZTgwMjE1NDogY2E4MjEwOiBGb2xsb3cg
cmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6
IDE2N2I3ODQ0NjcwNmJiNGQxOWY3ZGQ5M2NhMzIwYWVkMjVhZTFiYmQNClswMy8zMl0gaWlvOiBh
ZGM6IGFkX3NpZ21hX2RlbHRhOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJj
b250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IDI3ODBlN2I3MTZhNjA1NzgxZGJlZTc1M2VmNDk4
M2Q3NzVhNjU0MjcNClswNC8zMl0gSW5wdXQ6IHB4c3BhZCAtIGZvbGxvdyByZW5hbWluZyBvZiBT
UEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogYTc4YWNlYzUzYjg1
MjQ1OTNhZmVlZDcyNThhNDQyYWRjMzQ1MDgxOA0KWzA1LzMyXSBJbnB1dDogc3luYXB0aWNzLXJt
aTQgLSBmb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAg
ICAgICBjb21taXQ6IDEyNDU2MzNjNjFiYWYxNTlmY2MxMzAzZDdmMDg1NWY0OTgzMWI5YzENClsw
Ni8zMl0gbWVkaWE6IG1nYjQ6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNv
bnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogMmMyZjkzZmJmYmE3MTg2Y2MwODFlMjMxMjBmMTY5
ZWFjM2I1YjYyYQ0KWzA3LzMyXSBtZWRpYTogbmV0dXBfdW5pZHZiOiBGb2xsb3cgcmVuYW1pbmcg
b2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IGNmYTEzYTY0
YmQ2MzFkOGYwNGExYzM4NTkyMzcwNmZjZWY5YTYzZWQNClswOC8zMl0gbWVkaWE6IHVzYi9tc2ky
NTAwOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAg
ICAgICBjb21taXQ6IGRkODY4YWU2NDZkNTc3MGY4MGY5MGRjMDU2ZDA2ZWIyZTZkMzljNjINClsw
OS8zMl0gbWVkaWE6IHY0bDItc3ViZGV2OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIi
IHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IGQ5MjBiM2E2NzJiN2Y3OWNkMTNiMzQx
MjM0YWViZDQ5MjMzZjgzNmMNClsxMC8zMl0gbWlzYzogZ2VoYy1hY2hjOiBGb2xsb3cgcmVuYW1p
bmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IDI2ZGNm
MDllZTVkOWNlYmEyYzYyN2FlM2JhMTc0YTIyOWYyNTYzOGYNClsxMS8zMl0gbW1jOiBtbWNfc3Bp
OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAg
ICBjb21taXQ6IGIwYTY3NzZlNTM0MDNhYTM4MDQxMWYyYTQzY2RlZmI5ZjAwZmY1MGENClsxMi8z
Ml0gbXRkOiBkYXRhZmxhc2g6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNv
bnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogNDRlZTk5OGRiOWVlZjg0YmYwMDVjMzk0ODY1NjZh
NjdjYjAxODM1NA0KWzEzLzMyXSBuZXQ6IGtzODg1MTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAi
bWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAxY2M3MTFhNzJhZTdmZDQ0
ZTkwODM5ZjBjOGQzMjI2NjY0ZGU1NWEyDQpbMTQvMzJdIG5ldDogdmVydGV4Y29tOiBtc2UxMDJ4
OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAg
ICBjb21taXQ6IDc5NjliOThiODBjMDMzMmY5NDBjNTQ3Zjg0NjUwYTIwYWFiMzM4NDENClsxNS8z
Ml0gcGxhdGZvcm0vY2hyb21lOiBjcm9zX2VjX3NwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAi
bWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiA4NWFkMGVjMDQ5YTc3MWM0
OTEwYzhhZWJiMmQwYmQ5Y2U5MzExZmQ5DQpbMTYvMzJdIHNwaTogYml0YmFuZzogRm9sbG93IHJl
bmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAy
MjU5MjMzMTEwZDkwMDU5MTg3YzViYTc1NTM3ZWI5M2ViYTg0MTdiDQpbMTcvMzJdIHNwaTogY2Fk
ZW5jZS1xdWFkc3BpOiBEb24ndCBlbWl0IGVycm9yIG1lc3NhZ2Ugb24gYWxsb2NhdGlvbiBlcnJv
cg0KICAgICAgICBjb21taXQ6IGU3MTAxMWRhY2MzNDEzYmVkNDExOGQyYzQyZjEwNzM2ZmZjZDc2
MmMNClsxOC8zMl0gc3BpOiBjYWRlbmNlLXF1YWRzcGk6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkg
Im1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogMjhlNTlkOGJmMWFjZTBk
ZGYwNWY5ODlhNDhkNjgyNGQ3NTczMTI2Nw0KWzE5LzMyXSBzcGk6IGNhdml1bTogRm9sbG93IHJl
bmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0OiAx
NzQ3ZmJkZWRiYThiNmIzZmQ0NTk4OTVlZDVkNTdlNTM0NTQ5ODg0DQpbMjAvMzJdIHNwaTogZ2Vu
aS1xY29tOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0K
ICAgICAgICBjb21taXQ6IDE0Y2VhOTIzMzhhMDc3NmMxNjE1OTk0MTUwZTczOGFjMGY1ZmJiMmMN
ClsyMS8zMl0gc3BpOiBsb29wYmFjay10ZXN0OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IDJjMjMxMGMxN2ZhYzEzYWE3ZTc4
NzU2ZDdmMzc4MGM3ODkxZjkzOTcNClsyMi8zMl0gc3BpOiBzbGF2ZS1tdDI3eHg6IEZvbGxvdyBy
ZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDog
ODE5N2IxMzZiYmJlNjRhN2NhYjEwMjBhNGIwNjcwMjBlNTk3N2Q5OA0KWzIzLzMyXSBzcGk6IHNw
aWRldjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAg
ICAgICAgY29tbWl0OiBkOTM0Y2Q2ZjBlNWQwMDUyNzcyNjEyZGI0YjA3ZGY2MGNiOWRhMzg3DQpb
MjQvMzJdIHN0YWdpbmc6IGZidGZ0OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRv
ICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IGJiZDI1ZDcyNjBlZWVhZWY4OWY3MzcxY2Jh
ZGNkMzNkZDdmN2JmZjkNClsyNS8zMl0gc3RhZ2luZzogZ3JleWJ1czogc3BpOiBGb2xsb3cgcmVu
YW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IGVl
M2M2NjhkZGEzZDI3ODNiMGZmZjQwOTE0NjEzNTZmZTAwMGU0ZDgNClsyNi8zMl0gdHBtX3Rpc19z
cGk6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogICAg
ICAgIGNvbW1pdDogYjZhZjE0ZWFjYzg4MTRiMDk4NmUyMDUwN2RmNDIzY2ViZTlmZDg1OQ0KWzI3
LzMyXSB1c2I6IGdhZGdldDogbWF4MzQyMF91ZGM6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1h
c3RlciIgdG8gImNvbnRyb2xsZXIiDQogICAgICAgIGNvbW1pdDogOGM3MTZmNGEzZDRmY2JlYzk3
NjI0N2UzNDQzZDM2Y2JjMjRjMDUxMg0KWzI4LzMyXSB2aWRlbzogZmJkZXY6IG1tcDogRm9sbG93
IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgICAgICAgY29tbWl0
OiBiMjMwMzFlNzMwZTcyZWM5MDY3YjdjMzhjMjVlNzc2YzVlMjdlMTE2DQpbMjkvMzJdIHdpZmk6
IGxpYmVydGFzOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVy
Ig0KICAgICAgICBjb21taXQ6IDMwMDYwZDU3Y2VlMTk0ZDZiNzAyODNmMmZhZjc4N2UyZmRjNjFi
NmUNClszMC8zMl0gc3BpOiBmc2wtbGliOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIi
IHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IDgwMTE4NWVmYTI0MDJkY2U1NzgyODkz
MGU5Njg0ODg0ZmM4ZDYyZGENClszMS8zMl0gc3BpOiBEcm9wIGNvbXBhdCBsYXllciBmcm9tIHJl
bmFtaW5nICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICAgICAgICBjb21taXQ6IDYyMGQyNjlm
MjlhNTY5YmEzNzQxOWNjMDNjZjFkYTJkNTVmNjI1MmENClszMi8zMl0gRG9jdW1lbnRhdGlvbjog
c3BpOiBVcGRhdGUgZG9jdW1lbnRhdGlvbiBmb3IgcmVuYW1pbmcgIm1hc3RlciIgdG8gImNvbnRy
b2xsZXIiDQogICAgICAgIGNvbW1pdDogNzZiMzFlYjRjMmRhM2RkYjMxOTVjYzE0ZjZhYWQyNDkw
OGFkZjUyNA0KDQpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2lsbCBiZSBpbnRl
Z3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQNCnRyZWUgKHVzdWFsbHkgc29tZXRpbWUgaW4gdGhl
IG5leHQgMjQgaG91cnMpIGFuZCBzZW50IHRvIExpbnVzIGR1cmluZw0KdGhlIG5leHQgbWVyZ2Ug
d2luZG93IChvciBzb29uZXIgaWYgaXQgaXMgYSBidWcgZml4KSwgaG93ZXZlciBpZg0KcHJvYmxl
bXMgYXJlIGRpc2NvdmVyZWQgdGhlbiB0aGUgcGF0Y2ggbWF5IGJlIGRyb3BwZWQgb3IgcmV2ZXJ0
ZWQuDQoNCllvdSBtYXkgZ2V0IGZ1cnRoZXIgZS1tYWlscyByZXN1bHRpbmcgZnJvbSBhdXRvbWF0
ZWQgb3IgbWFudWFsIHRlc3RpbmcNCmFuZCByZXZpZXcgb2YgdGhlIHRyZWUsIHBsZWFzZSBlbmdh
Z2Ugd2l0aCBwZW9wbGUgcmVwb3J0aW5nIHByb2JsZW1zIGFuZA0Kc2VuZCBmb2xsb3d1cCBwYXRj
aGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRlZCBpZiBuZWVkZWQuDQoN
CklmIGFueSB1cGRhdGVzIGFyZSByZXF1aXJlZCBvciB5b3UgYXJlIHN1Ym1pdHRpbmcgZnVydGhl
ciBjaGFuZ2VzIHRoZXkNCnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFsIHVwZGF0ZXMgYWdh
aW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcNCnBhdGNoZXMgd2lsbCBub3QgYmUgcmVwbGFjZWQu
DQoNClBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVycyB0byB0aGUg
Q0NzIHdoZW4gcmVwbHlpbmcNCnRvIHRoaXMgbWFpbC4NCg0KVGhhbmtzLA0KTWFyaw0KDQpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmli
ZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
