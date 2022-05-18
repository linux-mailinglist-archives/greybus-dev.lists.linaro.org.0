Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BEF52B3BD
	for <lists+greybus-dev@lfdr.de>; Wed, 18 May 2022 09:46:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 257C1410A4
	for <lists+greybus-dev@lfdr.de>; Wed, 18 May 2022 07:46:50 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 25BF63EF85
	for <greybus-dev@lists.linaro.org>; Wed, 18 May 2022 07:46:46 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C204D61499
	for <greybus-dev@lists.linaro.org>; Wed, 18 May 2022 07:46:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B70C34100
	for <greybus-dev@lists.linaro.org>; Wed, 18 May 2022 07:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1652860005;
	bh=KUl7JvGgqkc1DfGhPQMhcKNc6+xW1iqiAC34dWUYIYI=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dkK2VuiRazUYy/0raeMMGlNR4Tax1p2NGjBr/nBjKum21oFxmslWmUCU0VzoRu+cO
	 HmrzPveZdQjdv+cTPBR2V9tak/jiomNUfYBj5sw2dX2dKoC9xH7uM57L8jH4xYiIuM
	 08YqMdtOguRYHRonbNsRBlTLvM52Q+3TpvkwtUExXHPUUphUHyK569lWDbMs10HDjU
	 DyH3Js5U9VM/fgDmVN0asWG655mirLaZZDwLq2xvJajzBmBVBbWSRTWp5U0pCUQtsS
	 fyTFbdmkyAv0lZigt1Yr/42MgLcInpjxDL0ApYmAeUaT9QZgryC0kOix45ZHLnTsUi
	 zGfw+Eb+H8wvA==
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-2ff1ed64f82so15569717b3.1
        for <greybus-dev@lists.linaro.org>; Wed, 18 May 2022 00:46:45 -0700 (PDT)
X-Gm-Message-State: AOAM531A5HW6kLXdIpYLU7bsTNA+D7e50lC+T0qvpxkWBXoB5xmcRjqF
	wHL1ZlZOaK7jYZ8Bdso2NXlFXmLrr5wqxo2Apxg=
X-Google-Smtp-Source: ABdhPJyhm2Dj408LoUWWmvAqhkBhAYE1RnSkeixOEh3zciq1RMr7OwAYsEs1iONJHOBW1KRcCiA1jSuvrZOus+J3c4c=
X-Received: by 2002:a0d:cd06:0:b0:2f8:f39c:4cfc with SMTP id
 p6-20020a0dcd06000000b002f8f39c4cfcmr29636586ywd.495.1652860004199; Wed, 18
 May 2022 00:46:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220228103142.3301082-1-arnd@kernel.org> <20220516131023.GA2329080@roeck-us.net>
 <YoJSF8T5K9pPx3Ap@kroah.com> <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
In-Reply-To: <9510474d-5555-42b3-5a9c-90e3078df499@roeck-us.net>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 18 May 2022 08:46:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
Message-ID: <CAK8P3a1GmRqPTXFCoLH9h1sP76a-bVRsGYP-YvczoXM4Na3OVQ@mail.gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID-Hash: E4AFP45KMU7ZKNQ4BPMA75RNA67QWHYE
X-Message-ID-Hash: E4AFP45KMU7ZKNQ4BPMA75RNA67QWHYE
X-MailFrom: arnd@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, clang-built-linux <llvm@lists.linux.dev>, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-doc-tw-discuss@lists.sourceforge.net, Linux ARM <linux-arm-kernel@lists.infradead.org>, Intel Graphics <intel-gfx@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs <linux-btrfs@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E4AFP45KMU7ZKNQ4BPMA75RNA67QWHYE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXkgMTYsIDIwMjIgYXQgMzoxOSBQTSBHdWVudGVyIFJvZWNrIDxsaW51eEByb2Vj
ay11cy5uZXQ+IHdyb3RlOg0KPiBPbiA1LzE2LzIyIDA2OjMxLCBHcmVnIEtIIHdyb3RlOg0KPiA+
IE9uIE1vbiwgTWF5IDE2LCAyMDIyIGF0IDA2OjEwOjIzQU0gLTA3MDAsIEd1ZW50ZXIgUm9lY2sg
d3JvdGU6DQo+ID4+IE9uIE1vbiwgRmViIDI4LCAyMDIyIGF0IDExOjI3OjQzQU0gKzAxMDAsIEFy
bmQgQmVyZ21hbm4gd3JvdGU6DQo+ID4+PiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPg0KPiA+Pj4NCj4gPj4+IER1cmluZyBhIHBhdGNoIGRpc2N1c3Npb24sIExpbnVzIGJyb3Vn
aHQgdXAgdGhlIG9wdGlvbiBvZiBjaGFuZ2luZw0KPiA+Pj4gdGhlIEMgc3RhbmRhcmQgdmVyc2lv
biBmcm9tIGdudTg5IHRvIGdudTk5LCB3aGljaCBhbGxvd3MgdXNpbmcgdmFyaWFibGUNCj4gPj4+
IGRlY2xhcmF0aW9uIGluc2lkZSBvZiBhIGZvcigpIGxvb3AuIFdoaWxlIHRoZSBDOTksIEMxMSBh
bmQgbGF0ZXIgc3RhbmRhcmRzDQo+ID4+PiBpbnRyb2R1Y2UgbWFueSBvdGhlciBmZWF0dXJlcywg
bW9zdCBvZiB0aGVzZSBhcmUgYWxyZWFkeSBhdmFpbGFibGUgaW4NCj4gPj4+IGdudTg5IGFzIEdO
VSBleHRlbnNpb25zIGFzIHdlbGwuDQo+ID4+DQo+ID4+IFRoZSBkb3duc2lkZSBpcyB0aGF0IGJh
Y2twb3J0aW5nIGFmZmVjdGVkIHBhdGNoZXMgdG8gb2xkZXIga2VybmVsIGJyYW5jaGVzDQo+ID4+
IG5vdyBmYWlscyB3aXRoIGVycm9yIG1lc3NhZ2VzIHN1Y2ggYXMNCj4gPj4NCj4gPj4gbW0va2Zl
bmNlL2NvcmUuYzogSW4gZnVuY3Rpb24g4oCYa2ZlbmNlX2luaXRfcG9vbOKAmToNCj4gPj4gbW0v
a2ZlbmNlL2NvcmUuYzo1OTU6MjogZXJyb3I6IOKAmGZvcuKAmSBsb29wIGluaXRpYWwgZGVjbGFy
YXRpb25zIGFyZSBvbmx5IGFsbG93ZWQgaW4gQzk5IG9yIEMxMSBtb2RlDQo+ID4+DQo+ID4+IEp1
c3Qgc29tZXRoaW5nIHRvIGtlZXAgaW4gbWluZCB3aGVuIHdyaXRpbmcgcGF0Y2hlcy4NCj4gPg0K
PiA+IEkganVzdCByYW4gYWNyb3NzIHRoaXMgdmVyeSBpc3N1ZSBvbiB0aGlzIGNvbW1pdC4gIEl0
J3MgYW4gZWFzeSBmaXh1cA0KPiA+IGZvciA1LjE3LnkgdG8gbWFrZSB0aGlzIHdvcmssIHNvIEkg
ZGlkIHRoYXQgaW4gbXkgdHJlZS4gIElmIHRoaXMgZ2V0cyB0bw0KPiA+IGJlIHRvbyBtdWNoLCB3
ZSBtaWdodCBuZWVkIHRvIHJlY29uc2lkZXIgYWRkaW5nIGMxMSB0byBvbGRlciBzdGFibGUNCj4g
PiBrZXJuZWxzLg0KPiA+DQo+DQo+IEkgdGhpbmsgSSdsbCBkbyBqdXN0IHRoYXQgZm9yIENocm9t
ZU9TOyBJIGRvbid0IHdhbnQgdG8gaGF2ZSB0byBkZWFsDQo+IHdpdGggdGhlIGJhY2twb3J0cywg
YW5kIHdlIGFyZSB1c2luZyByZWNlbnQgY29tcGlsZXJzIGFueXdheS4NCg0KSSB0aGluayBpdCB3
b3VsZCBiZSBiZXR0ZXIgbm90IHRvIGhhdmUgdGhlIC0tc3RkPWdudTExIGNoYW5nZSBpbiB0aGUg
b2xkZXINCnN0YWJsZSBrZXJuZWxzIGJ5IGRlZmF1bHQsIGFzIHRoaXMgaGFzIGludHJvZHVjZWQg
YnVpbGQgd2FybmluZ3MgYW5kIG90aGVyDQpzbWFsbGVyIGlzc3VlcywgYXMgd2VsbCBhcyByYWlz
aW5nIHRoZSBtaW5pbXVtIGNvbXBpbGVyIHZlcnNpb24uDQoNClRoZSB1c2VycyB0aGF0IGFyZSBz
dHVjayBvbiBvbGRlciBrZXJuZWxzIGZvciBzb21lIHJlYXNvbiB0ZW5kIHRvDQpvdmVybGFwIHdp
dGggdGhvc2Ugb24gb2xkZXIgY29tcGlsZXJzLiBPbmUgZXhhbXBsZSBoZXJlIGlzIEFuZHJvaWQs
DQp3aGljaCB1c2VkIHRvIHNoaXAgd2l0aCBhIGdjYy00LjkgYnVpbGQgYXMgdGhlIG9ubHkgbm9u
LWNsYW5nIHRvb2xjaGFpbiwNCmFuZCB3YXMgdXNpbmcgdGhpcyBmb3IgYnVpbGRpbmcgdGhlaXIg
a2VybmVscy4gSWYgc29tZW9uZSB3YW50cyB0bw0KcHVsbCBpbiBzdGFibGUgdXBkYXRlcyBpbnRv
IGFuIG9sZGVyIEFuZHJvaWQsIHRoaXMgd291bGQgZmFpbCB3aXRoDQotc3RkPWdudTExLiBPdGhl
cnMgbWF5IGJlIGluIHRoZSBzYW1lIHNpdHVhdGlvbi4NCg0KQ2hhbmdpbmcgc29tZSBvZiB0aGUg
NS54IHN0YWJsZSBicmFuY2hlcyB0byAtc3RkPWdudTExIGlzIHByb2JhYmx5DQpsZXNzIG9mIGEg
cHJvYmxlbSwgYnV0IEkgd291bGQgbm90IGtub3cgd2hlcmUgdG8gZHJhdyB0aGUgbGluZSBleGFj
dGx5Lg0KTWF5YmUgY2hlY2sgd2l0aCB0aGUgQW5kcm9pZCB0ZWFtIHRvIHNlZSB3aGF0IHRoZSBu
ZXdlc3Qga2VybmVsIGlzDQp0aGF0IHRoZXkgZXhwZWN0IHRvIGJlIGJ1aWx0IHdpdGggdGhlIG9s
ZCBnY2MtNC45Lg0KDQogICAgICAgICBBcm5kDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRvIGdyZXli
dXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
