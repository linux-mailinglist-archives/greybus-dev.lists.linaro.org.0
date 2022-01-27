Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B26104CA92F
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:46 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E290D3EF46
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:45 +0000 (UTC)
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
	by lists.linaro.org (Postfix) with ESMTPS id C4B52401C3
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 14:41:27 +0000 (UTC)
Received: from spock.localnet (unknown [83.148.33.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vulcan.natalenko.name (Postfix) with ESMTPSA id 38C73D8B248;
	Thu, 27 Jan 2022 15:41:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1643294486;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xRfG6qv9eNrmVk+OrljXkrc5mg43YFh2rdY8MzYAUgM=;
	b=XIOCTcxRxoBYbF1ZVSNa4whYzYj/UVLtiCZawfTGuczIfGj78m+V4SJ5+IBZ+Z8Phvp9A8
	QQ05YD6gW3L+FqdvakRaKsGakD8q5PwvErpFM6qO7KrgkNw237gy9Qx8SUTiS7E9ZN0BAw
	rRcK6E3kv+X1jImpCrFsDULfv+iRfng=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Thu, 27 Jan 2022 15:41:24 +0100
Message-ID: <4929165.31r3eYUQgx@natalenko.name>
In-Reply-To: <20220127113303.3012207-3-bigeasy@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de> <20220127113303.3012207-3-bigeasy@linutronix.de>
MIME-Version: 1.0
X-MailFrom: oleksandr@natalenko.name
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DDUZB4GY7TD7F63NZQVSH2U2YYM6REUA
X-Message-ID-Hash: DDUZB4GY7TD7F63NZQVSH2U2YYM6REUA
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:43 +0000
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michael Below <below@judiz.de>, Salvatore Bonaccorso <carnil@debian.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/7] i2c: core: Use generic_handle_irq_safe() in i2c_handle_smbus_host_notify().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DDUZB4GY7TD7F63NZQVSH2U2YYM6REUA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8uDQoNCk9uIMSNdHZydGVrIDI3LiBsZWRuYSAyMDIyIDEyOjMyOjU4IENFVCBTZWJhc3Rp
YW4gQW5kcnplaiBTaWV3aW9yIHdyb3RlOg0KPiBUaGUgaTJjLWk4MDEgZHJpdmVyIGludm9rZXMg
aTJjX2hhbmRsZV9zbWJ1c19ob3N0X25vdGlmeSgpIGZyb20gaGlzDQo+IGludGVycnVwdCBzZXJ2
aWNlIHJvdXRpbmUuIE9uIFBSRUVNUFRfUlQgaTJjLWk4MDEncyBoYW5kbGVyIGlzIGZvcmNlZA0K
PiB0aHJlYWRlZCB3aXRoIGVuYWJsZWQgaW50ZXJydXB0cyB3aGljaCBsZWFkcyB0byBhIHdhcm5p
bmcgYnkNCj4gaGFuZGxlX2lycV9ldmVudF9wZXJjcHUoKSBhc3N1bWluZyB0aGF0IGlycV9kZWZh
dWx0X3ByaW1hcnlfaGFuZGxlcigpDQo+IGVuYWJsZWQgaW50ZXJydXB0cy4NCj4gDQo+IGkyYy1p
ODAxJ3MgaW50ZXJydXB0IGhhbmRsZXIgY2FuJ3QgYmUgbWFkZSBub24tdGhyZWFkZWQgYmVjYXVz
ZSB0aGUNCj4gaW50ZXJydXB0IGxpbmUgaXMgc2hhcmVkIHdpdGggb3RoZXIgZGV2aWNlcy4NCj4g
DQo+IFVzZSBnZW5lcmljX2hhbmRsZV9pcnFfc2FmZSgpIHdoaWNoIGNhbiBpbnZva2VkIHdpdGgg
ZGlzYWJsZWQgYW5kIGVuYWJsZWQNCj4gaW50ZXJydXB0cy4NCj4gDQo+IFJlcG9ydGVkLWJ5OiBN
aWNoYWVsIEJlbG93IDxiZWxvd0BqdWRpei5kZT4NCj4gTGluazogaHR0cHM6Ly9idWdzLmRlYmlh
bi5vcmcvMTAwMjUzNw0KPiBDYzogU2FsdmF0b3JlIEJvbmFjY29yc28gPGNhcm5pbEBkZWJpYW4u
b3JnPg0KPiBTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5
QGxpbnV0cm9uaXguZGU+DQo+IC0tLQ0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jIHwg
MiArLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+
IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jIGIvZHJpdmVycy9p
MmMvaTJjLWNvcmUtYmFzZS5jDQo+IGluZGV4IDJjNTlkZDc0OGE0OWYuLjNmOWU1MzAzYjYxNjMg
MTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvaTJjL2kyYy1jb3JlLWJhc2UuYw0KPiArKysgYi9kcml2
ZXJzL2kyYy9pMmMtY29yZS1iYXNlLmMNCj4gQEAgLTE0MjQsNyArMTQyNCw3IEBAIGludCBpMmNf
aGFuZGxlX3NtYnVzX2hvc3Rfbm90aWZ5KHN0cnVjdCBpMmNfYWRhcHRlciAqYWRhcCwgdW5zaWdu
ZWQgc2hvcnQgYWRkcikNCj4gIAlpZiAoaXJxIDw9IDApDQo+ICAJCXJldHVybiAtRU5YSU87DQo+
ICANCj4gLQlnZW5lcmljX2hhbmRsZV9pcnEoaXJxKTsNCj4gKwlnZW5lcmljX2hhbmRsZV9pcnFf
c2FmZShpcnEpOw0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IA0KDQpSZXZpZXdlZC1ieTog
T2xla3NhbmRyIE5hdGFsZW5rbyA8b2xla3NhbmRyQG5hdGFsZW5rby5uYW1lPg0KDQpXb3J0aCBs
aW5raW5nIFsxXSBbMl0gYW5kIFszXSBhcyB3ZWxsIG1heWJlPw0KDQpbMV0gaHR0cHM6Ly9idWdz
LmxhdW5jaHBhZC5uZXQvdWJ1bnR1Lytzb3VyY2UvbGludXgvK2J1Zy8xODczNjczDQpbMl0gaHR0
cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDI0NTMNClszXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMjAxMjA0MjAxOTMwLnZ0dml0c3E2eGNmdGpqM29A
c3BvY2subG9jYWxkb21haW4vDQoNCi0tIA0KT2xla3NhbmRyIE5hdGFsZW5rbyAocG9zdC1mYWN0
dW0pDQoNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5s
aW5hcm8ub3JnCg==
