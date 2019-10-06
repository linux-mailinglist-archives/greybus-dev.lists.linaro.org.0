Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CD72ECD1B4
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Oct 2019 13:24:25 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 02FDF618D3
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Oct 2019 11:24:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EC86261928; Sun,  6 Oct 2019 11:24:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9A02A609E7;
	Sun,  6 Oct 2019 11:24:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7B62E6081D
 for <greybus-dev@lists.linaro.org>; Sun,  6 Oct 2019 11:24:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 65284608E1; Sun,  6 Oct 2019 11:24:12 +0000 (UTC)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by lists.linaro.org (Postfix) with ESMTPS id 119146081D
 for <greybus-dev@lists.linaro.org>; Sun,  6 Oct 2019 11:24:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.67,263,1566856800"; d="scan'208";a="321762246"
Received: from 81-65-53-202.rev.numericable.fr (HELO hadrien) ([81.65.53.202])
 by mail3-relais-sop.national.inria.fr with
 ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 06 Oct 2019 13:24:08 +0200
Date: Sun, 6 Oct 2019 13:24:08 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <2ed3bf96312dbd9abcd626868ce84e01a066b201.camel@perches.com>
Message-ID: <alpine.DEB.2.21.1910061322070.2515@hadrien>
References: <20191005210046.27224-1-gabrielabittencourt00@gmail.com>
 <20191006095042.GA2918514@kroah.com>
 <2ed3bf96312dbd9abcd626868ce84e01a066b201.camel@perches.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 outreachy-kernel@googlegroups.com, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Subject: Re: [greybus-dev] [Outreachy kernel] Re: [PATCH] staging: greybus:
 add blank line after declarations
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

CgpPbiBTdW4sIDYgT2N0IDIwMTksIEpvZSBQZXJjaGVzIHdyb3RlOgoKPiBPbiBTdW4sIDIwMTkt
MTAtMDYgYXQgMTE6NTAgKzAyMDAsIEdyZWcgS0ggd3JvdGU6Cj4gPiBPbiBTYXQsIE9jdCAwNSwg
MjAxOSBhdCAwNjowMDo0NlBNIC0wMzAwLCBHYWJyaWVsYSBCaXR0ZW5jb3VydCB3cm90ZToKPiA+
ID4gRml4IENIRUNLOiBhZGQgYmxhbmsgbGluZSBhZnRlciBkZWNsYXJhdGlvbnMKPiBbXQo+ID4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY29udHJvbC5oIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvY29udHJvbC5oCj4gW10KPiA+ID4gQEAgLTI0LDYgKzI0LDcgQEAg
c3RydWN0IGdiX2NvbnRyb2wgewo+ID4gPiAgCWNoYXIgKnZlbmRvcl9zdHJpbmc7Cj4gPiA+ICAJ
Y2hhciAqcHJvZHVjdF9zdHJpbmc7Cj4gPiA+ICB9Owo+ID4gPiArCj4gPiA+ICAjZGVmaW5lIHRv
X2diX2NvbnRyb2woZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYl9jb250cm9sLCBkZXYpCj4g
Pgo+ID4gTm8sIHRoZSBvcmlnaW5hbCBjb2RlIGlzICJiZXR0ZXIiIGhlcmUsIGl0J3MgYSBjb21t
b24gcGF0dGVybiBkZXNwaXRlCj4gPiB3aGF0IGNoZWNrcGF0Y2gucGwgdGVsbHMgeW91LCBzb3Jy
eS4KPgo+IFN0YXRpc3RpY3MgcGxlYXNlLgo+Cj4gSSBiZWxpZXZlIGl0J3Mgbm90IGEgY29tbW9u
IHBhdHRlcm4uCgpJIGdldCA0NjQgdGhhdCBoYXZlIGEgYmxhbmsgbGluZSBiZWZvcmUgdGhlIGNv
bnRhaW5lcl9vZiAjZGVmaW5lIGFuZCAxODUKdGhhdCBoYXZlIG5vIGJsYW5rIGxpbmUuCgpPZiB0
aGUgNDY0IHRoYXQgaGF2ZSBhIGJsYW5rIGxpbmUsIDEzNSBjb250YWluIGNsayBpbiB0aGUgZmls
ZSBuYW1lLgoKanVsaWEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
