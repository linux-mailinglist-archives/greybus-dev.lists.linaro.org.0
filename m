Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gM37KUaDuWlyIgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 17:37:26 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FB52AE208
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 17:37:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3BC8E3F762
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Mar 2026 16:37:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 7D1713F762
	for <greybus-dev@lists.linaro.org>; Tue, 17 Mar 2026 16:37:22 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=fJjnheIH;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0A661600AD;
	Tue, 17 Mar 2026 16:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA3A5C19424;
	Tue, 17 Mar 2026 16:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773765441;
	bh=QIsIQJqZiPz/uYXn49ib0riaHqg3EjW9MdevwPoZAlo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJjnheIHZ49UW3lwAkyWYV7ZyeVufZxgtW6cHEi5P44InYKR9pUn1WE37vqQewYuP
	 Mwi+VgEZUf1C3iBaQ7ptzygokmdWhuBmWf0YAJ4K45MuVqjXCcVJD0gX5YDDIHVHeL
	 Zu9HL9WrUyGSq9dsKe9hvFmPul5fbSNdnIqkbmTLlyBrEWqerdQWfksPl9kW1kPdds
	 +NK+JIwtXJm8e9mKXPZ4Bn9yBG8fjc/wWeso6+3HU/bZkgNpJDgamm50KP/mU+BJur
	 apDluFg/1rxRuXPP3xt1ZkQjvE/VwF9cqxE8oFM4wuExL0L7y/AOkTJZIBT0gB7BjM
	 +xKUhnHRM/9Cw==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w2XPz-000000008BE-1QDL;
	Tue, 17 Mar 2026 17:37:19 +0100
Date: Tue, 17 Mar 2026 17:37:19 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Message-ID: <abmDPyRLZIHJG_7N@hovoldconsulting.com>
References: <20260311212511.82563-1-damien.riegel@silabs.com>
 <20260311212511.82563-2-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260311212511.82563-2-damien.riegel@silabs.com>
X-Spamd-Bar: ----
Message-ID-Hash: 2ETOAXY5Y2YJUI3GGBXTCFHBOMZOR64W
X-Message-ID-Hash: 2ETOAXY5Y2YJUI3GGBXTCFHBOMZOR64W
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2 RESEND] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2ETOAXY5Y2YJUI3GGBXTCFHBOMZOR64W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Spamd-Result: default: False [2.09 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[kernel.org : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:-];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.851];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns,hovoldconsulting.com:mid,linaro.org:email,silabs.com:email]
X-Rspamd-Queue-Id: 63FB52AE208
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gV2VkLCBNYXIgMTEsIDIwMjYgYXQgMDU6MjU6MTFQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwg
d3JvdGU6DQo+IElmIGEgdXNlciB3cml0ZXMgdG8gdGhlIGNoYXJkZXYgYWZ0ZXIgZGlzY29ubmVj
dCBoYXMgYmVlbiBjYWxsZWQsIHRoZQ0KPiBrZXJuZWwgcGFuaWNzIHdpdGggdGhlIGZvbGxvd2lu
ZyB0cmFjZSAod2l0aA0KPiBDT05GSUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQo+IA0K
PiAgICAgWyAgIDgzLjgyODcyNl0gQlVHOiBrZXJuZWwgTlVMTCBwb2ludGVyIGRlcmVmZXJlbmNl
LCBhZGRyZXNzOiAwMDAwMDAwMDAwMDAwMjE4DQoNClBsZWFzZSB0cmltIHRoaXMgb29wcyB0b28u
IFRoZSB0aW1lc3RhbXBzIGFyZSBub3QgbmVlZGVkIGVpdGhlciAoaW4NCmVpdGhlciBwYXRjaCku
DQoNCj4gICAgIFsgICA4My44MzUyNTldIENhbGwgVHJhY2U6DQo+ICAgICBbICAgODMuODM1OTgz
XSAgPFRBU0s+DQo+ICAgICBbICAgODMuODM2MzYyXSAgZ2Jfb3BlcmF0aW9uX2NyZWF0ZV9jb21t
b24rMHg2MS8weDE4MA0KPiAgICAgWyAgIDgzLjgzNjY1M10gIGdiX29wZXJhdGlvbl9jcmVhdGVf
ZmxhZ3MrMHgyOC8weGEwDQo+ICAgICBbICAgODMuODM2OTEyXSAgZ2Jfb3BlcmF0aW9uX3N5bmNf
dGltZW91dCsweDZmLzB4MTAwDQo+ICAgICBbICAgODMuODM3MTYyXSAgcmF3X3dyaXRlKzB4N2Iv
MHhjNyBbZ2JfcmF3XQ0KPiAgICAgWyAgIDgzLjgzNzQ2MF0gIHZmc193cml0ZSsweGNmLzB4NDIw
DQoNCj4gRGlzY29ubmVjdCBjYWxscyBnYl9jb25uZWN0aW9uX2Rlc3Ryb3ksIHdoaWNoIGVuZHMg
dXAgZnJlZWluZyB0aGUNCj4gY29ubmVjdGlvbiBvYmplY3QuIFdoZW4gZ2Jfb3BlcmF0aW9uX3N5
bmMgaXMgY2FsbGVkIGluIHRoZSB3cml0ZSBmaWxlDQo+IG9wZXJhdGlvbnMsIGl0cyBnZXRzIGEg
ZnJlZWQgY29ubmVjdGlvbiBhcyBwYXJhbWV0ZXIgYW5kIHRoZSBrZXJuZWwNCj4gcGFuaWNzLg0K
PiANCj4gVGhlIGdiX2Nvbm5lY3Rpb25fZGVzdHJveSBjYW5ub3QgYmUgbW92ZWQgb3V0IG9mIHRo
ZSBkaXNjb25uZWN0DQo+IGZ1bmN0aW9uLCBhcyB0aGUgR3JleWJ1cyBzdWJzeXN0ZW0gZXhwZWN0
IGFsbCBjb25uZWN0aW9ucyBiZWxvbmdpbmcgdG8gYQ0KPiBidW5kbGUgdG8gYmUgZGVzdHJveWVk
IHdoZW4gZGlzY29ubmVjdCByZXR1cm5zLg0KPiANCj4gVG8gcHJldmVudCB0aGlzIGJ1ZywgdXNl
IGEgbG9jayB0byBzeW5jaHJvbml6ZSBhY2Nlc3MgYmV0d2VlbiB3cml0ZSBhbmQNCj4gZGlzY29u
bmVjdC4gVGhpcyBndWFyYW50ZWVzIHRoYXQgaW4gdGhlIHdyaXRlIGZ1bmN0aW9uIHJhdy0+Y29u
bmVjdGlvbg0KPiBpcyBlaXRoZXIgYSB2YWxpZCBvYmplY3Qgb3IgYSBOVUxMIHBvaW50ZXIuDQo+
IA0KPiBGaXhlczogZTgwNmM3ZmI4ZTliICgiZ3JleWJ1czogcmF3OiBhZGQgcmF3IGdyZXlidXMg
a2VybmVsIGRyaXZlciIpDQo+IFNpZ25lZC1vZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4u
cmllZ2VsQHNpbGFicy5jb20+DQo+IC0tLQ0KPiByZXNlbmQ6IGFkZGVkIGxpbnV4LXN0YWdpbmcg
YXMgQ2MsIHRoaXMgbGlzdCB3YXMgbm90IHBhcnQgb2YgdGhlIGZpcnN0DQo+IHN1Ym1pc3Npb24u
DQo+IA0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgfCAyNiArKysrKysrKysrKysr
KysrKysrKy0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDYgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3
LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYw0KPiBpbmRleCBiOTIyMTRmOTdlMy4u
YWE0MDg2ZmYzOTcgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5j
DQo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQo+IEBAIC0yMSw2ICsyMSw3
IEBAIHN0cnVjdCBnYl9yYXcgew0KPiAgCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4gIAlpbnQg
bGlzdF9kYXRhOw0KPiAgCXN0cnVjdCBtdXRleCBsaXN0X2xvY2s7DQo+ICsJc3RydWN0IG11dGV4
IHdyaXRlX2xvY2s7CS8qIFN5bmNocm9uaXplIGFjY2VzcyB0byBjb25uZWN0aW9uICovDQoNClRo
aXMgd29ya3MgaGVyZSwgYnV0IEkgdGhpbmsgaXQgd291bGQgYmUgYmV0dGVyIHRvIGdlbmVyYWxp
c2UgdGhpcyBzbw0KdGhhdCBpdCBjb3VsZCBiZSB1c2VkIGZvciBwb3NzaWJsZSBmdXR1cmUgaW9j
dGwoKSBhbmQgcmVhZCgpIHRvby4NCg0KRm9yIHRoYXQgeW91IGNhbiB1c2UgYW4gcncgc2VtYXBo
b3JlIGFuZCBuYW1lIGl0IHNvbWV0aGluZyBsaWtlDQpkaXNjb25uZWN0X2xvY2suIEFuZCBwb3Nz
aWJseSB1c2UgYSBkZWRpY2F0ZWQgYm9vbGVhbiBmbGFnIGZvciB0aGUNCmRpc2Nvbm5lY3RlZCBz
dGF0ZS4NCg0KPiAgCXN0cnVjdCBjZGV2IGNkZXY7DQo+ICAJc3RydWN0IGRldmljZSBkZXY7DQo+
ICB9Ow0KPiBAQCAtMTI0LDggKzEyNSw4IEBAIHN0YXRpYyBpbnQgZ2JfcmF3X3JlcXVlc3RfaGFu
ZGxlcihzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcCkNCj4gIA0KPiAgc3RhdGljIGludCBnYl9yYXdf
c2VuZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0IGNoYXIgX191c2VyICpkYXRh
KQ0KPiAgew0KPiAtCXN0cnVjdCBnYl9jb25uZWN0aW9uICpjb25uZWN0aW9uID0gcmF3LT5jb25u
ZWN0aW9uOw0KPiAgCXN0cnVjdCBnYl9yYXdfc2VuZF9yZXF1ZXN0ICpyZXF1ZXN0Ow0KPiArCXN0
cnVjdCBnYl9jb25uZWN0aW9uICpjb25uZWN0aW9uOw0KPiAgCWludCByZXR2YWw7DQo+ICANCj4g
IAlyZXF1ZXN0ID0ga21hbGxvYyhsZW4gKyBzaXplb2YoKnJlcXVlc3QpLCBHRlBfS0VSTkVMKTsN
Cj4gQEAgLTEzOSw5ICsxNDAsMTUgQEAgc3RhdGljIGludCBnYl9yYXdfc2VuZChzdHJ1Y3QgZ2Jf
cmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0IGNoYXIgX191c2VyICpkYXRhKQ0KPiAgDQo+ICAJcmVx
dWVzdC0+bGVuID0gY3B1X3RvX2xlMzIobGVuKTsNCj4gIA0KPiAtCXJldHZhbCA9IGdiX29wZXJh
dGlvbl9zeW5jKGNvbm5lY3Rpb24sIEdCX1JBV19UWVBFX1NFTkQsDQo+IC0JCQkJICAgcmVxdWVz
dCwgbGVuICsgc2l6ZW9mKCpyZXF1ZXN0KSwNCj4gLQkJCQkgICBOVUxMLCAwKTsNCj4gKwltdXRl
eF9sb2NrKCZyYXctPndyaXRlX2xvY2spOw0KDQpUaGVuIHRoaXMgd291bGQgYmUgYSByZWFkIGxv
Y2suDQoNCkFuZCBhcyBwYXJ0IG9mIHRoaXMgb3IgYSBmb2xsb3ctb24gcGF0Y2ggeW91IGFsc28g
dGFrZSBhIHJlYWQgbG9jayBpbg0KcmVhZCBzbyB0aGF0IHVzZXIgc3BhY2UgY2FuIGJlIG5vdGlm
aWVkIHRoYXQgdGhlIGRldmljZSBpcyBnb25lIHJhdGhlcg0KdGhhbiB0cnlpbmcgdG8gcmVhZCB0
aGUgZW1wdHkgYnVmZmVycyBpbmRlZmluaXRlbHkuDQoNCj4gKwlyZXR2YWwgPSAtRU5PREVWOw0K
DQpQbGVhc2UgY2hlY2sgcmF3LT5kaXNjb25uZWN0ZWQgKG9yICFyYXdfY29ubmVjdGVkKSBoZXJl
IGFuZCBiYWlsIG91dA0KYWZ0ZXIgc2V0dGluZyByZXR2YWwgaW5zdGVhZC4NCg0KPiArDQo+ICsJ
Y29ubmVjdGlvbiA9IHJhdy0+Y29ubmVjdGlvbjsNCj4gKwlpZiAoY29ubmVjdGlvbikNCj4gKwkJ
cmV0dmFsID0gZ2Jfb3BlcmF0aW9uX3N5bmMoY29ubmVjdGlvbiwgR0JfUkFXX1RZUEVfU0VORCwN
Cj4gKwkJCQkJICAgcmVxdWVzdCwgbGVuICsgc2l6ZW9mKCpyZXF1ZXN0KSwNCj4gKwkJCQkJICAg
TlVMTCwgMCk7DQo+ICsJbXV0ZXhfdW5sb2NrKCZyYXctPndyaXRlX2xvY2spOw0KPiAgDQo+ICAJ
a2ZyZWUocmVxdWVzdCk7DQo+ICAJcmV0dXJuIHJldHZhbDsNCg0KPiBAQCAtMjM4LDkgKzI0Niw5
IEBAIHN0YXRpYyB2b2lkIGdiX3Jhd19kaXNjb25uZWN0KHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRs
ZSkNCj4gIAlzdHJ1Y3QgcmF3X2RhdGEgKnRlbXA7DQo+ICANCj4gIAljZGV2X2RldmljZV9kZWwo
JnJhdy0+Y2RldiwgJnJhdy0+ZGV2KTsNCj4gLQlnYl9jb25uZWN0aW9uX2Rpc2FibGUoY29ubmVj
dGlvbik7DQo+ICAJaWRhX2ZyZWUoJm1pbm9ycywgTUlOT1IocmF3LT5kZXYuZGV2dCkpOw0KPiAt
CWdiX2Nvbm5lY3Rpb25fZGVzdHJveShjb25uZWN0aW9uKTsNCj4gKw0KPiArCWdiX2Nvbm5lY3Rp
b25fZGlzYWJsZShjb25uZWN0aW9uKTsNCj4gIA0KPiAgCW11dGV4X2xvY2soJnJhdy0+bGlzdF9s
b2NrKTsNCj4gIAlsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUocmF3X2RhdGEsIHRlbXAsICZyYXct
Pmxpc3QsIGVudHJ5KSB7DQo+IEBAIC0yNDgsNiArMjU2LDEyIEBAIHN0YXRpYyB2b2lkIGdiX3Jh
d19kaXNjb25uZWN0KHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSkNCj4gIAkJa2ZyZWUocmF3X2Rh
dGEpOw0KPiAgCX0NCj4gIAltdXRleF91bmxvY2soJnJhdy0+bGlzdF9sb2NrKTsNCj4gKw0KPiAr
CW11dGV4X2xvY2soJnJhdy0+d3JpdGVfbG9jayk7DQo+ICsJcmF3LT5jb25uZWN0aW9uID0gTlVM
TDsNCj4gKwlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29ubmVjdGlvbik7DQo+ICsJbXV0ZXhfdW5s
b2NrKCZyYXctPndyaXRlX2xvY2spOw0KDQpUaGVuIHRoaXMgd291bGQgYmUgYSB3cml0ZSBsb2Nr
IHNldHRpbmcgdGhlIGRpc2Nvbm5lY3RlZCBmbGFnLCBhbmQgdGhhdA0KY2FuIGJlIGRvbmUgYmVm
b3JlIGZyZWVpbmcgdGhlIGRhdGEgYnVmZmVycyAob3IgYmVmb3JlIGRpc2FibGluZyB0aGUNCmNv
bm5lY3Rpb24pLg0KDQo+ICsNCj4gIAlwdXRfZGV2aWNlKCZyYXctPmRldik7DQo+ICB9DQoNCkpv
aGFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFy
by5vcmcK
