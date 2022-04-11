Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9D44FBAE6
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 13:30:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 52C2A3EC2E
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 11:30:23 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id BA6DA3EC04
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 11:30:21 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndsFK-0005un-Cr; Mon, 11 Apr 2022 13:30:14 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndsFK-002NLx-2z; Mon, 11 Apr 2022 13:30:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndsFI-002aYA-2S; Mon, 11 Apr 2022 13:30:12 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 11 Apr 2022 13:30:10 +0200
Message-Id: <20220411113010.208500-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; h=from:subject; bh=oYkYlGqsYivlb/FzVYP55LZaKNpBANwSA/sLpPYYLBM=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiVBE+4+KisJHPjf5XJcTPI7dY5rbvNdFCfKPO8ulS aY+sGT2JATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYlQRPgAKCRDB/BR4rcrsCS2cB/ 93dQjtVSK3TYAsOVwf6veSxDzGFLCGM1qhZYJS3RijqipJh4ytOP2ARfItQ5GLKug7ZYCbfiX84Aw8 WexJeHIUOaNGRP8JLNYHCN/7QPaLtZ2JIaULLe4TFtg3K+e6ZrR++T9vVsZF6wQ2Esu/Wut5EjUS4k LvWwA2iKTO1TFLZkiIxsenzKAvMy6jj7hwPP+XPcpodY7jdPbvHtLrvp6Z2QSeR8LYlfzcR+stMs0i 8eeO87Qymg+SlCg9uaJJs2wABvw0/+92NYrHUVH1NF+Jqn34GvuCGmSNRCYzyIK4DzQbhXfZAxNfB6 Og7KI0PXcxVQGZhjfe1XfqqdLxEZO7
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: VC7YEQ6JFVHWW2Z3P4NPAXE5NYLONMMZ
X-Message-ID-Hash: VC7YEQ6JFVHWW2Z3P4NPAXE5NYLONMMZ
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Lee Jones <lee.jones@linaro.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: pwm: Drop assignment to struct pwm_chip::base
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VC7YEQ6JFVHWW2Z3P4NPAXE5NYLONMMZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

U2luY2UgY29tbWl0IGY5YThlZThjOGJjZCAoInB3bTogQWx3YXlzIGFsbG9jYXRlIFBXTSBjaGlw
IGJhc2UgSUQNCmR5bmFtaWNhbGx5IikgdGhlIHZhbHVlIGhlbGQgaW4gYmFzZSBpc24ndCB1c2Vk
IGFueSBtb3JlIGluIHRoZSBQV00NCmZyYW1ld29yay4gQWxsIFBNV3MgZ2V0IGFzc2lnbmVkIGEg
ZHluYW1pYyBJRCwgc28gdGhlIGFzc2lnbm1lbnQgaXMNCnJlZHVuZGFudCBhbmQgY2FuIGJlIGRy
b3BwZWQuDQoNClJldmlld2VkLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+DQpT
aWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJv
bml4LmRlPg0KLS0tDQpIZWxsbywNCg0KY2hhbmdlcyBzaW5jZSAoaW1wbGljaXQpIHYxOiANCg0K
IC0gQWRkICJwd206ICIgdG8gU3ViamVjdA0KIC0gQWRkIFJldmlld2VkLWJ5Oi10YWcgZm9yIEpv
aGFuDQoNCkJlc3QgcmVnYXJkcw0KVXdlDQoNCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
YyB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3
bS5jDQppbmRleCBhZDIwZWMyNDAzMWUuLjNmZGExNzIyMzlkMiAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9w
d20uYw0KQEAgLTI5Nyw3ICsyOTcsNiBAQCBzdGF0aWMgaW50IGdiX3B3bV9wcm9iZShzdHJ1Y3Qg
Z2JwaHlfZGV2aWNlICpnYnBoeV9kZXYsDQogDQogCXB3bS0+ZGV2ID0gJmdicGh5X2Rldi0+ZGV2
Ow0KIAlwd20tPm9wcyA9ICZnYl9wd21fb3BzOw0KLQlwd20tPmJhc2UgPSAtMTsJCQkvKiBBbGxv
Y2F0ZSBiYXNlIGR5bmFtaWNhbGx5ICovDQogCXB3bS0+bnB3bSA9IHB3bWMtPnB3bV9tYXggKyAx
Ow0KIA0KIAlyZXQgPSBwd21jaGlwX2FkZChwd20pOw0KDQpiYXNlLWNvbW1pdDogMzEyMzEwOTI4
NDE3NmIxNTMyODc0NTkxZjdjODFmMzgzN2JiZGMxNw0KLS0gDQoyLjM1LjENCg0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGlu
ZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2Vu
ZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
