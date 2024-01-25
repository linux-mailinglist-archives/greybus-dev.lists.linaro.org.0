Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8952183BF26
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 11:42:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 77698400DA
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jan 2024 10:42:42 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	by lists.linaro.org (Postfix) with ESMTPS id D6A3B3F3AC
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jan 2024 10:42:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b="Z+WC6q/p";
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of lee@kernel.org designates 145.40.73.55 as permitted sender) smtp.mailfrom=lee@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0CA92CE3348;
	Thu, 25 Jan 2024 10:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25A8EC433C7;
	Thu, 25 Jan 2024 10:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706179353;
	bh=1/AQZg5NNw9HG13KiYI6HfNvwqZ4xcS6GaNad1Jmb/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z+WC6q/pwbwzH6zhMdWS153JB6VUWqmZcSDN5fViUQMl+zNnFkr+L5iCIZC4Lmv2j
	 bS4xt+Jc+fIKPiuc/kJRIJ6TAeALxfXs7+VoI8ancJ7e9QSMZf9u8wlf8juOT449Gm
	 dGuxdVykXP+YbuK9da+3YP4AGDYrHkdmnPt65LdsuIx8gGLD4hTB/s1rjqbkVCKiUD
	 oli8l8eXT1ku4I2e/jROQgRMNh1cOo8JM8FSB0c1qy9mR6qP4bCyS6fEZ4sW83WE4H
	 dvME2O/MBNNvzFmFBAQf8Pqk3H35BFWj4WMW1H3tXE6hY7SpsHA0xe4mZ94kyccwIt
	 HEVRnGIIo3ahQ==
Date: Thu, 25 Jan 2024 10:42:23 +0000
From: Lee Jones <lee@kernel.org>
To: Francesco Dolcini <francesco@dolcini.it>
Message-ID: <20240125104223.GD74950@google.com>
References: <20240122180551.34429-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D6A3B3F3AC
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:145.40.73.55];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:145.40.73.0/24, country:US];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	ARC_NA(0.00)[];
	URIBL_BLOCKED(0.00)[sin.source.kernel.org:helo,sin.source.kernel.org:rdns,toradex.com:email];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org,huawei.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: MHEFOYVTMZDHMFJUM3QNLASAQ3M7HQUK
X-Message-ID-Hash: MHEFOYVTMZDHMFJUM3QNLASAQ3M7HQUK
X-MailFrom: lee@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Rob Herring <robh@kernel.org>, Jonathan 
 Cameron <Jonathan.Cameron@huawei.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MHEFOYVTMZDHMFJUM3QNLASAQ3M7HQUK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCAyMiBKYW4gMjAyNCwgRnJhbmNlc2NvIERvbGNpbmkgd3JvdGU6DQoNCj4gRnJvbTog
RnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29tPg0KPiANCj4g
cmVjZWl2ZV9idWYoKSBpcyBjYWxsZWQgZnJvbSB0dHlwb3J0X3JlY2VpdmVfYnVmKCkgdGhhdCBl
eHBlY3RzIHZhbHVlcw0KPiAiPj0gMCIgZnJvbSBzZXJkZXZfY29udHJvbGxlcl9yZWNlaXZlX2J1
ZigpLCBjaGFuZ2UgaXRzIHJldHVybiB0eXBlIGZyb20NCj4gc3NpemVfdCB0byBzaXplX3QuDQo+
IA0KPiBUaGUgbmVlZCBmb3IgdGhpcyBjbGVhbi11cCB3YXMgbm90aWNlZCB3aGlsZSBmaXhpbmcg
YSB3YXJuaW5nLCBzZWUNCj4gY29tbWl0IDk0ZDA1Mzk0MjU0NCAoIkJsdWV0b290aDogYnRueHB1
YXJ0OiBmaXggcmVjdl9idWYoKSByZXR1cm4gdmFsdWUiKS4NCj4gQ2hhbmdpbmcgdGhlIGNhbGxi
YWNrIHByb3RvdHlwZSB0byByZXR1cm4gYW4gdW5zaWduZWQgc2VlbXMgdGhlIGJlc3Qgd2F5DQo+
IHRvIGRvY3VtZW50IHRoZSBBUEkgYW5kIGVuc3VyZSB0aGF0IGlzIHByb3Blcmx5IHVzZWQuDQo+
IA0KPiBHTlNTIGRyaXZlcnMgaW1wbGVtZW50YXRpb24gb2Ygc2VyZGV2IHJlY2VpdmVfYnVmKCkg
Y2FsbGJhY2sgcmV0dXJuDQo+IGRpcmVjdGx5IHRoZSByZXR1cm4gdmFsdWUgb2YgZ25zc19pbnNl
cnRfcmF3KCkuIGduc3NfaW5zZXJ0X3JhdygpDQo+IHJldHVybnMgYSBzaWduZWQgaW50LCBob3dl
dmVyIHRoaXMgaXMgbm90IGFuIGlzc3VlIHNpbmNlIHRoZSB2YWx1ZQ0KPiByZXR1cm5lZCBpcyBh
bHdheXMgcG9zaXRpdmUsIGJlY2F1c2Ugb2YgdGhlIGtmaWZvX2luKCkgaW1wbGVtZW50YXRpb24u
DQo+IGduc3NfaW5zZXJ0X3JhdygpIGNvdWxkIGJlIGNoYW5nZWQgdG8gcmV0dXJuIGFsc28gYW4g
dW5zaWduZWQsIGhvd2V2ZXINCj4gdGhpcyBpcyBub3QgaW1wbGVtZW50ZWQgaGVyZSBhcyByZXF1
ZXN0IGJ5IHRoZSBHTlNTIG1haW50YWluZXIgSm9oYW4NCj4gSG92b2xkLg0KPiANCj4gU3VnZ2Vz
dGVkLWJ5OiBKaXJpIFNsYWJ5IDxqaXJpc2xhYnlAa2VybmVsLm9yZz4NCj4gTGluazogaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzA4N2JlNDE5LWVjNmItNDdhZC04NTFhLTVlMWUzZWE1Y2Zj
Y0BrZXJuZWwub3JnLw0KPiBTaWduZWQtb2ZmLWJ5OiBGcmFuY2VzY28gRG9sY2luaSA8ZnJhbmNl
c2NvLmRvbGNpbmlAdG9yYWRleC5jb20+DQo+IEFja2VkLWJ5OiBKb25hdGhhbiBDYW1lcm9uIDxK
b25hdGhhbi5DYW1lcm9uQGh1YXdlaS5jb20+ICNmb3ItaWlvDQo+IC0tLQ0KPiB2MToNCj4gIC0g
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjMxMjE0MTcwMTQ2LjY0MTc4My0xLWZyYW5j
ZXNjb0Bkb2xjaW5pLml0Lw0KPiB2MjoNCj4gIC0gcmViYXNlZCBvbiA2LjgtcmMxDQo+ICAtIGFk
ZCBhY2tlZC1ieSBKb25hdGhhbg0KPiAgLSBkbyBub3QgY2hhbmdlIGduc3NfaW5zZXJ0X3Jhdygp
DQo+ICAtIGRvIG5vdCBjaGFuZ2UgdGhlIGNvZGUgc3R5bGUgb2YgdGhlIGduc3MgY29kZQ0KPiAg
LSBjb21taXQgbWVzc2FnZSBpbXByb3ZlbWVudHMsIGV4cGxhaW4gdGhlIHJlYXNvbnMgZm9yIGRv
aW5nIG9ubHkgbWluaW1hbA0KPiAgICBjaGFuZ2VzIG9uIHRoZSBHTlNTIHBhcnQNCj4gLS0tDQo+
ICBkcml2ZXJzL2JsdWV0b290aC9idG10a3VhcnQuYyAgICAgICAgICAgICAgfCAgNCArKy0tDQo+
ICBkcml2ZXJzL2JsdWV0b290aC9idG54cHVhcnQuYyAgICAgICAgICAgICAgfCAgNCArKy0tDQo+
ICBkcml2ZXJzL2JsdWV0b290aC9oY2lfc2VyZGV2LmMgICAgICAgICAgICAgfCAgNCArKy0tDQo+
ICBkcml2ZXJzL2duc3Mvc2VyaWFsLmMgICAgICAgICAgICAgICAgICAgICAgfCAgMiArLQ0KPiAg
ZHJpdmVycy9nbnNzL3NpcmYuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gIGRy
aXZlcnMvZ3JleWJ1cy9nYi1iZWFnbGVwbGF5LmMgICAgICAgICAgICB8ICA2ICsrKy0tLQ0KPiAg
ZHJpdmVycy9paW8vY2hlbWljYWwvcG1zNzAwMy5jICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAg
ZHJpdmVycy9paW8vY2hlbWljYWwvc2NkMzBfc2VyaWFsLmMgICAgICAgIHwgIDQgKystLQ0KPiAg
ZHJpdmVycy9paW8vY2hlbWljYWwvc3BzMzBfc2VyaWFsLmMgICAgICAgIHwgIDQgKystLQ0KPiAg
ZHJpdmVycy9paW8vaW11L2JubzA1NS9ibm8wNTVfc2VyX2NvcmUuYyAgIHwgIDQgKystLQ0KDQo+
ICBkcml2ZXJzL21mZC9yYXZlLXNwLmMgICAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQoN
CkFja2VkLWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPg0KDQo+ICBkcml2ZXJzL25ldC9l
dGhlcm5ldC9xdWFsY29tbS9xY2FfdWFydC5jICAgfCAgMiArLQ0KPiAgZHJpdmVycy9uZmMvcG41
MzMvdWFydC5jICAgICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9uZmMvczNm
d3JuNS91YXJ0LmMgICAgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9wbGF0Zm9y
bS9jaHJvbWUvY3Jvc19lY191YXJ0LmMgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9wbGF0Zm9y
bS9zdXJmYWNlL2FnZ3JlZ2F0b3IvY29yZS5jIHwgIDQgKystLQ0KPiAgZHJpdmVycy90dHkvc2Vy
ZGV2L3NlcmRldi10dHlwb3J0LmMgICAgICAgIHwgMTAgKysrKy0tLS0tLQ0KPiAgaW5jbHVkZS9s
aW51eC9zZXJkZXYuaCAgICAgICAgICAgICAgICAgICAgIHwgIDggKysrKy0tLS0NCj4gIHNvdW5k
L2RyaXZlcnMvc2VyaWFsLWdlbmVyaWMuYyAgICAgICAgICAgICB8ICA0ICsrLS0NCj4gIDE5IGZp
bGVzIGNoYW5nZWQsIDQwIGluc2VydGlvbnMoKyksIDQyIGRlbGV0aW9ucygtKQ0KDQotLSANCkxl
ZSBKb25lcyBb5p2O55C85pavXQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1s
ZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
