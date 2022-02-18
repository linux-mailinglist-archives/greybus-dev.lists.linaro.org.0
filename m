Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AB79B4BB2F4
	for <lists+greybus-dev@lfdr.de>; Fri, 18 Feb 2022 08:10:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D71253EEBB
	for <lists+greybus-dev@lfdr.de>; Fri, 18 Feb 2022 07:10:51 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 199723E8F1
	for <greybus-dev@lists.linaro.org>; Fri, 18 Feb 2022 07:10:50 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B6D16B820CC;
	Fri, 18 Feb 2022 07:10:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C81C340E9;
	Fri, 18 Feb 2022 07:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1645168247;
	bh=d+hIdbP4FcjzoABr76JeTKbmnhBBCfqZICtBBkTZUKQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=u+JysrmpF0/EDrB5xHfEaEQ6p9cdUqaBWI3XOenDKrL3YPKrprayM0DrAhAMyHm72
	 xhUPRFlZ0XpJ3ImhtOCNfALdfoGePbAZA7axG/E4Gk6OPilGgS6D60yTbsn++jGpZK
	 m37+jsURk0HWwEul1S4mfx94va1vtToF+WAZmr9s=
Date: Fri, 18 Feb 2022 08:10:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ahamed Husni <ahamedhusni73@gmail.com>
Message-ID: <Yg9GcPtAOeVtmTyg@kroah.com>
References: <20220217190722.44894-1-ahamedhusni73@gmail.com>
 <Yg6hcX6XK4Eu0KOR@kroah.com>
 <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFjpAKqy908scQTRJPkMhEz8OyNiR3-N8XD2hiGa+VBLhUf0VA@mail.gmail.com>
Message-ID-Hash: KINY6UT3MXHWILGHAMCIS4XE6RRW7TJT
X-Message-ID-Hash: KINY6UT3MXHWILGHAMCIS4XE6RRW7TJT
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: loopback: Fix Coding Style Error
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KINY6UT3MXHWILGHAMCIS4XE6RRW7TJT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMTA6MjI6MjhBTSArMDUzMCwgQWhhbWVkIEh1c25pIHdy
b3RlOg0KPiBIaSBHcmVnLA0KPiANCj4gT24gRnJpLCBGZWIgMTgsIDIwMjIgYXQgMTI6NTYgQU0g
R3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOg0KPiA+IERpZCB5b3Ug
dHJ5IHRvIGJ1aWxkIHRoaXMgY2hhbmdlPw0KPiANCj4gSSBhbSBhIG5ld2JpZSBrZXJuZWwgZGV2
IGFuZCB0cnlpbmcgdG8gdW5kZXJzdGFuZCBob3cgdGhpbmdzIHdvcmsuDQo+IEkgZGlkIG5vdCBi
dWlsZCB0aGlzIGNoYW5nZSBieSB0aGUgdGltZSBJIHNlbnQgeW91IHRoaXMsIHRoaW5raW5nIHRo
aXMNCj4gaXMganVzdCBhIHN0eWxlIGNoYW5nZS4NCj4gSSBzaG91bGQgaGF2ZSB0ZXN0ZWQgdGhl
IGJ1aWxkLiBJIGFtIHNvcnJ5Lg0KDQpZb3UgYWx3YXlzIGhhdmUgdG8gYnVpbGQtdGVzdCB5b3Vy
IGNoYW5nZXMsIGFzIHlvdSBoYXZlIGZvdW5kIG91dC4NCg0KPiBOb3cgSSBidWlsdCB0aGUgY2hh
bmdlcyBieSBzZXR0aW5nIHRoZSBmb2xsb3dpbmcgY29uZmlndXJhdGlvbnMuDQo+IENPTkZJR19H
UkVZQlVTDQo+IENPTkZJR19TVEFHSU5HDQo+IENPTkZJR19HUkVZQlVTX0xPT1BCQUNLDQo+IA0K
PiBNeSBjaGFuZ2UgaW50cm9kdWNlcyB0aGUgZm9sbG93aW5nIGVycm9yLg0KPiAnJycnDQo+IGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmM6MTY2OjI6IGVycm9yOiBleHBlY3RlZCBp
ZGVudGlmaWVyDQo+IG9yIOKAmCjigJkgYmVmb3JlIOKAmGRv4oCZDQo+ICAgMTY2IHwgIGRvIHsg
ICAgICAgICAgICBcDQo+ICAgICAgIHwgIF5+DQo+ICcnJycNCj4gSSBjb3VsZCBub3QgZml4IG9y
IGZpbmQgdGhlIHJlYXNvbiBmb3IgdGhpcyBlcnJvci4gUGxlYXNlIGd1aWRlIG1lIGluDQo+IHRo
aXMgcmVnYXJkLg0KDQpUaGVyZSBpcyBub3RoaW5nIHdyb25nIHdpdGggdGhlIG9yaWdpbmFsIGNv
ZGUgaGVyZS4gIFJlbWVtYmVyIHRoYXQNCmNoZWNrcGF0Y2ggaXMgYSBwZXJsIHNjcmlwdCB0aGF0
IGdpdmVzIGdvb2QgYWR2aWNlLCBidXQgaXQgaXMgbm90IGFsd2F5cw0KY29ycmVjdC4gIFlvdSBt
dXN0IGFsd2F5cyBtYW51YWxseSBjaGVjayBpdCBiYXNlZCBvbiB5b3VyIGtub3dsZWRnZSBvZg0K
dGhlIEMgbGFuZ3VhZ2UuDQoNCkkgcmVjb21tZW5kIGxlYXJuaW5nIGEgYml0IG1vcmUgQyBiZWZv
cmUgd29ya2luZyBvbiBrZXJuZWwgY29kZS4NCg0KQmVzdCBvZiBsdWNrIQ0KDQpncmVnIGstaA0K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJz
Y3JpYmUgc2VuZCBhbiBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3Jn
Cg==
