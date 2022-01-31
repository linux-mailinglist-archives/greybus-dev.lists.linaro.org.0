Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 475C54A4732
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 13:34:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7DE1B3EE2F
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jan 2022 12:34:32 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 29DC43ED9F
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jan 2022 12:34:29 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1643632468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dBEcvYbqh//2SnFN4JWRklzkIk5olbEekSf6NVi12CY=;
	b=yNZw9EXdb1mDwgxZOVAqVOHqbkDbwhiToYVizl0NUvcbg02zHcXDZFlrsEYqZbiqir84YN
	fo7so0sY/5unvwFx2o5YLNwgNctM6VnaPMeDuGlWpK9/z1SZnKBke+HRXZ1k2JqjgxcDBX
	w1qQ4WthhO3RuhmD6ENYU5Rh04gyVDDQMn7p+bWxrAhWEs2wgGfsDBe+Ts+oDiFbB38GSi
	EYO5tE6N5z5KM9qRdvmlgprX6i0vaOiTN1okppQLcnWO1vLwyAlnSvqqJ2mOtCUWJ4ZIIx
	zUHSmieBmCo/2NHEa6eTi6qpR8/NSDEnSau0yvPh+WR/aeMpzF1mnMRaYfSP4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1643632468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dBEcvYbqh//2SnFN4JWRklzkIk5olbEekSf6NVi12CY=;
	b=ke3JpB/kI9Ysv7q2qZM4iV96Dcn8lW3H1+UnjRbVekC1PwvCwqvPwSUA4TNEDdiaWZJXep
	5hoRRl/crBvrm7Dw==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Mon, 31 Jan 2022 13:33:57 +0100
Message-Id: <20220131123404.175438-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: EK5QV7WFV57CHOT52KG4XYBNIFX34YQJ
X-Message-ID-Hash: EK5QV7WFV57CHOT52KG4XYBNIFX34YQJ
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EK5QV7WFV57CHOT52KG4XYBNIFX34YQJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

Z2VuZXJpY19oYW5kbGVfaXJxKCkgbXVzdCBiZSB1c2VkIGZyb20gcHJpbWFyeSBJUlEtaGFuZGxl
ciAoY2hhaW4NCmhhbmRsZXIvIGludGVycnVwdCBjb250cm9sbGVyIGVudHJ5KS4gSXQgaXMgbG93
IGxldmVsIGNvZGUgYW5kIHRoZQ0KZnVuY3Rpb24gZXhwZWN0cyB0aGF0IGludGVycnVwdHMgYXJl
IGRpc2FibGVkIGF0IGVudHJ5IHBvaW50Lg0KDQpUaGlzIGlzbid0IHRoZSBjYXNlIGZvciBpbnZv
Y2F0aW9ucyBmcm9tIHRhc2tsZXRzLCB3b3JrcXVldWVzIG9yIHRoZQ0KcHJpbWFyeSBpbnRlcnJ1
cHQgaGFuZGxlciBvbiBQUkVFTVBUX1JULiBPbmNlIHRoaXMgZ2V0cyBub3RpY2VkIGENCiJsb2Nh
bF9pcnFfZGlzYWJsZXxzYWZlKCkiIGlzIGFkZGVkLiBUbyBhdm9pZCBmdXJ0aGVyIGNvbmZ1c2lv
biB0aGlzDQpzZXJpZXMgYWRkcyBnZW5lcmljX2hhbmRsZV9pcnFfc2FmZSgpIHdoaWNoIGNhbiBi
ZSB1c2VkIGZyb20gYW55IGNvbnRleHQNCmFuZCBhZGRzIGEgZmV3IHVzZXIuDQoNCnYy4oCmdjE6
DQogLSBSZWRvIGtlcm5lbC1kb2MgZm9yIGdlbmVyaWNfaGFuZGxlX2lycV9zYWZlKCkgaW4gIzEu
DQogLSBVc2UgZ2VuZXJpY19oYW5kbGVfaXJxX3NhZmUoKSBpbnN0ZWFkIG9mIGdlbmVyaWNfaGFu
ZGxlX2lycSgpIGluIHRoZQ0KICAgcGF0Y2ggZGVzY3JpcHRpb24gd2hlcmUgSSBhY2NpZGVudGx5
IHVzZWQgdGhlIHdyb25nIG9uZS4NCg0KdjE6DQogICBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMjAxMjcxMTMzMDMuMzAxMjIwNy0xLWJpZ2Vhc3lAbGludXRyb25peC5kZS8NCg0KU2Vi
YXN0aWFuDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpU
byB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxp
bmFyby5vcmcK
