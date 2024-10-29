Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A939B4E0B
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Oct 2024 16:31:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8A8CF445ED
	for <lists+greybus-dev@lfdr.de>; Tue, 29 Oct 2024 15:31:58 +0000 (UTC)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	by lists.linaro.org (Postfix) with ESMTPS id 889693F5A9
	for <greybus-dev@lists.linaro.org>; Tue, 29 Oct 2024 15:31:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=RnGtgKfr;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.210.41 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-71850708dc9so3282303a34.0
        for <greybus-dev@lists.linaro.org>; Tue, 29 Oct 2024 08:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1730215877; x=1730820677; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v8XpDDbBmci2FjmulVvCwTgF0HqY66ePAkYl4ZFsXC0=;
        b=RnGtgKfrPRk+iaRYayh1zaVa5yN/jCpSky+qMaH4U3r1bSXSpb2hFTwlLIROkTGKvc
         6PH4aoYTDerQbXX9zP6v9+/tyafSNM75Z820U99TxZ4FNMH6mGkgQAfFQHDc5lfbxeMI
         ddXq9c7mawgcsB0dNfgo9oisprI7WEt+P77rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730215877; x=1730820677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v8XpDDbBmci2FjmulVvCwTgF0HqY66ePAkYl4ZFsXC0=;
        b=aTW1iJNjNIPIAVUtL4IUX7upHc90TuIqctc41Rar7G/CRaOUg+v7pgBOA6oeU7sTDy
         kJO9qfja93htbvRikDWPx5TkVuauH63VJnbaeswWntDaC3wr70FFtJKjrAhkHkt+ZVSQ
         gDy3JfFAc9kEoGmLq8E9BcmC3wqnCQOpPkegjQVY8kARl997//NO/+9PVtzEqufzjo58
         nedsEDXdbU4b+bIBLPYVIA9gRKXszipuDxY8668aYmQROo7M+EYqTR5j9tpnCCZtPAg5
         IuksVGQhvMihtv9sUTzNLMscGsOYiyck+fW7dTQ9UDte9yUfwPi0hsAG8cbU6sMNlTM0
         kBAA==
X-Forwarded-Encrypted: i=1; AJvYcCW6+eHn6eO2B9FgFNfdj5dMha9Aq/1EL8JI4/ICf08zpB1hKOs+PmmpItfXZSPtz3rK/epk6X6DQ7aqvA==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx7JVFLrgc9Ti+EBfbm+C3fOgcSf1o12sZ7P/of8HaoFXozvAAs
	ZLRDWEFXBmv6dKuozAKdaBN9ZNZsWFNM8wMdgMOhl63LB2UM8n64DhlLnoPY2A==
X-Google-Smtp-Source: AGHT+IGm0yO5TGszk2aCqpJkNTyVy5/R7djSE8feo7tRfIGqXLedZcGXnsIRpDCtOp05Jz3Izf7wiA==
X-Received: by 2002:a05:6830:6383:b0:710:fa7e:e002 with SMTP id 46e09a7af769-71867f195d0mr13996945a34.5.1730215876789;
        Tue, 29 Oct 2024 08:31:16 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.googlemail.com with ESMTPSA id 46e09a7af769-718616134ffsm2213542a34.28.2024.10.29.08.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Oct 2024 08:31:15 -0700 (PDT)
Message-ID: <01caa8c5-5d7e-449c-a00d-28c81f453e41@ieee.org>
Date: Tue, 29 Oct 2024 10:31:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "yiyang (D)" <yiyang13@huawei.com>,
 Dan Carpenter <dan.carpenter@linaro.org>
References: <20241026081153.2649890-1-yiyang13@huawei.com>
 <9ada17f8-7b3a-4bf7-8fc8-f40bf67adb33@stanley.mountain>
 <a9cfb5e6-33f4-495c-b329-7e97f626d1a1@ieee.org>
 <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
Content-Language: en-US
From: Alex Elder <elder@ieee.org>
In-Reply-To: <541d16d3-ea2e-d956-5dd9-613ede430fe5@huawei.com>
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.41:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_CC(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,projectara.com,lists.linaro.org,lists.linux.dev,huawei.com];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.210.41:from];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 889693F5A9
X-Spamd-Bar: ------
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LHCFJ5OL3FM7LYMKAXF6UMLEQWHLATQL
X-Message-ID-Hash: LHCFJ5OL3FM7LYMKAXF6UMLEQWHLATQL
X-Mailman-Approved-At: Tue, 29 Oct 2024 15:31:55 +0000
CC: johan@kernel.org, elder@kernel.org, ankov_svetlin@projectara.com, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, wangweiyang2@huawei.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: fix possible null-ptr-deref in gb_audio_manager_get_module()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LHCFJ5OL3FM7LYMKAXF6UMLEQWHLATQL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMTAvMjgvMjQgOTo1OCBQTSwgeWl5YW5nIChEKSB3cm90ZToNCj4gDQo+IE9uIDIwMjQvMTAv
MjggMjA6NDYsIEFsZXggRWxkZXIgd3JvdGU6DQo+PiBPbiAxMC8yNi8yNCA1OjUwIEFNLCBEYW4g
Q2FycGVudGVyIHdyb3RlOg0KPj4+IE9uIFNhdCwgT2N0IDI2LCAyMDI0IGF0IDA4OjExOjUzQU0g
KzAwMDAsIFlpIFlhbmcgd3JvdGU6DQo+Pj4+IFRoZSBnYl9hdWRpb19tYW5hZ2VyX2dldF9tb2R1
bGUoKSBpcyBFWFBPUlRfU1lNQk9MLCBhbmQgd2lsbCByZXR1cm4gDQo+Pj4+IE5VTEwNCj4+Pj4g
d2hlbiBpbmNvbWluZyBwYXJhbWV0ZXIgaWQgPCAwLCBmaXggcG9zc2libGUgbnVsbC1wdHItZGVy
ZWYgYnkgYWRkIA0KPj4+PiBjaGVjaw0KPj4+PiBmb3IgcmV0dXJuIHZhbHVlLg0KPj4+Pg0KPj4+
PiBGaXhlczogOGRiMDA3MzZkMzY1ICgiZ3JleWJ1czogYXVkaW86IEFkZCBBdWRpbyBNYW5hZ2Vy
IikNCj4+Pj4gU2lnbmVkLW9mZi1ieTogWWkgWWFuZyA8eWl5YW5nMTNAaHVhd2VpLmNvbT4NCj4+
Pg0KPj4+IFdoZXJlIGlzIGdiX2F1ZGlvX21hbmFnZXJfZ2V0X21vZHVsZSgpIGNhbGxlZCBmcm9t
P8KgIFNvIGZhciBhcyBJIGNhbiANCj4+PiBzZWUgaXQncw0KPj4+IG5ldmVyIHVzZWQuwqAgV2h5
IG5vdCBqdXN0IGRlbGV0ZSBpdD8NCj4+Pg0KPj4+IHJlZ2FyZHMsDQo+Pj4gZGFuIGNhcnBlbnRl
cg0KPj4NCj4+IEkgYWdyZWUgd2l0aCB0aGlzLsKgIEkgc3VzcGVjdGVkIGFsbCBjYWxsZXJzIG1p
Z2h0IGhhdmUgZ3VhcmFudGVlZA0KPj4gdGhhdCB0aGUgImlkIiB2YWx1ZSBwYXNzZWQgd291bGQg
YmUgYWx3YXlzIHZhbGlkLCBidXQuLi4gdGhlcmUgYXJlDQo+PiBubyBjYWxsZXJzLg0KPj4NCj4+
IEl0IGlzIGEgc2ltcGxlIGZ1bmN0aW9uLCBhbmQgY291bGQgYmUgYWRkZWQgYmFjayBhZ2FpbiBp
ZiBpdCBpcw0KPj4gbmVlZGVkIGluIHRoZSBmdXR1cmUgKHBvc3NpYmx5IGV2ZW4gYnkgcmV2ZXJ0
aW5nIHRoZSBjb21taXQgdGhhdA0KPj4gcmVtb3ZlcyBpdCkuDQo+Pg0KPj4gSWYgeW91IGRvIHRo
aXMsIHBsZWFzZSByZW1vdmUgZ2JfYXVkaW9fcHV0X21vZHVsZSgpIGluIHRoZSBzYW1lDQo+PiBw
YXRjaC7CoCBJdCB0b28gaGFzIG5vIGNhbGxlcnMuDQo+Pg0KPj4gVGhhbmsgeW91Lg0KPj4NCj4+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLUFsZXgNCj4+DQo+PiAu
DQo+IA0KPiBJIHRyaWVkIHRvIGZpbmQgdGhlIGNhbGxlciBiZWZvcmUgSSBtb2RpZmllZCBpdCwg
YnV0IHVuZm9ydHVuYXRlbHkgSSANCj4gZGlkbid0IGZpbmQgdGhlIGNhbGxlciwgc28gSSBzdXNw
ZWN0IHNvbWUgbm9uLWtlcm5lbCBkcml2ZXIgY29kZSB3aWxsIA0KPiB0cnkgdG8gY2FsbCB0aGlz
IGZ1bmN0aW9ucy4NCj4gDQo+IEkganVzdCBmb3VuZCB0aGlzIHByb2JsZW0gd2hpbGUgcmVhZGlu
ZyB0aGUgY29kZSBhbmQgSSdtIG5vdCBzdXJlIGlmIEkgDQo+IHNob3VsZCByZW1vdmUgdGhlIGZ1
bmN0aW9uLg0KDQpUaGUgTGludXgga2VybmVsIGlzIGEgdW5pZmllZCB3aG9sZS4gIFRoaXMgbWVh
bnMgdGhhdCBpZiB5b3UgaGF2ZSB0aGUNCmN1cnJlbnQgdmVyc2lvbiBvZiB0aGUga2VybmVsIHNv
dXJjZSBjb2RlLCBpdCB3aWxsIGluY29ycG9yYXRlICphbGwqDQpwb3NzaWJsZSBjYWxsZXJzIG9m
IGEgZ2l2ZW4gZnVuY3Rpb24gKG9yIG1vcmUgZ2VuZXJhbGx5LCByZWZlcmVuY2VzIHRvDQpvciB1
c2VycyBvZiBhIGdpdmVuIHN5bWJvbCkuICBUaGUgb25seSBwb3NzaWJsZSBleGNlcHRpb24gbWln
aHQgYmUNCm91dC1vZi10cmVlIGNvZGUsIGJ1dCB0aGF0IGlzIG5vdCBvdXIgY29uY2Vybi4NCg0K
SWYgeW91IGNhbid0IGZpbmQgYW55IGNhbGxlcnMsIG5vbmUgZXhpc3QuICBJdCdzIGZpbmUgdG8g
cHJvcG9zZQ0KcmVtb3ZpbmcgdGhlIGZ1bmN0aW9uLiAgQW5kIGlmIHRoZSBtYWludGFpbmVyIGFj
Y2VwdHMgaXQsIGl0J3MgYQ0KZ29vZCBjaGFuZ2UuDQoNCgkJCQkJLUFsZXgNCg0KPiANCj4gcmVn
YXJkcywNCj4gWWl5YW5nDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVh
dmVAbGlzdHMubGluYXJvLm9yZwo=
