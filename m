Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BA14C64AA04
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Dec 2022 23:13:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AD99B3EE7B
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Dec 2022 22:13:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id B0DF43E91F
	for <greybus-dev@lists.linaro.org>; Mon, 12 Dec 2022 22:13:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4r31-00031R-RS; Mon, 12 Dec 2022 23:13:19 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4r2z-00475m-Gm; Mon, 12 Dec 2022 23:13:18 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p4r2z-004bn5-Bo; Mon, 12 Dec 2022 23:13:17 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 12 Dec 2022 23:13:15 +0100
Message-Id: <20221212221315.3778788-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1177; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=l3XOAAkkql1vMFy8UQXFieGDro8LK6E6M4V+R1agfPk=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjl6d4vMKwNv1IwAiAygn4VYfarbkQt0eoqsnny6/S 34ALW9WJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY5eneAAKCRDB/BR4rcrsCTthB/ 4jB7uWGmfrH2Ruy/jLWm9yrUDSk77eoU14IH1Df1xOTvqRQyrert2HLL+/GQrdwqqtVGU4pHYTMqhH +I6npjgQSpiTt12KPiOT+mADW4PL24dWVsAzSoAOvqxEoLwlJdXB+WB8bApMV6L31GEcKq73wAb+tG ijKP2UiluBgWf88aLfxjUUS8AHf8rPYXqeqDJ/GmFoJQliwhoQegZRx7hMd3YfaRS1BZWXUWAZ1/4R c/fYJdKhpdzBpHo4Mr4XUdycuLSbhc48LhhbaSJOVOmInF7rhsfkxTTsFCpslaKOsxFM3l8hoiOoJ7 i7gWslmDsOhNrefq63I4gFuqJR/uYV
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Queue-Id: B0DF43E91F
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
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_LAST(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: DSAILO43HEQ5RDFHY3FJ2IVM2XYQCJTO
X-Message-ID-Hash: DSAILO43HEQ5RDFHY3FJ2IVM2XYQCJTO
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: codecs: Drop empty platform remove function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DSAILO43HEQ5RDFHY3FJ2IVM2XYQCJTO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QSByZW1vdmUgY2FsbGJhY2sganVzdCByZXR1cm5pbmcgMCBpcyBlcXVpdmFsZW50IHRvIG5vIHJl
bW92ZSBjYWxsYmFjaw0KYXQgYWxsLiBTbyBkcm9wIHRoZSB1c2VsZXNzIGZ1bmN0aW9uLg0KDQpT
aWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJv
bml4LmRlPg0KLS0tDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYyB8IDYg
LS0tLS0tDQogMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pDQoNCmRpZmYgLS1naXQgYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jIGIvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXVkaW9fY29kZWMuYw0KaW5kZXggMGFkOGFlYWJjY2JmLi43MmFjZTc0ZWE2MDUgMTAw
NjQ0DQotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jDQorKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19jb2RlYy5jDQpAQCAtMTA3NSwxMSArMTA3NSw2
IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb19jb2RlY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQ0KIAkJCWdiYXVkaW9fZGFpLCBBUlJBWV9TSVpFKGdiYXVkaW9fZGFpKSk7DQogfQ0K
IA0KLXN0YXRpYyBpbnQgZ2JhdWRpb19jb2RlY19yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2Rldmlj
ZSAqcGRldikNCi17DQotCXJldHVybiAwOw0KLX0NCi0NCiBzdGF0aWMgY29uc3Qgc3RydWN0IG9m
X2RldmljZV9pZCBncmV5YnVzX2Fzb2NfbWFjaGluZV9vZl9tYXRjaFtdICA9IHsNCiAJeyAuY29t
cGF0aWJsZSA9ICJ0b3NoaWJhLGFwYi1kdW1teS1jb2RlYyIsIH0sDQogCXt9LA0KQEAgLTEwOTQs
NyArMTA4OSw2IEBAIHN0YXRpYyBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyIGdiYXVkaW9fY29kZWNf
ZHJpdmVyID0gew0KIAkJLm9mX21hdGNoX3RhYmxlID0gZ3JleWJ1c19hc29jX21hY2hpbmVfb2Zf
bWF0Y2gsDQogCX0sDQogCS5wcm9iZSA9IGdiYXVkaW9fY29kZWNfcHJvYmUsDQotCS5yZW1vdmUg
PSBnYmF1ZGlvX2NvZGVjX3JlbW92ZSwNCiB9Ow0KIG1vZHVsZV9wbGF0Zm9ybV9kcml2ZXIoZ2Jh
dWRpb19jb2RlY19kcml2ZXIpOw0KIA0KDQpiYXNlLWNvbW1pdDogODMwYjNjNjhjMWZiMWU5MTc2
MDI4ZDAyZWY4NmYzY2Y3NmFhMjQ3Ng0KLS0gDQoyLjM4LjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0t
IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
