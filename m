Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB614DB4DE
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Mar 2022 16:30:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E9D1D401EF
	for <lists+greybus-dev@lfdr.de>; Wed, 16 Mar 2022 15:30:07 +0000 (UTC)
Received: from 189.cn (ptr.189.cn [183.61.185.103])
	by lists.linaro.org (Postfix) with ESMTP id 6DFE03EE2F
	for <greybus-dev@lists.linaro.org>; Thu,  3 Mar 2022 03:32:45 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:59860.1825392078
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-39.156.73.14 (unknown [10.64.8.43])
	by 189.cn (HERMES) with SMTP id 116D7100199;
	Thu,  3 Mar 2022 11:32:17 +0800 (CST)
Received: from  ([172.27.8.53])
	by gateway-151646-dep-b7fbf7d79-vjdjk with ESMTP id 1a7c2422cd53475e97fb8c11bba2953d for u.kleine-koenig@pengutronix.de;
	Thu, 03 Mar 2022 11:32:43 CST
X-Transaction-ID: 1a7c2422cd53475e97fb8c11bba2953d
X-Real-From: chensong_2000@189.cn
X-Receive-IP: 172.27.8.53
X-MEDUSA-Status: 0
Sender: chensong_2000@189.cn
Message-ID: <bf44b184-265f-6931-20e2-42eab82f6177@189.cn>
Date: Thu, 3 Mar 2022 11:31:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>
References: <1645780561-18481-1-git-send-email-chensong_2000@189.cn>
 <20220301215659.kj2wwrijkdmkmces@pengutronix.de>
From: Song Chen <chensong_2000@189.cn>
In-Reply-To: <20220301215659.kj2wwrijkdmkmces@pengutronix.de>
X-MailFrom: chensong_2000@189.cn
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YTSHN6X2GQOQL3BUH56G3QXXP7OPAPRJ
X-Message-ID-Hash: YTSHN6X2GQOQL3BUH56G3QXXP7OPAPRJ
X-Mailman-Approved-At: Wed, 16 Mar 2022 15:30:05 +0000
CC: johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, lee.jones@linaro.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3] staging: greybus: introduce pwm_ops::apply
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YTSHN6X2GQOQL3BUH56G3QXXP7OPAPRJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpIZWxsbywNCg0K5ZyoIDIwMjIvMy8yIDA1OjU2LCBVd2UgS2xlaW5lLUvDtm5pZyDlhpnpgZM6
DQo+IEhlbGxvLA0KPiANCj4gT24gRnJpLCBGZWIgMjUsIDIwMjIgYXQgMDU6MTY6MDFQTSArMDgw
MCwgU29uZyBDaGVuIHdyb3RlOg0KPj4gSW50cm9kdWNlIGFwcGx5IGluIHB3bV9vcHMgdG8gcmVw
bGFjZSBsZWdhY3kgb3BlcmF0aW9ucywNCj4+IGxpa2UgZW5hYmxlLCBkaXNhYmxlLCBjb25maWcg
YW5kIHNldF9wb2xhcml0eS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTb25nIENoZW4gPGNoZW5z
b25nXzIwMDBAMTg5LmNuPg0KPj4NCj4+IC0tLQ0KPj4gdjI6DQo+PiAxLCBkZWZpbmUgZHV0eV9j
eWNsZSBhbmQgcGVyaW9kIGFzIHU2NCBpbiBnYl9wd21fY29uZmlnX29wZXJhdGlvbi4NCj4+IDIs
IGRlZmluZSBkdXR5IGFuZCBwZXJpb2QgYXMgdTY0IGluIGdiX3B3bV9jb25maWdfcmVxdWVzdC4N
Cj4+IDMsIGRpc2FibGUgYmVmb3JlIGNvbmZpZ3VyaW5nIGR1dHkgYW5kIHBlcmlvZCBpZiB0aGUg
ZXZlbnR1YWwgZ29hbA0KPj4gICAgIGlzIGEgZGlzYWJsZWQgc3RhdGUuDQo+Pg0KPj4gdjM6DQo+
PiBSZWdhcmRpbmcgZHV0eV9jeWNsZSBhbmQgcGVyaW9kLCBJIHJlYWQgbW9yZSBkaXNjdXNzaW9u
IGluIHRoaXMgdGhyZWFkLA0KPj4gbWluLCB3YXJuIG9yIC1FSU5WQUwsIHNlZW1zIG5vIHBlcmZl
Y3Qgd2F5IGFjY2VwdGFibGUgZm9yIGV2ZXJ5b25lLg0KPj4gSG93IGFib3V0IHdlIGxpbWl0IHRo
ZWlyIHZhbHVlIHRvIElOVF9NQVggYW5kIHRocm93IGEgd2FybmluZyBhdCB0aGUNCj4+IHNhbWUg
dGltZSB3aGVuIHRoZXkgYXJlIHdyb25nPw0KPiANCj4gTXkgcG9zaXRpb24gaXMgdGhhdCB0aGUg
ZHJpdmVyIHNob3VsZCBpbXBsZW1lbnQgdGhlIGJpZ2dlc3QgcG9zc2libGUNCj4gcGVyaW9kIG5v
dCBiaWdnZXIgdGhhbiB0aGUgcmVxdWVzdGVkIHBlcmlvZC4gVGhhdCdzIGhvdyBhbGwgbmV3IGRy
aXZlcnMNCj4gYmVoYXZlIHNpbmNlIEkgY2FyZSBmb3IgcmV2aWV3aW5nIFBXTSBzdHVmZi4gU28g
Y2FwcGluZyB0byBVMzJfTUFYIGFzIGlzDQo+IChuZWFybHkpIGRvbmUgYmVsb3cgaXMgZ29vZCBp
biBteSBib29rLg0KPiANCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
YyB8IDY2ICsrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tDQo+PiAgIDEgZmlsZSBj
aGFuZ2VkLCA0MCBpbnNlcnRpb25zKCspLCAyNiBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9wd20uYw0KPj4gaW5kZXggODkxYTZhNjcyMzc4Li4zZWM1YmM1NGQ2MTYgMTAwNjQ0DQo+
PiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KPj4gKysrIGIvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvcHdtLmMNCj4+IEBAIC0yMDQsNDMgKzIwNCw1NyBAQCBzdGF0aWMgdm9p
ZCBnYl9wd21fZnJlZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpw
d20pDQo+PiAgIAlnYl9wd21fZGVhY3RpdmF0ZV9vcGVyYXRpb24ocHdtYywgcHdtLT5od3B3bSk7
DQo+PiAgIH0NCj4+ICAgDQo+PiAtc3RhdGljIGludCBnYl9wd21fY29uZmlnKHN0cnVjdCBwd21f
Y2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSwNCj4+IC0JCQkgaW50IGR1dHlfbnMs
IGludCBwZXJpb2RfbnMpDQo+PiArc3RhdGljIGludCBnYl9wd21fYXBwbHkoc3RydWN0IHB3bV9j
aGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtLA0KPj4gKwkJCWNvbnN0IHN0cnVjdCBw
d21fc3RhdGUgKnN0YXRlKQ0KPj4gICB7DQo+PiArCWludCBlcnI7DQo+PiArCWJvb2wgZW5hYmxl
ZCA9IHB3bS0+c3RhdGUuZW5hYmxlZDsNCj4+ICsJdTY0IHBlcmlvZCA9IHN0YXRlLT5wZXJpb2Q7
DQo+PiArCXU2NCBkdXR5X2N5Y2xlID0gc3RhdGUtPmR1dHlfY3ljbGU7DQo+PiAgIAlzdHJ1Y3Qg
Z2JfcHdtX2NoaXAgKnB3bWMgPSBwd21fY2hpcF90b19nYl9wd21fY2hpcChjaGlwKTsNCj4+ICAg
DQo+PiAtCXJldHVybiBnYl9wd21fY29uZmlnX29wZXJhdGlvbihwd21jLCBwd20tPmh3cHdtLCBk
dXR5X25zLCBwZXJpb2RfbnMpOw0KPj4gLX07DQo+PiAtDQo+PiAtc3RhdGljIGludCBnYl9wd21f
c2V0X3BvbGFyaXR5KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3
bSwNCj4+IC0JCQkgICAgICAgZW51bSBwd21fcG9sYXJpdHkgcG9sYXJpdHkpDQo+PiAtew0KPj4g
LQlzdHJ1Y3QgZ2JfcHdtX2NoaXAgKnB3bWMgPSBwd21fY2hpcF90b19nYl9wd21fY2hpcChjaGlw
KTsNCj4+IC0NCj4+IC0JcmV0dXJuIGdiX3B3bV9zZXRfcG9sYXJpdHlfb3BlcmF0aW9uKHB3bWMs
IHB3bS0+aHdwd20sIHBvbGFyaXR5KTsNCj4+IC19Ow0KPj4gKwkvKiBzZXQgcG9sYXJpdHkgKi8N
Cj4+ICsJaWYgKHN0YXRlLT5wb2xhcml0eSAhPSBwd20tPnN0YXRlLnBvbGFyaXR5KSB7DQo+PiAr
CQlpZiAoZW5hYmxlZCkgew0KPj4gKwkJCWdiX3B3bV9kaXNhYmxlX29wZXJhdGlvbihwd21jLCBw
d20tPmh3cHdtKTsNCj4gDQo+IFNvIHBvbGFyaXR5IGNhbiBvbmx5IGJlIHN3aXRjaGVkIHdpdGgg
dGhlIFBXTSBvZmY/DQoNCkkgaGF2ZSBubyBkZXZpY2VzIGluIG15IGhhbmQgdG8gZ2V0IGl0IHRl
c3RlZCwgYnV0IGkgdGhpbmsgaXQncyANCnJlYXNvbmFibGUgdG8gdHVybiBvZmYgUFdNIGJlZm9y
ZSBzd2l0Y2hpbmcgb2ZmIGl0cyBwb2xhcml0eS4NCg0KV2hhdCdzIG1vcmUsIGl0IGZvbGxvd3Mg
dGhlIGltcGxlbWVudGF0aW9uIG9mIHB3bV9hcHBseV9sZWdhY3ksIHdoaWNoIGlzIA0KdGhlIHdh
eSBob3cgaXQgd29ya3Mgbm93Lg0KDQo+IA0KPj4gKwkJCWVuYWJsZWQgPSBmYWxzZTsNCj4+ICsJ
CX0NCj4+ICsJCWVyciA9IGdiX3B3bV9zZXRfcG9sYXJpdHlfb3BlcmF0aW9uKHB3bWMsIHB3bS0+
aHdwd20sIHN0YXRlLT5wb2xhcml0eSk7DQo+PiArCQlpZiAoZXJyKQ0KPj4gKwkJCXJldHVybiBl
cnI7DQo+PiArCX0NCj4+ICAgDQo+PiAtc3RhdGljIGludCBnYl9wd21fZW5hYmxlKHN0cnVjdCBw
d21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkNCj4+IC17DQo+PiAtCXN0cnVj
dCBnYl9wd21fY2hpcCAqcHdtYyA9IHB3bV9jaGlwX3RvX2diX3B3bV9jaGlwKGNoaXApOw0KPj4g
KwlpZiAoIXN0YXRlLT5lbmFibGVkKSB7DQo+PiArCQlpZiAoZW5hYmxlZCkNCj4+ICsJCQlnYl9w
d21fZGlzYWJsZV9vcGVyYXRpb24ocHdtYywgcHdtLT5od3B3bSk7DQo+PiArCQlyZXR1cm4gMDsN
Cj4+ICsJfQ0KPj4gICANCj4+IC0JcmV0dXJuIGdiX3B3bV9lbmFibGVfb3BlcmF0aW9uKHB3bWMs
IHB3bS0+aHdwd20pOw0KPj4gLX07DQo+PiArCS8qIHNldCBwZXJpb2QgYW5kIGR1dHkgY3ljbGUq
Lw0KPj4gKwlpZiAocGVyaW9kID4gSU5UX01BWCkgew0KPiANCj4gR2l2ZW4gdGhhdCBpbiBnYl9w
d21fY29uZmlnX29wZXJhdGlvbiB0aGUgcGFyYW1ldGVycyBhcmUgdTMyLCBJIHN1Z2dlc3QNCj4g
dG8gdXNlIFUzMl9NQVggaGVyZSBpbnN0ZWFkIG9mIElOVF9NQVguDQo+IA0KDQp3aWxsIGRvLg0K
DQo+PiArCQlwZXJpb2QgPSBJTlRfTUFYOw0KPj4gKwkJZGV2X3dhcm4oY2hpcC0+ZGV2LCAicGVy
aW9kIGlzICVsbHUgbnMsIG91dCBvZiByYW5nZVxuIiwgc3RhdGUtPnBlcmlvZCk7DQo+IA0KPiBQ
bGVhc2UgZHJvcCB0aGlzIHdhcm5pbmcuIFRoYXQncyBhIGJhZCBvbmUgYmVjYXVzZSBpdCBjYW4g
YmUgdHJpZ2dlcmVkDQo+IGZyb20gdXNlcnNwYWNlLg0KDQp3aWxsIGRvDQoNCj4gDQo+PiArCX0N
Cj4+ICsJaWYgKGR1dHlfY3ljbGUgPiBJTlRfTUFYKSB7DQo+PiArCQlkdXR5X2N5Y2xlID0gSU5U
X01BWDsNCj4+ICsJCWRldl93YXJuKGNoaXAtPmRldiwNCj4+ICsJCQkgImR1dHkgY3ljbGUgaXMg
JWxsdSBucywgb3V0IG9mIHJhbmdlXG4iLCBzdGF0ZS0+ZHV0eV9jeWNsZSk7DQo+PiArCX0NCj4+
ICsJZXJyID0gZ2JfcHdtX2NvbmZpZ19vcGVyYXRpb24ocHdtYywgcHdtLT5od3B3bSwgZHV0eV9j
eWNsZSwgcGVyaW9kKTsNCj4gDQo+IElzIGl0IGNsZWFyIGhvdyBnYl9wd21fY29uZmlnX29wZXJh
dGlvbiByb3VuZHM/IElmIHllcywgcGxlYXNlIGRvY3VtZW50DQo+IHRoaXMuIEkgYWxzbyB3b25k
ZXIgaWYgeW91IGNvdWxkIGltcGxlbWVudCAoaW4gYSBzZXBhcmF0ZSBjaGFuZ2UpDQo+IC5nZXRf
c3RhdGUoKS4NCg0KTm90IGNsZWFyIGFib3V0IGdiX3B3bV9jb25maWdfb3BlcmF0aW9uIHJvdW5k
cy4NCkZvciBnZXRfc3RhdGUsIGkgd2lsbCBsb29rIGludG8gaXQuDQoNCj4gDQo+PiArCWlmIChl
cnIpDQo+PiArCQlyZXR1cm4gZXJyOw0KPj4gICANCj4+IC1zdGF0aWMgdm9pZCBnYl9wd21fZGlz
YWJsZShzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHN0cnVjdCBwd21fZGV2aWNlICpwd20pDQo+PiAt
ew0KPj4gLQlzdHJ1Y3QgZ2JfcHdtX2NoaXAgKnB3bWMgPSBwd21fY2hpcF90b19nYl9wd21fY2hp
cChjaGlwKTsNCj4+ICsJLyogZW5hYmxlL2Rpc2FibGUgKi8NCj4+ICsJaWYgKCFlbmFibGVkKQ0K
Pj4gKwkJcmV0dXJuIGdiX3B3bV9lbmFibGVfb3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20pOw0K
Pj4gICANCj4+IC0JZ2JfcHdtX2Rpc2FibGVfb3BlcmF0aW9uKHB3bWMsIHB3bS0+aHdwd20pOw0K
Pj4gLX07DQo+PiArCXJldHVybiAwOw0KPj4gK30NCj4+ICAgDQo+PiAgIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgcHdtX29wcyBnYl9wd21fb3BzID0gew0KPj4gICAJLnJlcXVlc3QgPSBnYl9wd21fcmVx
dWVzdCwNCj4+ICAgCS5mcmVlID0gZ2JfcHdtX2ZyZWUsDQo+PiAtCS5jb25maWcgPSBnYl9wd21f
Y29uZmlnLA0KPj4gLQkuc2V0X3BvbGFyaXR5ID0gZ2JfcHdtX3NldF9wb2xhcml0eSwNCj4+IC0J
LmVuYWJsZSA9IGdiX3B3bV9lbmFibGUsDQo+PiAtCS5kaXNhYmxlID0gZ2JfcHdtX2Rpc2FibGUs
DQo+PiArCS5hcHBseSA9IGdiX3B3bV9hcHBseSwNCj4+ICAgCS5vd25lciA9IFRISVNfTU9EVUxF
LA0KPiANCj4gQmVzdCByZWdhcmRzDQo+IFV3ZQ0KPiANCg0KQmVzdCByZWdhcmRzDQoNClNvbmcN
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vi
c2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9y
Zwo=
