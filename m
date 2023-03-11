Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C966BDC04
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:51:13 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F39133EB82
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:51:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	by lists.linaro.org (Postfix) with ESMTPS id 26EB33EA3C
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:57:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=mwrsq1Vc;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.221.43 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id r18so7613379wrx.1
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GC6gxLkSt5uTZ0ymTf46wy5yL9s9aDluG3wBqWBs5Ao=;
        b=mwrsq1VcC7yLQT2peO2jhfVyQfYoiHwH/7siU/J2z79i1jFLG4uz/471lo1ufUlIxf
         We0Vk2fyJoJoAPmlkC8+S/7rVPLKc5WTVkSBjUNmw2TrTVEssuZF81WrVVEgi04tDTbZ
         EcuPZdbhDBjMJzQWeSKV0gHqK+KlEL02TW6xgXA6k5clPzSqUKHIo/d331SlI+GUXrDd
         UyhlCgvpyEuNAa/D2FkDOoG0XjZ3kuIjQvA9CZWLI1JqujotyAxFxJpMnFWFd67PB78O
         5cBKSPKafMskDRL6iA2WjzjHSA0WeZhitgr+e8Hc7zNcPoiDCAYQ4h1w9g/vJSYy6JKX
         fqbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546652;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GC6gxLkSt5uTZ0ymTf46wy5yL9s9aDluG3wBqWBs5Ao=;
        b=QO19AT2bkdyspDreDi8hfsl2BUQHj0+NorEHASHCcy0zB0dUoKk4QQuFJ3jGQIN6vD
         CyKYAfR4+xnwq2DWC2oLU2U0gPlbwqW79iHsj5JYIjLQnAnQWLw4mFXdcnfdbawmdM3J
         WaKZbPp9DoEWuQmg2fXXTS8QEVWPAWPFlfwRRRLUe3doczNUTuDtkvm+4lYUu26RTRSz
         O3xF+OBQxAW/NiZhFgMrgo0Y//eAcJBlMFy6luYsvD5UmnWGY+ozBCrifnfK9eJKHrXI
         DDV+rf8KQjPXeTjiDtMhkL2KmxbHme8PIeSzpM+JN6BHUbpXt1kjlJjetzESAfM1Vvkn
         t4CQ==
X-Gm-Message-State: AO0yUKXoe0R+yIdQU+ZyZcQ/NG0nSgW0aMOf991YeSW3340MP6GZEjgN
	BNcxT6bu2he1X+4S6WaPpeUKYx6VAu7CSA==
X-Google-Smtp-Source: AK7set/Q3Vr4JzSplTmjuQ/xbzBkpAmKAmEVXbj4GktdLASUu6uqDjE9uVWntvD/iu2IJncPWvOsfQ==
X-Received: by 2002:a5d:4e85:0:b0:2c7:1aaa:2b49 with SMTP id e5-20020a5d4e85000000b002c71aaa2b49mr20838137wru.23.1678546652156;
        Sat, 11 Mar 2023 06:57:32 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id j28-20020a5d6e5c000000b002c551f7d452sm2520623wrz.98.2023.03.11.06.57.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:57:31 -0800 (PST)
Message-ID: <59077252-02e4-dd43-77b5-2d2cfd114762@gmail.com>
Date: Sat, 11 Mar 2023 16:57:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Dan Carpenter <error27@gmail.com>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
 <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 26EB33EA3C
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_FROM(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.221.43:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.43:from]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: C3B5V6OBDFQ5A2H4VSD3T4KFLTDJP7YM
X-Message-ID-Hash: C3B5V6OBDFQ5A2H4VSD3T4KFLTDJP7YM
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:30 +0000
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/C3B5V6OBDFQ5A2H4VSD3T4KFLTDJP7YM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aY62aLZoywgRGFuIENhcnBlbnRlciB3cm90
ZToNCj4gT24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMDQ6MDY6NTFQTSArMDIwMCwgTWVubmEgTWFo
bW91ZCB3cm90ZToNCj4+IGFjY29yZGluZyB0byBBbGV4IGZlZWRiYWNrDQo+Pg0KPj4gIiBJIHRo
aW5rIHRoaXMgdHlwZSBvZiBhbGlnbm1lbnQgaXMgbm90IGEgbWFqb3IgcHJvYmxlbSwNCj4+IGFu
ZCBhbGlnbm1lbnQgaXNuJ3QgZG9uZSB0aGlzIHdheSBpbiBnZW5lcmFsIGluIHRoaXMNCj4+IGRy
aXZlciwgaXQncyBwcm9iYWJseSBPSyB0byBrZWVwIGl0IHRoYXQgd2F5LiAtIEFsZXggIg0KPj4N
Cj4+DQo+PiAsSSB3b24ndCByZXN1Ym1pdCB0aGVzZSBwYXRjaGVzLCByaWdodD8NCj4gWWVhaC4g
IEZpbmQgc29tZXRoaW5nIGVsc2UgdG8gZml4Lg0KPg0KPiBJIGZlZWwgbGlrZSBpbiBvdXRyZWFj
aHkgYW5kIHNpbWlsYXIgdGhhdCBwZW9wbGUgc2VuZCBhIGZpcnN0IHBhdGNoIGFuZA0KPiB0aGVu
IHRoZXkgZ2V0IGEgYnVuY2ggb2YgZGlmZmVyZW50IGZlZWRiYWNrLiAgQW5kIGl0J3MgbGlrZSBj
aGVja3BhdGNoDQo+IGlzIGNvbXBsYWluaW5nIGFuZCBpdCdzIHN0YWdpbmcgY29kZSBzbyBwcm9i
YWJseSB0aGUgY29kZSBpcyBhY3R1YWxseQ0KPiB1Z2x5IGluIGEgd2F5LiAgQnV0IG9mdGVuIGl0
J3MgYmV0dGVyIHRvIGFiYW5kb24gdGhlIHByb2plY3QgaW5zdGVhZCBvZg0KPiBnZXR0aW5nIG9i
c2Vzc2VkIHdpdGggaXQuICBab29tIG91dCBhIGJpdC4gIEZpbmQgc29tZXRoaW5nIGVsc2Ugd2hl
cmUNCj4gaXQncyBvYnZpb3VzIGhvdyB0byBpbXByb3ZlIHRoZSBjb2RlIGZyb20gYSByZWFkYWJp
bGl0eSBwZXJzcGVjdGl2ZS4NCj4NCj4gUGVvcGxlIGFyZSBnaXZpbmcgeW91IGZlZWRiYWNrIHRv
IGhlbHAgeW91IGFuZCBub3QgYmVjYXVzZSB0aGV5IGFyZQ0KPiBhYm91dCB0aGF0IHBhcnRpY3Vs
YXIgbGluZSBvZiBjb2RlLiAgVGhleSB3b24ndCBjYXJlIGlmIHlvdSB3b3JrIG9uDQo+IHNvbWV0
aGluZyBlbHNlIGluc3RlYWQuDQo+DQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCg0KDQpH
b3QgaXQsIHRoYW5rcyBEYW4uDQoNCg0KPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVz
LWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
