Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 230E08545A2
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:35:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 313B33F026
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 09:35:18 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 5BB19442FB
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 09:34:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBfA-0006G6-DF; Wed, 14 Feb 2024 10:34:44 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf7-000fIU-PU; Wed, 14 Feb 2024 10:34:41 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf7-004YAN-2H;
	Wed, 14 Feb 2024 10:34:41 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 14 Feb 2024 10:33:23 +0100
Message-ID: <7e7517527b825a18ca10cb0faa837577d4f0ec8a.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2807; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=1mYNF32HY1YpSr9chVfF9Db7sNhhVqUKJXsocCMVUh0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIj+81T3xJC2kABDMyQeAwDb/u4T2cO/k38mg ENZN8zKOneJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyI/gAKCRCPgPtYfRL+ TgXBB/9UJva3OZPzzVm1Bqy+w6RCgO2FiSLAxQusHoH5jOsNx5a0QC5WrRFMeR6VqhWtDWqGSgt HnyLum371BXlMWahbq+uxldxlkw4/RFTtiVPxkapVaB/FPeDvd41pJqLAg2B/2Ty5FeA0uJzQAk FUbdrRzVLZ2FELh7JWSrQyJnRRaaRe7eCPsE7FWQX5q3mvSyDZXkuvEYQb/+sbs+8LKvzm+mgSz FDQaBewPOZDTQnSZ+tW4FzyYSbP8MRHDRjKEvtqd9yhQO2lqqwMf3dQTch2XdZJMrelY/SQr7BU 9Gte1FZnK4/KXOI951y6Os9o0OspYFw5V4UG6rG+a988s3aH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5BB19442FB
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
Message-ID-Hash: B2BBH32XXZ7ROZRMPJXM5WOIC5EE3VZ4
X-Message-ID-Hash: B2BBH32XXZ7ROZRMPJXM5WOIC5EE3VZ4
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 156/164] staging: greybus: pwm: Make use of pwmchip_parent() accessor
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B2BBH32XXZ7ROZRMPJXM5WOIC5EE3VZ4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

c3RydWN0IHB3bV9jaGlwOjpkZXYgaXMgYWJvdXQgdG8gY2hhbmdlLiBUbyBub3QgaGF2ZSB0byB0
b3VjaCB0aGlzDQpkcml2ZXIgaW4gdGhlIHNhbWUgY29tbWl0IGFzIHN0cnVjdCBwd21fY2hpcDo6
ZGV2LCB1c2UgdGhlIGFjY2Vzc29yDQpmdW5jdGlvbiBwcm92aWRlZCBmb3IgZXhhY3RseSB0aGlz
IHB1cnBvc2UuDQoNClNpZ25lZC1vZmYtYnk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+DQotLS0NCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
YyB8IDE0ICsrKysrKystLS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3
bS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCmluZGV4IDk3YjQ5ZDQzNmM1NC4u
MGNkMWRhYjJkODg4IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMN
CisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQpAQCAtNTEsNyArNTEsNyBAQCBz
dGF0aWMgaW50IGdiX3B3bV9hY3RpdmF0ZV9vcGVyYXRpb24oc3RydWN0IHB3bV9jaGlwICpjaGlw
LCB1OCB3aGljaCkNCiANCiAJcmVxdWVzdC53aGljaCA9IHdoaWNoOw0KIA0KLQlnYnBoeV9kZXYg
PSB0b19nYnBoeV9kZXYoY2hpcC0+ZGV2KTsNCisJZ2JwaHlfZGV2ID0gdG9fZ2JwaHlfZGV2KHB3
bWNoaXBfcGFyZW50KGNoaXApKTsNCiAJcmV0ID0gZ2JwaHlfcnVudGltZV9nZXRfc3luYyhnYnBo
eV9kZXYpOw0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIHJldDsNCkBAIC03Niw3ICs3Niw3IEBAIHN0
YXRpYyBpbnQgZ2JfcHdtX2RlYWN0aXZhdGVfb3BlcmF0aW9uKHN0cnVjdCBwd21fY2hpcCAqY2hp
cCwgdTggd2hpY2gpDQogDQogCXJlcXVlc3Qud2hpY2ggPSB3aGljaDsNCiANCi0JZ2JwaHlfZGV2
ID0gdG9fZ2JwaHlfZGV2KGNoaXAtPmRldik7DQorCWdicGh5X2RldiA9IHRvX2dicGh5X2Rldihw
d21jaGlwX3BhcmVudChjaGlwKSk7DQogCXJldCA9IGdicGh5X3J1bnRpbWVfZ2V0X3N5bmMoZ2Jw
aHlfZGV2KTsNCiAJaWYgKHJldCkNCiAJCXJldHVybiByZXQ7DQpAQCAtMTA0LDcgKzEwNCw3IEBA
IHN0YXRpYyBpbnQgZ2JfcHdtX2NvbmZpZ19vcGVyYXRpb24oc3RydWN0IHB3bV9jaGlwICpjaGlw
LA0KIAlyZXF1ZXN0LmR1dHkgPSBjcHVfdG9fbGUzMihkdXR5KTsNCiAJcmVxdWVzdC5wZXJpb2Qg
PSBjcHVfdG9fbGUzMihwZXJpb2QpOw0KIA0KLQlnYnBoeV9kZXYgPSB0b19nYnBoeV9kZXYoY2hp
cC0+ZGV2KTsNCisJZ2JwaHlfZGV2ID0gdG9fZ2JwaHlfZGV2KHB3bWNoaXBfcGFyZW50KGNoaXAp
KTsNCiAJcmV0ID0gZ2JwaHlfcnVudGltZV9nZXRfc3luYyhnYnBoeV9kZXYpOw0KIAlpZiAocmV0
KQ0KIAkJcmV0dXJuIHJldDsNCkBAIC0xMzEsNyArMTMxLDcgQEAgc3RhdGljIGludCBnYl9wd21f
c2V0X3BvbGFyaXR5X29wZXJhdGlvbihzdHJ1Y3QgcHdtX2NoaXAgKmNoaXAsDQogCXJlcXVlc3Qu
d2hpY2ggPSB3aGljaDsNCiAJcmVxdWVzdC5wb2xhcml0eSA9IHBvbGFyaXR5Ow0KIA0KLQlnYnBo
eV9kZXYgPSB0b19nYnBoeV9kZXYoY2hpcC0+ZGV2KTsNCisJZ2JwaHlfZGV2ID0gdG9fZ2JwaHlf
ZGV2KHB3bWNoaXBfcGFyZW50KGNoaXApKTsNCiAJcmV0ID0gZ2JwaHlfcnVudGltZV9nZXRfc3lu
YyhnYnBoeV9kZXYpOw0KIAlpZiAocmV0KQ0KIAkJcmV0dXJuIHJldDsNCkBAIC0xNTYsNyArMTU2
LDcgQEAgc3RhdGljIGludCBnYl9wd21fZW5hYmxlX29wZXJhdGlvbihzdHJ1Y3QgcHdtX2NoaXAg
KmNoaXAsIHU4IHdoaWNoKQ0KIA0KIAlyZXF1ZXN0LndoaWNoID0gd2hpY2g7DQogDQotCWdicGh5
X2RldiA9IHRvX2dicGh5X2RldihjaGlwLT5kZXYpOw0KKwlnYnBoeV9kZXYgPSB0b19nYnBoeV9k
ZXYocHdtY2hpcF9wYXJlbnQoY2hpcCkpOw0KIAlyZXQgPSBnYnBoeV9ydW50aW1lX2dldF9zeW5j
KGdicGh5X2Rldik7DQogCWlmIChyZXQpDQogCQlyZXR1cm4gcmV0Ow0KQEAgLTE4NCw3ICsxODQs
NyBAQCBzdGF0aWMgaW50IGdiX3B3bV9kaXNhYmxlX29wZXJhdGlvbihzdHJ1Y3QgcHdtX2NoaXAg
KmNoaXAsIHU4IHdoaWNoKQ0KIAlyZXQgPSBnYl9vcGVyYXRpb25fc3luYyhwd21jLT5jb25uZWN0
aW9uLCBHQl9QV01fVFlQRV9ESVNBQkxFLA0KIAkJCQkmcmVxdWVzdCwgc2l6ZW9mKHJlcXVlc3Qp
LCBOVUxMLCAwKTsNCiANCi0JZ2JwaHlfZGV2ID0gdG9fZ2JwaHlfZGV2KGNoaXAtPmRldik7DQor
CWdicGh5X2RldiA9IHRvX2dicGh5X2Rldihwd21jaGlwX3BhcmVudChjaGlwKSk7DQogCWdicGh5
X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGdicGh5X2Rldik7DQogDQogCXJldHVybiByZXQ7DQpA
QCAtMTk4LDcgKzE5OCw3IEBAIHN0YXRpYyBpbnQgZ2JfcHdtX3JlcXVlc3Qoc3RydWN0IHB3bV9j
aGlwICpjaGlwLCBzdHJ1Y3QgcHdtX2RldmljZSAqcHdtKQ0KIHN0YXRpYyB2b2lkIGdiX3B3bV9m
cmVlKHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZpY2UgKnB3bSkNCiB7DQog
CWlmIChwd21faXNfZW5hYmxlZChwd20pKQ0KLQkJZGV2X3dhcm4oY2hpcC0+ZGV2LCAiZnJlZWlu
ZyBQV00gZGV2aWNlIHdpdGhvdXQgZGlzYWJsaW5nXG4iKTsNCisJCWRldl93YXJuKHB3bWNoaXBf
cGFyZW50KGNoaXApLCAiZnJlZWluZyBQV00gZGV2aWNlIHdpdGhvdXQgZGlzYWJsaW5nXG4iKTsN
CiANCiAJZ2JfcHdtX2RlYWN0aXZhdGVfb3BlcmF0aW9uKGNoaXAsIHB3bS0+aHdwd20pOw0KIH0N
Ci0tIA0KMi40My4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVA
bGlzdHMubGluYXJvLm9yZwo=
