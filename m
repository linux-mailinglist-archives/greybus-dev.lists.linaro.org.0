Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBb7MoXd5Wk1owEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 10:02:13 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 585EA427F4B
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 10:02:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61C18404C7
	for <lists+greybus-dev@lfdr.de>; Mon, 20 Apr 2026 08:02:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by lists.linaro.org (Postfix) with ESMTPS id 34051400F6
	for <greybus-dev@lists.linaro.org>; Mon, 20 Apr 2026 08:02:02 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=J9ORtTHc;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of bentiss@kernel.org designates 172.234.252.31 as permitted sender) smtp.mailfrom=bentiss@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83D6740922;
	Mon, 20 Apr 2026 08:02:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AEABC19425;
	Mon, 20 Apr 2026 08:01:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776672121;
	bh=iDBvIru/tesedpbSi6rP/YlULqPhxZRplQYFZ9Je2fU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J9ORtTHcmeeW1ldGdfVssTVlaTvgTh5Tpv2wS1moFGJR8ett0fzPWyx6pZf9OLYfu
	 hANmhY0gzaxIZwQZndP7wjNlo0Z+If63EMCGOKPdX2O5XLaAcYs5CBlxX3+whFIROB
	 5Z2mNX4TzPNE/7R45AblYs17ben9spn0RwztRrQDapS7pkiQg91FEaUtbyKKbxBjj/
	 z4mLziUwTCuBoPHVZwd7+HHEtUv8NXd3s1ei5x9i4F3V3vBD/Mn89a92t63fOUonve
	 TZ6ryAlrpDK1rcTZ2+zbchpxnANLS8Id88GlneU/FHK3nMxDDIYjnEhi7Lbbzh8U7P
	 zvCr73X5+v6Ow==
Date: Mon, 20 Apr 2026 10:01:55 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Message-ID: <aeXdKFJe8JyatqLR@beelink>
References: <20260416-wip-fix-core-v2-0-be92570e5627@kernel.org>
 <20260416-wip-fix-core-v2-1-be92570e5627@kernel.org>
 <938e8afadcbf2d7b9f0397e24926224985d9c385.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <938e8afadcbf2d7b9f0397e24926224985d9c385.camel@icenowy.me>
X-Spamd-Bar: ---
Message-ID-Hash: QFRSBM2R4DI7KVOOFA7D22HEZ4RMCTAN
X-Message-ID-Hash: QFRSBM2R4DI7KVOOFA7D22HEZ4RMCTAN
X-MailFrom: bentiss@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Kosina <jikos@kernel.org>, Filipe =?utf-8?B?TGHDrW5z?= <lains@riseup.net>, Bastien Nocera <hadess@hadess.net>, Ping Cheng <ping.cheng@wacom.com>, Jason Gerecke <jason.gerecke@wacom.com>, Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Lee Jones <lee@kernel.org>, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-usb@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 1/4] HID: pass the buffer size to hid_report_raw_event
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QFRSBM2R4DI7KVOOFA7D22HEZ4RMCTAN/>
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
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[bentiss@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 585EA427F4B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gQXByIDIwIDIwMjYsIEljZW5vd3kgWmhlbmcgd3JvdGU6DQo+IOWcqCAyMDI2LTA0LTE25Zub
55qEIDE2OjQ4ICswMjAw77yMQmVuamFtaW4gVGlzc29pcmVz5YaZ6YGT77yaDQo+ID4gY29tbWl0
IDBhM2ZlOTcyYTdjYiAoIkhJRDogY29yZTogTWl0aWdhdGUgcG90ZW50aWFsIE9PQiBieSByZW1v
dmluZw0KPiA+IGJvZ3VzIG1lbXNldCgpIikgZW5mb3JjZWQgdGhlIHByb3ZpZGVkIGRhdGEgdG8g
YmUgYXQgbGVhc3QgdGhlIHNpemUNCj4gPiBvZg0KPiA+IHRoZSBkZWNsYXJlZCBidWZmZXIgaW4g
dGhlIHJlcG9ydCBkZXNjcmlwdG9yIHRvIHByZXZlbnQgYSBidWZmZXINCj4gPiBvdmVyZmxvdy4g
SG93ZXZlciwgd2UgY2FuIHRyeSB0byBiZSBzbWFydGVyIGJ5IHByb3ZpZGluZyBib3RoIHRoZQ0K
PiA+IGJ1ZmZlcg0KPiA+IHNpemUgYW5kIHRoZSBkYXRhIHNpemUsIG1lYW5pbmcgdGhhdCBoaWRf
cmVwb3J0X3Jhd19ldmVudCgpIGNhbiBtYWtlDQo+ID4gYmV0dGVyIGRlY2lzaW9uIHdoZXRoZXIg
d2Ugc2hvdWxkIHBsYWluaW5nIHJlamVjdCB0aGUgYnVmZmVyIChidWZmZXINCj4gPiBvdmVyZmxv
dyBhdHRlbXB0KSBvciBpZiB3ZSBjYW4gc2FmZWx5IG1lbXNldCBpdCB0byAwIGFuZCBwYXNzIGl0
IHRvDQo+ID4gdGhlDQo+ID4gcmVzdCBvZiB0aGUgc3RhY2suDQo+ID4gDQo+ID4gRml4ZXM6IDBh
M2ZlOTcyYTdjYiAoIkhJRDogY29yZTogTWl0aWdhdGUgcG90ZW50aWFsIE9PQiBieSByZW1vdmlu
Zw0KPiA+IGJvZ3VzIG1lbXNldCgpIikNCj4gPiBDYzogc3RhYmxlQHZnZXIua2VybmVsLm9yZw0K
PiA+IFNpZ25lZC1vZmYtYnk6IEJlbmphbWluIFRpc3NvaXJlcyA8YmVudGlzc0BrZXJuZWwub3Jn
Pg0KPiA+IC0tLQ0KPiA+IMKgZHJpdmVycy9oaWQvYnBmL2hpZF9icGZfZGlzcGF0Y2guYyB8wqAg
NiArKysrLS0NCj4gPiDCoGRyaXZlcnMvaGlkL2hpZC1jb3JlLmPCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCA0MiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tDQo+ID4gLS0tLS0tLS0tLQ0K
PiA+IMKgZHJpdmVycy9oaWQvaGlkLWdmcm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
NCArKy0tDQo+ID4gwqBkcml2ZXJzL2hpZC9oaWQtbG9naXRlY2gtaGlkcHAuY8KgwqAgfMKgIDIg
Ky0NCj4gPiDCoGRyaXZlcnMvaGlkL2hpZC1tdWx0aXRvdWNoLmPCoMKgwqDCoMKgwqAgfMKgIDIg
Ky0NCj4gPiDCoGRyaXZlcnMvaGlkL2hpZC1wcmltYXguY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHzC
oCAyICstDQo+ID4gwqBkcml2ZXJzL2hpZC9oaWQtdml2YWxkaS1jb21tb24uY8KgwqAgfMKgIDIg
Ky0NCj4gPiDCoGRyaXZlcnMvaGlkL3dhY29tX3N5cy5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgNiArKystLS0NCj4gPiDCoGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jwqDCoMKgwqDC
oCB8wqAgMiArLQ0KPiA+IMKgaW5jbHVkZS9saW51eC9oaWQuaMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgNCArKy0tDQo+ID4gwqBpbmNsdWRlL2xpbnV4L2hpZF9icGYuaMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgfCAxNCArKysrKysrKy0tLS0tDQo+ID4gwqAxMSBmaWxlcyBjaGFu
Z2VkLCA1MyBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkNCj4gDQo+ID09PT09PT09PT09
PSA4PCA9PT09PT09PT09PT09PT09PT09DQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9oaWQuYw0KPiA+IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMN
Cj4gPiBpbmRleCAxZjU4YzkwN2MwMzYuLjM3ZTg2MDVjNjc2NyAxMDA2NDQNCj4gPiAtLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYw0KPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jDQo+ID4gQEAgLTIwMSw3ICsyMDEsNyBAQCBzdGF0aWMgdm9pZCBnYl9oaWRf
aW5pdF9yZXBvcnQoc3RydWN0IGdiX2hpZA0KPiA+ICpnaGlkLCBzdHJ1Y3QgaGlkX3JlcG9ydCAq
cmVwb3J0KQ0KPiA+IMKgCSAqIHdlIGp1c3QgbmVlZCB0byBzZXR1cCB0aGUgaW5wdXQgZmllbGRz
LCBzbyB1c2luZw0KPiA+IMKgCSAqIGhpZF9yZXBvcnRfcmF3X2V2ZW50IGlzIHNhZmUuDQo+ID4g
wqAJICovDQo+ID4gLQloaWRfcmVwb3J0X3Jhd19ldmVudChnaGlkLT5oaWQsIHJlcG9ydC0+dHlw
ZSwgZ2hpZC0+aW5idWYsDQo+ID4gc2l6ZSwgMSk7DQo+ID4gKwloaWRfcmVwb3J0X3Jhd19ldmVu
dChnaGlkLT5oaWQsIHJlcG9ydC0+dHlwZSwgZ2hpZC0+aW5idWYsDQo+ID4gZ2hpYi0+YnVmc2l6
ZSwgc2l6ZSwgMSk7DQo+IA0KPiBPb3BzLCAiZ2hpZCIgaXMgbWlzc3BlbGxlZCBoZXJlLi4uDQoN
CkRhbW4sIHlvdSdyZSBjb3JyZWN0LiBTb3JyeS4NCg0KSmlyaSwgZG8geW91IHdhbnQgbWUgdG8g
c2VuZCB2Mz8gT3IgY2FuIHlvdSBmaXggaXQgd2hpbGUgYXBwbHlpbmc/DQoNCj4gDQo+IEZvdW5k
IHRoaXMgd2hlbiBidWlsZGluZyBzb21lIGdhaW50IGtlcm5lbCB3aXRoIHRoaXMgcGF0Y2hzZXQu
DQoNClRoYW5rcyBhIGxvdCBmb3Igc3BvdHRpbmcgdGhpcy4NCg0KQ2hlZXJzLA0KQmVuamFtaW4N
Cg0KPiANCj4gVGhhbmtzLA0KPiBJY2Vub3d5DQo+IA0KPiA+IMKgfQ0KPiA+IMKgDQo+ID4gwqBz
dGF0aWMgdm9pZCBnYl9oaWRfaW5pdF9yZXBvcnRzKHN0cnVjdCBnYl9oaWQgKmdoaWQpDQo+IA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJz
Y3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3Jn
Cg==
