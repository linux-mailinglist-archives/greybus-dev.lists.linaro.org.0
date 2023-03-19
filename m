Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2905B6C39D4
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32B6B3EF1C
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:46 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	by lists.linaro.org (Postfix) with ESMTPS id C5AB43E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 13:20:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="Xb/7/NBk";
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.49 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id o12so37118544edb.9
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 06:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679232033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ar1R9+4Me/VMurp1fLp3U5SpNwGcoPZ7zOElSyFmz2I=;
        b=Xb/7/NBknPzIHDY+6GhGmdeMMjxj50m4Hcw32K4k0OVbvddxRXTltldlzfN/XdqcrV
         VoJ2dWdjw+tiID3JvNXa4FWwIjXleUFsq7d3kz2fhCxXHadY3/JFSxag6B7EBiUVsthB
         E9KstruA4PjRAP1etyb3+VzEFcW45lMuKqcZkV80hgEMCdRcIX6GbkoXdPeL9hjkZSdm
         ObfNT/D9xYeLEEgqH3vJo8wOB2KJd3L85XBVZyUcMQo3utK0P7YmAgOvliRL3Qy1U5JP
         semc6dZFLOjepNESmhLb5oOO75BZW2gLcQTgpwxfdVrG/tqvyDjPByzAPPPwR0pCQFQf
         JgDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679232033;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ar1R9+4Me/VMurp1fLp3U5SpNwGcoPZ7zOElSyFmz2I=;
        b=HKUAzvLpm++lDTmZkjhy4nBRSkQ9Ckoo7vx9bA16TKSV+6D/cN80g7lcOodA/1LPLd
         EXMFAWGT4hx9anEnUKsQ3OR3/VIfAbR/Dznm1sXo/MF/5qByPChir9ReQ0++l4Dx2zER
         qHzFInAqU+a8x6golpMEH2CCexB6D9/EHjoo7WHvzYf6sqXI/xqyItjZGu6JOrJlhHR9
         lqJUZUmSDgv+LBL5wjmeCZfYcSRKrJCHcJjM6g9tF5t7WbYcdwfCC7VxHa9V2wIoVc9x
         Yi3G/Gk+0IU4bXXZ8cXU1KfFeD7N3hLgvD/MbZo4TVkKR5e8pdtPgcibVLRq4/AIeTEO
         VNXQ==
X-Gm-Message-State: AO0yUKUBraYqI98BYeSDiehPiKkh70mS4ylsFV8eQI24qITncKFnNUj2
	k6y5+wbtkpIY7jM7CvC4ElY=
X-Google-Smtp-Source: AK7set/NpR8kXxxtvmVOSZNu6X1LNczUB6SJCXh9Ek5Bw78cpzFWnYUhW6rq+Up7SECfdVjHljESag==
X-Received: by 2002:a17:906:bce1:b0:86f:b99c:ac8d with SMTP id op1-20020a170906bce100b0086fb99cac8dmr5568995ejb.44.1679232032649;
        Sun, 19 Mar 2023 06:20:32 -0700 (PDT)
Received: from [192.168.1.16] ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id z15-20020a1709060f0f00b009313da4e471sm3241110eji.41.2023.03.19.06.20.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Mar 2023 06:20:32 -0700 (PDT)
Message-ID: <7ec03abe-40e8-c56d-d178-20e57b859d0c@gmail.com>
Date: Sun, 19 Mar 2023 15:20:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
To: gregkh@linuxfoundation.org
References: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C5AB43E965
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.49:from];
	MID_RHS_MATCH_FROM(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LEFE2AECWA7R4A3J4ACE6P77FWNUXTET
X-Message-ID-Hash: LEFE2AECWA7R4A3J4ACE6P77FWNUXTET
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:56 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LEFE2AECWA7R4A3J4ACE6P77FWNUXTET/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SSBhbSBzb3JyeSwgSSByZXNlbmQgdGhpcyBwYXRjaCBieSBtaXN0YWtlLiBwbGVhc2UgZHJvcCBp
dC4NCg0KTWVubmENCg0KT24g2aHZqeKAjy/Zo+KAjy/Zotmg2aLZoyDZodmjOtmk2aEsIE1lbm5h
IE1haG1vdWQgd3JvdGU6DQo+IGFkZCBibGFuayBsaW5lIGFmdGVyIHN0cnVjdCBmb3IgcmVhZGFi
aWxpdHkgYXMNCj4gcmVwb3J0ZWQgYnkgY2hlY2twYXRjaCBzY3JpcHQNCj4NCj4gIiBDSEVDSzog
UGxlYXNlIHVzZSBhIGJsYW5rIGxpbmUgYWZ0ZXIgZnVuY3Rpb24vc3RydWN0L3VuaW9uL2VudW0N
Cj4gZGVjbGFyYXRpb25zIg0KPg0KPiBTaWduZWQtb2ZmLWJ5OiBNZW5uYSBNYWhtb3VkIDxlbmcu
bWVubmFtYWhtb3VkLm1tQGdtYWlsLmNvbT4NCj4gLS0tDQo+ICAgZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvZ2JwaHkuaCB8IDIgKysNCj4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
DQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYnBoeS5oIGIvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaA0KPiBpbmRleCBkNGEyMjViNzYzMzguLjFkZTUx
MDQ5OTQ4MCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2JwaHkuaA0K
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9nYnBoeS5oDQo+IEBAIC0xNSw2ICsxNSw3
IEBAIHN0cnVjdCBnYnBoeV9kZXZpY2Ugew0KPiAgIAlzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7DQo+
ICAgCXN0cnVjdCBkZXZpY2UgZGV2Ow0KPiAgIH07DQo+ICsNCj4gICAjZGVmaW5lIHRvX2dicGh5
X2RldihkKSBjb250YWluZXJfb2YoZCwgc3RydWN0IGdicGh5X2RldmljZSwgZGV2KQ0KPiAgIA0K
PiAgIHN0YXRpYyBpbmxpbmUgdm9pZCAqZ2JfZ2JwaHlfZ2V0X2RhdGEoc3RydWN0IGdicGh5X2Rl
dmljZSAqZ2RldikNCj4gQEAgLTQzLDYgKzQ0LDcgQEAgc3RydWN0IGdicGh5X2RyaXZlciB7DQo+
ICAgDQo+ICAgCXN0cnVjdCBkZXZpY2VfZHJpdmVyIGRyaXZlcjsNCj4gICB9Ow0KPiArDQo+ICAg
I2RlZmluZSB0b19nYnBoeV9kcml2ZXIoZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYnBoeV9k
cml2ZXIsIGRyaXZlcikNCj4gICANCj4gICBpbnQgZ2JfZ2JwaHlfcmVnaXN0ZXJfZHJpdmVyKHN0
cnVjdCBnYnBoeV9kcml2ZXIgKmRyaXZlciwNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1
cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
