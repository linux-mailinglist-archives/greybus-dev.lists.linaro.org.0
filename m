Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AAA6813AF
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:46:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9D55A3EF80
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:46:09 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id B2FF8443F8
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:59:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=m08eIYfz;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051189;
	bh=ZVx6naOMYxZrL7gFQy2uPLdj4XvZCzz8L2TujyTgXkg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=m08eIYfzdGMLssh27zrA7VH/mZuLABQJCPXeSLk3osH6tSmCYF08BOqlJel7sTCON
	 0bY91rvZJvghShk+ZI6yzofv8Wl1lCfN3z6A8zIGOZVteerzuvkMS0ZGHkFyFKjPZm
	 N3VbEh3ObCW58opk56OV5d9HTGQbwamNIpCazDcA=
Date: Mon, 30 Jan 2023 03:59:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20230130-hid-const-ll-driver-v1-6-3fc282b3b1d0@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=969;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=ZVx6naOMYxZrL7gFQy2uPLdj4XvZCzz8L2TujyTgXkg=;
 b=2WGCbXrUuOpHu5oaa0XrA0GX6gD4aiJxvNflnQnh3nfJF6hdlI9e4yzKod5PWOeZilyzVwTmBxyz
 g3AEpPIkCEkndkzI00I3FXQDZe0uwGzpBrv+RNeqQDSjeaDDhqxO
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B2FF8443F8
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
Message-ID-Hash: JZVFSG2EDBMXPH6ULKBYT3E7ZL46W3KI
X-Message-ID-Hash: JZVFSG2EDBMXPH6ULKBYT3E7ZL46W3KI
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:28 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 6/9] HID: surface-hid: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/JZVFSG2EDBMXPH6ULKBYT3E7ZL46W3KI/>
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
PGxpbnV4QHdlaXNzc2NodWgubmV0Pg0KLS0tDQogZHJpdmVycy9oaWQvc3VyZmFjZS1oaWQvc3Vy
ZmFjZV9oaWRfY29yZS5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9oaWQvc3VyZmFjZS1oaWQvc3Vy
ZmFjZV9oaWRfY29yZS5jIGIvZHJpdmVycy9oaWQvc3VyZmFjZS1oaWQvc3VyZmFjZV9oaWRfY29y
ZS5jDQppbmRleCA4NzYzN2Y4MTNkZTIuLmEzZTljY2VkZGZhYyAxMDA2NDQNCi0tLSBhL2RyaXZl
cnMvaGlkL3N1cmZhY2UtaGlkL3N1cmZhY2VfaGlkX2NvcmUuYw0KKysrIGIvZHJpdmVycy9oaWQv
c3VyZmFjZS1oaWQvc3VyZmFjZV9oaWRfY29yZS5jDQpAQCAtMTc0LDcgKzE3NCw3IEBAIHN0YXRp
YyBpbnQgc3VyZmFjZV9oaWRfcmF3X3JlcXVlc3Qoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCwgdW5z
aWduZWQgY2hhciByZXBvcnRuDQogCXJldHVybiAtRUlPOw0KIH0NCiANCi1zdGF0aWMgc3RydWN0
IGhpZF9sbF9kcml2ZXIgc3VyZmFjZV9oaWRfbGxfZHJpdmVyID0gew0KK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgaGlkX2xsX2RyaXZlciBzdXJmYWNlX2hpZF9sbF9kcml2ZXIgPSB7DQogCS5zdGFydCAg
ICAgICA9IHN1cmZhY2VfaGlkX3N0YXJ0LA0KIAkuc3RvcCAgICAgICAgPSBzdXJmYWNlX2hpZF9z
dG9wLA0KIAkub3BlbiAgICAgICAgPSBzdXJmYWNlX2hpZF9vcGVuLA0KDQotLSANCjIuMzkuMQ0K
DQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1
YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5v
cmcK
