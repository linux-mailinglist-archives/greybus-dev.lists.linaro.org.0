Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BA4384D169
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Feb 2024 19:43:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9746940CEF
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Feb 2024 18:43:58 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 832F640C21
	for <greybus-dev@lists.linaro.org>; Wed,  7 Feb 2024 18:43:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmtA-0007PF-WC; Wed, 07 Feb 2024 19:43:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt1-0054Wo-Fo; Wed, 07 Feb 2024 19:43:07 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rXmt1-00HRrh-0y;
	Wed, 07 Feb 2024 19:43:07 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Mark Brown <broonie@kernel.org>
Date: Wed,  7 Feb 2024 19:40:14 +0100
Message-ID: <cover.1707324793.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5860; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=s51zDtEtzddF+fOLbQ8v2gtuX5PVGr2PxCfCP0eStY0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlw86QixivRCd8jxsnKPB8Ssu0rmVV57zjiJehV Ejr/jxfufWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcPOkAAKCRCPgPtYfRL+ TqoZB/9v16XZw2mKXG2KBm/qLQpqoIFtAvhj1rhNwGsvXv87uFIurzYxaSWRcHnoydLYAUjcWin wLRECa33v1gti0Be6oV9BMfvx+Pvhq4lk4RnaSn96oPtZRpq+OTzE2mMSgz0Rgm3Al2XVM+wtll cMJhm+DE3KYghNi+61ohTBgmqcQSwjofaml1oAIf8F12/QJkYPMbKHLFo3eYUENR8f8KW6xfzcA Auq9djKc8DcVzUnZlQ8jFBRc78e3H4Wwojwi6fhxTf6BorMOWK2zEE8p+1QpcaPMCBrTOJnRdaw ZunuM2tkWRUATbyKWfDc9YAdTKZGkKDoDmegK95iBOzv5EQf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 832F640C21
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
	TAGGED_RCPT(0.00)[];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[pengutronix.de,kernel.org,intel.com,redhat.com,vger.kernel.org,gmail.com,datenfreihafen.org,bootlin.com,davemloft.net,google.com,metafoo.de,analog.com,huawei.com,linuxfoundation.org,linux.intel.com,linaro.org,digiteqautomotive.com,netup.ru,arndb.de,nod.at,ti.com,amd.com,alsa-project.org,lists.infradead.org,raritan.com,chromium.org,lists.linux.dev,collabora.com,suse.de,ravnborg.org,lists.freedesktop.org,lists.linaro.org,gmx.de,ziepe.ca,amarulasolutions.com,yandex.ru,lwn.net,arm.com];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[84];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[]
Message-ID-Hash: K7PXM737XF345LMBHASIPWFZDVNMJQHB
X-Message-ID-Hash: K7PXM737XF345LMBHASIPWFZDVNMJQHB
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: kernel@pengutronix.de, Moritz Fischer <mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, linux-fpga@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linux-wpan@vger.kernel.org, netdev@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-input@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Ulf Hansson <ulf.hansson@linaro.org>, Martin Tuma <martin.tuma@digiteqautomotive.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vg
 er.kernel.org, Sergey Kozlov <serjk@netup.ru>, Arnd Bergmann <arnd@arndb.de>, Yang Yingliang <yangyingliang@huawei.com>, linux-mmc@vger.kernel.org, Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>, Amit Kumar Mahapatra via Alsa-devel <alsa-devel@alsa-project.org>, linux-mtd@lists.infradead.org, Simon Horman <horms@kernel.org>, Ronald Wahl <ronald.wahl@raritan.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Michal Simek <michal.simek@amd.com>, Max Filippov <jcmvbkbc@gmail.com>, linux-spi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek
 @lists.infradead.org, Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, Peter Huewe <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, linux-integrity@vger.kernel.org, Herve Codina <herve.codina@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-usb@vger.kernel.org, Helge Deller <deller@gmx.de>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Kalle Valo <kvalo@kernel.org>, Dmitry Antipov <dmantipov@yandex.ru>, libertas-dev@lists.infradead.org, linux-wireless@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Bjorn Helgaas <bhelgaas@google.com>, James Clark <james.clark@arm.com>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 00/32] spi: get rid of some legacy macros
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/K7PXM737XF345LMBHASIPWFZDVNMJQHB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Q2hhbmdlcyBzaW5jZSB2Mg0KKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXNwaS9jb3Zl
ci4xNzA1OTQ0OTQzLmdpdC51LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGUpOg0KDQogLSBE
cm9wIHBhdGNoICJtdGQ6IHJhd25hbmQ6IGZzbF9lbGJjOiBMZXQgLnByb2JlIHJldHJ5IGlmIGxv
Y2FsIGJ1cyBpcw0KICAgbWlzc2luZyIgd2hpY2ggZG9lc24ndCBiZWxvbmcgaW50byB0aGlzIHNl
cmllcy4NCiAtIEZpeCBhIGJ1aWxkIGZhaWx1cmUgbm90aWNlZCBieSB0aGUga2VybmVsIGJ1aWxk
IGJvdCBpbg0KICAgZHJpdmVycy9zcGkvc3BpLWF1MTU1MC5jLiAoSSBmYWlsZWQgdG8gY2F0Y2gg
dGhpcyBiZWNhdXNlIHRoaXMgZHJpdmVyDQogICBpcyBtaXBzIG9ubHksIGJ1dCBub3QgZW5hYmxl
ZCBpbiBhIG1pcHMgYWxsbW9kY29uZmlnLiBUaGF0J3MgYSBiaXQNCiAgIHVuZm9ydHVuYXRlLCBi
dXQgbm90IGVhc2lseSBmaXhhYmxlLikNCiAtIEFkZCB0aGUgUmV2aWV3ZWQtYnk6IGFuZCBBY2tl
ZC1ieTogdGFncyBJIHJlY2VpdmVkIGZvciB2Mi4NCg0KTWFyayBhbHJlYWR5IGFubm91bmNlZCBm
b3IgdjIgdGhhdCBoZSBpcyB3aWxsaW5nIHRvIGFwcGx5IHRoZSB3aG9sZQ0Kc2VyaWVzIHRvIGhp
cyBzcGkgdHJlZS4gQXNzdW1pbmcgbm8gb3RoZXIgc2hvdyBzdG9wZXIgYXJlIGZvdW5kIGluIHRo
aXMNCnYzLCBJIGFzc3VtZSB0aGF0J3MgdGhlIHBsYW4gc3RpbGwgZm9yIHRoaXMgc2VyaWVzIG5v
dy4NCg0KVGhhbmtzDQpVd2UNCg0KVXdlIEtsZWluZS1Lw7ZuaWcgKDMyKToNCiAgZnBnYTogaWNl
NDAtc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0K
ICBpZWVlODAyMTU0OiBjYTgyMTA6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8g
ImNvbnRyb2xsZXIiDQogIGlpbzogYWRjOiBhZF9zaWdtYV9kZWx0YTogRm9sbG93IHJlbmFtaW5n
IG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgSW5wdXQ6IHB4c3BhZCAtIGZvbGxv
dyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIElucHV0OiBzeW5h
cHRpY3Mtcm1pNCAtIGZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xs
ZXIiDQogIG1lZGlhOiBtZ2I0OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJj
b250cm9sbGVyIg0KICBtZWRpYTogbmV0dXBfdW5pZHZiOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJ
ICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBtZWRpYTogdXNiL21zaTI1MDA6IEZvbGxvdyBy
ZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIG1lZGlhOiB2NGwyLXN1
YmRldjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAg
bWlzYzogZ2VoYy1hY2hjOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250
cm9sbGVyIg0KICBtbWM6IG1tY19zcGk6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIg
dG8gImNvbnRyb2xsZXIiDQogIG10ZDogZGF0YWZsYXNoOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJ
ICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBuZXQ6IGtzODg1MTogRm9sbG93IHJlbmFtaW5n
IG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgbmV0OiB2ZXJ0ZXhjb206IG1zZTEw
Mng6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIHBs
YXRmb3JtL2Nocm9tZTogY3Jvc19lY19zcGk6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3Rl
ciIgdG8gImNvbnRyb2xsZXIiDQogIHNwaTogYml0YmFuZzogRm9sbG93IHJlbmFtaW5nIG9mIFNQ
SSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgc3BpOiBjYWRlbmNlLXF1YWRzcGk6IERvbid0
IGVtaXQgZXJyb3IgbWVzc2FnZSBvbiBhbGxvY2F0aW9uIGVycm9yDQogIHNwaTogY2FkZW5jZS1x
dWFkc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0K
ICBzcGk6IGNhdml1bTogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJv
bGxlciINCiAgc3BpOiBnZW5pLXFjb206IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIg
dG8gImNvbnRyb2xsZXIiDQogIHNwaTogbG9vcGJhY2stdGVzdDogRm9sbG93IHJlbmFtaW5nIG9m
IFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgc3BpOiBzbGF2ZS1tdDI3eHg6IEZvbGxv
dyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8gImNvbnRyb2xsZXIiDQogIHNwaTogc3BpZGV2
OiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBzdGFn
aW5nOiBmYnRmdDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxl
ciINCiAgc3RhZ2luZzogZ3JleWJ1czogc3BpOiBGb2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0
ZXIiIHRvICJjb250cm9sbGVyIg0KICB0cG1fdGlzX3NwaTogRm9sbG93IHJlbmFtaW5nIG9mIFNQ
SSAibWFzdGVyIiB0byAiY29udHJvbGxlciINCiAgdXNiOiBnYWRnZXQ6IG1heDM0MjBfdWRjOiBG
b2xsb3cgcmVuYW1pbmcgb2YgU1BJICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICB2aWRlbzog
ZmJkZXY6IG1tcDogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFzdGVyIiB0byAiY29udHJvbGxl
ciINCiAgd2lmaTogbGliZXJ0YXM6IEZvbGxvdyByZW5hbWluZyBvZiBTUEkgIm1hc3RlciIgdG8g
ImNvbnRyb2xsZXIiDQogIHNwaTogZnNsLWxpYjogRm9sbG93IHJlbmFtaW5nIG9mIFNQSSAibWFz
dGVyIiB0byAiY29udHJvbGxlciINCiAgc3BpOiBEcm9wIGNvbXBhdCBsYXllciBmcm9tIHJlbmFt
aW5nICJtYXN0ZXIiIHRvICJjb250cm9sbGVyIg0KICBEb2N1bWVudGF0aW9uOiBzcGk6IFVwZGF0
ZSBkb2N1bWVudGF0aW9uIGZvciByZW5hbWluZyAibWFzdGVyIiB0byAiY29udHJvbGxlciINCg0K
IC4uLi9kcml2ZXItYXBpL2RyaXZlci1tb2RlbC9kZXZyZXMucnN0ICAgICAgICB8ICAyICstDQog
RG9jdW1lbnRhdGlvbi9zcGkvc3BpLXN1bW1hcnkucnN0ICAgICAgICAgICAgIHwgNzQgKysrKysr
KysrLS0tLS0tLS0tLQ0KIGRyaXZlcnMvY2hhci90cG0vdHBtX3Rpc19zcGlfbWFpbi5jICAgICAg
ICAgICB8ICA0ICstDQogZHJpdmVycy9mcGdhL2ljZTQwLXNwaS5jICAgICAgICAgICAgICAgICAg
ICAgIHwgIDQgKy0NCiBkcml2ZXJzL2lpby9hZGMvYWRfc2lnbWFfZGVsdGEuYyAgICAgICAgICAg
ICAgfCAxNCArKy0tDQogZHJpdmVycy9pbnB1dC9qb3lzdGljay9wc3hwYWQtc3BpLmMgICAgICAg
ICAgIHwgIDQgKy0NCiBkcml2ZXJzL2lucHV0L3JtaTQvcm1pX3NwaS5jICAgICAgICAgICAgICAg
ICAgfCAgMiArLQ0KIGRyaXZlcnMvbWVkaWEvcGNpL21nYjQvbWdiNF9jb3JlLmMgICAgICAgICAg
ICB8IDE0ICsrLS0NCiAuLi4vbWVkaWEvcGNpL25ldHVwX3VuaWR2Yi9uZXR1cF91bmlkdmJfc3Bp
LmMgfCA0OCArKysrKystLS0tLS0NCiBkcml2ZXJzL21lZGlhL3VzYi9tc2kyNTAwL21zaTI1MDAu
YyAgICAgICAgICAgfCAzOCArKysrKy0tLS0tDQogZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRs
Mi1zcGkuYyAgICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL21pc2MvZ2VoYy1hY2hjLmMgICAg
ICAgICAgICAgICAgICAgICAgfCAgOCArLQ0KIGRyaXZlcnMvbW1jL2hvc3QvbW1jX3NwaS5jICAg
ICAgICAgICAgICAgICAgICB8ICA2ICstDQogZHJpdmVycy9tdGQvZGV2aWNlcy9tdGRfZGF0YWZs
YXNoLmMgICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9taWNyZWwva3M4
ODUxX3NwaS5jICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvbmV0L2V0aGVybmV0L3ZlcnRleGNvbS9t
c2UxMDJ4LmMgICAgICB8ICAyICstDQogZHJpdmVycy9uZXQvaWVlZTgwMjE1NC9jYTgyMTAuYyAg
ICAgICAgICAgICAgIHwgIDIgKy0NCiAuLi4vbmV0L3dpcmVsZXNzL21hcnZlbGwvbGliZXJ0YXMv
aWZfc3BpLmMgICAgfCAgMiArLQ0KIGRyaXZlcnMvcGxhdGZvcm0vY2hyb21lL2Nyb3NfZWNfc3Bp
LmMgICAgICAgICB8ICA4ICstDQogZHJpdmVycy9zcGkvc3BpLWF0aDc5LmMgICAgICAgICAgICAg
ICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL3NwaS9zcGktYXUxNTUwLmMgICAgICAgICAgICAg
ICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1iaXRiYW5nLmMgICAgICAgICAgICAg
ICAgICAgICB8IDY0ICsrKysrKysrLS0tLS0tLS0NCiBkcml2ZXJzL3NwaS9zcGktYnV0dGVyZmx5
LmMgICAgICAgICAgICAgICAgICAgfCAgNiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1jYWRlbmNlLXF1
YWRzcGkuYyAgICAgICAgICAgICB8ICA3ICstDQogZHJpdmVycy9zcGkvc3BpLWNhdml1bS5jICAg
ICAgICAgICAgICAgICAgICAgIHwgIDYgKy0NCiBkcml2ZXJzL3NwaS9zcGktY2F2aXVtLmggICAg
ICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1kYXZpbmNpLmMgICAg
ICAgICAgICAgICAgICAgICB8ICA2ICstDQogZHJpdmVycy9zcGkvc3BpLWZzbC1saWIuYyAgICAg
ICAgICAgICAgICAgICAgIHwgMTQgKystLQ0KIGRyaXZlcnMvc3BpL3NwaS1nZW5pLXFjb20uYyAg
ICAgICAgICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9zcGkvc3BpLWdwaW8uYyAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3NwaS9zcGktbG03MGxscC5jICAgICAg
ICAgICAgICAgICAgICAgfCAgNiArLQ0KIGRyaXZlcnMvc3BpL3NwaS1sb29wYmFjay10ZXN0LmMg
ICAgICAgICAgICAgICB8ICA0ICstDQogZHJpdmVycy9zcGkvc3BpLW9jLXRpbnkuYyAgICAgICAg
ICAgICAgICAgICAgIHwgIDYgKy0NCiBkcml2ZXJzL3NwaS9zcGktb21hcC11d2lyZS5jICAgICAg
ICAgICAgICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvc3BpL3NwaS1zaC1zY2kuYyAgICAgICAgICAg
ICAgICAgICAgICB8IDEwICstLQ0KIGRyaXZlcnMvc3BpL3NwaS1zbGF2ZS1tdDI3eHguYyAgICAg
ICAgICAgICAgICB8ICAyICstDQogZHJpdmVycy9zcGkvc3BpLXhpbGlueC5jICAgICAgICAgICAg
ICAgICAgICAgIHwgIDQgKy0NCiBkcml2ZXJzL3NwaS9zcGkteHRlbnNhLXh0ZnBnYS5jICAgICAg
ICAgICAgICAgfCAgMiArLQ0KIGRyaXZlcnMvc3BpL3NwaS5jICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAyICstDQogZHJpdmVycy9zcGkvc3BpZGV2LmMgICAgICAgICAgICAgICAgICAg
ICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3N0YWdpbmcvZmJ0ZnQvZmJ0ZnQtY29yZS5jICAgICAg
ICAgICAgfCAgNCArLQ0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jICAgICAgICAg
ICAgICB8IDY2ICsrKysrKysrLS0tLS0tLS0tDQogZHJpdmVycy91c2IvZ2FkZ2V0L3VkYy9tYXgz
NDIwX3VkYy5jICAgICAgICAgIHwgIDIgKy0NCiBkcml2ZXJzL3ZpZGVvL2ZiZGV2L21tcC9ody9t
bXBfc3BpLmMgICAgICAgICAgfCAyNiArKystLS0tDQogaW5jbHVkZS9saW51eC9zcGkvc3BpLmgg
ICAgICAgICAgICAgICAgICAgICAgIHwgMjAgKy0tLS0NCiBpbmNsdWRlL2xpbnV4L3NwaS9zcGlf
Yml0YmFuZy5oICAgICAgICAgICAgICAgfCAgMiArLQ0KIGluY2x1ZGUvbWVkaWEvdjRsMi1jb21t
b24uaCAgICAgICAgICAgICAgICAgICB8ICA2ICstDQogNDcgZmlsZXMgY2hhbmdlZCwgMjUzIGlu
c2VydGlvbnMoKyksIDI3MiBkZWxldGlvbnMoLSkNCg0KDQpiYXNlLWNvbW1pdDogYjliOThmNTk0
YjZmNGMwYjBmYjJkYTQ0OTM0NTNhZWYxODNiY2E0Yg0KLS0gDQoyLjQzLjANCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
