Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B896813AB
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:45:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4A513F334
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:45:47 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id 71EFD3ECD4
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:59:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=hoz3HgsJ;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051187;
	bh=wWKFYgFhVzpvhYIRwOMjSib0YpKzgvkigV7Zrc6HeW8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hoz3HgsJzR0HTU0L5O2nJpYL3V+6uM21jhOK1b4Z6Q5YB0tD/2S75VKCMvXkhX+Jz
	 F7KhGTndvpYZ8k68Nvi8nzXpe/NiEb1bG68yl+M75HlybfPqgkl9Hs6OS+3AzzrAZ5
	 LEaOJDGgmawvwrcGShwZqTKndDA8MV/CL/Lo9cy8=
Date: Mon, 30 Jan 2023 03:59:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20230130-hid-const-ll-driver-v1-3-3fc282b3b1d0@weissschuh.net>
References: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
In-Reply-To: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
To: Basavaraj Natikar <basavaraj.natikar@amd.com>,
 Jiri Kosina <jikos@kernel.org>,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>,
 =?utf-8?q?Filipe_La=C3=ADns?= <lains@riseup.net>,
 Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
 Maximilian Luz <luzmaximilian@gmail.com>,
 Corentin Chary <corentin.chary@gmail.com>,
 Hans de Goede <hdegoede@redhat.com>, Mark Gross <markgross@kernel.org>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=1277;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=wWKFYgFhVzpvhYIRwOMjSib0YpKzgvkigV7Zrc6HeW8=;
 b=gHbhnd+URi4q5m2WIF53+0lFoz9hkcicfRZ9MlD4AWMcgO2mt1jPTSl50kDCl6ERuZDRGRfFwG8U
 SqNvJZPhDzF9MWbKxyaUPTAkJdQC/v0+f3n1IAj0D489WHHxZ6bg
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 71EFD3ECD4
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[weissschuh.net:s=mail];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[amd.com,kernel.org,redhat.com,microsoft.com,riseup.net,linux.intel.com,gmail.com,linuxfoundation.org];
	ASN(0.00)[asn:24940, ipnet:159.69.0.0/16, country:DE];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[weissschuh.net:+];
	TO_DN_SOME(0.00)[];
	DMARC_NA(0.00)[weissschuh.net];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[]
X-Rspamd-Action: no action
X-MailFrom: linux@weissschuh.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2TNJVKF5Q5UTHJF5GV2OSUJR3ZV7QHZI
X-Message-ID-Hash: 2TNJVKF5Q5UTHJF5GV2OSUJR3ZV7QHZI
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:26 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/9] HID: logitech-dj: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2TNJVKF5Q5UTHJF5GV2OSUJR3ZV7QHZI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

U2luY2UgY29tbWl0IDUyZDIyNTM0NjkwNCAoIkhJRDogTWFrZSBsb3dsZXZlbCBkcml2ZXIgc3Ry
dWN0cyBjb25zdCIpDQp0aGUgbG93bGV2ZWwgSElEIGRyaXZlcnMgYXJlIG9ubHkgZXhwb3NlZCBh
cyBjb25zdC4NCg0KVGFrZSBhZHZhbnRhZ2Ugb2YgdGhpcyB0byBjb25zdGlmeSB0aGUgdW5kZXJs
eWluZyBzdHJ1Y3R1cmUsIHRvby4NCg0KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWgg
PGxpbnV4QHdlaXNzc2NodWgubmV0Pg0KLS0tDQogZHJpdmVycy9oaWQvaGlkLWxvZ2l0ZWNoLWRq
LmMgfCA0ICsrLS0NCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvaGlkLWxvZ2l0ZWNoLWRqLmMgYi9kcml2
ZXJzL2hpZC9oaWQtbG9naXRlY2gtZGouYw0KaW5kZXggYzM1ODc3OGUwNzBiLi42MjE4MDQxNGVm
Y2MgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL2hpZC9oaWQtbG9naXRlY2gtZGouYw0KKysrIGIvZHJp
dmVycy9oaWQvaGlkLWxvZ2l0ZWNoLWRqLmMNCkBAIC01NTQsNyArNTU0LDcgQEAgc3RhdGljIGNv
bnN0IHU4IGhpZF9yZXBvcnRpZF9zaXplX21hcFtOVU1CRVJfT0ZfSElEX1JFUE9SVFNdID0gew0K
IA0KICNkZWZpbmUgTE9HSVRFQ0hfREpfSU5URVJGQUNFX05VTUJFUiAweDAyDQogDQotc3RhdGlj
IHN0cnVjdCBoaWRfbGxfZHJpdmVyIGxvZ2lfZGpfbGxfZHJpdmVyOw0KK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgaGlkX2xsX2RyaXZlciBsb2dpX2RqX2xsX2RyaXZlcjsNCiANCiBzdGF0aWMgaW50IGxv
Z2lfZGpfcmVjdl9xdWVyeV9wYWlyZWRfZGV2aWNlcyhzdHJ1Y3QgZGpfcmVjZWl2ZXJfZGV2ICpk
anJjdl9kZXYpOw0KIHN0YXRpYyB2b2lkIGRlbGF5ZWR3b3JrX2NhbGxiYWNrKHN0cnVjdCB3b3Jr
X3N0cnVjdCAqd29yayk7DQpAQCAtMTUwNiw3ICsxNTA2LDcgQEAgc3RhdGljIGJvb2wgbG9naV9k
al9sbF9tYXlfd2FrZXVwKHN0cnVjdCBoaWRfZGV2aWNlICpoaWQpDQogCXJldHVybiBoaWRfaHdf
bWF5X3dha2V1cChkanJjdl9kZXYtPmhpZHBwKTsNCiB9DQogDQotc3RhdGljIHN0cnVjdCBoaWRf
bGxfZHJpdmVyIGxvZ2lfZGpfbGxfZHJpdmVyID0gew0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaGlk
X2xsX2RyaXZlciBsb2dpX2RqX2xsX2RyaXZlciA9IHsNCiAJLnBhcnNlID0gbG9naV9kal9sbF9w
YXJzZSwNCiAJLnN0YXJ0ID0gbG9naV9kal9sbF9zdGFydCwNCiAJLnN0b3AgPSBsb2dpX2RqX2xs
X3N0b3AsDQoNCi0tIA0KMi4zOS4xDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdCAtLSBncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQgYW4gZW1haWwgdG8gZ3JleWJ1cy1k
ZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
