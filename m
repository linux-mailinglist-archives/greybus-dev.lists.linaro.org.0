Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 476379EF3C
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 17:44:06 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 666B260EFB
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 15:44:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5919361805; Tue, 27 Aug 2019 15:44:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E180E61731;
	Tue, 27 Aug 2019 15:43:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E97F2607DB
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:43:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DC598616FC; Tue, 27 Aug 2019 15:43:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 9B21E607DB
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:43:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 60B8720578;
 Tue, 27 Aug 2019 15:43:45 +0000 (UTC)
Date: Tue, 27 Aug 2019 17:43:43 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Gao Xiang <gaoxiang25@huawei.com>
Message-ID: <20190827154343.GE534@kroah.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-2-gregkh@linuxfoundation.org>
 <20190826055119.4pbmf5ape224giwz@vireshk-i7>
 <20190827075802.GA29204@kroah.com>
 <20190827092036.GA138083@architecture4>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190827092036.GA138083@architecture4>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, yuchao0@huawei.com,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Viresh Kumar <vireshk@kernel.org>
Subject: Re: [greybus-dev] [PATCH 1/9] staging: greybus: fix up SPDX comment
	in .h files
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDU6MjA6MzZQTSArMDgwMCwgR2FvIFhpYW5nIHdyb3Rl
Ogo+IEhpIEdyZWcsCj4gCj4gT24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDk6NTg6MDJBTSArMDIw
MCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4gT24gTW9uLCBBdWcgMjYsIDIwMTkgYXQg
MTE6MjE6MTlBTSArMDUzMCwgVmlyZXNoIEt1bWFyIHdyb3RlOgo+ID4gPiBPbiAyNS0wOC0xOSwg
MDc6NTQsIEdyZWcgS3JvYWgtSGFydG1hbiB3cm90ZToKPiA+ID4gPiBXaGVuIHRoZXNlIGZpbGVz
IG9yaWdpbmFsbHkgZ290IGFuIFNQRFggdGFnLCBJIHVzZWQgLy8gaW5zdGVhZCBvZiAvKiAqLwo+
ID4gPiA+IGZvciB0aGUgLmggZmlsZXMuICBGaXggdGhpcyB1cCB0byB1c2UgLy8gcHJvcGVybHku
Cj4gPiA+ID4gCj4gPiA+ID4gQ2M6IFZpcmVzaCBLdW1hciA8dmlyZXNoa0BrZXJuZWwub3JnPgo+
ID4gPiA+IENjOiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Cj4gPiA+ID4gQ2M6IEFs
ZXggRWxkZXIgPGVsZGVyQGtlcm5lbC5vcmc+Cj4gPiA+ID4gQ2M6IGdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKPiA+ID4gPiBDYzogZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmcKPiA+ID4g
PiBTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRp
b24ub3JnPgo+ID4gPiA+IC0tLQo+ID4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9maXJt
d2FyZS5oICAgICAgICAgICAgICAgfCAyICstCj4gPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2diLWNhbWVyYS5oICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiAgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvZ2JwaHkuaCAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gPiA+ICBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzLmggICAgICAgICAgICAgICAgfCAyICstCj4gPiA+
ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNfYXV0aGVudGljYXRpb24uaCB8IDIg
Ky0KPiA+ID4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19maXJtd2FyZS5oICAg
ICAgIHwgMiArLQo+ID4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzX21hbmlm
ZXN0LmggICAgICAgfCAyICstCj4gPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXli
dXNfcHJvdG9jb2xzLmggICAgICB8IDIgKy0KPiA+ID4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvZ3JleWJ1c190cmFjZS5oICAgICAgICAgIHwgMiArLQo+ID4gPiA+ICBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9oZC5oICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiA+ID4gIGRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2ludGVyZmFjZS5oICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4g
PiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbWFuaWZlc3QuaCAgICAgICAgICAgICAgIHwgMiAr
LQo+ID4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9tb2R1bGUuaCAgICAgICAgICAgICAg
ICAgfCAyICstCj4gPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL29wZXJhdGlvbi5oICAg
ICAgICAgICAgICB8IDIgKy0KPiA+ID4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3BpbGli
LmggICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9zdmMuaCAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiA+ID4gIDE2IGZpbGVzIGNoYW5n
ZWQsIDE2IGluc2VydGlvbnMoKyksIDE2IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gQWNrZWQt
Ynk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+Cj4gPiAKPiA+IFRoYW5r
cyBmb3IgYWxsIG9mIHRoZSBhY2tzIQo+ID4gCj4gPiBncmVnIGstaAo+IAo+IEkgZm91bmQgc2lt
aWxhciBpc3N1ZXMgb2YgZ3JheWJ1cyB3aGVuIEkgdGVzdGVkIHRoZSBsYXRlc3Qgc3RhZ2luZy10
ZXN0aW5nCj4gCj4gSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxjb21tYW5kLWxpbmU+OjA6MDoKPiAu
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oOjQ1OjI6IGVycm9yOiB1
bmtub3duIHR5cGUgbmFtZSDigJhfX2xlMTbigJkKPiAgIF9fbGUxNiBzaXplOyAgLyogU2l6ZSBp
biBieXRlcyBvZiBoZWFkZXIgKyBwYXlsb2FkICovCj4gICBefn5+fn4KPiAuL2luY2x1ZGUvbGlu
dXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oOjQ2OjI6IGVycm9yOiB1bmtub3duIHR5cGUg
bmFtZSDigJhfX2xlMTbigJkKPiAgIF9fbGUxNiBvcGVyYXRpb25faWQ7IC8qIE9wZXJhdGlvbiB1
bmlxdWUgaWQgKi8KPiAgIF5+fn5+fgo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNf
cHJvdG9jb2xzLmg6NDc6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fdTjigJkKPiAg
IF9fdTggdHlwZTsgIC8qIEUuZyBHQl9JMkNfVFlQRV8qIG9yIEdCX0dQSU9fVFlQRV8qICovCj4g
ICBefn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDo0ODoy
OiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYX191OOKAmQo+ICAgX191OCByZXN1bHQ7ICAv
KiBSZXN1bHQgb2YgcmVxdWVzdCAoaW4gcmVzcG9uc2VzIG9ubHkpICovCj4gICBefn5+Cj4gLi9p
bmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDo0OToyOiBlcnJvcjogdW5r
bm93biB0eXBlIG5hbWUg4oCYX191OOKAmQo+ICAgX191OCBwYWRbMl07ICAvKiBtdXN0IGJlIHpl
cm8gKGlnbm9yZSB3aGVuIHJlYWQpICovCj4gICBefn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2dyZXli
dXMvZ3JleWJ1c19wcm90b2NvbHMuaDo1ODoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCY
X191OOKAmQo+ICAgX191OCBwaGFzZTsKPiAgIF5+fn4KPiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9ncmV5YnVzX3Byb3RvY29scy5oOjg4OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhf
X3U44oCZCj4gICBfX3U4IG1ham9yOwo+ICAgXn5+fgo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVz
L2dyZXlidXNfcHJvdG9jb2xzLmg6ODk6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9f
dTjigJkKPiAgIF9fdTggbWlub3I7Cj4gICBefn5+Cj4gLi9pbmNsdWRlL2xpbnV4L2dyZXlidXMv
Z3JleWJ1c19wcm90b2NvbHMuaDo5MzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5hbWUg4oCYX191
OOKAmQo+ICAgX191OCBtYWpvcjsKPiAgIF5+fn4KPiAuL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9n
cmV5YnVzX3Byb3RvY29scy5oOjk0OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhfX3U4
4oCZCj4gICBfX3U4IG1pbm9yOwo+ICAgXn5+fgo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVzL2dy
ZXlidXNfcHJvdG9jb2xzLmg6OTg6MjogZXJyb3I6IHVua25vd24gdHlwZSBuYW1lIOKAmF9fdTji
gJkKPiAgIF9fdTggYnVuZGxlX2lkOwo+ICAgXn5+fgo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVz
L2dyZXlidXNfcHJvdG9jb2xzLmg6MTAyOjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhf
X3U44oCZCj4gICBfX3U4IG1ham9yOwo+ICAgXn5+fgo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVz
L2dyZXlidXNfcHJvdG9jb2xzLmg6MTAzOjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhf
X3U44oCZCj4gICBfX3U4IG1pbm9yOwo+ICAgXn5+fgo+IC4vaW5jbHVkZS9saW51eC9ncmV5YnVz
L2dyZXlidXNfcHJvdG9jb2xzLmg6MTA4OjI6IGVycm9yOiB1bmtub3duIHR5cGUgbmFtZSDigJhf
X2xlMTbigJkKPiAgIF9fbGUxNiAgIHNpemU7Cj4gICBefn5+fn4KPiAuL2luY2x1ZGUvbGludXgv
Z3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oOjExMzoyOiBlcnJvcjogdW5rbm93biB0eXBlIG5h
bWUg4oCYX191OOKAmQo+ICAgX191OCAgIGRhdGFbMF07Cj4gICBefn5+Cj4gLi9pbmNsdWRlL2xp
bnV4L2dyZXlidXMvZ3JleWJ1c19wcm90b2NvbHMuaDoxMTg6MjogZXJyb3I6IHVua25vd24gdHlw
ZSBuYW1lIOKAmF9fbGUxNuKAmQo+ICAgX19sZTE2ICAgY3BvcnRfaWQ7Cj4gICBefn5+fn4KPiAu
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oOjEyMjoyOiBlcnJvcjog
dW5rbm93biB0eXBlIG5hbWUg4oCYX19sZTE24oCZCj4gICBfX2xlMTYgICBjcG9ydF9pZDsKPiAK
PiAuLiBhbmQgb3RoZXIgZmlsZXMuLi4KPiAKPiBOb3QgdmVyeSBzdXJlLi4uIGJ1dCBpdCBzZWVt
cyBpdCBjYW4gYmUgb2JzZXJ2ZWQgd2l0aCBhbGxtb2Rjb25maWcgb3IKPiBDT05GSUdfS0VSTkVM
X0hFQURFUl9URVNUPXkgYW5kIGZhaWwgbXkgY29tcGlsYXRpb24uLi4KPiBIb3BlIHRoYXQgb2Yg
c29tZSBoZWxwIChraW5kIHJlbWluZGVyLi4uKQoKQWgsIHRoYW5rIHlvdSBzbyBtdWNoIGZvciB0
aGlzLCBOT1cgdGhhdCBtYWtlcyBzZW5zZSB3aHkgSSBnb3QgdGhhdCBvZGQKa2J1aWxkIHdhcm5p
bmcgdGhhdCBJIGNvdWxkIG5vdCBmaWd1cmUgb3V0LgoKTGV0IG1lIGdvIGZpeCB0aGlzIHVwLCB0
aGFuayB5b3Ugc28gbXVjaC4KCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
