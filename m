Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D4C7543A2
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 22:16:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0A35E43CB8
	for <lists+greybus-dev@lfdr.de>; Fri, 14 Jul 2023 20:16:47 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 7D77E3E970
	for <greybus-dev@lists.linaro.org>; Fri, 14 Jul 2023 20:16:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPDM-0004H2-UB; Fri, 14 Jul 2023 22:16:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPDK-00EQNA-I0; Fri, 14 Jul 2023 22:16:30 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPDJ-004tp4-O1; Fri, 14 Jul 2023 22:16:29 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 14 Jul 2023 22:16:22 +0200
Message-Id: <20230714201622.2490792-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=732; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=EfL1/SSC+L7oVf2UIMoh7qa5MkR+UUBhv0doVq0EsHI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksa0VTkLCp9h8DHvxtctRg88jL6TBnMTnnkkrZ Vb1QRSNGH6JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLGtFQAKCRCPgPtYfRL+ TifzCACaI0s/ckXOHKX6Tn5gyuGz98HoBoFMZkxWRxx+qTKYwnur20H7fYzO+fPPmYg+UWDX4Ev hmW6pMnZiCNY14tgXpp0d2i8NDV+R6vBaybplk2ikZvsSDD4vk9uX/Z9+yObgSo7mprVMnKnheP Dnrd2erPKr+CP6v+z9vYpVSZnckPf+iNgNFy5t1d5la2vP8uKd7Zv9iDiqCRBvca7oBN+SjY1Vt 3M3SmVpQpOyeRgnTVDLZ7Gdw/ZFI2kT4peR1sqe6Ae6PWtYrDn0Zfnmr0n+lNMyA1v5rCwZAHfZ 0GOh7egs5CgzcL6aKnKKr8wlVHyAmtVrHULXCVNcmXVG9rxH
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Spamd-Result: default: False [-3.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[2a0a:edc0:0:c01:1d::a2:received,2a0a:edc0:0:900:1d::77:received];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	R_DKIM_NA(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:25394, ipnet:85.220.128.0/17, country:DE];
	RCVD_IN_DNSWL_FAIL(0.00)[85.220.165.71:server fail];
	NEURAL_HAM(-0.00)[-0.996];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 7D77E3E970
X-Spamd-Bar: ---
Message-ID-Hash: OUXKYKH42BES7VWIDHVVUZGQTQQVBKEG
X-Message-ID-Hash: OUXKYKH42BES7VWIDHVVUZGQTQQVBKEG
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: pwm: Drop unused member from driver struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OUXKYKH42BES7VWIDHVVUZGQTQQVBKEG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhlIGRyaXZlciBkb2Vzbid0IG1ha2UgdXNlIG9mIHN0cnVjdCBnYl9wd21fY2hpcDo6cHdtLiBT
byB0aGF0IHN0cnVjdA0KbWVtYmVyIGNhbiBqdXN0IGJlIGRyb3BwZWQuDQoNClNpZ25lZC1vZmYt
Ynk6IFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQot
LS0NCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyB8IDEgLQ0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGRlbGV0aW9uKC0pDQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9w
d20uYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQppbmRleCA4OGRhMWQ3OTZmMTMu
LmY1NjlkMzcxYTAwNyAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5j
DQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYw0KQEAgLTE5LDcgKzE5LDYgQEAg
c3RydWN0IGdiX3B3bV9jaGlwIHsNCiAJdTgJCQlwd21fbWF4OwkvKiBtYXggcHdtIG51bWJlciAq
Lw0KIA0KIAlzdHJ1Y3QgcHdtX2NoaXAJCWNoaXA7DQotCXN0cnVjdCBwd21fY2hpcAkJKnB3bTsN
CiB9Ow0KIA0KIHN0YXRpYyBpbmxpbmUgc3RydWN0IGdiX3B3bV9jaGlwICpwd21fY2hpcF90b19n
Yl9wd21fY2hpcChzdHJ1Y3QgcHdtX2NoaXAgKmNoaXApDQoNCmJhc2UtY29tbWl0OiAwNmMyYWZi
ODYyZjlkYThkYzVlZmE0YjYwNzZhMGU0OGMzZmJhYWE1DQotLSANCjIuMzkuMg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBz
ZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
