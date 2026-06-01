Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCuaFAo1HWoqWQkAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 09:30:18 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2A861AE54
	for <lists+greybus-dev@lfdr.de>; Mon, 01 Jun 2026 09:30:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 97C523F6F4
	for <lists+greybus-dev@lfdr.de>; Mon,  1 Jun 2026 07:30:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 562E33F6F4
	for <greybus-dev@lists.linaro.org>; Mon,  1 Jun 2026 07:30:11 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=KPtTOlbB;
	spf=pass (lists.linaro.org: domain of bentiss@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=bentiss@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E1B0360018;
	Mon,  1 Jun 2026 07:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 643151F00893;
	Mon,  1 Jun 2026 07:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780299010;
	bh=gzL2SkcPkY1ldzSUTPG15UAH/VU6zt02ppqwKAVNiNk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KPtTOlbBxe1Yje7/O/XLhDQ1xUOBh7WMYZ0z1ajw90/Hy78HgnC0veSYnWX7n0i1Q
	 EmmWADIPMpshoRg3Ya4GAsAgow/NXBOVd7MKyfeM8iMn+UGfrXi1BFhmmkxWnFcA8v
	 Kv7buAIJvrNL+bra9gaS6oSrJcl8hH0nD8w7jyYIbEHvK3WUW0xe6oW6ynxnqM88or
	 9ZDg8zZz+aMcN+QaQJwiDvEuNggHslQnH1FXnG+cwdhwPjIZ+YDWq7Mt4ZaRRWkpB8
	 9vbeZeYJShgotMvQmg6jVXRkekg/TzHbfytrkS/NQKVXyYcbsB0nmW/OWojFhtWMKU
	 VG126C8Kk8qqg==
Date: Mon, 1 Jun 2026 09:30:04 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Carlos Llamas <cmllamas@google.com>
Message-ID: <ah00D_yttLtjlYA-@beelink>
References: <20260415-wip-fix-core-v1-0-ed3c4c823175@kernel.org>
 <20260415-wip-fix-core-v1-2-ed3c4c823175@kernel.org>
 <8fedad8e9caecd379f2296562cd6abd37f7cee46.camel@hadess.net>
 <CAO-hwJ+EgC0pM6L6vGFEaRFt2Nwj5b-CCf_5e5VkvrXgdHrjNg@mail.gmail.com>
 <ahsh0UtTX6e0ZeHa@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ahsh0UtTX6e0ZeHa@google.com>
X-Spamd-Bar: ---
Message-ID-Hash: 3WTJH2WLUDXLQTWCSITP7QNX3VUVCX6W
X-Message-ID-Hash: 3WTJH2WLUDXLQTWCSITP7QNX3VUVCX6W
X-MailFrom: bentiss@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Bastien Nocera <hadess@hadess.net>, Jiri Kosina <jikos@kernel.org>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/4] HID: core: introduce hid_safe_input_report()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3WTJH2WLUDXLQTWCSITP7QNX3VUVCX6W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [2.59 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20260515];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.291];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hadess.net:email]
X-Rspamd-Queue-Id: CB2A861AE54
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgQ2FybG9zLA0KDQpPbiBNYXkgMzAgMjAyNiwgQ2FybG9zIExsYW1hcyB3cm90ZToNCj4gT24g
VGh1LCBBcHIgMTYsIDIwMjYgYXQgMDQ6NDY6MjhQTSArMDIwMCwgQmVuamFtaW4gVGlzc29pcmVz
IHdyb3RlOg0KPiA+IE9uIFRodSwgQXByIDE2LCAyMDI2IGF0IDExOjQx4oCvQU0gQmFzdGllbiBO
b2NlcmEgPGhhZGVzc0BoYWRlc3MubmV0PiB3cm90ZToNCj4gPiA+DQo+ID4gPiBPbiBXZWQsIDIw
MjYtMDQtMTUgYXQgMTE6MzggKzAyMDAsIEJlbmphbWluIFRpc3NvaXJlcyB3cm90ZToNCj4gPiA+
ID4gaGlkX2lucHV0X3JlcG9ydCgpIGlzIHVzZWQgaW4gdG9vIG1hbnkgcGxhY2VzIHRvIGhhdmUg
YSBjb21taXQgdGhhdA0KPiA+ID4gPiBkb2Vzbid0IGNyb3NzIHN1YnN5c3RlbSBib3JkZXJzLiBJ
bnN0ZWFkIG9mIGNoYW5naW5nIHRoZSBBUEksDQo+ID4gPiA+IGludHJvZHVjZQ0KPiA+ID4gPiBh
IG5ldyBvbmUgd2hlbiB0aGluZ3MgbWF0dGVycyBpbiB0aGUgdHJhbnNwb3J0IGxheWVyczoNCj4g
PiA+ID4gLSB1c2JoaWQNCj4gPiA+ID4gLSBpMmNoaWQNCj4gPiA+ID4NCj4gPiA+ID4gVGhpcyBl
ZmZlY3RpdmVseSByZXZlcnQgdG8gdGhlIG9sZCBiZWhhdmlvciBmb3IgdGhvc2UgdHdvIHRyYW5z
cG9ydA0KPiA+ID4gPiBsYXllcnMuDQo+ID4gPiA+DQo+ID4gPiA+IEZpeGVzOiAwYTNmZTk3MmE3
Y2IgKCJISUQ6IGNvcmU6IE1pdGlnYXRlIHBvdGVudGlhbCBPT0IgYnkgcmVtb3ZpbmcNCj4gPiA+
ID4gYm9ndXMgbWVtc2V0KCkiKQ0KPiA+ID4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBCZW5qYW1pbiBUaXNzb2lyZXMgPGJlbnRpc3NAa2VybmVs
Lm9yZz4NCj4gPiA+ID4gLS0tDQpbLi4uXQ0KPiANCj4gSGkgQmVuamFtaW4sIG91ciBDSSBzdGFy
dGVkIGZhaWxpbmcgd2l0aCBjb21taXQgMGEzZmU5NzJhN2NiICgiSElEOg0KPiBjb3JlOiBNaXRp
Z2F0ZSBwb3RlbnRpYWwgT09CIGJ5IHJlbW92aW5nIGJvZ3VzIG1lbXNldCgpIiksIHNvIEkgd2Fz
DQo+IGhvcGluZyB5b3VyIHBhdGNoc2V0IHdvdWxkIGZpeCB0aGlzLg0KPiANCj4gSG93ZXZlciwg
SSBqdXN0IHJlYWxpemVkIG91ciBjYWxsIHBhdGggZ29lcyB0aHJvdWdoIHVoaWQgcHJlY2lzZWx5
LA0KPiB3aGljaCBzdGlsbCB0cmlnZ2VycyB0aGUgRUlOVkFMIGVycm9yIHNpbmNlIHVoaWQgYXMg
bm90IGNvbnZlcnRlZCB0bw0KPiBoaWRfc2FmZV9pbnB1dF9yZXBvcnQoKS4NCj4gDQo+IE15IHZh
Z3VlIHVuZGVyc3RhbmRpbmcgdGhvdWdoLCBpcyB0aGF0IHVoaWRfZXZlbnQgdXNlcyBhIHN0YXRp
YyBidWZmZXINCj4gaW4gZXYtPmRhdGFbVUhJRF9EQVRBX01BWF0sIHNvIG1heWJlIHdlIGNhbiB1
c2UgdGhhdCB0aHJvdWdoDQo+IHVoaWRfZGV2X2lucHV0ezJ9KCk/DQo+IA0KPiBJIHJhbiB0aGUg
Zm9sbG93aW5nIHBhdGggdGhyb3VnaCBvdXIgQ0kgYW5kIGl0IGZpeGVkIG91ciBpc3N1ZSwgc28g
SQ0KPiB3YW50ZWQgdG8gZ2V0IHlvdXIgdGhvdWdodHMgb24gdGhpcy4NCg0KT2gsIHllcywgeW91
IGFyZSBjb3JyZWN0LiBTb3JyeSB3aXRoIGFsbCB0aGUgYmFjayBhbmQgZm9ydGggb24gdGhpcw0K
cGFyaXRjdWxhciB0b3BpYywgbXkgYnJhaW4gYXNzdW1lZCB0aGF0IHVoaWQgd2FzIG9ubHkgYWxs
b2NhdGluZyB0aGUNCnVzZWZ1bCBwYXJ0IG9mIHRoZSBwYXlsb2FkIGFuZCB3YXMgbm90IHNhZmUu
DQoNCkZvciB0aGUgZnV0dXJlIG1lOiB0aGUgcHJvYmxlbSB3aXRoIHVoaWQgd2FzIHRoYXQgd2Ug
d2VyZSBlbXVsdGFpbmcNCmRldmljZXMgdGhhdCB3b3VsZCB0cmlnZ2VyIGEgYnVnIGVsc2V3aGVy
ZSBpbiB0aGUgc3RhY2sgbm90IGluDQp1aGlkX2Rldl9pbnB1dCooKS4NCg0KUGF0Y2ggbG9va3Mg
Z29vZCwgcGxlYXNlIHNlbmQgaXQgbm9ybWFsbHkgdG8gdGhlIE1MIHdpdGggeW91ciBTb0IgOikN
Cg0KQ2hlZXJzLA0KQmVuamFtaW4NCg0KPiANCj4gQ2FybG9zIExsYW1hcw0KPiANCj4gLS0tDQo+
ICBkcml2ZXJzL2hpZC91aGlkLmMgfCA4ICsrKystLS0tDQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
aGlkL3VoaWQuYyBiL2RyaXZlcnMvaGlkL3VoaWQuYw0KPiBpbmRleCA1MjRiNTNhM2M4N2IuLjM3
YjYwYzNhYWY2NiAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9oaWQvdWhpZC5jDQo+ICsrKyBiL2Ry
aXZlcnMvaGlkL3VoaWQuYw0KPiBAQCAtNTk1LDggKzU5NSw4IEBAIHN0YXRpYyBpbnQgdWhpZF9k
ZXZfaW5wdXQoc3RydWN0IHVoaWRfZGV2aWNlICp1aGlkLCBzdHJ1Y3QgdWhpZF9ldmVudCAqZXYp
DQo+ICAJaWYgKCFSRUFEX09OQ0UodWhpZC0+cnVubmluZykpDQo+ICAJCXJldHVybiAtRUlOVkFM
Ow0KPiAgDQo+IC0JaGlkX2lucHV0X3JlcG9ydCh1aGlkLT5oaWQsIEhJRF9JTlBVVF9SRVBPUlQs
IGV2LT51LmlucHV0LmRhdGEsDQo+IC0JCQkgbWluX3Qoc2l6ZV90LCBldi0+dS5pbnB1dC5zaXpl
LCBVSElEX0RBVEFfTUFYKSwgMCk7DQo+ICsJaGlkX3NhZmVfaW5wdXRfcmVwb3J0KHVoaWQtPmhp
ZCwgSElEX0lOUFVUX1JFUE9SVCwgZXYtPnUuaW5wdXQuZGF0YSwgVUhJRF9EQVRBX01BWCwNCj4g
KwkJCSAgICAgIG1pbl90KHNpemVfdCwgZXYtPnUuaW5wdXQuc2l6ZSwgVUhJRF9EQVRBX01BWCks
IDApOw0KPiAgDQo+ICAJcmV0dXJuIDA7DQo+ICB9DQo+IEBAIC02MDYsOCArNjA2LDggQEAgc3Rh
dGljIGludCB1aGlkX2Rldl9pbnB1dDIoc3RydWN0IHVoaWRfZGV2aWNlICp1aGlkLCBzdHJ1Y3Qg
dWhpZF9ldmVudCAqZXYpDQo+ICAJaWYgKCFSRUFEX09OQ0UodWhpZC0+cnVubmluZykpDQo+ICAJ
CXJldHVybiAtRUlOVkFMOw0KPiAgDQo+IC0JaGlkX2lucHV0X3JlcG9ydCh1aGlkLT5oaWQsIEhJ
RF9JTlBVVF9SRVBPUlQsIGV2LT51LmlucHV0Mi5kYXRhLA0KPiAtCQkJIG1pbl90KHNpemVfdCwg
ZXYtPnUuaW5wdXQyLnNpemUsIFVISURfREFUQV9NQVgpLCAwKTsNCj4gKwloaWRfc2FmZV9pbnB1
dF9yZXBvcnQodWhpZC0+aGlkLCBISURfSU5QVVRfUkVQT1JULCBldi0+dS5pbnB1dDIuZGF0YSwg
VUhJRF9EQVRBX01BWCwNCj4gKwkJCSAgICAgIG1pbl90KHNpemVfdCwgZXYtPnUuaW5wdXQyLnNp
emUsIFVISURfREFUQV9NQVgpLCAwKTsNCj4gIA0KPiAgCXJldHVybiAwOw0KPiAgfQ0KPiANCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2Ny
aWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
