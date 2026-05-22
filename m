Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CYu6JybBEWprpgYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 272F25BF815
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B19784097B
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 14:54:48 +0000 (UTC)
Received: from mta.al2klimov.de (mta.al2klimov.de [162.55.223.79])
	by lists.linaro.org (Postfix) with ESMTPS id 3463040969
	for <greybus-dev@lists.linaro.org>; Fri, 22 May 2026 05:54:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=al2klimov.de header.s=default header.b=KUNGoa+9;
	spf=pass (lists.linaro.org: domain of grandmaster@al2klimov.de designates 162.55.223.79 as permitted sender) smtp.mailfrom=grandmaster@al2klimov.de;
	dmarc=pass (policy=quarantine) header.from=al2klimov.de
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; s=default; bh=A4/lN2o5nrJZ
	D1TaSGWtLKsSBgYWyqIQ14xL1HkJdag=; h=in-reply-to:from:references:cc:to:
	subject:date; d=al2klimov.de; b=KUNGoa+90wyZGJ5iWuzrMiO7LV2507ieTMgEt4
	Q90vrEO88Y+DU/ZHYmXJSunb8Ci/q1K6vpm/pkuD6VsO/OGDuiK5nGaWdQyPVsbyvicgC7
	+hBWsZB0QR0bjTNts1da96dXrCFaXPUAVxZdANt/qp3ubatiBK/ZyvwesL8GqfSII7hV1a
	oQpHjIR0CIdfCixUIoHL0BtXB0D2symK8GitegpmrD8m3fnVxAS2OvW5JsIO4oB9pvXV+w
	PKUDbHuawNusqDcIfFFivaGdcjTTDcXqHiRw6ilqWaLr0vxeMj9wnAa3rD0rBC5G9U+UdS
	VgQXMAcYTBVh5/MX3HhfoB3g==
Received: from [IPV6:2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5] (2a02-2455-18e9-e011-4d8a-aad2-c25c-50e5.dyn6.pyur.net [2a02:2455:18e9:e011:4d8a:aad2:c25c:50e5])
	by mta.al2klimov.de (OpenSMTPD) with ESMTPSA id 757b15f1 (TLSv1.3:TLS_CHACHA20_POLY1305_SHA256:256:NO);
	Fri, 22 May 2026 05:54:33 +0000 (UTC)
Content-Type: multipart/mixed; boundary="------------QAyNpt3YNObBIT0a0eATbTL9"
Message-ID: <941f04ce-b6c7-4c96-8056-d7148dd1aae5@al2klimov.de>
Date: Fri, 22 May 2026 07:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
 <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
 <2026052249-shrank-trophy-14ff@gregkh>
Content-Language: en-US
From: "Alexander A. Klimov" <grandmaster@al2klimov.de>
In-Reply-To: <2026052249-shrank-trophy-14ff@gregkh>
X-Spamd-Bar: ---
X-MailFrom: grandmaster@al2klimov.de
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 77GM3U43TMDYM5OYQXJP2IWX6SXUERP7
X-Message-ID-Hash: 77GM3U43TMDYM5OYQXJP2IWX6SXUERP7
X-Mailman-Approved-At: Sat, 23 May 2026 14:54:37 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/77GM3U43TMDYM5OYQXJP2IWX6SXUERP7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
X-Spamd-Result: default: False [4.59 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_QUARANTINE(1.50)[al2klimov.de : SPF not aligned (relaxed),quarantine];
	R_DKIM_REJECT(1.00)[al2klimov.de:s=default];
	DATE_IN_PAST(1.00)[33];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[multipart/mixed,text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[al2klimov.de:-];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	GREYLIST(0.00)[pass,meta];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~,3:+];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ATTACHMENT(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.342];
	FROM_NEQ_ENVFROM(0.00)[grandmaster@al2klimov.de,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lkml.org:url,lists.linaro.org:rdns,lists.linaro.org:helo]
X-Rspamd-Queue-Id: 272F25BF815
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is a multi-part message in MIME format.
--------------QAyNpt3YNObBIT0a0eATbTL9
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQoNCk9uIDUvMjIvMjYgMDc6MDcsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24gVGh1
LCBNYXkgMjEsIDIwMjYgYXQgMDg6NDI6MDZQTSArMDIwMCwgQWxleGFuZGVyIEEuIEtsaW1vdiB3
cm90ZToNCj4+DQo+Pg0KPj4gT24gNS8yMS8yNiAxMDozOCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdy
b3RlOg0KPj4+IE9uIFdlZCwgTWF5IDIwLCAyMDI2IGF0IDA4OjAzOjU5UE0gKzAyMDAsIEFsZXhh
bmRlciBBLiBLbGltb3Ygd3JvdGU6DQo+Pj4+IGtzdHJ0b2ludCgpIHJldHVybnMgIjAgb24gc3Vj
Y2VzcywgLUVSQU5HRSBvbiBvdmVyZmxvdw0KPj4+PiBhbmQgLUVJTlZBTCBvbiBwYXJzaW5nIGVy
cm9yIi4gSW4gY29udHJhc3QsDQo+Pj4+IG1hbmFnZXJfc3lzZnNfcmVtb3ZlX3N0b3JlKCkgYW5k
IG1hbmFnZXJfc3lzZnNfZHVtcF9zdG9yZSgpDQo+Pj4+IGNoZWNrZWQgZm9yIDEgd2hpY2ggYWx3
YXlzIGZhaWxlZCB0aGUgb3BlcmF0aW9uLiBJIGZpeGVkIHRoaXMuDQo+Pj4+DQo+Pj4+IEZpeGVz
OiBmOWEyMWEzZjQ5MTkgKCJzdGFnaW5nOiBncmV5YnVzOiBhdWRpb19tYW5hZ2VyX3N5c2ZzOiBS
ZXBsYWNlIHNzY2FuZiB3aXRoIGtzdHJ0byogdG8gc2luZ2xlIHZhcmlhYmxlIGNvbnZlcnNpb24u
IikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleGFuZGVyIEEuIEtsaW1vdiA8Z3JhbmRtYXN0ZXJA
YWwya2xpbW92LmRlPg0KPj4+PiAtLS0NCj4+Pj4gICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXVkaW9fbWFuYWdlcl9zeXNmcy5jIHwgNCArKy0tDQo+Pj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAy
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+Pj4+DQo+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMgYi9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMNCj4+Pj4gaW5kZXggZmNkNTE4Zjk1
NDBjLi41ODE3OTFkNTY2ZTMgMTAwNjQ0DQo+Pj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2F1ZGlvX21hbmFnZXJfc3lzZnMuYw0KPj4+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb19tYW5hZ2VyX3N5c2ZzLmMNCj4+Pj4gQEAgLTQ0LDcgKzQ0LDcgQEAgc3RhdGlj
IHNzaXplX3QgbWFuYWdlcl9zeXNmc19yZW1vdmVfc3RvcmUoc3RydWN0IGtvYmplY3QgKmtvYmos
DQo+Pj4+ICAgIAlpbnQgbnVtID0ga3N0cnRvaW50KGJ1ZiwgMTAsICZpZCk7DQo+Pj4+IC0JaWYg
KG51bSAhPSAxKQ0KPj4+PiArCWlmIChudW0gIT0gMCkNCj4+Pg0KPj4+IERvZXNuJ3QgY2hlY2tw
YXRjaCBub3cgY29tcGxhaW4gYWJvdXQgdGhpcz8NCj4+IE5vLg0KPj4NCj4+ICQgY3VybCAtZnNT
TCBodHRwczovL2xrbWwub3JnL2xrbWwvZGlmZi8yMDI2LzUvMjAvMjEzOS8xIHwgc2NyaXB0cy9j
aGVja3BhdGNoLnBsDQo+IA0KPiBQbGVhc2UgdXNlIGxvcmUua2VybmVsLm9yZywgbm90IGxrbWwu
DQo+IA0KPiBBbHNvLCB3aGVuIHVzaW5nIGI0IHRvIGFwcGx5IHRoaXMsIGl0IHN1Y2tlZCBpbiBh
IGJ1bmNoIG9mIG90aGVyIHJhbmRvbQ0KPiBwYXRjaGVzIGZvciB5b3UsIHBsZWFzZSBtYWtlIG5l
dyB0aHJlYWRzIGZvciBldmVyeXRoaW5nIHlvdSBzZW5kLg0KPiANCj4+IEVSUk9SOiBNaXNzaW5n
IFNpZ25lZC1vZmYtYnk6IGxpbmUocykNCj4gDQo+IFdoeSBpcyB0aGF0IHNob3dpbmcgdXA/DQoN
CkFzIEkgYWxyZWFkeSBzYWlkLCBodHRwczovL2xrbWwub3JnL2xrbWwvZGlmZi8yMDI2LzUvMjAv
MjEzOS8xDQpjdXRzIG9mZiB0aGUgY29tbWl0IG1lc3NhZ2UuDQoNCj4gDQo+PiB0b3RhbDogMSBl
cnJvcnMsIDAgd2FybmluZ3MsIDAgY2hlY2tzLCAxNiBsaW5lcyBjaGVja2VkDQo+Pg0KPj4gTk9U
RTogRm9yIHNvbWUgb2YgdGhlIHJlcG9ydGVkIGRlZmVjdHMsIGNoZWNrcGF0Y2ggbWF5IGJlIGFi
bGUgdG8NCj4+ICAgICAgICBtZWNoYW5pY2FsbHkgY29udmVydCB0byB0aGUgdHlwaWNhbCBzdHls
ZSB1c2luZyAtLWZpeCBvciAtLWZpeC1pbnBsYWNlLg0KPiANCj4gV2hhdCBhYm91dCB0cnlpbmcg
LS1zdHJpY3Q/DQoNCn4vQ29kZS9saW51eCByZW1vdGVzL29yaWdpbi9IRUFEDQrina8gc2NyaXB0
cy9jaGVja3BhdGNoLnBsIC0tc3RyaWN0IDAwMDEtKg0KdG90YWw6IDAgZXJyb3JzLCAwIHdhcm5p
bmdzLCAwIGNoZWNrcywgMTYgbGluZXMgY2hlY2tlZA0KDQowMDAxLXN0YWdpbmctZ3JleWJ1cy1h
dWRpby1leHBlY3QtMC1mcm9tLWtzdHJ0b2ludC1ub3QtMS5wYXRjaCBoYXMgbm8gb2J2aW91cyBz
dHlsZSBwcm9ibGVtcyBhbmQgaXMgcmVhZHkgZm9yIHN1Ym1pc3Npb24uDQoNCn4vQ29kZS9saW51
eCByZW1vdGVzL29yaWdpbi9IRUFEDQrina8gZ2l0IGxvZyAtMSAtLW9uZWxpbmUNCjc1OGM4MDdi
Yjk0MyAoSEVBRCwgb3JpZ2luL21hc3Rlciwgb3JpZ2luL0hFQUQpIE1lcmdlIHRhZyAnZWZpLWZp
eGVzLWZvci12Ny4xLTInIG9mIGdpdDovLw0KZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9r
ZXJuZWwvZ2l0L2VmaS9lZmkNCg0Kfi9Db2RlL2xpbnV4IHJlbW90ZXMvb3JpZ2luL0hFQUQNCuKd
rw0KDQpJIGF0dGFjaGVkIDAwMDEtKiBhcyAuZ3osIHNvIGV2ZXJ5b25lIGNhbiB2ZXJpZnkgbXkg
Y2xhaW0uDQoNCj4gDQo+IEFueXdheSwgdGhpbmsgYWJvdXQgcmV3cml0aW5nIHRoZSBjaGVjayBm
b3IgIj09IDAiIG5vdywgdGhhdCBpcyBub3QNCg0KSSdsbCBzZW5kIHYyIGluIGEgbWludXRlLg0K
SSAqKmd1ZXNzKiogeW91IHdhbnQgWCwhWCBpbnN0ZWFkIG9mIFghPTAsWD09MC4NCg0KPiBub3Jt
YWwga2VybmVsIHN0eWxlLg0KDQo7LSkNCmdpdCBncmVwIC1uRmUgJz09IDApJ3x3YyAtbA==

--------------QAyNpt3YNObBIT0a0eATbTL9
Content-Type: application/gzip;
 name="0001-staging-greybus-audio-expect-0-from-kstrtoint-not-1.patch.gz"
Content-Disposition: attachment;
 filename*0="0001-staging-greybus-audio-expect-0-from-kstrtoint-not-1.pat";
 filename*1="ch.gz"
Content-Transfer-Encoding: base64

H4sICGXpD2oAAzAwMDEtc3RhZ2luZy1ncmV5YnVzLWF1ZGlvLWV4cGVjdC0wLWZyb20ta3N0
cnRvaW50LW5vdC0xLnBhdGNoAK2TUW/bNhSFn8NfceaHwa4sRVIk21KWIkbbdMXWYmiKvgyD
QUukzEYWDZJK4m4/fpeKAzhA2yHABEEQry4vz3d075XRW4g6ztOqWGR8IRdFsUhnvJrxvM7y
6iwveB3TJap8jve6w7XYIZkjjsvhRhrHCbuiMiVGy1bc864WBssIv7Vqq29H+KUxFNty64S5
5G16M8SjWrxkr7kTJa6MmiJN8Z7vqVo6QzwvU7oXCGKqzq779RdRuRJ//rH89OrXv2Adb1TX
lGiM2K97W4L3tdIlxP2OEhFDeqwb64zTqnPjyRSddkgYO4rBCNebzmIUg7hsX1XC2inCNx+X
H96+8TF9K4xs9R0jAIq/+/B5+buP77ixJADCGG1GEd51qHTnDDFO2ZZ3vBFmZfdW2pURBCtW
1mkj6Exf6GlC3W93j59ZtRHVjaghtUGCu42qNuDtHd9bSK5a+uI2AnonDHdKd3QypLofwspG
jF3RguyQBU8TfiazIikwHn3Hr9UTISU+il3LKwFrK95J3Cm3OXj4Ak7DE7cCt9wovqYXIiZ7
rJcxmrBr1XSiDrWU4Xpf4hud8KNGCMOQoTbKFzw9yD09qD39htiowj/IEAR+X0IeeD0b3jWi
plaC6qww3iA7DiY+UItWPKzDCWO1khJh2CgHfvq8U9fPy2eKPLiHrOo8Wcgiz+IqivJFMi+S
Op/NxBmSOJ5lmTfguVpYEATP1nN5iTDLpnMEw5OWtM+pin66+ipWDj/oXmqFnqbrRg/jiBf+
ZcrAcELzhK7f4uJo5ta9nBLdFD+renJOaeGJkhj7tJ8ukExYcLyOJ1Tm5GEiHyftfKj9ULdZ
r54CPSgbD7U91Cz3UMPzv6COJu5/Q7rwSPj7COrCQ1GEsL6DMOjY6rpvDxyUetg9uPFoB63P
qUHA0ijPopixfwGgjSqutQUAAA==

--------------QAyNpt3YNObBIT0a0eATbTL9
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--------------QAyNpt3YNObBIT0a0eATbTL9--
