Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9E585457C
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:35:08 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E72DC3F026
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 09:35:07 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id B3BCB43D4A
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 09:34:53 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBfB-0006Gj-G2; Wed, 14 Feb 2024 10:34:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf7-000fIY-Uj; Wed, 14 Feb 2024 10:34:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf7-004YAR-2o;
	Wed, 14 Feb 2024 10:34:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 14 Feb 2024 10:33:24 +0100
Message-ID: <e003bc5e8e66f27f2b8fdc525a536d865888cffe.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2196; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=zmx6CkVyMRZ+p9Z6W0mBI5mv/cFop1w4pDDSWZ11gWI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIj/K5x27b1JT1+7ha6RrUnUhsqs7V/tFHq3F uO1YdG9M6CJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI/wAKCRCPgPtYfRL+ Tr4ECACmI77mrM25FdkwU4WlydO2QYJQT3v0OVmTkzL+mvUMcykMpV7/hXITxx64TwFEEtBYgby Z2qQhXjLOpzYVPlz7GTjf1EE8bWY3o7p5F6z+Ft+R2bGi53q0i5Pnz45mNCXUBI8KOhA1r9k5i8 9j0ZYhj1ROE+G08hgQresOJkGXAHhuOIlDfm66lMCB4DRzeEdWjpOXnJwgnNtzFcmsYKqYL4mxR SsLsh5DwhAnqAbjDLGauaMOElIJmRJPVjhjhvyFDRwAtGB6S8fJ69sMZe7q30BBQ5Du+1pTwZ64 eW8kWpJPYNwlRQFIb8z3xEUBWpGUiPx7mU6XtePzJCRK7ip2
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B3BCB43D4A
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
	NEURAL_HAM(-0.00)[-0.983];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: DXX4RQ5PBJBX2MGG2C45COCJARNERV7R
X-Message-ID-Hash: DXX4RQ5PBJBX2MGG2C45COCJARNERV7R
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 157/164] staging: greybus: pwm: Rely on pwm framework to pass a valid hwpwm
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DXX4RQ5PBJBX2MGG2C45COCJARNERV7R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIHB3bSBmcmFtZXdvcmsgYWxyZWFkeSBhc3NlcnRzIHRvIG9ubHkgcGFzcyBhIGh3cHdtIHZh
bHVlICg9IHdoaWNoKQ0KbGVzcyB0aGFuIG5wd20gKD0gcHdtYy0+cHdtX21heCArIDEpLiBTbyB0
aGVyZSBpcyBubyBuZWVkIHRvIHJlY2hlY2sNCnRoaXMgY29uZGl0aW9uLiBEcm9wIHRoZSByZXNw
ZWN0aXZlIGNoZWNrcy4NCg0KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xl
aW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCi0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3B3bS5jIHwgMTggLS0tLS0tLS0tLS0tLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDE4IGRlbGV0
aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KaW5kZXggMGNkMWRhYjJkODg4Li4zMDk5YzJh
MzYxMWMgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCkBAIC00Niw5ICs0Niw2IEBAIHN0YXRpYyBp
bnQgZ2JfcHdtX2FjdGl2YXRlX29wZXJhdGlvbihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsIHU4IHdo
aWNoKQ0KIAlzdHJ1Y3QgZ2JwaHlfZGV2aWNlICpnYnBoeV9kZXY7DQogCWludCByZXQ7DQogDQot
CWlmICh3aGljaCA+IHB3bWMtPnB3bV9tYXgpDQotCQlyZXR1cm4gLUVJTlZBTDsNCi0NCiAJcmVx
dWVzdC53aGljaCA9IHdoaWNoOw0KIA0KIAlnYnBoeV9kZXYgPSB0b19nYnBoeV9kZXYocHdtY2hp
cF9wYXJlbnQoY2hpcCkpOw0KQEAgLTcxLDkgKzY4LDYgQEAgc3RhdGljIGludCBnYl9wd21fZGVh
Y3RpdmF0ZV9vcGVyYXRpb24oc3RydWN0IHB3bV9jaGlwICpjaGlwLCB1OCB3aGljaCkNCiAJc3Ry
dWN0IGdicGh5X2RldmljZSAqZ2JwaHlfZGV2Ow0KIAlpbnQgcmV0Ow0KIA0KLQlpZiAod2hpY2gg
PiBwd21jLT5wd21fbWF4KQ0KLQkJcmV0dXJuIC1FSU5WQUw7DQotDQogCXJlcXVlc3Qud2hpY2gg
PSB3aGljaDsNCiANCiAJZ2JwaHlfZGV2ID0gdG9fZ2JwaHlfZGV2KHB3bWNoaXBfcGFyZW50KGNo
aXApKTsNCkBAIC05Nyw5ICs5MSw2IEBAIHN0YXRpYyBpbnQgZ2JfcHdtX2NvbmZpZ19vcGVyYXRp
b24oc3RydWN0IHB3bV9jaGlwICpjaGlwLA0KIAlzdHJ1Y3QgZ2JwaHlfZGV2aWNlICpnYnBoeV9k
ZXY7DQogCWludCByZXQ7DQogDQotCWlmICh3aGljaCA+IHB3bWMtPnB3bV9tYXgpDQotCQlyZXR1
cm4gLUVJTlZBTDsNCi0NCiAJcmVxdWVzdC53aGljaCA9IHdoaWNoOw0KIAlyZXF1ZXN0LmR1dHkg
PSBjcHVfdG9fbGUzMihkdXR5KTsNCiAJcmVxdWVzdC5wZXJpb2QgPSBjcHVfdG9fbGUzMihwZXJp
b2QpOw0KQEAgLTEyNSw5ICsxMTYsNiBAQCBzdGF0aWMgaW50IGdiX3B3bV9zZXRfcG9sYXJpdHlf
b3BlcmF0aW9uKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwNCiAJc3RydWN0IGdicGh5X2RldmljZSAq
Z2JwaHlfZGV2Ow0KIAlpbnQgcmV0Ow0KIA0KLQlpZiAod2hpY2ggPiBwd21jLT5wd21fbWF4KQ0K
LQkJcmV0dXJuIC1FSU5WQUw7DQotDQogCXJlcXVlc3Qud2hpY2ggPSB3aGljaDsNCiAJcmVxdWVz
dC5wb2xhcml0eSA9IHBvbGFyaXR5Ow0KIA0KQEAgLTE1MSw5ICsxMzksNiBAQCBzdGF0aWMgaW50
IGdiX3B3bV9lbmFibGVfb3BlcmF0aW9uKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgdTggd2hpY2gp
DQogCXN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldjsNCiAJaW50IHJldDsNCiANCi0JaWYg
KHdoaWNoID4gcHdtYy0+cHdtX21heCkNCi0JCXJldHVybiAtRUlOVkFMOw0KLQ0KIAlyZXF1ZXN0
LndoaWNoID0gd2hpY2g7DQogDQogCWdicGh5X2RldiA9IHRvX2dicGh5X2Rldihwd21jaGlwX3Bh
cmVudChjaGlwKSk7DQpAQCAtMTc2LDkgKzE2MSw2IEBAIHN0YXRpYyBpbnQgZ2JfcHdtX2Rpc2Fi
bGVfb3BlcmF0aW9uKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgdTggd2hpY2gpDQogCXN0cnVjdCBn
YnBoeV9kZXZpY2UgKmdicGh5X2RldjsNCiAJaW50IHJldDsNCiANCi0JaWYgKHdoaWNoID4gcHdt
Yy0+cHdtX21heCkNCi0JCXJldHVybiAtRUlOVkFMOw0KLQ0KIAlyZXF1ZXN0LndoaWNoID0gd2hp
Y2g7DQogDQogCXJldCA9IGdiX29wZXJhdGlvbl9zeW5jKHB3bWMtPmNvbm5lY3Rpb24sIEdCX1BX
TV9UWVBFX0RJU0FCTEUsDQotLSANCjIuNDMuMA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdy
ZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
