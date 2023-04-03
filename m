Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 284216D4C29
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 17:40:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 30EBF3ED16
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 15:40:36 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 216B33ED16
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 15:40:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI7-0004bE-E4; Mon, 03 Apr 2023 17:40:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008iah-Mb; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI5-00AHwd-Vy; Mon, 03 Apr 2023 17:40:18 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  3 Apr 2023 17:39:55 +0200
Message-Id: <20230403154014.2564054-6-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1977; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=1Hhb2uBDpN1VmnjqHoToZqj1BNXe80rbfoyr/UEIjx4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM6dnl8Evw4sufYPKXfzEKjbsSGaRCXd6ti6 06HnnxS18yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzOgAKCRCPgPtYfRL+ TpT/B/wJFcKlBBSJP0f9im+eMTosv//i202BPenc/RdMDRK7ne0muB4FzgqvFzc0wPCI1pC+RTl Ga7oMAvwtWxrJ7eKMpceS/lpKmof4tCeu7SzPjBhf1wZLqKbGiU+hF5l3j6mDy9+KwuG+2Q9j8j xkklECABsHhjI2Sbxm6pOZFRBmaaXCQb1rHC77HmlwIren3gOgPMguf9nhpk2NBwv9bW2XUkEmg kyWWSWv33EggfzOOfVkBBVyQLmEiYM3VQgB8XIS9g4SDdnNqXMQW9wOS123+U3S9lGDR6rmy16o BeKuJJ+I80EYE9voILGKh8aKk/ZwqxDaTRKAHGMqhRrZ93Ta
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 216B33ED16
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.999];
	R_DKIM_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_LAST(0.00)[]
Message-ID-Hash: 4OVOXBUEHZ6IDLRCRF5GUXL5543NTPSP
X-Message-ID-Hash: 4OVOXBUEHZ6IDLRCRF5GUXL5543NTPSP
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 05/24] staging: greybus: arche: Convert to platform remove callback returning void
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4OVOXBUEHZ6IDLRCRF5GUXL5543NTPSP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIC5yZW1vdmUoKSBjYWxsYmFjayBmb3IgYSBwbGF0Zm9ybSBkcml2ZXIgcmV0dXJucyBhbiBp
bnQgd2hpY2ggbWFrZXMNCm1hbnkgZHJpdmVyIGF1dGhvcnMgd3JvbmdseSBhc3N1bWUgaXQncyBw
b3NzaWJsZSB0byBkbyBlcnJvciBoYW5kbGluZyBieQ0KcmV0dXJuaW5nIGFuIGVycm9yIGNvZGUu
IEhvd2V2ZXIgdGhlIHZhbHVlIHJldHVybmVkIGlzIChtb3N0bHkpIGlnbm9yZWQNCmFuZCB0aGlz
IHR5cGljYWxseSByZXN1bHRzIGluIHJlc291cmNlIGxlYWtzLiBUbyBpbXByb3ZlIGhlcmUgdGhl
cmUgaXMgYQ0KcXVlc3QgdG8gbWFrZSB0aGUgcmVtb3ZlIGNhbGxiYWNrIHJldHVybiB2b2lkLiBJ
biB0aGUgZmlyc3Qgc3RlcCBvZiB0aGlzDQpxdWVzdCBhbGwgZHJpdmVycyBhcmUgY29udmVydGVk
IHRvIC5yZW1vdmVfbmV3KCkgd2hpY2ggYWxyZWFkeSByZXR1cm5zDQp2b2lkLg0KDQpUcml2aWFs
bHkgY29udmVydCB0aGlzIGRyaXZlciBmcm9tIGFsd2F5cyByZXR1cm5pbmcgemVybyBpbiB0aGUg
cmVtb3ZlDQpjYWxsYmFjayB0byB0aGUgdm9pZCByZXR1cm5pbmcgdmFyaWFudC4NCg0KU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4NCi0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMgfCA2ICsr
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYw0KaW5kZXggZmNiZDVmNzFl
ZmYyLi5lYmU4MzVmMjVkMTMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
cmNoZS1wbGF0Zm9ybS5jDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0
Zm9ybS5jDQpAQCAtNTU5LDcgKzU1OSw3IEBAIHN0YXRpYyBpbnQgYXJjaGVfcmVtb3ZlX2NoaWxk
KHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqdW51c2VkKQ0KIAlyZXR1cm4gMDsNCiB9DQogDQot
c3RhdGljIGludCBhcmNoZV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCitzdGF0aWMgdm9pZCBhcmNoZV9wbGF0Zm9ybV9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCiB7DQogCXN0cnVjdCBhcmNoZV9wbGF0Zm9ybV9kcnZkYXRhICphcmNo
ZV9wZGF0YSA9IHBsYXRmb3JtX2dldF9kcnZkYXRhKHBkZXYpOw0KIA0KQEAgLTU3MCw4ICs1NzAs
NiBAQCBzdGF0aWMgaW50IGFyY2hlX3BsYXRmb3JtX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQ0KIA0KIAlpZiAodXNiMzYxM19odWJfbW9kZV9jdHJsKGZhbHNlKSkNCiAJCWRl
dl93YXJuKGFyY2hlX3BkYXRhLT5kZXYsICJmYWlsZWQgdG8gY29udHJvbCBodWIgZGV2aWNlXG4i
KTsNCi0JCS8qIFRPRE86IFNob3VsZCB3ZSBkbyBhbnl0aGluZyBtb3JlIGhlcmUgPz8gKi8NCi0J
cmV0dXJuIDA7DQogfQ0KIA0KIHN0YXRpYyBfX21heWJlX3VudXNlZCBpbnQgYXJjaGVfcGxhdGZv
cm1fc3VzcGVuZChzdHJ1Y3QgZGV2aWNlICpkZXYpDQpAQCAtNjMxLDcgKzYyOSw3IEBAIE1PRFVM
RV9ERVZJQ0VfVEFCTEUob2YsIGFyY2hlX2NvbWJpbmVkX2lkKTsNCiANCiBzdGF0aWMgc3RydWN0
IHBsYXRmb3JtX2RyaXZlciBhcmNoZV9wbGF0Zm9ybV9kZXZpY2VfZHJpdmVyID0gew0KIAkucHJv
YmUJCT0gYXJjaGVfcGxhdGZvcm1fcHJvYmUsDQotCS5yZW1vdmUJCT0gYXJjaGVfcGxhdGZvcm1f
cmVtb3ZlLA0KKwkucmVtb3ZlX25ldwk9IGFyY2hlX3BsYXRmb3JtX3JlbW92ZSwNCiAJLnNodXRk
b3duCT0gYXJjaGVfcGxhdGZvcm1fc2h1dGRvd24sDQogCS5kcml2ZXIJCT0gew0KIAkJLm5hbWUJ
PSAiYXJjaGUtcGxhdGZvcm0tY3RybCIsDQotLSANCjIuMzkuMg0KDQpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3Qg
LS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVt
YWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
