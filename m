Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9169579393E
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 11:59:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C1B53F031
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Sep 2023 09:59:30 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id 13A543F009
	for <greybus-dev@lists.linaro.org>; Wed,  6 Sep 2023 09:59:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="ut6X/waL";
	spf=pass (lists.linaro.org: domain of krzk@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=krzk@kernel.org;
	dmarc=pass (policy=none) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 7FC4BCE13D7;
	Wed,  6 Sep 2023 09:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4F05C433C8;
	Wed,  6 Sep 2023 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693994359;
	bh=32oaGrTGMGPijXh2U6clQsX0cT1y9TDGOJiUR+PtnLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ut6X/waLoHK5qufwDK+m89ZkCL0v8dHC5oSylAY58+rWLIspJsDqzo7gxdyYROgfs
	 VVEB4uGRR5OEgoXU/SSbCm/JtZ5mhip2b5rZRvVO1N1QTvkuy5duZ26MWVnol8Ns6f
	 5CrxPJX71SuDi0qgmNKX5BV0yrG7rfe/ZnZc+mpveRPl/rC5NMclV+OkeFDi0nHLia
	 9OVTqH3zjJ0/UA3HdHW/5xLzvtCNS4+x/iLBKISOkmBjq8YqpUJl45O8C0pNTloW5q
	 AfiGjiG8e1w6+FvLGmGJ9MAYzs0C7eYSlCxsg8AASR0x5en0cArqHi2DN/8pkV7E3e
	 M185A9rozsXtw==
Message-ID: <608ddca9-4ab8-1aef-767f-92a90e7e0970@kernel.org>
Date: Wed, 6 Sep 2023 11:59:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>, greybus-dev@lists.linaro.org
References: <20230902182845.1840620-1-ayushdevel1325@gmail.com>
 <20230902182845.1840620-3-ayushdevel1325@gmail.com>
 <27a445d6-d904-244f-266c-ffb2d68d0e27@kernel.org>
 <1bbe7772-09f4-6c5a-8c4d-c88988b34c99@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <1bbe7772-09f4-6c5a-8c4d-c88988b34c99@gmail.com>
X-Rspamd-Queue-Id: 13A543F009
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-8.00 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+a:sin.source.kernel.org];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_ALL(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 67HLI4N2G6JLE2IYVBIRWE6ZGAL6OMY3
X-Message-ID-Hash: 67HLI4N2G6JLE2IYVBIRWE6ZGAL6OMY3
X-MailFrom: krzk@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Vaishnav M A <vaishnav@beagleboard.org>, Nishanth Menon <nm@ti.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v4 2/3] greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/67HLI4N2G6JLE2IYVBIRWE6ZGAL6OMY3/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gMDUvMDkvMjAyMyAxODoyNywgQXl1c2ggU2luZ2ggd3JvdGU6DQo+Pj4gK3N0YXRpYyB2b2lk
IGhkbGNfaGFuZGxlX3J4X2ZyYW1lKHN0cnVjdCBnYl9iZWFnbGVwbGF5ICpiZykNCj4+PiArew0K
Pj4+ICsJdTggYWRkcmVzcyA9IGJnLT5yeF9idWZmZXJbMF07DQo+Pj4gKwljaGFyICpidWZmZXIg
PSAmYmctPnJ4X2J1ZmZlclsyXTsNCj4+PiArCXNpemVfdCBidWZmZXJfbGVuID0gYmctPnJ4X2J1
ZmZlcl9sZW4gLSA0Ow0KPj4+ICsNCj4+PiArCXN3aXRjaCAoYWRkcmVzcykgew0KPj4+ICsJY2Fz
ZSBBRERSRVNTX0RCRzoNCj4+PiArCQloZGxjX2hhbmRsZV9kYmdfZnJhbWUoYmcsIGJ1ZmZlciwg
YnVmZmVyX2xlbik7DQo+Pj4gKwkJYnJlYWs7DQo+Pj4gKwljYXNlIEFERFJFU1NfR1JFWUJVUzoN
Cj4+PiArCQloZGxjX2hhbmRsZV9ncmV5YnVzX2ZyYW1lKGJnLCBidWZmZXIsIGJ1ZmZlcl9sZW4p
Ow0KPj4+ICsJCWJyZWFrOw0KPj4+ICsJZGVmYXVsdDoNCj4+PiArCQlkZXZfd2FybigmYmctPnNl
cmRldi0+ZGV2LCAiR290IFVua25vd24gRnJhbWUgJXUiLCBhZGRyZXNzKTsNCj4+IHJhdGVsaW1p
dA0KPj4gUHJvYmFibHkgYXMgd2VsbCBpbiBzZXZlcmFsIHBsYWNlcyB3aXRoIHBvc3NpYmxlIGZs
b29kaW5nLg0KPiANCj4gSSBkb24ndCB0aGluayBgaGRsY19oYW5kbGVfcnhfZnJhbWVgIGlzIHRo
ZSBjb3JyZWN0IHBsYWNlIHNpbmNlIGl0IG9ubHkgDQo+IHByb2Nlc3NlcyBhIHNpbmdsZSBjb21w
bGV0ZWQgSERMQyBmcmFtZS7CoCBUaGUgbW9yZSBhcHByb3ByaWF0ZSBwbGFjZSANCj4gd291bGQg
YmUgYGhkbGNfcnhgIGlmIHdlIHdhbnQgdG8gbGltaXQgYmFzZWQgb24gdGhlIG51bWJlciBvZiBI
RExDIA0KPiBmcmFtZXMgb3IgYGdiX2JlYWdsZXBsYXlfdHR5X3JlY2VpdmVgIHRvIGxpbWl0IGJh
c2VkIG9uIHRoZSBudW1iZXIgb2YgYnl0ZXMuDQo+IA0KPiBJIHdvdWxkIGxpa2UgdG8gYXNrLCB0
aG91Z2gsIHdoeSBpcyByYXRlIGxpbWl0aW5nIHJlcXVpcmVkIGhlcmU/IFdvbid0IA0KPiBgc2Vy
ZGV2X2RldmljZV9vcHMtPnJlY2VpdmVfYnVmYCBhbHJlYWR5IHJhdGUgbGltaXQgdGhlIG51bWJl
ciBvZiBieXRlcyANCj4gc29tZXdoYXQ/IE9yIGlzIGl0IHJlbGF0ZWQgdG8gYmxvY2tpbmcgaW4g
dGhlIA0KPiBgc2VyZGV2X2RldmljZV9vcHMtPnJlY2VpdmVfYnVmYCBjYWxsYmFjaz8gSW4gdGhl
IGNhc2Ugb2YgbGF0dGVyLCBpdCANCj4gd291bGQgcHJvYmFibHkgbWFrZSBzZW5zZSB0byByYXRl
bGltaXQgYmFzZWQgb24gbnVtYmVyIG9mIGZyYW1lcywgSSB0aGluay4NCg0KTXkgY29tbWVudCBt
aWdodCBub3QgYmUgYWNjdXJhdGUsIHNvIEkgZG8gbm90IGluc2lzdC4gVGhlIG5hbWUgb2YgdGhl
DQpmdW5jdGlvbiBzdWdnZXN0ZWQgc29tZXRoaW5nIGJlaW5nIGNhbGxlZCB2ZXJ5IG9mdGVuIChv
biBldmVyeSBmcmFtZSksDQp0aHVzIHlvdSB3b3VsZCBwcmludCB3YXJuaW5nIGFsc28gdmVyeSBv
ZnRlbi4NCg0KQmVzdCByZWdhcmRzLA0KS3J6eXN6dG9mDQoNCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwg
dG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
