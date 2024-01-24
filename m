Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C30C283B0E9
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 19:20:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B94AE43D3E
	for <lists+greybus-dev@lfdr.de>; Wed, 24 Jan 2024 18:20:26 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 2B63940B30
	for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 18:20:21 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=kernel.org header.s=k20201202 header.b=Br4mhTz3;
	dmarc=pass (policy=none) header.from=kernel.org;
	spf=pass (lists.linaro.org: domain of robh@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=robh@kernel.org
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C983D61EF4
	for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 18:20:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AACC2C4167D
	for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 18:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706120419;
	bh=8i7hW/P7gRwZbg6eJhfWSHuYfwNb6fjxwXNOYa+zX2M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Br4mhTz3ABsovsBh891iFtITCloETm7Xd3auyJ06H5OtOXYpmgIubWlxfBF2VAGmf
	 OlGgldHJriEwX+TyBKeNai970ecogEG/P+gUzZX4GkxGns9Tk6eEXHb1JVxvu6/qbt
	 skPzgvzkoqvZSI3fIk0qzZS1oVVsfORv8XNRdsm4o8jNjgkmRgXjCqeQuzGAQ/loQ0
	 MNqC/og/U/JCX02ROA4VSt/31hoJJKyDJYB6eTiM5FtscPo50IXJxuwfPJcISYJ5Bo
	 JVUzkTQyQJDT/DwPnh/6uJPHvZSstEkjmSaAd1oD/2eYSXBm+WQRf3GOuraJ/L6/c7
	 dAa8p4/Z1vrVg==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e72e3d435so5308005e87.2
        for <greybus-dev@lists.linaro.org>; Wed, 24 Jan 2024 10:20:19 -0800 (PST)
X-Gm-Message-State: AOJu0YwgFGcxIjVonaUdX4MIIC+TG92MWBjm+0fdWBP2rNL4jFBbqQce
	rQTsKA+oNx1an/7VUUTvXZipMuaZT3Sp8cgkJ7IUA0zixE2fkTislM0daIV0J5+W87yP9BL/Qtb
	JsoAh2Dv73mydIF2uGeun70wHSw==
X-Google-Smtp-Source: AGHT+IFQ7o9sj+x/bj/29pY9Rds1Cng62HUIvJOWJ1X7OlDRC8xWzyyEJAbOfVXOJaSePIJD48bw3TcKGaUGSzwtDq4=
X-Received: by 2002:a05:6512:1295:b0:50e:ca83:887e with SMTP id
 u21-20020a056512129500b0050eca83887emr2710515lfs.34.1706120417667; Wed, 24
 Jan 2024 10:20:17 -0800 (PST)
MIME-Version: 1.0
References: <20240122180551.34429-1-francesco@dolcini.it>
In-Reply-To: <20240122180551.34429-1-francesco@dolcini.it>
From: Rob Herring <robh@kernel.org>
Date: Wed, 24 Jan 2024 12:20:05 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKHjj5SfPTxhXUtmNh1nr1-eNKnL-Mmv-XdyONxgn9UVw@mail.gmail.com>
Message-ID: <CAL_JsqKHjj5SfPTxhXUtmNh1nr1-eNKnL-Mmv-XdyONxgn9UVw@mail.gmail.com>
To: Francesco Dolcini <francesco@dolcini.it>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2B63940B30
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.50 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,none];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:139.178.84.217];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:54825, ipnet:139.178.80.0/21, country:US];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev,toradex.com,gmail.com,redhat.com,google.com,davemloft.net,linaro.org,linux.intel.com,chromium.org,huawei.com];
	URIBL_BLOCKED(0.00)[dfw.source.kernel.org:helo,dfw.source.kernel.org:rdns];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[kernel.org:+]
Message-ID-Hash: SSLXZYWQ5WWVK2M6KSDXHWKSTAKRTI7R
X-Message-ID-Hash: SSLXZYWQ5WWVK2M6KSDXHWKSTAKRTI7R
X-MailFrom: robh@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Jiri Slaby <jirislaby@kernel.org>, linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, greybus-dev@lists.linaro.org, linux-iio@vger.kernel.org, netdev@vger.kernel.org, chrome-platform@lists.linux.dev, platform-driver-x86@vger.kernel.org, linux-serial@vger.kernel.org, linux-sound@vger.kernel.org, Francesco Dolcini <francesco.dolcini@toradex.com>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Lee Jones <lee@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S. Miller" <davem@davemloft.net>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>, Jonathan Camer
 on <Jonathan.Cameron@huawei.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] treewide, serdev: change receive_buf() return type to size_t
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SSLXZYWQ5WWVK2M6KSDXHWKSTAKRTI7R/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMTI6MDbigK9QTSBGcmFuY2VzY28gRG9sY2luaSA8ZnJh
bmNlc2NvQGRvbGNpbmkuaXQ+IHdyb3RlOg0KPg0KPiBGcm9tOiBGcmFuY2VzY28gRG9sY2luaSA8
ZnJhbmNlc2NvLmRvbGNpbmlAdG9yYWRleC5jb20+DQo+DQo+IHJlY2VpdmVfYnVmKCkgaXMgY2Fs
bGVkIGZyb20gdHR5cG9ydF9yZWNlaXZlX2J1ZigpIHRoYXQgZXhwZWN0cyB2YWx1ZXMNCj4gIj49
IDAiIGZyb20gc2VyZGV2X2NvbnRyb2xsZXJfcmVjZWl2ZV9idWYoKSwgY2hhbmdlIGl0cyByZXR1
cm4gdHlwZSBmcm9tDQo+IHNzaXplX3QgdG8gc2l6ZV90Lg0KPg0KPiBUaGUgbmVlZCBmb3IgdGhp
cyBjbGVhbi11cCB3YXMgbm90aWNlZCB3aGlsZSBmaXhpbmcgYSB3YXJuaW5nLCBzZWUNCj4gY29t
bWl0IDk0ZDA1Mzk0MjU0NCAoIkJsdWV0b290aDogYnRueHB1YXJ0OiBmaXggcmVjdl9idWYoKSBy
ZXR1cm4gdmFsdWUiKS4NCj4gQ2hhbmdpbmcgdGhlIGNhbGxiYWNrIHByb3RvdHlwZSB0byByZXR1
cm4gYW4gdW5zaWduZWQgc2VlbXMgdGhlIGJlc3Qgd2F5DQo+IHRvIGRvY3VtZW50IHRoZSBBUEkg
YW5kIGVuc3VyZSB0aGF0IGlzIHByb3Blcmx5IHVzZWQuDQo+DQo+IEdOU1MgZHJpdmVycyBpbXBs
ZW1lbnRhdGlvbiBvZiBzZXJkZXYgcmVjZWl2ZV9idWYoKSBjYWxsYmFjayByZXR1cm4NCj4gZGly
ZWN0bHkgdGhlIHJldHVybiB2YWx1ZSBvZiBnbnNzX2luc2VydF9yYXcoKS4gZ25zc19pbnNlcnRf
cmF3KCkNCj4gcmV0dXJucyBhIHNpZ25lZCBpbnQsIGhvd2V2ZXIgdGhpcyBpcyBub3QgYW4gaXNz
dWUgc2luY2UgdGhlIHZhbHVlDQo+IHJldHVybmVkIGlzIGFsd2F5cyBwb3NpdGl2ZSwgYmVjYXVz
ZSBvZiB0aGUga2ZpZm9faW4oKSBpbXBsZW1lbnRhdGlvbi4NCj4gZ25zc19pbnNlcnRfcmF3KCkg
Y291bGQgYmUgY2hhbmdlZCB0byByZXR1cm4gYWxzbyBhbiB1bnNpZ25lZCwgaG93ZXZlcg0KPiB0
aGlzIGlzIG5vdCBpbXBsZW1lbnRlZCBoZXJlIGFzIHJlcXVlc3QgYnkgdGhlIEdOU1MgbWFpbnRh
aW5lciBKb2hhbg0KPiBIb3ZvbGQuDQo+DQo+IFN1Z2dlc3RlZC1ieTogSmlyaSBTbGFieSA8amly
aXNsYWJ5QGtlcm5lbC5vcmc+DQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8w
ODdiZTQxOS1lYzZiLTQ3YWQtODUxYS01ZTFlM2VhNWNmY2NAa2VybmVsLm9yZy8NCj4gU2lnbmVk
LW9mZi1ieTogRnJhbmNlc2NvIERvbGNpbmkgPGZyYW5jZXNjby5kb2xjaW5pQHRvcmFkZXguY29t
Pg0KPiBBY2tlZC1ieTogSm9uYXRoYW4gQ2FtZXJvbiA8Sm9uYXRoYW4uQ2FtZXJvbkBodWF3ZWku
Y29tPiAjZm9yLWlpbw0KPiAtLS0NCj4gdjE6DQo+ICAtIGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L2FsbC8yMDIzMTIxNDE3MDE0Ni42NDE3ODMtMS1mcmFuY2VzY29AZG9sY2luaS5pdC8NCj4gdjI6
DQo+ICAtIHJlYmFzZWQgb24gNi44LXJjMQ0KPiAgLSBhZGQgYWNrZWQtYnkgSm9uYXRoYW4NCj4g
IC0gZG8gbm90IGNoYW5nZSBnbnNzX2luc2VydF9yYXcoKQ0KPiAgLSBkbyBub3QgY2hhbmdlIHRo
ZSBjb2RlIHN0eWxlIG9mIHRoZSBnbnNzIGNvZGUNCj4gIC0gY29tbWl0IG1lc3NhZ2UgaW1wcm92
ZW1lbnRzLCBleHBsYWluIHRoZSByZWFzb25zIGZvciBkb2luZyBvbmx5IG1pbmltYWwNCj4gICAg
Y2hhbmdlcyBvbiB0aGUgR05TUyBwYXJ0DQo+IC0tLQ0KPiAgZHJpdmVycy9ibHVldG9vdGgvYnRt
dGt1YXJ0LmMgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9ibHVldG9vdGgvYnRu
eHB1YXJ0LmMgICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9ibHVldG9vdGgvaGNp
X3NlcmRldi5jICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgZHJpdmVycy9nbnNzL3NlcmlhbC5j
ICAgICAgICAgICAgICAgICAgICAgIHwgIDIgKy0NCj4gIGRyaXZlcnMvZ25zcy9zaXJmLmMgICAg
ICAgICAgICAgICAgICAgICAgICB8ICAyICstDQo+ICBkcml2ZXJzL2dyZXlidXMvZ2ItYmVhZ2xl
cGxheS5jICAgICAgICAgICAgfCAgNiArKystLS0NCj4gIGRyaXZlcnMvaWlvL2NoZW1pY2FsL3Bt
czcwMDMuYyAgICAgICAgICAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvaWlvL2NoZW1pY2FsL3Nj
ZDMwX3NlcmlhbC5jICAgICAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvaWlvL2NoZW1pY2FsL3Nw
czMwX3NlcmlhbC5jICAgICAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvaWlvL2ltdS9ibm8wNTUv
Ym5vMDU1X3Nlcl9jb3JlLmMgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvbWZkL3JhdmUtc3AuYyAg
ICAgICAgICAgICAgICAgICAgICB8ICA0ICsrLS0NCj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3F1
YWxjb21tL3FjYV91YXJ0LmMgICB8ICAyICstDQo+ICBkcml2ZXJzL25mYy9wbjUzMy91YXJ0LmMg
ICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+ICBkcml2ZXJzL25mYy9zM2Z3cm41L3VhcnQu
YyAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+ICBkcml2ZXJzL3BsYXRmb3JtL2Nocm9tZS9j
cm9zX2VjX3VhcnQuYyAgICAgfCAgNCArKy0tDQo+ICBkcml2ZXJzL3BsYXRmb3JtL3N1cmZhY2Uv
YWdncmVnYXRvci9jb3JlLmMgfCAgNCArKy0tDQo+ICBkcml2ZXJzL3R0eS9zZXJkZXYvc2VyZGV2
LXR0eXBvcnQuYyAgICAgICAgfCAxMCArKysrLS0tLS0tDQo+ICBpbmNsdWRlL2xpbnV4L3NlcmRl
di5oICAgICAgICAgICAgICAgICAgICAgfCAgOCArKysrLS0tLQ0KPiAgc291bmQvZHJpdmVycy9z
ZXJpYWwtZ2VuZXJpYy5jICAgICAgICAgICAgIHwgIDQgKystLQ0KPiAgMTkgZmlsZXMgY2hhbmdl
ZCwgNDAgaW5zZXJ0aW9ucygrKSwgNDIgZGVsZXRpb25zKC0pDQoNClJldmlld2VkLWJ5OiBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPg0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVz
LWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
