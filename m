Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1F6813A9
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:45:37 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C399E3EC03
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:45:36 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id 4BF1A3EBCE
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:59:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=URXQEDOM;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051187;
	bh=iX47upW85gfJMHXCNpRtaH9985qjJ/jS5RtXWPSoIgg=;
	h=From:Subject:Date:To:Cc:From;
	b=URXQEDOMQ30evZignf53zq4fcP+gjLYiP8q4WOrWjvftKlFLN5pDksPfGwtSfKYfj
	 7GWr6NC6zgSyblLQuOIz5ROb9kgxN5qjcg/vtbb8/nGH4iqPDPmGC6k7CazHH/9ZSm
	 P7AyjEgkp8JEVtwfP3uF4ruicpBanmnISCxFI87I=
Date: Mon, 30 Jan 2023 03:59:36 +0000
Message-Id: <20230130-hid-const-ll-driver-v1-0-3fc282b3b1d0@weissschuh.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-B4-Tracking: v=1; b=H4sIAKhA12MC/x2NQQoCMQwAv7LkbKDdXsSviIe2SW2gZCXRRVj27
 xaPMzDMAc4m7HBbDjDexWXTCfGyQO1Zn4xCk2ENawoxBexCWDf1N46BZLKzYauNKOUWY7nCLEt
 2xmJZa5+tfsaY8mXc5Ptf3R/n+QNb+Cy3egAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051184; l=1428;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=iX47upW85gfJMHXCNpRtaH9985qjJ/jS5RtXWPSoIgg=;
 b=wUViSb0tGQR60ua/5uXJ4ubJuesnlmDI25uiARSVmgdEPgnthqmmTYYrXBbv5el7sWYGYDodKxYP
 cdNZVeuGB1p0HWiMJ6mcEVfNyvmNoYYYAXwfHnGmb5Jg7ff6SGQI
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4BF1A3EBCE
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
Message-ID-Hash: D6U7SD5XFN2R5ZSAIDTPLG5YPJQRGXX4
X-Message-ID-Hash: D6U7SD5XFN2R5ZSAIDTPLG5YPJQRGXX4
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:26 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 0/9] HID: Constify lowlevel HID drivers
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D6U7SD5XFN2R5ZSAIDTPLG5YPJQRGXX4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Transfer-Encoding: base64

U2luY2UgNTJkMjI1MzQ2OTA0ICgiSElEOiBNYWtlIGxvd2xldmVsIGRyaXZlciBzdHJ1Y3RzIGNv
bnN0IikgdGhlDQpsb3dsZXZlbCBISUQgZHJpdmVycyBhcmUgb25seSBleHBvc2VkIGFzIGNvbnN0
Lg0KDQpUYWtlIGFkdmFudGFnZSBvZiB0aGlzIHRvIGNvbnN0aWZ5IHRoZSB1bmRlcmx5aW5nIHN0
cnVjdHVyZXMsIHRvby4NCg0KU2lnbmVkLW9mZi1ieTogVGhvbWFzIFdlacOfc2NodWggPGxpbnV4
QHdlaXNzc2NodWgubmV0Pg0KLS0tDQpUaG9tYXMgV2Vpw59zY2h1aCAoOSk6DQogICAgICBISUQ6
IGFtZF9zZmg6IENvbnN0aWZ5IGxvd2xldmVsIEhJRCBkcml2ZXINCiAgICAgIEhJRDogaHlwZXJ2
OiBDb25zdGlmeSBsb3dsZXZlbCBISUQgZHJpdmVyDQogICAgICBISUQ6IGxvZ2l0ZWNoLWRqOiBD
b25zdGlmeSBsb3dsZXZlbCBISUQgZHJpdmVyDQogICAgICBISUQ6IHN0ZWFtOiBDb25zdGlmeSBs
b3dsZXZlbCBISUQgZHJpdmVyDQogICAgICBISUQ6IGludGVsLWlzaC1oaWQ6IENvbnN0aWZ5IGxv
d2xldmVsIEhJRCBkcml2ZXINCiAgICAgIEhJRDogc3VyZmFjZS1oaWQ6IENvbnN0aWZ5IGxvd2xl
dmVsIEhJRCBkcml2ZXINCiAgICAgIHBsYXRmb3JtL3g4NjogYXN1cy10ZjEwM2MtZG9jazogQ29u
c3RpZnkgbG93bGV2ZWwgSElEIGRyaXZlcg0KICAgICAgcGxhdGZvcm0veDg2OiBhc3VzLXRmMTAz
Yy1kb2NrOiBDb25zdGlmeSB0b3Byb3cga2V5bWFwDQogICAgICBzdGFnaW5nOiBncmV5YnVzOiBo
aWQ6IENvbnN0aWZ5IGxvd2xldmVsIEhJRCBkcml2ZXINCg0KIGRyaXZlcnMvaGlkL2FtZC1zZmgt
aGlkL2FtZF9zZmhfaGlkLmMgICAgICB8IDIgKy0NCiBkcml2ZXJzL2hpZC9oaWQtaHlwZXJ2LmMg
ICAgICAgICAgICAgICAgICAgfCAyICstDQogZHJpdmVycy9oaWQvaGlkLWxvZ2l0ZWNoLWRqLmMg
ICAgICAgICAgICAgIHwgNCArKy0tDQogZHJpdmVycy9oaWQvaGlkLXN0ZWFtLmMgICAgICAgICAg
ICAgICAgICAgIHwgMiArLQ0KIGRyaXZlcnMvaGlkL2ludGVsLWlzaC1oaWQvaXNodHAtaGlkLmMg
ICAgICB8IDIgKy0NCiBkcml2ZXJzL2hpZC9zdXJmYWNlLWhpZC9zdXJmYWNlX2hpZF9jb3JlLmMg
fCAyICstDQogZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy10ZjEwM2MtZG9jay5jICAgIHwgNCAr
Ky0tDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMgICAgICAgICAgICAgIHwgMiArLQ0K
IDggZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwgMTAgZGVsZXRpb25zKC0pDQotLS0N
CmJhc2UtY29tbWl0OiBlMDQ5NTVkYjZhN2MzZmM0YTFlNjk3ODY0OWI2MWE2ZjVmODAyOGUzDQpj
aGFuZ2UtaWQ6IDIwMjMwMTMwLWhpZC1jb25zdC1sbC1kcml2ZXItZmNmZGQzYWYxMWI4DQoNCkJl
c3QgcmVnYXJkcywNCi0tIA0KVGhvbWFzIFdlacOfc2NodWggPGxpbnV4QHdlaXNzc2NodWgubmV0
Pg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1
bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFy
by5vcmcK
