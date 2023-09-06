Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id F0BC97939F9
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 12:33:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9FEFD3F009
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 10:33:20 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	by lists.linaro.org (Postfix) with ESMTPS id 26ADD3F009
	for <greybus-dev@lists.linaro.org>; Wed,  6 Sep 2023 10:33:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=JA04wLu6;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.216.53 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-26b47df332eso1903192a91.2
        for <greybus-dev@lists.linaro.org>; Wed, 06 Sep 2023 03:33:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693996392; x=1694601192; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dZQ8wt1OcjisCZpLbfzFz5n18+5fQLoWCA+NTtpxCgE=;
        b=JA04wLu6WUI4O3EZoT41292SNqaEejQ8JFYfNOycHDd8MWbZAcHh6cXLVIONFxqooc
         VnM0pJee/Zc9hoMMxj8mITD5SrHmFPUeV2Sq/gaZbtJhcY+GCXk9T+UOzdy1GZNamPpf
         xpI67O2y3vx8nk6CBI+rgG/3DEnn72GobzF04WkLqxKCZoDj/sztf1+FYM59sGRkQwIe
         5cOsZAfWwwJVnAyVXRdxF97Z9PEvPw5n96+cpVU6Ti1p3IzIscLq3CwWvPXRf36V9JJA
         f4xSmeYB8WMb+0zr5X2viBTxfVTgql5mFPRaRE2pJt9IBahTT2sqwpfxhoZ0Zzl0w6qy
         GZYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693996392; x=1694601192;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dZQ8wt1OcjisCZpLbfzFz5n18+5fQLoWCA+NTtpxCgE=;
        b=Py2kf8LXzFqHddkDUEyOv3ZtQvjccrIpA+nOqL+JGXpcemKMfqHPmpaHVS/2jCzYSD
         NUbits4QpgHCLf7NpO0EqbdX4+hUWQK9akKn2ERXsy8ola6poX3uN8oX9hsP1UVv7CUl
         elu1B/6/lGWCVJUEBMEdDYJQ+uF8v+OI8GdINgTJppn+T09PZJDN/tzV+IALJAqnlb86
         8E0oATMxuVqEhnKnzbZ7MCuVSEgwxp0y/7VQhwBg+xh2v/hbGEymr0ByvJlJvBNU+I2F
         WKpJtGDUtA0/PqLt7tpm37h1tqh7RwpeQ9BUKJHrRaQoAQzJT1J9P+PSNFmB7Y5hfNmv
         5MBA==
X-Gm-Message-State: AOJu0Yw9UYjbj9O9i+8nxJLlRS/pijxRmEjzzkd9YIfam4JHrpZN3Whl
	KKd32l3fl+53AP61BU/J+Uk=
X-Google-Smtp-Source: AGHT+IEvmMcrChGZLiPN933WjYKZmL8PyeTwmMitOCF5itYlCF4stuJmLKQ1uC6Qg+XXTvzQWSo3dw==
X-Received: by 2002:a17:90b:11d1:b0:26d:1986:f7ec with SMTP id gv17-20020a17090b11d100b0026d1986f7ecmr12223211pjb.1.1693996392056;
        Wed, 06 Sep 2023 03:33:12 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.93])
        by smtp.gmail.com with ESMTPSA id l19-20020a17090aec1300b0026b26181ac9sm12167302pjy.14.2023.09.06.03.33.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 03:33:11 -0700 (PDT)
Message-ID: <2746d50a-5658-5058-4369-1a1b34f85710@gmail.com>
Date: Wed, 6 Sep 2023 16:03:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, greybus-dev@lists.linaro.org
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
 <20230902182845.1840620-3-ayushdevel1325@gmail.com>
 <27a445d6-d904-244f-266c-ffb2d68d0e27@kernel.org>
 <1bbe7772-09f4-6c5a-8c4d-c88988b34c99@gmail.com>
 <608ddca9-4ab8-1aef-767f-92a90e7e0970@kernel.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <608ddca9-4ab8-1aef-767f-92a90e7e0970@kernel.org>
X-Rspamd-Queue-Id: 26ADD3F009
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.53:from];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: YEPZVK7ZH4XE3D3O377C2DV2VZQN6ZEB
X-Message-ID-Hash: YEPZVK7ZH4XE3D3O377C2DV2VZQN6ZEB
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YEPZVK7ZH4XE3D3O377C2DV2VZQN6ZEB/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gOS82LzIzIDE1OjI5LCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KDQo+IE9uIDA1LzA5
LzIwMjMgMTg6MjcsIEF5dXNoIFNpbmdoIHdyb3RlOg0KPj4+PiArc3RhdGljIHZvaWQgaGRsY19o
YW5kbGVfcnhfZnJhbWUoc3RydWN0IGdiX2JlYWdsZXBsYXkgKmJnKQ0KPj4+PiArew0KPj4+PiAr
CXU4IGFkZHJlc3MgPSBiZy0+cnhfYnVmZmVyWzBdOw0KPj4+PiArCWNoYXIgKmJ1ZmZlciA9ICZi
Zy0+cnhfYnVmZmVyWzJdOw0KPj4+PiArCXNpemVfdCBidWZmZXJfbGVuID0gYmctPnJ4X2J1ZmZl
cl9sZW4gLSA0Ow0KPj4+PiArDQo+Pj4+ICsJc3dpdGNoIChhZGRyZXNzKSB7DQo+Pj4+ICsJY2Fz
ZSBBRERSRVNTX0RCRzoNCj4+Pj4gKwkJaGRsY19oYW5kbGVfZGJnX2ZyYW1lKGJnLCBidWZmZXIs
IGJ1ZmZlcl9sZW4pOw0KPj4+PiArCQlicmVhazsNCj4+Pj4gKwljYXNlIEFERFJFU1NfR1JFWUJV
UzoNCj4+Pj4gKwkJaGRsY19oYW5kbGVfZ3JleWJ1c19mcmFtZShiZywgYnVmZmVyLCBidWZmZXJf
bGVuKTsNCj4+Pj4gKwkJYnJlYWs7DQo+Pj4+ICsJZGVmYXVsdDoNCj4+Pj4gKwkJZGV2X3dhcm4o
JmJnLT5zZXJkZXYtPmRldiwgIkdvdCBVbmtub3duIEZyYW1lICV1IiwgYWRkcmVzcyk7DQo+Pj4g
cmF0ZWxpbWl0DQo+Pj4gUHJvYmFibHkgYXMgd2VsbCBpbiBzZXZlcmFsIHBsYWNlcyB3aXRoIHBv
c3NpYmxlIGZsb29kaW5nLg0KPj4gSSBkb24ndCB0aGluayBgaGRsY19oYW5kbGVfcnhfZnJhbWVg
IGlzIHRoZSBjb3JyZWN0IHBsYWNlIHNpbmNlIGl0IG9ubHkNCj4+IHByb2Nlc3NlcyBhIHNpbmds
ZSBjb21wbGV0ZWQgSERMQyBmcmFtZS7CoCBUaGUgbW9yZSBhcHByb3ByaWF0ZSBwbGFjZQ0KPj4g
d291bGQgYmUgYGhkbGNfcnhgIGlmIHdlIHdhbnQgdG8gbGltaXQgYmFzZWQgb24gdGhlIG51bWJl
ciBvZiBIRExDDQo+PiBmcmFtZXMgb3IgYGdiX2JlYWdsZXBsYXlfdHR5X3JlY2VpdmVgIHRvIGxp
bWl0IGJhc2VkIG9uIHRoZSBudW1iZXIgb2YgYnl0ZXMuDQo+Pg0KPj4gSSB3b3VsZCBsaWtlIHRv
IGFzaywgdGhvdWdoLCB3aHkgaXMgcmF0ZSBsaW1pdGluZyByZXF1aXJlZCBoZXJlPyBXb24ndA0K
Pj4gYHNlcmRldl9kZXZpY2Vfb3BzLT5yZWNlaXZlX2J1ZmAgYWxyZWFkeSByYXRlIGxpbWl0IHRo
ZSBudW1iZXIgb2YgYnl0ZXMNCj4+IHNvbWV3aGF0PyBPciBpcyBpdCByZWxhdGVkIHRvIGJsb2Nr
aW5nIGluIHRoZQ0KPj4gYHNlcmRldl9kZXZpY2Vfb3BzLT5yZWNlaXZlX2J1ZmAgY2FsbGJhY2s/
IEluIHRoZSBjYXNlIG9mIGxhdHRlciwgaXQNCj4+IHdvdWxkIHByb2JhYmx5IG1ha2Ugc2Vuc2Ug
dG8gcmF0ZWxpbWl0IGJhc2VkIG9uIG51bWJlciBvZiBmcmFtZXMsIEkgdGhpbmsuDQo+IE15IGNv
bW1lbnQgbWlnaHQgbm90IGJlIGFjY3VyYXRlLCBzbyBJIGRvIG5vdCBpbnNpc3QuIFRoZSBuYW1l
IG9mIHRoZQ0KPiBmdW5jdGlvbiBzdWdnZXN0ZWQgc29tZXRoaW5nIGJlaW5nIGNhbGxlZCB2ZXJ5
IG9mdGVuIChvbiBldmVyeSBmcmFtZSksDQo+IHRodXMgeW91IHdvdWxkIHByaW50IHdhcm5pbmcg
YWxzbyB2ZXJ5IG9mdGVuLg0KPg0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KPg0KUmF0
ZSBsaW1pdGluZyB0aGUgbG9ncyBpcyBub3QgYSBiYWQgaWRlYS4gSW5pdGlhbGx5IEkgd2FzIG5v
dCBhd2FyZSB5b3UgDQptZWFudCBhYm91dCBsb2dnaW5nLCBoZW5jZSB0aGUgcXVlc3Rpb24uIFdp
dGggcHJvcGVyIGZpcm13YXJlIGluIENDMTM1MiwgDQp0aGUgd2FybmluZyB3aWxsIG5ldmVyIGJl
IHByaW50ZWQuIEJ1dCBtYXliZSBpdCBjYW4gY2F1c2UgcHJvYmxlbSB3aXRoIA0KaW1wcm9wZXIg
ZmlybXdhcmUuDQoNCg0KQXl1c2ggU2luZ2gNCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5
YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
