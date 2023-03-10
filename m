Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 158236B5574
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:18:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25C993F4A9
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:18:26 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	by lists.linaro.org (Postfix) with ESMTPS id 4C3513F4C9
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 19:29:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=I1tFubY3;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.128.54 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id j3so4154579wms.2
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 11:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678476596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3PScVdSvo964dji84f+E3c8q8Z3D10XU3FUFbEIQL5M=;
        b=I1tFubY34VdYvbiaMV6bMVJtb+FgxjqTDUFjZcWqCVsSj6b7usEequMVu12dLvOGi3
         842MaXs0TRyMTB03cbqbQqYHypR7Pt8S9dsCRZUrPNlql7C2J/PmeaOdMcHAt/QjFdOn
         xUX62FvPezXjz1KRUFDHBmeHDN7JUwgkUrtdeiDuOww/imSHUDouML+u/39dwvLRjUaQ
         eM589F4AuS/j6Ayycg0cF5umIoKDtKw4oh7CSGug0rCp7Zx+TKhl9kuMXrs2ZjGSpjaJ
         h4ueWtA4SPeDsmpZWl7x6kHldrCC3pLKFRpOmcqTtiPIWQMzLvdw0tdjJUGjNFbO3L21
         Ohew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678476596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PScVdSvo964dji84f+E3c8q8Z3D10XU3FUFbEIQL5M=;
        b=FuwZyL5eGblHZ1lnKRPWS3SBNFC1ok8w0fpbyffBIKjMLvhFNRdWXZ9t7Nz+eKxC4g
         DsLC0bfkY/GoRFmf9/Cd/xKosqGf41H6RC1+SRrSv/T67qcF23r/66Gmgf/GAiYFC+3q
         amy479DS6Lz5cX2FOJOBt/hqdcURA4aEM8llxJeUlanxzFMdXGOj3jAZH3YA4603L0ZD
         HcWyZr9kUfsuvbChrc84DwDA1or/eNv6uC98T6AeHkcJHT9pbnqEuL/pDXSlMRQwE0d0
         AfMfMKWUyJLE4WCnOoSSrD1QTt16NYrR6Ohi66S1jTxLD8wFiIjNxbXdK3Sbw9Y3jzob
         8g4w==
X-Gm-Message-State: AO0yUKUTiVwiciiyEvienR8jWZWD1BZAW33pXZN1XlvSFU+lOqDHmye7
	/WCHbl7F6TFm84JHNE3OiLA=
X-Google-Smtp-Source: AK7set9lLW35D4gGhOdmpXTFKA7pzUwguhXMnfH7b43QBIQVJlKKSGJNmPbghHrpx/fEUfucx5G4Zw==
X-Received: by 2002:a05:600c:1c1f:b0:3eb:2b88:8682 with SMTP id j31-20020a05600c1c1f00b003eb2b888682mr3988918wms.17.1678476596185;
        Fri, 10 Mar 2023 11:29:56 -0800 (PST)
Received: from [192.168.1.16] ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id t10-20020a05600c198a00b003dc4480df80sm820581wmq.34.2023.03.10.11.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 11:29:55 -0800 (PST)
Message-ID: <9cb2b3c4-f047-3028-885b-6554c7600e3d@gmail.com>
Date: Fri, 10 Mar 2023 21:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
To: Alex Elder <elder@ieee.org>, outreachy@lists.linux.dev
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <6ed4616d-03e7-f055-cd25-934e69d253df@ieee.org>
Content-Language: en-US
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
In-Reply-To: <6ed4616d-03e7-f055-cd25-934e69d253df@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4C3513F4C9
X-Spamd-Bar: ---------
X-Spamd-Result: default: False [-9.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-0.50)[41.42.191.171:received];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.128.54:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.54:from];
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
Message-ID-Hash: GOBZDVATITGGGV22YG6CHUSLPWTV23AZ
X-Message-ID-Hash: GOBZDVATITGGGV22YG6CHUSLPWTV23AZ
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:42 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GOBZDVATITGGGV22YG6CHUSLPWTV23AZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiDZodmg4oCPL9mj4oCPL9mi2aDZotmjINmh2ag62aHZpiwgQWxleCBFbGRlciB3cm90ZToN
Cj4gT24gMy8xMC8yMyA5OjUxIEFNLCBNZW5uYSBNYWhtb3VkIHdyb3RlOg0KPj4gRml4ICIgQ0hF
Q0s6IEFsaWdubWVudCBzaG91bGQgbWF0Y2ggb3BlbiBwYXJlbnRoZXNpcyAiDQo+PiBSZXBvcnRl
ZCBieSBjaGVja3BhdGgNCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBNZW5uYSBNYWhtb3VkIDxlbmcu
bWVubmFtYWhtb3VkLm1tQGdtYWlsLmNvbT4NCj4NCj4gSXMgdGhpcyAoYW5kIHlvdXIgc2Vjb25k
IHBhdGNoKSB0aGUgb25seSBwbGFjZShzKSB3aGVyZQ0KPiB0aGlzIGlzc3VlIGdldHMgcmVwb3J0
ZWQ/DQoNCj4geWVzLCBhZnRlciBmaXhlZCB0aGVtIGkgZ290IDAgY2hlY2suDQoNCj4gSSB0aGlu
ayB0aGlzIHR5cGUgb2YgYWxpZ25tZW50IGlzIG5vdCBhIG1ham9yIHByb2JsZW0sDQo+IGFuZCBh
bGlnbm1lbnQgaXNuJ3QgZG9uZSB0aGlzIHdheSBpbiBnZW5lcmFsIGluIHRoaXMNCj4gZHJpdmVy
LCBpdCdzIHByb2JhYmx5IE9LIHRvIGtlZXAgaXQgdGhhdCB3YXkuDQoNCk9rYXksIHRoYW5rcy4N
Cg0KIMKgLU1lbm5hDQoNCj4NCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLUFsZXgNCj4NCj4+IC0tLQ0KPj4gwqAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29y
ZS5jIHwgMiArLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Z3LWNv
cmUuYyANCj4+IGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnctY29yZS5jDQo+PiBpbmRleCA1
N2JlYmYyNDYzNmIuLmY1NjJjYjEyZDVhZCAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2Z3LWNvcmUuYw0KPj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZnct
Y29yZS5jDQo+PiBAQCAtODksNyArODksNyBAQCBzdGF0aWMgaW50IGdiX2Z3X2NvcmVfcHJvYmUo
c3RydWN0IGdiX2J1bmRsZSAqYnVuZGxlLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
fQ0KPj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29ubmVjdGlvbiA9IGdiX2Nvbm5l
Y3Rpb25fY3JlYXRlKGJ1bmRsZSwgY3BvcnRfaWQsDQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnYl9md19tZ210X3JlcXVlc3RfaGFuZGxlcik7DQo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnYl9md19tZ210X3JlcXVlc3RfaGFuZGxlcik7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpZiAoSVNfRVJSKGNvbm5lY3Rpb24pKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IFBUUl9FUlIoY29ubmVjdGlvbik7DQo+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGRldl9lcnIoJmJ1bmRsZS0+ZGV2LA0KPg0KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUg
c2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
