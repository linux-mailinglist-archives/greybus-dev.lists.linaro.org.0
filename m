Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 06E10854586
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:35:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 05C1A442FB
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 09:35:13 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 1523143D4A
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 09:34:54 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBfB-0006HN-Cp; Wed, 14 Feb 2024 10:34:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf8-000fId-33; Wed, 14 Feb 2024 10:34:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf8-004YAV-01;
	Wed, 14 Feb 2024 10:34:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 14 Feb 2024 10:33:25 +0100
Message-ID: <bd2759c325c295f3d9f990609d97eb83a8ca88b8.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=858; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=M1nEGGN/fPFDSJOK21XZySIBys2oNuAKlHcwEQ/zv4Q=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIkA+NtUEwLP5yv1mdRK3Xtx8yWwXEI9nruC3 IlSeNt79ACJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyJAAAKCRCPgPtYfRL+ TrhIB/kB+h3ionhC/Mew5x6ZfPliRoU6LLmabn0oLQefOLgNRAdh4H3EtAKlG4+OM9VB23ngHBo 0VWdPKHgY0J1PKWRr4CsodzMAVUHOzQa3TVpkShyzvgIC4e29GvwjoLX+PzkqIPoPVJfaJWNITz 2xPLdZc9MuIIhQLqUUoXjZw60wFy51pH1koHEKqN1tTvE542Yd3dkONrwbCZOX1l3gIkR4y3NT9 kgZmahAbrSY0s9n6K/Ct8Db0Ix4DxYRfPvwf1CkEz+A6G5X5SCzS4cTWvIeCiiMq9+K0tzHLITE sNVYYqk0T2KFrO2ktnOnt+IzWeT9jkDXNvnHdCw3L7OurLn3
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1523143D4A
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
	NEURAL_HAM(-0.00)[-0.987];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	TO_DN_SOME(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[]
Message-ID-Hash: E6QI7WFDSM54NKSGCOVYTPR7DOLI3DQI
X-Message-ID-Hash: E6QI7WFDSM54NKSGCOVYTPR7DOLI3DQI
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 158/164] staging: greybus: pwm: Drop unused gb_connection_set_data()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E6QI7WFDSM54NKSGCOVYTPR7DOLI3DQI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBuZXZlciBjYWxscyBnYl9jb25uZWN0aW9uX2dldF9kYXRhKCkuIElmIHRoZXJl
IHdhcyBhbm90aGVyDQpjYWxsZXIgKHNheSB0aGUgZ3JleWJ1cyBjb3JlKSBpdCBjYW5ub3QgdXNl
IHRoZSB2YWx1ZSBiZWNhdXNlIHRoZSB0eXBlDQpvZiBwd21jICg9IHN0cnVjdCBnYl9wd21fY2hp
cCkgaXMgb25seSBkZWZpbmVkIGluIHRoZSBwd20gZHJpdmVyLg0KDQpTbyBkcm9wIHRoZSBjYWxs
IHRvIGdiX2Nvbm5lY3Rpb25fc2V0X2RhdGEoKS4NCg0KU2lnbmVkLW9mZi1ieTogVXdlIEtsZWlu
ZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5kZT4NCi0tLQ0KIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3B3bS5jIHwgMSAtDQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24o
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCmluZGV4IDMwOTljMmEzNjExYy4uYzdhMmU4NzRhNjJi
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCisrKyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQpAQCAtMjYwLDcgKzI2MCw2IEBAIHN0YXRpYyBpbnQg
Z2JfcHdtX3Byb2JlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldiwNCiAJfQ0KIA0KIAlw
d21jLT5jb25uZWN0aW9uID0gY29ubmVjdGlvbjsNCi0JZ2JfY29ubmVjdGlvbl9zZXRfZGF0YShj
b25uZWN0aW9uLCBwd21jKTsNCiAJZ2JfZ2JwaHlfc2V0X2RhdGEoZ2JwaHlfZGV2LCBjaGlwKTsN
CiANCiAJcmV0ID0gZ2JfY29ubmVjdGlvbl9lbmFibGUoY29ubmVjdGlvbik7DQotLSANCjIuNDMu
MA0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFy
by5vcmcK
