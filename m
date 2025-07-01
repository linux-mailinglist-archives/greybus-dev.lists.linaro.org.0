Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B05AEF56F
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Jul 2025 12:45:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3CF36455C6
	for <lists+greybus-dev@lfdr.de>; Tue,  1 Jul 2025 10:45:28 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	by lists.linaro.org (Postfix) with ESMTPS id D42C741479
	for <greybus-dev@lists.linaro.org>; Tue,  1 Jul 2025 09:13:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=MUgzfRJa;
	spf=pass (lists.linaro.org: domain of pranav.tyagi03@gmail.com designates 209.85.208.178 as permitted sender) smtp.mailfrom=pranav.tyagi03@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-32cd499007aso38517131fa.0
        for <greybus-dev@lists.linaro.org>; Tue, 01 Jul 2025 02:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751361188; x=1751965988; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ROgPEw9PJSV4rDIb9YQpEctVvh6PzqhiH26Y+jXtSJo=;
        b=MUgzfRJa0H86nlDBCcD/CMVfzhkYMjo0V1xLxOtDs5rxu+g39WGLvkdw6osjbVmk3Z
         nX6NLjm55hH04zC+xpv/Sjw7Q3qnY5YqJjkj9+5dbTCcN8k5R1G4zPBuiWiOfHXlJIEg
         6NxJS1ptAkfC8TfVuEN0cBCrWYCLjnCj6InSEdWRg7OqS+W5SbdqoTbu6KwXVrXhgOE4
         Mk/cZkFcp2tAziXvi7K9Kw7mxJDaMhsSpugyxABp0QQksbGDJnlSwPHO10SVHAGGQMql
         V057omrge+UDQnXzNo3lg4a4TkkZ3Tl6p5a9V76k5+2Ia9cLrZ5aUECd5ZyIu5B/cg6Z
         AiIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361188; x=1751965988;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ROgPEw9PJSV4rDIb9YQpEctVvh6PzqhiH26Y+jXtSJo=;
        b=quHBNHsik78gDXv8AgSuxRPQWIM9W8sRTcQXO4HuHgaLjDF3NP2XtcKfzq1HFeLTl9
         MUZlyBkaOQYYt6gN8JmRzkQuDNPfdF8l/IDiUF01LV1hKGUQ0oAXG6+KnHYhbIbq88NO
         TKTvTGQkiFXdU9W6t2ifGiWn84UBEIkKMAAmlZmkoRx4jCzszBEKQ+xpFQbIuDugUWj8
         O9r/DA2hEcimp7W2vQxVvyM9d/jywkWWVK8RhxbNzk74IZmiOyW1oiut6ciBOoRWjgag
         barxroBKfbWOgS5kFbRr+0VZo3/IvZMGiZOUCgO4oAbzjprN66eqjHZhEf6kok7Brude
         AmMQ==
X-Gm-Message-State: AOJu0YzD2Vjt5xJPcTgazlhG8EgDHHxdJiDXZBz1yYOIiYEbigaX4OmI
	IV4W2B6XZzrJoeJm6xmLsf9ctGAcwAMkJ7VueXwh8N1ChURg175k7olazj8RYZrIqMuUvnaJv/7
	6F+nkThFQM1kE6EB/zcyCdKNizEsOFLw=
X-Gm-Gg: ASbGnctWCE88uZ0K9Z6Nw1W7uLIdUJvQpLaOYrUdHbPKgGLd0lK8+4cECQ4l1au3DdB
	2vkdqzHLfOew7u+fGJ8yP3w/0XVydQEZ07c+71YSQJI7YdP/QXkaS6MSs0YCsGPT/zbbzSr6Elc
	f3D+LSjkr19cIgM3KQP+EY5LlznzRVzmL5A/j0t9bWwlazut/xX46m/trJVHAm2kTx9gS8YsScp
	puBv/w7vxVwvTo=
X-Google-Smtp-Source: AGHT+IFaRimBXwf+/UEtRyiC+KK+xadzvj9nmalX2Tk87W6sIlFV3Hdmxz/NSxN6EDVUMGJK6IRPijyU9g+dPjzrzUI=
X-Received: by 2002:a05:651c:2205:b0:32b:7614:5745 with SMTP id
 38308e7fff4ca-32cdc4efdf5mr57485841fa.20.1751361188252; Tue, 01 Jul 2025
 02:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250628063121.362685-1-pranav.tyagi03@gmail.com> <2025062945-prologue-plutonium-870f@gregkh>
In-Reply-To: <2025062945-prologue-plutonium-870f@gregkh>
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
Date: Tue, 1 Jul 2025 14:42:57 +0530
X-Gm-Features: Ac12FXwHc8lXS26tySAKuBhdyhXYJyZqD9JrvOV0o15Dkdc9IcQXg0PK4LpxJM4
Message-ID: <CAH4c4j+yh99h3V0Ody5yx8DnC=Ee4J0kbEKL85k366FdTyXSdA@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D42C741479
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.178:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	URIBL_BLOCKED(0.00)[mail.gmail.com:mid,mail-lj1-f178.google.com:rdns,mail-lj1-f178.google.com:helo];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-MailFrom: pranav.tyagi03@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 4S4QZ4I2RXJQIYSKCTHUXXUUWATHABJ6
X-Message-ID-Hash: 4S4QZ4I2RXJQIYSKCTHUXXUUWATHABJ6
X-Mailman-Approved-At: Tue, 01 Jul 2025 10:45:25 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/4S4QZ4I2RXJQIYSKCTHUXXUUWATHABJ6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gU3VuLCBKdW4gMjksIDIwMjUgYXQgMzoxN+KAr1BNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZv
dW5kYXRpb24ub3JnPiB3cm90ZToNCj4NCj4gT24gU2F0LCBKdW4gMjgsIDIwMjUgYXQgMTI6MDE6
MjFQTSArMDUzMCwgUHJhbmF2IFR5YWdpIHdyb3RlOg0KPiA+IFJlbW92ZSByZWR1bmRhbnQgZ2Jf
bG9vcGJhY2tfYXN5bmNfd2FpdF9hbGwoKSBhcyBjb25uZWN0aW9uIGlzIGRpc2FibGVkDQo+ID4g
YXQgdGhlIGJlZ2lubmluZyBhbmQgbm8gZnVydGhlciBpbmNvbWluZy9vdXRnb2luZyByZXF1ZXN0
cyBhcmUgcG9zc2libGUuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmFuYXYgVHlhZ2kgPHBy
YW5hdi50eWFnaTAzQGdtYWlsLmNvbT4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvbG9vcGJhY2suYyB8IDcgLS0tLS0tLQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBkZWxl
dGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9s
b29wYmFjay5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYw0KPiA+IGluZGV4
IDFmMTkzMjNiMGUxYS4uOWQwZDQzMDhhZDI1IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2xvb3BiYWNrLmMNCj4gPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9sb29wYmFjay5jDQo+ID4gQEAgLTExMTAsMTMgKzExMTAsNiBAQCBzdGF0aWMgdm9pZCBnYl9s
b29wYmFja19kaXNjb25uZWN0KHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSkNCj4gPiAgICAgICBn
Yl9jb25uZWN0aW9uX2xhdGVuY3lfdGFnX2Rpc2FibGUoZ2ItPmNvbm5lY3Rpb24pOw0KPiA+ICAg
ICAgIGRlYnVnZnNfcmVtb3ZlKGdiLT5maWxlKTsNCj4gPg0KPiA+IC0gICAgIC8qDQo+ID4gLSAg
ICAgICogRklYTUU6IGdiX2xvb3BiYWNrX2FzeW5jX3dhaXRfYWxsKCkgaXMgcmVkdW5kYW50IG5v
dywgYXMgY29ubmVjdGlvbg0KPiA+IC0gICAgICAqIGlzIGRpc2FibGVkIGF0IHRoZSBiZWdpbm5p
bmcgYW5kIHNvIHdlIGNhbid0IGhhdmUgYW55IG1vcmUNCj4gPiAtICAgICAgKiBpbmNvbWluZy9v
dXRnb2luZyByZXF1ZXN0cy4NCj4gPiAtICAgICAgKi8NCj4gPiAtICAgICBnYl9sb29wYmFja19h
c3luY193YWl0X2FsbChnYik7DQo+DQo+IEhvdyB3YXMgdGhpcyB0ZXN0ZWQ/ICBJdCBtaWdodCBi
ZSByZWR1bmRhbnQgYnV0IEkgZG9uJ3QgdGhpbmsgeW91IGNhbg0KPiBkZWxldGUgdGhpcyBqdXN0
IHlldCwgb3RoZXJ3aXNlIHdlIHdvdWxkIGhhdmUgZG9uZSBzbyBhIGxvbmcgdGltZSBhZ28uDQo+
DQo+IEFuZCB5b3VyIGNoYW5nZWxvZyBqdXN0IHNheXMgdGhlIHNhbWUgdGhpbmcgYXMgdGhpcyBj
b21tZW50LCBzaG91bGRuJ3QNCj4geW91IHdyaXRlIHNvbWV0aGluZyBkaWZmZXJlbnQ/DQo+DQo+
IHRoYW5rcywNCj4NCj4gZ3JlZyBrLWgNCg0KSGksDQoNClRoYW5rcyBmb3IgdGhlIGZlZWRiYWNr
LiBPbiBjaGVja2luZyB0aGUgY29udGV4dCwgSSBmb3VuZCB0aGUgRklYTUUgdG8NCmJlIHRyaXZp
YWwgYW5kIGJ1aWxkLXRlc3QgdGhlIHBhdGNoLiBCdXQsIGl0IGRlZmluaXRlbHkgY2FuIG5vdCBn
dWFyYW50ZWUNCnJ1bnRpbWUgY29ycmVjdG5lc3MuIEkgd2lsbCBhbHNvIHRyeSB0byB3cml0ZSBi
ZXR0ZXIgY2hhbmdlbG9ncyBmb3IgZnV0dXJlDQpwYXRjaGVzLg0KDQpBcG9sb2dpZXMgZm9yIHRo
ZSBub2lzZS4NCg0KUmVnYXJkcw0KUHJhbmF2IFR5YWdpDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
