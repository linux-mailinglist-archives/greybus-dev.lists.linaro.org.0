Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F32B83567E7
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:24:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2516861957
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:24:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 15106665EE; Wed,  7 Apr 2021 09:24:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9976466748;
	Wed,  7 Apr 2021 09:23:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BC4E76092F
 for <greybus-dev@lists.linaro.org>; Wed, 31 Mar 2021 20:36:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A846A6186A; Wed, 31 Mar 2021 20:36:24 +0000 (UTC)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by lists.linaro.org (Postfix) with ESMTPS id F3FD16092F
 for <greybus-dev@lists.linaro.org>; Wed, 31 Mar 2021 20:36:22 +0000 (UTC)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3A0e7n4K3lt3cyUy4jZdcelwqjBepyeYIsi2QD?=
 =?us-ascii?q?101hICF9WsaTm9my2NES0hHpgDgcMUtQ+uyoEq+GXH/a6NpR6Y4eIb+tUGDdyQ?=
 =?us-ascii?q?mVBatl6pbvxCClJj3m+odmpMFdWoV3FdGYNzlHpOng5g3QKbsd6f2m1IztuuvE?=
 =?us-ascii?q?1XdqSmhRGthdxiN0EBySHEEzZCQuP/oEPaGR7MZGuDasEE5/Bq/QOlA+Q+PBq9?=
 =?us-ascii?q?fX/aiLXTc6BgUq4ATLrTSk5K+SKXal9yoeSD9GzPMe93HEmWXCiZmLgrWe8Fv8?=
 =?us-ascii?q?33WWx4lKkNHho+EzYfCku4wwEHHQrSqGIK5mQKaPuTgppvrH0idPrPDc5xE6P8?=
 =?us-ascii?q?py7HvNfma65Rv1sjOQtwoT1w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.81,293,1610406000"; d="scan'208";a="500983645"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Mar 2021 22:36:21 +0200
Date: Wed, 31 Mar 2021 22:36:21 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
In-Reply-To: <20210331202445.108678-1-martinsdecarvalhobeatriz@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2103312235040.3008@hadrien>
References: <20210331202445.108678-1-martinsdecarvalhobeatriz@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Cc: elder@kernel.org, outreachy-kernel@googlegroups.com,
 linux-staging@lists.linux.dev, hvaibhav.linux@gmail.com, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [Outreachy kernel] [PATCH] staging: greybus:
 arche-platform: Fix ending '(' warnings
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

CgpPbiBXZWQsIDMxIE1hciAyMDIxLCBCZWF0cml6IE1hcnRpbnMgZGUgQ2FydmFsaG8gd3JvdGU6
Cgo+IEZpeCBjaGVja3BhdGNoIGNoZWNrICJDSEVDSzogTGluZXMgc2hvdWxkIG5vdCBlbmQgd2l0
aCBhICcoJyIKPiBpbiBhcmNoZS1wbGF0Zm9ybS5jOjgwIGFuZCBhcmNoZS1wbGF0Zm9ybS5jOjE4
NC4KClBsZWFzZSB0cnkgdG8gZXhwcmVzcyB3aGF0IHlvdSBoYXZlIGRvbmUgYW5kIHdoeSwgd2l0
aG91dCB1c2luZyB0aGUgd29yZApGaXguICAiRml4IiBkb2Vzbid0IGV4cGxhaW4gd2hhdCB5b3Ug
aGF2ZSBkb25lLiAgSXQganVzdCBzYXlzIHRoYXQgeW91CmhhdmUgZG9uZSBzb21ldGhpbmcgdGhh
dCB5b3UgY29uc2lkZXIgaGFzIG1hZGUgdGhlIGNvZGUgYmV0dGVyLiAgQnV0IHRoZQpwZXJzb24g
cmVjZWl2aW5nIHRoZSBtZXNzYWdlIG1heSBoYXZlIHNvbWV0aGluZyBlbHNlIGluIG1pbmQuCgpq
dWxpYQoKPgo+IFNpZ25lZC1vZmYtYnk6IEJlYXRyaXogTWFydGlucyBkZSBDYXJ2YWxobyA8bWFy
dGluc2RlY2FydmFsaG9iZWF0cml6QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYyB8IDEwICsrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jIGIvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXJjaGUtcGxhdGZvcm0uYwo+IGluZGV4IGVlYmYwZGViMzlmNS4uZTM3NGRmYzBjOTJm
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBsYXRmb3JtLmMK
PiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jCj4gQEAgLTc3
LDkgKzc3LDggQEAgc3RhdGljIHZvaWQgYXJjaGVfcGxhdGZvcm1fc2V0X3N0YXRlKHN0cnVjdCBh
cmNoZV9wbGF0Zm9ybV9kcnZkYXRhICphcmNoZV9wZGF0YSwKPiAgfQo+Cj4gIC8qIFJlcXVpcmVz
IGFyY2hlX3BkYXRhLT53YWtlX2xvY2sgaXMgaGVsZCBieSBjYWxsaW5nIGNvbnRleHQgKi8KPiAt
c3RhdGljIHZvaWQgYXJjaGVfcGxhdGZvcm1fc2V0X3dha2VfZGV0ZWN0X3N0YXRlKAo+IC0JCQkJ
c3RydWN0IGFyY2hlX3BsYXRmb3JtX2RydmRhdGEgKmFyY2hlX3BkYXRhLAo+IC0JCQkJZW51bSBz
dmNfd2FrZWRldGVjdF9zdGF0ZSBzdGF0ZSkKPiArc3RhdGljIHZvaWQgYXJjaGVfcGxhdGZvcm1f
c2V0X3dha2VfZGV0ZWN0X3N0YXRlKHN0cnVjdCBhcmNoZV9wbGF0Zm9ybV9kcnZkYXRhICphcmNo
ZV9wZGF0YSwKPiArCQkJCQkJIGVudW0gc3ZjX3dha2VkZXRlY3Rfc3RhdGUgc3RhdGUpCj4gIHsK
PiAgCWFyY2hlX3BkYXRhLT53YWtlX2RldGVjdF9zdGF0ZSA9IHN0YXRlOwo+ICB9Cj4gQEAgLTE4
MSw5ICsxODAsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYXJjaGVfcGxhdGZvcm1fd2RfaXJxKGlu
dCBpcnEsIHZvaWQgKmRldmlkKQo+ICAJCQkJCQlXRF9TVEFURV9DT0xEQk9PVF9TVEFSVCkgewo+
ICAJCQkJCWFyY2hlX3BsYXRmb3JtX3NldF93YWtlX2RldGVjdF9zdGF0ZShhcmNoZV9wZGF0YSwK
PiAgCQkJCQkJCQkJICAgICBXRF9TVEFURV9DT0xEQk9PVF9UUklHKTsKPiAtCQkJCQlzcGluX3Vu
bG9ja19pcnFyZXN0b3JlKAo+IC0JCQkJCQkmYXJjaGVfcGRhdGEtPndha2VfbG9jaywKPiAtCQkJ
CQkJZmxhZ3MpOwo+ICsJCQkJCXNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJmFyY2hlX3BkYXRhLT53
YWtlX2xvY2ssCj4gKwkJCQkJCQkgICAgICAgZmxhZ3MpOwo+ICAJCQkJCXJldHVybiBJUlFfV0FL
RV9USFJFQUQ7Cj4gIAkJCQl9Cj4gIAkJCX0KPiAtLQo+IDIuMjUuMQo+Cj4gLS0KPiBZb3UgcmVj
ZWl2ZWQgdGhpcyBtZXNzYWdlIGJlY2F1c2UgeW91IGFyZSBzdWJzY3JpYmVkIHRvIHRoZSBHb29n
bGUgR3JvdXBzICJvdXRyZWFjaHkta2VybmVsIiBncm91cC4KPiBUbyB1bnN1YnNjcmliZSBmcm9t
IHRoaXMgZ3JvdXAgYW5kIHN0b3AgcmVjZWl2aW5nIGVtYWlscyBmcm9tIGl0LCBzZW5kIGFuIGVt
YWlsIHRvIG91dHJlYWNoeS1rZXJuZWwrdW5zdWJzY3JpYmVAZ29vZ2xlZ3JvdXBzLmNvbS4KPiBU
byB2aWV3IHRoaXMgZGlzY3Vzc2lvbiBvbiB0aGUgd2ViIHZpc2l0IGh0dHBzOi8vZ3JvdXBzLmdv
b2dsZS5jb20vZC9tc2dpZC9vdXRyZWFjaHkta2VybmVsLzIwMjEwMzMxMjAyNDQ1LjEwODY3OC0x
LW1hcnRpbnNkZWNhcnZhbGhvYmVhdHJpeiU0MGdtYWlsLmNvbS4KPgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QK
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
