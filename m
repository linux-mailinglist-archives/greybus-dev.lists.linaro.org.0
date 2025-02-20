Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 52706A3D811
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Feb 2025 12:16:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 02CBE44A26
	for <lists+greybus-dev@lfdr.de>; Thu, 20 Feb 2025 11:16:18 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id DD3843F4DA
	for <greybus-dev@lists.linaro.org>; Thu, 20 Feb 2025 11:16:13 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=b12PjNii;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of jirislaby@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=jirislaby@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E8BD5C5E4D;
	Thu, 20 Feb 2025 11:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A03C7C4CED1;
	Thu, 20 Feb 2025 11:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740050173;
	bh=Iqri3H4l7MINuskI1RcHgMhBsNlYFaxp53yd+z2TvQE=;
	h=From:To:Cc:Subject:Date:From;
	b=b12PjNiiGqku601OHJrDa/9YCDx0fJyQ7Bdp/ajH184yil9nFzdUdcDe5/ZyRh5m4
	 gLzO1tSw8M34I0X9YAkX4dhc1vCz1nrdAgNhIe1DfvgV6tMcBNDCCvRobcS7IJ8oCf
	 xPSDPzpE9ULLVTIqAFS3ItO8Dl3mn37LJ661h4LPDOBbJgCuS3qjUGJkbV3+SlCQXc
	 Wn5OMkQryz1tLQUJHbJuI72OkPI2qc58tTceZiTUlwAAboJsgJAMlz2p7QHI8ZlV/Z
	 sHQIak/D/jc2CZZWmMl5XCwrQ7mzhT3fKX5LFSRzky0lfYQAPQsieBjjPLv0FP4X7x
	 gqLF2shVX1i9g==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: gregkh@linuxfoundation.org
Date: Thu, 20 Feb 2025 12:15:37 +0100
Message-ID: <20250220111606.138045-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DD3843F4DA
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[139.178.84.217:from];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[netdev];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,lunn.ch,linux.intel.com,gmail.com,davemloft.net,google.com,lists.linaro.org,lists.linux.dev,redhat.com,linaro.org];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
X-Rspamd-Action: no action
Message-ID-Hash: UN5EZFGGYAJWTVZTYUVXLRGP4CJGCA2K
X-Message-ID-Hash: UN5EZFGGYAJWTVZTYUVXLRGP4CJGCA2K
X-MailFrom: jirislaby@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, "Jiri Slaby (SUSE)" <jirislaby@kernel.org>, Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, David Lin <dtwlin@gmail.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, greybus-dev@lists.linaro.org, =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Jakub Kicinski <kuba@kernel.org>, Johan Hovold <johan@kernel.org>, linux-alpha@vger.kernel.org, linux-staging@lists.linux.dev, Matt Turner <mattst88@gmail.com>, netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Rob Herring <robh@kernel.org>, sparclinux@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 00/29] tty: cleanup no. 99
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UN5EZFGGYAJWTVZTYUVXLRGP4CJGCA2K/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGksDQoNCnRoaXMgaXMgKGFnYWluKSBhIHNlcmllcyBvZiBjbGVhbnVwIGluIHR0eS4gSSBhbSB0
cnlpbmcgdG8gcmV3b3JrDQp0dHkrc2VyaWFsIHRvIGF2b2lkIGxpbWl0YXRpb25zIG9mIGRldmlj
ZXMgKHNvIGNhbGxlZCBOUl9VQVJUIG9yDQp0dHlfYWxsb2NfZHJpdmVyKCkncyBmaXJzdCBwYXJh
bWV0ZXIpLiBBbmQgdGhlIGJlbG93IHBvcHBlZCB1cCB3aGlsZQ0KY3Jhd2xpbmcgdGhyb3VnaCB0
aGUgY29kZS4gU28gdGhpcyBpcyBvbmx5IGEgcHJlcCBjbGVhbnVwLg0KDQoqIG1hbnkgdHR5IGZs
YWdzIGFyZSBub3cgZW51bXMNCiogbWFueSBmdW5jdGlvbnMgd2VyZSBpbXByb3ZlZCBmb3IgcmVh
ZGFiaWxpdHkNCiogcXVpdGUgYSBmZXcgdW51c2VkIG9yIG9sZCBjb2RlIGRyb3BwZWQNCg0KSW4g
cGFydGljdWxhciwgdGhlIHJ1bnRpbWUgYmVoYXZpb3VyIG9mIHRoZSBrZXJuZWwgYmVmb3JlIGFu
ZCBhZnRlciB0aGUNCmNoYW5nZXMgaXMgc3VwcG9zZWQgdG8gYmUgYnVnIHRvIGJ1ZyBjb21wYXRp
YmxlIChleGNlcHQgbW94YSdzIGlvY3RsDQphbmQgSVNBIGV2aWxzIGRyb3BwZWQpLiBUaGF0IGlz
LCBub29uZSBzaG91bGQgbm90aWNlLg0KDQpDYzogQWxleCBFbGRlciA8ZWxkZXJAa2VybmVsLm9y
Zz4NCkNjOiBBbmRyZXcgTHVubiA8YW5kcmV3K25ldGRldkBsdW5uLmNoPg0KQ2M6IEFuZHkgU2hl
dmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPg0KQ2M6IERhdmlkIExp
biA8ZHR3bGluQGdtYWlsLmNvbT4NCkNjOiAiRGF2aWQgUy4gTWlsbGVyIiA8ZGF2ZW1AZGF2ZW1s
b2Z0Lm5ldD4NCkNjOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+DQpDYzogZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZw0KQ2M6ICJJbHBvIErDpHJ2aW5lbiIgPGlscG8uamFy
dmluZW5AbGludXguaW50ZWwuY29tPg0KQ2M6IEpha3ViIEtpY2luc2tpIDxrdWJhQGtlcm5lbC5v
cmc+DQpDYzogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPg0KQ2M6IGxpbnV4LWFscGhh
QHZnZXIua2VybmVsLm9yZw0KQ2M6IGxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2DQpDYzog
TWF0dCBUdXJuZXIgPG1hdHRzdDg4QGdtYWlsLmNvbT4NCkNjOiBuZXRkZXZAdmdlci5rZXJuZWwu
b3JnDQpDYzogUGFvbG8gQWJlbmkgPHBhYmVuaUByZWRoYXQuY29tPg0KQ2M6IFJpY2hhcmQgSGVu
ZGVyc29uIDxyaWNoYXJkLmhlbmRlcnNvbkBsaW5hcm8ub3JnPg0KQ2M6IFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+DQpDYzogc3BhcmNsaW51eEB2Z2VyLmtlcm5lbC5vcmcNCg0KSmlyaSBT
bGFieSAoU1VTRSkgKDI5KToNCiAgdHR5OiBjb252ZXJ0ICJUVFkgU3RydWN0IEZsYWdzIiB0byBh
biBlbnVtDQogIHR0eTogYXVkaXQ6IGRvIG5vdCB1c2UgTl9UVFlfQlVGX1NJWkUNCiAgdHR5OiBj
YWlmOiBkbyBub3QgdXNlIE5fVFRZX0JVRl9TSVpFDQogIHR0eTogbW92ZSBOX1RUWV9CVUZfU0la
RSB0byBuX3R0eQ0KICB0dHk6IG5fdHR5OiB1c2UgdWludCBmb3Igc3BhY2UgcmV0dXJuZWQgYnkg
dHR5X3dyaXRlX3Jvb20oKQ0KICB0dHk6IG5fdHR5OiBzaW1wbGlmeSBwcm9jZXNzX291dHB1dCgp
DQogIHR0eTogbl90dHk6IGNsZWFuIHVwIHByb2Nlc3Nfb3V0cHV0X2Jsb2NrKCkNCiAgdHR5OiBu
X3R0eTogZHJvcCBuX3R0eV90cmFjZSgpDQogIHR0eTogbl90dHk6IGV4dHJhY3Qgbl90dHlfY29u
dGludWVfY29va2llKCkgZnJvbSBuX3R0eV9yZWFkKCkNCiAgdHR5OiBuX3R0eTogZXh0cmFjdCBu
X3R0eV93YWl0X2Zvcl9pbnB1dCgpDQogIHR0eTogbl90dHk6IG1vdmUgbW9yZV90b19iZV9yZWFk
IHRvIHRoZSBlbmQgb2Ygbl90dHlfcmVhZCgpDQogIHR0eTogdHR5X2RyaXZlcjogbW92ZSBUVFkg
bWFjcm9zIHRvIHRoZSB0b3ANCiAgdHR5OiB0dHlfZHJpdmVyOiBjb252ZXJ0ICJUVFkgRHJpdmVy
IEZsYWdzIiB0byBhbiBlbnVtDQogIHR0eTogdHR5X2RyaXZlcjogZG9jdW1lbnQgYm90aCB7LF9f
fXR0eV9hbGxvY19kcml2ZXIoKSBwcm9wZXJseQ0KICB0dHk6IHR0eV9kcml2ZXI6IGludHJvZHVj
ZSBUVFkgZHJpdmVyIHN1Yi90eXBlcyBlbnVtcw0KICB0dHk6IHNlcmRldjogZHJvcCBzZXJkZXZf
Y29udHJvbGxlcl9vcHM6OndyaXRlX3Jvb20oKQ0KICB0dHk6IG1veGE6IGRyb3AgdmVyc2lvbiBk
dW1wIHRvIGxvZ3MNCiAgdHR5OiBtb3hhOiBkcm9wIElTQSBzdXBwb3J0DQogIHR0eTogbW94YTog
Y2FydmUgb3V0IHNwZWNpYWwgaW9jdGxzIGFuZCBleHRyYSB0dHlfcG9ydA0KICB0dHk6IHNybWNv
bnM6IGZpeCByZXR2YWwgZnJvbSBzcm1jb25zX2luaXQoKQ0KICB0dHk6IHN0YWdpbmcvZ3JleWJ1
czogcGFzcyB0dHlfZHJpdmVyIGZsYWdzIHRvIHR0eV9hbGxvY19kcml2ZXIoKQ0KICB0dHk6IHN1
bnN1OiBkcm9wIHNlcmlhbF97aW4sb3V0fXAoKQ0KICB0dHk6IHN1bnN1OiByZW1vdmUgdW51c2Vk
IHNlcmlhbF9pY3JfcmVhZCgpDQogIHNlcmlhbDogcmVtb3ZlIHJlZHVuZGFudCB0dHlfcG9ydF9s
aW5rX2RldmljZSgpDQogIHNlcmlhbDogcGFzcyBzdHJ1Y3QgdWFydF9zdGF0ZSB0byB1YXJ0X2xp
bmVfaW5mbygpDQogIHNlcmlhbDogODI1MDogdXNlIHNlcmlhbF9pbi9vdXQoKSBoZWxwZXJzDQog
IHNlcmlhbDogODI1MF9yc2E6IHNpbXBsaWZ5IHJzYTgyNTBfe3JlcXVlc3QvcmVsZWFzZX1fcmVz
b3VyY2UoKQ0KICBzZXJpYWw6IDgyNTBfcG9ydDogZG8gbm90IHVzZSBnb3RvIGZvciBVUFFfTk9f
VFhFTl9URVNUIGNvZGUgZmxvdw0KICBzZXJpYWw6IDgyNTBfcG9ydDogc2ltcGxpZnkgc2VyaWFs
ODI1MF9yZXF1ZXN0X3N0ZF9yZXNvdXJjZSgpDQoNCiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkv
dHR5L3R0eV9kcml2ZXIucnN0IHwgICA0ICstDQogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3R0
eS90dHlfc3RydWN0LnJzdCB8ICAgMiArLQ0KIGFyY2gvYWxwaGEva2VybmVsL3NybWNvbnMuYyAg
ICAgICAgICAgICAgICAgfCAgNjIgKystLS0NCiBkcml2ZXJzL25ldC9jYWlmL2NhaWZfc2VyaWFs
LmMgICAgICAgICAgICAgIHwgICAyICstDQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5j
ICAgICAgICAgICAgICB8ICAgNCArLQ0KIGRyaXZlcnMvdHR5L0tjb25maWcgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgIDIgKy0NCiBkcml2ZXJzL3R0eS9tb3hhLmMgICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgMjUxICstLS0tLS0tLS0tLS0tLS0tLS0tDQogZHJpdmVycy90dHkvbl90dHku
YyAgICAgICAgICAgICAgICAgICAgICAgICB8IDIxMiArKysrKysrKy0tLS0tLS0tLQ0KIGRyaXZl
cnMvdHR5L3NlcmRldi9jb3JlLmMgICAgICAgICAgICAgICAgICAgfCAgMTEgLQ0KIGRyaXZlcnMv
dHR5L3NlcmRldi9zZXJkZXYtdHR5cG9ydC5jICAgICAgICAgfCAgIDkgLQ0KIGRyaXZlcnMvdHR5
L3NlcmlhbC84MjUwLzgyNTBfZHcuYyAgICAgICAgICAgfCAgMTcgKy0NCiBkcml2ZXJzL3R0eS9z
ZXJpYWwvODI1MC84MjUwX2ZzbC5jICAgICAgICAgIHwgICA4ICstDQogZHJpdmVycy90dHkvc2Vy
aWFsLzgyNTAvODI1MF9vbWFwLmMgICAgICAgICB8ICAgMiArLQ0KIGRyaXZlcnMvdHR5L3Nlcmlh
bC84MjUwLzgyNTBfcG9ydC5jICAgICAgICAgfCAgNTkgKystLS0NCiBkcml2ZXJzL3R0eS9zZXJp
YWwvODI1MC84MjUwX3JzYS5jICAgICAgICAgIHwgIDIxICstDQogZHJpdmVycy90dHkvc2VyaWFs
L3NlcmlhbF9jb3JlLmMgICAgICAgICAgICB8ICAgNiArLQ0KIGRyaXZlcnMvdHR5L3NlcmlhbC9z
dW5zdS5jICAgICAgICAgICAgICAgICAgfCAxNzggKysrKysrLS0tLS0tLS0NCiBkcml2ZXJzL3R0
eS90dHlfYXVkaXQuYyAgICAgICAgICAgICAgICAgICAgIHwgIDEwICstDQogZHJpdmVycy90dHkv
dHR5X2lvLmMgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArLQ0KIGluY2x1ZGUvbGludXgv
c2VyZGV2LmggICAgICAgICAgICAgICAgICAgICAgfCAgIDYgLQ0KIGluY2x1ZGUvbGludXgvdHR5
LmggICAgICAgICAgICAgICAgICAgICAgICAgfCAgNTMgKysrLS0NCiBpbmNsdWRlL2xpbnV4L3R0
eV9kcml2ZXIuaCAgICAgICAgICAgICAgICAgIHwgMTgwICsrKysrKystLS0tLS0tDQogMjIgZmls
ZXMgY2hhbmdlZCwgNDEwIGluc2VydGlvbnMoKyksIDY5NyBkZWxldGlvbnMoLSkNCg0KLS0gDQoy
LjQ4LjENCg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
VG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5s
aW5hcm8ub3JnCg==
