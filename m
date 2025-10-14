Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 873F8BDA9D6
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 18:30:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 52CBB45988
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 16:30:51 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	by lists.linaro.org (Postfix) with ESMTPS id 393004444F
	for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 16:10:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=QrfDuSGx;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vivek.balachandhar@gmail.com designates 209.85.219.54 as permitted sender) smtp.mailfrom=vivek.balachandhar@gmail.com
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-791875a9071so73157546d6.1
        for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 09:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760458253; x=1761063053; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S8L+WVjJmU7vcda4ih0gYjaBbqLiyaIpQ6dQl10BBY8=;
        b=QrfDuSGxyI+WGxcpCVADga6z1QjPsJ/bnoEFPsMIMnJ9HB2aGh1ejGARlggD+tEtf0
         0mjaU6kv2lD0I3skqijngpPqKtOefH1G8MwpeeZ88rvvFbyGAhDGTu+X18GRL8Dc++fp
         PffeJIsi4SGK5fHYEg7GR3luCVbvqYGMhpLSWnjT6dKuk7we9s/ZFwS6CdCeb7esIMAh
         CGD3pQbh294jEh1xLFdEgmroJ6VJgwf+OYYbxLNUbub/fS0IURwsHUmBmPnJua6EsfBp
         7tbl+fZn0jj0zMMl/Iow82h2KGN9PSORviRW82xakPS7nEbqVZjbcFFMPtqMjO767VSY
         SZnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760458253; x=1761063053;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S8L+WVjJmU7vcda4ih0gYjaBbqLiyaIpQ6dQl10BBY8=;
        b=oP+ONDJALtfKCMkkAqdJicidbwxQjmDgKCLLcQAThWaS2Wd0K8LuK6D1pjIGyFRUWP
         BLW1mxA+nt8A1zmGjyxpr4MDL+AEeUCo+2bpDUqih+zE58B14D2fyBLmYcgVBXs/lph+
         a96ZGNQcIDC95/9v24ggUEk8pOFQ6Ap1sd6NkZrrnbUD4h/OL/9BCrICND4X5GWsAyjs
         v1es5E9cZwhGimWdehzGzdksS9K3xs41Ntc/XsQoxCulEugpXvEr8oK0m1oghd6CrDjK
         lynbmBHsiET65nV7ZsHN8d4rCrslojcQiGGwIeA0OLRP6DXNoWKH/5geLRMvY5eXN65A
         cAIg==
X-Forwarded-Encrypted: i=1; AJvYcCVPf4StB1eHHqdEl7NUdrIWPf21Ar2NUAjxL4mGqw0mVa8Q9STLglHq/FjbLFYhuHef/yUeCCWZvihDWg==@lists.linaro.org
X-Gm-Message-State: AOJu0YxNkFE2AYE3oVRxYWApQT+dAbdaNWLxW3lJx8PRODjexuU4w3F0
	HWh4YCjpPfBZyMQSxBfHDhEwFChjsUeQPkFVu2QglOm1apmwbjCrcMiU
X-Gm-Gg: ASbGncvMDLdgtoo6gGZUab0LDz5TThFTg4qiNPNk+vwhnIZdNQHTMu2nLkuU86zcFvu
	51Zj9X8MKTgje61LqtdJ/28He3b6MiPZ0EF+fvxmnwaEK3Xl5DQzqo/6rBw78LbsBDpfQ4Mu3Ol
	EAkxP4PFnnYW4IOkSFg67GJN3Q/1DkA92T6XH3w3Wrb8izL39crQhIso5CFw/JAHjFAGykFr6nm
	CMwNUP5PCUXftItKCzcEflHQ7YfubyN0D4EW/EQKlkaXDH+4QaiqJrxqPqnaALU0O4g+thSl88C
	QpqJriKYIVDsV9zWenjDQplmdMe+KfzYUS/oH1M5/XcIfPh3Rj65qkzK2SAG4VvOIDTTwlqQBnC
	9fkkSuKm0xAzTUuPZMCzo2GhI6awSkHF3DyNVdrubaG5UQl0TyLzebkXyu1itPiUmDO73K4vghT
	wyVJs=
X-Google-Smtp-Source: AGHT+IHtDY1Ni/QmFM8KopkPD41XTdnvxrgCYwk7vBIPYhmYq+8n63/p3HVS1oDtlfr+Wq6clStmOA==
X-Received: by 2002:a05:6214:3018:b0:80a:7bd3:e61f with SMTP id 6a1803df08f44-87b2ef4f94fmr327305236d6.52.1760458252524;
        Tue, 14 Oct 2025 09:10:52 -0700 (PDT)
Received: from [192.168.0.155] ([170.10.253.128])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87c012b5ea1sm1227396d6.61.2025.10.14.09.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 09:10:52 -0700 (PDT)
Message-ID: <8f550b4e-2b7e-4266-be92-bb724265949f@gmail.com>
Date: Tue, 14 Oct 2025 12:10:50 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dan Carpenter <dan.carpenter@linaro.org>
References: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
 <aO5VvrKTswmfO-n9@stanley.mountain>
 <8918310c-d0aa-4e02-b9d4-9aac98b0a48f@gmail.com>
 <aO5a9izAISpCDJrc@stanley.mountain>
Content-Language: en-CA
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
In-Reply-To: <aO5a9izAISpCDJrc@stanley.mountain>
X-Rspamd-Queue-Id: 393004444F
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.80 / 15.00];
	BAYES_HAM(-2.80)[99.15%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.219.54:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	DWL_DNSWL_BLOCKED(0.00)[gmail.com:dkim];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.219.54:from,170.10.253.128:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: vivek.balachandhar@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BXCRZVFDHGUXBAGHI35PI7NJ4UD3Y6ZH
X-Message-ID-Hash: BXCRZVFDHGUXBAGHI35PI7NJ4UD3Y6ZH
X-Mailman-Approved-At: Tue, 14 Oct 2025 16:30:47 +0000
CC: johan@kernel.org, elder@kernel.org, schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BXCRZVFDHGUXBAGHI35PI7NJ4UD3Y6ZH/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

SGkgRGFuLA0KDQpUaGFua3MgYWdhaW7igJRjb25maXJtZWQgdGhlIHN0cnVjdHMgYXJlIHplcm8t
aW5pdGlhbGl6ZWQgYmVmb3JlIHRoZSBjb3B5Lg0KDQpXb3VsZCBhIG1pbmltYWwgZml4IHRoYXQg
Z3VhcmFudGVlcyBOVUwtdGVybWluYXRpb24gYmUgYWNjZXB0YWJsZSwgZS5nLjoNCg0Kc3RybmNw
eSgoY2hhciAqKSZpbnRmX2xvYWQuZmlybXdhcmVfdGFnLCBmaXJtd2FyZV90YWcsDQogwqAgwqAg
wqAgwqAgR0JfRklSTVdBUkVfVV9UQUdfTUFYX1NJWkUgLSAxKTsNCigoY2hhciAqKSZpbnRmX2xv
YWQuZmlybXdhcmVfdGFnKVtHQl9GSVJNV0FSRV9VX1RBR19NQVhfU0laRSAtIDFdID0gJ1wwJzsN
Cg0KSSBjYW4gcmVzcGluIGFzIHYyIHdpdGggdGhlIHNhbWUgY2hhbmdlIGFwcGxpZWQgdG8gdGhl
IG90aGVyIHR3byANCmZpcm13YXJlX3RhZw0KZmllbGRzLg0KDQpCZXN0IHJlZ2FyZHMsDQpWaXZl
aw0KDQpPbiAyMDI1LTEwLTE0IDEwOjE1IGEubS4sIERhbiBDYXJwZW50ZXIgd3JvdGU6DQo+IE9u
IFR1ZSwgT2N0IDE0LCAyMDI1IGF0IDEwOjAxOjI4QU0gLTA0MDAsIFZpdmVrIEJhbGFjaGFuZGhh
clROIHdyb3RlOg0KPj4gWWVzLCBEYW4uIE5pY2UgY2F0Y2guIEJ1aWxkaW5nIGl0IHdpdGggYmVs
b3cgc2FtcGxlIGNoYW5nZToNCj4+DQo+PiBtZW1zZXQoJmludGZfbG9hZC5maXJtd2FyZV90YWcs
IDAsIEdCX0ZJUk1XQVJFX1VfVEFHX01BWF9TSVpFKTsNCj4+IHN0cm5jcHkoKGNoYXIgKikmaW50
Zl9sb2FkLmZpcm13YXJlX3RhZywgZmlybXdhcmVfdGFnLA0KPj4gIMKgIMKgIMKgIMKgIEdCX0ZJ
Uk1XQVJFX1VfVEFHX01BWF9TSVpFIC0gMSk7DQo+IFRoZXJlIGlzbid0IGEgbmVlZCB0byBkb2lu
ZyB0aGUgbWVtc2V0KCkuLi4NCj4NCj4gcmVnYXJkcywNCj4gZGFuIGNhcnBlbnRlcg0KPg0KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3Jp
YmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
