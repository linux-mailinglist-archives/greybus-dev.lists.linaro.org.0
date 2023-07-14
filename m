Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8032A754408
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 22:56:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7F7B643D73
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 20:56:48 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 7B23C3E970
	for <greybus-dev@lists.linaro.org>; Fri, 14 Jul 2023 20:56:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq7-00086u-4g; Fri, 14 Jul 2023 22:56:35 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq6-00EQSx-Ah; Fri, 14 Jul 2023 22:56:34 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq5-004u4J-JR; Fri, 14 Jul 2023 22:56:33 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>
Date: Fri, 14 Jul 2023 22:56:23 +0200
Message-Id: <20230714205623.2496590-11-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
References: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1410; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=816WRzHuNgi7BIlniVAQ2x1zSBndq8zaqSwuIrNldh0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksbZxSAHanlHxVT0WRtopjAS9TxHmeTVfCZVdh RPoraOlzAeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLG2cQAKCRCPgPtYfRL+ TvpcB/0VR1dswEm8hTPk9XV7MZzq8oPaKXBgT1s0yooyP7rCGgGJt7drlThTU3J3D3HattQBUNb noOgVGxFVzhdl+4uqOvAw4NH3r4tH2q2hWjvMRqq1KuZa3XdZefxJeUu+qVssxxRvA9ph4Dj7FE Ei9HaXGWrH/qw+XLAQyFcMgjghg9g1zfjripniQzGFppLqwf6mnEJL/YO8RaeQ9iaHEBcVsr9zW Q5Q4GAmXXn87+sZpaqebrtRmcZlHN4q/3YMvZRTCaVSUWni8JP6T+FsV0uHHSMh8kwF9AH6FqXm UT6M0/jQSEX5Tqx8/k3sfrpOTGpxljQwM7wd1HLOd7YYtQKR
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Spamd-Result: default: False [-1.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[2a0a:edc0:0:900:1d::77:received,2a0a:edc0:0:c01:1d::a2:received];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_IN_DNSWL_LOW(-0.10)[85.220.165.71:from];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,gmail.com];
	R_DKIM_NA(0.00)[];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TAGGED_RCPT(0.00)[];
	RCVD_TLS_LAST(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7B23C3E970
X-Spamd-Bar: -
Message-ID-Hash: TTVC7VT5VMNA3PE4RQAFOZBESWQXXSFT
X-Message-ID-Hash: TTVC7VT5VMNA3PE4RQAFOZBESWQXXSFT
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de, linux-pwm@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 10/10] staging: greybus: pwm: Consistenly name pwm_chip variables "chip"
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TTVC7VT5VMNA3PE4RQAFOZBESWQXXSFT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

QWxsIGZ1bmN0aW9uIHBhcmFtZXRlcnMgb2YgdHlwZSBwb2ludGVyIHRvIHN0cnVjdCBwd21fY2hp
cCBpbiB0aGlzDQpkcml2ZXIgYXJlIGNhbGxlZCBjaGlwIHdoaWNoIGlzIGFsc28gdGhlIHVzdWFs
IG5hbWUgb2YgZnVuY3Rpb24NCnBhcmFtZXRlcnMgYW5kIGxvY2FsIHZhcmlhYmxlcyBpbiBtb3N0
IG90aGVyIHB3bSBkcml2ZXJzLiBGb3IgY29uc2lzdGVuY3kNCnVzZSB0aGUgc2FtZSBuYW1lIGZv
ciB0aGUgbG9jYWwgdmFyaWFibGUgb2YgdGhhdCB0eXBlLg0KDQpTaWduZWQtb2ZmLWJ5OiBVd2Ug
S2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlPg0KLS0tDQogZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgfCAxMiArKysrKystLS0tLS0NCiAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20u
Yw0KaW5kZXggODhkYTFkNzk2ZjEzLi5jNDgzZTFmMDczOGUgMTAwNjQ0DQotLS0gYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdt
LmMNCkBAIC0yNjcsNyArMjY3LDcgQEAgc3RhdGljIGludCBnYl9wd21fcHJvYmUoc3RydWN0IGdi
cGh5X2RldmljZSAqZ2JwaHlfZGV2LA0KIHsNCiAJc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5l
Y3Rpb247DQogCXN0cnVjdCBnYl9wd21fY2hpcCAqcHdtYzsNCi0Jc3RydWN0IHB3bV9jaGlwICpw
d207DQorCXN0cnVjdCBwd21fY2hpcCAqY2hpcDsNCiAJaW50IHJldDsNCiANCiAJcHdtYyA9IGt6
YWxsb2Moc2l6ZW9mKCpwd21jKSwgR0ZQX0tFUk5FTCk7DQpAQCAtMjk1LDEzICsyOTUsMTMgQEAg
c3RhdGljIGludCBnYl9wd21fcHJvYmUoc3RydWN0IGdicGh5X2RldmljZSAqZ2JwaHlfZGV2LA0K
IAlpZiAocmV0KQ0KIAkJZ290byBleGl0X2Nvbm5lY3Rpb25fZGlzYWJsZTsNCiANCi0JcHdtID0g
JnB3bWMtPmNoaXA7DQorCWNoaXAgPSAmcHdtYy0+Y2hpcDsNCiANCi0JcHdtLT5kZXYgPSAmZ2Jw
aHlfZGV2LT5kZXY7DQotCXB3bS0+b3BzID0gJmdiX3B3bV9vcHM7DQotCXB3bS0+bnB3bSA9IHB3
bWMtPnB3bV9tYXggKyAxOw0KKwljaGlwLT5kZXYgPSAmZ2JwaHlfZGV2LT5kZXY7DQorCWNoaXAt
Pm9wcyA9ICZnYl9wd21fb3BzOw0KKwljaGlwLT5ucHdtID0gcHdtYy0+cHdtX21heCArIDE7DQog
DQotCXJldCA9IHB3bWNoaXBfYWRkKHB3bSk7DQorCXJldCA9IHB3bWNoaXBfYWRkKGNoaXApOw0K
IAlpZiAocmV0KSB7DQogCQlkZXZfZXJyKCZnYnBoeV9kZXYtPmRldiwNCiAJCQkiZmFpbGVkIHRv
IHJlZ2lzdGVyIFBXTTogJWRcbiIsIHJldCk7DQotLSANCjIuMzkuMg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
