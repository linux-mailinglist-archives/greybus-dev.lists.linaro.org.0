Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F084AEC84
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Feb 2022 09:34:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8AB1F3EE83
	for <lists+greybus-dev@lfdr.de>; Wed,  9 Feb 2022 08:34:01 +0000 (UTC)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	by lists.linaro.org (Postfix) with ESMTPS id 644043EE0E
	for <greybus-dev@lists.linaro.org>; Wed,  9 Feb 2022 08:33:58 +0000 (UTC)
Date: Wed, 9 Feb 2022 09:33:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1644395637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEegwyHh3AOCLz3cTCj8v6K1zDxKD4yBWV+8sL6bFrc=;
	b=u/Mob7w/VimevoQAad7DDk4SKgNX8XCDpPf69TQ2lWT3az8CLyezqtq4ny/TGXZbqanHGI
	VSEC0Jylcd1DFjKAdrhsAtpxuL73f6zCyMioxlYTkQKCBjfoaHZMZUQ251GatAZcK84MJi
	gwIsFGHot8iYqtULewHoa3+ljzeaZMp7Ljc5FJTWH26EYcb/b3f0ZJDVTYIKifgw6q8Vfb
	FQrjdsTmmtHMT3fWNnbuMuWfB4CTh6SB+55DwAaqXDYsPJ7WR6DzozP21kZShNZW2IUkkx
	XqGXK93zv4S9IZiQ9NvbTRZB7LGTnDGfEUMCEuAptS8ZgXpPYXtY+rExB6RCOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1644395637;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cEegwyHh3AOCLz3cTCj8v6K1zDxKD4yBWV+8sL6bFrc=;
	b=Qh++AmLLRNISAd6f1OEam+WBPL+y4VbfbjTC/YRzjJnVL0kOm0B+pA4QgdRkow7WJ+1bMq
	pOIppG4y96osryDw==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Wolfram Sang <wsa@kernel.org>, greybus-dev@lists.linaro.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-usb@vger.kernel.org,
	netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
	Alex Elder <elder@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>,
	Lee Jones <lee.jones@linaro.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>, UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Oleksandr Natalenko <oleksandr@natalenko.name>
Message-ID: <YgN8cx/t1JvATvxh@linutronix.de>
References: <20220131123404.175438-1-bigeasy@linutronix.de>
 <20220131123404.175438-2-bigeasy@linutronix.de>
 <YgArWgyvy9xF3V5Q@kunai>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YgArWgyvy9xF3V5Q@kunai>
Message-ID-Hash: L2L3PQVEXUSV5QP2WCU7H2JOSWRBGNQO
X-Message-ID-Hash: L2L3PQVEXUSV5QP2WCU7H2JOSWRBGNQO
X-MailFrom: bigeasy@linutronix.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/7] genirq: Provide generic_handle_irq_safe().
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L2L3PQVEXUSV5QP2WCU7H2JOSWRBGNQO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

UHJvdmlkZSBnZW5lcmljX2hhbmRsZV9pcnFfc2FmZSgpIHdoaWNoIGNhbiB1c2VkIGZyb20gYW55
IGNvbnRleHQuDQoNClN1Z2dlc3RlZC1ieTogVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+DQpTaWduZWQtb2ZmLWJ5OiBTZWJhc3RpYW4gQW5kcnplaiBTaWV3aW9yIDxiaWdlYXN5
QGxpbnV0cm9uaXguZGU+DQpSZXZpZXdlZC1ieTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4NClJldmlld2VkLWJ5OiBPbGVrc2FuZHIgTmF0YWxlbmtvIDxvbGVrc2FuZHJAbmF0
YWxlbmtvLm5hbWU+DQpSZXZpZXdlZC1ieTogV29sZnJhbSBTYW5nIDx3c2ErcmVuZXNhc0BzYW5n
LWVuZ2luZWVyaW5nLmNvbT4NCi0tLQ0KDQp2MuKApnYzOiBDb3JyZWN0IGtlcm5lbCBkb2MgZm9y
IGdlbmVyaWNfaGFuZGxlX2lycV9zYWZlKCkgYXMgcGVyIFdvbGZyYW0NCiAgICAgICBTYW5nLg0K
DQogaW5jbHVkZS9saW51eC9pcnFkZXNjLmggfCAgMSArDQoga2VybmVsL2lycS9pcnFkZXNjLmMg
ICAgfCAyMyArKysrKysrKysrKysrKysrKysrKysrKw0KIDIgZmlsZXMgY2hhbmdlZCwgMjQgaW5z
ZXJ0aW9ucygrKQ0KDQpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9pcnFkZXNjLmggYi9pbmNs
dWRlL2xpbnV4L2lycWRlc2MuaA0KaW5kZXggOTNkMjcwY2EwYzU2Ny4uYTc3NTg0NTkzZjdkMSAx
MDA2NDQNCi0tLSBhL2luY2x1ZGUvbGludXgvaXJxZGVzYy5oDQorKysgYi9pbmNsdWRlL2xpbnV4
L2lycWRlc2MuaA0KQEAgLTE2MCw2ICsxNjAsNyBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZ2VuZXJp
Y19oYW5kbGVfaXJxX2Rlc2Moc3RydWN0IGlycV9kZXNjICpkZXNjKQ0KIA0KIGludCBoYW5kbGVf
aXJxX2Rlc2Moc3RydWN0IGlycV9kZXNjICpkZXNjKTsNCiBpbnQgZ2VuZXJpY19oYW5kbGVfaXJx
KHVuc2lnbmVkIGludCBpcnEpOw0KK2ludCBnZW5lcmljX2hhbmRsZV9pcnFfc2FmZSh1bnNpZ25l
ZCBpbnQgaXJxKTsNCiANCiAjaWZkZWYgQ09ORklHX0lSUV9ET01BSU4NCiAvKg0KZGlmZiAtLWdp
dCBhL2tlcm5lbC9pcnEvaXJxZGVzYy5jIGIva2VybmVsL2lycS9pcnFkZXNjLmMNCmluZGV4IDIy
NjdlNjUyN2RiM2MuLjM0NmQyODNkMmRhMTQgMTAwNjQ0DQotLS0gYS9rZXJuZWwvaXJxL2lycWRl
c2MuYw0KKysrIGIva2VybmVsL2lycS9pcnFkZXNjLmMNCkBAIC02NjIsNiArNjYyLDI5IEBAIGlu
dCBnZW5lcmljX2hhbmRsZV9pcnEodW5zaWduZWQgaW50IGlycSkNCiB9DQogRVhQT1JUX1NZTUJP
TF9HUEwoZ2VuZXJpY19oYW5kbGVfaXJxKTsNCiANCisvKioNCisgKiBnZW5lcmljX2hhbmRsZV9p
cnFfc2FmZSAtIEludm9rZSB0aGUgaGFuZGxlciBmb3IgYSBwYXJ0aWN1bGFyIGlycSBmcm9tIGFu
eQ0KKyAqCQkJICAgICBjb250ZXh0Lg0KKyAqIEBpcnE6CVRoZSBpcnEgbnVtYmVyIHRvIGhhbmRs
ZQ0KKyAqDQorICogUmV0dXJuczoJMCBvbiBzdWNjZXNzLCBhIG5lZ2F0aXZlIHZhbHVlIG9uIGVy
cm9yLg0KKyAqDQorICogVGhpcyBmdW5jdGlvbiBjYW4gYmUgY2FsbGVkIGZyb20gYW55IGNvbnRl
eHQgKElSUSBvciBwcm9jZXNzIGNvbnRleHQpLiBJdA0KKyAqIHdpbGwgcmVwb3J0IGFuIGVycm9y
IGlmIG5vdCBpbnZva2VkIGZyb20gSVJRIGNvbnRleHQgYW5kIHRoZSBpcnEgaGFzIGJlZW4NCisg
KiBtYXJrZWQgdG8gZW5mb3JjZSBJUlEtY29udGV4dCBvbmx5Lg0KKyAqLw0KK2ludCBnZW5lcmlj
X2hhbmRsZV9pcnFfc2FmZSh1bnNpZ25lZCBpbnQgaXJxKQ0KK3sNCisJdW5zaWduZWQgbG9uZyBm
bGFnczsNCisJaW50IHJldDsNCisNCisJbG9jYWxfaXJxX3NhdmUoZmxhZ3MpOw0KKwlyZXQgPSBo
YW5kbGVfaXJxX2Rlc2MoaXJxX3RvX2Rlc2MoaXJxKSk7DQorCWxvY2FsX2lycV9yZXN0b3JlKGZs
YWdzKTsNCisJcmV0dXJuIHJldDsNCit9DQorRVhQT1JUX1NZTUJPTF9HUEwoZ2VuZXJpY19oYW5k
bGVfaXJxX3NhZmUpOw0KKw0KICNpZmRlZiBDT05GSUdfSVJRX0RPTUFJTg0KIC8qKg0KICAqIGdl
bmVyaWNfaGFuZGxlX2RvbWFpbl9pcnEgLSBJbnZva2UgdGhlIGhhbmRsZXIgZm9yIGEgSFcgaXJx
IGJlbG9uZ2luZw0KLS0gDQoyLjM0LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVz
LWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
