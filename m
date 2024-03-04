Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD8E8702B9
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 14:30:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E7488400E5
	for <lists+greybus-dev@lfdr.de>; Mon,  4 Mar 2024 13:30:10 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	by lists.linaro.org (Postfix) with ESMTPS id 9A248400E5
	for <greybus-dev@lists.linaro.org>; Mon,  4 Mar 2024 13:30:04 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=JNkwjzRc;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.44 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7c810b04bc0so187076539f.2
        for <greybus-dev@lists.linaro.org>; Mon, 04 Mar 2024 05:30:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1709559004; x=1710163804; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IZJ+jw9Y4deUW/fsj73N7A+2EVXwQ9W8Tou+nRgNMNY=;
        b=JNkwjzRczM0Xbc0BALArRN+un1qussAL7PY/VsNrbte74pc52w8dv57maUtmhi9was
         HaJyUJfANp67U4qXBYSgz+RZoaMDIsXOcs2Vpl0yX6OTGqgjnC4aCgOoD/lsnjMVvEwe
         RxC3ANjFXmHs35P6KJxWARZ0ui407JYr9vHVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709559004; x=1710163804;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IZJ+jw9Y4deUW/fsj73N7A+2EVXwQ9W8Tou+nRgNMNY=;
        b=eI39nv0PhhMvSeXddxR0a+IXtfCDcmNNcdHSlz+zsznCXLKrsCyV+z21rzbw0JdIE1
         V+XciPIqLyzp+5BuukXb4B8vmhchwvld6NAAi0INUxB5kGOyq+p+RMKI/epGzQZhPmpL
         CENTaU9t23nP7DCv0spAFEeworFbXufg7SrkaVx1feq4xj7yWl04PAJguBt/AnL5tABL
         vRNFp43V6PvWJp8wmqMGr7xHCK7RO/z5xqB/NWYIuv2tg5Z8DMqjVh7GqrHwbiUauqT3
         hgYi+z2BvJqDCg5M5hrOM9artDZSvqAblE0mbDWSxnP8UQwNHnlYyXF0swTRky4ZhrUR
         79Rg==
X-Gm-Message-State: AOJu0YxiiJ2NH5o0gKV/2p4dMCgXqHzsZjf8HLG4HcGlgz4U9C4B7KgQ
	7+OEcobUpj2MF6UojVXcpftC92w57rALhJh1ZIvHgUiFvX26XUmsEYak7cJuiQ==
X-Google-Smtp-Source: AGHT+IHuslinA4m6pPWjYZ4+EYackuTruMDe5CoFzt76a27cqscJhBvDEE/JxdbZg/qfAMjeHbR1+Q==
X-Received: by 2002:a05:6602:4892:b0:7c8:5235:3141 with SMTP id ee18-20020a056602489200b007c852353141mr3529308iob.21.1709559004011;
        Mon, 04 Mar 2024 05:30:04 -0800 (PST)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id e21-20020a6b6915000000b007c7e0e8edc1sm1180657ioc.52.2024.03.04.05.30.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 05:30:03 -0800 (PST)
Message-ID: <e435724c-33ac-446a-81ed-fc31b56d6206@ieee.org>
Date: Mon, 4 Mar 2024 07:30:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
To: Mikhail Lobanov <m.lobanov@rosalinux.ru>,
 Rui Miguel Silva <rmfrfs@gmail.com>
References: <20240301190425.120605-1-m.lobanov@rosalinux.ru>
 <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
In-Reply-To: <07df4b96-70c2-41de-9d76-1deb80447a79@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 9A248400E5
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.44:from];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_TO(0.00)[rosalinux.ru,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: VE66P7SXRU7FMRN3SCK2Z67XGYJC3Q4F
X-Message-ID-Hash: VE66P7SXRU7FMRN3SCK2Z67XGYJC3Q4F
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix deref of NULL in __gb_lights_flash_brightness_set
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VE66P7SXRU7FMRN3SCK2Z67XGYJC3Q4F/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMy8yLzI0IDk6MzEgQU0sIEFsZXggRWxkZXIgd3JvdGU6DQo+IE9uIDMvMS8yNCAxOjA0IFBN
LCBNaWtoYWlsIExvYmFub3Ygd3JvdGU6DQo+PiBEZXJlZmVyZW5jZSBvZiBudWxsIHBvaW50ZXIg
aW4gdGhlIF9fZ2JfbGlnaHRzX2ZsYXNoX2JyaWdodG5lc3Nfc2V0IA0KPj4gZnVuY3Rpb24uDQo+
PiBBc3NpZ25pbmcgdGhlIGNoYW5uZWwgdGhlIHJlc3VsdCBvZiBleGVjdXRpbmcgdGhlIA0KPj4g
Z2V0X2NoYW5uZWxfZnJvbV9tb2RlIGZ1bmN0aW9uDQo+PiB3aXRob3V0IGNoZWNraW5nIGZvciBO
VUxMIG1heSByZXN1bHQgaW4gYW4gZXJyb3IuDQo+Pg0KPj4gRm91bmQgYnkgTGludXggVmVyaWZp
Y2F0aW9uIENlbnRlciAobGludXh0ZXN0aW5nLm9yZykgd2l0aCBTVkFDRS4NCj4gDQo+IEkgdGhp
bmsgdGhpcyBpcyBhbiBhY3R1YWwgcHJvYmxlbSBidXQgdGhpcyBtaWdodCBub3QgYmUgdGhlDQo+
IHJpZ2h0IGZpeC4NCg0KVGhlIGN1cnJlbnQgQVBJIGZvciBnZXRfY2hhbm5lbF9mcm9tX21vZGUo
KSBhbGxvd3MgYQ0KbnVsbCBwb2ludGVyIHRvIGJlIHJldHVybmVkLCBidXQgaXQgc2VlbXMgdGhh
dCB0aGVyZQ0KaXMgYXQgbGVhc3Qgb25lIGNhc2Ugd2hlcmUgdGhhdCBzaG91bGQgbmV2ZXIgaGFw
cGVuLg0KDQpnYl9saWdodHNfbGlnaHRfdjRsMl9yZWdpc3RlcigpIGlzc3VlcyBhIFdBUk5fT04o
KSBpZg0KZ2V0X2NoYW5uZWxfZnJvbV9tb2RlIHJldHVybnMgTlVMTCAoYW5kIHRoZW4gcHJvY2Vl
ZHMNCnRvIGRlcmVmZXJlbmNlIGl0KS4gIEkga25vdyBCVUdfT04oKSBpc24ndCBjb29sLCBidXQN
Cm1heWJlIHdlIHNob3VsZCBhdm9pZCB0aGUgZGVyZWZlcmVuY2UgdGhlcmUuDQoNCkFuZCBvdGhl
ciB0aGFuIF9fZ2JfbGlnaHRzX2ZsYXNoX2JyaWdodG5lc3Nfc2V0KCksDQphbGwgY2FsbGVycyBw
cm9wZXJseSBoYW5kbGUgYSBudWxsIHBvaW50ZXIgcmV0dXJuLg0KDQpSZWdhcmRsZXNzIG9mIHdo
YXQgSSBzYWlkIGJlZm9yZSBhYm91dCBjb21tZW50aW5nDQpmb3IgYW4gaW1wb3NzaWJsZSBzaXR1
YXRpb24sIEkgdGhpbmsgeW91ciBmaXggaXMNCmdlbmVyYWxseSB0aGUgcmlnaHQgdGhpbmcgdG8g
ZG8sIGJ1dCBpdCBzaG91bGQgbm90DQpyZXR1cm4gMCBpZiB0aGVyZSBpcyBubyB0b3JjaCBtb2Rl
IGNoYW5uZWwsIGl0DQpzaG91bGQgcmV0dXJuIC1FSU5WQUwgb3Igc29tZXRoaW5nLg0KDQpQbGVh
c2UgY29uc2lkZXIsIGFuZCBwb3N0IGEgbmV3IHZlcnNpb24uICBZb3UNCmNvdWxkIGluY29ycG9y
YXRlIGEgc2ltaWxhciBjaGFuZ2UgaW4gdGhlIHNhbWUNCnBhdGNoIGZvciBnYl9saWdodHNfbGln
aHRfdjRsMl9yZWdpc3RlcigpLg0KDQoJCQkJCS1BbGV4DQoNCg0KDQoNCj4gVGhlIHBvaW50IG9m
IHRoZSBjYWxsIHRvIGdldF9jaGFubmVsX2Zyb21fbW9kZSgpIGlzIHRvIGdldA0KPiB0aGUgYXR0
YWNoZWQgdG9yY2ggY2hhbm5lbCBpZiB0aGUgcGFzc2VkLWluIGNoYW5uZWwgaXMgYQ0KPiBmbGFz
aCBjaGFubmVsLsKgIEl0J3MgKnBvc3NpYmxlKiB0aGF0IGFueSBmbGFzaCBjaGFubmVsIHdpbGwN
Cj4gKmFsd2F5cyogaGF2ZSBhbiBhdHRhY2hlZCB0b3JjaCBjaGFubmVsLCBidXQgaWYgc28gdGhl
cmUNCj4gb3VnaHQgdG8gYmUgYSBjb21tZW50IHRvIHRoYXQgZWZmZWN0IG5lYXIgdGhpcyBjYWxs
ICh0bw0KPiBleHBsYWluIHdoeSB0aGVyZSdzIG5vIG5lZWQgZm9yIHRoZSBudWxsIHBvaW50ZXIg
Y2hlY2spLg0KPiANCj4gSSB0aGluayBEYW4ncyBzdWdnZXN0aW9uIHNob3VsZCBiZSBpbXBsZW1l
bnRlZCBhcyB3ZWxsLg0KPiBJdCdzIHBvc3NpYmxlIHRoZSBpbnRlbnRpb24gcmVhbGx5ICp3YXMq
IHRvIGhhdmUNCj4gZ2V0X2NoYW5uZWxfZnJvbV9tb2RlKCkgcmV0dXJuIHRoZSBvcmlnaW5hbCBj
aGFubmVsIHBvaW50ZXINCj4gaWYgdGhlcmUgaXMgbm8gYXR0YWNoZWQgY2hhbm5lbCB3aXRoIHRo
ZSByZXF1ZXN0ZWQgbW9kZS4NCj4gQnV0IGlmIHNvLCB0aGF0IHNob3VsZCBiZSBkb25lIGRpZmZl
cmVudGx5LsKgIEkuZS4sIERhbidzDQo+IHN1Z2dlc3Rpb24gc2hvdWxkIGJlIHRha2VuLCBhbmQg
dGhlIGNhbGxlcnMgc2hvdWxkIHVzZSB0aGUNCj4gcGFzc2VkLWluIGNoYW5uZWwgaWYgdGhlIGNh
bGwgdG8gZ2V0X2NoYW5uZWxfZnJvbV9tb2RlKCkNCj4gcmV0dXJucyBOVUxMLsKgIChJIGhvcGUg
dGhhdCdzIGNsZWFyLikNCj4gDQo+IFNvIGFueXdheSwgSSB0aGluayB0aGlzIChhbmQgRGFuJ3Mg
c3VnZ2VzdGlvbikgc2hvdWxkIGJlDQo+IGFkZHJlc3NlZCwgYnV0IHlvdXIgZml4IG1pZ2h0IG5v
dCBiZSBjb3JyZWN0Lg0KPiANCj4gUnVpLCBjYW4geW91IHBsZWFzZSBzaGVkIHNvbWUgbGlnaHQg
b24gdGhlIHNpdHVhdGlvbj8NCj4gDQo+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAtQWxleA0KPiANCj4+DQo+PiBGaXhlczogMjg3MGI1MmJhZTRjICgiZ3JleWJ1czog
bGlnaHRzOiBhZGQgbGlnaHRzIGltcGxlbWVudGF0aW9uIikNCj4+IFNpZ25lZC1vZmYtYnk6IE1p
a2hhaWwgTG9iYW5vdiA8bS5sb2Jhbm92QHJvc2FsaW51eC5ydT4NCj4+IC0tLQ0KPj4gwqAgZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYyB8IDkgKysrKysrKy0tDQo+PiDCoCAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jIA0KPj4gYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9saWdodC5jDQo+PiBpbmRleCA4N2QzNjk0OGM2MTAuLjkyOTUxNDM1MDk0NyAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMNCj4+ICsrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMNCj4+IEBAIC0xNDgsMTAgKzE0OCwxNSBA
QCBzdGF0aWMgaW50IA0KPj4gX19nYl9saWdodHNfZmxhc2hfYnJpZ2h0bmVzc19zZXQoc3RydWN0
IGdiX2NoYW5uZWwgKmNoYW5uZWwpDQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBHQl9DSEFOTkVMX01PREVfVE9SQ0gpOw0KPj4gwqDCoMKgwqDC
oCAvKiBGb3Igbm90IGZsYXNoIHdlIG5lZWQgdG8gY29udmVydCBicmlnaHRuZXNzIHRvIGludGVu
c2l0eSAqLw0KPj4gLcKgwqDCoCBpbnRlbnNpdHkgPSBjaGFubmVsLT5pbnRlbnNpdHlfdUEubWlu
ICsNCj4+ICsNCj4+ICvCoMKgwqAgaWYgKGNoYW5uZWwpIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBp
bnRlbnNpdHkgPSBjaGFubmVsLT5pbnRlbnNpdHlfdUEubWluICsNCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIChjaGFubmVsLT5pbnRlbnNpdHlfdUEuc3RlcCAqIGNoYW5uZWwtPmxlZC0+
YnJpZ2h0bmVzcyk7DQo+PiAtwqDCoMKgIHJldHVybiBfX2diX2xpZ2h0c19mbGFzaF9pbnRlbnNp
dHlfc2V0KGNoYW5uZWwsIGludGVuc2l0eSk7DQo+PiArwqDCoMKgwqDCoMKgwqAgcmV0dXJuIF9f
Z2JfbGlnaHRzX2ZsYXNoX2ludGVuc2l0eV9zZXQoY2hhbm5lbCwgaW50ZW5zaXR5KTsNCj4+ICvC
oMKgwqAgfQ0KPj4gKw0KPj4gK8KgwqDCoCByZXR1cm4gMDsNCj4+IMKgIH0NCj4+IMKgICNlbHNl
DQo+PiDCoCBzdGF0aWMgc3RydWN0IGdiX2NoYW5uZWwgKmdldF9jaGFubmVsX2Zyb21fY2Rldihz
dHJ1Y3QgbGVkX2NsYXNzZGV2IA0KPj4gKmNkZXYpDQo+IA0KDQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
