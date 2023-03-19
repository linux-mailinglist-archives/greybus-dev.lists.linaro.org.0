Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F22DB6C39CE
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 10DCE441DD
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:19 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	by lists.linaro.org (Postfix) with ESMTPS id 603CA3E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:41:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=QCXSg0MU;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.50 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f50.google.com with SMTP id cy23so36557750edb.12
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 04:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n77gpIMkfR9vfpuZIBERj4t73L0b1VP6S1jA0RpBJo8=;
        b=QCXSg0MUnBdFzcZSLnbE1QRzI7oafpNs+rmvG0a6DhqKILIWug6uhndHwMTdbN4Jer
         hpP8xQfAbO5BzCebVDdWYV2Ao1InMZBnZRqIX7zqSv8E8Qg08b6NTqAxpauYpro6DdPE
         zQmBjfhC1LIu7hr3BWVKVYDNDHBfzFP82vV6O6QVbfWTsKr1oLKmNMgaDhNB1Adxgs/x
         TjHrRBoHKXA11LHf37vw6yzWfDZNX+dXv48BfYkqgEneeWveHONx3dmf+u4S2Q3DZgs2
         /DiJhEyF0ejesLwjJWna3BsLO/G/u6XcwqEHbGSeXH3WmggpwrKUNBovnoOx36vsZmQC
         XoUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226084;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n77gpIMkfR9vfpuZIBERj4t73L0b1VP6S1jA0RpBJo8=;
        b=LCnrGS2Je55ScKGIZkc9jmetmnblU7PQpTmVOqj6UQdLInvX5Ka/NTyII8bVOIsjVs
         1T7jsG+NfsI31uTst/ROlSKpfiTAaC10fSYEMzTZAE9jtOgBwvLdEm5HVyPaTU1lLeWG
         V0st4ej1mCYhdv+P4TBsUnJgDJZIFuHvvNMGlpw/nKVgpBZRrOFsx1ISnfQ/1YvcRg1n
         N1OId1RRtPi9DGw4y/doRBekwUStjnjDRPXoYjTTkt+TyNRc3IfnrrIAUCaXmA0JewsR
         RvqPSC/Hn+gbRQk5RSwC9WD+dQxq9bQmf4Ez1F/OGtaN5BHnuw/XfuAyaoRhhAOKjIhM
         fO9w==
X-Gm-Message-State: AO0yUKVGtCmhq+hS+DS8JLmFJHJBLny+xHylCA9sbdKZq7iqVy31WE0m
	2BMizUvT9Jj0AqY5gt/sXNblaqmhSb0=
X-Google-Smtp-Source: AK7set9+dGMhflo93TOE2qP/DjMA7wCJ+4PQj626XCpyEja/PPRyKcmW5Gr5sblUKO2G2t6HFK2FOw==
X-Received: by 2002:a05:6402:7c3:b0:4fa:4b1c:5ea3 with SMTP id u3-20020a05640207c300b004fa4b1c5ea3mr9114104edy.23.1679226084332;
        Sun, 19 Mar 2023 04:41:24 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id f27-20020a50d55b000000b004c44d00a3b5sm3451508edj.20.2023.03.19.04.41.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 04:41:23 -0700 (PDT)
Message-ID: <6cc1e2f7-e971-b195-acba-9b4c136aa16b@gmail.com>
Date: Sun, 19 Mar 2023 13:41:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: Julia Lawall <julia.lawall@inria.fr>
References: <20230319110831.39931-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303191216240.2867@hadrien>
 <15e81411-e40f-43c5-bb7f-907d6d5f93c5@gmail.com>
 <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303191235580.2867@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 603CA3E965
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.50:from];
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
Message-ID-Hash: D4ASCCPJDDNGVY37DTNNS2BNYLLP7YHH
X-Message-ID-Hash: D4ASCCPJDDNGVY37DTNNS2BNYLLP7YHH
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:55 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D4ASCCPJDDNGVY37DTNNS2BNYLLP7YHH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmp4oCPL9mj4oCPL9mi2aDZotmjINmh2aM62aPZpiwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBTdW4sIDE5IE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
T24g2aHZqS/Zoy/Zotmg2aLZoyDZodmjOtmh2aksIEp1bGlhIExhd2FsbCB3cm90ZToNCj4+PiBP
biBTdW4sIDE5IE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4+DQo+Pj4+IGFkZCBi
bGFuayBsaW5lIGFmdGVyIHN0cnVjdCBmb3IgcmVhZGFiaWxpdHkgYXMNCj4+PiBUaGUgbG9nIG1l
c3NhZ2Ugc2hvdWxkIHN0YXJ0IHdpdGggYSBjYXBpdGFsIGxldHRlciwgc28gIkFkZCIuDQo+Pg0K
Pj4gT2theSwgSSB3aWxsIGZpeCBpdC4NCj4+DQo+Pj4+IHJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2gg
c2NyaXB0DQo+Pj4gInJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2giIG9yICJyZXBvcnRlZCBieSB0aGUg
Y2hlY2twYXRjaCBzY3JpcHQiLg0KPj4+IFRoZSBmaXJzdCBpcyBtb3JlIGNvbmNpc2UsIGFuZCBp
dCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgd2hldGhlciBjaGVja3BhdGNoDQo+Pj4gaXMgYSBzY3Jp
cHQgb3Igc29tZXRoaW5nIGVsc2UuDQo+Pg0KPj4gZ290IGl0Lg0KPj4NCj4+Pj4gIiBDSEVDSzog
UGxlYXNlIHVzZSBhIGJsYW5rIGxpbmUgYWZ0ZXIgZnVuY3Rpb24vc3RydWN0L3VuaW9uL2VudW0N
Cj4+Pj4gZGVjbGFyYXRpb25zIg0KPj4+IEkgZ3Vlc3MgdGhlICNkZWZpbmUgd2FzIGNvbmNhdGVu
YXRlZCB0byB0aGUgZW5kIG9mIHRoZSBkZWZpbml0aW9uIHRvIHNob3cNCj4+PiB0aGF0IGl0IGlz
IGNsb3NlbHkgcmVsYXRlZCB0byB0aGUgZGVmaW5pdGlvbi4gIFdpdGggdGhlICNkZWZpbmUsIGl0
IHNlZW1zDQo+Pj4gcmF0aGVyIG5hdHVyYWwsIGJ1dCB0aGUgYmV0dGVyIHNvbHR1dGlvbiB3b3Vs
ZCBiZSB0byBtYWtlIGEgc3RhdGljIGlubGluZQ0KPj4+IGZ1bmN0aW9uIGluIGJvdGggY2FzZXMu
ICBUaGVyZSB3b3VsZCBuYXR1cmFsbHkgYmUgYSBibGFuayBsaW5lIGJlZm9yZSBhDQo+Pj4gZnVu
Y3Rpb24gZGVmaW5pdGlvbiBhcyB3ZWxsLg0KPj4NCj4+IGdvdCB5b3VyIHBvaW50LCBzbywgc2hv
dWxkIGkgaWdub3JlIHRoaXM/DQo+IE5vdCBzdXJlIHdoYXQgeW91IG1lYW4gYnkgaWdub3JlLiAg
SWYgeW91IHJld3JpdGUgdGhlICNkZWZpbmUgYXMgYQ0KPiBmdW5jdGlvbiwgYW4gdXNlIHRoZSBu
YXR1cmFsIHBsYWNlbWVudCBmb3IgYSBmdW5jdGlvbiBkZWZpbml0aW9uLCB0aGVuIHRoZQ0KPiBj
aGVja3BhdGNoIHdhcm5pbmcgd2lsbCBnbyBhd2F5IGFzIGEgc2lkZSBlZmZlY3QuDQoNCg0KSSBt
ZWFuIGlnbm9yZSB0aGlzIHBhdGNoIGFuZCBtYWtlIGFub3RoZXIgcGF0Y2ggd2l0aCByZXdyaXRl
ICNkZWZpbmUgYXMgDQp5b3Ugc3VnZ2VzdGVkLg0KDQoNCk1lbm5hDQoNCj4NCj4ganVsaWENCj4N
Cj4+DQo+PiBNZW5uYQ0KPj4NCj4+PiBqdWxpYQ0KPj4+DQo+Pj4+IFNpZ25lZC1vZmYtYnk6IE1l
bm5hIE1haG1vdWQgPGVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwuY29tPg0KPj4+PiAtLS0NCj4+
Pj4gICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaCB8IDIgKysNCj4+Pj4gICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQ0KPj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaA0KPj4+PiBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2dicGh5LmgNCj4+Pj4gaW5kZXggZDRhMjI1Yjc2MzM4Li4xZGU1MTA0OTk0ODAgMTAwNjQ0
DQo+Pj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmgNCj4+Pj4gKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaA0KPj4+PiBAQCAtMTUsNiArMTUsNyBAQCBz
dHJ1Y3QgZ2JwaHlfZGV2aWNlIHsNCj4+Pj4gICAgCXN0cnVjdCBsaXN0X2hlYWQgbGlzdDsNCj4+
Pj4gICAgCXN0cnVjdCBkZXZpY2UgZGV2Ow0KPj4+PiAgICB9Ow0KPj4+PiArDQo+Pj4+ICAgICNk
ZWZpbmUgdG9fZ2JwaHlfZGV2KGQpIGNvbnRhaW5lcl9vZihkLCBzdHJ1Y3QgZ2JwaHlfZGV2aWNl
LCBkZXYpDQo+Pj4+DQo+Pj4+ICAgIHN0YXRpYyBpbmxpbmUgdm9pZCAqZ2JfZ2JwaHlfZ2V0X2Rh
dGEoc3RydWN0IGdicGh5X2RldmljZSAqZ2RldikNCj4+Pj4gQEAgLTQzLDYgKzQ0LDcgQEAgc3Ry
dWN0IGdicGh5X2RyaXZlciB7DQo+Pj4+DQo+Pj4+ICAgIAlzdHJ1Y3QgZGV2aWNlX2RyaXZlciBk
cml2ZXI7DQo+Pj4+ICAgIH07DQo+Pj4+ICsNCj4+Pj4gICAgI2RlZmluZSB0b19nYnBoeV9kcml2
ZXIoZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYnBoeV9kcml2ZXIsIGRyaXZlcikNCj4+Pj4N
Cj4+Pj4gICAgaW50IGdiX2dicGh5X3JlZ2lzdGVyX2RyaXZlcihzdHJ1Y3QgZ2JwaHlfZHJpdmVy
ICpkcml2ZXIsDQo+Pj4+IC0tDQo+Pj4+IDIuMzQuMQ0KPj4+Pg0KPj4+Pg0KPj4+Pg0KPiA+DQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNj
cmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
