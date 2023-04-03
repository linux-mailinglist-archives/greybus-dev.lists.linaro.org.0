Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C9E6D5040
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 20:25:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CDF613ED6B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 18:25:51 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	by lists.linaro.org (Postfix) with ESMTPS id 0B5CE3ED6B
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 13:50:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=FBZS5eB+;
	spf=pass (lists.linaro.org: domain of angelalbertoc.r@gmail.com designates 209.85.221.49 as permitted sender) smtp.mailfrom=angelalbertoc.r@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id i9so29438849wrp.3
        for <greybus-dev@lists.linaro.org>; Mon, 03 Apr 2023 06:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680529849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UvpaphTphPILlXv+75hdRiwUo1vRIDOFyCbyVIu5Xk0=;
        b=FBZS5eB+KpZkZ6HVU/zmYXUwGAX1oFM6A459QIXUP8XyMPZEw4UjUhGMQ8p2u05eeP
         rWTfDqgJm/He7DmT13oVX2smDp/CX7vk7+DZvLUvK1D1Ek310X40M+vXJjtUEd6ollvY
         dZusuZSPe+WNc0Hcb+n9YZaQEynFW+3ZUZaV3CEjCUyzZ3z+1Atv1BFMdtSpMpzWPbwY
         Eqhycincm78b3gdEEJTohg+UBvHwNaZ+yItaHruZtA2h+jjnMajFp4dTvJ2WO0/V4oG3
         XkJesfyqk4srEiF/nmGLJpqLUo7ktOeyLnBRR82LBg8WNG0Aao36wqHI3lQWNoXKoRIS
         caog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680529849;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UvpaphTphPILlXv+75hdRiwUo1vRIDOFyCbyVIu5Xk0=;
        b=wTP4wNgECsySSv+nCijJzNyRKG8aCAJDRU6fk9IOwNW8evCQeDpDorfCU0PvZfwCYD
         Rkb6tw1aGLD4Ti4ilULtzZYcMUbE6LOrEsH08nWS27tGRraUysyQx+K8s6wP0sswh28t
         xpvZDvc4qB3MfoZMHECRtVgYZHa8lA7k2F9e5PA4cKSjt62ytPhSyNLtHD2PZr/PKvTb
         YXa3YPNmwtuQwyQmZMl3pVtTsFtVwSDEje90fxL1hevuZsrMWz5XuGkKg8hwk7p8xGEg
         4YkottTK6nuDYfKeqOBfxFq+7r1+fYL7kTCzpSE/sEh0C/W2xVq1mQujsWA88t0tWZVB
         x0hw==
X-Gm-Message-State: AAQBX9czviwLEIlNr4umR5T0cAmgjrN7akwtp6srIAE1QpLwUHTJish+
	HBhyYzopiXgDSkbm2F1ld/E=
X-Google-Smtp-Source: AKy350aJ21t/X3VvTCa4wZg4U+/UV6q/xZMbrnBVM5oCMwzGGfTbuBmMO0iLPFB6Sb11OhbdJSBu0A==
X-Received: by 2002:adf:dd4f:0:b0:2cf:ec75:8090 with SMTP id u15-20020adfdd4f000000b002cfec758090mr27014222wrm.14.1680529848836;
        Mon, 03 Apr 2023 06:50:48 -0700 (PDT)
Received: from ?IPV6:2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3? ([2a0c:5a82:e704:7800:4aa3:3ca0:c843:43e3])
        by smtp.gmail.com with ESMTPSA id p4-20020a056000018400b002c56013c07fsm9688764wrx.109.2023.04.03.06.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Apr 2023 06:50:48 -0700 (PDT)
Message-ID: <82421ce7-bb38-5f15-6b70-a2ee08bd7833@gmail.com>
Date: Mon, 3 Apr 2023 15:50:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <20230402122550.70682-1-angelalbertoc.r@gmail.com>
 <2023040252-racoon-daintily-3589@gregkh>
 <0af15115-9641-a1c8-f398-c4e8e77379a3@gmail.com>
 <2cb170e2-3551-4f2a-9cd3-065d9bd4504b@kili.mountain>
 <2023040301-tapping-umbilical-f7b4@gregkh>
From: =?UTF-8?Q?=c3=81ngel_Alberto_Carretero?= <angelalbertoc.r@gmail.com>
In-Reply-To: <2023040301-tapping-umbilical-f7b4@gregkh>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 0B5CE3ED6B
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.49:from];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[nexus-software.ie,kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com]
X-MailFrom: angelalbertoc.r@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EOY3BRIYBWBCAUH7FDCB53CVWGM3ZPT6
X-Message-ID-Hash: EOY3BRIYBWBCAUH7FDCB53CVWGM3ZPT6
X-Mailman-Approved-At: Mon, 03 Apr 2023 18:25:48 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: fix up checkpath macro do while error.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EOY3BRIYBWBCAUH7FDCB53CVWGM3ZPT6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQoNCk9uIDAzLzA0LzIwMjMgMDk6MjEsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToNCj4gT24g
TW9uLCBBcHIgMDMsIDIwMjMgYXQgMDk6MjM6NTVBTSArMDMwMCwgRGFuIENhcnBlbnRlciB3cm90
ZToNCj4+IE9uIFN1biwgQXByIDAyLCAyMDIzIGF0IDA4OjIyOjM1UE0gKzAyMDAsIMOBbmdlbCBB
bGJlcnRvIENhcnJldGVybyB3cm90ZToNCj4+Pg0KPj4+DQo+Pj4gT24gMDIvMDQvMjAyMyAxNTox
NiwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOg0KPj4+PiBPbiBTdW4sIEFwciAwMiwgMjAyMyBh
dCAwMjoyNTo1MVBNICswMjAwLCBBbmdlbCBBbGJlcnRvIENhcnJldGVybyB3cm90ZToNCj4+Pj4+
IFdyYXAgbWFjcm8gaW4gYSBkby13aGlsZSBzdGF0ZW1lbnQuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVk
LW9mZi1ieTogQW5nZWwgQWxiZXJ0byBDYXJyZXRlcm8gPGFuZ2VsYWxiZXJ0b2MuckBnbWFpbC5j
b20+DQo+Pj4+PiAtLS0NCj4+Pj4+ICAgIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNr
LmMgfCA4ICsrKysrLS0tDQo+Pj4+PiAgICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9sb29wYmFjay5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2su
Yw0KPj4+Pj4gaW5kZXggZDdiMzlmM2JiNjUyLi4zNzE4MDk3NzBlZDAgMTAwNjQ0DQo+Pj4+PiAt
LS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jDQo+Pj4+PiArKysgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jDQo+Pj4+PiBAQCAtMTYyLDkgKzE2MiwxMSBA
QCBzdGF0aWMgc3NpemVfdCBuYW1lIyNfYXZnX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAkJXA0K
Pj4+Pj4gICAgc3RhdGljIERFVklDRV9BVFRSX1JPKG5hbWUjI19hdmcpDQo+Pj4+PiAgICAjZGVm
aW5lIGdiX2xvb3BiYWNrX3N0YXRzX2F0dHJzKGZpZWxkKQkJCQlcDQo+Pj4+PiAtCWdiX2xvb3Bi
YWNrX3JvX3N0YXRzX2F0dHIoZmllbGQsIG1pbiwgdSk7CQlcDQo+Pj4+PiAtCWdiX2xvb3BiYWNr
X3JvX3N0YXRzX2F0dHIoZmllbGQsIG1heCwgdSk7CQlcDQo+Pj4+PiAtCWdiX2xvb3BiYWNrX3Jv
X2F2Z19hdHRyKGZpZWxkKQ0KPj4+Pj4gKwlkbyB7CQlcDQo+Pj4+PiArCQlnYl9sb29wYmFja19y
b19zdGF0c19hdHRyKGZpZWxkLCBtaW4sIHUpOwkJXA0KPj4+Pj4gKwkJZ2JfbG9vcGJhY2tfcm9f
c3RhdHNfYXR0cihmaWVsZCwgbWF4LCB1KTsJCVwNCj4+Pj4+ICsJCWdiX2xvb3BiYWNrX3JvX2F2
Z19hdHRyKGZpZWxkKTsJCVwNCj4+Pj4+ICsJfSB3aGlsZSAoMCkNCj4+Pj4+ICAgICNkZWZpbmUg
Z2JfbG9vcGJhY2tfYXR0cihmaWVsZCwgdHlwZSkJCQkJCVwNCj4+Pj4+ICAgIHN0YXRpYyBzc2l6
ZV90IGZpZWxkIyNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCQkJCVwNCj4+Pj4+IC0tIA0KPj4+
Pj4gMi40MC4wDQo+Pj4+Pg0KPj4+Pj4NCj4+Pj4NCj4+Pj4gQW55IHNwZWNpZmljIHJlYXNvbiB3
aHkgeW91IGRpZCBub3QgdGVzdCBidWlsZCB5b3VyIGNoYW5nZSBiZWZvcmUNCj4+Pj4gc3VibWl0
dGluZyBpdD8NCj4+Pj4NCj4+Pj4gdGhhbmtzLA0KPj4+Pg0KPj4+PiBncmVnIGstaA0KPj4+DQo+
Pj4gQXBvbG9naWVzLCB3ZSBjYW4gZHJvcCB0aGUgcGF0Y2guIEkgd2FzIHRyeWluZyB0byBmaW5k
IGFuIGVycm9yIGFzIHBhcnQNCj4+PiBvZiB0aGUgZXVkeXB0dWxhIGNoYWxsZW5nZSBhbmQgdGhv
dWdodCBJIHdhcyBjb21waWxpbmcgdGhlIGRyaXZlcg0KPj4+IGNvcnJlY3RseS4gVXBvbiBmdXJ0
aGVyIGV4YW1pbmF0aW9uLCB0aGUgbWFjcm8gY2Fubm90IGJlIHdyaXR0ZW4gd2l0aCBhDQo+Pj4g
ZG8td2hpbGUgYmVjYXVzZSBpdCBpcyBkZWZpbmluZyBmdW5jdGlvbnMuDQo+Pg0KPj4gVGhlICJl
dWR5cHR1bGEgY2hhbGxlbmdlIiBhbmQgb3RoZXIgZmlyc3QgcGF0Y2ggZ3VpZGVzIHNob3VsZCBi
ZSB1cGRhdGVkDQo+PiB0byB0ZWxsIHBlb3BsZSB0byBzZWFyY2ggZm9yIHRoZWlyIGNvZGUgb24g
bG9yZS5rZXJuZWwub3JnIGJlZm9yZQ0KPj4gc2VuZGluZyBhIHBhdGNoLg0KPiANCj4gVGhlICJl
dWR5cHR1bGEgY2hhbGxlbmdlIiBpcyBub3QgY3VycmVudGx5IHJ1bm5pbmcgYW5kIGhhcyBub3Qg
YmVlbiBmb3INCj4gbWFueSB5ZWFycyBub3cgc28gSSBkbyBub3Qga25vdyB3aGVyZSB0aGUgb3Jp
Z2luYWwgcG9zdGVyIGdvdCB0aGVpcg0KPiBpbmZvcm1hdGlvbiBmcm9tLg0KPiANCj4gdGhhbmtz
LA0KPiANCj4gZ3JlZyBrLWgNCg0KVGhlIGNoYWxsZW5nZSBpcyBpbiBmYWN0IGNsb3NlZCBidXQg
dGhlIGxpc3Qgb2YgZXhlcmNpc2VzIGlzIHB1YmxpY2x5DQphdmFpbGFibGUuIEZyb20gbXkgbGlt
aXRlZCBleHBlcmllbmNlLCBpdCBpcyBzdGlsbCBvbmUgb2YgdGhlIGJlc3QNCnJlc291cmNlcyBm
b3IgZ2V0dGluZyBzdGFydGVkIGluIGxpbnV4IGtlcm5lbCBkZXZlbG9wbWVudCBldmVuIGlmIGl0
IGlzDQpwcm9iYWJseSBhIGJpdCBvdXRkYXRlZCwgYW5kIGxhY2tpbmcgYSBzZWN0aW9uIGFib3V0
IHRlc3RpbmcgeW91cg0KY2hhbmdlcyBwcm9wZXJseS4NCg0KVGhhbmtzIGFuZCBzb3JyeSBhZ2Fp
biBmb3IgdGhlIG1pc2hhcCwNCkFsYmVydG8uDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
