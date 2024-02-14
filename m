Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C928C854578
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:35:03 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CC81443D4A
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 09:35:02 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 959023F026
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 09:34:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBfB-0006Id-O9; Wed, 14 Feb 2024 10:34:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf8-000fIi-7n; Wed, 14 Feb 2024 10:34:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf8-004YAZ-0V;
	Wed, 14 Feb 2024 10:34:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 14 Feb 2024 10:33:26 +0100
Message-ID: <3efd84ac03e7dc288f20b0de20b142b6404cb1fa.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2418; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=FmfAEOza9/d2hNbh0tuCn4rmbZNKD9slzf5V5SZ7yKA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIkBYfxnpsZDGPR6CM6yYdFj2e0aARUj9TzsI U2MyZHUuwSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyJAQAKCRCPgPtYfRL+ TpHECAC0Dh8Wq/Sy8uBw18G5fGsgw8ytujJBANc7y7TyUUoEmiGH1Jm4NxKDW/BmVwm7CJc9u86 1kh0MZ/Cu9rTQ21uAuK8NF0lg/8s4IDoAkPWyfV9E4mkJ5hWytnH6c7xhtAIM52ZL8nBiyn1IPv gkAQEvnB0PioQhTkTy4N1E6tHoVIpbts3670tq89g0qG8HqPqRJ83L4Hru5UbFJ5p+vOwlyXwVJ hYfUZk8/2xGdDZJYAct76h1CRqh7pF90DxmCVjWN9uj3frn816P0McfT69XKIbAmPVMQYynQW6F Hb3OeKuPq0okk9kDsbTuEhPQKu5EnMli+6uEnf4k53FUJXjw
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 959023F026
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:209379, ipnet:185.203.200.0/22, country:DE];
	RCPT_COUNT_SEVEN(0.00)[7];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_NA(0.00)[];
	NEURAL_HAM(-0.00)[-0.986];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: OPDZD3OSVFXMINBUCU5MG6WXNOW56NAF
X-Message-ID-Hash: OPDZD3OSVFXMINBUCU5MG6WXNOW56NAF
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 159/164] staging: greybus: pwm: Rework how the number of PWM lines is determined
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OPDZD3OSVFXMINBUCU5MG6WXNOW56NAF/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

V2l0aCBhIGxhdGVyIHBhdGNoIGl0IGJlY29tZXMgbmVjZXNzYXJ5IHRvIGFscmVhZHkgbm93IHRo
ZSBudW1iZXIgb2YgUFdNDQpsaW5lcyB3aGVuIHB3bWMgaXMgYWxsb2NhdGVkLiBTbyBtYWtlIHRo
ZSBmdW5jdGlvbiBub3QgdXNlIHB3bWMgYnV0IGENCnBsYWluIGNvbm5lY3Rpb24gYW5kIHJldHVy
biB0aGUgbnVtYmVyIG9mIGxpbmVzIGluc3RlYWQgb2Ygc3RvcmluZyBpdCBpbg0KcHdtYy4gVGhp
cyBhbGxvd3MgdG8gZ2V0IHJpZCBvZiB0aGUgcHdtX21heCBtZW1iZXIuDQoNClNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQot
LS0NCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyB8IDIzICsrKysrKysrKysrKystLS0t
LS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDEzIGluc2VydGlvbnMoKyksIDEwIGRlbGV0aW9ucygt
KQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KaW5kZXggYzdhMmU4NzRhNjJiLi4zNWU5OGU3YzAwYzEg
MTAwNjQ0DQotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KKysrIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCkBAIC0xNiw4ICsxNiw2IEBADQogDQogc3RydWN0IGdi
X3B3bV9jaGlwIHsNCiAJc3RydWN0IGdiX2Nvbm5lY3Rpb24JKmNvbm5lY3Rpb247DQotCXU4CQkJ
cHdtX21heDsJLyogbWF4IHB3bSBudW1iZXIgKi8NCi0NCiAJc3RydWN0IHB3bV9jaGlwCQljaGlw
Ow0KIH07DQogDQpAQCAtMjYsMTcgKzI0LDIxIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGdiX3B3
bV9jaGlwICpwd21fY2hpcF90b19nYl9wd21fY2hpcChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApDQog
CXJldHVybiBjb250YWluZXJfb2YoY2hpcCwgc3RydWN0IGdiX3B3bV9jaGlwLCBjaGlwKTsNCiB9
DQogDQotc3RhdGljIGludCBnYl9wd21fY291bnRfb3BlcmF0aW9uKHN0cnVjdCBnYl9wd21fY2hp
cCAqcHdtYykNCitzdGF0aWMgaW50IGdiX3B3bV9nZXRfbnB3bShzdHJ1Y3QgZ2JfY29ubmVjdGlv
biAqY29ubmVjdGlvbikNCiB7DQogCXN0cnVjdCBnYl9wd21fY291bnRfcmVzcG9uc2UgcmVzcG9u
c2U7DQogCWludCByZXQ7DQogDQotCXJldCA9IGdiX29wZXJhdGlvbl9zeW5jKHB3bWMtPmNvbm5l
Y3Rpb24sIEdCX1BXTV9UWVBFX1BXTV9DT1VOVCwNCisJcmV0ID0gZ2Jfb3BlcmF0aW9uX3N5bmMo
Y29ubmVjdGlvbiwgR0JfUFdNX1RZUEVfUFdNX0NPVU5ULA0KIAkJCQlOVUxMLCAwLCAmcmVzcG9u
c2UsIHNpemVvZihyZXNwb25zZSkpOw0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIHJldDsNCi0JcHdt
Yy0+cHdtX21heCA9IHJlc3BvbnNlLmNvdW50Ow0KLQlyZXR1cm4gMDsNCisNCisJLyoNCisJICog
VGhlIHJlcXVlc3QgcmV0dXJucyB0aGUgaGlnaGVzdCBhbGxvd2VkIFBXTSBpZCBwYXJhbWV0ZXIu
IFNvIGFkZCBvbmUNCisJICogdG8gZ2V0IHRoZSBudW1iZXIgb2YgUFdNcy4NCisJICovDQorCXJl
dHVybiByZXNwb25zZS5jb3VudCArIDE7DQogfQ0KIA0KIHN0YXRpYyBpbnQgZ2JfcHdtX2FjdGl2
YXRlX29wZXJhdGlvbihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHU4IHdoaWNoKQ0KQEAgLTI0NSw3
ICsyNDcsNyBAQCBzdGF0aWMgaW50IGdiX3B3bV9wcm9iZShzdHJ1Y3QgZ2JwaHlfZGV2aWNlICpn
YnBoeV9kZXYsDQogCXN0cnVjdCBnYl9jb25uZWN0aW9uICpjb25uZWN0aW9uOw0KIAlzdHJ1Y3Qg
Z2JfcHdtX2NoaXAgKnB3bWM7DQogCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsNCi0JaW50IHJldDsN
CisJaW50IHJldCwgbnB3bTsNCiANCiAJcHdtYyA9IGt6YWxsb2Moc2l6ZW9mKCpwd21jKSwgR0ZQ
X0tFUk5FTCk7DQogCWlmICghcHdtYykNCkBAIC0yNjcsMTUgKzI2OSwxNiBAQCBzdGF0aWMgaW50
IGdiX3B3bV9wcm9iZShzdHJ1Y3QgZ2JwaHlfZGV2aWNlICpnYnBoeV9kZXYsDQogCQlnb3RvIGV4
aXRfY29ubmVjdGlvbl9kZXN0cm95Ow0KIA0KIAkvKiBRdWVyeSBudW1iZXIgb2YgcHdtcyBwcmVz
ZW50ICovDQotCXJldCA9IGdiX3B3bV9jb3VudF9vcGVyYXRpb24ocHdtYyk7DQotCWlmIChyZXQp
DQorCXJldCA9IGdiX3B3bV9nZXRfbnB3bShjb25uZWN0aW9uKTsNCisJaWYgKHJldCA8IDApDQog
CQlnb3RvIGV4aXRfY29ubmVjdGlvbl9kaXNhYmxlOw0KKwlucHdtID0gcmV0Ow0KIA0KIAljaGlw
ID0gJnB3bWMtPmNoaXA7DQogDQogCWNoaXAtPmRldiA9ICZnYnBoeV9kZXYtPmRldjsNCiAJY2hp
cC0+b3BzID0gJmdiX3B3bV9vcHM7DQotCWNoaXAtPm5wd20gPSBwd21jLT5wd21fbWF4ICsgMTsN
CisJY2hpcC0+bnB3bSA9IG5wd207DQogDQogCXJldCA9IHB3bWNoaXBfYWRkKGNoaXApOw0KIAlp
ZiAocmV0KSB7DQotLSANCjIuNDMuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMt
ZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
