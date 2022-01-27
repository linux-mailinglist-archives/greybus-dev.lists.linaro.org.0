Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C84CA92E
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:37:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 75DE23EF08
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:37:43 +0000 (UTC)
Received: from vulcan.natalenko.name (vulcan.natalenko.name [104.207.131.136])
	by lists.linaro.org (Postfix) with ESMTPS id 8894F401D5
	for <greybus-dev@lists.linaro.org>; Thu, 27 Jan 2022 14:40:43 +0000 (UTC)
Received: from spock.localnet (unknown [83.148.33.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vulcan.natalenko.name (Postfix) with ESMTPSA id 4BEBCD8B22F;
	Thu, 27 Jan 2022 15:40:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
	s=dkim-20170712; t=1643294441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OkaYBUaQDMs19i4HXWrJsJm9o280IUe9ric8r65dz6o=;
	b=b3G9grRz8fhqkUesaxFiZYnVSzSaACXLpHjBzkwG+iE6FOB6Cmuw+Oy3MuAw6tkBb6NOsL
	wUO74jv79omeTLK4hbzu5aKyLqYQkvwFVJ1iC3lvAQGuk4t6AjRP5yPPjznvIcg+h89tMJ
	HGbRVAy8T9dtZ1WaUSRHpoK6niUcv1U=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: greybus-dev@lists.linaro.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, netdev@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Date: Thu, 27 Jan 2022 15:40:39 +0100
Message-ID: <5753562.DvuYhMxLoT@natalenko.name>
In-Reply-To: <20220127113303.3012207-2-bigeasy@linutronix.de>
References: <20220127113303.3012207-1-bigeasy@linutronix.de> <20220127113303.3012207-2-bigeasy@linutronix.de>
MIME-Version: 1.0
X-MailFrom: oleksandr@natalenko.name
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FNPD2ILQWUJXU4HKQTMFM3FCW7DLPWCX
X-Message-ID-Hash: FNPD2ILQWUJXU4HKQTMFM3FCW7DLPWCX
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:41 +0000
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FNPD2ILQWUJXU4HKQTMFM3FCW7DLPWCX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGVsbG8uDQoNCk9uIMSNdHZydGVrIDI3LiBsZWRuYSAyMDIyIDEyOjMyOjU3IENFVCBTZWJhc3Rp
YW4gQW5kcnplaiBTaWV3aW9yIHdyb3RlOg0KPiBQcm92aWRlIGdlbmVyaWNfaGFuZGxlX2lycV9z
YWZlKCkgd2hpY2ggY2FuIGJlIHVzZWQgY2FuIHVzZWQgZnJvbSBhbnkNCj4gY29udGV4dC4NCj4g
DQo+IFN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9uaXguZGU+DQo+
IFNpZ25lZC1vZmYtYnk6IFNlYmFzdGlhbiBBbmRyemVqIFNpZXdpb3IgPGJpZ2Vhc3lAbGludXRy
b25peC5kZT4NCj4gLS0tDQo+ICBpbmNsdWRlL2xpbnV4L2lycWRlc2MuaCB8ICAxICsNCj4gIGtl
cm5lbC9pcnEvaXJxZGVzYy5jICAgIHwgMjEgKysrKysrKysrKysrKysrKysrKysrDQo+ICAyIGZp
bGVzIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L2lycWRlc2MuaCBiL2luY2x1ZGUvbGludXgvaXJxZGVzYy5oDQo+IGluZGV4IDkzZDI3
MGNhMGM1NjcuLmE3NzU4NDU5M2Y3ZDEgMTAwNjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaXJx
ZGVzYy5oDQo+ICsrKyBiL2luY2x1ZGUvbGludXgvaXJxZGVzYy5oDQo+IEBAIC0xNjAsNiArMTYw
LDcgQEAgc3RhdGljIGlubGluZSB2b2lkIGdlbmVyaWNfaGFuZGxlX2lycV9kZXNjKHN0cnVjdCBp
cnFfZGVzYyAqZGVzYykNCj4gIA0KPiAgaW50IGhhbmRsZV9pcnFfZGVzYyhzdHJ1Y3QgaXJxX2Rl
c2MgKmRlc2MpOw0KPiAgaW50IGdlbmVyaWNfaGFuZGxlX2lycSh1bnNpZ25lZCBpbnQgaXJxKTsN
Cj4gK2ludCBnZW5lcmljX2hhbmRsZV9pcnFfc2FmZSh1bnNpZ25lZCBpbnQgaXJxKTsNCj4gIA0K
PiAgI2lmZGVmIENPTkZJR19JUlFfRE9NQUlODQo+ICAvKg0KPiBkaWZmIC0tZ2l0IGEva2VybmVs
L2lycS9pcnFkZXNjLmMgYi9rZXJuZWwvaXJxL2lycWRlc2MuYw0KPiBpbmRleCAyMjY3ZTY1Mjdk
YjNjLi45NzIyM2RmMmY0NjBlIDEwMDY0NA0KPiAtLS0gYS9rZXJuZWwvaXJxL2lycWRlc2MuYw0K
PiArKysgYi9rZXJuZWwvaXJxL2lycWRlc2MuYw0KPiBAQCAtNjYyLDYgKzY2MiwyNyBAQCBpbnQg
Z2VuZXJpY19oYW5kbGVfaXJxKHVuc2lnbmVkIGludCBpcnEpDQo+ICB9DQo+ICBFWFBPUlRfU1lN
Qk9MX0dQTChnZW5lcmljX2hhbmRsZV9pcnEpOw0KPiAgDQo+ICsvKioNCj4gKyAqIGdlbmVyaWNf
aGFuZGxlX2lycV9zYWZlIC0gSW52b2tlIHRoZSBoYW5kbGVyIGZvciBhIHBhcnRpY3VsYXIgaXJx
DQo+ICsgKiBAaXJxOglUaGUgaXJxIG51bWJlciB0byBoYW5kbGUNCj4gKyAqDQo+ICsgKiBSZXR1
cm5zOgkwIG9uIHN1Y2Nlc3MsIG9yIC1FSU5WQUwgaWYgY29udmVyc2lvbiBoYXMgZmFpbGVkDQo+
ICsgKg0KPiArICogVGhpcyBmdW5jdGlvbiBtdXN0IGJlIGNhbGxlZCBlaXRoZXIgZnJvbSBhbiBJ
UlEgY29udGV4dCB3aXRoIGlycSByZWdzDQo+ICsgKiBpbml0aWFsaXplZCBvciB3aXRoIGNhcmUg
ZnJvbSBhbnkgY29udGV4dC4NCj4gKyAqLw0KPiAraW50IGdlbmVyaWNfaGFuZGxlX2lycV9zYWZl
KHVuc2lnbmVkIGludCBpcnEpDQo+ICt7DQo+ICsJdW5zaWduZWQgbG9uZyBmbGFnczsNCj4gKwlp
bnQgcmV0Ow0KPiArDQo+ICsJbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KPiArCXJldCA9IGhhbmRs
ZV9pcnFfZGVzYyhpcnFfdG9fZGVzYyhpcnEpKTsNCj4gKwlsb2NhbF9pcnFfcmVzdG9yZShmbGFn
cyk7DQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gK0VYUE9SVF9TWU1CT0xfR1BMKGdlbmVyaWNf
aGFuZGxlX2lycV9zYWZlKTsNCj4gKw0KPiAgI2lmZGVmIENPTkZJR19JUlFfRE9NQUlODQo+ICAv
KioNCj4gICAqIGdlbmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEgLSBJbnZva2UgdGhlIGhhbmRsZXIg
Zm9yIGEgSFcgaXJxIGJlbG9uZ2luZw0KPiANCg0KUmV2aWV3ZWQtYnk6IE9sZWtzYW5kciBOYXRh
bGVua28gPG9sZWtzYW5kckBuYXRhbGVua28ubmFtZT4NCg0KVGhhbmsgeW91Lg0KDQotLSANCk9s
ZWtzYW5kciBOYXRhbGVua28gKHBvc3QtZmFjdHVtKQ0KDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
