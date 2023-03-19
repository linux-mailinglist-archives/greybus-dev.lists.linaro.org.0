Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7296C39D3
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:41 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D5AC93EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:40 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	by lists.linaro.org (Postfix) with ESMTPS id F1F6E3E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:52:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="RF3a/GCx";
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.49 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id x3so36641119edb.10
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 04:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLj0P1lq2bvFo+/6zRlEm0LLZrtFvTkebdhPbz6tAow=;
        b=RF3a/GCx8fBvZKTPgsUV9XVNsAJagR0XmHOKMLH2StTNeRbv7PAry1esWVwyj7Se9T
         +GbeuXz4rDcnxFRQ0ifEtFNi4SpGrzAoB3bpSgPJwEOqGY0tTTMd35kRSm1+1c7GKq3y
         Jh2ImdKHcRbqYZnSOdsTMYpq7WltsBVpxxXu2dC+n7zycw27CYXu9tZV1J/sMKHbccec
         XlvsZq9FZ3ByGW9L/KVF1DXWMQcAfUm2l5ZHZBvet3Z6sKAMrN95wPeK/Agdohdd7B9m
         Xa2u8aEVBsIKxN3tVJ8f4o/qE4vRTTV20C0OonkYqLet9VphEZfTkiLXg0SEL2VnPxXN
         8ytg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226760;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLj0P1lq2bvFo+/6zRlEm0LLZrtFvTkebdhPbz6tAow=;
        b=BE+UCYw0pp1kYelF12uQUXGjbj6K7mGbVEmUYLbhhYhdoO21kIGIATw81Yfia2610H
         dtfRtbxgGFQpRwDyukdIg+lBcynRDV67t/vnVOnO7e97ZVPz830cH+y6MbDZZTb3GG9s
         tWDLySd5GDaPDcUSHU8TBUnObyTUePhpGU678hSaCpVb4ZNTAPiTD1P2wcXRX+bJpdR+
         M0A6eQ7aEi2/n6m0IPkdiz/J/uxtH617iV6uzQVEBSXRPwSaFym07WWo4P0PV1IH+gPh
         UrpTSJPZC4ewnERwhdrbVqG3lwrnNA2JsajxvxQoy9fxIYAOq7jTazfzPs0RPe0pgWQG
         Py7w==
X-Gm-Message-State: AO0yUKXshs+QZGOVA+VwIdBmeGpK/Pfb9mYtjAd8xAKFTTL2DWmWh6wf
	OH6O1FRc91n3ye8yJG6TREk=
X-Google-Smtp-Source: AK7set9h4sX9QnfNlzB8p4fQlOOvU+gnT/OTj9SGs/mAADG3tXujvXMnY8dX/DqRFM5xOPh71P9wGw==
X-Received: by 2002:aa7:d48b:0:b0:4ac:bcf9:6d6c with SMTP id b11-20020aa7d48b000000b004acbcf96d6cmr8217438edr.36.1679226759954;
        Sun, 19 Mar 2023 04:52:39 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v6-20020a50d086000000b004fb00831851sm3379178edd.66.2023.03.19.04.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:52:39 -0700 (PDT)
Message-ID: <c82427af-dc37-734b-348c-371103a4ff90@gmail.com>
Date: Sun, 19 Mar 2023 13:52:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
 <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
 <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
 <6cc1e2f7-e971-b195-acba-9b4c136aa16b@gmail.com>
 <alpine.DEB.2.22.394.2303191246190.2867@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303191246190.2867@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: F1F6E3E965
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.49:from];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AHGX2O2HMDADSKBWQ7HV4U462MM5GY5M
X-Message-ID-Hash: AHGX2O2HMDADSKBWQ7HV4U462MM5GY5M
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:56 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AHGX2O2HMDADSKBWQ7HV4U462MM5GY5M/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmp4oCPL9mj4oCPL9mi2aDZotmjINmh2aM62aTZpiwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBTdW4sIDE5IE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
T24g2aHZqS/Zoy/Zotmg2aLZoyDZodmjOtmj2aYsIEp1bGlhIExhd2FsbCB3cm90ZToNCj4+PiBP
biBTdW4sIDE5IE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4+DQo+Pj4+IE9uINmh
2akv2aMv2aLZoNmi2aMg2aHZozrZodmpLCBKdWxpYSBMYXdhbGwgd3JvdGU6DQo+Pj4+PiBPbiBT
dW4sIDE5IE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4+Pj4NCj4+Pj4+PiBhZGQg
YmxhbmsgbGluZSBhZnRlciBzdHJ1Y3QgZm9yIHJlYWRhYmlsaXR5IGFzDQo+Pj4+PiBUaGUgbG9n
IG1lc3NhZ2Ugc2hvdWxkIHN0YXJ0IHdpdGggYSBjYXBpdGFsIGxldHRlciwgc28gIkFkZCIuDQo+
Pj4+IE9rYXksIEkgd2lsbCBmaXggaXQuDQo+Pj4+DQo+Pj4+Pj4gcmVwb3J0ZWQgYnkgY2hlY2tw
YXRjaCBzY3JpcHQNCj4+Pj4+ICJyZXBvcnRlZCBieSBjaGVja3BhdGNoIiBvciAicmVwb3J0ZWQg
YnkgdGhlIGNoZWNrcGF0Y2ggc2NyaXB0Ii4NCj4+Pj4+IFRoZSBmaXJzdCBpcyBtb3JlIGNvbmNp
c2UsIGFuZCBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgd2hldGhlcg0KPj4+Pj4gY2hlY2twYXRj
aA0KPj4+Pj4gaXMgYSBzY3JpcHQgb3Igc29tZXRoaW5nIGVsc2UuDQo+Pj4+IGdvdCBpdC4NCj4+
Pj4NCj4+Pj4+PiAiIENIRUNLOiBQbGVhc2UgdXNlIGEgYmxhbmsgbGluZSBhZnRlciBmdW5jdGlv
bi9zdHJ1Y3QvdW5pb24vZW51bQ0KPj4+Pj4+IGRlY2xhcmF0aW9ucyINCj4+Pj4+IEkgZ3Vlc3Mg
dGhlICNkZWZpbmUgd2FzIGNvbmNhdGVuYXRlZCB0byB0aGUgZW5kIG9mIHRoZSBkZWZpbml0aW9u
IHRvDQo+Pj4+PiBzaG93DQo+Pj4+PiB0aGF0IGl0IGlzIGNsb3NlbHkgcmVsYXRlZCB0byB0aGUg
ZGVmaW5pdGlvbi4gIFdpdGggdGhlICNkZWZpbmUsIGl0DQo+Pj4+PiBzZWVtcw0KPj4+Pj4gcmF0
aGVyIG5hdHVyYWwsIGJ1dCB0aGUgYmV0dGVyIHNvbHR1dGlvbiB3b3VsZCBiZSB0byBtYWtlIGEg
c3RhdGljDQo+Pj4+PiBpbmxpbmUNCj4+Pj4+IGZ1bmN0aW9uIGluIGJvdGggY2FzZXMuICBUaGVy
ZSB3b3VsZCBuYXR1cmFsbHkgYmUgYSBibGFuayBsaW5lIGJlZm9yZSBhDQo+Pj4+PiBmdW5jdGlv
biBkZWZpbml0aW9uIGFzIHdlbGwuDQo+Pj4+IGdvdCB5b3VyIHBvaW50LCBzbywgc2hvdWxkIGkg
aWdub3JlIHRoaXM/DQo+Pj4gTm90IHN1cmUgd2hhdCB5b3UgbWVhbiBieSBpZ25vcmUuICBJZiB5
b3UgcmV3cml0ZSB0aGUgI2RlZmluZSBhcyBhDQo+Pj4gZnVuY3Rpb24sIGFuIHVzZSB0aGUgbmF0
dXJhbCBwbGFjZW1lbnQgZm9yIGEgZnVuY3Rpb24gZGVmaW5pdGlvbiwgdGhlbiB0aGUNCj4+PiBj
aGVja3BhdGNoIHdhcm5pbmcgd2lsbCBnbyBhd2F5IGFzIGEgc2lkZSBlZmZlY3QuDQo+Pg0KPj4g
SSBtZWFuIGlnbm9yZSB0aGlzIHBhdGNoIGFuZCBtYWtlIGFub3RoZXIgcGF0Y2ggd2l0aCByZXdy
aXRlICNkZWZpbmUgYXMgeW91DQo+PiBzdWdnZXN0ZWQuDQo+IFllcyA6KSAgVGhhdCdzIGZpbmUg
KCJkcm9wIiB3b3VsZCBiZSBiZXR0ZXIgdGhhbiAiaWdub3JlIikuDQo+DQo+IGp1bGlhDQo+DQpP
a2F5IDpELCBUaGFua3MgSnVsaWEuDQoNCk1lbm5hDQoNCj4+DQo+PiBNZW5uYQ0KPj4NCj4+PiBq
dWxpYQ0KPj4+DQo+Pj4+IE1lbm5hDQo+Pj4+DQo+Pj4+PiBqdWxpYQ0KPj4+Pj4NCj4+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBNZW5uYSBNYWhtb3VkIDxlbmcubWVubmFtYWhtb3VkLm1tQGdtYWlsLmNv
bT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiAgICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHku
aCB8IDIgKysNCj4+Pj4+PiAgICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+
Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmgN
Cj4+Pj4+PiBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmgNCj4+Pj4+PiBpbmRleCBk
NGEyMjViNzYzMzguLjFkZTUxMDQ5OTQ4MCAxMDA2NDQNCj4+Pj4+PiAtLS0gYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9nYnBoeS5oDQo+Pj4+Pj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvZ2JwaHkuaA0KPj4+Pj4+IEBAIC0xNSw2ICsxNSw3IEBAIHN0cnVjdCBnYnBoeV9kZXZpY2Ug
ew0KPj4+Pj4+ICAgICAJc3RydWN0IGxpc3RfaGVhZCBsaXN0Ow0KPj4+Pj4+ICAgICAJc3RydWN0
IGRldmljZSBkZXY7DQo+Pj4+Pj4gICAgIH07DQo+Pj4+Pj4gKw0KPj4+Pj4+ICAgICAjZGVmaW5l
IHRvX2dicGh5X2RldihkKSBjb250YWluZXJfb2YoZCwgc3RydWN0IGdicGh5X2RldmljZSwgZGV2
KQ0KPj4+Pj4+DQo+Pj4+Pj4gICAgIHN0YXRpYyBpbmxpbmUgdm9pZCAqZ2JfZ2JwaHlfZ2V0X2Rh
dGEoc3RydWN0IGdicGh5X2RldmljZSAqZ2RldikNCj4+Pj4+PiBAQCAtNDMsNiArNDQsNyBAQCBz
dHJ1Y3QgZ2JwaHlfZHJpdmVyIHsNCj4+Pj4+Pg0KPj4+Pj4+ICAgICAJc3RydWN0IGRldmljZV9k
cml2ZXIgZHJpdmVyOw0KPj4+Pj4+ICAgICB9Ow0KPj4+Pj4+ICsNCj4+Pj4+PiAgICAgI2RlZmlu
ZSB0b19nYnBoeV9kcml2ZXIoZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYnBoeV9kcml2ZXIs
DQo+Pj4+Pj4gZHJpdmVyKQ0KPj4+Pj4+DQo+Pj4+Pj4gICAgIGludCBnYl9nYnBoeV9yZWdpc3Rl
cl9kcml2ZXIoc3RydWN0IGdicGh5X2RyaXZlciAqZHJpdmVyLA0KPj4+Pj4+IC0tDQo+Pj4+Pj4g
Mi4zNC4xDQo+Pj4+Pj4NCj4+Pj4+Pg0KPj4+Pj4+DQo+ID4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
