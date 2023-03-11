Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9323F6BDBF9
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:25 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A48563EA46
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	by lists.linaro.org (Postfix) with ESMTPS id 8E3E93EA27
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 12:52:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=HYsNsC95;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.53 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id r19-20020a05600c459300b003eb3e2a5e7bso5116430wmo.0
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 04:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678539126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n5dJFQGb7q/CQhFpeP+fZ30ySwTofV5mRJn/cglIAuM=;
        b=HYsNsC95zQ0w9aI6CjXKC6E08IttMYmktVY19cymIjlJ2/wcvv3XCpYYP3rMEnastN
         5AcmPz9MER9oUuNPnYpbrWn/iEVLvGXf9jdpAua6TAKZFj3gz6+pFlRnWHo85uCRuMIB
         fO8/7lUf5a8SEHdZGPMw0uOW9rNU6LMGFR1oXacki457xMg+AS/9reiDvFpZmpL77jDV
         vF4G6MLsye+0Jw6bXpeAjEVBZQ2EGERO6BDL/AD+bWD9lstKj96DQ4ieUVXTEtguYxjt
         TQCD6hHQnmNrIr95xabGGgumdV6iCETB25JUD05f+VMr+clBcs6vrMOnWKCTeOE1tMuv
         pRFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678539126;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n5dJFQGb7q/CQhFpeP+fZ30ySwTofV5mRJn/cglIAuM=;
        b=qws+euTpC8vo4ICdVaNMOcU5C0uXxswYjCekq7kC0A40Kr4xo1W7b566zDh1MMj8Zs
         WscWDc1CiR+074msFcJARpiEvis4D4u9SMLexkyO2EDpo2HGEwvbuhyjUdD9u6IHUeHV
         ROyHFpztuZPgILo0AWnuLWLZswmFCrHkGcVi9sBTT6zxkuSoRfV+UcyaQgWJrTzfHqS7
         MSg/4Y3ArJyR21GaQv/g6bj/GRbvyHMDft37RZJjev/yRzVifrBeOyfFTNmsTjFGH/JJ
         w9SpaRkAnmJYzvqOYqyuYmmpd197uGUod+KebN7Qe4F+kW51+yCTZ7PqPFteex3Opf1i
         N4Tg==
X-Gm-Message-State: AO0yUKXvrGdwvxNUSsbsWCySdjLamDuJLCxe+YFINptxjFOMYjf2oC96
	pjh1Jhuw2DiyZPy9o3LrT4U=
X-Google-Smtp-Source: AK7set96yv7zjK/Ne6Q5hGpcIeejX36q2ZDtHXek+eUZeqWFWrHVldlha2HYJoGT2BiH3QSli+HXmw==
X-Received: by 2002:a05:600c:c09:b0:3eb:253c:faae with SMTP id fm9-20020a05600c0c0900b003eb253cfaaemr5418220wmb.36.1678539126555;
        Sat, 11 Mar 2023 04:52:06 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id d12-20020a05600c3acc00b003e2052bad94sm2721984wms.33.2023.03.11.04.52.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 04:52:06 -0800 (PST)
Message-ID: <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
Date: Sat, 11 Mar 2023 14:52:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
To: Julia Lawall <julia.lawall@inria.fr>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 8E3E93EA27
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
	NEURAL_HAM(-0.00)[-1.000];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.53:from]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OK45TUFB4LMGPKQB3IGHGC4FP5IHZX3Z
X-Message-ID-Hash: OK45TUFB4LMGPKQB3IGHGC4FP5IHZX3Z
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:53 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OK45TUFB4LMGPKQB3IGHGC4FP5IHZX3Z/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aA62aXZqSwgSnVsaWEgTGF3YWxsIHdyb3Rl
Og0KPg0KPiBPbiBGcmksIDEwIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPg0KPj4g
Rml4ICIgQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcyAiDQo+
PiBSZXBvcnRlZCBieSBjaGVja3BhdGgNCj4gU2VlIHRoZSBtZXNzYWdlIGluIHRoZSBvdGhlciBt
YWlsIGFib3V0IHRoZSBsb2cgbWVzc2FnZS4NCj4NCj4gQWxzbywgeW91IHNob3VsZCBub3QgaGF2
ZSB0d28gcGF0Y2hlcyB3aXRoIHRoZSBzYW1lIHN1YmplY3QuICBIZXJlLCB0aGUNCj4gY2hhbmdl
cyBhcmUgb24gdGhlIHNhbWUgZmlsZSBhbmQgYXJlIGVzc2VudGlhbGx5IHRoZSBzYW1lLCBldmVu
IGludm9sdmluZw0KPiB0aGUgc2FtZSBmdW5jdGlvbiBjYWxsLiAgU28gdGhleSBjYW4gYmUgdG9n
ZXRoZXIgaW4gb25lIHBhdGNoLg0KPg0KPiBqdWxpYQ0Kb2theSwgSSB3aWxsLiBhcHByZWNpYXRl
IHlvdXIgZmVlZGJhY2suIHRoYW5rcy4NCj4NCj4+IFNpZ25lZC1vZmYtYnk6IE1lbm5hIE1haG1v
dWQgPGVuZy5tZW5uYW1haG1vdWQubW1AZ21haWwuY29tPg0KPj4gLS0tDQo+PiAgIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYyB8IDIgKy0NCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNv
cmUuYw0KPj4gaW5kZXggNTdiZWJmMjQ2MzZiLi5mNTYyY2IxMmQ1YWQgMTAwNjQ0DQo+PiAtLS0g
YS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9mdy1jb3JlLmMNCj4+ICsrKyBiL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0KPj4gQEAgLTg5LDcgKzg5LDcgQEAgc3RhdGljIGludCBn
Yl9md19jb3JlX3Byb2JlKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSwNCj4+ICAgCQkJfQ0KPj4N
Cj4+ICAgCQkJY29ubmVjdGlvbiA9IGdiX2Nvbm5lY3Rpb25fY3JlYXRlKGJ1bmRsZSwgY3BvcnRf
aWQsDQo+PiAtCQkJCQkJZ2JfZndfbWdtdF9yZXF1ZXN0X2hhbmRsZXIpOw0KPj4gKwkJCQkJCQkg
IGdiX2Z3X21nbXRfcmVxdWVzdF9oYW5kbGVyKTsNCj4+ICAgCQkJaWYgKElTX0VSUihjb25uZWN0
aW9uKSkgew0KPj4gICAJCQkJcmV0ID0gUFRSX0VSUihjb25uZWN0aW9uKTsNCj4+ICAgCQkJCWRl
dl9lcnIoJmJ1bmRsZS0+ZGV2LA0KPj4gLS0NCj4+IDIuMzQuMQ0KPj4NCj4+DQo+Pg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
