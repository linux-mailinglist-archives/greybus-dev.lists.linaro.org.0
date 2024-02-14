Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A8778545BA
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 10:35:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 491D7442FB
	for <lists+greybus-dev@lfdr.de>; Wed, 14 Feb 2024 09:35:23 +0000 (UTC)
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	by lists.linaro.org (Postfix) with ESMTPS id 524A244301
	for <greybus-dev@lists.linaro.org>; Wed, 14 Feb 2024 09:34:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=none;
	spf=pass (lists.linaro.org: domain of ukl@pengutronix.de designates 185.203.201.7 as permitted sender) smtp.mailfrom=ukl@pengutronix.de;
	dmarc=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBfB-0006JJ-RJ; Wed, 14 Feb 2024 10:34:45 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf8-000fIn-Ch; Wed, 14 Feb 2024 10:34:42 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1raBf8-004YAd-10;
	Wed, 14 Feb 2024 10:34:42 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: linux-pwm@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 14 Feb 2024 10:33:27 +0100
Message-ID: <3206ab7f49c2c1704ea69446f3b7a7d1e71200fa.1707900770.git.u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
References: <cover.1707900770.git.u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534; i=u.kleine-koenig@pengutronix.de; h=from:subject:message-id; bh=z+L8+hqUgmZZu+s65iyKxbmf3RXXx30nrI6+QzhdI1A=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBlzIkCavGDdXYL8zJhU3P466g+Ze3aOU0hm2VoS Bb55Ag1NpuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZcyJAgAKCRCPgPtYfRL+ TiHsB/0UOGLm89ANiWtXK0DXgEHs7uQI9oyTPuhdWzei4CgPqEg+fLIUstRMAilDUMeo71tnvm/ uunUafJ6WJox3fKb0NSwmNYfPZ7ZhdyR0f9buo3Mp6KHDVuCdW+V7rm4rH5VvmSHDKy8PN0FAqM 5KnDpvuBThvfAedsiRUkiBzDTux9acbgdyQ4qSfVBv8dSoMAQmarIbAUXy21ftOVPY0aiieyVqs fhQRiIYsxRldQR7dRpAUr9D0dqWpKiB3kw+6+rtZT4M0qkLK3HQWYWpG8nrOyqsvEVxeVH/jTV2 v3Eiug3dR6jafOg2snVa1cIfliuciNsrGyAgsWuz3eofYS5f
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: greybus-dev@lists.linaro.org
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 524A244301
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
Message-ID-Hash: XHFIQPMHCQGSVMGSO34IZCPTJDQNM5UD
X-Message-ID-Hash: XHFIQPMHCQGSVMGSO34IZCPTJDQNM5UD
X-MailFrom: ukl@pengutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, kernel@pengutronix.de
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v6 160/164] staging: greybus: pwm: Make use of devm_pwmchip_alloc() function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XHFIQPMHCQGSVMGSO34IZCPTJDQNM5UD/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

VGhpcyBwcmVwYXJlcyB0aGUgZ3JleWJ1cyBwd20gZHJpdmVyIHRvIGZ1cnRoZXIgY2hhbmdlcyBv
ZiB0aGUgcHdtIGNvcmUNCm91dGxpbmVkIGluIHRoZSBjb21taXQgaW50cm9kdWNpbmcgcHdtY2hp
cF9hbGxvYygpLiBUaGVyZSBpcyBubyBpbnRlbmRlZA0Kc2VtYW50aWNhbCBjaGFuZ2UgYW5kIHRo
ZSBkcml2ZXIgc2hvdWxkIGJlaGF2ZSBhcyBiZWZvcmUuDQoNClNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+DQotLS0NCiBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyB8IDMzICsrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0tLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxOCBkZWxldGlvbnMo
LSkNCg0KZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCmluZGV4IDM1ZTk4ZTdjMDBjMS4uMDE4ODNmYmNkNzli
IDEwMDY0NA0KLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMNCisrKyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL3B3bS5jDQpAQCAtMjQ5LDIwICsyNDksMTEgQEAgc3RhdGljIGlu
dCBnYl9wd21fcHJvYmUoc3RydWN0IGdicGh5X2RldmljZSAqZ2JwaHlfZGV2LA0KIAlzdHJ1Y3Qg
cHdtX2NoaXAgKmNoaXA7DQogCWludCByZXQsIG5wd207DQogDQotCXB3bWMgPSBremFsbG9jKHNp
emVvZigqcHdtYyksIEdGUF9LRVJORUwpOw0KLQlpZiAoIXB3bWMpDQotCQlyZXR1cm4gLUVOT01F
TTsNCi0NCiAJY29ubmVjdGlvbiA9IGdiX2Nvbm5lY3Rpb25fY3JlYXRlKGdicGh5X2Rldi0+YnVu
ZGxlLA0KIAkJCQkJICBsZTE2X3RvX2NwdShnYnBoeV9kZXYtPmNwb3J0X2Rlc2MtPmlkKSwNCiAJ
CQkJCSAgTlVMTCk7DQotCWlmIChJU19FUlIoY29ubmVjdGlvbikpIHsNCi0JCXJldCA9IFBUUl9F
UlIoY29ubmVjdGlvbik7DQotCQlnb3RvIGV4aXRfcHdtY19mcmVlOw0KLQl9DQotDQotCXB3bWMt
PmNvbm5lY3Rpb24gPSBjb25uZWN0aW9uOw0KLQlnYl9nYnBoeV9zZXRfZGF0YShnYnBoeV9kZXYs
IGNoaXApOw0KKwlpZiAoSVNfRVJSKGNvbm5lY3Rpb24pKQ0KKwkJcmV0dXJuIFBUUl9FUlIoY29u
bmVjdGlvbik7DQogDQogCXJldCA9IGdiX2Nvbm5lY3Rpb25fZW5hYmxlKGNvbm5lY3Rpb24pOw0K
IAlpZiAocmV0KQ0KQEAgLTI3NCwyOCArMjY1LDM0IEBAIHN0YXRpYyBpbnQgZ2JfcHdtX3Byb2Jl
KHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldiwNCiAJCWdvdG8gZXhpdF9jb25uZWN0aW9u
X2Rpc2FibGU7DQogCW5wd20gPSByZXQ7DQogDQotCWNoaXAgPSAmcHdtYy0+Y2hpcDsNCisJY2hp
cCA9IHB3bWNoaXBfYWxsb2MoJmdicGh5X2Rldi0+ZGV2LCBucHdtLCBzaXplb2YoKnB3bWMpKTsN
CisJaWYgKElTX0VSUihjaGlwKSkgew0KKwkJcmV0ID0gUFRSX0VSUihjaGlwKTsNCisJCWdvdG8g
ZXhpdF9jb25uZWN0aW9uX2Rpc2FibGU7DQorCX0NCisJZ2JfZ2JwaHlfc2V0X2RhdGEoZ2JwaHlf
ZGV2LCBjaGlwKTsNCisNCisJcHdtYyA9IHB3bV9jaGlwX3RvX2diX3B3bV9jaGlwKGNoaXApOw0K
Kwlwd21jLT5jb25uZWN0aW9uID0gY29ubmVjdGlvbjsNCiANCi0JY2hpcC0+ZGV2ID0gJmdicGh5
X2Rldi0+ZGV2Ow0KIAljaGlwLT5vcHMgPSAmZ2JfcHdtX29wczsNCi0JY2hpcC0+bnB3bSA9IG5w
d207DQogDQogCXJldCA9IHB3bWNoaXBfYWRkKGNoaXApOw0KIAlpZiAocmV0KSB7DQogCQlkZXZf
ZXJyKCZnYnBoeV9kZXYtPmRldiwNCiAJCQkiZmFpbGVkIHRvIHJlZ2lzdGVyIFBXTTogJWRcbiIs
IHJldCk7DQotCQlnb3RvIGV4aXRfY29ubmVjdGlvbl9kaXNhYmxlOw0KKwkJZ290byBleGl0X3B3
bWNoaXBfcHV0Ow0KIAl9DQogDQogCWdicGh5X3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKGdicGh5
X2Rldik7DQogCXJldHVybiAwOw0KIA0KK2V4aXRfcHdtY2hpcF9wdXQ6DQorCXB3bWNoaXBfcHV0
KGNoaXApOw0KIGV4aXRfY29ubmVjdGlvbl9kaXNhYmxlOg0KIAlnYl9jb25uZWN0aW9uX2Rpc2Fi
bGUoY29ubmVjdGlvbik7DQogZXhpdF9jb25uZWN0aW9uX2Rlc3Ryb3k6DQogCWdiX2Nvbm5lY3Rp
b25fZGVzdHJveShjb25uZWN0aW9uKTsNCi1leGl0X3B3bWNfZnJlZToNCi0Ja2ZyZWUocHdtYyk7
DQogCXJldHVybiByZXQ7DQogfQ0KIA0KQEAgLTMxMSw5ICszMDgsOSBAQCBzdGF0aWMgdm9pZCBn
Yl9wd21fcmVtb3ZlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldikNCiAJCWdicGh5X3J1
bnRpbWVfZ2V0X25vcmVzdW1lKGdicGh5X2Rldik7DQogDQogCXB3bWNoaXBfcmVtb3ZlKGNoaXAp
Ow0KKwlwd21jaGlwX3B1dChjaGlwKTsNCiAJZ2JfY29ubmVjdGlvbl9kaXNhYmxlKGNvbm5lY3Rp
b24pOw0KIAlnYl9jb25uZWN0aW9uX2Rlc3Ryb3koY29ubmVjdGlvbik7DQotCWtmcmVlKHB3bWMp
Ow0KIH0NCiANCiBzdGF0aWMgY29uc3Qgc3RydWN0IGdicGh5X2RldmljZV9pZCBnYl9wd21faWRf
dGFibGVbXSA9IHsNCi0tIA0KMi40My4wDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1
cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
