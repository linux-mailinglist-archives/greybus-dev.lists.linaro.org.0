Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 232316BDC0B
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:51:30 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 34F783EB82
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:51:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	by lists.linaro.org (Postfix) with ESMTPS id B56AB3EBAF
	for <greybus-dev@lists.linaro.org>; Sun, 12 Mar 2023 13:43:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=PwlIKtLg;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.41 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso9183503wmq.1
        for <greybus-dev@lists.linaro.org>; Sun, 12 Mar 2023 06:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678628632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jdTS0oXcqOPShopOCv9dsbnq2ZuDXh8kuvCrXKP9vNg=;
        b=PwlIKtLggba+ofgRaiD/18TchGLzFtem23w7SepKAbL9dwz7sZIiu1CpcK1k0f8RyO
         RxlVw2boDEGQUljuvYbVlw8AOkjoJp6BoqI2ztd5YBojuDTnhHlUu8XcMbTgejUZt3xc
         p6fnB/1B63Fri+hrMd2h0Iy9xVRk7PRlZ6OK3/LGVh+PLmST/T8Cn29YDUQRymgtOeSL
         EG+RgaPUE6G7zUrrNOeR+ktAqBG3k/7SORL8W/LIfgtn1A20E+UmY7Avg8ltWCOoWspW
         6xnKsxxF0Op4iv941dSFEJt2tcyf0d8t9L+MpK4oxWiooMDclBtVPqkcW58aXrFPEkql
         szUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628632;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jdTS0oXcqOPShopOCv9dsbnq2ZuDXh8kuvCrXKP9vNg=;
        b=jTISRsHroTuRFfe6BxfIZ8DJKH4FJaWHhMZ9bvK8hqdWOUuEMWdPYFmmla6kOrbXan
         KP7nytpfQm7BcKiUVUdnaYJMACfjDH1JNl/nP/iMVO1Mp8y/GKp5gt9vrqsAVwrsiVKT
         yGuf9dvg7dnfHKL6NjCCtkaV+qy1SQUIYp/s+GxVsNgUduMpLVsyrL/3YqwbM+I5iDLJ
         hsDrBbJbKq6kzoI8TgKqHugGvFbDoCr+gRmpxTeWVienZYpVCl8ZULev4NjViAIomq1Y
         GZuJEnQMh7c2N5WW4GNm195DVRhvLYcYkNtBrhhNTXlI0ETjomxtZlK9azbnbc/o/xSj
         RjiA==
X-Gm-Message-State: AO0yUKWrWlXbwPfTeNq/dTWpK3b4UER779gqYiYbILTDiwyycLqdDNPO
	4nN2sPkeaI7vO+oD4dKRqh0=
X-Google-Smtp-Source: AK7set/kMMY5aSTbCT8WnZwJTg7gtojOqzvxlmr7YrgwkOG0dQTnJA13ODG3EYY1AHeDmJPKSbYQXA==
X-Received: by 2002:a05:600c:4e90:b0:3df:fcbd:3159 with SMTP id f16-20020a05600c4e9000b003dffcbd3159mr6059972wmq.3.1678628631752;
        Sun, 12 Mar 2023 06:43:51 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id o1-20020a05600c4fc100b003e2096da239sm6615732wmq.7.2023.03.12.06.43.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 06:43:51 -0700 (PDT)
Message-ID: <f6e87327-856d-7bfe-bbc8-65ac490a2868@gmail.com>
Date: Sun, 12 Mar 2023 15:43:49 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Alex Elder <elder@ieee.org>, outreachy@lists.linux.dev
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
 <e34f96c7-eee0-6dd6-7662-ffbf04034e27@ieee.org>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <e34f96c7-eee0-6dd6-7662-ffbf04034e27@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B56AB3EBAF
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.41:from]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NG6T37H6EP26C5PZH26Q7YBSOYIKJ2GJ
X-Message-ID-Hash: NG6T37H6EP26C5PZH26Q7YBSOYIKJ2GJ
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NG6T37H6EP26C5PZH26Q7YBSOYIKJ2GJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmi2aE62aHZoCwgQWxleCBFbGRlciB3cm90ZToN
Cj4gT24gMy8xMS8yMyA3OjU5IEFNLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4gIiBFUlJPUjog
TWFjcm9zIHdpdGggbXVsdGlwbGUgc3RhdGVtZW50cyBzaG91bGQgYmUgZW5jbG9zZWQgaW4gYSBk
byAtDQo+PiB3aGlsZSBsb29wIg0KPj4NCj4+IFJlcG9ydGVkIGJ5IGNoZWNrcGF0aC4NCj4NCj4g
VGhpcyBpcyBhbHNvIG5vdCBhbiBpc3N1ZSB0aGF0IHNob3VsZCBiZSAiZml4ZWQuIg0KPg0KPiBJ
ZiB5b3UgbG9vayBhdCB3aGVyZSB0aGF0IG1hY3JvIGlzIGV4cGFuZGVkLCB5b3Ugc2VlDQo+IHRo
YXQgaXRzIHB1cnBvc2UgaXMgc2ltcGx5IHRvIHJlZHVjZSB0aGUgcG9zc2liaWxpdHkNCj4gb2Yg
c29tZSBlcnJvcnMgYnkgZW5jbG9zaW5nIHNvbWUgbXVjaC1kdXBsaWNhdGVkIGNvZGUNCj4gaW4g
dGhpcyBtYWNyby7CoCBUaGUgZXhwYW5zaW9uIGlzIGF0IHRoZSB0b3AgbGV2ZWwgb2YNCj4gdGhl
IHNvdXJjZSBmaWxlLCBzbyBhICJkby4uLndoaWxlIiBsb29wIGVuZHMgdXAgYmVpbmcNCj4gYW4g
ZXJyb3IuDQo+DQo+IFdoZW4gbG9va2luZyBhdCB0aGUgb3V0cHV0IG9mIGNoZWNrcGF0Y2gsIGFz
c3VtZSBpdCdzDQo+IGdpdmluZyB5b3UgY2x1ZXMgYWJvdXQgcHJvYmxlbXMgdGhhdCBvbmUgKm1p
Z2h0KiBsaWtlIHRvDQo+IGZpeC7CoCBJdHMgc3VnZ2VzdGlvbnMgYXJlIG1vc3Qgb2Z0ZW4gcmVh
c29uYWJsZSwgYnV0IGluDQo+IHNvbWUgY2FzZXMgKGxpa2UgdGhpcyBvbmUpIGl0J3MganVzdCBu
b3Qgc21hcnQgZW5vdWdoDQo+IHRvIHJlY29nbml6ZSB0aGUgcHJvYmxlbSB0aGF0IGNvbWVzIGZy
b20gZm9sbG93aW5nIGl0cw0KPiBhZHZpY2UuDQo+DQo+IE1ha2Ugc3VyZSB5b3UgdW5kZXJzdGFu
ZCBleGFjdGx5IHdoYXQgaGFwcGVucyB3aGVuDQo+IHlvdSBtYWtlIGEgY2hhbmdlLsKgIFRoYXQg
bWVhbnMgdW5kZXJzdGFuZGluZyB0aGUNCj4gY29kZSwgYW5kIHRoZW4gaXQgbWVhbnMgZW5zdXJp
bmcgdGhhdCB0aGUgZml4IHBhc3Nlcw0KPiBhdCBsZWFzdCBhIGNvbXBpbGUgdGVzdCwgYW5kIGlm
IHBvc3NpYmxlIGFuIGFjdHVhbA0KPiBleGVjdXRpb24gdGVzdC4NCj4NCj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLUFsZXgNCg0KDQpJIHNlZSwgVGhhbmtzIEFsZXgg
Zm9yIGV4cGxhaW5pbmcuIEkgd2lsbCBjaGVjayB0aGUgY29kZSBiZWZvcmUgbWFraW5nIA0KYW55
IGNoYW5nZS4NCg0KTWVubmENCg0KDQo+DQo+Pg0KPj4gZG8gbG9vcCB3aXRoIHRoZSBjb25kaXRp
b25hbCBleHByZXNzaW9uIHNldCB0byBhIGNvbnN0YW50DQo+PiB2YWx1ZSBvZiB6ZXJvICgwKS5U
aGlzIGNyZWF0ZXMgYSBsb29wIHRoYXQNCj4+IHdpbGwgZXhlY3V0ZSBleGFjdGx5IG9uZSB0aW1l
LlRoaXMgaXMgYSBjb2RpbmcgaWRpb20gdGhhdA0KPj4gYWxsb3dzIGEgbXVsdGktbGluZSBtYWNy
byB0byBiZSB1c2VkIGFueXdoZXJlDQo+PiB0aGF0IGEgc2luZ2xlIHN0YXRlbWVudCBjYW4gYmUg
dXNlZC4NCj4+DQo+PiBTbywgZW5jbG9zZSBgZ2JfbG9vcGJhY2tfc3RhdHNfYXR0cnNgIG1hY3Jv
IGluIGRvIC0gd2hpbGUgKDApIHRvDQo+PiBmaXggY2hlY2twYXRoIGVycm9yDQo+Pg0KPj4gU2ln
bmVkLW9mZi1ieTogTWVubmEgTWFobW91ZCA8ZW5nLm1lbm5hbWFobW91ZC5tbUBnbWFpbC5jb20+
DQo+PiAtLS0NCj4+IMKgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMgfCAxMCAr
KysrKystLS0tDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29w
YmFjay5jIA0KPj4gYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jDQo+PiBpbmRl
eCAxYTYxZmNlOTgwNTYuLmU4NmQ1MDYzOGNiNSAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2xvb3BiYWNrLmMNCj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2xvb3BiYWNrLmMNCj4+IEBAIC0xNjIsMTAgKzE2MiwxMiBAQCBzdGF0aWMgc3NpemVfdCBuYW1l
IyNfYXZnX3Nob3coc3RydWN0IGRldmljZSANCj4+ICpkZXYswqDCoMKgwqDCoMKgwqAgXA0KPj4g
wqAgfcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gwqAgc3RhdGljIERFVklDRV9BVFRSX1JPKG5hbWUjI19h
dmcpDQo+PiDCoCAtI2RlZmluZSBnYl9sb29wYmFja19zdGF0c19hdHRycyhmaWVsZCnCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXA0KPj4gLcKgwqDCoCBnYl9sb29wYmFja19yb19zdGF0
c19hdHRyKGZpZWxkLCBtaW4sIHUpO8KgwqDCoMKgwqDCoMKgIFwNCj4+IC3CoMKgwqAgZ2JfbG9v
cGJhY2tfcm9fc3RhdHNfYXR0cihmaWVsZCwgbWF4LCB1KTvCoMKgwqDCoMKgwqDCoCBcDQo+PiAt
wqDCoMKgIGdiX2xvb3BiYWNrX3JvX2F2Z19hdHRyKGZpZWxkKQ0KPj4gKyNkZWZpbmUgZ2JfbG9v
cGJhY2tfc3RhdHNfYXR0cnMoZmllbGQpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgXA0KPj4gK8KgwqDCoCBkbyB7IFwNCj4+ICvCoMKgwqDCoMKgwqDCoCBnYl9sb29wYmFj
a19yb19zdGF0c19hdHRyKGZpZWxkLCBtaW4sIHUpO8KgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKg
wqDCoMKgwqDCoCBnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZpZWxkLCBtYXgsIHUpO8KgwqDC
oMKgwqDCoMKgIFwNCj4+ICvCoMKgwqDCoMKgwqDCoCBnYl9sb29wYmFja19yb19hdmdfYXR0cihm
aWVsZCk7wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwNCj4+ICvCoMKgwqAgfSB3aGls
ZSAoMCkNCj4+IMKgIMKgICNkZWZpbmUgZ2JfbG9vcGJhY2tfYXR0cihmaWVsZCwgdHlwZSnCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBcDQo+PiDCoCBzdGF0aWMgc3NpemVf
dCBmaWVsZCMjX3Nob3coc3RydWN0IGRldmljZSAqZGV2LCBcDQo+DQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
