Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B30A06B8
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 17:55:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1693260756
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 15:55:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0A2556088F; Wed, 28 Aug 2019 15:55:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AD8C1617F1;
	Wed, 28 Aug 2019 15:55:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A30D760756
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 15:55:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 87312617EF; Wed, 28 Aug 2019 15:55:37 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 497B460756
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 15:55:36 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F18672064A;
 Wed, 28 Aug 2019 15:55:34 +0000 (UTC)
Date: Wed, 28 Aug 2019 17:55:32 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Message-ID: <20190828155532.GB3803@kroah.com>
References: <20190827205917.8308-1-rui.silva@linaro.org>
 <20190828083519.GA29752@kroah.com>
 <0b740eb9-5ef4-8346-aa78-6b07bb060e7b@infradead.org>
 <m3blw9wc81.fsf@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3blw9wc81.fsf@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: add missing includes
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

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDQ6MTc6NTBQTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2
YSB3cm90ZToKPiBIaSBSYW5keSwKPiBPbiBXZWQgMjggQXVnIDIwMTkgYXQgMTY6MDksIFJhbmR5
IER1bmxhcCB3cm90ZToKPiA+IE9uIDgvMjgvMTkgMTozNSBBTSwgR3JlZyBLcm9haC1IYXJ0bWFu
IHdyb3RlOgo+ID4+IE9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDA5OjU5OjE3UE0gKzAxMDAsIFJ1
aSBNaWd1ZWwgU2lsdmEgd3JvdGU6Cj4gPj4+IEJlZm9yZSBtb3ZpbmcgZ3JleWJ1cyBjb3JlIG91
dCBvZiBzdGFnaW5nIGFuZCBtb3ZpbmcgaGVhZGVyIGZpbGVzIHRvCj4gPj4+IGluY2x1ZGUvbGlu
dXggc29tZSBncmV5YnVzIGhlYWRlciBmaWxlcyB3ZXJlIG1pc3NpbmcgdGhlIG5lY2Vzc2FyeQo+
ID4+PiBpbmNsdWRlcy4gVGhpcyB3b3VsZCB0cmlnZ2VyIGNvbXBpbGF0aW9uIGZhaWxsdXJlcyB3
aXRoIHNvbWUgZXhhbXBsZQo+ID4+PiBlcnJvcnMgbG9nZ2VkIGJlbGxvdyBmb3Igd2l0aCBDT05G
SUdfS0VSTkVMX0hFQURFUl9URVNUPXkuCj4gPj4+Cj4gPj4+IFNvLCBhZGQgdGhlIG5lY2Vzc2Fy
eSBoZWFkZXJzIHRvIGNvbXBpbGUgY2xlYW4gYmVmb3JlIHJlbG9jYXRpbmcgdGhlCj4gPj4+IGhl
YWRlciBmaWxlcy4KPiA+Pj4KPiA+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyMzo1
MDogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4gPj4+ICAgaW50ICgqY3BvcnRfZGlz
YWJsZSkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+Cj4gPj4+
IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmg6MTMxNDoyOiBlcnJv
cjogdW5rbm93biB0eXBlIG5hbWUgJ19fdTgnCj4gPj4+ICAgX191OCBkYXRhWzBdOwo+ID4+PiAg
IF5+fn4KPiA+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyNDo1MjogZXJyb3I6IHVu
a25vd24gdHlwZSBuYW1lICd1MTYnCj4gPj4+ICAgaW50ICgqY3BvcnRfY29ubmVjdGVkKShzdHJ1
Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQpOyBefn4KPiA+Pj4gLi9pbmNsdWRl
L2xpbnV4L2dyZXlidXMvaGQuaDoyNTo0ODogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYn
Cj4gPj4+ICAgaW50ICgqY3BvcnRfZmx1c2gpKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQsIHUx
NiBjcG9ydF9pZCk7IF5+fgo+ID4+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI2OjUx
OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxNicKPiA+Pj4gICBpbnQgKCpjcG9ydF9zaHV0
ZG93bikoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkLCBefn4KPiA+Pj4g
Li9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyNzo1OiBlcnJvcjogdW5rbm93biB0eXBlIG5h
bWUgJ3U4Jwo+ID4+PiB1OCBwaGFzZSwgdW5zaWduZWQgaW50IHRpbWVvdXQpOwo+ID4+PiAgICAg
IF5+Cj4gPj4+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6Mjg6NTA6IGVycm9yOiB1bmtu
b3duIHR5cGUgbmFtZSAndTE2Jwo+ID4+PiAgIGludCAoKmNwb3J0X3F1aWVzY2UpKHN0cnVjdCBn
Yl9ob3N0X2RldmljZSAqaGQsIHUxNiBjcG9ydF9pZCwgXn5+Cj4gPj4+IC4vaW5jbHVkZS9saW51
eC9ncmV5YnVzL2hkLmg6Mjk6NTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdzaXplX3QnCj4g
Pj4+ICAgICAgc2l6ZV90IHBlZXJfc3BhY2UsIHVuc2lnbmVkIGludCB0aW1lb3V0KTsKPiA+Pj4g
ICAgICBefn5+fn4KPiA+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyOTo1OiBub3Rl
OiAnc2l6ZV90JyBpcyBkZWZpbmVkIGluIGhlYWRlciAnPHN0ZGRlZi5oPic7IGRpZCB5b3UgZm9y
Z2V0IHRvICcjaW5jbHVkZSA8c3RkZGVmLmg+Jz8KPiA+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXli
dXMvaGQuaDoxOjE6Cj4gPj4+ICsjaW5jbHVkZSA8c3RkZGVmLmg+Cj4gPj4+ICAvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMCAqLwo+ID4+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9oZC5oOjI5OjU6Cj4gPj4+ICAgICAgc2l6ZV90IHBlZXJfc3BhY2UsIHVuc2lnbmVkIGludCB0
aW1lb3V0KTsKPiA+Pj4gICAgICBefn5+fn4KPiA+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMv
aGQuaDozMDo0ODogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4gPj4+ICAgaW50ICgq
Y3BvcnRfY2xlYXIpKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQsIHUxNiBjcG9ydF9pZCk7IF5+
fgo+ID4+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjMyOjQ5OiBlcnJvcjogdW5rbm93
biB0eXBlIG5hbWUgJ3UxNicKPiA+Pj4gICBpbnQgKCptZXNzYWdlX3NlbmQpKHN0cnVjdCBnYl9o
b3N0X2RldmljZSAqaGQsIHUxNiBkZXN0X2Nwb3J0X2lkLCBefn4KPiA+Pj4gLi9pbmNsdWRlL2xp
bnV4L2dyZXlidXMvaGQuaDozMzozMjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdnZnBfdCcK
PiA+Pj4gc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKTsgXn5+fn4K
PiA+Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDozNTo1NTogZXJyb3I6IHVua25vd24g
dHlwZSBuYW1lICd1MTYnCj4gPj4+ICAgaW50ICgqbGF0ZW5jeV90YWdfZW5hYmxlKShzdHJ1Y3Qg
Z2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQpOwo+ID4+Pgo+ID4+PiBSZXBvcnRlZC1i
eToga2J1aWxkIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gPj4+IFJlcG9ydGVkLWJ5OiBH
YW8gWGlhbmcgPGhzaWFuZ2thb0Bhb2wuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBSdWkgTWln
dWVsIFNpbHZhIDxydWkuc2lsdmFAbGluYXJvLm9yZz4KPiA+Pj4gQWNrZWQtYnk6IEFsZXggRWxk
ZXIgPGVsZGVyQGtlcm5lbC5vcmc+Cj4gPj4+IC0tLQo+ID4+Pgo+ID4+PiB2MS0+djI6Cj4gPj4+
IGxrcEBpbnRlbDoKPiA+Pj4gICAtIGFkZGVkIGdyZXlidXNfcHJvdG9jb2xzLmggaW5jbHVkZSB0
byBzdmMuaCBoZWFkZXIKPiA+Pj4gQWxleCBFbGRlcjoKPiA+Pj4gICAtIHJlbW92ZSBleHRyYSBs
aW5lIGluIG9wZXJhdGlvbi5oCj4gPj4+Cj4gPj4+IExvb2tzIGxpa2UgbGtwIGNhbiBub3cgZmlu
ZCBtaXNzaW5nIGhlYWRlcnMgdGhhdCB3ZSBjYW4gbm90IDopLAo+ID4+PiBpdCBtdXN0IGJlIHRo
ZSBjb25maWcuIGJ1dCBpdCBpcyByaWdodC4KPiA+Pj4KPiA+Pj4gR3JlZyBwbGVhc2Ugbm90ZSB0
aGUgbmV3IGluY2x1ZGUgaW4gc3ZjLmggbWF5IG5lZWQgdG8gYmUgY2hhbmdlZAo+ID4+PiB3aGVu
IG1vdmluZyBoZWFkZXJzIHRvIGluY2x1ZGUvbGludXgKPiA+Pgo+ID4+IEFzIGEgdmVyc2lvbiBv
ZiB5b3VyIGZpcnN0IHBhdGNoIGlzIGFscmVhZHkgaW4gbXkgdHJlZSwgdGhpcyBvbmUgd2lsbAo+
ID4+IG5vdCBhcHBseSA6KAo+ID4+Cj4gPj4gQ2FuIHlvdSBqdXN0IHNlbmQgYSBmaXgtdXAgcGF0
Y2ggYWdhaW5zdCBteSBzdGFnaW5nLW5leHQgYnJhbmNoIGluc3RlYWQ/Cj4gPj4KPiA+PiB0aGFu
a3MsCj4gPj4KPiA+PiBncmVnIGstaAo+ID4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPj4gZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4gZGV2ZWxAbGlu
dXhkcml2ZXJwcm9qZWN0Lm9yZwo+ID4+IGh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo+ID4+Cj4gPgo+ID4gbGlu
dXgtbmV4dCBvZiAyMDE5MDgyOCBoYXMgdGhlc2Ugd2FybmluZ3M6Cj4gPgo+ID4gLi8uLi9pbmNs
dWRlL2xpbnV4L2dyZXlidXMvc3ZjLmg6OTE6MTg6IHdhcm5pbmc6ICdzdHJ1Y3QgZ2Jfc3ZjX2wy
X3RpbWVyX2NmZycgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90IGJlIHZp
c2libGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KPiA+IC4vLi4v
aW5jbHVkZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oOjE4ODozNDogd2FybmluZzogJ3N0cnVj
dCBnYl9ob3N0X2RldmljZScgZGVjbGFyZWQgaW5zaWRlIHBhcmFtZXRlciBsaXN0IHdpbGwgbm90
IGJlIHZpc2libGUgb3V0c2lkZSBvZiB0aGlzIGRlZmluaXRpb24gb3IgZGVjbGFyYXRpb24KPiA+
Cj4gPgo+ID4gQXJlIHRoZXkgZml4ZWQgYnkgc29tZSBvZiB0aGVzZSBwYXRjaGVzPwo+ID4KPiAK
PiBZZXMsIHRoaXMgWzBdIHNob3VsZCBmaXggaXQuCgpXaGljaCBJIGp1c3QgcXVldWVkIHVwLCBz
byBpdCBzaG91bGQgc2hvdyB1cCBpbiBsaW51eC1uZXh0IHRvbW9ycm93LgoKdGhhbmtzIQoKZ3Jl
ZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
