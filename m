Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 13DA96C39D7
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2120D3EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:03 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	by lists.linaro.org (Postfix) with ESMTPS id C60D63E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 16:15:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=hwuVkLBh;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.43 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id y4so38164077edo.2
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679242558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0xI1vkDtYqpmWRObk2pbvA9d3XpNb4E7+cR3cNxuUGM=;
        b=hwuVkLBhnHrpbY9ZY5W98JgUaQyt8diEeixiUjLgrDWtTr2KFyjaT4krv8nXhbWzFi
         ZiHEyE9tzE1XYJbObJNr4vaDeJWxLFZ7rWT2Iav0uiYji49M8Og9RHmQVu/4k58oXgSl
         cO1/suFFf0BiHWRl6CwUwcbggTtR/aPafz6rL48WdisXTLMbS4XBo8VcjlRthw3VYbSI
         ODAp2RRbuGvn1KL7urCirBAvQBATrZlRQnHB8hoX+G+Tbqkj5DJxcRFeNdtA+JCTcxP5
         ggX5HJkjYXhuWzwGyvnzPkDxZuq2XgSKLfzi3HemDlcF1yYI9QoNriBq6D7iNFNDcMyw
         UL3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679242558;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0xI1vkDtYqpmWRObk2pbvA9d3XpNb4E7+cR3cNxuUGM=;
        b=ba8vqNTAbIdyeDLcdGbXu8nMGmHd6iX2lGA4y5zVmrigNZFT+S7icVZooim2c/3zcQ
         1V7coUgjdw/Fx7YyedN4sOpKwNytgO7mfFpZUupJV+wxxnTc7bbBz4PKYacKSKIigCN/
         88PdzttT64sZMj6/Tbp4YIBo7hGxAKXod4Eu4C5WwO7GCHuNC54kgsQbubmCqbME4emA
         HpCY9EDNEb0xlEbBwjrATY3zAtJfakwtTjrw9yx6GkV8PetBfe6L6xCnaXHsKWQj387t
         E6oV4mWrEsDkw0Yw6DZUzrt1s9XO85pyscoFn6oezkuVf235JdpLSMivaoJiddxzdHRL
         /tUA==
X-Gm-Message-State: AO0yUKXGcRYZlEfWh3cPYRlT9FlY4eTrWJrD2EbDaar4W6llaLHeE0fi
	ULVvrsgCnMLc7ao3JvUHQPU=
X-Google-Smtp-Source: AK7set96Ivpm+WBhrxE96fHK/LO1ZrgJ4Tuo6cof2W656SK6cHb7owkm0Sy2Pqq/myU8WE596lUkmQ==
X-Received: by 2002:a05:6402:3da:b0:4af:81f1:5afb with SMTP id t26-20020a05640203da00b004af81f15afbmr10509083edw.14.1679242557700;
        Sun, 19 Mar 2023 09:15:57 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id y94-20020a50bb67000000b004be11e97ca2sm3663921ede.90.2023.03.19.09.15.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 09:15:57 -0700 (PDT)
Message-ID: <62070f52-1600-1a6f-b7e5-6fb6850840c4@gmail.com>
Date: Sun, 19 Mar 2023 18:15:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
References: <20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com>
 <1775403.TLkxdtWsSY@suse>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <1775403.TLkxdtWsSY@suse>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C60D63E965
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.43:from];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: F6R5XKM54EUGBAX6B4L5AK7QLYJXTKS5
X-Message-ID-Hash: F6R5XKM54EUGBAX6B4L5AK7QLYJXTKS5
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F6R5XKM54EUGBAX6B4L5AK7QLYJXTKS5/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmp4oCPL9mj4oCPL9mi2aDZotmjINmh2ag62aDZqSwgRmFiaW8gTS4gRGUgRnJhbmNl
c2NvIHdyb3RlOg0KPg0KPiBPbiBkb21lbmljYSAxOSBtYXJ6byAyMDIzIDE2OjI5OjA5IENFVCBN
ZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPiA+IFJlbW92ZSB1bm5lY2Vzc2FyeSBibGFuayBsaW5l
IGJlZm9yZSBzdHJ1Y3QgYXMgcmVwb3J0ZWQNCj4NCj4gPiBieSBjaGVja3BhdGNoOg0KPg0KPiA+
DQo+DQo+ID4gIiBDSEVDSzogUGxlYXNlIGRvbid0IHVzZSBtdWx0aXBsZSBibGFuayBsaW5lcyAi
DQo+DQo+ID4NCj4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBNZW5uYSBNYWhtb3VkIDxlbmcubWVubmFt
YWhtb3VkLm1tQGdtYWlsLmNvbT4NCj4NCj4gPiAtLS0NCj4NCj4gPiBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9wd20uYyB8IDEgLQ0KPg0KPiA+IDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0p
DQo+DQo+ID4NCj4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdt
LmMgDQo+IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCj4NCj4gPiBpbmRleCAzZmRh
MTcyMjM5ZDIuLjI2ZDM5ZTA4YzNiNiAxMDA2NDQNCj4NCj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9wd20uYw0KPg0KPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3
bS5jDQo+DQo+ID4gQEAgLTI0LDcgKzI0LDYgQEAgc3RydWN0IGdiX3B3bV9jaGlwIHsNCj4NCj4g
PiAjZGVmaW5lIHB3bV9jaGlwX3RvX2diX3B3bV9jaGlwKGNoaXApIFwNCj4NCj4gPiDCoMKgwqAg
Y29udGFpbmVyX29mKGNoaXAsIHN0cnVjdCBnYl9wd21fY2hpcCwgY2hpcCkNCj4NCj4gPg0KPg0K
PiA+IC0NCj4NCj4gPiBzdGF0aWMgaW50IGdiX3B3bV9jb3VudF9vcGVyYXRpb24oc3RydWN0IGdi
X3B3bV9jaGlwICpwd21jKQ0KPg0KPiA+IHsNCj4NCj4gPiDCoMKgwqAgc3RydWN0IGdiX3B3bV9j
b3VudF9yZXNwb25zZSByZXNwb25zZTsNCj4NCj4gPiAtLQ0KPg0KPiA+IDIuMzQuMQ0KPg0KPg0K
PiBIaSBNZW5uYSwNCj4NCj4NCkhpIEZhYmlvLA0KDQoNCj4gSSBqdXN0IHNhdyB0aGF0IHRvZGF5
IHlvdSBzZW50IHRoaXMgcGF0Y2ggYXQgbGVhc3QgdGhyZWUgdGltZXM6DQo+DQo+DQo+IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXN0YWdpbmcvMjAyMzAzMTkxMTQxNTUuNDIxNDgtMi1l
bmcubWVubmFtYWhtb3VkLm1tQGdtYWlsLmNvbS8NCj4NCg0KVGhpcyBmb3IgZGlmZmVyZW50IGZp
bGUsIGFuZCB0aGUgYmVsb3cgSSBzZW50IGl0IHdpdGggb3RoZXIgcGF0Y2ggc28gSSANCnJlc2Vu
ZCBpdCBhZ2Fpbi4NCg0KPg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zdGFnaW5n
LzIwMjMwMzE5MTUyOTA5LjE2MzU5OC0xLWVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwuY29tLw0K
Pg0KPg0KPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1zdGFnaW5nLzIwMjMwMzE5MTMy
NDUyLjE1MTg3Ny0yLWVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwuY29tLw0KPg0KPg0KPiBXaHkg
YXJlIHlvdSBkb2luZyBzbz8NCj4NCg0Kc29ycnkgZm9yIHRoaXMuDQoNCj4NCj4gUGxlYXNlIHNl
bmQgeW91ciBwYXRjaGVzIG9ubHkgb25jZSBhbmQgd2FpdCBhdCBsZWFzdCBhIHdlZWsgd2l0aG91
dCANCj4gYW55IHJlcGxpZXMgYmVmb3JlIHJlc2VuZGluZy4gRnVydGhlcm1vcmUsIHdoZW4gcmVz
ZW5kaW5nLCBwbGVhc2UgDQo+IGV4cGxhaW4gdW5kZXIgdGhlIHRocmVlIGRhc2hlcyAoIi0tLSIp
IHdoeSB5b3UgYXJlIGRvaW5nIHNvLiBQYXRjaGVzIA0KPiBtYXkgZ2V0IGxvc3QsIGJ1dCB0aGlz
IGlzIG5vdCB5b3VyIGNhc2UgZm9yIHNlbmRpbmcgdGhlbSBhZ2FpbiBhbmQgDQo+IGFnYWluIGlu
IGEgc2luZ2xlIGRheS4NCj4NCmdvdCB5b3VyIHBvaW50Lg0KDQo+DQo+IElzIHRoZXJlIGFueXRo
aW5nIEknbSBtaXNzaW5nPw0KPg0KPg0KPiBUaGFua3MsDQo+DQo+DQo+IEZhYmlvDQo+DQo+DQo+
DQoNClRoYW5rcywNCg0KTWVubmENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRl
di1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
