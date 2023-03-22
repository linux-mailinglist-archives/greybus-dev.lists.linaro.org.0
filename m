Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEAB6C512E
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 17:49:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 94D973F09C
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 16:49:46 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	by lists.linaro.org (Postfix) with ESMTPS id 6A0A03E957
	for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 10:16:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=BS3B+GSS;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.51 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id cy23so70517516edb.12
        for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 03:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679480208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jpDA9uUcZvzGnD9pLQgn6VIYHngYXS5+gJ+ISFCbQ4k=;
        b=BS3B+GSSEJ0WqKPR/Ct8/TRtsDaddf81nnqiToflDBOwCObEAzue/bZloBZi6Z8T3a
         k2zTRNcyJKTzaWUNeLHH3HsejObgT34xz7bkSY+AecBkPYsEPgvXO/PS5gObiyhAxdAa
         y6W3BrbODyb1e07sODfcNIOrMw0mh6I2pmfIczHnxYaL9mnyjduX/7U4j3Q2PJtYLQJp
         Atk+N0Rlobkd0WvizQ4gOE12XkvLOLxN1WJPjE4mFvX0JVMNKNUhfom/BSJKhzaonz8N
         HH4yArtKlQOR08pyd+trd+dCllFDVuGrccSnzWiW5DnAiCJ+JtapdWKTTlDtWw6TdhsP
         M7UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679480208;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jpDA9uUcZvzGnD9pLQgn6VIYHngYXS5+gJ+ISFCbQ4k=;
        b=FwcnGF8kleTXlUNMZ5TNX5nVjjnD0G0l+KmiheR1q2xmAnO5fQhH1LECmJ4G9McauT
         Y4VPeHbO8JZ2bm1pqKpReEaYCaE4zhHFZHKUsOV3ODg/ocPM/Lp7Z1L+GbVQlpE3mSSK
         hi670nGuv6A7p4hAGGiODS8Cwl9rtUdrnGZ2iqcuMXJ56Q0tweVlwtA57GGj3bzbD+ZL
         xOXcLzLaDMzkmN2xZZm2HRpm4F3advKSYG7jIQpy7N0EGwaX0tDnB6HyxjkrirYtT6QT
         cFgU4KbuvqgRZVvtG3NU3j1vp9QyVVGGXkc0M6ag3tnkM6qOLDwaY1+9TXrvHnXEzOzl
         YdOA==
X-Gm-Message-State: AO0yUKWFhT4tmyGOpm8zlJ8BHCw1uVFJTGIWnXRf9gg1PNpG8weuzdkl
	/mohuVLhBJ7k7lg5rSnnlWw=
X-Google-Smtp-Source: AK7set9piLYg6v1I/RemGzk8hcZOPEJZSGDct+Dz8Mm8jN4Nphd/jZq6O7eXIb6Xzl+L7wPOqJ+lpw==
X-Received: by 2002:aa7:d3d4:0:b0:4fb:78a0:eabf with SMTP id o20-20020aa7d3d4000000b004fb78a0eabfmr5776830edr.29.1679480208273;
        Wed, 22 Mar 2023 03:16:48 -0700 (PDT)
Received: from [192.168.1.16] ([41.233.203.65])
        by smtp.gmail.com with ESMTPSA id b26-20020a170906195a00b00930a4e5b46bsm6930377eje.211.2023.03.22.03.16.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 03:16:47 -0700 (PDT)
Message-ID: <9e339ec0-d244-ea22-d9d8-70a76ac1bc0a@gmail.com>
Date: Wed, 22 Mar 2023 12:16:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Julia Lawall <julia.lawall@inria.fr>
References: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
 <369edb35-b93b-301c-fcef-8e64e5d4a122@inria.fr>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <369edb35-b93b-301c-fcef-8e64e5d4a122@inria.fr>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6A0A03E957
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.208.51:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail-ed1-f51.google.com:helo,mail-ed1-f51.google.com:rdns];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.51:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	RCVD_COUNT_TWO(0.00)[2];
	TAGGED_RCPT(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: P6PO6O6JN5U2VRCUXP6EIJWSENZGS5FD
X-Message-ID-Hash: P6PO6O6JN5U2VRCUXP6EIJWSENZGS5FD
X-Mailman-Approved-At: Wed, 22 Mar 2023 16:49:37 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/P6PO6O6JN5U2VRCUXP6EIJWSENZGS5FD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZotmi4oCPL9mj4oCPL9mi2aDZotmjINmh2aI62aHZpCwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBXZWQsIDIyIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
UmVtb3ZlIHVubmVjZXNzYXJ5IGJsYW5rIGxpbmUgYmVmb3JlIHN0cnVjdCBhcyByZXBvcnRlZA0K
Pj4gYnkgY2hlY2twYXRjaDoNCj4+DQo+PiAiIENIRUNLOiBQbGVhc2UgZG9uJ3QgdXNlIG11bHRp
cGxlIGJsYW5rIGxpbmVzIg0KPiBTaW5jZSB0aGVyZSBpcyBubyB2WCBpbmRpY2F0b3IsIG9uZSBk
b2Vzbid0IGtub3cgdGhhdCB0aGlzIHJlcGxhY2VzIHNvbWUNCj4gcHJldmlvdXMgcGF0Y2hlcy4N
Cg0KeWVzLCBzb3JyeSBJIG1pc3NlZCBpdCBiZWNhdXNlIEkgZHJvcHBlZCB0aGUgcHJldmlvdXMg
Y29tbWl0cywgSSB3aWxsIA0KYWRkIGl0Lg0KDQoNCk1lbm5hDQoNCj4NCj4ganVsaWENCj4NCj4+
IFNpZ25lZC1vZmYtYnk6IE1lbm5hIE1haG1vdWQgPGVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwu
Y29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfYXV0aGVu
dGljYXRpb24uaCB8IDEgLQ0KPj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyAgICAg
ICAgICAgICAgICAgICAgfCAxIC0NCj4+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyIGRlbGV0aW9ucygt
KQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX2F1
dGhlbnRpY2F0aW9uLmggYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX2F1dGhlbnRp
Y2F0aW9uLmgNCj4+IGluZGV4IDdlZGM3Mjk1YjdhYi4uNDhiNGE5Nzk0ZDNjIDEwMDY0NA0KPj4g
LS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19hdXRoZW50aWNhdGlvbi5oDQo+
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX2F1dGhlbnRpY2F0aW9uLmgN
Cj4+IEBAIC00MSw3ICs0MSw2IEBADQo+PiAgICNkZWZpbmUgQ0FQX0FVVEhfUkVTVUxUX0NSX05P
X0tFWQkweDAzDQo+PiAgICNkZWZpbmUgQ0FQX0FVVEhfUkVTVUxUX0NSX1NJR19GQUlMCTB4MDQN
Cj4+DQo+PiAtDQo+PiAgIC8qIElPQ1RMIHN1cHBvcnQgKi8NCj4+ICAgc3RydWN0IGNhcF9pb2Nf
Z2V0X2VuZHBvaW50X3VpZCB7DQo+PiAgIAlfX3U4CQkJdWlkWzhdOw0KPj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
cHdtLmMNCj4+IGluZGV4IDNmZGExNzIyMzlkMi4uMjZkMzllMDhjM2I2IDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3B3bS5jDQo+PiBAQCAtMjQsNyArMjQsNiBAQCBzdHJ1Y3QgZ2JfcHdtX2NoaXAg
ew0KPj4gICAjZGVmaW5lIHB3bV9jaGlwX3RvX2diX3B3bV9jaGlwKGNoaXApIFwNCj4+ICAgCWNv
bnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgZ2JfcHdtX2NoaXAsIGNoaXApDQo+Pg0KPj4gLQ0KPj4g
ICBzdGF0aWMgaW50IGdiX3B3bV9jb3VudF9vcGVyYXRpb24oc3RydWN0IGdiX3B3bV9jaGlwICpw
d21jKQ0KPj4gICB7DQo+PiAgIAlzdHJ1Y3QgZ2JfcHdtX2NvdW50X3Jlc3BvbnNlIHJlc3BvbnNl
Ow0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4NCj4+DQo+Pg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBn
cmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
