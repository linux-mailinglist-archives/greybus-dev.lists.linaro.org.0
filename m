Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8E27886EB
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Aug 2023 14:17:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CDF0044045
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Aug 2023 12:17:24 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 41A1E3F03D
	for <greybus-dev@lists.linaro.org>; Fri, 25 Aug 2023 12:17:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=sFJpqmVp;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1bc3d94d40fso7285805ad.3
        for <greybus-dev@lists.linaro.org>; Fri, 25 Aug 2023 05:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692965837; x=1693570637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hwwOEFavp7RRtPgG79FO0t6EVtU55g9oeR+ES0tl0DM=;
        b=sFJpqmVpKJYOkXMe4OzHgWu9twXlo1RFlL4n8yvwXi0zHqfUPJcwTUPmPnRpq0sGPw
         w5URq0WVZ3rw64gtrvL/uycjGa2qsihEz6OXzJnCI9eIo9D/eeIkwiSZCZwsvc3iHVP7
         0/S97mYV7YKO41XRe6cEFFqeHoh6Adx1z7KAm9hB4oaiRU1+J8HNVQWKiH58Hpge46JL
         kCwNPFNtt1aRWqujLLXHotZUygEjEpxvnXfc3eykYtwYl8AGrhzsqm4D9y7rtUfTnd+N
         Dj0UkQvZCTgVM5qMBg8JwYKj5xjY3eyEWxfu8WoW06kCYAb9xSQMs4O64vY7T3nHC1TW
         W5Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692965837; x=1693570637;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hwwOEFavp7RRtPgG79FO0t6EVtU55g9oeR+ES0tl0DM=;
        b=g8DHJrt3D2LMd1c9bKajFCf7rCK3/veB+PkMxWwsp6emT1paxzW90crby9WBV+6w1v
         tY8udnOFH4kz72Ayf3hLGayQ1ir/db4JmtbJLMSCMWsp7xhe8hjGTGNOq3wfkDR/N9ge
         GAB4Sv6icWEIk1yA+Oau5y/U7O6f4v1Rk7nI1HdgcfyGS1qvnb05jBY6e8w9sOz9ZqPE
         94SZCigYFKmOSZapq7h6BWAN/Bxq5Q1cLzktmCBn/wm61E4r5Cg7Xyz9piw2oaKJ0MXV
         Ht111gTAR0qnPKQ/bfZl4C20nGTrgljEpPgX4IO3LDt3j3Luj46Y3dMhBxi5ZAgSm9Ax
         FwKg==
X-Gm-Message-State: AOJu0YylnUBbbTC0RdMJ6RVSWUuKWBV51ll+JxCOrmZQOTVk76Qcu2/H
	2c+WEsq/w2SwDsti2KsMbmo=
X-Google-Smtp-Source: AGHT+IFfDyOOOZ6W0U5dytpl7iOoAQ6UCXwahmx0xIPsFIzWDrzQDDkIf3uf8Ekwih8QST/5+mZADA==
X-Received: by 2002:a17:903:11c8:b0:1b8:90bd:d157 with SMTP id q8-20020a17090311c800b001b890bdd157mr21522253plh.26.1692965837199;
        Fri, 25 Aug 2023 05:17:17 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902d48d00b001bd28b9c3ddsm1529383plg.299.2023.08.25.05.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Aug 2023 05:17:16 -0700 (PDT)
Message-ID: <675513d7-8ef7-321a-ab97-8f32c09414c4@gmail.com>
Date: Fri, 25 Aug 2023 17:47:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230823165520.181301-1-ayushdevel1325@gmail.com>
 <20230823165520.181301-3-ayushdevel1325@gmail.com>
 <2023082317-vagabond-lent-95ea@gregkh>
 <ba825082-6286-2571-6232-52353dfdae05@gmail.com>
 <2023082506-flying-trapped-df40@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023082506-flying-trapped-df40@gregkh>
X-Rspamd-Queue-Id: 41A1E3F03D
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,gmail.com,kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: TCGVKRDKPFF6B7XTAXP5YZHEVLVI2JNU
X-Message-ID-Hash: TCGVKRDKPFF6B7XTAXP5YZHEVLVI2JNU
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, hvaibhav.linux@gmail.com, elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/4] Add beagleplay greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TCGVKRDKPFF6B7XTAXP5YZHEVLVI2JNU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiA4LzI1LzIzIDE3OjA4LCBHcmVnIEtIIHdyb3RlOg0KPiBPbiBGcmksIEF1ZyAyNSwgMjAy
MyBhdCAwNDo1MzowMVBNICswNTMwLCBBeXVzaCBTaW5naCB3cm90ZToNCj4+IE9uIDgvMjMvMjMg
MjM6MDYsIEdyZWcgS0ggd3JvdGU6DQo+Pj4+ICsjZGVmaW5lIEJFQUdMRVBMQVlfR0JfTUFYX0NQ
T1JUUyAzMg0KPj4+IFdoZXJlIGRvZXMgdGhpcyBudW1iZXIgY29tZSBmcm9tPw0KPj4gV2VsbCwg
aXQgaXMgdGhlIG1heCBudW1iZXIgb2YgQ3BvcnRzIG91ciBBUEJyaWRnZSBzdXBwb3J0cy4gU2lu
Y2UgaXQgaXMgYQ0KPj4gS0NvbmZpZyB2YXJpYWJsZSBvbiBaZXBoeXIgYXBwbGljYXRpb24gc2lk
ZSwgbWF5YmUgaXQgc2hvdWxkIGJlIGEgY29uZmlnDQo+PiB2YXJpYWJsZSBoZXJlIGFzIHdlbGw/
DQo+IEp1c3QgZG9jdW1lbnQgaXQgcGxlYXNlLiAgQnV0IGlmIHRoaXMgZ2V0cyBvdXQgb2Ygc3lu
YyB3aXRoIHRoZSBkZXZpY2UNCj4gKGFzIExpbnV4IGhhcyBubyBpZGVhIHdoYXQgdGhlIGRldmlj
ZSBoYXMpLCBwZXJoYXBzIHlvdSBzaG91bGQgYmUgYWJsZQ0KPiB0byBkZXRlY3QgaXQgYXV0b21h
dGljYWxseT8NCg0KTGV0IG1lIHNlZSB3aGF0IEkgY2FuIGRvIGFib3V0IHRoZSBkZXRlY3Rpb24u
IFRoZXJlIGlzIG5vIG1lY2hhbmlzbSBpbiANCmdyZXlidXMgdG8gZG8gdGhhdCwgc28gaXQgd2ls
bCBuZWVkIHRvIGJlIHNvbWV0aGluZyBiZXNwb2tlIEkgZ3Vlc3MuDQoNCg0KPj4+PiArCWlmICho
ZHItPnJlc3VsdCkgew0KPj4+PiArCQlkZXZfd2FybigNCj4+Pj4gKwkJCSZiZy0+c2VyZGV2LT5k
ZXYsDQo+Pj4+ICsJCQkiRmFpbGVkIEdyZXlidXMgT3BlcmF0aW9uICV1IG9mIFR5cGUgJVggb24g
Q1BvcnQgJXUgd2l0aCBTdGF0dXMgJXUiLA0KPj4+PiArCQkJaGRyLT5vcGVyYXRpb25faWQsIGhk
ci0+dHlwZSwgY3BvcnRfaWQsIGhkci0+cmVzdWx0KTsNCj4+Pj4gKwl9IGVsc2Ugew0KPj4+PiAr
CQlkZXZfZGJnKCZiZy0+c2VyZGV2LT5kZXYsDQo+Pj4+ICsJCQkiU3VjY2Vzc2Z1bCBHcmV5YnVz
IE9wZXJhdGlvbiAldSBvZiBUeXBlICVYIG9uIENQb3J0ICV1IiwNCj4+Pj4gKwkJCWhkci0+b3Bl
cmF0aW9uX2lkLCBoZHItPnR5cGUsIGNwb3J0X2lkKTsNCj4+Pj4gKwl9DQo+Pj4+ICsJZ3JleWJ1
c19kYXRhX3JjdmQoYmctPmdiX2hvc3RfZGV2aWNlLCBjcG9ydF9pZCwgYnVmZmVyLCBidWZmZXJf
bGVuKTsNCj4+Pj4gK30NCj4+Pj4gKw0KPj4+PiArc3RhdGljIHZvaWQgYmVhZ2xlcGxheV9ncmV5
YnVzX2hhbmRsZV9kYmdfZnJhbWUoc3RydWN0IGJlYWdsZXBsYXlfZ3JleWJ1cyAqYmcsDQo+Pj4+
ICsJCQkJCQljb25zdCBjaGFyICpidWZmZXIsDQo+Pj4+ICsJCQkJCQlzaXplX3QgYnVmZmVyX2xl
bikNCj4+Pj4gK3sNCj4+Pj4gKwljaGFyIGJ1ZltSWF9IRExDX1BBWUxPQURdOw0KPj4+IEFyZSB5
b3Ugc3VyZSB5b3UgY2FuIGRvIGFsbCBvZiB0aGF0IG9uIHRoZSBzdGFjaz8NCj4+IEkgdGhpbmsg
aXQgc2hvdWxkIGJlIGZpbmUuIFplcGh5ciBhcHBsaWNhdGlvbiBpdHNlbGYgcGxhY2VzIGEgbGlt
aXQgb24gdGhlDQo+PiBtYXhpbXVtIHNpemUgb2YgYW4gSERMQyBmcmFtZSBhbmQgY29tcGlsZSB0
aW1lLCBhbmQgd2Ugd2lsbCBvbmx5IHByb2Nlc3MgYQ0KPj4gc2luZ2xlIGZyYW1lIGluIHRoaXMg
ZnVuY3Rpb24uIEkgZG8gbmVlZCB0byBjbGVhbiB1cCBzb21lIG9mIHRoZXNlDQo+PiBjb25zdGFu
dHMuIEFuZCB0aGUgemVwaHlyIGFwcGxpY2F0aW9uIG9ubHkgc3VwcG9ydHMgYSBtYXggZnJhbWUg
b2YgMjU2DQo+PiBieXRlcywgc28gdGhlIGN1cnJlbnQgYnVmZmVyIGlzIHdheSB0b28gYmlnLg0K
PiBBZ2FpbiwgcGx1dHRpbmcgdGhhdCBtdWNoIGRhdGEgb24gdGhlIHN0YWNrIGlzIGdlbmVyYWxs
eSBhIGJhZCBpZGVhLg0KPiBBbHNvLCBhcmUgeW91IHN1cmUgdGhlIGhhcmR3YXJlIGNhbiBjb3B5
IGZyb20gdGhlIHN0YWNrIHByb3Blcmx5PyAgTWFueQ0KPiBidXMgdHlwZXMgY2FuIG5vdCBoYW5k
bGUgdGhpcyBhdCBhbGwgKGkuZS4gVVNCKSwgc28gY2FuIHlvdSBqdXN0IG1ha2UgaXQNCj4gZHlu
YW1pYz8gIE9yIGlzIGl0IG5lZWRlZCBhdCBhbGw/DQoNCkkgY2FuIHNoaWZ0IGl0IHRvIGhlYXAu
IFRoZSByZWFzb24gSSBhbSBjb3B5aW5nIGl0IGhlcmUgaXMgdGhhdCB0aGUgSERMQyANCmZyYW1l
IHBheWxvYWQgaXMgbm90IG51bGwgdGVybWluYXRlZC4gSWYgaXQgd2FzIHBvc3NpYmxlIHRvIHN1
cHBseSB0aGUgDQpsZW5ndGggb2YgdGhlIHN0cmluZyBidWZmZXIgd2l0aG91dCBudWxsIHRlcm1p
bmF0aW5nIGl0LCB3ZSBjb3VsZCByZW1vdmUgDQp0aGUgd2hvbGUgY29weWluZy4NCg0KSSB0aGlu
ayBJIGNhbiBhY3R1YWxseSBqdXN0IE5VTEwgdGVybWluYXRlIHRoZSBzdXBwbGllZCBidWZmZXIg
d2l0aG91dCANCmNyZWF0aW5nIGFueSBwcm9ibGVtIGluIHRoZSBjdXJyZW50IHNldHVwIChpdCB3
aWxsIGp1c3Qgb3ZlcnJpZGUgQ1JDIA0Kd2hpY2ggaXMgbm90IGdvaW5nIHRvIGJlIGNoZWNrZWQg
YWdhaW4pLiBMZXQgbWUgdHJ5IHRoYXQuDQoNCkFsc28sIHRoZSBkYXRhIGlzIGJlaW5nIGNvcGll
ZCBmcm9tIGEgaGVhcCBhcnJheSANCihgYmVhZ2xlcGxheV9ncmV5YnVzLT5yeF9idWZmZXJgKSwg
bm90IGFueSBoYXJkd2FyZSBkaXJlY3RseS4NCg0KDQo+Pj4+ICsJbWVtY3B5KGJ1ZiwgYnVmZmVy
LCBidWZmZXJfbGVuKTsNCj4+Pj4gKwlidWZbYnVmZmVyX2xlbl0gPSAwOw0KPj4+PiArCWRldl9k
YmcoJmJnLT5zZXJkZXYtPmRldiwgIkNDMTM1MiBEZWJ1ZzogJXMiLCBidWYpOw0KPj4+IFdoeSBh
cmUgeW91IHVzaW5nIGEgc3RhY2sgYnVmZmVyIGZvciBhIGRlYnVnIGxvZz8NCj4+Pg0KPj4+IEFu
ZCBubyBuZWVkIGZvciBwcmVmaXhlcyBvbiBhIGRlYnVnIG1lc3NhZ2UsIHRoYXQgY29tZXMgZm9y
IGZyZWUgZnJvbQ0KPj4+IHRoZSBkeW5hbWljIGRlYnVnIGluZnJhc3RydWN0dXJlLg0KPj4+DQo+
Pj4gYW5kIGFyZSB5b3Ugc3VyZSB0aGlzIGJ1ZmZlciBpcyBhIHN0cmluZz8NCj4+IFRoaXMgaXMg
cHJpbnRpbmcgbG9ncyBmcm9tIEJlYWdsZVBsYXkgQ0MxMzUyLCB3aGljaCBhcmUgdHJhbnNwb3J0
ZWQgb3ZlciBhDQo+PiBzcGVjaWZpYyBIRExDIGFkZHJlc3MuIFRoaXMgaXMgYmVjYXVzZSB1bmxl
c3MgeW91IGhhdmUgYSBKVEFHLCB5b3UgY2Fubm90DQo+PiB2aWV3IGFueXRoaW5nIGhhcHBlbmlu
ZyBpbiBDQzEzNTIgd2l0aG91dCBkaXNhYmxpbmcgdGhlIGRyaXZlciB1c2luZyBkdA0KPj4gb3Zl
cmxheS7CoCBUaGlzIGlzIGluY29udGluZW50IGZvciBkZXZlbG9wbWVudCBhbmQgZGVidWdnaW5n
Lg0KPj4NCj4+IEl0IHNob3VsZCBhbHdheXMgYmUgYSBzdHJpbmcgc2luY2UgSSBhbSByb3V0aW5n
IHRoZSB6ZXBoeXIgbG9nIG91dHB1dHMgb3Zlcg0KPj4gaGRsYzogaHR0cHM6Ly9naXQuYmVhZ2xl
Ym9hcmQub3JnL2dzb2MvZ3JleWJ1cy9jYzEzNTItZmlybXdhcmUvLS9ibG9iL2RldmVsb3Avc3Jj
L2hkbGNfbG9nX2JhY2tlbmQuYw0KPiBPaywgYnV0IHBlcmhhcHMgZG8gc29tZXRoaW5nIHRoYXQg
ZG9lc24ndCBuZWVkIHNvIG11Y2ggc3RhY2sgc3BhY2UganVzdA0KPiBmb3IgYSBkZWJ1ZyBtZXNz
YWdlPw0KDQpXZWxsLCBhIGRlYnVnIGZyYW1lIHdpbGwgY29udGFpbiBtaW4oSERMQ19GUkFNRV9T
SVpFLCBERUJVR19NU0dfU0laRSkuIA0KQW5kIEkgb25seSBrbm93IEhETENfRlJBTUVfU0laRSBh
dCBjb21waWxlIHRpbWUuIEkgY2FuIGFsbG9jYXRlIGEgaGVhcCANCmFycmF5IGZvciBldmVyeSBk
ZWJ1ZyBtZXNzYWdlICh0byBtYWtlIGl0IHRoZSBzaXplIG9mIHRoZSBhY3R1YWwgDQptZXNzYWdl
KSwgYnV0IHdlbGwgSSB0aGluayBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8ganVzdCBhbGxv
Y2F0ZSANCm9uY2UgYW5kIHJldXNlIGl0Lg0KDQoNCj4+Pj4gKwl9DQo+Pj4+ICsNCj4+Pj4gKwli
ZWFnbGVwbGF5X2dyZXlidXMgPSBkZXZfZ2V0X2RydmRhdGEoJmhkLT5kZXYpOw0KPj4+PiArCW1l
bWNweShtZXNzYWdlLT5oZWFkZXItPnBhZCwgJmNwb3J0X2lkLCBzaXplb2YodTE2KSk7DQo+Pj4+
ICsJbWVtY3B5KCZibG9ja19wYXlsb2FkLCBtZXNzYWdlLT5oZWFkZXIsDQo+Pj4+ICsJICAgICAg
IHNpemVvZihzdHJ1Y3QgZ2Jfb3BlcmF0aW9uX21zZ19oZHIpKTsNCj4+Pj4gKwltZW1jcHkoJmJs
b2NrX3BheWxvYWRbc2l6ZW9mKHN0cnVjdCBnYl9vcGVyYXRpb25fbXNnX2hkcildLA0KPj4+PiAr
CSAgICAgICBtZXNzYWdlLT5wYXlsb2FkLCBtZXNzYWdlLT5wYXlsb2FkX3NpemUpOw0KPj4+PiAr
CWhkbGNfc2VuZF9hc3luYyhiZWFnbGVwbGF5X2dyZXlidXMtPmhkbGNfZHJ2LCBtZXNzYWdlLT5o
ZWFkZXItPnNpemUsDQo+Pj4+ICsJCQkmYmxvY2tfcGF5bG9hZCwgQUREUkVTU19HUkVZQlVTLCAw
eDAzKTsNCj4+Pj4gKw0KPj4+PiArCWdyZXlidXNfbWVzc2FnZV9zZW50KGJlYWdsZXBsYXlfZ3Jl
eWJ1cy0+Z2JfaG9zdF9kZXZpY2UsIG1lc3NhZ2UsIDApOw0KPj4+PiArCXJldHVybiAwOw0KPj4+
PiArfQ0KPj4+PiArDQo+Pj4+ICtzdGF0aWMgdm9pZCBnYl9tZXNzYWdlX2NhbmNlbChzdHJ1Y3Qg
Z2JfbWVzc2FnZSAqbWVzc2FnZSkNCj4+Pj4gK3sNCj4+Pj4gK30NCj4+PiBXaHkgaXMgYW4gZW1w
dHkgZnVuY3Rpb24gbmVlZGVkPyAgVGhhdCBmZWVscyB3cm9uZy4NCj4+IFdlbGwsIHRoaXMgaXMg
YSByZXF1aXJlZCBmdW5jdGlvbiB0byBkZWZpbmU6DQo+PiBodHRwczovL2VsaXhpci5ib290bGlu
LmNvbS9saW51eC92Ni41LXJjNy9zb3VyY2UvZHJpdmVycy9ncmV5YnVzL2hkLmMjTDEzNg0KPiBJ
ZiBpdCdzIHJlcXVpcmVkLCBhbiBlbXB0eSBmdW5jdGlvbiBpcyBub3QgYWxsb3dlZCwgcmlnaHQ/
ICBPdGhlcndpc2UNCj4gdGhlIGNvcmUgd291bGQgYWxsb3cgYW4gZW1wdHkgZnVuY3Rpb24gOikN
Cg0KV2VsbCwgdGhlIGVtcHR5IG1lc3NhZ2Ugd2FzIHRha2VuIGZyb20gYGdiX25ldGxpbmtgLsKg
IEFueXdheSwgSSBhbSBub3QgDQpxdWl0ZSBzdXJlIHdoYXQgdGhlIGV4cGVjdGVkIGJlaGF2aW9y
IG9mIHRoaXMgZnVuY3Rpb24uIEEgZ3JleWJ1cyANCm1lc3NhZ2UgY2FuIGJlIGluIG9uZSBvZiB0
aGUgZm9sbG93aW5nIHN0YWdlczoNCg0KMS4gUXVldWVkIGZvciBzZW5kaW5nIG92ZXIgVUFSVCBi
dXQgc3RpbGwgbm90IGxlZnQgbGludXggZHJpdmVyLg0KDQoyLiBTZW50IHRvIENDMTM1MiwgYnV0
IG5vdCBzZW50IHRvIEdyZXlidXMgbm9kZSB5ZXQuDQoNCjMuIFNlbnQgdG8gZ3JleWJ1cyBub2Rl
LA0KDQpJZiB5b3UgYWRkIHRoZSBzdGF0ZSBvZiByZXNwb25zZSBtZXNzYWdlIGFzIHdlbGwsIHRo
ZW4geW91IGdldCAzIG1vcmUgDQpmb3IgdGhhdC4NCg0KQW55d2F5LCBkb2VzIGNhbmNlbCBqdXN0
IG1lYW4gdGhhdCBpdCBkb2VzIG5vdCB3YW50IHRvIHJlY2VpdmUgYSANCnJlc3BvbnNlIGZvciB0
aGlzIG1lc3NhZ2UsIG9yIGRvZXMgaXQgYWN0aXZlbHkgd2FudCB0byBzdG9wIHRoZSBtZXNzYWdl
IA0KZnJvbSBiZWluZyBzZW50LiBJbiB0aGUgZm9ybWVyIGNhc2UsIEkgY2FuIGp1c3QgbWFpbnRh
aW4gYSBsaXN0IG9mIA0KY2FuY2VsbGVkIG1lc3NhZ2VzIGFuZCBjaGVjayBlYWNoIGluY29taW5n
IG1lc3NhZ2UgYWdhaW5zdCBpdC7CoCBUaGlzIA0Kd291bGQgbWVhbiB0aGUgbWVzc2FnZSB3aWxs
IGFsd2F5cyBiZSBzZW50IHRvIG5vZGUgYW55d2F5IGFuZCBqdXN0IG5vdCANCnN1Ym1pdHRlZCBi
YWNrIHRvIGBnYl9ob3N0X2RldmljZWAuDQoNClRoZSBsYXR0ZXIgaXMgbXVjaCBtb3JlIGRpZmZp
Y3VsdCBhZnRlciBzdGFnZSAxLiBUaGUgQVBCcmlkZ2Ugb24gQ0MxMzUyIA0KaXMgZHVtYiBieSBk
ZXNpZ24gYW5kIGRvZXMgbm90IGtlZXAgdHJhY2sgb2YgbWVzc2FnZXMgaXQgc2VuZCBvciANCnJl
Y2VpdmVzLiBNYWtpbmcgaXQga2VlcCB0cmFjayBvZiBldmVyeSBtZXNzYWdlIGZyb20gZXZlcnkg
ZGlyZWN0aW9uIA0Kd2lsbCBhZGQgYSBsb3QgbW9yZSBjb21wbGV4aXR5IGFuZCBjYXVzZSBwZXJm
b3JtYW5jZSBwcm9ibGVtcyAoc2luY2UgaXQgDQppcyBqdXN0IDEgY29yZSBkb2luZyBBUEJyaWRn
ZSwgU1ZDIGFuZCBub2RlIGRpc2NvdmVyeSBzdHVmZikuDQoNCg0KQXl1c2ggU2luZ2gNCg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
