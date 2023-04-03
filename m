Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D58706D4C23
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 17:40:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DDF353ED16
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 15:40:30 +0000 (UTC)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	by lists.linaro.org (Postfix) with ESMTPS id 225E63ED6B
	for <greybus-dev@lists.linaro.org>; Mon,  3 Apr 2023 15:40:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 85.220.165.71 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI7-0004bC-E4; Mon, 03 Apr 2023 17:40:19 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI6-008iad-Ih; Mon, 03 Apr 2023 17:40:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pjMI5-00AHwa-Qk; Mon, 03 Apr 2023 17:40:17 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  3 Apr 2023 17:39:54 +0200
Message-Id: <20230403154014.2564054-5-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
References: <20230403154014.2564054-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1786; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=BIk9BkBy2gmmI0VRgkKpjmSBJ5jgKqBxRxl9u+U6s5I=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBkKvM50SNoxRitSHoPUaDp30MBJPSuWbyEWJRrT Mq2Fwc6svWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZCrzOQAKCRCPgPtYfRL+ TqbaB/950tsWzdXXhdbDcERtqOW8LcQzCqOLqWx9VOyrBiwde5BNylSoBTU7kdPD/HVLn6LKhdN PFV0BRPT1c2d5bqXMT52HFpwEphIbdzsh4OF1gVvbMFdKBynZ3+31HM4tdclY4WcW+FI9ZWbrbr dtsIb4H/rhAC1pD7BfJG6XSt9CM+AAhpYtmSs3FlhQhg3aEzWFy1Bsz50sozArVmgonQ2XdrHSV Ik1oxtRWqD+yPqvw7IyZy/8ee6RvQy4rs5o2N1ao+c4eBzlUe1ICVkaziNxvUh7owA9VhblSDoZ bD+RurbJswGfFqWNsonrohxBmqOTF6S6M3mLt6dJiVYQJLQn
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 225E63ED6B
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	FORGED_SENDER(0.30)[u.kleine-koenig@pengutronix.de,ukl@pengutronix.de];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-0.998];
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
Message-ID-Hash: UUN2SNK5WGGRNMGY5PSF67FMG2E2U4NB
X-Message-ID-Hash: UUN2SNK5WGGRNMGY5PSF67FMG2E2U4NB
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 04/24] staging: greybus: arche-apb-ctrl: Convert to platform remove callback returning void
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UUN2SNK5WGGRNMGY5PSF67FMG2E2U4NB/>
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
ZT4NCi0tLQ0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLWFwYi1jdHJsLmMgfCA2ICsr
LS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQoN
CmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1hcGItY3RybC5jIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtYXBiLWN0cmwuYw0KaW5kZXggNDVhZmEyMDhk
MDA0Li44NTQxOTk1MDA4ZGEgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
cmNoZS1hcGItY3RybC5jDQorKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1hcGIt
Y3RybC5jDQpAQCAtNDE5LDEzICs0MTksMTEgQEAgc3RhdGljIGludCBhcmNoZV9hcGJfY3RybF9w
cm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQ0KIAlyZXR1cm4gMDsNCiB9DQogDQot
c3RhdGljIGludCBhcmNoZV9hcGJfY3RybF9yZW1vdmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikNCitzdGF0aWMgdm9pZCBhcmNoZV9hcGJfY3RybF9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikNCiB7DQogCWRldmljZV9yZW1vdmVfZmlsZSgmcGRldi0+ZGV2LCAmZGV2
X2F0dHJfc3RhdGUpOw0KIAlwb3dlcm9mZl9zZXEocGRldik7DQogCXBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIE5VTEwpOw0KLQ0KLQlyZXR1cm4gMDsNCiB9DQogDQogc3RhdGljIGludCBfX21h
eWJlX3VudXNlZCBhcmNoZV9hcGJfY3RybF9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikNCkBA
IC00NzEsNyArNDY5LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgYXJjaGVf
YXBiX2N0cmxfb2ZfbWF0Y2hbXSA9IHsNCiANCiBzdGF0aWMgc3RydWN0IHBsYXRmb3JtX2RyaXZl
ciBhcmNoZV9hcGJfY3RybF9kZXZpY2VfZHJpdmVyID0gew0KIAkucHJvYmUJCT0gYXJjaGVfYXBi
X2N0cmxfcHJvYmUsDQotCS5yZW1vdmUJCT0gYXJjaGVfYXBiX2N0cmxfcmVtb3ZlLA0KKwkucmVt
b3ZlX25ldwk9IGFyY2hlX2FwYl9jdHJsX3JlbW92ZSwNCiAJLnNodXRkb3duCT0gYXJjaGVfYXBi
X2N0cmxfc2h1dGRvd24sDQogCS5kcml2ZXIJCT0gew0KIAkJLm5hbWUJPSAiYXJjaGUtYXBiLWN0
cmwiLA0KLS0gDQoyLjM5LjINCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
