Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A977A05BD
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 17:10:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9E52D617FA
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 15:09:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 92D82617FC; Wed, 28 Aug 2019 15:09:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1124F617F1;
	Wed, 28 Aug 2019 15:09:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3AC6F607A4
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 15:09:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 250F76162E; Wed, 28 Aug 2019 15:09:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
 by lists.linaro.org (Postfix) with ESMTPS id CC8E9607A4
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 15:09:40 +0000 (UTC)
Received: from [2601:1c0:6200:6e8::4f71]
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i2zZq-0004zO-Pw; Wed, 28 Aug 2019 15:09:38 +0000
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rui Miguel Silva <rui.silva@linaro.org>
References: <20190827205917.8308-1-rui.silva@linaro.org>
 <20190828083519.GA29752@kroah.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <0b740eb9-5ef4-8346-aa78-6b07bb060e7b@infradead.org>
Date: Wed, 28 Aug 2019 08:09:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190828083519.GA29752@kroah.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
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

T24gOC8yOC8xOSAxOjM1IEFNLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gT24gVHVlLCBB
dWcgMjcsIDIwMTkgYXQgMDk6NTk6MTdQTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2YSB3cm90ZToK
Pj4gQmVmb3JlIG1vdmluZyBncmV5YnVzIGNvcmUgb3V0IG9mIHN0YWdpbmcgYW5kIG1vdmluZyBo
ZWFkZXIgZmlsZXMgdG8KPj4gaW5jbHVkZS9saW51eCBzb21lIGdyZXlidXMgaGVhZGVyIGZpbGVz
IHdlcmUgbWlzc2luZyB0aGUgbmVjZXNzYXJ5Cj4+IGluY2x1ZGVzLiBUaGlzIHdvdWxkIHRyaWdn
ZXIgY29tcGlsYXRpb24gZmFpbGx1cmVzIHdpdGggc29tZSBleGFtcGxlCj4+IGVycm9ycyBsb2dn
ZWQgYmVsbG93IGZvciB3aXRoIENPTkZJR19LRVJORUxfSEVBREVSX1RFU1Q9eS4KPj4KPj4gU28s
IGFkZCB0aGUgbmVjZXNzYXJ5IGhlYWRlcnMgdG8gY29tcGlsZSBjbGVhbiBiZWZvcmUgcmVsb2Nh
dGluZyB0aGUKPj4gaGVhZGVyIGZpbGVzLgo+Pgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9o
ZC5oOjIzOjUwOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxNicKPj4gICBpbnQgKCpjcG9y
dF9kaXNhYmxlKShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQpOyBefn4K
Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDoxMzE0OjI6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSAnX191OCcKPj4gICBfX3U4IGRhdGFbMF07Cj4+ICAgXn5+
fgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI0OjUyOiBlcnJvcjogdW5rbm93biB0
eXBlIG5hbWUgJ3UxNicKPj4gICBpbnQgKCpjcG9ydF9jb25uZWN0ZWQpKHN0cnVjdCBnYl9ob3N0
X2RldmljZSAqaGQsIHUxNiBjcG9ydF9pZCk7IF5+fgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9oZC5oOjI1OjQ4OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxNicKPj4gICBpbnQgKCpj
cG9ydF9mbHVzaCkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+
Cj4+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6MjY6NTE6IGVycm9yOiB1bmtub3duIHR5
cGUgbmFtZSAndTE2Jwo+PiAgIGludCAoKmNwb3J0X3NodXRkb3duKShzdHJ1Y3QgZ2JfaG9zdF9k
ZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQsIF5+fgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9o
ZC5oOjI3OjU6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTgnCj4+IHU4IHBoYXNlLCB1bnNp
Z25lZCBpbnQgdGltZW91dCk7Cj4+ICAgICAgXn4KPj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMv
aGQuaDoyODo1MDogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4+ICAgaW50ICgqY3Bv
cnRfcXVpZXNjZSkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkLCBefn4K
Pj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyOTo1OiBlcnJvcjogdW5rbm93biB0eXBl
IG5hbWUgJ3NpemVfdCcKPj4gICAgICBzaXplX3QgcGVlcl9zcGFjZSwgdW5zaWduZWQgaW50IHRp
bWVvdXQpOwo+PiAgICAgIF5+fn5+fgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI5
OjU6IG5vdGU6ICdzaXplX3QnIGlzIGRlZmluZWQgaW4gaGVhZGVyICc8c3RkZGVmLmg+JzsgZGlk
IHlvdSBmb3JnZXQgdG8gJyNpbmNsdWRlIDxzdGRkZWYuaD4nPwo+PiAuL2luY2x1ZGUvbGludXgv
Z3JleWJ1cy9oZC5oOjE6MToKPj4gKyNpbmNsdWRlIDxzdGRkZWYuaD4KPj4gIC8qIFNQRFgtTGlj
ZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hk
Lmg6Mjk6NToKPj4gICAgICBzaXplX3QgcGVlcl9zcGFjZSwgdW5zaWduZWQgaW50IHRpbWVvdXQp
Owo+PiAgICAgIF5+fn5+fgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjMwOjQ4OiBl
cnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxNicKPj4gICBpbnQgKCpjcG9ydF9jbGVhcikoc3Ry
dWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+Cj4+IC4vaW5jbHVkZS9s
aW51eC9ncmV5YnVzL2hkLmg6MzI6NDk6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2Jwo+
PiAgIGludCAoKm1lc3NhZ2Vfc2VuZCkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGRl
c3RfY3BvcnRfaWQsIF5+fgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjMzOjMyOiBl
cnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ2dmcF90Jwo+PiBzdHJ1Y3QgZ2JfbWVzc2FnZSAqbWVz
c2FnZSwgZ2ZwX3QgZ2ZwX21hc2spOyBefn5+fgo+PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9o
ZC5oOjM1OjU1OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxNicKPj4gICBpbnQgKCpsYXRl
bmN5X3RhZ19lbmFibGUpKHN0cnVjdCBnYl9ob3N0X2RldmljZSAqaGQsIHUxNiBjcG9ydF9pZCk7
Cj4+Cj4+IFJlcG9ydGVkLWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPj4g
UmVwb3J0ZWQtYnk6IEdhbyBYaWFuZyA8aHNpYW5na2FvQGFvbC5jb20+Cj4+IFNpZ25lZC1vZmYt
Ynk6IFJ1aSBNaWd1ZWwgU2lsdmEgPHJ1aS5zaWx2YUBsaW5hcm8ub3JnPgo+PiBBY2tlZC1ieTog
QWxleCBFbGRlciA8ZWxkZXJAa2VybmVsLm9yZz4KPj4gLS0tCj4+Cj4+IHYxLT52MjoKPj4gbGtw
QGludGVsOgo+PiAgIC0gYWRkZWQgZ3JleWJ1c19wcm90b2NvbHMuaCBpbmNsdWRlIHRvIHN2Yy5o
IGhlYWRlcgo+PiBBbGV4IEVsZGVyOgo+PiAgIC0gcmVtb3ZlIGV4dHJhIGxpbmUgaW4gb3BlcmF0
aW9uLmgKPj4KPj4gTG9va3MgbGlrZSBsa3AgY2FuIG5vdyBmaW5kIG1pc3NpbmcgaGVhZGVycyB0
aGF0IHdlIGNhbiBub3QgOiksCj4+IGl0IG11c3QgYmUgdGhlIGNvbmZpZy4gYnV0IGl0IGlzIHJp
Z2h0Lgo+Pgo+PiBHcmVnIHBsZWFzZSBub3RlIHRoZSBuZXcgaW5jbHVkZSBpbiBzdmMuaCBtYXkg
bmVlZCB0byBiZSBjaGFuZ2VkCj4+IHdoZW4gbW92aW5nIGhlYWRlcnMgdG8gaW5jbHVkZS9saW51
eAo+IAo+IEFzIGEgdmVyc2lvbiBvZiB5b3VyIGZpcnN0IHBhdGNoIGlzIGFscmVhZHkgaW4gbXkg
dHJlZSwgdGhpcyBvbmUgd2lsbAo+IG5vdCBhcHBseSA6KAo+IAo+IENhbiB5b3UganVzdCBzZW5k
IGEgZml4LXVwIHBhdGNoIGFnYWluc3QgbXkgc3RhZ2luZy1uZXh0IGJyYW5jaCBpbnN0ZWFkPwo+
IAo+IHRoYW5rcywKPiAKPiBncmVnIGstaAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZGV2ZWxAbGludXhkcml2
ZXJwcm9qZWN0Lm9yZwo+IGh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAo+IAoKbGludXgtbmV4dCBvZiAyMDE5MDgy
OCBoYXMgdGhlc2Ugd2FybmluZ3M6CgouLy4uL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9zdmMuaDo5
MToxODogd2FybmluZzogJ3N0cnVjdCBnYl9zdmNfbDJfdGltZXJfY2ZnJyBkZWNsYXJlZCBpbnNp
ZGUgcGFyYW1ldGVyIGxpc3Qgd2lsbCBub3QgYmUgdmlzaWJsZSBvdXRzaWRlIG9mIHRoaXMgZGVm
aW5pdGlvbiBvciBkZWNsYXJhdGlvbgouLy4uL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9vcGVyYXRp
b24uaDoxODg6MzQ6IHdhcm5pbmc6ICdzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UnIGRlY2xhcmVkIGlu
c2lkZSBwYXJhbWV0ZXIgbGlzdCB3aWxsIG5vdCBiZSB2aXNpYmxlIG91dHNpZGUgb2YgdGhpcyBk
ZWZpbml0aW9uIG9yIGRlY2xhcmF0aW9uCgoKQXJlIHRoZXkgZml4ZWQgYnkgc29tZSBvZiB0aGVz
ZSBwYXRjaGVzPwoKdGhhbmtzLgotLSAKflJhbmR5Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2dyZXlidXMtZGV2Cg==
