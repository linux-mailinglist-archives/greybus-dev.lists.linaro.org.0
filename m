Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBF4B2C78
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 19:15:21 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 50CF43EEA5
	for <lists+greybus-dev@lfdr.de>; Fri, 11 Feb 2022 18:15:20 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 9F8FB3EEA3
	for <greybus-dev@lists.linaro.org>; Fri, 11 Feb 2022 18:15:15 +0000 (UTC)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644603314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Jch/i8uwHhLcWwzAXjXbpVM1d+fcbfplWSgVCHBbLA=;
	b=4D/q+XgJSZYSQlhj03Sz02vFzH0GlhuNwlthKN6riQhMDD5++CNjRWRcUMnZgTF6IBP3g+
	oVovZg1UiRbqNOfXL0Ug7sEEW4I3gnhSbXiXYVhaBj8SJYSe2JWU3L8TKTnBfBv8NavXia
	PyE9hT1yki7U6ColR/pFgse4NAZ/XUCOOMQ9vWvtJ3Wf6CwrwuYA8smeI/TJiIi1F/bnNA
	ICPcSYmM6pbexOSlIEOuzn25pRO4Bxmw6wAdc3bITdm6KueiS+ZXZavgXe1fqxcpMkZDPn
	q8/SFFbpIkYrb4pOWN4iyRS8zM59QXHJ0V6VD/B2dZShpq1NX8pyPrf8htxzpQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644603314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2Jch/i8uwHhLcWwzAXjXbpVM1d+fcbfplWSgVCHBbLA=;
	b=KXgaU3Wb016ElAJR2Uy5MlhgU1MfzTrdx0FxVToYcGImm6/t7L7V1ELxpOGiJMCXbJpX1K
	HuuVJ5o6ZABaOlBA==
To: greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-usb@vger.kernel.org,
	netdev@vger.kernel.org
Date: Fri, 11 Feb 2022 19:14:53 +0100
Message-Id: <20220211181500.1856198-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Message-ID-Hash: EHABSDPNWXX7NHILNBTM3UHVAB4KZD6W
X-Message-ID-Hash: EHABSDPNWXX7NHILNBTM3UHVAB4KZD6W
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: "David S. Miller" <davem@davemloft.net>, Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Hans de Goede <hdegoede@redhat.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, Lee Jones <lee.jones@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com, Wolfram Sang <wsa@kernel.org>, Woojung Huh <woojung.huh@microchip.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4 0/7] Provide and use generic_handle_irq_safe() where appropriate.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EHABSDPNWXX7NHILNBTM3UHVAB4KZD6W/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

aGFuZGxlci8gaW50ZXJydXB0IGNvbnRyb2xsZXIgZW50cnkpLiBJdCBpcyBsb3cgbGV2ZWwgY29k
ZSBhbmQgdGhlDQpmdW5jdGlvbiBleHBlY3RzIHRoYXQgaW50ZXJydXB0cyBhcmUgZGlzYWJsZWQg
YXQgZW50cnkgcG9pbnQuDQoNClRoaXMgaXNuJ3QgdGhlIGNhc2UgZm9yIGludm9jYXRpb25zIGZy
b20gdGFza2xldHMsIHdvcmtxdWV1ZXMgb3IgdGhlDQpwcmltYXJ5IGludGVycnVwdCBoYW5kbGVy
IG9uIFBSRUVNUFRfUlQuIE9uY2UgdGhpcyBnZXRzIG5vdGljZWQgYQ0KImxvY2FsX2lycV9kaXNh
YmxlfHNhZmUoKSIgaXMgYWRkZWQuIFRvIGF2b2lkIGZ1cnRoZXIgY29uZnVzaW9uIHRoaXMNCnNl
cmllcyBhZGRzIGdlbmVyaWNfaGFuZGxlX2lycV9zYWZlKCkgd2hpY2ggY2FuIGJlIHVzZWQgZnJv
bSBhbnkgY29udGV4dA0KYW5kIGFkZHMgYSBmZXcgdXNlci4NCg0KdjLigKZ2NDoNCiAgLSBDb3Jy
ZWN0IGtlcm5lbCBkb2MgZm9yIGdlbmVyaWNfaGFuZGxlX2lycV9zYWZlKCkgYXMgcGVyIFdvbGZy
YW0gU2FuZy4NCiAgLSBVc2UgIm1pc2MiIGluc3RlYWQgb2YgIm1mZCIgZm9yIHRoZSBoaTY0MjEt
c3BtaS1wbWljIGRyaXZlci4NCg0KdjLigKZ2MToNCiBodHRwczovL2xvcmUua2VybmVsLm9yZy9h
bGwvMjAyMjAxMzExMjM0MDQuMTc1NDM4LTEtYmlnZWFzeUBsaW51dHJvbml4LmRlLw0KIC0gUmVk
byBrZXJuZWwtZG9jIGZvciBnZW5lcmljX2hhbmRsZV9pcnFfc2FmZSgpIGluICMxLg0KIC0gVXNl
IGdlbmVyaWNfaGFuZGxlX2lycV9zYWZlKCkgaW5zdGVhZCBvZiBnZW5lcmljX2hhbmRsZV9pcnEo
KSBpbiB0aGUNCiAgIHBhdGNoIGRlc2NyaXB0aW9uIHdoZXJlIEkgYWNjaWRlbnRseSB1c2VkIHRo
ZSB3cm9uZyBvbmUuDQp2MToNCiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyMjAxMjcx
MTMzMDMuMzAxMjIwNy0xLWJpZ2Vhc3lAbGludXRyb25peC5kZS8NCg0KDQpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFu
IGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
