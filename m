Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FBA6BDBF8
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:20 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 630C33EBA4
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	by lists.linaro.org (Postfix) with ESMTPS id EE34B3EA3C
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 12:50:43 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=ZfYzmvLp;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.48 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso5078418wmp.4
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 04:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678539043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F2VdX4B2dld6wqCG5ZYqlFsLHmtCsviZq3SzvbHDBPs=;
        b=ZfYzmvLpq056KSe0wR6z4s3lzk4PhtaVkXSEToFZYVD2Yj760N7KNPhkJgqfv4m18L
         Xu0lAVTfbJt35TthbdG6zWvBUT5p1F1EzO7WsYmS7TgHvZmtKjjKkHVT2dw4u45+92ej
         Gm9RjAkkPRK6RtlDqgr/MOxUB+0lWAyWyRwS3yy7n+l5dpxSe2ODI3XF2q1PV4Agab26
         UWcALghrZIYngj6OKxgNp7l4+fN0Dm0douW7eN//mOY6KOHwQPwH9l5dhKU9ndfsK/Ha
         +5whzgXkAUaI49XXG+Xl1f4OwCZ2LQMylEkpDCM+VIHoF+ebqcsBvWV5dFqcGV0ttOZC
         yi7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678539043;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F2VdX4B2dld6wqCG5ZYqlFsLHmtCsviZq3SzvbHDBPs=;
        b=Th+QKRC5injJfrePNzmAWDsnUYWHh+1ejbcr4YP0J7z4SaBY/GK64Iqz1mVuekVLA4
         mLV3EfOl2xN96e8FHVfw20k4d6HI7AWlCUQvSlUKI9GCeComWOWBjMm0zSlM40nSstwE
         gU6cGyXxziBkz2dG4ylw1vfwmW9hNajWXq7RxNdSidg+d3BbR7y6uMj2sfC5ijoxtF7h
         /wyB7aWgr2umNjy8UBtb9kD0uRDwIIK0FU9Xs/58RXVnDMQHQlezotGQUHAfUhDTEH3g
         ICA+EyNtdfY0RRKPbrAlYphQabRz/b4Rsoude4Vae7JkQ8V4Z2xlxivseykB6dFYOFVG
         aHQw==
X-Gm-Message-State: AO0yUKV2bEkeikf+fG5Ygn9g+zYTcHCefXDNwavOiYEimam4r5JSSr4G
	9eXe8+TlNlb8HyU8vE23j8c=
X-Google-Smtp-Source: AK7set+DiHVrKM3fDR7GG4dpN6xZ67nadAC84Vqy3UVBeouj5FR1ozUtQTmdo+/DFkAKzt4C0RHmhQ==
X-Received: by 2002:a05:600c:5009:b0:3eb:39c9:ecb0 with SMTP id n9-20020a05600c500900b003eb39c9ecb0mr5630622wmr.8.1678539042876;
        Sat, 11 Mar 2023 04:50:42 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id d21-20020a1c7315000000b003dc521f336esm2771887wmb.14.2023.03.11.04.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 04:50:42 -0800 (PST)
Message-ID: <7590a38f-4be2-b237-71db-6b5bc620d9de@gmail.com>
Date: Sat, 11 Mar 2023 14:50:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110956591.2802@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303110956591.2802@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EE34B3EA3C
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_THREE(0.00)[3];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.48:from]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BS4OUYJBZUSKGYIDSSCXSBQSD6PJTRIZ
X-Message-ID-Hash: BS4OUYJBZUSKGYIDSSCXSBQSD6PJTRIZ
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:53 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BS4OUYJBZUSKGYIDSSCXSBQSD6PJTRIZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aA62aXZpywgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBGcmksIDEwIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
Rml4ICIgQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcyAiDQo+
PiBSZXBvcnRlZCBieSBjaGVja3BhdGgNCj4gVGhlIGxvZyBtZXNzYWdlIGNvdWxkIGJlIGJldHRl
ciwgdG8gZXhwbGFpbiB3aGF0IHlvdSBoYXZlIGRvbmUgYW5kIHdoeS4NCj4gVGhlIHdvcmQgImZp
eCIgZG9lc24ndCBleHByZXNzIGFueSBvZiB0aGF0LCBhbmQgc2hvdWxkIGJlIGF2b2lkZWQgaWYN
Cj4gcG9zc2libGUuDQo+DQo+IGp1bGlhDQpnb3QgaXQsIHRoYW5rIHlvdQ0KPj4gU2lnbmVkLW9m
Zi1ieTogTWVubmEgTWFobW91ZCA8ZW5nLm1lbm5hbWFobW91ZC5tbUBnbWFpbC5jb20+DQo+PiAt
LS0NCj4+ICAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jIHwgMiArLQ0KPj4gICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkNCj4+DQo+PiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvZnctY29yZS5jDQo+PiBpbmRleCBmNTYyY2IxMmQ1YWQuLjBmYjE1YTYwNDEy
ZiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0KPj4g
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jDQo+PiBAQCAtMTEwLDcgKzEx
MCw3IEBAIHN0YXRpYyBpbnQgZ2JfZndfY29yZV9wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5k
bGUsDQo+PiAgIAkJCX0NCj4+DQo+PiAgIAkJCWNvbm5lY3Rpb24gPSBnYl9jb25uZWN0aW9uX2Ny
ZWF0ZShidW5kbGUsIGNwb3J0X2lkLA0KPj4gLQkJCQkJCWdiX2Z3X2Rvd25sb2FkX3JlcXVlc3Rf
aGFuZGxlcik7DQo+PiArCQkJCQkJCSAgZ2JfZndfZG93bmxvYWRfcmVxdWVzdF9oYW5kbGVyKTsN
Cj4+ICAgCQkJaWYgKElTX0VSUihjb25uZWN0aW9uKSkgew0KPj4gICAJCQkJZGV2X2VycigmYnVu
ZGxlLT5kZXYsICJmYWlsZWQgdG8gY3JlYXRlIGRvd25sb2FkIGNvbm5lY3Rpb24gKCVsZClcbiIs
DQo+PiAgIAkJCQkJUFRSX0VSUihjb25uZWN0aW9uKSk7DQo+PiAtLQ0KPj4gMi4zNC4xDQo+Pg0K
Pj4NCj4+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK
