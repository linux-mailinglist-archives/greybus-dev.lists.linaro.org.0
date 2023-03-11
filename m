Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A72B06BDC03
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:51:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AEE3D3EE23
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:51:07 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id 505533EE23
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:54:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=LuURsCpZ;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.42 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id t25-20020a1c7719000000b003eb052cc5ccso8036138wmi.4
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678546474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmHWUjlzHy2uq6jgsY9kZteuN3pTbKb2ImH/1jCF6eQ=;
        b=LuURsCpZIINQtFwtZK+glZ+15xCNMYJZRgAuwTxksczmt7cTvU0Q7IQJ5rCUBix3qT
         uOva/zkx6kJEyeX+pAzSc2sSERls0OLmfnyrgkgiy0oXQUYuVovxkbjOZxxGoya9I8rj
         5fSm+sCSkkvDO4uSluV35M9l+PQ6IMKlx/c3b5anbcrgU28SvJIbrxpUx5xW6KXNFWRv
         eabrNhI1as/QJcZu0QUL8EkTQxbaj8zoLbW+YGpzxy6iaQdMoQTVJktKt3lIaS9pWnTz
         5UE7FxZRiojOT2jbPtgYjWUaCB75M/mkYrcm6P2p9FgDWT7W3a7j22djkiDJZ2Jenyab
         l1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678546474;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmHWUjlzHy2uq6jgsY9kZteuN3pTbKb2ImH/1jCF6eQ=;
        b=0E2pJekSnrwaogIlgs7fSuSasgy1wUx9iaJlpcWOrirELq167oY7mAqA+DPESDfv73
         /sUiKBHpw+y4OpNmtqnX6FTVhSz9+2Cso6Pm3KFp61P6eBxMHNromYafPkfE/rF5UQqO
         D4KH2HEDmbkGdk5VREln/BKMoxVkUDPi2PP0sUYw8Vxw3o1fqECx7jT0vAkAOpa3d+4J
         sOGEnVdYlygqeAyzIAseG1qw0U1g4H71CHXSysDGkE3tp5gMm8A8H9Vrsbak1g93ADX9
         U40tN3rPwDyTAQu5eg3jIPwNg75ABC7tzGDuBvf4CvWpZj2S6lBX/2/Bcuit1+wt7SSA
         bJyQ==
X-Gm-Message-State: AO0yUKUEzampI5N7RE626rL/jlZPlGV9ADD3CI4Oe8xMR2hBBhCpSX91
	m1IAMFaQ/ae1eO2Bd/WghTc=
X-Google-Smtp-Source: AK7set90czPe22mXRrMADvmQVUGpzqxCAePGoxPQnobgXgkhJKiobmxLyCSsg/wO+NYFohLbFNaELg==
X-Received: by 2002:a05:600c:19d3:b0:3eb:5d17:8ddc with SMTP id u19-20020a05600c19d300b003eb5d178ddcmr5991322wmq.18.1678546474349;
        Sat, 11 Mar 2023 06:54:34 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id w19-20020a05600c475300b003eb2e33f327sm4017105wmo.2.2023.03.11.06.54.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:54:33 -0800 (PST)
Message-ID: <7a2a8cb7-7e4b-9cef-7fea-1e3ece48194b@gmail.com>
Date: Sat, 11 Mar 2023 16:54:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303111532220.2802@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303111532220.2802@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 505533EE23
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[41.42.191.171:received];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.128.42:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.42:from];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: D5JTNZ6LVVZMNHVJPZ7IK2QE3IM3I4D4
X-Message-ID-Hash: D5JTNZ6LVVZMNHVJPZ7IK2QE3IM3I4D4
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:30 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D5JTNZ6LVVZMNHVJPZ7IK2QE3IM3I4D4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aY62aPZpiwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPiBNZW5uYSwNCj4NCj4gVGhlcmUgaXMgYSB0eXBvIGluIHRoZSBzdWJqZWN0IGxpbmUuDQo+
DQo+IE9uIFNhdCwgMTEgTWFyIDIwMjMsIE1lbm5hIE1haG1vdWQgd3JvdGU6DQo+DQo+PiAiIEVS
Uk9SOiBNYWNyb3Mgd2l0aCBtdWx0aXBsZSBzdGF0ZW1lbnRzIHNob3VsZCBiZSBlbmNsb3NlZCBp
biBhIGRvIC0NCj4+IHdoaWxlIGxvb3AiDQo+Pg0KPj4gUmVwb3J0ZWQgYnkgY2hlY2twYXRoLg0K
Pj4NCj4+IGRvIGxvb3Agd2l0aCB0aGUgY29uZGl0aW9uYWwgZXhwcmVzc2lvbiBzZXQgdG8gYSBj
b25zdGFudA0KPj4gdmFsdWUgb2YgemVybyAoMCkuVGhpcyBjcmVhdGVzIGEgbG9vcCB0aGF0DQo+
PiB3aWxsIGV4ZWN1dGUgZXhhY3RseSBvbmUgdGltZS5UaGlzIGlzIGEgY29kaW5nIGlkaW9tIHRo
YXQNCj4+IGFsbG93cyBhIG11bHRpLWxpbmUgbWFjcm8gdG8gYmUgdXNlZCBhbnl3aGVyZQ0KPj4g
dGhhdCBhIHNpbmdsZSBzdGF0ZW1lbnQgY2FuIGJlIHVzZWQuDQo+Pg0KPj4gU28sIGVuY2xvc2Ug
YGdiX2xvb3BiYWNrX3N0YXRzX2F0dHJzYCBtYWNybyBpbiBkbyAtIHdoaWxlICgwKSB0bw0KPj4g
Zml4IGNoZWNrcGF0aCBlcnJvcg0KPiBUaGUgbG9nIG1lc3NhZ2Ugc2hvdWxkIGZvY3VzIG9uIHdo
YXQgaXMgZG9uZSBhbmQgd2h5LiAgVGhlIGNoZWNrcGF0Y2gNCj4gd2FybmluZyB0ZXh0IGFuZCB0
aGUgZmFjdCB0aGF0IHRoZSBwcm9ibGVtIHdhcyBkZXRlY3RlZCB1c2luZyBjaGVja3BhdGNoDQo+
IGlzIHVzZWZ1bCwgYnV0IGxlc3MsIHNvIGl0IHNob3VsZCBjb21lIGxhc3QsIG5vdCBmaXJzdC4N
Cj4NCj4gSGVyZSwgd2hhdCBpcyBkb25lIGlzIHRvIGVuY2xvc2UgYSBzZXF1ZW5jZSBvZiBzdGF0
ZW1lbnRzIGluIGEgbWFjcm8NCj4gZGVmaW5pdGlvbiBpbiBhIGRvLXdoaWxlIGxvb3Agd2l0aCBh
IHRlc3QgZXhwcmVzc2lvbiAwLg0KPg0KPiBUaGUgcmVhc29uIHdoeSBpcyB0byBtYWtlIGl0IHNh
ZmUgdG8gdXNlIHRoZSBzZXF1ZW5jZSBhbnl3aGVyZSBhIHNpbmdsZQ0KPiBzdGF0ZW1lbnQgY2Fu
IGJlIHVzZWQuDQo+DQo+IEEgcGVyaW9kIGF0IHRoZSBlbmQgb2YgYSBzZW50ZW5jZSBzaG91bGQg
YmUgZm9sbG93ZWQgYnkgc29tZSB3aGl0ZXNwYWNlDQo+IGJlZm9yZSBzdGFydGluZyB0aGUgbmV4
dCBzZW50ZW5jZS4NCj4NCj4ganVsaWENCg0KDQpnb3QgaXQsIHRoYW5rIHlvdS4NCg0KDQpNZW5u
YQ0KDQo+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNZW5uYSBNYWhtb3VkIDxlbmcubWVubmFtYWhtb3Vk
Lm1tQGdtYWlsLmNvbT4NCj4+IC0tLQ0KPj4gICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29w
YmFjay5jIHwgMTAgKysrKysrLS0tLQ0KPj4gICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25z
KCspLCA0IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9sb29wYmFjay5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYw0K
Pj4gaW5kZXggMWE2MWZjZTk4MDU2Li5lODZkNTA2MzhjYjUgMTAwNjQ0DQo+PiAtLS0gYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jDQo+PiArKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9sb29wYmFjay5jDQo+PiBAQCAtMTYyLDEwICsxNjIsMTIgQEAgc3RhdGljIHNzaXpl
X3QgbmFtZSMjX2F2Z19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwJCVwNCj4+ICAgfQkJCQkJCQkJ
CVwNCj4+ICAgc3RhdGljIERFVklDRV9BVFRSX1JPKG5hbWUjI19hdmcpDQo+Pg0KPj4gLSNkZWZp
bmUgZ2JfbG9vcGJhY2tfc3RhdHNfYXR0cnMoZmllbGQpCQkJCVwNCj4+IC0JZ2JfbG9vcGJhY2tf
cm9fc3RhdHNfYXR0cihmaWVsZCwgbWluLCB1KTsJCVwNCj4+IC0JZ2JfbG9vcGJhY2tfcm9fc3Rh
dHNfYXR0cihmaWVsZCwgbWF4LCB1KTsJCVwNCj4+IC0JZ2JfbG9vcGJhY2tfcm9fYXZnX2F0dHIo
ZmllbGQpDQo+PiArI2RlZmluZSBnYl9sb29wYmFja19zdGF0c19hdHRycyhmaWVsZCkJCQkJCVwN
Cj4+ICsJZG8geyBcDQo+PiArCQlnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZpZWxkLCBtaW4s
IHUpOwkJXA0KPj4gKwkJZ2JfbG9vcGJhY2tfcm9fc3RhdHNfYXR0cihmaWVsZCwgbWF4LCB1KTsJ
CVwNCj4+ICsJCWdiX2xvb3BiYWNrX3JvX2F2Z19hdHRyKGZpZWxkKTsJCQkJXA0KPj4gKwl9IHdo
aWxlICgwKQ0KPj4NCj4+ICAgI2RlZmluZSBnYl9sb29wYmFja19hdHRyKGZpZWxkLCB0eXBlKQkJ
CQkJXA0KPj4gICBzdGF0aWMgc3NpemVfdCBmaWVsZCMjX3Nob3coc3RydWN0IGRldmljZSAqZGV2
LAkJCQlcDQo+PiAtLQ0KPj4gMi4zNC4xDQo+Pg0KPj4NCj4+DQpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0g
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWls
IHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
