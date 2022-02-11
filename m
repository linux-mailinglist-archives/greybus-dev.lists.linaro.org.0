Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD6E4CA938
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:38:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 27AAC3EF4B
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:38:01 +0000 (UTC)
Received: from 189.cn (ptr.189.cn [183.61.185.101])
	by lists.linaro.org (Postfix) with ESMTP id B2B8F3EE81
	for <greybus-dev@lists.linaro.org>; Fri, 11 Feb 2022 03:06:40 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.31:49220.1910361997
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-123.150.8.42 (unknown [10.64.8.31])
	by 189.cn (HERMES) with SMTP id 99CBF1002B4;
	Fri, 11 Feb 2022 11:06:36 +0800 (CST)
Received: from  ([123.150.8.42])
	by gateway-153622-dep-749df8664c-cv9r2 with ESMTP id 4ae6a8bd32514b71bf2478f1bf333233 for u.kleine-koenig@pengutronix.de;
	Fri, 11 Feb 2022 11:06:38 CST
X-Transaction-ID: 4ae6a8bd32514b71bf2478f1bf333233
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 123.150.8.42
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <6acc4f74-31a1-75b2-f7e8-610aac7b0ec8@189.cn>
Date: Fri, 11 Feb 2022 11:06:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <1644483902-9200-1-git-send-email-chensong_2000@189.cn>
 <20220210100342.q2t4ykgyymjzr3fj@pengutronix.de>
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <20220210100342.q2t4ykgyymjzr3fj@pengutronix.de>
X-MailFrom: chensong_2000@189.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Z53ZAPRJQDSCAAYBYDWN2U2LGI6XSVX6
X-Message-ID-Hash: Z53ZAPRJQDSCAAYBYDWN2U2LGI6XSVX6
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:37:58 +0000
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z53ZAPRJQDSCAAYBYDWN2U2LGI6XSVX6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQoNCuWcqCAyMDIyLzIvMTAgMTg6MDMsIFV3ZSBLbGVpbmUtS8O2bmlnIOWGmemBkzoNCj4gT24g
VGh1LCBGZWIgMTAsIDIwMjIgYXQgMDU6MDU6MDJQTSArMDgwMCwgU29uZyBDaGVuIHdyb3RlOg0K
Pj4gSW50cm9kdWNlIGFwcGx5IGluIHB3bV9vcHMgdG8gcmVwbGFjZSBsZWdhY3kgb3BlcmF0aW9u
cywNCj4+IGxpa2UgZW5hYmxlLCBkaXNhYmxlLCBjb25maWcgYW5kIHNldF9wb2xhcml0eS4NCj4+
DQo+PiBTaWduZWQtb2ZmLWJ5OiBTb25nIENoZW4gPGNoZW5zb25nXzIwMDBAMTg5LmNuPg0KPj4g
LS0tDQo+PiAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jIHwgNDYgKysrKysrKysrKysr
KysrLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE5IGluc2VydGlv
bnMoKyksIDI3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9wd20uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQo+PiBpbmRl
eCA4OTFhNmE2NzIzNzguLmUxODg5Y2Y5NzliMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3B3bS5jDQo+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
Yw0KPj4gQEAgLTIwNCw0MyArMjA0LDM1IEBAIHN0YXRpYyB2b2lkIGdiX3B3bV9mcmVlKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkNCj4+ICAgCWdiX3B3bV9k
ZWFjdGl2YXRlX29wZXJhdGlvbihwd21jLCBwd20tPmh3cHdtKTsNCj4+ICAgfQ0KPj4gICANCj4+
IC1zdGF0aWMgaW50IGdiX3B3bV9jb25maWcoc3RydWN0IHB3bV9jaGlwICpjaGlwLCBzdHJ1Y3Qg
cHdtX2RldmljZSAqcHdtLA0KPj4gLQkJCSBpbnQgZHV0eV9ucywgaW50IHBlcmlvZF9ucykNCj4+
IC17DQo+PiAtCXN0cnVjdCBnYl9wd21fY2hpcCAqcHdtYyA9IHB3bV9jaGlwX3RvX2diX3B3bV9j
aGlwKGNoaXApOw0KPj4gLQ0KPj4gLQlyZXR1cm4gZ2JfcHdtX2NvbmZpZ19vcGVyYXRpb24ocHdt
YywgcHdtLT5od3B3bSwgZHV0eV9ucywgcGVyaW9kX25zKTsNCj4+IC19Ow0KPj4gLQ0KPj4gLXN0
YXRpYyBpbnQgZ2JfcHdtX3NldF9wb2xhcml0eShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVj
dCBwd21fZGV2aWNlICpwd20sDQo+PiAtCQkJICAgICAgIGVudW0gcHdtX3BvbGFyaXR5IHBvbGFy
aXR5KQ0KPj4gK3N0YXRpYyBpbnQgZ2JfcHdtX2FwcGx5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwg
c3RydWN0IHB3bV9kZXZpY2UgKnB3bSwNCj4+ICsJCQljb25zdCBzdHJ1Y3QgcHdtX3N0YXRlICpz
dGF0ZSkNCj4+ICAgew0KPj4gKwlpbnQgcmV0Ow0KPj4gICAJc3RydWN0IGdiX3B3bV9jaGlwICpw
d21jID0gcHdtX2NoaXBfdG9fZ2JfcHdtX2NoaXAoY2hpcCk7DQo+PiAgIA0KPj4gLQlyZXR1cm4g
Z2JfcHdtX3NldF9wb2xhcml0eV9vcGVyYXRpb24ocHdtYywgcHdtLT5od3B3bSwgcG9sYXJpdHkp
Ow0KPj4gLX07DQo+PiAtDQo+PiAtc3RhdGljIGludCBnYl9wd21fZW5hYmxlKHN0cnVjdCBwd21f
Y2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkNCj4+IC17DQo+PiAtCXN0cnVjdCBn
Yl9wd21fY2hpcCAqcHdtYyA9IHB3bV9jaGlwX3RvX2diX3B3bV9jaGlwKGNoaXApOw0KPj4gKwkv
KiBzZXQgcGVyaW9kIGFuZCBkdXR5IGN5Y2xlKi8NCj4+ICsJcmV0ID0gZ2JfcHdtX2NvbmZpZ19v
cGVyYXRpb24ocHdtYywgcHdtLT5od3B3bSwgc3RhdGUtPmR1dHlfY3ljbGUsIHN0YXRlLT5wZXJp
b2QpOw0KPiANCj4gZ2JfcHdtX2NvbmZpZ19vcGVyYXRpb24ncyAzcmQgcGFyYW1ldGVyIGlzIGFu
IHUzMiwgc28geW91J3JlIGxvb3NpbmcNCj4gYml0cyBoZXJlIGFzIHN0YXRlLT5kdXR5X2N5Y2xl
IGlzIGEgdTY0LiBEaXR0byBmb3IgcGVyaW9kLg0KDQpvcmlnaW5hbGx5LCBwd21fYXBwbHlfc3Rh
dGUgLS0+IHB3bV9hcHBseV9sZWdhY3kgLS0+IGdiX3B3bV9jb25maWcgLS0+IA0KZ2JfcHdtX2Nv
bmZpZ19vcGVyYXRpb24gaXMgYWxzbyBsb29zaW5nIGJpdHMsIGRvZXMgaXQgbWVhbiBncmV5YnVz
IGNhbiANCmxpdmUgd2l0aCB0aGF0Pw0KDQpPciByZWRlZmluZSBnYl9wd21fY29uZmlnX3JlcXVl
c3QsIHN3aXRjaCBkdXR5IGFuZCBwZXJpb2QgdG8gX19sZTY0Pw0KDQo+IA0KPiBBbHNvIGl0IHdv
dWxkIGJlIG5pY2UgaWYgeW91IGdvIGZyb20NCj4gDQo+IAkuZHV0eV9jeWNsZSA9IEEsIC5wZXJp
b2QgPSBCLCAuZW5hYmxlZCA9IDENCj4gDQo+IHRvDQo+IA0KPiAJLmR1dHlfY3ljbGUgPSBDLCAu
cGVyaW9kID0gRCwgLmVuYWJsZWQgPSAwDQo+IA0KPiB0aGF0IEMvRCB3YXNuJ3QgdmlzaWJsZSBv
biB0aGUgb3V0cHV0IHBpbi4gU28gcGxlYXNlIGRpc2FibGUgZWFybGllcg0KPiAoYnV0IGtlZXAg
ZW5hYmxlIGF0IHRoZSBlbmQpLg0KDQpzb3JyeSwgaSBkb24ndCBxdWl0ZSB1bmRlcnN0YW5kIHRo
aXMgcGFydCwgYnV0IGlzIGJlbG93IGNvZGUgbG9va2luZyANCmdvb2QgdG8geW91Pw0KDQpzdGF0
aWMgaW50IGdiX3B3bV9hcHBseShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2
aWNlICpwd20sDQoJCQljb25zdCBzdHJ1Y3QgcHdtX3N0YXRlICpzdGF0ZSkNCnsNCglpbnQgZXJy
Ow0KCWJvb2wgZW5hYmxlZCA9IHB3bS0+c3RhdGUuZW5hYmxlZDsNCglzdHJ1Y3QgZ2JfcHdtX2No
aXAgKnB3bWMgPSBwd21fY2hpcF90b19nYl9wd21fY2hpcChjaGlwKTsNCg0KCS8qIHNldCBwb2xh
cml0eSAqLw0KCWlmIChzdGF0ZS0+cG9sYXJpdHkgIT0gcHdtLT5zdGF0ZS5wb2xhcml0eSkgew0K
CQlpZiAoZW5hYmxlZCkgew0KCQkJZ2JfcHdtX2Rpc2FibGVfb3BlcmF0aW9uKHB3bWMsIHB3bS0+
aHdwd20pOw0KCQkJZW5hYmxlZCA9IGZhbHNlOw0KCQl9DQoJCWVyciA9IGdiX3B3bV9zZXRfcG9s
YXJpdHlfb3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20sIHN0YXRlLT5wb2xhcml0eSk7DQoJCWlm
IChlcnIpDQoJCQlyZXR1cm4gZXJyOw0KCX0NCg0KCWlmICghc3RhdGUtPmVuYWJsZWQpIHsNCgkJ
aWYgKGVuYWJsZWQpDQoJCQlnYl9wd21fZGlzYWJsZV9vcGVyYXRpb24ocHdtYywgcHdtLT5od3B3
bSk7DQoJCXJldHVybiAwOw0KCX0NCg0KCS8qIHNldCBwZXJpb2QgYW5kIGR1dHkgY3ljbGUqLw0K
CWVyciA9IGdiX3B3bV9jb25maWdfb3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20sIHN0YXRlLT5k
dXR5X2N5Y2xlLCANCnN0YXRlLT5wZXJpb2QpOw0KCWlmIChlcnIpDQoJCXJldHVybiBlcnI7DQoN
CgkvKiBlbmFibGUvZGlzYWJsZSAqLw0KCWlmICghZW5hYmxlZCkNCgkJcmV0dXJuIGdiX3B3bV9l
bmFibGVfb3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20pOw0KDQoJcmV0dXJuIDA7DQp9DQoNCj4g
DQo+IEJlc3QgcmVnYXJkcw0KPiBVd2UNCj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
