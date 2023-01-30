Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 434DF6813AE
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 15:46:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4A00B3EC03
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Jan 2023 14:46:04 +0000 (UTC)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	by lists.linaro.org (Postfix) with ESMTPS id 06211443FC
	for <greybus-dev@lists.linaro.org>; Mon, 30 Jan 2023 03:59:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=weissschuh.net header.s=mail header.b=rFOgO8ba;
	spf=pass (lists.linaro.org: domain of linux@weissschuh.net designates 159.69.126.157 as permitted sender) smtp.mailfrom=linux@weissschuh.net;
	dmarc=none
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=weissschuh.net;
	s=mail; t=1675051189;
	bh=mMjfLcnVZF0dexendGDLr6JYFK0dx6mt/NJcsDV8H4Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rFOgO8ba4msbhCZB2HpPHLLslEHAUK1mUaTQT0J/NsYvFRy6C7BKJNkmoKLPie0SR
	 DdwIFUbWqlT81h9iTTh75VTMNS8I9rnLBw0eFbMnUlZqqozdz+xnlI82nVR1ahIfnr
	 C4QZ6j7kBFLi8NW4eANXgRNE82H6WcFTYXOIj4UU=
Date: Mon, 30 Jan 2023 03:59:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20230130-hid-const-ll-driver-v1-7-3fc282b3b1d0@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1675051185; l=949;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mMjfLcnVZF0dexendGDLr6JYFK0dx6mt/NJcsDV8H4Y=;
 b=uIrnpEXHlY673uTfeecek1YDTL/FNinG4H9nwb5N5A214b/jy314g0O+eRlNKMjYCcm8AMlofqEh
 C9p/Wc9ZA6GBSkRH1dKgC4Z+xcBlnJQF8Qi93zJVT3Xo4H3bPXDm
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 06211443FC
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
Message-ID-Hash: N6MNEJ5PMYBTKGN2ZWBOAJGT2P4DDNHO
X-Message-ID-Hash: N6MNEJ5PMYBTKGN2ZWBOAJGT2P4DDNHO
X-Mailman-Approved-At: Mon, 30 Jan 2023 14:45:27 +0000
CC: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hyperv@vger.kernel.org, platform-driver-x86@vger.kernel.org, acpi4asus-user@lists.sourceforge.net, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 7/9] platform/x86: asus-tf103c-dock: Constify lowlevel HID driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N6MNEJ5PMYBTKGN2ZWBOAJGT2P4DDNHO/>
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
PGxpbnV4QHdlaXNzc2NodWgubmV0Pg0KLS0tDQogZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy10
ZjEwM2MtZG9jay5jIHwgMiArLQ0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBk
ZWxldGlvbigtKQ0KDQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy10ZjEw
M2MtZG9jay5jIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1cy10ZjEwM2MtZG9jay5jDQppbmRl
eCA2MjMxMGUwNjI4MmIuLjg0YzQ1ZThmNTFhZCAxMDA2NDQNCi0tLSBhL2RyaXZlcnMvcGxhdGZv
cm0veDg2L2FzdXMtdGYxMDNjLWRvY2suYw0KKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvYXN1
cy10ZjEwM2MtZG9jay5jDQpAQCAtMjUwLDcgKzI1MCw3IEBAIHN0YXRpYyBpbnQgdGYxMDNjX2Rv
Y2tfaGlkX3Jhd19yZXF1ZXN0KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIHU4IHJlcG9ydG51bSwN
CiAJcmV0dXJuIDA7DQogfQ0KIA0KLXN0YXRpYyBzdHJ1Y3QgaGlkX2xsX2RyaXZlciB0ZjEwM2Nf
ZG9ja19oaWRfbGxfZHJpdmVyID0gew0KK3N0YXRpYyBjb25zdCBzdHJ1Y3QgaGlkX2xsX2RyaXZl
ciB0ZjEwM2NfZG9ja19oaWRfbGxfZHJpdmVyID0gew0KIAkucGFyc2UgPSB0ZjEwM2NfZG9ja19o
aWRfcGFyc2UsDQogCS5zdGFydCA9IHRmMTAzY19kb2NrX2hpZF9zdGFydCwNCiAJLnN0b3AgPSB0
ZjEwM2NfZG9ja19oaWRfc3RvcCwNCg0KLS0gDQoyLjM5LjENCg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0t
IGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFp
bCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
