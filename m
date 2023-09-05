Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 07771792676
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Sep 2023 18:28:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4F4D63EFD8
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Sep 2023 16:28:05 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	by lists.linaro.org (Postfix) with ESMTPS id 08FF33EFB6
	for <greybus-dev@lists.linaro.org>; Tue,  5 Sep 2023 16:27:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=mmCvpgUq;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.215.179 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-569deb93999so1409064a12.2
        for <greybus-dev@lists.linaro.org>; Tue, 05 Sep 2023 09:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693931278; x=1694536078; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0lXaZC4lJgr9JMdxNZHELcwQzbUjuJdgxkRaJXVL56E=;
        b=mmCvpgUqd2CzQNIu6AK05wSgBG9u8jaAK2US8n1qUp950CHfCqw68zs6JIrl+RU1za
         1Ymg6OQxI8dLJVJSK9BTKR6Q7I6notnweWtf/cgYUMzBzElyvNaohksEZnPmqqL9KKK6
         5tKMxyRZoFFCwgwlj6xu8pEC4o2fqX/qe7NoaDmfFWg4desEn+Uw1vOL+PBbqHDRaWZn
         0MVPduGNEyZApxr7i4eS6+h8GaITKSSVQcB18WKVFR8KP9cApa7ZChmYF5MU7PLKLYCS
         mwCH25NFhUOHuU1bktxVkwNs16K6VmP8+MD9VNjm/Hvg1MKFCqKd1PNlZoe1t0vwsX98
         f3ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693931278; x=1694536078;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0lXaZC4lJgr9JMdxNZHELcwQzbUjuJdgxkRaJXVL56E=;
        b=OBJnUkDjWcNeVQ9KIBqm/XQmm9F8RkEkp7Kzv4CA9anjvcy2Cc117e8x1EwC/PnCyR
         4tNT5zmj6c9pWX8IC3Du3NrcPowNtiizTVY+D3RqSRUIuJcgXX4rqSw7tr3Rac5qgosB
         B4pVOTMN+Wo32ROFiokrr+zcg4ypS+ZuFogYToZXK8sMo/grFOhbfda5yZDR686wnkJ4
         UvzIy7OVO985QtNVvv1pu6lBe2YlVDLV3aKLBJsUQYWe07LTFS2hyyGpvsMhYxnAnbLP
         HtlHC5juysGH9us86DlOQJvWS+q81EfMBpubAKrJ8SROEdH4jxkYO50j1yzCdvEiOQ/u
         /JdA==
X-Gm-Message-State: AOJu0YxxVckrVoxyo5OxQkurKLKIcnUw9/Ox9H2eSkreHU0u5UDnl8Mj
	zk04bcF5IyPcADl1MiZRXQI=
X-Google-Smtp-Source: AGHT+IHgQ4W+ASzS7VkGl3S7peWoxrNZhGjnSAhyH7Vq/Wl8souodszOsjfMAmTu9d1TJ/zDISXEMg==
X-Received: by 2002:a17:90a:a684:b0:26d:3d3a:a198 with SMTP id d4-20020a17090aa68400b0026d3d3aa198mr9655941pjq.42.1693931277904;
        Tue, 05 Sep 2023 09:27:57 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id p10-20020a17090a868a00b00263f41a655esm9411178pjn.43.2023.09.05.09.27.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Sep 2023 09:27:57 -0700 (PDT)
Message-ID: <1bbe7772-09f4-6c5a-8c4d-c88988b34c99@gmail.com>
Date: Tue, 5 Sep 2023 21:57:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Krzysztof Kozlowski <krzk@kernel.org>, greybus-dev@lists.linaro.org
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
 <20230902182845.1840620-3-ayushdevel1325@gmail.com>
 <27a445d6-d904-244f-266c-ffb2d68d0e27@kernel.org>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <27a445d6-d904-244f-266c-ffb2d68d0e27@kernel.org>
X-Rspamd-Queue-Id: 08FF33EFB6
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.179:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: KUYGE4QOXN7HZOM7VTVXMUDJG4E2DG3N
X-Message-ID-Hash: KUYGE4QOXN7HZOM7VTVXMUDJG4E2DG3N
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KUYGE4QOXN7HZOM7VTVXMUDJG4E2DG3N/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

Pj4gK3N0YXRpYyB2b2lkIGhkbGNfaGFuZGxlX3J4X2ZyYW1lKHN0cnVjdCBnYl9iZWFnbGVwbGF5
ICpiZykNCj4+ICt7DQo+PiArCXU4IGFkZHJlc3MgPSBiZy0+cnhfYnVmZmVyWzBdOw0KPj4gKwlj
aGFyICpidWZmZXIgPSAmYmctPnJ4X2J1ZmZlclsyXTsNCj4+ICsJc2l6ZV90IGJ1ZmZlcl9sZW4g
PSBiZy0+cnhfYnVmZmVyX2xlbiAtIDQ7DQo+PiArDQo+PiArCXN3aXRjaCAoYWRkcmVzcykgew0K
Pj4gKwljYXNlIEFERFJFU1NfREJHOg0KPj4gKwkJaGRsY19oYW5kbGVfZGJnX2ZyYW1lKGJnLCBi
dWZmZXIsIGJ1ZmZlcl9sZW4pOw0KPj4gKwkJYnJlYWs7DQo+PiArCWNhc2UgQUREUkVTU19HUkVZ
QlVTOg0KPj4gKwkJaGRsY19oYW5kbGVfZ3JleWJ1c19mcmFtZShiZywgYnVmZmVyLCBidWZmZXJf
bGVuKTsNCj4+ICsJCWJyZWFrOw0KPj4gKwlkZWZhdWx0Og0KPj4gKwkJZGV2X3dhcm4oJmJnLT5z
ZXJkZXYtPmRldiwgIkdvdCBVbmtub3duIEZyYW1lICV1IiwgYWRkcmVzcyk7DQo+IHJhdGVsaW1p
dA0KPiBQcm9iYWJseSBhcyB3ZWxsIGluIHNldmVyYWwgcGxhY2VzIHdpdGggcG9zc2libGUgZmxv
b2RpbmcuDQoNCkkgZG9uJ3QgdGhpbmsgYGhkbGNfaGFuZGxlX3J4X2ZyYW1lYCBpcyB0aGUgY29y
cmVjdCBwbGFjZSBzaW5jZSBpdCBvbmx5IA0KcHJvY2Vzc2VzIGEgc2luZ2xlIGNvbXBsZXRlZCBI
RExDIGZyYW1lLsKgIFRoZSBtb3JlIGFwcHJvcHJpYXRlIHBsYWNlIA0Kd291bGQgYmUgYGhkbGNf
cnhgIGlmIHdlIHdhbnQgdG8gbGltaXQgYmFzZWQgb24gdGhlIG51bWJlciBvZiBIRExDIA0KZnJh
bWVzIG9yIGBnYl9iZWFnbGVwbGF5X3R0eV9yZWNlaXZlYCB0byBsaW1pdCBiYXNlZCBvbiB0aGUg
bnVtYmVyIG9mIGJ5dGVzLg0KDQpJIHdvdWxkIGxpa2UgdG8gYXNrLCB0aG91Z2gsIHdoeSBpcyBy
YXRlIGxpbWl0aW5nIHJlcXVpcmVkIGhlcmU/IFdvbid0IA0KYHNlcmRldl9kZXZpY2Vfb3BzLT5y
ZWNlaXZlX2J1ZmAgYWxyZWFkeSByYXRlIGxpbWl0IHRoZSBudW1iZXIgb2YgYnl0ZXMgDQpzb21l
d2hhdD8gT3IgaXMgaXQgcmVsYXRlZCB0byBibG9ja2luZyBpbiB0aGUgDQpgc2VyZGV2X2Rldmlj
ZV9vcHMtPnJlY2VpdmVfYnVmYCBjYWxsYmFjaz8gSW4gdGhlIGNhc2Ugb2YgbGF0dGVyLCBpdCAN
CndvdWxkIHByb2JhYmx5IG1ha2Ugc2Vuc2UgdG8gcmF0ZWxpbWl0IGJhc2VkIG9uIG51bWJlciBv
ZiBmcmFtZXMsIEkgdGhpbmsuDQoNCg0KQXl1c2ggU2luZ2gNCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0t
IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
