Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0906C39E8
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:09:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4C8A3EF88
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:09:24 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	by lists.linaro.org (Postfix) with ESMTPS id 72C7D3EEF8
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 17:24:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=L1lPVvZ5;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.51 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id eh3so62606553edb.11
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 10:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679419444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uYD3ffgIy5duZGLsx0RR5hgJ1e2w3VJSqGeiI7Av+FI=;
        b=L1lPVvZ5E6UpwmZadJUbK15jSxOHnY/A28IPax05Ns8kDIfpBIx0fNGv83KNDVFOJb
         LlWaibrQJ9YSaPIolzFsRxiaoPJAjZrreP8Koko8WDnVLsozgHPaioNp3zmbDLJNO10m
         UwYWHU6mYyyLbKbzHko+nkptaRQbcSRtFDfeOGAfFCzhvDJ+GFLpxQN3F2Ji7+6J+9JY
         M/7xZCyzrh6FQB1PCV4T/L0ZAMFf4ZBWTWS8i+5/DdfgbCmn++i34P+tMM0qqpiJZv90
         zvu5PLEAQLlYpdnYyIIfZpN+DN845ITNY+kevBARLUZ89BD09jdix6xw6TbkV3vTm0N1
         kSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679419444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uYD3ffgIy5duZGLsx0RR5hgJ1e2w3VJSqGeiI7Av+FI=;
        b=g1t3Ac0cSL3/5tFmNTxW+dw4Oin7YR2CuBiWSqFG+CKULFwPqkyANnrfcChmeZWxt3
         WcHmMDPJM+boiPEstg3NV+bdgQ6nsToXqO1kw7iWzh037zEaDpzWv3FUv+4gJj9Asobr
         Cg7gHsbEGySJq2TpuNTai8hnRIiv21Fxebx28rgGTIfV1c9oRrBIs3ZgcFfqS1Jd+Ie9
         R61ORBuLfVi5Z9MTDKPNsPridJofCMvIdygFyJFcYPoCurZHglOrcVP3WVwVV4hVAQ1U
         hbWreCxS39UUWPj+67rKO07pJdBj6UUR2T+dLFVj7z3FzRHkGd6tNptDMVhHzB8yOk9q
         pF2w==
X-Gm-Message-State: AO0yUKWkShcXmQeC5WXhVws1nQ17s71aiYMAY4O3gmvtGx7ntZZSfOvg
	F6jkn+QKEvuAuCuk9Y0f8wI=
X-Google-Smtp-Source: AK7set/osmJFQCobrauQUqZc0NNqdgQSfyrKXjZAcy946p+Q5sYBnO9HsdZyYANE2uWKqPQa9ver1A==
X-Received: by 2002:a17:906:170c:b0:931:c2f0:9437 with SMTP id c12-20020a170906170c00b00931c2f09437mr4078563eje.8.1679419444466;
        Tue, 21 Mar 2023 10:24:04 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id t25-20020a170906065900b00939a61113d3sm1299865ejb.110.2023.03.21.10.24.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Mar 2023 10:24:04 -0700 (PDT)
Message-ID: <9ba49867-20d4-1732-b983-b2d6e14ad4ad@gmail.com>
Date: Tue, 21 Mar 2023 19:24:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
 <ee77a227-13bd-70ad-1d8e-f9719970e0f8@inria.fr>
 <196b5d53-701f-e2dd-596c-9fdb6a59f5cd@gmail.com> <ZBnawJvBVkgyVh78@kroah.com>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <ZBnawJvBVkgyVh78@kroah.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 72C7D3EEF8
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[inria.fr,lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.51:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FI6KCNDESGGUZGVM5U4XV7GIKYEFRJNC
X-Message-ID-Hash: FI6KCNDESGGUZGVM5U4XV7GIKYEFRJNC
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:07 +0000
CC: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 0/3] edits in greybus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FI6KCNDESGGUZGVM5U4XV7GIKYEFRJNC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZotmh4oCPL9mj4oCPL9mi2aDZotmjINmh2ag62aLZpiwgR3JlZyBLSCB3cm90ZToNCj4g
T24gVHVlLCBNYXIgMjEsIDIwMjMgYXQgMDY6MjI6NDRQTSArMDIwMCwgTWVubmEgTWFobW91ZCB3
cm90ZToNCj4+IE9uINmi2aHigI8v2aPigI8v2aLZoNmi2aMg2aHZozrZpNmmLCBKdWxpYSBMYXdh
bGwgd3JvdGU6DQo+Pj4gT24gVHVlLCAyMSBNYXIgMjAyMywgTWVubmEgTWFobW91ZCB3cm90ZToN
Cj4+Pg0KPj4+PiBUaGlzIHBhdGNoc2V0IGluY2x1ZGVzIGNoYW5nZSBoYXBwZW5lZCBpbiBncmV5
YnVzIGRyaXZlciBpbiB0aHJlZQ0KPj4+PiBkaWZmZXJlbnQgZmlsZXMgdHdvIG9mIHRoZW0gcGF0
Y2ggb25lIGFuZCB0aHJlZSByZWxhdGVkIHRvDQo+Pj4+IGNoZWNrcGF0Y2ggaXNzdWUgYW5kIGlu
IHNlY29uZCBwYXRjaCBjb252ZXJ0IHR3bw0KPj4+PiBgY29udGFpbmVyX29mYCBtYWNyb3MgaW50
byBpbmxpbmUgZnVuY3Rpb25zLg0KPj4+Pg0KPj4+PiBNZW5uYSBNYWhtb3VkICgzKToNCj4+Pj4g
ICAgIHN0YWdpbmc6IGdyZXlidXM6IHJlbW92ZSB1bm5lY2Vzc2FyeSBibGFuayBsaW5lDQo+Pj4+
ICAgICBzdGFnaW5nOiBncmV5YnVzOiB1c2UgaW5saW5lIGZ1bmN0aW9uIGZvciBtYWNyb3MNCj4+
Pj4gICAgIHN0YWdpbmc6IGdyZXlidXM6IHJlbW92ZSB1bm5lY2Vzc2FyeSBibGFuayBsaW5lDQo+
Pj4gRGlmZmVyZW50IHBhdGNoZXMgc2hvdWxkIGhhdmUgZGlmZmVyZW50IHN1YmplY3QgbGluZXMu
DQo+PiBCdXQgSSBoYXZlIGFscmVhZHkgdGhlIHNhbWUgZWRpdCBpbiBib3RoIGZpbGUsIHNvIHNo
b3VsZCBJIHJlLXdyaXRlIHRoZQ0KPj4gc3ViamVjdCBmb3Igb25lIG9mIHRoZW0/DQo+Pj4gICAg
IFlvdSBuZWVkIHRvIGVpdGhlcg0KPj4+IGJlIG1vcmUgc3BlY2lmaWMgYWJvdXQgdGhlIGZpbGUg
YWZmZWN0ZWQgb3IgbWVyZ2UgdGhlIHR3byBwYXRjaGVzIHdpdGggdGhlDQo+Pj4gc2FtZSBzdWJq
ZWN0IGludG8gb25lLg0KPj4gZWFjaCBwYXRjaCByZWxhdGVkIHRvIGRpZmZlcmVudCBmaWxlLiBT
bywgQ2FuIEkgdG8gbWVyZ2UgdHdvIGNvbW1pdHMgZm9yDQo+PiBkaWZmZXJlbnQgZmlsZXMgYnV0
IGhhdmUgdGhlIHNhbWUgZWRpdCBpbiBvbmUgcGF0Y2g/DQo+IFllcywgb3IgbWFrZSAyIGRpZmZl
cmVudCBwYXRjaGVzIHdpdGggMiBkaWZmZXJlbnQgc3ViamVjdCBsaW5lcyBhcyB0aGV5DQo+IGFy
ZSBvYnZpb3VzbHkgZG9pbmcgZGlmZmVyZW50IHRoaW5ncy4NCm9rYXksIEkgd2lsbCBmaXggaXQu
DQo+DQo+PiBidXQgaW4gdGhpcyBjYXNlIG5vIG5lZWQgdG8gY3JlYXRlIHBhdGNoc2V0IGZvciBh
bGwgY2hhbmdlcyBpbiBgZ3JleWJ1c2ANCj4+IGRyaXZlciwgcmlnaHQ/DQo+Pg0KPj4gSWYgb2th
eSB3aXRoIHRoYXQsIHNob3VsZCBJIHZlcnNpb25pbmcgdGhlIHBhdGNoZXMgdG8gcmVzZW5kIHRo
ZW0gYWdhaW4sIG9yDQo+PiBzaG91bGQgYWRkICJSRVNFTkQiIHN1YmplY3QgcHJlZml4Pw0KPj4N
Cj4+IHBsZWFzZSB0ZWxsIG1lIHRoZSBiZXN0IHdheSB0byByZXNlbmQgdGhlc2UgcGF0Y2hlcywg
YXBwcmVjaWF0ZSB5b3VyIGhlbHAuDQo+IFdoYXQgd291bGQgeW91IHdhbnQgdG8gc2VlIGlmIHlv
dSBoYWQgdG8gcmV2aWV3IGFuZCBhcHBseSBsb2FkcyBvZg0KPiBwYXRjaGVzIGxpa2UgdGhpcz8N
CnN1cmUgYWRkIHZlcnNpb24gbnVtYmVyIHdpbGwgYmUgZWFzeSB0byByZXZpZXcuDQo+IChoaW50
LCBpdCdzIG5vdCBhIHJlc2VuZCwgYnV0IGEgbmV3IHZlcnNpb24uLi4pDQo+DQo+IHRoYW5rcywN
Cj4NCj4gZ3JlZyBrLWgNCg0KDQpUaGFua3MsDQoNCk1lbm5hDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAt
LSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1h
aWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
