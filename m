Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FFE29FD3D
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 10:35:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C6CBE6087C
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 08:35:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B9037608FA; Wed, 28 Aug 2019 08:35:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E2A1D60B5B;
	Wed, 28 Aug 2019 08:35:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 273E16087C
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 08:35:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1B96B609D6; Wed, 28 Aug 2019 08:35:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 66F4E6087C
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 08:35:22 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0E95C214DA;
 Wed, 28 Aug 2019 08:35:20 +0000 (UTC)
Date: Wed, 28 Aug 2019 10:35:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Message-ID: <20190828083519.GA29752@kroah.com>
References: <20190827205917.8308-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827205917.8308-1-rui.silva@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDk6NTk6MTdQTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2
YSB3cm90ZToKPiBCZWZvcmUgbW92aW5nIGdyZXlidXMgY29yZSBvdXQgb2Ygc3RhZ2luZyBhbmQg
bW92aW5nIGhlYWRlciBmaWxlcyB0bwo+IGluY2x1ZGUvbGludXggc29tZSBncmV5YnVzIGhlYWRl
ciBmaWxlcyB3ZXJlIG1pc3NpbmcgdGhlIG5lY2Vzc2FyeQo+IGluY2x1ZGVzLiBUaGlzIHdvdWxk
IHRyaWdnZXIgY29tcGlsYXRpb24gZmFpbGx1cmVzIHdpdGggc29tZSBleGFtcGxlCj4gZXJyb3Jz
IGxvZ2dlZCBiZWxsb3cgZm9yIHdpdGggQ09ORklHX0tFUk5FTF9IRUFERVJfVEVTVD15Lgo+IAo+
IFNvLCBhZGQgdGhlIG5lY2Vzc2FyeSBoZWFkZXJzIHRvIGNvbXBpbGUgY2xlYW4gYmVmb3JlIHJl
bG9jYXRpbmcgdGhlCj4gaGVhZGVyIGZpbGVzLgo+IAo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVz
L2hkLmg6MjM6NTA6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTE2Jwo+ICAgaW50ICgqY3Bv
cnRfZGlzYWJsZSkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+
Cj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDoxMzE0OjI6IGVy
cm9yOiB1bmtub3duIHR5cGUgbmFtZSAnX191OCcKPiAgIF9fdTggZGF0YVswXTsKPiAgIF5+fn4K
PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI0OjUyOiBlcnJvcjogdW5rbm93biB0eXBl
IG5hbWUgJ3UxNicKPiAgIGludCAoKmNwb3J0X2Nvbm5lY3RlZCkoc3RydWN0IGdiX2hvc3RfZGV2
aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQu
aDoyNTo0ODogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4gICBpbnQgKCpjcG9ydF9m
bHVzaCkoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsgXn5+Cj4gLi9p
bmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyNjo1MTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1l
ICd1MTYnCj4gICBpbnQgKCpjcG9ydF9zaHV0ZG93bikoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpo
ZCwgdTE2IGNwb3J0X2lkLCBefn4KPiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjI3OjU6
IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAndTgnCj4gdTggcGhhc2UsIHVuc2lnbmVkIGludCB0
aW1lb3V0KTsKPiAgICAgIF5+Cj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyODo1MDog
ZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICd1MTYnCj4gICBpbnQgKCpjcG9ydF9xdWllc2NlKShz
dHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1MTYgY3BvcnRfaWQsIF5+fgo+IC4vaW5jbHVkZS9s
aW51eC9ncmV5YnVzL2hkLmg6Mjk6NTogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lICdzaXplX3Qn
Cj4gICAgICBzaXplX3QgcGVlcl9zcGFjZSwgdW5zaWduZWQgaW50IHRpbWVvdXQpOwo+ICAgICAg
Xn5+fn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvaGQuaDoyOTo1OiBub3RlOiAnc2l6ZV90
JyBpcyBkZWZpbmVkIGluIGhlYWRlciAnPHN0ZGRlZi5oPic7IGRpZCB5b3UgZm9yZ2V0IHRvICcj
aW5jbHVkZSA8c3RkZGVmLmg+Jz8KPiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjE6MToK
PiArI2luY2x1ZGUgPHN0ZGRlZi5oPgo+ICAvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMCAqLwo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2hkLmg6Mjk6NToKPiAgICAgIHNpemVf
dCBwZWVyX3NwYWNlLCB1bnNpZ25lZCBpbnQgdGltZW91dCk7Cj4gICAgICBefn5+fn4KPiAuL2lu
Y2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjMwOjQ4OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg
J3UxNicKPiAgIGludCAoKmNwb3J0X2NsZWFyKShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB1
MTYgY3BvcnRfaWQpOyBefn4KPiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjMyOjQ5OiBl
cnJvcjogdW5rbm93biB0eXBlIG5hbWUgJ3UxNicKPiAgIGludCAoKm1lc3NhZ2Vfc2VuZCkoc3Ry
dWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGRlc3RfY3BvcnRfaWQsIF5+fgo+IC4vaW5jbHVk
ZS9saW51eC9ncmV5YnVzL2hkLmg6MzM6MzI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSAnZ2Zw
X3QnCj4gc3RydWN0IGdiX21lc3NhZ2UgKm1lc3NhZ2UsIGdmcF90IGdmcF9tYXNrKTsgXn5+fn4K
PiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9oZC5oOjM1OjU1OiBlcnJvcjogdW5rbm93biB0eXBl
IG5hbWUgJ3UxNicKPiAgIGludCAoKmxhdGVuY3lfdGFnX2VuYWJsZSkoc3RydWN0IGdiX2hvc3Rf
ZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkKTsKPiAKPiBSZXBvcnRlZC1ieToga2J1aWxkIHRlc3Qg
cm9ib3QgPGxrcEBpbnRlbC5jb20+Cj4gUmVwb3J0ZWQtYnk6IEdhbyBYaWFuZyA8aHNpYW5na2Fv
QGFvbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUnVpIE1pZ3VlbCBTaWx2YSA8cnVpLnNpbHZhQGxp
bmFyby5vcmc+Cj4gQWNrZWQtYnk6IEFsZXggRWxkZXIgPGVsZGVyQGtlcm5lbC5vcmc+Cj4gLS0t
Cj4gCj4gdjEtPnYyOgo+IGxrcEBpbnRlbDoKPiAgIC0gYWRkZWQgZ3JleWJ1c19wcm90b2NvbHMu
aCBpbmNsdWRlIHRvIHN2Yy5oIGhlYWRlcgo+IEFsZXggRWxkZXI6Cj4gICAtIHJlbW92ZSBleHRy
YSBsaW5lIGluIG9wZXJhdGlvbi5oCj4gCj4gTG9va3MgbGlrZSBsa3AgY2FuIG5vdyBmaW5kIG1p
c3NpbmcgaGVhZGVycyB0aGF0IHdlIGNhbiBub3QgOiksCj4gaXQgbXVzdCBiZSB0aGUgY29uZmln
LiBidXQgaXQgaXMgcmlnaHQuCj4gCj4gR3JlZyBwbGVhc2Ugbm90ZSB0aGUgbmV3IGluY2x1ZGUg
aW4gc3ZjLmggbWF5IG5lZWQgdG8gYmUgY2hhbmdlZAo+IHdoZW4gbW92aW5nIGhlYWRlcnMgdG8g
aW5jbHVkZS9saW51eAoKQXMgYSB2ZXJzaW9uIG9mIHlvdXIgZmlyc3QgcGF0Y2ggaXMgYWxyZWFk
eSBpbiBteSB0cmVlLCB0aGlzIG9uZSB3aWxsCm5vdCBhcHBseSA6KAoKQ2FuIHlvdSBqdXN0IHNl
bmQgYSBmaXgtdXAgcGF0Y2ggYWdhaW5zdCBteSBzdGFnaW5nLW5leHQgYnJhbmNoIGluc3RlYWQ/
Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
