Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9B26813AA
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:45:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 447E63F334
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:45:42 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id 2DCED3E9D5
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:59:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=IHtr2Uua;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051187;
	bh=ZbgbgVtlPFtq55TH0opkbq5iHNhesuWMDM9ZEPXeOsk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IHtr2UuaboBduqdOMpA0Y3egWz4OZpz39J8oRqVw5iP94dUmf4mF7esWnJ84+m7BG
	 v9ZSNw7aALe7JMKpXu5UfKKC/CkAqZP0uuoIX5UMFMDfWoQXbsKtOPWkW6mwCBix+/
	 IYpZ5J2dlAz3+VJR98xDZi+ZP27wPkdLw/yy/V+k=
Date: Mon, 30 Jan 2023 03:59:40 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20230130-hid-const-ll-driver-v1-4-3fc282b3b1d0@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=865;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ZbgbgVtlPFtq55TH0opkbq5iHNhesuWMDM9ZEPXeOsk=;
 b=K+qvlSsOYKsG6L1e28n33S7oEbVaEzdLgqVh5PfopUoHLueDoSD6fx7F81Fsg5y17jqMq6D+mxFI
 Dt3Tz0fCAsJAvZfHiHimUa8Deeuk9XNdvf/Yy+8GUczAZ45Nd/ii
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2DCED3E9D5
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
Message-ID-Hash: DI77GZ7IVGFILJSHFFRRES3Q3N4CI4AP
X-Message-ID-Hash: DI77GZ7IVGFILJSHFFRRES3Q3N4CI4AP
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:26 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 4/9] HID: steam: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DI77GZ7IVGFILJSHFFRRES3Q3N4CI4AP/>
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
PGxpbnV4QHdlaXNzc2NodWgubmV0Pg0KLS0tDQogZHJpdmVycy9oaWQvaGlkLXN0ZWFtLmMgfCAy
ICstDQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQoNCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2hpZC9oaWQtc3RlYW0uYyBiL2RyaXZlcnMvaGlkL2hpZC1zdGVh
bS5jDQppbmRleCA4ZWU0M2NiMjI1ZmMuLjI5ZWM4YjM0NzQxYSAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvaGlkL2hpZC1zdGVhbS5jDQorKysgYi9kcml2ZXJzL2hpZC9oaWQtc3RlYW0uYw0KQEAgLTY3
NCw3ICs2NzQsNyBAQCBzdGF0aWMgaW50IHN0ZWFtX2NsaWVudF9sbF9yYXdfcmVxdWVzdChzdHJ1
Y3QgaGlkX2RldmljZSAqaGRldiwNCiAJCQlyZXBvcnRfdHlwZSwgcmVxdHlwZSk7DQogfQ0KIA0K
LXN0YXRpYyBzdHJ1Y3QgaGlkX2xsX2RyaXZlciBzdGVhbV9jbGllbnRfbGxfZHJpdmVyID0gew0K
K3N0YXRpYyBjb25zdCBzdHJ1Y3QgaGlkX2xsX2RyaXZlciBzdGVhbV9jbGllbnRfbGxfZHJpdmVy
ID0gew0KIAkucGFyc2UgPSBzdGVhbV9jbGllbnRfbGxfcGFyc2UsDQogCS5zdGFydCA9IHN0ZWFt
X2NsaWVudF9sbF9zdGFydCwNCiAJLnN0b3AgPSBzdGVhbV9jbGllbnRfbGxfc3RvcCwNCg0KLS0g
DQoyLjM5LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0
cy5saW5hcm8ub3JnCg==
