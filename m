Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B34FB600
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 10:31:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5963B402DE
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 08:31:41 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id BF7F03EBBC
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 08:31:39 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndpSK-000541-9r; Mon, 11 Apr 2022 10:31:28 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndpSJ-002LsK-TZ; Mon, 11 Apr 2022 10:31:26 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1ndpSH-002YpK-Pp; Mon, 11 Apr 2022 10:31:25 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Lee Jones <lee.jones@linaro.org>
Date: Mon, 11 Apr 2022 10:31:18 +0200
Message-Id: <20220411083118.200663-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=898; h=from:subject; bh=ER/N+DeBOO1Y9RYHSt+mjXMVVEZi8R68GqVf6f45IVE=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBiU+dSHXk+NBtIcvbw/KEdUTwpCfO/NCaMAnvUfQno iCURsYGJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCYlPnUgAKCRDB/BR4rcrsCSrnB/ 96fl9Nz18OTqBGzJeS0O5PANuWobux9q5FllMui2XbKDNOpOZBPPFU5Yt5mm26LSXrOEaEp4sL6a5k VYq29MzRnBSs/lZpA9t2R8IlGkhAQVzaxQCpmVq9fugujlO0e4qES5nKDNO05edn9xhKYcLM4aFu/a wpqFI87bLcuu68JNZrHN3ffP3JdiuM2gXkTynocViZ+RMfZgy4p7YiQzLjFXkssiblweqPUT98CfZd /BbfSCdcOoKLCv4r6+l2aCo25CLgP+HBIZ51+SNoKubJnzpi+hHxlf3tq2f3rGp1RjRcVcum1r+ZYp MOvtwf1BT1mWW/IG/pxDqvsNROM+Sf
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
Message-ID-Hash: LNQUVKCXQA2DNQOHPWFAMSF3V3TR6LU6
X-Message-ID-Hash: LNQUVKCXQA2DNQOHPWFAMSF3V3TR6LU6
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: Drop assignment to struct pwm_chip::base
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LNQUVKCXQA2DNQOHPWFAMSF3V3TR6LU6/>
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
b3BwZWQuDQoNClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2Vu
aWdAcGVuZ3V0cm9uaXguZGU+DQotLS0NCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyB8
IDEgLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5j
DQppbmRleCBhZDIwZWMyNDAzMWUuLjNmZGExNzIyMzlkMiAxMDA2NDQNCi0tLSBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3B3bS5jDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
Yw0KQEAgLTI5Nyw3ICsyOTcsNiBAQCBzdGF0aWMgaW50IGdiX3B3bV9wcm9iZShzdHJ1Y3QgZ2Jw
aHlfZGV2aWNlICpnYnBoeV9kZXYsDQogDQogCXB3bS0+ZGV2ID0gJmdicGh5X2Rldi0+ZGV2Ow0K
IAlwd20tPm9wcyA9ICZnYl9wd21fb3BzOw0KLQlwd20tPmJhc2UgPSAtMTsJCQkvKiBBbGxvY2F0
ZSBiYXNlIGR5bmFtaWNhbGx5ICovDQogCXB3bS0+bnB3bSA9IHB3bWMtPnB3bV9tYXggKyAxOw0K
IA0KIAlyZXQgPSBwd21jaGlwX2FkZChwd20pOw0KDQpiYXNlLWNvbW1pdDogMzEyMzEwOTI4NDE3
NmIxNTMyODc0NTkxZjdjODFmMzgzN2JiZGMxNw0KLS0gDQoyLjM1LjENCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
