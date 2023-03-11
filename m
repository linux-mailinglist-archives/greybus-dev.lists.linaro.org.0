Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC8D6BDBFF
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 23:50:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C446A3EE23
	for <lists+greybus-dev@lfdr.de>; Thu, 16 Mar 2023 22:50:46 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	by lists.linaro.org (Postfix) with ESMTPS id 2EA793EA3C
	for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 14:06:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=clznqfjo;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.45 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id o5-20020a05600c510500b003ec0e4ec6deso1909710wms.3
        for <greybus-dev@lists.linaro.org>; Sat, 11 Mar 2023 06:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543613;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHLAIzc+GmiWBlK16hvBHcIL2RgKMlFXd7qg8d6tzz0=;
        b=clznqfjoXpVBWxFJpYNEApaXb5B24L94OTY5WjXa8hMFUJSfEXpDYgqJtv5lIu6pRv
         dbD/PW16AhwcYIRjEdpYvJmcRWK1K2XCQeRmpaHxQc+t4Sk21l86IvDpPUQyUJe1EW6s
         BWAIrQ4+kxyq2IHKEwBU1G03s7xYLSOiWe+gYZREe7k8AHog6C9Tiq4ZUJJr3PR9wisV
         bslBH7FtNqap6bfiFNkmbQPi5C0Db0B2td7hqegzuZU7nDV5oXV7nDTzNtDsXw2avO6M
         vYrWU9LrY1FVcBjc2Wlkqm/UjHMtfZBAH3cCVXLBl+3DxydLQpf50GgV69oKGySm1JNA
         vCiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543613;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHLAIzc+GmiWBlK16hvBHcIL2RgKMlFXd7qg8d6tzz0=;
        b=iHo6bDiWb7VuVHNrIm4BKUGHbSwb/2kOMgOQ1Fauf53/fxkccEg9ypalG1PKBWl4KN
         KtULhCalip2E1AwWtw0NdZumHxS/294vglN9Xmvzu+EC9uH70c7ZLAmMUyYD6z7QtDRq
         efhIeGRfXdI0RVuEMXC/++xQnBp0yFt3ldZW2FHsvNYwJHLfUyr+fLptcTWVx4YZo1GP
         S2XnYIlDi3UEK79wdGjuBGQN1Npuo14kL+flX79Qt0BoJ4VuYKYMkVvoAV+VgGqCe/PY
         RfP4/Sk2U6r4aI4yyPpclHNKUt8tR5QZPi+c10Zjsb9WZVAhHpJT9qav4F0vPF169txS
         avwg==
X-Gm-Message-State: AO0yUKXtGbnavFrkbt+Lm9OH8klXanK4VJbv4Fbech47X6A5KWgC8STX
	Ph0on+31sPwoQKZOvyUuIyE=
X-Google-Smtp-Source: AK7set9KsaidIkzAnDLCxIaUvaXd2BbuKHxUXSBqTPm7xDCfRhsZE0EKNiXlZBXgfm7IC31OeR8YKQ==
X-Received: by 2002:a05:600c:1f0f:b0:3df:ef18:b0a1 with SMTP id bd15-20020a05600c1f0f00b003dfef18b0a1mr5825500wmb.12.1678543613212;
        Sat, 11 Mar 2023 06:06:53 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id w23-20020a1cf617000000b003daf672a616sm2900260wmc.22.2023.03.11.06.06.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Mar 2023 06:06:52 -0800 (PST)
Message-ID: <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
Date: Sat, 11 Mar 2023 16:06:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: Julia Lawall <julia.lawall@inria.fr>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
In-Reply-To: <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2EA793EA3C
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCPT_COUNT_SEVEN(0.00)[9];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
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
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.45:from]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XYOTJ3YVZJZYYDDEPLFXJRG2F23QKKVY
X-Message-ID-Hash: XYOTJ3YVZJZYYDDEPLFXJRG2F23QKKVY
X-Mailman-Approved-At: Thu, 16 Mar 2023 22:49:55 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XYOTJ3YVZJZYYDDEPLFXJRG2F23QKKVY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmh4oCPL9mj4oCPL9mi2aDZotmjINmh2aQ62aXZpywgTWVubmEgTWFobW91ZCB3cm90
ZToNCj4NCj4gT24g2aHZoeKAjy/Zo+KAjy/Zotmg2aLZoyDZodmkOtml2aUsIEp1bGlhIExhd2Fs
bCB3cm90ZToNCj4+DQo+PiBPbiBTYXQsIDExIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3Rl
Og0KPj4NCj4+PiBPbiDZodmhL9mjL9mi2aDZotmjINmh2aA62aXZqSwgSnVsaWEgTGF3YWxsIHdy
b3RlOg0KPj4+PiBPbiBGcmksIDEwIE1hciAyMDIzLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4+
Pg0KPj4+Pj4gRml4ICIgQ0hFQ0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRo
ZXNpcyAiDQo+Pj4+PiBSZXBvcnRlZCBieSBjaGVja3BhdGgNCj4+Pj4gU2VlIHRoZSBtZXNzYWdl
IGluIHRoZSBvdGhlciBtYWlsIGFib3V0IHRoZSBsb2cgbWVzc2FnZS4NCj4+Pj4NCj4+Pj4gQWxz
bywgeW91IHNob3VsZCBub3QgaGF2ZSB0d28gcGF0Y2hlcyB3aXRoIHRoZSBzYW1lIHN1YmplY3Qu
wqAgSGVyZSwgDQo+Pj4+IHRoZQ0KPj4+PiBjaGFuZ2VzIGFyZSBvbiB0aGUgc2FtZSBmaWxlIGFu
ZCBhcmUgZXNzZW50aWFsbHkgdGhlIHNhbWUsIGV2ZW4gDQo+Pj4+IGludm9sdmluZw0KPj4+PiB0
aGUgc2FtZSBmdW5jdGlvbiBjYWxsLsKgIFNvIHRoZXkgY2FuIGJlIHRvZ2V0aGVyIGluIG9uZSBw
YXRjaC4NCj4+Pj4NCj4+Pj4ganVsaWENCj4+PiBva2F5LCBJIHdpbGwuIGFwcHJlY2lhdGUgeW91
ciBmZWVkYmFjay4gdGhhbmtzLg0KPj4gUGxlYXNlIHB1dCBzb21lIGJsYW5rIGxpbmVzIGFyb3Vu
ZCB5b3VyIHJlc3BvbnNlLCBzbyBpdCBpcyBlYXNpZXIgdG8gDQo+PiBmaW5kLg0KPj4NCj4+IHRo
YW5rcywNCj4+IGp1bGlhDQo+DQo+DQo+IE9rYXksIEkgd2lsbC4NCj4NCj4gdGhhbmtzLA0KPg0K
PiBNZW5uYQ0KDQoNCg0KSGkgSnVsaWEsDQoNCmFjY29yZGluZyB0byBBbGV4IGZlZWRiYWNrDQoN
CiIgSSB0aGluayB0aGlzIHR5cGUgb2YgYWxpZ25tZW50IGlzIG5vdCBhIG1ham9yIHByb2JsZW0s
DQphbmQgYWxpZ25tZW50IGlzbid0IGRvbmUgdGhpcyB3YXkgaW4gZ2VuZXJhbCBpbiB0aGlzDQpk
cml2ZXIsIGl0J3MgcHJvYmFibHkgT0sgdG8ga2VlcCBpdCB0aGF0IHdheS4gLSBBbGV4ICINCg0K
DQosSSB3b24ndCByZXN1Ym1pdCB0aGVzZSBwYXRjaGVzLCByaWdodD8NCg0KDQogwqAtTWVubmEN
Cg0KDQo+DQo+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBNZW5uYSBNYWhtb3VkIDxlbmcubWVubmFt
YWhtb3VkLm1tQGdtYWlsLmNvbT4NCj4+Pj4+IC0tLQ0KPj4+Pj4gwqDCoCBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9mdy1jb3JlLmMgfCAyICstDQo+Pj4+PiDCoMKgIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPj4+Pj4NCj4+Pj4+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9mdy1jb3JlLmMNCj4+Pj4+IGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvZnctY29yZS5jDQo+Pj4+PiBpbmRleCA1N2JlYmYyNDYzNmIuLmY1NjJjYjEyZDVh
ZCAxMDA2NDQNCj4+Pj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNvcmUuYw0K
Pj4+Pj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jDQo+Pj4+PiBAQCAt
ODksNyArODksNyBAQCBzdGF0aWMgaW50IGdiX2Z3X2NvcmVfcHJvYmUoc3RydWN0IGdiX2J1bmRs
ZSANCj4+Pj4+ICpidW5kbGUsDQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0N
Cj4+Pj4+DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbm5lY3Rpb24gPSBn
Yl9jb25uZWN0aW9uX2NyZWF0ZShidW5kbGUsIGNwb3J0X2lkLA0KPj4+Pj4gLcKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ2JfZndfbWdtdF9yZXF1ZXN0X2hh
bmRsZXIpOw0KPj4+Pj4gKw0KPj4+Pj4gZ2JfZndfbWdtdF9yZXF1ZXN0X2hhbmRsZXIpOw0KPj4+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKGNvbm5lY3Rpb24pKSB7
DQo+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gUFRSX0VS
Uihjb25uZWN0aW9uKTsNCj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBkZXZfZXJyKCZidW5kbGUtPmRldiwNCj4+Pj4+IC0tIA0KPj4+Pj4gMi4zNC4xDQo+Pj4+Pg0K
Pj4+Pj4NCj4+Pj4+DQo+PiA+DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxl
YXZlQGxpc3RzLmxpbmFyby5vcmcK
