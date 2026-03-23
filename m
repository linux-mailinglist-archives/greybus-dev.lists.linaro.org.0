Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGJuLopOwWmhSAQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 15:30:34 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 542BA2F4A28
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 15:30:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 38FB53F735
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Mar 2026 14:30:33 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by lists.linaro.org (Postfix) with ESMTPS id 95DE23F6DA
	for <greybus-dev@lists.linaro.org>; Mon, 23 Mar 2026 14:30:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Q3s3xv0Y;
	spf=pass (lists.linaro.org: domain of johan@kernel.org designates 172.105.4.254 as permitted sender) smtp.mailfrom=johan@kernel.org;
	dmarc=pass (policy=quarantine) header.from=kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2AC4C600C4;
	Mon, 23 Mar 2026 14:30:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB83DC4CEF7;
	Mon, 23 Mar 2026 14:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774276229;
	bh=+uXh6Wo8ID6kFjXsjYwlzbtp3B2p7V/Saw4pHUAkil4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3s3xv0YGJ5nGlClKOKJz+JfTR9WXsxNN9RC8hcHZp0hiy9Zb82/0Thyy3t1bw4BE
	 3ACK+lnd9d/BCuTuoyKKUnaOmWPlqlyZyPbRXN0h9NisY0nI5bpkksTxPfoZMMlg4A
	 TYIfBQYF0vyFwfhNjZcG1kt5OASrTjA/03rg8QgEXiRSi5E46rn6vbOCoP03qeT0VW
	 xdyHZgYmhih6q+VlQeDPyVrUIlhqkXWvXmfD+zC/zMfDOVMDsvGkPovwQd+claOmAG
	 vcR82Dg4yjSHk/EhgjteelzhKxxEB34dLqyqhtEYPgM7dD4B3bFeA4ptHHp3vm2RDh
	 +aIwPmewBxi9Q==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1w4gIV-00000003auM-2i47;
	Mon, 23 Mar 2026 15:30:27 +0100
Date: Mon, 23 Mar 2026 15:30:27 +0100
From: Johan Hovold <johan@kernel.org>
To: Damien =?utf-8?Q?Ri=C3=A9gel?= <damien.riegel@silabs.com>
Message-ID: <acFOg_EFUdxx0k9S@hovoldconsulting.com>
References: <20260319162049.42269-1-damien.riegel@silabs.com>
 <20260319162049.42269-2-damien.riegel@silabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260319162049.42269-2-damien.riegel@silabs.com>
X-Spamd-Bar: ----
Message-ID-Hash: BPYAPA2DR52UO7WV5TCTELEGGFINH24J
X-Message-ID-Hash: BPYAPA2DR52UO7WV5TCTELEGGFINH24J
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2 2/2] greybus: raw: fix use-after-free if write is called after disconnect
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BPYAPA2DR52UO7WV5TCTELEGGFINH24J/>
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
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:-];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[johan@kernel.org,greybus-dev-bounces@lists.linaro.org];
	NEURAL_SPAM(0.00)[0.957];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6]
X-Rspamd-Queue-Id: 542BA2F4A28
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gVGh1LCBNYXIgMTksIDIwMjYgYXQgMTI6MjA6NDlQTSAtMDQwMCwgRGFtaWVuIFJpw6lnZWwg
d3JvdGU6DQo+IElmIGEgdXNlciB3cml0ZXMgdG8gdGhlIGNoYXJkZXYgYWZ0ZXIgZGlzY29ubmVj
dCBoYXMgYmVlbiBjYWxsZWQsIHRoZQ0KPiBrZXJuZWwgcGFuaWNzIHdpdGggdGhlIGZvbGxvd2lu
ZyB0cmFjZSAod2l0aA0KPiBDT05GSUdfSU5JVF9PTl9GUkVFX0RFRkFVTFRfT049eSk6DQo+IA0K
PiAgICAgICAgIEJVRzoga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSwgYWRkcmVzczog
MDAwMDAwMDAwMDAwMDIxOA0KPiAgICAgICAgICAuLi4NCj4gICAgICAgICBDYWxsIFRyYWNlOg0K
PiAgICAgICAgICA8VEFTSz4NCj4gICAgICAgICAgZ2Jfb3BlcmF0aW9uX2NyZWF0ZV9jb21tb24r
MHg2MS8weDE4MA0KPiAgICAgICAgICBnYl9vcGVyYXRpb25fY3JlYXRlX2ZsYWdzKzB4MjgvMHhh
MA0KPiAgICAgICAgICBnYl9vcGVyYXRpb25fc3luY190aW1lb3V0KzB4NmYvMHgxMDANCj4gICAg
ICAgICAgcmF3X3dyaXRlKzB4N2IvMHhjNyBbZ2JfcmF3XQ0KPiAgICAgICAgICB2ZnNfd3JpdGUr
MHhjZi8weDQyMA0KPiAgICAgICAgICA/IHRhc2tfbW1fY2lkX3dvcmsrMHgxMzYvMHgyMjANCj4g
ICAgICAgICAga3N5c193cml0ZSsweDYzLzB4ZTANCj4gICAgICAgICAgZG9fc3lzY2FsbF82NCsw
eGE0LzB4MjkwDQo+ICAgICAgICAgIGVudHJ5X1NZU0NBTExfNjRfYWZ0ZXJfaHdmcmFtZSsweDc3
LzB4N2YNCj4gDQo+IERpc2Nvbm5lY3QgY2FsbHMgZ2JfY29ubmVjdGlvbl9kZXN0cm95LCB3aGlj
aCBlbmRzIHVwIGZyZWVpbmcgdGhlDQo+IGNvbm5lY3Rpb24gb2JqZWN0LiBXaGVuIGdiX29wZXJh
dGlvbl9zeW5jIGlzIGNhbGxlZCBpbiB0aGUgd3JpdGUgZmlsZQ0KPiBvcGVyYXRpb25zLCBpdHMg
Z2V0cyBhIGZyZWVkIGNvbm5lY3Rpb24gYXMgcGFyYW1ldGVyIGFuZCB0aGUga2VybmVsDQo+IHBh
bmljcy4NCj4gDQo+IFRoZSBnYl9jb25uZWN0aW9uX2Rlc3Ryb3kgY2Fubm90IGJlIG1vdmVkIG91
dCBvZiB0aGUgZGlzY29ubmVjdA0KPiBmdW5jdGlvbiwgYXMgdGhlIEdyZXlidXMgc3Vic3lzdGVt
IGV4cGVjdCBhbGwgY29ubmVjdGlvbnMgYmVsb25naW5nIHRvIGENCj4gYnVuZGxlIHRvIGJlIGRl
c3Ryb3llZCB3aGVuIGRpc2Nvbm5lY3QgcmV0dXJucy4NCj4gDQo+IFRvIHByZXZlbnQgdGhpcyBi
dWcsIHVzZSBhIHJ3IGxvY2sgdG8gc3luY2hyb25pemUgYWNjZXNzIGJldHdlZW4gd3JpdGUNCj4g
YW5kIGRpc2Nvbm5lY3QuIFRoaXMgZ3VhcmFudGVlcyB0aGF0IGluIHRoZSB3cml0ZSBmdW5jdGlv
bg0KPiByYXctPmNvbm5lY3Rpb24gaXMgZWl0aGVyIGEgdmFsaWQgb2JqZWN0IG9yIGEgTlVMTCBw
b2ludGVyLg0KDQpZb3UgZm9yZ290IHRvIHVwZGF0ZSB0aGlzIGxhc3Qgc2VudGVuY2UgYWZ0ZXIg
eW91IHN3aXRjaGVkIHRvIGEgYm9vbA0KZmxhZy4NCg0KPiBGaXhlczogZTgwNmM3ZmI4ZTliICgi
Z3JleWJ1czogcmF3OiBhZGQgcmF3IGdyZXlidXMga2VybmVsIGRyaXZlciIpDQo+IFNpZ25lZC1v
ZmYtYnk6IERhbWllbiBSacOpZ2VsIDxkYW1pZW4ucmllZ2VsQHNpbGFicy5jb20+DQo+IC0tLQ0K
PiBDaGFuZ2VzIGluIHYyOg0KPiAgIC0gdHJpbSBkb3duIHRyYWNlIGluIGNvbW1pdCBtZXNzYWdl
IHRvIGtlZXAgb25seSB0aGUgZXNzZW50aWFsIHBhcnQNCj4gICAtIGNvbnZlcnQgdGhlIG11dGV4
IHRoYXQgcHJvdGVjdGVkIHRoZSBjb25uZWN0aW9uIHRvIGEgcndfc2VtYXBob3JlDQo+ICAgLSB1
c2UgYSAiY29ubmVjdGVkIiBmbGFnIGluc3RlYWQgb2YgcmVseWluZyBvbiB0aGUgY29ubmVjdGlv
biBwb2ludGVyDQo+ICAgICBiZWluZyBOVUxMIG9yIG5vdA0KPiANCj4gIGRyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3Jhdy5jIHwgMjIgKysrKysrKysrKysrKysrKysrKystLQ0KPiAgMSBmaWxlIGNo
YW5nZWQsIDIwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcmF3LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9yYXcuYw0KPiBpbmRleCA2ZGE4NzhlNDMzOS4uNTdiZjUwMzIyODAgMTAwNjQ0DQo+IC0tLSBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jDQo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL3Jhdy5jDQo+IEBAIC0yMSw2ICsyMSw4IEBAIHN0cnVjdCBnYl9yYXcgew0KPiAgCXN0
cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4gIAlpbnQgbGlzdF9kYXRhOw0KPiAgCXN0cnVjdCBtdXRl
eCBsaXN0X2xvY2s7DQo+ICsJc3RydWN0IHJ3X3NlbWFwaG9yZSBkaXNjb25uZWN0X2xvY2s7CS8q
IFN5bmNocm9uaXplIGFjY2VzcyB0byBjb25uZWN0aW9uICovDQoNCkp1c3Qgc2tpcCB0aGUgY29t
bWVudCAoYW5kIGlnbm9yZSBjaGVja3BhdGNoKS4NCg0KPiArCWJvb2wgY29ubmVjdGVkOw0KDQpQ
bGVhc2UgdXNlIGEgImRpc2Nvbm5lY3RlZCIgZmxhZyBpbnN0ZWFkIChhbmQgbGVhdmUgaXQgc2V0
IHRvIGZhbHNlDQp1bnRpbCBkaXNjb25uZWN0KCkgaXMgY2FsbGVkKSB3aGljaCBpcyB0aGUgY29t
bW9uIHdheSB0byBoYW5kbGUgdGhpcy4NCg0KPiAgCXN0cnVjdCBjZGV2IGNkZXY7DQo+ICAJc3Ry
dWN0IGRldmljZSBkZXY7DQo+ICB9Ow0KPiBAQCAtMTI0LDcgKzEyNiw2IEBAIHN0YXRpYyBpbnQg
Z2JfcmF3X3JlcXVlc3RfaGFuZGxlcihzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcCkNCj4gIA0KPiAg
c3RhdGljIGludCBnYl9yYXdfc2VuZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0
IGNoYXIgX191c2VyICpkYXRhKQ0KPiAgew0KPiAtCXN0cnVjdCBnYl9jb25uZWN0aW9uICpjb25u
ZWN0aW9uID0gcmF3LT5jb25uZWN0aW9uOw0KPiAgCXN0cnVjdCBnYl9yYXdfc2VuZF9yZXF1ZXN0
ICpyZXF1ZXN0Ow0KPiAgCWludCByZXR2YWw7DQo+ICANCj4gQEAgLTEzOSw5ICsxNDAsMTggQEAg
c3RhdGljIGludCBnYl9yYXdfc2VuZChzdHJ1Y3QgZ2JfcmF3ICpyYXcsIHUzMiBsZW4sIGNvbnN0
IGNoYXIgX191c2VyICpkYXRhKQ0KPiAgDQo+ICAJcmVxdWVzdC0+bGVuID0gY3B1X3RvX2xlMzIo
bGVuKTsNCj4gIA0KPiAtCXJldHZhbCA9IGdiX29wZXJhdGlvbl9zeW5jKGNvbm5lY3Rpb24sIEdC
X1JBV19UWVBFX1NFTkQsDQo+ICsJZG93bl9yZWFkKCZyYXctPmRpc2Nvbm5lY3RfbG9jayk7DQo+
ICsNCj4gKwlpZiAoIXJhdy0+Y29ubmVjdGVkKSB7DQo+ICsJCXJldHZhbCA9IC1FTk9ERVY7DQo+
ICsJCWdvdG8gZXhpdDsNCj4gKwl9DQoNCkkgdGhpbmsgaXQgbWF5IGJlIHByZWZlcnJlZCB0byBt
b3ZlIHRoZSBkaXNjb25uZWN0ZWQgY2hlY2sgdG8NCnJhd193cml0ZSgpIHRvIGF2b2lkIGFsbG9j
YXRpbmcgbWVtb3J5IGFuZCBjb3B5aW5nIGRhdGEgZm9yIGEgYnVuZGxlDQooY29ubmVjdGlvbikg
dGhhdCdzIGFscmVhZHkgZ29uZS4NCg0KPiArDQo+ICsJcmV0dmFsID0gZ2Jfb3BlcmF0aW9uX3N5
bmMocmF3LT5jb25uZWN0aW9uLCBHQl9SQVdfVFlQRV9TRU5ELA0KPiAgCQkJCSAgIHJlcXVlc3Qs
IGxlbiArIHNpemVvZigqcmVxdWVzdCksDQo+ICAJCQkJICAgTlVMTCwgMCk7DQo+ICtleGl0Og0K
PiArCXVwX3JlYWQoJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCj4gIA0KPiAgCWtmcmVlKHJlcXVl
c3QpOw0KPiAgCXJldHVybiByZXR2YWw7DQo+IEBAIC0xOTksNiArMjA5LDcgQEAgc3RhdGljIGlu
dCBnYl9yYXdfcHJvYmUoc3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlLA0KPiAgDQo+ICAJSU5JVF9M
SVNUX0hFQUQoJnJhdy0+bGlzdCk7DQo+ICAJbXV0ZXhfaW5pdCgmcmF3LT5saXN0X2xvY2spOw0K
PiArCWluaXRfcndzZW0oJnJhdy0+ZGlzY29ubmVjdF9sb2NrKTsNCj4gIA0KPiAgCXJhdy0+Y29u
bmVjdGlvbiA9IGNvbm5lY3Rpb247DQo+ICAJcmF3LT5kZXYucGFyZW50ID0gJmNvbm5lY3Rpb24t
PmJ1bmRsZS0+ZGV2Ow0KPiBAQCAtMjEwLDYgKzIyMSw4IEBAIHN0YXRpYyBpbnQgZ2JfcmF3X3By
b2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwNCj4gIAlpZiAocmV0dmFsKQ0KPiAgCQlnb3Rv
IGVycm9yX2Nvbm5lY3Rpb25fZGVzdHJveTsNCj4gIA0KPiArCXJhdy0+Y29ubmVjdGVkID0gdHJ1
ZTsNCg0KTm8gbmVlZCB0byBpbml0aWFsaXNlIGFmdGVyIHlvdSBpbnZlcnQgdGhlIGZsYWcuDQoN
CkpvaGFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK
