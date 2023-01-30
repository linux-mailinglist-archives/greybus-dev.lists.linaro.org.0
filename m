Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A926813B0
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:46:15 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EDF013F334
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:46:14 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id B9272443F9
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:59:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=jaobbKlM;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051189;
	bh=CeE4LFDYquttLQyjdPuIA0yJAhL1uKGNNm1YrWRTAXo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jaobbKlMg6u5gdaxw5uGqJWbiCgvqun6lx1rEZYJufIvUp4ZXEzHQqAgvpGGP4pwn
	 46ZVIbbDyqQA3y8hpqFOef7CA3jKP5XPh37d7rJIeRAwBGQkBQdrgSPvUe8ORs9dwG
	 NkHNbSWmwq3hcZDtaM0+4RBZ6uO7IsMoYtIkskKI=
Date: Mon, 30 Jan 2023 03:59:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20230130-hid-const-ll-driver-v1-9-3fc282b3b1d0@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=861;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=CeE4LFDYquttLQyjdPuIA0yJAhL1uKGNNm1YrWRTAXo=;
 b=SQUZOk9LKgSTETWY2YqlC8x+hEL9fvydNvVkE6petc6xt8Y5mvKz320j0CJb8DILZGDzcF9A74aC
 /T98d7JHADiph9vBYy0ilCKP+bmJauMaefm3e9xlClK6LSByfdHS
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B9272443F9
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
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
Message-ID-Hash: ZQFMOMACNNNHZMH3PEB57TJXFJS45XQY
X-Message-ID-Hash: ZQFMOMACNNNHZMH3PEB57TJXFJS45XQY
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:28 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 9/9] staging: greybus: hid: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZQFMOMACNNNHZMH3PEB57TJXFJS45XQY/>
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
PGxpbnV4QHdlaXNzc2NodWgubmV0Pg0KLS0tDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlk
LmMgfCAyICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQoNCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2hpZC5jDQppbmRleCBhZGI5MTI4NjgwM2EuLjE1MzM1YzM4Y2IyNiAx
MDA2NDQNCi0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jDQorKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9oaWQuYw0KQEAgLTM4MSw3ICszODEsNyBAQCBzdGF0aWMgaW50IGdi
X2hpZF9wb3dlcihzdHJ1Y3QgaGlkX2RldmljZSAqaGlkLCBpbnQgbHZsKQ0KIH0NCiANCiAvKiBI
SUQgc3RydWN0dXJlIHRvIHBhc3MgY2FsbGJhY2tzICovDQotc3RhdGljIHN0cnVjdCBoaWRfbGxf
ZHJpdmVyIGdiX2hpZF9sbF9kcml2ZXIgPSB7DQorc3RhdGljIGNvbnN0IHN0cnVjdCBoaWRfbGxf
ZHJpdmVyIGdiX2hpZF9sbF9kcml2ZXIgPSB7DQogCS5wYXJzZSA9IGdiX2hpZF9wYXJzZSwNCiAJ
LnN0YXJ0ID0gZ2JfaGlkX3N0YXJ0LA0KIAkuc3RvcCA9IGdiX2hpZF9zdG9wLA0KDQotLSANCjIu
MzkuMQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK
