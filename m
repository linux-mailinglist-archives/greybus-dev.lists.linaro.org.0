Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C5528564
	for <lists+greybus-dev@lfdr.de>; Mon, 16 May 2022 15:31:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3B374105B
	for <lists+greybus-dev@lfdr.de>; Mon, 16 May 2022 13:31:11 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	by lists.linaro.org (Postfix) with ESMTPS id 98AEF401C4
	for <greybus-dev@lists.linaro.org>; Mon, 16 May 2022 13:31:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id BAB16B81203;
	Mon, 16 May 2022 13:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE183C385AA;
	Mon, 16 May 2022 13:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1652707866;
	bh=ptJJdl6/90C/9ngs0R9TLu4hatZEKH+NyjqZBwan/o8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZdQ9mfTQBflmQWi4epCej7EPYBxF8pZ7ebsvN/YIJF+sYxkmOOFEk2UPrsR8cEht
	 3uUxwAXuxDSNr9DxG7VT5s0In462yrkGVBwDmjy5o3BYTodwXeF+/Aae318fGsFIdD
	 i6z511NzSGuxWHwP1TkBEGg+0ZsPsSzYb/5QWego=
Date: Mon, 16 May 2022 15:31:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Guenter Roeck <linux@roeck-us.net>
Message-ID: <YoJSF8T5K9pPx3Ap@kroah.com>
References: <20220228103142.3301082-1-arnd@kernel.org>
 <20220516131023.GA2329080@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220516131023.GA2329080@roeck-us.net>
Message-ID-Hash: HWQLO45C3N6XCN63QLGRGMYPO4IVTRFX
X-Message-ID-Hash: HWQLO45C3N6XCN63QLGRGMYPO4IVTRFX
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Arnd Bergmann <arnd@kernel.org>, linux-kbuild@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, llvm@lists.linux.dev, Jonathan Corbet <corbet@lwn.net>, Federico Vaga <federico.vaga@vaga.pv.it>, Alex Shi <alexs@kernel.org>, Hu Haowen <src.res@email.cn>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-btrfs@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] [v2] Kbuild: move to -std=gnu11
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HWQLO45C3N6XCN63QLGRGMYPO4IVTRFX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

T24gTW9uLCBNYXkgMTYsIDIwMjIgYXQgMDY6MTA6MjNBTSAtMDcwMCwgR3VlbnRlciBSb2VjayB3
cm90ZToNCj4gT24gTW9uLCBGZWIgMjgsIDIwMjIgYXQgMTE6Mjc6NDNBTSArMDEwMCwgQXJuZCBC
ZXJnbWFubiB3cm90ZToNCj4gPiBGcm9tOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPg0K
PiA+IA0KPiA+IER1cmluZyBhIHBhdGNoIGRpc2N1c3Npb24sIExpbnVzIGJyb3VnaHQgdXAgdGhl
IG9wdGlvbiBvZiBjaGFuZ2luZw0KPiA+IHRoZSBDIHN0YW5kYXJkIHZlcnNpb24gZnJvbSBnbnU4
OSB0byBnbnU5OSwgd2hpY2ggYWxsb3dzIHVzaW5nIHZhcmlhYmxlDQo+ID4gZGVjbGFyYXRpb24g
aW5zaWRlIG9mIGEgZm9yKCkgbG9vcC4gV2hpbGUgdGhlIEM5OSwgQzExIGFuZCBsYXRlciBzdGFu
ZGFyZHMNCj4gPiBpbnRyb2R1Y2UgbWFueSBvdGhlciBmZWF0dXJlcywgbW9zdCBvZiB0aGVzZSBh
cmUgYWxyZWFkeSBhdmFpbGFibGUgaW4NCj4gPiBnbnU4OSBhcyBHTlUgZXh0ZW5zaW9ucyBhcyB3
ZWxsLg0KPiANCj4gVGhlIGRvd25zaWRlIGlzIHRoYXQgYmFja3BvcnRpbmcgYWZmZWN0ZWQgcGF0
Y2hlcyB0byBvbGRlciBrZXJuZWwgYnJhbmNoZXMNCj4gbm93IGZhaWxzIHdpdGggZXJyb3IgbWVz
c2FnZXMgc3VjaCBhcw0KPiANCj4gbW0va2ZlbmNlL2NvcmUuYzogSW4gZnVuY3Rpb24g4oCYa2Zl
bmNlX2luaXRfcG9vbOKAmToNCj4gbW0va2ZlbmNlL2NvcmUuYzo1OTU6MjogZXJyb3I6IOKAmGZv
cuKAmSBsb29wIGluaXRpYWwgZGVjbGFyYXRpb25zIGFyZSBvbmx5IGFsbG93ZWQgaW4gQzk5IG9y
IEMxMSBtb2RlDQo+IA0KPiBKdXN0IHNvbWV0aGluZyB0byBrZWVwIGluIG1pbmQgd2hlbiB3cml0
aW5nIHBhdGNoZXMuDQoNCkkganVzdCByYW4gYWNyb3NzIHRoaXMgdmVyeSBpc3N1ZSBvbiB0aGlz
IGNvbW1pdC4gIEl0J3MgYW4gZWFzeSBmaXh1cA0KZm9yIDUuMTcueSB0byBtYWtlIHRoaXMgd29y
aywgc28gSSBkaWQgdGhhdCBpbiBteSB0cmVlLiAgSWYgdGhpcyBnZXRzIHRvDQpiZSB0b28gbXVj
aCwgd2UgbWlnaHQgbmVlZCB0byByZWNvbnNpZGVyIGFkZGluZyBjMTEgdG8gb2xkZXIgc3RhYmxl
DQprZXJuZWxzLg0KDQp0aGFua3MsDQoNCmdyZWcgay1oDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QgLS0gZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5kIGFuIGVtYWlsIHRv
IGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
