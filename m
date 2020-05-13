Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8288C1D19A0
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 17:39:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A914B65F85
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 15:39:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9C99365F86; Wed, 13 May 2020 15:39:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A8A5565F87;
	Wed, 13 May 2020 15:39:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DAF9660BD9
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 15:39:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C17BF65F86; Wed, 13 May 2020 15:39:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id C192060BD9
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 15:39:21 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E1A4B205CB;
 Wed, 13 May 2020 15:39:20 +0000 (UTC)
Date: Wed, 13 May 2020 17:39:18 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20200513153918.GA1360420@kroah.com>
References: <20200507185318.GA14393@embeddedor>
 <20200513150343.GZ25962@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513150343.GZ25962@localhost>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Replace zero-length
 array with flexible-array
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gV2VkLCBNYXkgMTMsIDIwMjAgYXQgMDU6MDM6NDNQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFRodSwgTWF5IDA3LCAyMDIwIGF0IDAxOjUzOjE4UE0gLTA1MDAsIEd1c3Rhdm8g
QS4gUi4gU2lsdmEgd3JvdGU6Cj4gPiBUaGUgY3VycmVudCBjb2RlYmFzZSBtYWtlcyB1c2Ugb2Yg
dGhlIHplcm8tbGVuZ3RoIGFycmF5IGxhbmd1YWdlCj4gPiBleHRlbnNpb24gdG8gdGhlIEM5MCBz
dGFuZGFyZCwgYnV0IHRoZSBwcmVmZXJyZWQgbWVjaGFuaXNtIHRvIGRlY2xhcmUKPiA+IHZhcmlh
YmxlLWxlbmd0aCB0eXBlcyBzdWNoIGFzIHRoZXNlIG9uZXMgaXMgYSBmbGV4aWJsZSBhcnJheSBt
ZW1iZXJbMV1bMl0sCj4gPiBpbnRyb2R1Y2VkIGluIEM5OToKPiA+IAo+ID4gc3RydWN0IGZvbyB7
Cj4gPiAgICAgICAgIGludCBzdHVmZjsKPiA+ICAgICAgICAgc3RydWN0IGJvbyBhcnJheVtdOwo+
ID4gfTsKPiA+IAo+ID4gQnkgbWFraW5nIHVzZSBvZiB0aGUgbWVjaGFuaXNtIGFib3ZlLCB3ZSB3
aWxsIGdldCBhIGNvbXBpbGVyIHdhcm5pbmcKPiA+IGluIGNhc2UgdGhlIGZsZXhpYmxlIGFycmF5
IGRvZXMgbm90IG9jY3VyIGxhc3QgaW4gdGhlIHN0cnVjdHVyZSwgd2hpY2gKPiA+IHdpbGwgaGVs
cCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmluZWQgYmVoYXZpb3IgYnVncyBmcm9tIGJl
aW5nCj4gPiBpbmFkdmVydGVudGx5IGludHJvZHVjZWRbM10gdG8gdGhlIGNvZGViYXNlIGZyb20g
bm93IG9uLgo+ID4gCj4gPiBBbHNvLCBub3RpY2UgdGhhdCwgZHluYW1pYyBtZW1vcnkgYWxsb2Nh
dGlvbnMgd29uJ3QgYmUgYWZmZWN0ZWQgYnkKPiA+IHRoaXMgY2hhbmdlOgo+ID4gCj4gPiAiRmxl
eGlibGUgYXJyYXkgbWVtYmVycyBoYXZlIGluY29tcGxldGUgdHlwZSwgYW5kIHNvIHRoZSBzaXpl
b2Ygb3BlcmF0b3IKPiA+IG1heSBub3QgYmUgYXBwbGllZC4gQXMgYSBxdWlyayBvZiB0aGUgb3Jp
Z2luYWwgaW1wbGVtZW50YXRpb24gb2YKPiA+IHplcm8tbGVuZ3RoIGFycmF5cywgc2l6ZW9mIGV2
YWx1YXRlcyB0byB6ZXJvLiJbMV0KPiA+IAo+ID4gc2l6ZW9mKGZsZXhpYmxlLWFycmF5LW1lbWJl
cikgdHJpZ2dlcnMgYSB3YXJuaW5nIGJlY2F1c2UgZmxleGlibGUgYXJyYXkKPiA+IG1lbWJlcnMg
aGF2ZSBpbmNvbXBsZXRlIHR5cGVbMV0uIFRoZXJlIGFyZSBzb21lIGluc3RhbmNlcyBvZiBjb2Rl
IGluCj4gPiB3aGljaCB0aGUgc2l6ZW9mIG9wZXJhdG9yIGlzIGJlaW5nIGluY29ycmVjdGx5L2Vy
cm9uZW91c2x5IGFwcGxpZWQgdG8KPiA+IHplcm8tbGVuZ3RoIGFycmF5cyBhbmQgdGhlIHJlc3Vs
dCBpcyB6ZXJvLiBTdWNoIGluc3RhbmNlcyBtYXkgYmUgaGlkaW5nCj4gPiBzb21lIGJ1Z3MuIFNv
LCB0aGlzIHdvcmsgKGZsZXhpYmxlLWFycmF5IG1lbWJlciBjb252ZXJzaW9ucykgd2lsbCBhbHNv
Cj4gPiBoZWxwIHRvIGdldCBjb21wbGV0ZWx5IHJpZCBvZiB0aG9zZSBzb3J0cyBvZiBpc3N1ZXMu
Cj4gPiAKPiA+IFRoaXMgaXNzdWUgd2FzIGZvdW5kIHdpdGggdGhlIGhlbHAgb2YgQ29jY2luZWxs
ZS4KPiA+IAo+ID4gWzFdIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MvWmVyby1M
ZW5ndGguaHRtbAo+ID4gWzJdIGh0dHBzOi8vZ2l0aHViLmNvbS9LU1BQL2xpbnV4L2lzc3Vlcy8y
MQo+ID4gWzNdIGNvbW1pdCA3NjQ5NzczMjkzMmYgKCJjeGdiMy9sMnQ6IEZpeCB1bmRlZmluZWQg
YmVoYXZpb3VyIikKPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2YSA8
Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncmV5YnVzL2FycGMu
aCAgICAgICAgICAgICAgICAgICAgfCAgICAyIC0KPiA+ICBpbmNsdWRlL2xpbnV4L2dyZXlidXMv
Z3JleWJ1c19wcm90b2NvbHMuaCB8ICAgNDQgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
Cj4gCj4gSSBub3RpY2VkIEdyZWcganVzdCBhcHBsaWVkIHRoaXMgb25lIHRvIGhpcyAtdGVzdGlu
ZyBicmFuY2gsIGJ1dCBkbyB3ZQo+IHJlYWxseSB3YW50IHRoaXMgaW4gZ3JleWJ1c19wcm90b2Nv
bHMuaCwgd2hpY2ggaXMgbWVhbnQgdG8gYmUgc2hhcmVkCj4gd2l0aCB0aGUgZmlybXdhcmUgc2lk
ZT8gUGVyaGFwcyBub3QgYW4gaXNzdWUsIGp1c3QgZmlndXJlZCBJJ2QgcG9pbnQKPiB0aGlzIG91
dC4KCldoeSBub3QsIGl0IHNob3VsZCBiZSB0aGUgc2FtZSB0aGluZywgcmlnaHQ/ICBObyBsb2dp
YyBoYXMgY2hhbmdlZCB0aGF0Ckkgc2VlLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
