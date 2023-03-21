Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E656C39E3
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:09:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 407603ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:09:03 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	by lists.linaro.org (Postfix) with ESMTPS id 7C8E83EBA6
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 16:22:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=YeKR29GC;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.44 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f44.google.com with SMTP id b20so28969785edd.1
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 09:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679415767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QVACjUDTIgBWv8C/PMxK28Am87k7w8br8nJW4GJZZR0=;
        b=YeKR29GC4ZRYgPv/Y0cozd7GizqxUkCySuYWpgCi+mYAmFiNbkl5JNC/S5e+59E0Ir
         3N9crSkggg3s1Qfwqc7FQMc98ZT0fiUYezs4MqBULKIEjdDVzgIo4gHMsjJsSMlziF9O
         j+Cai+bysAZJcryv6aqjP5LPtZncWd9WnfAjagf14wy5jotYNXcSdfPgNZn7mxLIrv71
         vS2lDoO/I5o8GGcHvvWOTtwUYO2qOnB5+p+Ln9nKNfn1/FnCI8eZaRFmek5CpxKIVM9O
         +LP/ZorWWdjVc//gw1xoF/Ro2YGuBFz22a/z0PaG+T9KtrPQfWH6z1hr9RD87Z4i6GEU
         swwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679415767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QVACjUDTIgBWv8C/PMxK28Am87k7w8br8nJW4GJZZR0=;
        b=onXPuG4Gp6+Bw+oapWlkryV7rUjgkcvd5HE4Ed9nupX1fYGZjy291WvR8tYfiKlcG6
         IZE0LmYm3Bsl+PNf+Gm0IG8LtlfyBqikxuYmNnujYJPyUco9UBy4SjJHpoL36PpyzZRb
         h/0KneSlFyLT+khIC1IDa1u1xngiMGJOQtFg6+yewuGOzPdwwZ/5KnpBNu0OIM8mtdmG
         eceqNFWg0eoA3G6rMgVbf7HsiiabrbLnPrEVI2gHlW1ieEK8HAR9MQWh67uUox8eni7f
         Kew+yGDFd0FgPgfq9GtTJpxeJyRSI1yQzi3Hw3ttzHaVyzUGwz4N6paNRvySXFjqtN5K
         iTKw==
X-Gm-Message-State: AO0yUKUL8JCnNPdrauN3xUMpd7i7qgIRDdH4q/QpT3nFyO+vem6Cewr0
	sGo30YxLmBdIoXl/Las0MIc=
X-Google-Smtp-Source: AK7set8xKZE0Kxa4lqQIAdiFOKdoiDSGBpiO/C6qFIaLk47Lyfs7Kd6bg/7JqOnXzrjm5unqdtG+kg==
X-Received: by 2002:a17:907:6f1b:b0:932:365a:c1e7 with SMTP id sy27-20020a1709076f1b00b00932365ac1e7mr3578251ejc.67.1679415767389;
        Tue, 21 Mar 2023 09:22:47 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id kb1-20020a1709070f8100b00933c4a25735sm3352516ejc.100.2023.03.21.09.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 09:22:47 -0700 (PDT)
Message-ID: <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com>
Date: Tue, 21 Mar 2023 18:22:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Julia Lawall <julia.lawall@inria.fr>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7C8E83EBA6
X-Spamd-Bar: ----------
X-Spamd-Result: default: False [-10.00 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.44:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[linuxfoundation.org,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BOQU753QDS46I5F3RD5ZZDL7OZC6UMXS
X-Message-ID-Hash: BOQU753QDS46I5F3RD5ZZDL7OZC6UMXS
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:07 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/3] edits in greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BOQU753QDS46I5F3RD5ZZDL7OZC6UMXS/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZotmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aM62aTZpiwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBUdWUsIDIxIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
VGhpcyBwYXRjaHNldCBpbmNsdWRlcyBjaGFuZ2UgaGFwcGVuZWQgaW4gZ3JleWJ1cyBkcml2ZXIg
aW4gdGhyZWUNCj4+IGRpZmZlcmVudCBmaWxlcyB0d28gb2YgdGhlbSBwYXRjaCBvbmUgYW5kIHRo
cmVlIHJlbGF0ZWQgdG8NCj4+IGNoZWNrcGF0Y2ggaXNzdWUgYW5kIGluIHNlY29uZCBwYXRjaCBj
b252ZXJ0IHR3bw0KPj4gYGNvbnRhaW5lcl9vZmAgbWFjcm9zIGludG8gaW5saW5lIGZ1bmN0aW9u
cy4NCj4+DQo+PiBNZW5uYSBNYWhtb3VkICgzKToNCj4+ICAgIHN0YWdpbmc6IGdyZXlidXM6IHJl
bW92ZSB1bm5lY2Vzc2FyeSBibGFuayBsaW5lDQo+PiAgICBzdGFnaW5nOiBncmV5YnVzOiB1c2Ug
aW5saW5lIGZ1bmN0aW9uIGZvciBtYWNyb3MNCj4+ICAgIHN0YWdpbmc6IGdyZXlidXM6IHJlbW92
ZSB1bm5lY2Vzc2FyeSBibGFuayBsaW5lDQo+IERpZmZlcmVudCBwYXRjaGVzIHNob3VsZCBoYXZl
IGRpZmZlcmVudCBzdWJqZWN0IGxpbmVzLg0KQnV0IEkgaGF2ZSBhbHJlYWR5IHRoZSBzYW1lIGVk
aXQgaW4gYm90aCBmaWxlLCBzbyBzaG91bGQgSSByZS13cml0ZSB0aGUgDQpzdWJqZWN0IGZvciBv
bmUgb2YgdGhlbT8NCj4gICAgWW91IG5lZWQgdG8gZWl0aGVyDQo+IGJlIG1vcmUgc3BlY2lmaWMg
YWJvdXQgdGhlIGZpbGUgYWZmZWN0ZWQgb3IgbWVyZ2UgdGhlIHR3byBwYXRjaGVzIHdpdGggdGhl
DQo+IHNhbWUgc3ViamVjdCBpbnRvIG9uZS4NCg0KZWFjaCBwYXRjaCByZWxhdGVkIHRvIGRpZmZl
cmVudCBmaWxlLiBTbywgQ2FuIEkgdG8gbWVyZ2UgdHdvIGNvbW1pdHMgZm9yIA0KZGlmZmVyZW50
IGZpbGVzIGJ1dCBoYXZlIHRoZSBzYW1lIGVkaXQgaW4gb25lIHBhdGNoPw0KDQpidXQgaW4gdGhp
cyBjYXNlIG5vIG5lZWQgdG8gY3JlYXRlIHBhdGNoc2V0IGZvciBhbGwgY2hhbmdlcyBpbiBgZ3Jl
eWJ1c2AgDQpkcml2ZXIsIHJpZ2h0Pw0KDQpJZiBva2F5IHdpdGggdGhhdCwgc2hvdWxkIEkgdmVy
c2lvbmluZyB0aGUgcGF0Y2hlcyB0byByZXNlbmQgdGhlbSBhZ2FpbiwgDQpvciBzaG91bGQgYWRk
ICJSRVNFTkQiIHN1YmplY3QgcHJlZml4Pw0KDQpwbGVhc2UgdGVsbCBtZSB0aGUgYmVzdCB3YXkg
dG8gcmVzZW5kIHRoZXNlIHBhdGNoZXMsIGFwcHJlY2lhdGUgeW91ciBoZWxwLg0KDQoNCk1lbm5h
DQoNCg0KPg0KPiBqdWxpYQ0KPg0KPj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYnBoeS5o
ICAgICAgICAgICAgICAgICAgfCAxMCArKysrKysrKy0tDQo+PiAgIGRyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2dyZXlidXNfYXV0aGVudGljYXRpb24uaCB8ICAxIC0NCj4+ICAgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvcHdtLmMgICAgICAgICAgICAgICAgICAgIHwgIDEgLQ0KPj4gICAzIGZpbGVz
IGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4+DQo+PiAtLQ0KPj4g
Mi4zNC4xDQo+Pg0KPj4NCj4+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
