Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2F1AC481B
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 08:09:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 052E54595F
	for <lists+greybus-dev@lfdr.de>; Tue, 27 May 2025 06:09:56 +0000 (UTC)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	by lists.linaro.org (Postfix) with ESMTPS id 0CB0044491
	for <greybus-dev@lists.linaro.org>; Tue, 27 May 2025 06:09:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=BWa0YSLn;
	spf=pass (lists.linaro.org: domain of gregkh@linuxfoundation.org designates 147.75.193.91 as permitted sender) smtp.mailfrom=gregkh@linuxfoundation.org;
	dmarc=pass (policy=none) header.from=linuxfoundation.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B6D17A4DDD3;
	Tue, 27 May 2025 06:09:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC49CC4CEEA;
	Tue, 27 May 2025 06:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748326192;
	bh=qOXDVrUaiO2l8wZl4UUJ7YeBOkFqYNSPmNtXngQ0I0U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BWa0YSLnW7rqZQo1X6vmYMR9QzV3ZkmpIQRnOulB6lbtvOvbQjjfKPLIt3VHSLFTe
	 5XlzgQAwXbKqi1+ZdCPTHqTw4+LLEO9ZdedWn2/ojKLopt7W7rYwZYmAx880/7gH6K
	 HtV78t3jj8PJo8HVbahmsXe4xGPjVs+JUgs30MCo=
Date: Tue, 27 May 2025 08:09:48 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: clingfei <clf700383@gmail.com>
Message-ID: <2025052727-goliath-freedom-102d@gregkh>
References: <20250527050635.946553-1-clf700383@gmail.com>
 <2025052700-ungodly-vitality-d86d@gregkh>
 <CADPKJ-64_fod0ObZsg_prtB4u+ZA6shZ6AnXqn4vxK1NGxHgkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADPKJ-64_fod0ObZsg_prtB4u+ZA6shZ6AnXqn4vxK1NGxHgkQ@mail.gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [0.50 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:147.75.193.91];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:147.75.192.0/21, country:US];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	DWL_DNSWL_BLOCKED(0.00)[linuxfoundation.org:dkim];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[linuxfoundation.org:+]
X-Rspamd-Queue-Id: 0CB0044491
X-Spamd-Bar: /
Message-ID-Hash: DYECAHRMKDQCWAD56USMHDX3MTQG4RQO
X-Message-ID-Hash: DYECAHRMKDQCWAD56USMHDX3MTQG4RQO
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, keescook@chromium.org, johan@kernel.org, vireshk@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] greybus: Avoid fake flexible array for response data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DYECAHRMKDQCWAD56USMHDX3MTQG4RQO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gVHVlLCBNYXkgMjcsIDIwMjUgYXQgMDE6NTA6NDJQTSArMDgwMCwgY2xpbmdmZWkgd3JvdGU6
DQo+IEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiDkuo4yMDI15bm0NeaciDI3
5pel5ZGo5LqMIDEzOjE15YaZ6YGT77yaDQo+ID4NCj4gPiBPbiBUdWUsIE1heSAyNywgMjAyNSBh
dCAwMTowNjozNVBNICswODAwLCBjbGluZ2ZlaSB3cm90ZToNCj4gPiA+IFdlIHdhbnQgdG8gZ2V0
IHJpZCBvZiB6ZXJvIHNpemUgYXJyYXlzIGFuZCB1c2UgZmxleGlibGUgYXJyYXlzIGluc3RlYWQu
DQo+ID4gPiBIb3dldmVyLCBpbiB0aGlzIGNhc2UgdGhlIHN0cnVjdCBpcyBqdXN0IG9uZSBmbGV4
aWJsZSBhcnJheSBvZiB1OCB3aGljaA0KPiA+ID4gYWRkcyBubyB2YWx1ZS4gSnVzdCB1c2UgYSBw
b2ludGVyIGluc3RlYWQuDQo+ID4NCj4gPiBOb3QgdHJ1ZSBhdCBhbGwsIHNvcnJ5LCBpdCBkb2Vz
ICJhZGQgdmFsdWUiLiAgUGxlYXNlIHJlYWQgdGhlIGdyZXlidXMNCj4gPiBzcGVjaWZpY2F0aW9u
IGlmIHlvdSBoYXZlIHF1ZXN0aW9ucyBhYm91dCB0aGlzLg0KPiA+DQo+ID4gPg0KPiA+ID4gdjE6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI1MDUyNjIwMzIuNTA3QUQ4RTBEQ0BrZWVz
Y29vay8NCj4gPg0KPiA+IFBsZWFzZSByZWFkIG91ciBkb2N1bWVudGF0aW9uIGZvciBob3cgdG8g
cHJvcGVybHkgdmVyc2lvbiBrZXJuZWwgcGF0Y2hlcw0KPiANCj4gU29ycnksIEkgd2lsbCByZWFk
IGl0Lg0KPiA+DQo+ID4gPg0KPiA+ID4gU2lnbmVkLW9mZi1ieTogY2xpbmdmZWkgPGNsZjcwMDM4
M0BnbWFpbC5jb20+DQo+ID4NCj4gPiBBbHNvLCB3ZSBuZWVkIGEgImZ1bGwibmFtZSwgbm90IGFu
IGVtYWlsIGFsaWFzLg0KPiA+DQo+ID4gPiAtLS0NCj4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9pMmMuYyAgICAgICAgICAgICB8IDEyICsrKystLS0tLS0tLQ0KPiA+ID4gIGluY2x1ZGUv
bGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oIHwgIDMgLS0tDQo+ID4gPiAgMiBmaWxl
cyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygtKQ0KPiA+ID4NCj4gPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9pMmMuYyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2kyYy5jDQo+ID4gPiBpbmRleCAxNGYxZmY2ZDQ0OGMuLmIyNDhkNjcxN2I3
MSAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2kyYy5jDQo+ID4g
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9pMmMuYw0KPiA+ID4gQEAgLTE0NCwxNSAr
MTQ0LDE0IEBAIGdiX2kyY19vcGVyYXRpb25fY3JlYXRlKHN0cnVjdCBnYl9jb25uZWN0aW9uICpj
b25uZWN0aW9uLA0KPiA+ID4gIH0NCj4gPiA+DQo+ID4gPiAgc3RhdGljIHZvaWQgZ2JfaTJjX2Rl
Y29kZV9yZXNwb25zZShzdHJ1Y3QgaTJjX21zZyAqbXNncywgdTMyIG1zZ19jb3VudCwNCj4gPiA+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBnYl9pMmNfdHJhbnNmZXJf
cmVzcG9uc2UgKnJlc3BvbnNlKQ0KPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdTggKmRhdGEpDQo+ID4gPiAgew0KPiA+ID4gICAgICAgc3RydWN0IGkyY19tc2cgKm1zZyA9
IG1zZ3M7DQo+ID4gPiAtICAgICB1OCAqZGF0YTsNCj4gPiA+ICAgICAgIHUzMiBpOw0KPiA+ID4N
Cj4gPiA+IC0gICAgIGlmICghcmVzcG9uc2UpDQo+ID4gPiArICAgICBpZiAoIWRhdGEpDQo+ID4g
PiAgICAgICAgICAgICAgIHJldHVybjsNCj4gPiA+IC0gICAgIGRhdGEgPSByZXNwb25zZS0+ZGF0
YTsNCj4gPiA+ICsNCj4gPiA+ICAgICAgIGZvciAoaSA9IDA7IGkgPCBtc2dfY291bnQ7IGkrKykg
ew0KPiA+ID4gICAgICAgICAgICAgICBpZiAobXNnLT5mbGFncyAmIEkyQ19NX1JEKSB7DQo+ID4g
PiAgICAgICAgICAgICAgICAgICAgICAgbWVtY3B5KG1zZy0+YnVmLCBkYXRhLCBtc2ctPmxlbik7
DQo+ID4gPiBAQCAtMTg4LDEwICsxODcsNyBAQCBzdGF0aWMgaW50IGdiX2kyY190cmFuc2Zlcl9v
cGVyYXRpb24oc3RydWN0IGdiX2kyY19kZXZpY2UgKmdiX2kyY19kZXYsDQo+ID4gPg0KPiA+ID4g
ICAgICAgcmV0ID0gZ2Jfb3BlcmF0aW9uX3JlcXVlc3Rfc2VuZF9zeW5jKG9wZXJhdGlvbik7DQo+
ID4gPiAgICAgICBpZiAoIXJldCkgew0KPiA+ID4gLSAgICAgICAgICAgICBzdHJ1Y3QgZ2JfaTJj
X3RyYW5zZmVyX3Jlc3BvbnNlICpyZXNwb25zZTsNCj4gPiA+IC0NCj4gPiA+IC0gICAgICAgICAg
ICAgcmVzcG9uc2UgPSBvcGVyYXRpb24tPnJlc3BvbnNlLT5wYXlsb2FkOw0KPiA+ID4gLSAgICAg
ICAgICAgICBnYl9pMmNfZGVjb2RlX3Jlc3BvbnNlKG1zZ3MsIG1zZ19jb3VudCwgcmVzcG9uc2Up
Ow0KPiA+ID4gKyAgICAgICAgICAgICBnYl9pMmNfZGVjb2RlX3Jlc3BvbnNlKG1zZ3MsIG1zZ19j
b3VudCwgb3BlcmF0aW9uLT5yZXNwb25zZS0+cGF5bG9hZCk7DQo+ID4gPiAgICAgICAgICAgICAg
IHJldCA9IG1zZ19jb3VudDsNCj4gPiA+ICAgICAgIH0gZWxzZSBpZiAoIWdiX2kyY19leHBlY3Rl
ZF90cmFuc2Zlcl9lcnJvcihyZXQpKSB7DQo+ID4gPiAgICAgICAgICAgICAgIGRldl9lcnIoZGV2
LCAidHJhbnNmZXIgb3BlcmF0aW9uIGZhaWxlZCAoJWQpXG4iLCByZXQpOw0KPiA+ID4gZGlmZiAt
LWdpdCBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oIGIvaW5jbHVk
ZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmgNCj4gPiA+IGluZGV4IDgyMDEzNGIw
MTA1Yy4uNmEzNWM3OGI5NjdiIDEwMDY0NA0KPiA+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9ncmV5
YnVzL2dyZXlidXNfcHJvdG9jb2xzLmgNCj4gPiA+ICsrKyBiL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9ncmV5YnVzX3Byb3RvY29scy5oDQo+ID4gPiBAQCAtNjc4LDkgKzY3OCw2IEBAIHN0cnVjdCBn
Yl9pMmNfdHJhbnNmZXJfcmVxdWVzdCB7DQo+ID4gPiAgICAgICBfX2xlMTYgICAgICAgICAgICAg
ICAgICAgICAgICAgIG9wX2NvdW50Ow0KPiA+ID4gICAgICAgc3RydWN0IGdiX2kyY190cmFuc2Zl
cl9vcCAgICAgICBvcHNbXTsgICAgICAgICAgLyogb3BfY291bnQgb2YgdGhlc2UgKi8NCj4gPiA+
ICB9IF9fcGFja2VkOw0KPiA+ID4gLXN0cnVjdCBnYl9pMmNfdHJhbnNmZXJfcmVzcG9uc2Ugew0K
PiA+ID4gLSAgICAgX191OCAgICAgICAgICAgICAgICAgICAgICAgICAgICBkYXRhWzBdOyAgICAg
ICAgLyogaW5ib3VuZCBkYXRhICovDQo+ID4gPiAtfSBfX3BhY2tlZDsNCj4gPg0KPiA+IEFzIEkg
c2FpZCBiZWZvcmUsIHlvdSBjYW4ndCBqdXN0IGRlbGV0ZSBzdHJ1Y3R1cmVzIHRoYXQgYXJlIGV4
cG9ydGVkIHRvDQo+ID4gdXNlcnNwYWNlIHdpdGhvdXQgYnJlYWtpbmcgdGhpbmdzLiAgV2h5IGlz
IHRoaXMgY2hhbmdlIGFjY2VwdGFibGUgdG8gZG8NCj4gPiB0aGF0Pw0KPiA+DQo+ID4gQW5kIGhv
dyB3YXMgYW55IG9mIHRoaXMgdGVzdGVkPw0KPiA+DQo+ID4gZ3JlZyBrLWgNCj4gDQo+IENvdWxk
IHlvdSBwbGVhc2UgZ2l2ZSBzb21lIGV4YW1wbGVzIHRoYXQgd2lsbCBiZSBicm9rZW4gYnkgdGhp
cyBjaGFuZ2U/DQoNCkhhdmUgeW91IHNlYXJjaGVkIGFsbCB1c2Vyc3BhY2UgdG9vbHMgdG8gdmVy
aWZ5IHRoYXQgdGhleSBkbyBub3QgdXNlDQp0aGlzIHN0cnVjdHVyZSBkZWZpbml0aW9uPyAgWW91
IGFyZSByZW1vdmluZyBhIHVzZXIva2VybmVsIGFwaSBoZXJlLA0Kc29tZXRoaW5nIHRoYXQgd2Ug
ZG8gbm90IGRvIHdpdGhvdXQgcmVzZWFyY2hpbmcgdGhhdCBubyBleGlzdGluZyB1c2VyIGluDQp0
aGUgd29ybGQgd2lsbCBub3QgYnJlYWsuDQoNCj4gQW5kIEkgYW0gbm90IHN1cmUgaG93IHRoaXMg
c2hvdWxkIGJlIHRlc3RlZC4gSXQgc2VlbXMgdGhhdCBpdCB3aWxsIG5vdA0KPiBoYXZlIGFueSBu
ZWdhdGl2ZSBpbXBhY3Qgb24gZnVuY3Rpb25hbGl0eS4NCg0KSSB3b3VsZCBzdHJvbmdseSByZWNv
bW1lbmQsIHRoYXQgaWYgeW91IGNhbiBub3QgdGVzdCB0aGlzLCB0aGF0IHlvdSBub3QNCm1ha2Ug
dGhlIGNoYW5nZSA6KQ0KDQpnb29kIGx1Y2shDQoNCmdyZWcgay1oDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
