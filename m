Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kLmqC7Hg5WmlowEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 10:15:45 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D9A4280A5
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 10:15:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC008400F6
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 08:15:43 +0000 (UTC)
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	by lists.linaro.org (Postfix) with ESMTPS id C55123F719
	for <greybus-dev@lists.linaro.org>; Sun, 19 Apr 2026 16:26:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=icenowy.me header.s=zmail2 header.b=nsdRXPDA;
	dmarc=pass (policy=none) header.from=icenowy.me;
	spf=pass (lists.linaro.org: domain of uwu@icenowy.me designates 136.143.188.12 as permitted sender) smtp.mailfrom=uwu@icenowy.me;
	arc=pass ("zohomail.com:s=zohoarc:i=1")
ARC-Seal: i=1; a=rsa-sha256; t=1776615992; cv=none;
	d=zohomail.com; s=zohoarc;
	b=kQSnz1iBfr3zPc9JyMtd71bSN55fRDtkz8V+izPOrszcIFWW8eiE2GQ805NYkzw77JS5KVENc6lXWNqZOe+/sKNLz69fHuCgfAF9oCtd1e5aU6VeHPwPIef8/XgyMuaMjGAkUPZoJNTH9pAZNy3PCt9oSc0vBJAAF2REgRnjEu4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc;
	t=1776615992; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=XDxRzUYghQyLSOtVSFJCCp821NYg75PtJOz/TeevvgQ=;
	b=F+vTlr3zGS9R9vpQsoUo6w/jtWCGwtwsWifitwBJRmWj5Oc0ZJqTvR+Qoq63JAbiZzaKyzNxjDWmicFYMzfQHkC/DurWfG2e41wz5IDi9JM0qfH7bNq2MXicFJ5hGdhAwEKiTYXPVCcLFzOZxN2YXPJqlTA/9X+LVqyuTqv5uT4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776615992;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=XDxRzUYghQyLSOtVSFJCCp821NYg75PtJOz/TeevvgQ=;
	b=nsdRXPDAm9LAwbVoZpAUCLGasQ0RZhdslKj90S5qOE/YGg6tTQNGWI++ab7vFRhm
	tPo+C6x4ZEwqbQgprBNDC0VpMnZPpBVq519MrRKAXD6UrRI9aeEjP6c8p4sHI0me7oj
	+vk8EP4DaZcvoR9xvAB77dl7f+W2Q8fdGtIrAED43YQ8fZWfGYPKZ9CSX/3D4+L/m8I
	FSskX4UJkqr4+vW0c++dI1oahwaQ7tafT9MGLcOpXrj1JlRj7GDhF5w9z0qdiuGmiPP
	iI5D7oJdTY/7n1AwonQDyHr22e2tyhDVq198BodPjidz+iYfWris+qlVcGt+fn+Zg5O
	imvgwHnlNg==
Received: by mx.zohomail.com with SMTPS id 1776615989353789.8106081725186;
	Sun, 19 Apr 2026 09:26:29 -0700 (PDT)
Message-ID: <938e8afadcbf2d7b9f0397e24926224985d9c385.camel@icenowy.me>
From: Icenowy Zheng <uwu@icenowy.me>
To: Benjamin Tissoires <bentiss@kernel.org>, Jiri Kosina <jikos@kernel.org>,
  Filipe =?ISO-8859-1?Q?La=EDns?=	 <lains@riseup.net>, Bastien Nocera
 <hadess@hadess.net>, Ping Cheng	 <ping.cheng@wacom.com>, Jason Gerecke
 <jason.gerecke@wacom.com>, Viresh Kumar	 <vireshk@kernel.org>, Johan Hovold
 <johan@kernel.org>, Alex Elder	 <elder@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Lee Jones	 <lee@kernel.org>
Date: Mon, 20 Apr 2026 00:26:21 +0800
In-Reply-To: <20260416-wip-fix-core-v2-1-be92570e5627@kernel.org>
References: <20260416-wip-fix-core-v2-0-be92570e5627@kernel.org>
	 <20260416-wip-fix-core-v2-1-be92570e5627@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spamd-Bar: -----
X-MailFrom: uwu@icenowy.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DKS53AIWXCKKLLBKLZ5VTPHWI73UAEVH
X-Message-ID-Hash: DKS53AIWXCKKLLBKLZ5VTPHWI73UAEVH
X-Mailman-Approved-At: Mon, 20 Apr 2026 08:15:37 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/4] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DKS53AIWXCKKLLBKLZ5VTPHWI73UAEVH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [1.69 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:zohomail.com:reject}];
	R_DKIM_REJECT(1.00)[icenowy.me:s=zmail2];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[icenowy.me : SPF not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[icenowy.me:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[uwu@icenowy.me,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[greybus-dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: D0D9A4280A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

5ZyoIDIwMjYtMDQtMTblm5vnmoQgMTY6NDggKzAyMDDvvIxCZW5qYW1pbiBUaXNzb2lyZXPlhpnp
gZPvvJoNCj4gY29tbWl0IDBhM2ZlOTcyYTdjYiAoIkhJRDogY29yZTogTWl0aWdhdGUgcG90ZW50
aWFsIE9PQiBieSByZW1vdmluZw0KPiBib2d1cyBtZW1zZXQoKSIpIGVuZm9yY2VkIHRoZSBwcm92
aWRlZCBkYXRhIHRvIGJlIGF0IGxlYXN0IHRoZSBzaXplDQo+IG9mDQo+IHRoZSBkZWNsYXJlZCBi
dWZmZXIgaW4gdGhlIHJlcG9ydCBkZXNjcmlwdG9yIHRvIHByZXZlbnQgYSBidWZmZXINCj4gb3Zl
cmZsb3cuIEhvd2V2ZXIsIHdlIGNhbiB0cnkgdG8gYmUgc21hcnRlciBieSBwcm92aWRpbmcgYm90
aCB0aGUNCj4gYnVmZmVyDQo+IHNpemUgYW5kIHRoZSBkYXRhIHNpemUsIG1lYW5pbmcgdGhhdCBo
aWRfcmVwb3J0X3Jhd19ldmVudCgpIGNhbiBtYWtlDQo+IGJldHRlciBkZWNpc2lvbiB3aGV0aGVy
IHdlIHNob3VsZCBwbGFpbmluZyByZWplY3QgdGhlIGJ1ZmZlciAoYnVmZmVyDQo+IG92ZXJmbG93
IGF0dGVtcHQpIG9yIGlmIHdlIGNhbiBzYWZlbHkgbWVtc2V0IGl0IHRvIDAgYW5kIHBhc3MgaXQg
dG8NCj4gdGhlDQo+IHJlc3Qgb2YgdGhlIHN0YWNrLg0KPiANCj4gRml4ZXM6IDBhM2ZlOTcyYTdj
YiAoIkhJRDogY29yZTogTWl0aWdhdGUgcG90ZW50aWFsIE9PQiBieSByZW1vdmluZw0KPiBib2d1
cyBtZW1zZXQoKSIpDQo+IENjOiBzdGFibGVAdmdlci5rZXJuZWwub3JnDQo+IFNpZ25lZC1vZmYt
Ynk6IEJlbmphbWluIFRpc3NvaXJlcyA8YmVudGlzc0BrZXJuZWwub3JnPg0KPiAtLS0NCj4gwqBk
cml2ZXJzL2hpZC9icGYvaGlkX2JwZl9kaXNwYXRjaC5jIHzCoCA2ICsrKystLQ0KPiDCoGRyaXZl
cnMvaGlkL2hpZC1jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCA0MiArKysrKysrKysr
KysrKysrKysrKysrKysrLS0tDQo+IC0tLS0tLS0tLS0NCj4gwqBkcml2ZXJzL2hpZC9oaWQtZ2Zy
bS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0ICsrLS0NCj4gwqBkcml2ZXJzL2hpZC9o
aWQtbG9naXRlY2gtaGlkcHAuY8KgwqAgfMKgIDIgKy0NCj4gwqBkcml2ZXJzL2hpZC9oaWQtbXVs
dGl0b3VjaC5jwqDCoMKgwqDCoMKgIHzCoCAyICstDQo+IMKgZHJpdmVycy9oaWQvaGlkLXByaW1h
eC5jwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDIgKy0NCj4gwqBkcml2ZXJzL2hpZC9oaWQtdml2
YWxkaS1jb21tb24uY8KgwqAgfMKgIDIgKy0NCj4gwqBkcml2ZXJzL2hpZC93YWNvbV9zeXMuY8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDYgKysrLS0tDQo+IMKgZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvaGlkLmPCoMKgwqDCoMKgIHzCoCAyICstDQo+IMKgaW5jbHVkZS9saW51eC9oaWQuaMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgNCArKy0tDQo+IMKgaW5jbHVkZS9saW51
eC9oaWRfYnBmLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMTQgKysrKysrKystLS0tLQ0KPiDC
oDExIGZpbGVzIGNoYW5nZWQsIDUzIGluc2VydGlvbnMoKyksIDMzIGRlbGV0aW9ucygtKQ0KDQo9
PT09PT09PT09PT0gODwgPT09PT09PT09PT09PT09PT09PQ0KDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYw0KPiBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hp
ZC5jDQo+IGluZGV4IDFmNThjOTA3YzAzNi4uMzdlODYwNWM2NzY3IDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYw0KPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9oaWQuYw0KPiBAQCAtMjAxLDcgKzIwMSw3IEBAIHN0YXRpYyB2b2lkIGdiX2hpZF9pbml0
X3JlcG9ydChzdHJ1Y3QgZ2JfaGlkDQo+ICpnaGlkLCBzdHJ1Y3QgaGlkX3JlcG9ydCAqcmVwb3J0
KQ0KPiDCoAkgKiB3ZSBqdXN0IG5lZWQgdG8gc2V0dXAgdGhlIGlucHV0IGZpZWxkcywgc28gdXNp
bmcNCj4gwqAJICogaGlkX3JlcG9ydF9yYXdfZXZlbnQgaXMgc2FmZS4NCj4gwqAJICovDQo+IC0J
aGlkX3JlcG9ydF9yYXdfZXZlbnQoZ2hpZC0+aGlkLCByZXBvcnQtPnR5cGUsIGdoaWQtPmluYnVm
LA0KPiBzaXplLCAxKTsNCj4gKwloaWRfcmVwb3J0X3Jhd19ldmVudChnaGlkLT5oaWQsIHJlcG9y
dC0+dHlwZSwgZ2hpZC0+aW5idWYsDQo+IGdoaWItPmJ1ZnNpemUsIHNpemUsIDEpOw0KDQpPb3Bz
LCAiZ2hpZCIgaXMgbWlzc3BlbGxlZCBoZXJlLi4uDQoNCkZvdW5kIHRoaXMgd2hlbiBidWlsZGlu
ZyBzb21lIGdhaW50IGtlcm5lbCB3aXRoIHRoaXMgcGF0Y2hzZXQuDQoNClRoYW5rcywNCkljZW5v
d3kNCg0KPiDCoH0NCj4gwqANCj4gwqBzdGF0aWMgdm9pZCBnYl9oaWRfaW5pdF9yZXBvcnRzKHN0
cnVjdCBnYl9oaWQgKmdoaWQpDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
