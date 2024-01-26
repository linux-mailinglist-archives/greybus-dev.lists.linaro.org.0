Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED5B83DD0E
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 16:08:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 400CD40C96
	for <lists+greybus-dev@lfdr.de>; Fri, 26 Jan 2024 15:08:22 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	by lists.linaro.org (Postfix) with ESMTPS id E208C3F975
	for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 15:08:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=QFrU9k4G;
	dmarc=pass (policy=quarantine) header.from=ieee.org;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.173 as permitted sender) smtp.mailfrom=elder@ieee.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-361aad48810so469175ab.3
        for <greybus-dev@lists.linaro.org>; Fri, 26 Jan 2024 07:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1706281697; x=1706886497; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TvgfzAhcnslUYcH0Du63qqL2ZhIEBQhQPLvfnd+sg0w=;
        b=QFrU9k4GG4pnMFryv8EH4WfYs3Lv5wLHiFjS/wu9XxbTn4Baxut5K3euar7xvBXrKc
         ZAZVuk6YtAvr77imc5hKztsTlmGJiPdDJyq9LIhpZpqJS8IY3duwSQ+sORvtpwBZzutH
         Ifvx980GW71gmU6ZyDfY1dO3tNswYtkUBLo6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706281697; x=1706886497;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TvgfzAhcnslUYcH0Du63qqL2ZhIEBQhQPLvfnd+sg0w=;
        b=H4Z8R4qMN2qk1zoYtt1U20szNcRdTf0MTu2/mSWH7AEBS+0KYoLCHoLk3evUt+Wowh
         4Y9QIe8FF58XAR+IzSCxMxbJfSsdb8UuoXN5sO1iUg7pGyBpqj/idxudaSHxCdTVO/9d
         gmxgj7SB1L//ntzekRpH4LZ4zVa6O4FQoDSbbMX6OogHYCrrteB64SiZ6r3nC9SSTCDG
         k2Z7zqpEIilTv8EP1VeLpdS1cTPfoBtjHw4PgP9GSVNhOOydxIcmIzXluTUFXC3pfbDr
         MJaNJU4GAnEpfls5+wtWOMQVxwcppIO8oQUwo/To7Gxd1EicZBYvR96bEc9OmXNYcMmR
         V5nw==
X-Gm-Message-State: AOJu0YwvzyBuxg5W2y/XI0Q/bLogcbHywvZ68R+o/egos6fdmwK5MSlN
	eAxx/qVH3j4yds1iwLfHPTAC62VwS/BWIeDXf7uYUf28/VLMgMuTkxeIdif7iw==
X-Google-Smtp-Source: AGHT+IHqjnaE5uZNvG3CYpn0yPtuBxKHcEQPeWd9PU4XTsIEFxzzz7EbPvmzTf2BvKucpdLYXKKr0Q==
X-Received: by 2002:a05:6e02:1a8e:b0:362:7f33:4988 with SMTP id k14-20020a056e021a8e00b003627f334988mr2150742ilv.26.1706281697226;
        Fri, 26 Jan 2024 07:08:17 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id a10-20020a056638018a00b0046f323505f8sm317507jaq.170.2024.01.26.07.08.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jan 2024 07:08:16 -0800 (PST)
Message-ID: <4980ba8e-081f-47c3-aa63-a972a266577a@ieee.org>
Date: Fri, 26 Jan 2024 09:08:15 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1706182805.git.u.kleine-koenig@pengutronix.de>
 <fb29256a7f2dcda5ae92119997ac717a6280911f.1706182805.git.u.kleine-koenig@pengutronix.de>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <fb29256a7f2dcda5ae92119997ac717a6280911f.1706182805.git.u.kleine-koenig@pengutronix.de>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E208C3F975
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.173:from];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[ieee.org:+]
Message-ID-Hash: RAG5VAAOIKENQMG5TQVF7MUD2Y4ZK4WN
X-Message-ID-Hash: RAG5VAAOIKENQMG5TQVF7MUD2Y4ZK4WN
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v5 106/111] staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RAG5VAAOIKENQMG5TQVF7MUD2Y4ZK4WN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMS8yNS8yNCA2OjEwIEFNLCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToNCj4gVGhpcyBwcmVw
YXJlcyB0aGUgZ3JleWJ1cyBwd20gZHJpdmVyIHRvIGZ1cnRoZXIgY2hhbmdlcyBvZiB0aGUgcHdt
IGNvcmUNCj4gb3V0bGluZWQgaW4gdGhlIGNvbW1pdCBpbnRyb2R1Y2luZyBkZXZtX3B3bWNoaXBf
YWxsb2MoKS4gVGhlcmUgaXMgbm8NCj4gaW50ZW5kZWQgc2VtYW50aWNhbCBjaGFuZ2UgYW5kIHRo
ZSBkcml2ZXIgc2hvdWxkIGJlaGF2ZSBhcyBiZWZvcmUuDQo+IA0KPiBBY2tlZC1ieTogR3JlZyBL
cm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9yZz4NCj4gU2lnbmVkLW9mZi1i
eTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCg0K
SSB0aGluayB5b3UgYXJlIGNoYW5naW5nIG1vcmUgdGhhbiB5b3UgbmVlZCB0byBpbiB0aGlzIGNv
ZGUuDQoNCj4gLS0tDQo+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgfCA3NSArKysr
KysrKysrLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyMCBp
bnNlcnRpb25zKCspLCA1NSBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9wd20uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQo+
IGluZGV4IDc1ZTA1MTg3OTFkOC4uYTkwZjQxYzM3NGRjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9w
d20uYw0KPiBAQCAtMTYsMjYgKzE2LDExIEBADQo+ICAgDQo+ICAgc3RydWN0IGdiX3B3bV9jaGlw
IHsNCj4gICAJc3RydWN0IGdiX2Nvbm5lY3Rpb24JKmNvbm5lY3Rpb247DQo+IC0JdTgJCQlwd21f
bWF4OwkvKiBtYXggcHdtIG51bWJlciAqLw0KPiAtCXN0cnVjdCBwd21fY2hpcAkJY2hpcDsNCj4g
ICB9Ow0KPiAgIA0KPiAgIHN0YXRpYyBpbmxpbmUgc3RydWN0IGdiX3B3bV9jaGlwICpwd21fY2hp
cF90b19nYl9wd21fY2hpcChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApDQo+ICAgew0KPiAtCXJldHVy
biBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IGdiX3B3bV9jaGlwLCBjaGlwKTsNCg0KTm93IEkg
dW5kZXJzdGFuZCB3aHkgeW91IHdlcmUgY2hhbmdpbmcgdGhlIHR5cGUgb2YgdGhlIGFyZ3VtZW50
DQpwYXNzZWQgdG8gYWxsIHRob3NlIGZ1bmN0aW9ucy4gIEkgc3RpbGwgZG9uJ3QgdGhpbmsgeW91
IG5lZWQNCnRvIGRvIHRoYXQgdGhvdWdoLg0KDQo+IC19DQo+IC0NCj4gLXN0YXRpYyBpbnQgZ2Jf
cHdtX2NvdW50X29wZXJhdGlvbihzdHJ1Y3QgZ2JfcHdtX2NoaXAgKnB3bWMpDQoNClRoaXMgZnVu
Y3Rpb24gbG9naWNhbGx5IGlzb2xhdGVzIGRvaW5nIHRoZSBvcGVyYXRpb24gZnJvbQ0KdGhlIHJl
c3Qgb2YgdGhlIGNvZGUuICBJJ2QgcmF0aGVyIHlvdSBub3QgZ2V0IHJpZCBvZiBpdC4NCg0KPiAt
ew0KPiAtCXN0cnVjdCBnYl9wd21fY291bnRfcmVzcG9uc2UgcmVzcG9uc2U7DQo+IC0JaW50IHJl
dDsNCj4gLQ0KPiAtCXJldCA9IGdiX29wZXJhdGlvbl9zeW5jKHB3bWMtPmNvbm5lY3Rpb24sIEdC
X1BXTV9UWVBFX1BXTV9DT1VOVCwNCj4gLQkJCQlOVUxMLCAwLCAmcmVzcG9uc2UsIHNpemVvZihy
ZXNwb25zZSkpOw0KPiAtCWlmIChyZXQpDQo+IC0JCXJldHVybiByZXQ7DQo+IC0JcHdtYy0+cHdt
X21heCA9IHJlc3BvbnNlLmNvdW50Ow0KPiAtCXJldHVybiAwOw0KPiArCXJldHVybiBwd21jaGlw
X2dldF9kcnZkYXRhKGNoaXApOw0KPiAgIH0NCj4gICANCj4gICBzdGF0aWMgaW50IGdiX3B3bV9h
Y3RpdmF0ZV9vcGVyYXRpb24oc3RydWN0IHB3bV9jaGlwICpjaGlwLCB1OCB3aGljaCkNCj4gQEAg
LTQ1LDkgKzMwLDYgQEAgc3RhdGljIGludCBnYl9wd21fYWN0aXZhdGVfb3BlcmF0aW9uKHN0cnVj
dCBwd21fY2hpcCAqY2hpcCwgdTggd2hpY2gpDQo+ICAgCXN0cnVjdCBnYnBoeV9kZXZpY2UgKmdi
cGh5X2RldjsNCj4gICAJaW50IHJldDsNCj4gICANCj4gLQlpZiAod2hpY2ggPiBwd21jLT5wd21f
bWF4KQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQ0KPiAgIAlyZXF1ZXN0LndoaWNoID0gd2hp
Y2g7DQo+ICAgDQo+ICAgCWdicGh5X2RldiA9IHRvX2dicGh5X2Rldihwd21jaGlwX3BhcmVudChj
aGlwKSk7DQo+IEBAIC03MSw5ICs1Myw2IEBAIHN0YXRpYyBpbnQgZ2JfcHdtX2RlYWN0aXZhdGVf
b3BlcmF0aW9uKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwNCj4gICAJc3RydWN0IGdicGh5X2Rldmlj
ZSAqZ2JwaHlfZGV2Ow0KPiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAtCWlmICh3aGljaCA+IHB3bWMt
PnB3bV9tYXgpDQo+IC0JCXJldHVybiAtRUlOVkFMOw0KPiAtDQo+ICAgCXJlcXVlc3Qud2hpY2gg
PSB3aGljaDsNCj4gICANCj4gICAJZ2JwaHlfZGV2ID0gdG9fZ2JwaHlfZGV2KHB3bWNoaXBfcGFy
ZW50KGNoaXApKTsNCj4gQEAgLTk3LDkgKzc2LDYgQEAgc3RhdGljIGludCBnYl9wd21fY29uZmln
X29wZXJhdGlvbihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsDQo+ICAgCXN0cnVjdCBnYnBoeV9kZXZp
Y2UgKmdicGh5X2RldjsNCj4gICAJaW50IHJldDsNCj4gICANCj4gLQlpZiAod2hpY2ggPiBwd21j
LT5wd21fbWF4KQ0KPiAtCQlyZXR1cm4gLUVJTlZBTDsNCj4gLQ0KPiAgIAlyZXF1ZXN0LndoaWNo
ID0gd2hpY2g7DQo+ICAgCXJlcXVlc3QuZHV0eSA9IGNwdV90b19sZTMyKGR1dHkpOw0KPiAgIAly
ZXF1ZXN0LnBlcmlvZCA9IGNwdV90b19sZTMyKHBlcmlvZCk7DQo+IEBAIC0xMjUsOSArMTAxLDYg
QEAgc3RhdGljIGludCBnYl9wd21fc2V0X3BvbGFyaXR5X29wZXJhdGlvbihzdHJ1Y3QgcHdtX2No
aXAgKmNoaXAsDQo+ICAgCXN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldjsNCj4gICAJaW50
IHJldDsNCj4gICANCj4gLQlpZiAod2hpY2ggPiBwd21jLT5wd21fbWF4KQ0KPiAtCQlyZXR1cm4g
LUVJTlZBTDsNCj4gLQ0KPiAgIAlyZXF1ZXN0LndoaWNoID0gd2hpY2g7DQo+ICAgCXJlcXVlc3Qu
cG9sYXJpdHkgPSBwb2xhcml0eTsNCj4gICANCj4gQEAgLTE1MSw5ICsxMjQsNiBAQCBzdGF0aWMg
aW50IGdiX3B3bV9lbmFibGVfb3BlcmF0aW9uKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgdTggd2hp
Y2gpDQo+ICAgCXN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldjsNCj4gICAJaW50IHJldDsN
Cj4gICANCj4gLQlpZiAod2hpY2ggPiBwd21jLT5wd21fbWF4KQ0KPiAtCQlyZXR1cm4gLUVJTlZB
TDsNCj4gLQ0KPiAgIAlyZXF1ZXN0LndoaWNoID0gd2hpY2g7DQo+ICAgDQo+ICAgCWdicGh5X2Rl
diA9IHRvX2dicGh5X2Rldihwd21jaGlwX3BhcmVudChjaGlwKSk7DQo+IEBAIC0xNzYsOSArMTQ2
LDYgQEAgc3RhdGljIGludCBnYl9wd21fZGlzYWJsZV9vcGVyYXRpb24oc3RydWN0IHB3bV9jaGlw
ICpjaGlwLCB1OCB3aGljaCkNCj4gICAJc3RydWN0IGdicGh5X2RldmljZSAqZ2JwaHlfZGV2Ow0K
PiAgIAlpbnQgcmV0Ow0KPiAgIA0KPiAtCWlmICh3aGljaCA+IHB3bWMtPnB3bV9tYXgpDQo+IC0J
CXJldHVybiAtRUlOVkFMOw0KPiAtDQo+ICAgCXJlcXVlc3Qud2hpY2ggPSB3aGljaDsNCj4gICAN
Cj4gICAJcmV0ID0gZ2Jfb3BlcmF0aW9uX3N5bmMocHdtYy0+Y29ubmVjdGlvbiwgR0JfUFdNX1RZ
UEVfRElTQUJMRSwNCj4gQEAgLTI2MywzOCArMjMwLDM3IEBAIHN0YXRpYyBpbnQgZ2JfcHdtX3By
b2JlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldiwNCj4gICAJc3RydWN0IGdiX2Nvbm5l
Y3Rpb24gKmNvbm5lY3Rpb247DQo+ICAgCXN0cnVjdCBnYl9wd21fY2hpcCAqcHdtYzsNCj4gICAJ
c3RydWN0IHB3bV9jaGlwICpjaGlwOw0KPiArCXN0cnVjdCBnYl9wd21fY291bnRfcmVzcG9uc2Ug
cmVzcG9uc2U7DQo+ICAgCWludCByZXQ7DQo+ICAgDQo+IC0JcHdtYyA9IGt6YWxsb2Moc2l6ZW9m
KCpwd21jKSwgR0ZQX0tFUk5FTCk7DQo+IC0JaWYgKCFwd21jKQ0KPiAtCQlyZXR1cm4gLUVOT01F
TTsNCj4gLQ0KPiAgIAljb25uZWN0aW9uID0gZ2JfY29ubmVjdGlvbl9jcmVhdGUoZ2JwaHlfZGV2
LT5idW5kbGUsDQo+ICAgCQkJCQkgIGxlMTZfdG9fY3B1KGdicGh5X2Rldi0+Y3BvcnRfZGVzYy0+
aWQpLA0KPiAgIAkJCQkJICBOVUxMKTsNCj4gLQlpZiAoSVNfRVJSKGNvbm5lY3Rpb24pKSB7DQo+
IC0JCXJldCA9IFBUUl9FUlIoY29ubmVjdGlvbik7DQo+IC0JCWdvdG8gZXhpdF9wd21jX2ZyZWU7
DQo+ICsJaWYgKElTX0VSUihjb25uZWN0aW9uKSkNCj4gKwkJcmV0dXJuIFBUUl9FUlIoY29ubmVj
dGlvbik7DQoNClRoaXMgaXMgYWN0dWFsbHkgYSBidWcgZml4IHRoYXQgc2hvdWxkIHByb2JhYmx5
IGJlIGRvbmUNCnNlcGFyYXRlbHksIHByaW9yIHRvIHRoaXMgc2VyaWVzLg0KDQo+ICsNCj4gKwly
ZXQgPSBnYl9vcGVyYXRpb25fc3luYyhwd21jLT5jb25uZWN0aW9uLCBHQl9QV01fVFlQRV9QV01f
Q09VTlQsDQo+ICsJCQkJTlVMTCwgMCwgJnJlc3BvbnNlLCBzaXplb2YocmVzcG9uc2UpKTsNCj4g
KwlpZiAocmV0KQ0KPiArCQlnb3RvIGV4aXRfY29ubmVjdGlvbl9kZXN0cm95Ow0KDQpZb3UgZGlk
bid0IG1lbnRpb24gaW4geW91ciBoZWFkZXIgdGhhdCB5b3Ugd2VyZSBnZXR0aW5nIHJpZA0Kb2Yg
Z2JfcHdtX2NvdW50X29wZXJhdGlvbigpLCBhbmQgYXMgSSBzYWlkIGFib3ZlLCBJIGRvbid0DQp0
aGluayB5b3Ugc2hvdWxkLiAgSnVzdCBrZWVwIHRoZSBleGlzdGluZyBjb2RlIGFzIGl0IHdhcw0K
YW5kIGZvY3VzIG9ubHkgb24geW91ciBjb252ZXJzaW9uIHRvIGF0dGFjaGluZyBkcml2ZXIgZGF0
YQ0KdG8gdGhlIFBXTSBjaGlwIHN0cnVjdHVyZS4NCg0KPiArDQo+ICsJY2hpcCA9IGRldm1fcHdt
Y2hpcF9hbGxvYygmZ2JwaHlfZGV2LT5kZXYsIHJlc3BvbnNlLmNvdW50LCBzaXplb2YoKnB3bWMp
KTsNCj4gKwlpZiAoSVNfRVJSKGNoaXApKSB7DQo+ICsJCXJldCA9IFBUUl9FUlIoY2hpcCk7DQo+
ICsJCWdvdG8gZXhpdF9jb25uZWN0aW9uX2Rlc3Ryb3k7DQo+ICAgCX0NCj4gICANCj4gKwlwd21j
ID0gcHdtX2NoaXBfdG9fZ2JfcHdtX2NoaXAoY2hpcCk7DQo+ICAgCXB3bWMtPmNvbm5lY3Rpb24g
PSBjb25uZWN0aW9uOw0KPiArDQo+ICAgCWdiX2Nvbm5lY3Rpb25fc2V0X2RhdGEoY29ubmVjdGlv
biwgcHdtYyk7DQo+IC0JZ2JfZ2JwaHlfc2V0X2RhdGEoZ2JwaHlfZGV2LCBwd21jKTsNCj4gKwln
Yl9nYnBoeV9zZXRfZGF0YShnYnBoeV9kZXYsIGNoaXApOw0KDQpJJ20gcHJldHR5IHN1cmUgZHJp
dmVyIGRhdGEgc2hvdWxkIHN0aWxsIGJlIHRoZSBHcmV5YnVzDQpzdHJ1Y3R1cmUsIG90aGVyd2lz
ZSB5b3UncmUgcmVhbGx5IGNoYW5naW5nIHRoZSB3YXkgdGhpcw0Kd29ya3MgKG1vc3QgbGlrZWx5
IGluIGEgd2F5IHRoYXQncyBkaWZmZXJlbnQgZnJvbSBvdGhlcg0KR3JleWJ1cyBkcml2ZXJzLg0K
DQo+ICAgDQo+ICAgCXJldCA9IGdiX2Nvbm5lY3Rpb25fZW5hYmxlKGNvbm5lY3Rpb24pOw0KPiAg
IAlpZiAocmV0KQ0KPiAgIAkJZ290byBleGl0X2Nvbm5lY3Rpb25fZGVzdHJveTsNCj4gICANCj4g
LQkvKiBRdWVyeSBudW1iZXIgb2YgcHdtcyBwcmVzZW50ICovDQo+IC0JcmV0ID0gZ2JfcHdtX2Nv
dW50X29wZXJhdGlvbihwd21jKTsNCj4gLQlpZiAocmV0KQ0KPiAtCQlnb3RvIGV4aXRfY29ubmVj
dGlvbl9kaXNhYmxlOw0KPiAtDQo+IC0JY2hpcCA9ICZwd21jLT5jaGlwOw0KPiAtDQo+IC0JY2hp
cC0+ZGV2ID0gJmdicGh5X2Rldi0+ZGV2Ow0KPiAgIAljaGlwLT5vcHMgPSAmZ2JfcHdtX29wczsN
Cj4gLQljaGlwLT5ucHdtID0gcHdtYy0+cHdtX21heCArIDE7DQo+ICAgDQo+ICAgCXJldCA9IHB3
bWNoaXBfYWRkKGNoaXApOw0KPiAgIAlpZiAocmV0KSB7DQo+IEBAIC0zMTAsMTQgKzI3NiwxMyBA
QCBzdGF0aWMgaW50IGdiX3B3bV9wcm9iZShzdHJ1Y3QgZ2JwaHlfZGV2aWNlICpnYnBoeV9kZXYs
DQo+ICAgCWdiX2Nvbm5lY3Rpb25fZGlzYWJsZShjb25uZWN0aW9uKTsNCj4gICBleGl0X2Nvbm5l
Y3Rpb25fZGVzdHJveToNCj4gICAJZ2JfY29ubmVjdGlvbl9kZXN0cm95KGNvbm5lY3Rpb24pOw0K
PiAtZXhpdF9wd21jX2ZyZWU6DQo+IC0Ja2ZyZWUocHdtYyk7DQo+ICAgCXJldHVybiByZXQ7DQo+
ICAgfQ0KPiAgIA0KPiAgIHN0YXRpYyB2b2lkIGdiX3B3bV9yZW1vdmUoc3RydWN0IGdicGh5X2Rl
dmljZSAqZ2JwaHlfZGV2KQ0KPiAgIHsNCj4gLQlzdHJ1Y3QgZ2JfcHdtX2NoaXAgKnB3bWMgPSBn
Yl9nYnBoeV9nZXRfZGF0YShnYnBoeV9kZXYpOw0KPiArCXN0cnVjdCBwd21fY2hpcCAqY2hpcCA9
IGdiX2dicGh5X2dldF9kYXRhKGdicGh5X2Rldik7DQo+ICsJc3RydWN0IGdiX3B3bV9jaGlwICpw
d21jID0gcHdtX2NoaXBfdG9fZ2JfcHdtX2NoaXAoY2hpcCk7DQo+ICAgCXN0cnVjdCBnYl9jb25u
ZWN0aW9uICpjb25uZWN0aW9uID0gcHdtYy0+Y29ubmVjdGlvbjsNCj4gICAJaW50IHJldDsNCj4g
ICANCj4gQEAgLTMyNSw3ICsyOTAsNyBAQCBzdGF0aWMgdm9pZCBnYl9wd21fcmVtb3ZlKHN0cnVj
dCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldikNCj4gICAJaWYgKHJldCkNCj4gICAJCWdicGh5X3J1
bnRpbWVfZ2V0X25vcmVzdW1lKGdicGh5X2Rldik7DQo+ICAgDQo+IC0JcHdtY2hpcF9yZW1vdmUo
JnB3bWMtPmNoaXApOw0KPiArCXB3bWNoaXBfcmVtb3ZlKGNoaXApOw0KPiAgIAlnYl9jb25uZWN0
aW9uX2Rpc2FibGUoY29ubmVjdGlvbik7DQo+ICAgCWdiX2Nvbm5lY3Rpb25fZGVzdHJveShjb25u
ZWN0aW9uKTsNCj4gICAJa2ZyZWUocHdtYyk7DQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3Jl
eWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
