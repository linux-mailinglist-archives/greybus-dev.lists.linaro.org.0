Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFA14FB716
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 11:13:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 74EC4402C5
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 09:13:17 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id E66B43EC04
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 09:13:14 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 02E35B810E0;
	Mon, 11 Apr 2022 09:13:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AC43C385A3;
	Mon, 11 Apr 2022 09:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1649668392;
	bh=G6ZO25/Ykggr6xEHDgRUSWj5HIyhzLYYQqVAX06CjVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uHlY2rKwlK2fOYmJvIwN+tZGNg4yONHalHR1elSU8+wwh/pjb6p/ntD/MF/m0pyGG
	 TO3wahI7Dx/NjqgAHKE5xbdlTZf3rQr92rYmkgwuh2str4cmysB3Q6oxLyvRBuRAGh
	 ff6RTGz3/0uDn/eZjiV0D0RbTyCW0AHNFcoBHaT9ecoX0vHahoaoKoZYxqy7wgoc+n
	 f29uPTGnKqhoGvMyXhevVOR/drm1bg2zNAhFReRozalCtr0D8T0bpbOidlA6XQyrm4
	 AlT9NGCdklWU5yC/Wstz1yFnKshu5dPrM5Crp4U0EA0TzO2Bebv7qWvTooBOIr/5ce
	 hSV2MYe20MdVw==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1ndq6b-0002xP-TC; Mon, 11 Apr 2022 11:13:05 +0200
Date: Mon, 11 Apr 2022 11:13:05 +0200
From: Johan Hovold <johan@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YlPxIWfaFoQxW63Z@hovoldconsulting.com>
References: <20220411083118.200663-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220411083118.200663-1-u.kleine-koenig@pengutronix.de>
Message-ID-Hash: N5UUYAVHU75ZYPXWVB4X4MOZ3H3A2DZQ
X-Message-ID-Hash: N5UUYAVHU75ZYPXWVB4X4MOZ3H3A2DZQ
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: Drop assignment to struct pwm_chip::base
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N5UUYAVHU75ZYPXWVB4X4MOZ3H3A2DZQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBBcHIgMTEsIDIwMjIgYXQgMTA6MzE6MThBTSArMDIwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6DQo+IFNpbmNlIGNvbW1pdCBmOWE4ZWU4YzhiY2QgKCJwd206IEFsd2F5cyBhbGxv
Y2F0ZSBQV00gY2hpcCBiYXNlIElEDQo+IGR5bmFtaWNhbGx5IikgdGhlIHZhbHVlIGhlbGQgaW4g
YmFzZSBpc24ndCB1c2VkIGFueSBtb3JlIGluIHRoZSBQV00NCj4gZnJhbWV3b3JrLiBBbGwgUE1X
cyBnZXQgYXNzaWduZWQgYSBkeW5hbWljIElELCBzbyB0aGUgYXNzaWdubWVudCBpcw0KPiByZWR1
bmRhbnQgYW5kIGNhbiBiZSBkcm9wcGVkLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCj4gLS0tDQo+ICBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyB8IDEgLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVs
ZXRpb24oLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
YyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQo+IGluZGV4IGFkMjBlYzI0MDMxZS4u
M2ZkYTE3MjIzOWQyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
Yw0KPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KPiBAQCAtMjk3LDcgKzI5
Nyw2IEBAIHN0YXRpYyBpbnQgZ2JfcHdtX3Byb2JlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5
X2RldiwNCj4gIA0KPiAgCXB3bS0+ZGV2ID0gJmdicGh5X2Rldi0+ZGV2Ow0KPiAgCXB3bS0+b3Bz
ID0gJmdiX3B3bV9vcHM7DQo+IC0JcHdtLT5iYXNlID0gLTE7CQkJLyogQWxsb2NhdGUgYmFzZSBk
eW5hbWljYWxseSAqLw0KPiAgCXB3bS0+bnB3bSA9IHB3bWMtPnB3bV9tYXggKyAxOw0KPiAgDQo+
ICAJcmV0ID0gcHdtY2hpcF9hZGQocHdtKTsNCj4gDQo+IGJhc2UtY29tbWl0OiAzMTIzMTA5Mjg0
MTc2YjE1MzI4NzQ1OTFmN2M4MWYzODM3YmJkYzE3DQoNCkknZCBwcmVmZXIgaWYgeW91IGFkZGVk
IGEgInB3bTogIiBtb2R1bGUgcHJlZml4IHRvIHRoZSBzdW1tYXJ5IChldmVuIGlmDQp0aGUgcHJl
dmlvdXMgcGF0Y2ggdG8gdGhpcyBkcml2ZXIgZGlkbid0IGhhdmUgdGhhdCkuDQoNCkxvb2tzIGdv
b2QgdG8gbWUgb3RoZXJ3aXNlOg0KDQpSZXZpZXdlZC1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBr
ZXJuZWwub3JnPg0KDQpKb2hhbg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
