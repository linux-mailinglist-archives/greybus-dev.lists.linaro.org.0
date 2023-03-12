Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 211E06BDC0A
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:51:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 279903EBAF
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:51:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	by lists.linaro.org (Postfix) with ESMTPS id 65F883E929
	for <greybus-dev@lists.linaro.org>; Sun, 12 Mar 2023 13:39:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=YhkYASX7;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.53 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id j19-20020a05600c191300b003eb3e1eb0caso9179779wmq.1
        for <greybus-dev@lists.linaro.org>; Sun, 12 Mar 2023 06:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678628398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pW3SYoJSfYigvun40dUyfsdJwqphbL/38YBc34ttyCo=;
        b=YhkYASX7a74CAsFNiKpJWvIMR1ENdKDvxrtH595UKIWI4fV6J2X0y6ji3Ri0tSopvV
         NrijF/N2W9Sh7pculPdZ1KQrU7uButTTnkkA2tJ987jNOprgTgbDRcaTDr4xZSBAiOya
         pTdLvhARtdlxSVlBLoBKx/dyaF0/hhcn6BTqs4Rc6AMXywuNhT+yJGirNaFYEEq9hpkv
         qZpYG43aCAsoSqpEBHnuewH0jWWYhVgnGGTOtV5puQZvS/gbqC/pedktrqrWhwucbrlf
         fcQCH0lumhZ7306XmrubeVdBmVsL+89qWNxXR3lrxE3dQfLxx5UqfjtLRxIV79+rw0Cc
         vGEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678628398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pW3SYoJSfYigvun40dUyfsdJwqphbL/38YBc34ttyCo=;
        b=cGMxfYWao6HCF7dOaAjhFspwNLQdUguosgQJE4lDwednu6c1wWwMQvls0js958WMkD
         q36V728hBGGFJI/FZ/abs5CaNkEyLJmIqXb6tM0A8lwbkp5+dhrAJV0CkRlxAGFTrd4v
         Yn3XwqegBP+fk066u4HBQmL3KeR96AcBm9lDpVE+wuxlWk+V8ddcydXwS/jwYRiGFO5I
         oGpVQGUsx4w6QGJqXvvLmg3eDcd/fGELlBdgZzpxK404ETP1INYKsYh+wJF1gzrX2Peh
         Y1ha5SHe37mcQWH2R0tstZ76wGDJkoH7gAylOJaSUtg8itt8AqlqUp9qkMp+AMdjvwMI
         GT7g==
X-Gm-Message-State: AO0yUKVLYwyD/YPqpIhOhUHbqB+6NYvub+MBnLtjzOSuVHTB04Li4nnt
	PMKfoc7lNjBBfBwz7sWKbwE=
X-Google-Smtp-Source: AK7set/Puwux94bwB+pHKftXFM9AZEJDRXkcO3uxKEjnksL/INtvCvoixKCiQSDWOhfcojHCeYlMTQ==
X-Received: by 2002:a05:600c:1c95:b0:3eb:2b69:c3c6 with SMTP id k21-20020a05600c1c9500b003eb2b69c3c6mr8000944wms.1.1678628398284;
        Sun, 12 Mar 2023 06:39:58 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id n11-20020a05600c294b00b003e21638c0edsm5957737wmd.45.2023.03.12.06.39.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Mar 2023 06:39:57 -0700 (PDT)
Message-ID: <1e8d503d-decb-e662-3457-19d41c6769e0@gmail.com>
Date: Sun, 12 Mar 2023 15:39:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Julia Lawall <julia.lawall@inria.fr>
References: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
 <10d2c15b-ff9f-4634-a013-7640c93435a7@kili.mountain>
 <c9ae27dc-3538-5432-6a6d-3e2ff034f467@gmail.com>
 <alpine.DEB.2.22.394.2303111600330.2802@hadrien>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303111600330.2802@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 65F883E929
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.53:from];
	RCVD_COUNT_THREE(0.00)[3];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.dev,nexus-software.ie,kernel.org,linuxfoundation.org,lists.linaro.org,vger.kernel.org]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2QKR2EAEC26LEFF7A5ZWPNHRAP2BAIGA
X-Message-ID-Hash: 2QKR2EAEC26LEFF7A5ZWPNHRAP2BAIGA
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:50:31 +0000
CC: Dan Carpenter <error27@gmail.com>, outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: eclose macro in a do - while loop
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2QKR2EAEC26LEFF7A5ZWPNHRAP2BAIGA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2ac62aDZoCwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBTYXQsIDExIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
T24g2aHZoS/Zoy/Zotmg2aLZoyDZodmmOtmg2aYsIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+Pj4g
T24gU2F0LCBNYXIgMTEsIDIwMjMgYXQgMDM6NTk6MTlQTSArMDIwMCwgTWVubmEgTWFobW91ZCB3
cm90ZToNCj4+Pj4gIiBFUlJPUjogTWFjcm9zIHdpdGggbXVsdGlwbGUgc3RhdGVtZW50cyBzaG91
bGQgYmUgZW5jbG9zZWQgaW4gYSBkbyAtDQo+Pj4+IHdoaWxlIGxvb3AiDQo+Pj4+DQo+Pj4+IFJl
cG9ydGVkIGJ5IGNoZWNrcGF0aC4NCj4+Pj4NCj4+Pj4gZG8gbG9vcCB3aXRoIHRoZSBjb25kaXRp
b25hbCBleHByZXNzaW9uIHNldCB0byBhIGNvbnN0YW50DQo+Pj4+IHZhbHVlIG9mIHplcm8gKDAp
LlRoaXMgY3JlYXRlcyBhIGxvb3AgdGhhdA0KPj4+PiB3aWxsIGV4ZWN1dGUgZXhhY3RseSBvbmUg
dGltZS5UaGlzIGlzIGEgY29kaW5nIGlkaW9tIHRoYXQNCj4+Pj4gYWxsb3dzIGEgbXVsdGktbGlu
ZSBtYWNybyB0byBiZSB1c2VkIGFueXdoZXJlDQo+Pj4+IHRoYXQgYSBzaW5nbGUgc3RhdGVtZW50
IGNhbiBiZSB1c2VkLg0KPj4+Pg0KPj4+PiBTbywgZW5jbG9zZSBgZ2JfbG9vcGJhY2tfc3RhdHNf
YXR0cnNgIG1hY3JvIGluIGRvIC0gd2hpbGUgKDApIHRvDQo+Pj4+IGZpeCBjaGVja3BhdGggZXJy
b3INCj4+Pj4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogTWVubmEgTWFobW91ZCA8ZW5nLm1lbm5hbWFo
bW91ZC5tbUBnbWFpbC5jb20+DQo+Pj4+IC0tLQ0KPj4+IFRoaXMgYnJlYWtzIHRoZSBidWlsZC4g
IFlvdSBuZWVkIHRvIGNvbXBpbGUgdGhlIGNvZGUgYmVmb3JlIHNlbmRpbmcgYQ0KPj4+IHBhdGNo
Lg0KPj4+DQo+Pj4gcmVnYXJkcywNCj4+PiBkYW4gY2FycGVudGVyDQo+Pg0KPj4gSSBzZWUsIEkg
dGhvdWdodCBidWlsZGluZyB0aGUgZmlsZSBvbmx5IGVub3VnaC4gYXBwcmVjaWF0ZSB5b3VyIGZl
ZWRiYWNrLg0KPiBUaGUgb3V0cmVhY2h5IHR1dG9yaWFsIGV4cGxhaW5zIGhvdyB0byBjb21waWxl
IGV2ZXJ5dGhpbmcgaW4gYQ0KPiBzdWJkaXJlY3RvcnkuDQo+DQo+IGp1bGlhDQoNCg0KVGhhbmtz
IEp1bGlhLCBJIHdpbGwgY2hlY2sgaXQuDQoNCk1lbm5hDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
