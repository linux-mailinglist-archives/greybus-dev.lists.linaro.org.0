Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 68537248626
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 15:36:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 93FCF6013A
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 13:36:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 866B1605D8; Tue, 18 Aug 2020 13:36:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_PASS autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8EF9060665;
	Tue, 18 Aug 2020 13:35:54 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5D1216013A
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 13:35:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 49F0860631; Tue, 18 Aug 2020 13:35:51 +0000 (UTC)
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by lists.linaro.org (Postfix) with ESMTPS id 0F6886013A
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 13:35:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36B86279;
 Tue, 18 Aug 2020 15:35:43 +0200 (CEST)
Date: Tue, 18 Aug 2020 16:35:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Vaishnav M A <vaishnav@beagleboard.org>
Message-ID: <20200818133525.GA9947@pendragon.ideasonboard.com>
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
 <20200818124815.11029-4-vaishnav@beagleboard.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200818124815.11029-4-vaishnav@beagleboard.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, elder@kernel.org,
 drew@beagleboard.org, arnd@arndb.de, mchehab+huawei@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 robertcnelson@beagleboard.org, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: Re: [greybus-dev] [RFC PATCH v2 3/3] Add Device Tree Bindings for
 mikroBUS port
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

SGkgVmFpc2huYXYsCgpUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4KCk9uIFR1ZSwgQXVnIDE4LCAy
MDIwIGF0IDA2OjE4OjE1UE0gKzA1MzAsIFZhaXNobmF2IE0gQSB3cm90ZToKPiBUaGlzIHBhdGNo
IGFkZHMgZGV2aWNlIHRyZWUgYmluZGluZ3MgZm9yIHRoZSBtaWtyb0JVUyBwb3J0LAo+IGRldmlj
ZSB0cmVlIG92ZXJsYXlzIGZvciB0aGUgbWlrcm9idXMgUG9ydCBvbiB0aGUgQmVhZ2xlQm9hcmQu
b3JnCj4gUG9ja2V0QmVhZ2xlIGlzIGF2YWlsYWJsZSBoZXJlIDoKPiBnaXRodWIuY29tL2JlYWds
ZWJvYXJkL2JiLm9yZy1vdmVybGF5cy9ibG9iL21hc3Rlci9zcmMvYXJtL1BCLU1JS1JPQlVTLTAu
ZHRzCj4gCj4gU2lnbmVkLW9mZi1ieTogVmFpc2huYXYgTSBBIDx2YWlzaG5hdkBiZWFnbGVib2Fy
ZC5vcmc+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9taXNjL2xpbnV4LG1pa3JvYnVzLnR4dCAgICAg
ICAgICB8IDgxICsrKysrKysrKysrKysrKysrKysKCldvdWxkIHlvdSBtaW5kIGNvbnZlcnRpbmcg
dGhpcyBiaW5kaW5nIGRvY3VtZW50IHRvIFlBTUwgPyBGb3IgbmV3CmJpbmRpbmdzIHdlJ3JlIHRy
eWluZyB0byBlbmZvcmNlIHVzYWdlIG9mIFlBTUwsIHRvIGF2b2lkIGluY3JlYXNpbmcgdGhlCmNv
bnZlcnNpb24gYmFja2xvZy4KCj4gIDEgZmlsZSBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspCj4g
IGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlz
Yy9saW51eCxtaWtyb2J1cy50eHQKPiAKPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21pc2MvbGludXgsbWlrcm9idXMudHh0IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL21pc2MvbGludXgsbWlrcm9idXMudHh0Cj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjk5Zjc1Y2FmNWYzNQo+IC0tLSAvZGV2L251
bGwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9saW51eCxt
aWtyb2J1cy50eHQKPiBAQCAtMCwwICsxLDgxIEBACj4gK21pa3JvQlVTIGFkZC1vbiBib2FyZCBz
b2NrZXQKPiArCj4gK1JlcXVpcmVkIHByb3BlcnRpZXM6Cj4gKy0gY29tcGF0aWJsZTogTXVzdCBi
ZSAibGludXgsbWlrcm9idXMiCj4gKy0gaTJjLWFkYXB0ZXI6ICBwaGFuZGxlIHRvIHRoZSBpMmMg
YWRhcHRlciBhdHRhY2hlZCB0byB0aGUgbWlrcm9idXMgc29ja2V0Lgo+ICstIHNwaS1tYXN0ZXI6
IHNwaSBidXMgbnVtYmVyIG9mIHRoZSBzcGktbWFzdGVyIGF0dGFjaGVkIHRvIHRoZSBtaWtyb2J1
cyBzb2NrZXQuCj4gKy0gc3BpLWNzOiBzcGkgY2hpcC1zZWxlY3QgbnVtYmVycyBjb3JyZXNwb25k
aW5nIHRvIHRoZSBjaGlwLXNlbGVjdHMKPiArCSAgb24gdGhlIG1pa3JvYnVzIHNvY2tldCgwIC0+
IGNoaXAgc2VsZWN0IGNvcnJlc3BvbmRpbmcgdG8gQ1MgcGluCj4gKwkgIDEgLT4gY2hpcCBzZWxl
Y3QgY29ycmVzcG9uZGluZyB0byBSU1QgcGluKS4KPiArLSBzZXJkZXYtY29udHJvbGxlcjogIHBo
YW5kbGUgdG8gdGhlIHVhcnQgcG9ydCBhdHRhY2hlZCB0byB0aGUgbWlrcm9idXMgc29ja2V0Lgo+
ICstIHB3bXM6IHBoYW5kbGUgdG8gdGhlIHB3bS1jb250cm9sbGVyIGNvcnJlc3BvbmRpbmcgdG8g
dGhlIG1pa3JvQlVTIFBXTSBwaW4uCj4gKy0gbWlrcm9idXMtZ3Bpb3M6IGdwaW9zIGFycmF5IGNv
cnJlc3BvbmRpbmcgdG8gR1BJT3Mgb24gdGhlIG1pa3JvQlVTIHBvcnQsCj4gKwkJICBmb3IgdGFy
Z2V0cyBub3Qgc3VwcG9ydGluZyB0aGUgQU4gcGluIG9uIHRoZSBtaWtyb0JVUyBwb3J0IGFzCj4g
KwkJICBHUElPLCB0aGUgbGVuZ3RoIG9mIHRoZSBncGlvcyBhcnJheSBjYW4gYmUgMTEsIG90aGVy
d2lzZSBpdAo+ICsJCSAgc2hvdWxkIGJlIDEyLgo+ICstIHBpbmN0cmwtbmFtZXM6IHBpbmN0cmwg
c3RhdGUgbmFtZXMgdG8gc3VwcG9ydCBhZGRpdGlvbmFsIHBpbiB1c2FnZS9kZXZpYXRpb25zCj4g
KwkJIGZyb20gbWlrcm9CVVMgc29ja2V0IHN0YW5kYXJkIHVzYWdlLCBtdXN0IGJlICJkZWZhdWx0
IiwKPiArCQkgInB3bV9kZWZhdWx0IiwgInB3bV9ncGlvIiwgInVhcnRfZGVmYXVsdCIsICJ1YXJ0
X2dwaW8iLAo+ICsJCSAiaTJjX2RlZmF1bHQiLCAiaTJjX2dwaW8iLCAic3BpX2RlZmF1bHQiLCAi
c3BpX2dwaW8iLCB0aGVzZQo+ICsJCSBwaW5jdHJsIG5hbWVzIHNob3VsZCBoYXZlIGNvcnJlc3Bv
bmRpbmcgcGluY3RybC1OIGVudHJpZXMgd2hpY2gKPiArCQkgY29ycmVzcG9uZHMgdG8gdGhlIHBp
bm11eCBzdGF0ZSBmb3IgdGhlIHBpbmdyb3VwLCBmb3IgZXhhbXBsZSwKPiArCQkgaTJjX2RlZmF1
bHQgY29ycmVzcG9uZHMgdG8gdGhlIHN0YXRlIHdoZXJlIHRoZSBJMkMgcGluIGdyb3VwCj4gKwkJ
IChTQ0wsU0RBKSBhcmUgY29uZmlndXJlZCBpbiBJMkMgbW9kZSBhbmQgaTJjX2dwaW8gbW9kZSBj
b3JyZXNwb25kcwo+ICsJCSB0byB0aGUgcGlubXV4IHN0YXRlIHdoZXJlIHRoZXNlIHBpbnMgYXJl
IGNvbmZpZ3VyZWQgYXMgR1BJTy4KPiArLSBwaW5jdHJsLU4gOiBwaW5jdHJsLSgwLTgpIGNvcnJl
c3BvbmRzIHRvIHRoZSBwaW5jdHJsIHN0YXRlcyBmb3IgdGhlIHN0YXRlcyBkZXNjcmliZWQKPiAr
CSAgICAgIGFib3ZlLgo+ICsKPiArRXhhbXBsZToKPiArCW1pa3JvYnVzLTAgewo+ICsJCWNvbXBh
dGlibGUgPSAibGludXgsbWlrcm9idXMiOwo+ICsJCXN0YXR1cyA9ICJva2F5IjsKPiArCQlwaW5j
dHJsLW5hbWVzID0gImRlZmF1bHQiLCAicHdtX2RlZmF1bHQiLCAicHdtX2dwaW8iLAo+ICsJCQkJ
InVhcnRfZGVmYXVsdCIsICJ1YXJ0X2dwaW8iLCAiaTJjX2RlZmF1bHQiLAo+ICsJCQkJImkyY19n
cGlvIiwgInNwaV9kZWZhdWx0IiwgInNwaV9ncGlvIjsKPiArCQlwaW5jdHJsLTAgPSA8Cj4gKwkJ
CSZQMl8wM19ncGlvX2lucHV0X3Bpbgo+ICsJCQkmUDFfMDRfZ3Bpb19waW4KPiArCQkJJlAxXzAy
X2dwaW9fcGluCj4gKwkJPjsKPiArCQlwaW5jdHJsLTEgPSA8JlAyXzAxX3B3bV9waW4+Owo+ICsJ
CXBpbmN0cmwtMiA9IDwmUDJfMDFfZ3Bpb19waW4+Owo+ICsJCXBpbmN0cmwtMyA9IDwKPiArCQkJ
JlAyXzA1X3VhcnRfcGluCj4gKwkJCSZQMl8wN191YXJ0X3Bpbgo+ICsJCT47Cj4gKwkJcGluY3Ry
bC00ID0gPAo+ICsJCQkmUDJfMDVfZ3Bpb19waW4KPiArCQkJJlAyXzA3X2dwaW9fcGluCj4gKwkJ
PjsKPiArCQlwaW5jdHJsLTUgPSA8Cj4gKwkJCSZQMl8wOV9pMmNfcGluCj4gKwkJCSZQMl8xMV9p
MmNfcGluCj4gKwkJPjsKPiArCQlwaW5jdHJsLTYgPSA8Cj4gKwkJCSZQMl8wOV9ncGlvX3Bpbgo+
ICsJCQkmUDJfMTFfZ3Bpb19waW4KPiArCQk+Owo+ICsJCXBpbmN0cmwtNyA9IDwKPiArCQkJJlAx
XzEyX3NwaV9waW4KPiArCQkJJlAxXzEwX3NwaV9waW4KPiArCQkJJlAxXzA4X3NwaV9zY2xrX3Bp
bgo+ICsJCQkmUDFfMDZfc3BpX2NzX3Bpbgo+ICsJCT47Cj4gKwkJcGluY3RybC04ID0gPAo+ICsJ
CQkmUDFfMTJfZ3Bpb19waW4KPiArCQkJJlAxXzEwX2dwaW9fcGluCj4gKwkJCSZQMV8wOF9ncGlv
X3Bpbgo+ICsJCQkmUDFfMDZfZ3Bpb19waW4KPiArCQk+Owo+ICsJCWkyYy1hZGFwdGVyID0gPCZp
MmMxPjsKPiArCQlzcGktbWFzdGVyID0gPDA+Owo+ICsJCXNwaS1jcyA9IDwwIDE+Owo+ICsJCXNl
cmRldi1jb250cm9sbGVyID0gPCZ1YXJ0ND47Cj4gKwkJcHdtcyA9IDwmZWhycHdtMSAwIDUwMDAw
MCAwPjsKPiArCQltaWtyb2J1cy1ncGlvcyA9IDwmZ3BpbzEgMTggMD4gLCA8JmdwaW8wIDIzIDA+
LAo+ICsJCQkJCTwmZ3BpbzAgMzAgMD4gLCA8JmdwaW8wIDMxIDA+LAo+ICsJCQkJCTwmZ3BpbzAg
MTUgMD4gLCA8JmdwaW8wIDE0IDA+LAo+ICsJCQkJCTwmZ3BpbzAgNCAwPiAsIDwmZ3BpbzAgMyAw
PiwKPiArCQkJCQk8JmdwaW8wIDIgMD4gLCA8JmdwaW8wIDUgMD4sCj4gKwkJCQkJPCZncGlvMiAy
NSAwPiAgLCA8JmdwaW8yIDMgMD47Cj4gKwl9Owo+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmls
ZQoKLS0gClJlZ2FyZHMsCgpMYXVyZW50IFBpbmNoYXJ0Cl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2dyZXlidXMtZGV2Cg==
