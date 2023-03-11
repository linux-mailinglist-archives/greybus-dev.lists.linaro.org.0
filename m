Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CB2EF6BDC05
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:51:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D0E783E8AA
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:51:18 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	by lists.linaro.org (Postfix) with ESMTPS id C35013EA3C
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:58:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=BFDli0m4;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.53 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id az36so5224772wmb.1
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PHMcirR/d0kseQKUwfhmLV8C1xKi97ZsvINp73wm0WE=;
        b=BFDli0m4yLqGA6cjuaqJUZIXSBMXawkQCw+cH6P4/54xB07/I/M1OtP/b2WfoufIDO
         j00g4aTzYtiO+HYL2a4INamzXPUhEx0JpZC387prnOyaN4tOI0dv0tFNN+5RpM9r7b+J
         J2FGmBMAHSlb/vICDCqFCaGDMcgkDTa3Hb/iyeRn2wiw0R3gA7eA+V4T/ddKd1I1CsPv
         0DAwntz2S876jn5xbwr281svxc5AAOHLrl9b4/W5EKur4iLH4So3oyDMTLxLkCx1sdxO
         n5oV+uPbVyszALE851sgbwnTE3QoyEoq4lHaG3zEnQ1Q3i8Zr4jKyzXIqNtiEFAkAqYp
         TsNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546693;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PHMcirR/d0kseQKUwfhmLV8C1xKi97ZsvINp73wm0WE=;
        b=svsEvHZ6kBiwntNjT88/gDZ3wEHOGjsSceliTADNJVXflPdqKNI2ltGtIFSCaHikuc
         Aj5QHB9h9SMK0007a21k2JG+ixrWi61aokya5cvJthnSHOKCRW5pmrh9gl1azE2+r3yb
         hQCSFq0nETW8lYuPFCZzcsADuen3l7obiGMoezmZrLON2nn584xeIz/dCGq9cngfVlCj
         Z9Qbd0Fafvvgysd7Ui9jUt2VB7fVFaGsosEAN4qyDv7xWPbzmnPPx02Y7P5g8JduBdPG
         vcKGVrr7zD0RM1KMXTzAXh4gzkjaYUBOszAXF9IG4bA3gFADZq53UWrq2J0zvlkv0niH
         BhHw==
X-Gm-Message-State: AO0yUKWPUUAZwqxUlaCm03AEzOw49I2N1+bWh29lGL3R9T/47oCv7TO2
	elocBoW5KY6shDns2izPMZ0=
X-Google-Smtp-Source: AK7set+mQmPFifs0KWevNYp+Yp9EVN+4oNFdxjduyjxiOzzeU0Y3yT2QwK/SxBiyf73sBNaN1c1UXw==
X-Received: by 2002:a05:600c:3c8f:b0:3ea:bc08:b63e with SMTP id bg15-20020a05600c3c8f00b003eabc08b63emr6133252wmb.2.1678546692848;
        Sat, 11 Mar 2023 06:58:12 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id w7-20020a05600c474700b003e1202744f2sm3205826wmo.31.2023.03.11.06.58.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:58:12 -0800 (PST)
Message-ID: <fe97c33f-536a-5951-73bd-169b67d9b8d8@gmail.com>
Date: Sat, 11 Mar 2023 16:58:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
 <alpine.DEB.2.22.394.2303111537430.2802@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303111537430.2802@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C35013EA3C
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	RCVD_IN_DNSWL_HI(-0.50)[209.85.128.53:from];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.53:from];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5ZLMMEJHW7LYBUL52WDWGK4TJWUVCM6O
X-Message-ID-Hash: 5ZLMMEJHW7LYBUL52WDWGK4TJWUVCM6O
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:30 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5ZLMMEJHW7LYBUL52WDWGK4TJWUVCM6O/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aY62aPZqCwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBTYXQsIDExIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
T24g2aHZoS/Zoy/Zotmg2aLZoyDZodmkOtml2acsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+Pj4g
T24g2aHZoS/Zoy/Zotmg2aLZoyDZodmkOtml2aUsIEp1bGlhIExhd2FsbCB3cm90ZToNCj4+Pj4g
T24gU2F0LCAxMSBNYXIgMjAyMywgTWVubmEgTWFobW91ZCB3cm90ZToNCj4+Pj4NCj4+Pj4+IE9u
INmh2aEv2aMv2aLZoNmi2aMg2aHZoDrZpdmpLCBKdWxpYSBMYXdhbGwgd3JvdGU6DQo+Pj4+Pj4g
T24gRnJpLCAxMCBNYXIgMjAyMywgTWVubmEgTWFobW91ZCB3cm90ZToNCj4+Pj4+Pg0KPj4+Pj4+
PiBGaXggIiBDSEVDSzogQWxpZ25tZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzICIN
Cj4+Pj4+Pj4gUmVwb3J0ZWQgYnkgY2hlY2twYXRoDQo+Pj4+Pj4gU2VlIHRoZSBtZXNzYWdlIGlu
IHRoZSBvdGhlciBtYWlsIGFib3V0IHRoZSBsb2cgbWVzc2FnZS4NCj4+Pj4+Pg0KPj4+Pj4+IEFs
c28sIHlvdSBzaG91bGQgbm90IGhhdmUgdHdvIHBhdGNoZXMgd2l0aCB0aGUgc2FtZSBzdWJqZWN0
LsKgIEhlcmUsDQo+Pj4+Pj4gdGhlDQo+Pj4+Pj4gY2hhbmdlcyBhcmUgb24gdGhlIHNhbWUgZmls
ZSBhbmQgYXJlIGVzc2VudGlhbGx5IHRoZSBzYW1lLCBldmVuDQo+Pj4+Pj4gaW52b2x2aW5nDQo+
Pj4+Pj4gdGhlIHNhbWUgZnVuY3Rpb24gY2FsbC7CoCBTbyB0aGV5IGNhbiBiZSB0b2dldGhlciBp
biBvbmUgcGF0Y2guDQo+Pj4+Pj4NCj4+Pj4+PiBqdWxpYQ0KPj4+Pj4gb2theSwgSSB3aWxsLiBh
cHByZWNpYXRlIHlvdXIgZmVlZGJhY2suIHRoYW5rcy4NCj4+Pj4gUGxlYXNlIHB1dCBzb21lIGJs
YW5rIGxpbmVzIGFyb3VuZCB5b3VyIHJlc3BvbnNlLCBzbyBpdCBpcyBlYXNpZXIgdG8gZmluZC4N
Cj4+Pj4NCj4+Pj4gdGhhbmtzLA0KPj4+PiBqdWxpYQ0KPj4+DQo+Pj4gT2theSwgSSB3aWxsLg0K
Pj4+DQo+Pj4gdGhhbmtzLA0KPj4+DQo+Pj4gTWVubmENCj4+DQo+Pg0KPj4gSGkgSnVsaWEsDQo+
Pg0KPj4gYWNjb3JkaW5nIHRvIEFsZXggZmVlZGJhY2sNCj4+DQo+PiAiIEkgdGhpbmsgdGhpcyB0
eXBlIG9mIGFsaWdubWVudCBpcyBub3QgYSBtYWpvciBwcm9ibGVtLA0KPj4gYW5kIGFsaWdubWVu
dCBpc24ndCBkb25lIHRoaXMgd2F5IGluIGdlbmVyYWwgaW4gdGhpcw0KPj4gZHJpdmVyLCBpdCdz
IHByb2JhYmx5IE9LIHRvIGtlZXAgaXQgdGhhdCB3YXkuIC0gQWxleCAiDQo+Pg0KPj4NCj4+ICxJ
IHdvbid0IHJlc3VibWl0IHRoZXNlIHBhdGNoZXMsIHJpZ2h0Pw0KPiBUaGUgZXhpc3RpbmcgY29k
ZSBpbmRlZWQgbG9va3MgYmV0dGVyIHRvIG1lLiAgU28geW91IGNhbiBza2lwIHRoaXMgaXNzdWUu
DQo+DQo+IGp1bGlhDQoNCg0KT2theSwgdGhhbmtzIEp1bGlhLg0KDQoNCj4NCj4+DQo+PiAgwqAt
TWVubmENCj4+DQo+Pg0KPj4+DQo+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6IE1lbm5hIE1haG1vdWQg
PGVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwuY29tPg0KPj4+Pj4+PiAtLS0NCj4+Pj4+Pj4gIMKg
wqAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jIHwgMiArLQ0KPj4+Pj4+PiAgwqDC
oCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+Pj4+Pj4N
Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0K
Pj4+Pj4+PiBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0KPj4+Pj4+PiBpbmRl
eCA1N2JlYmYyNDYzNmIuLmY1NjJjYjEyZDVhZCAxMDA2NDQNCj4+Pj4+Pj4gLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jDQo+Pj4+Pj4+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2Z3LWNvcmUuYw0KPj4+Pj4+PiBAQCAtODksNyArODksNyBAQCBzdGF0aWMgaW50
IGdiX2Z3X2NvcmVfcHJvYmUoc3RydWN0IGdiX2J1bmRsZQ0KPj4+Pj4+PiAqYnVuZGxlLA0KPj4+
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+Pj4+Pj4+DQo+Pj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5lY3Rpb24gPSBnYl9jb25uZWN0aW9uX2Ny
ZWF0ZShidW5kbGUsIGNwb3J0X2lkLA0KPj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnYl9md19tZ210X3JlcXVlc3RfaGFuZGxlcik7DQo+Pj4+
Pj4+ICsNCj4+Pj4+Pj4gZ2JfZndfbWdtdF9yZXF1ZXN0X2hhbmRsZXIpOw0KPj4+Pj4+PiAgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGNvbm5lY3Rpb24pKSB7DQo+Pj4+
Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gUFRSX0VSUihj
b25uZWN0aW9uKTsNCj4+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZXZfZXJyKCZidW5kbGUtPmRldiwNCj4+Pj4+Pj4gLS0NCj4+Pj4+Pj4gMi4zNC4xDQo+Pj4+
Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+DQo+ID4NCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1
cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
