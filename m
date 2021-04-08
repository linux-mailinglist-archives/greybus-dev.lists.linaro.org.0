Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B06AF357C96
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Apr 2021 08:26:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D7A11666FC
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Apr 2021 06:26:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C7A2B66707; Thu,  8 Apr 2021 06:26:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F0E7B66725;
	Thu,  8 Apr 2021 06:26:00 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5DEFF665E9
 for <greybus-dev@lists.linaro.org>; Thu,  8 Apr 2021 06:25:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4737366725; Thu,  8 Apr 2021 06:25:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 80EC1665E9
 for <greybus-dev@lists.linaro.org>; Thu,  8 Apr 2021 06:25:17 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 476F56113E;
 Thu,  8 Apr 2021 06:25:15 +0000 (UTC)
Date: Thu, 8 Apr 2021 08:25:13 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <YG6hyc8wWolwVbnQ@kroah.com>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
 <YG1rwdRzKk83RBmG@kroah.com>
 <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
 <YG1wFcQvKmYsziLt@kroah.com>
 <ca0261a9-7968-c9c9-b286-a9770a6d5096@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ca0261a9-7968-c9c9-b286-a9770a6d5096@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, linux-staging@lists.linux.dev, hvaibhav.linux@gmail.com,
 johan@kernel.org, greybus-dev@lists.linaro.org,
 Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: move to use request_irq
 by IRQF_NO_AUTOEN flag
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

T24gVGh1LCBBcHIgMDgsIDIwMjEgYXQgMDg6NTE6MDlBTSArMDgwMCwgdGlhbnRhbyAoSCkgd3Jv
dGU6Cj4gCj4g5ZyoIDIwMjEvNC83IDE2OjQwLCBHcmVnIEtIIOWGmemBkzoKPiA+IE9uIFdlZCwg
QXByIDA3LCAyMDIxIGF0IDA0OjI5OjU5UE0gKzA4MDAsIHRpYW50YW8gKEgpIHdyb3RlOgo+ID4g
PiDlnKggMjAyMS80LzcgMTY6MjIsIEdyZWcgS0gg5YaZ6YGTOgo+ID4gPiA+IE9uIFdlZCwgQXBy
IDA3LCAyMDIxIGF0IDAyOjUwOjAzUE0gKzA4MDAsIFRpYW4gVGFvIHdyb3RlOgo+ID4gPiA+ID4g
ZGlzYWJsZV9pcnEoKSBhZnRlciByZXF1ZXN0X2lycSgpIHN0aWxsIGhhcyBhIHRpbWUgZ2FwIGlu
IHdoaWNoCj4gPiA+ID4gPiBpbnRlcnJ1cHRzIGNhbiBjb21lLiByZXF1ZXN0X2lycSgpIHdpdGgg
SVJRRl9OT19BVVRPRU4gZmxhZyB3aWxsCj4gPiA+ID4gPiBkaXNhYmxlIElSUSBhdXRvLWVuYWJs
ZSBiZWNhdXNlIG9mIHJlcXVlc3RpbmcuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IHRoaXMgcGF0Y2gg
aXMgbWFkZSBiYXNlIG9uICJhZGQgSVJRRl9OT19BVVRPRU4gZm9yIHJlcXVlc3RfaXJxIiB3aGlj
aAo+ID4gPiA+ID4gaXMgYmVpbmcgbWVyZ2VkOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRj
aHdvcmsvcGF0Y2gvMTM4ODc2NS8KPiA+ID4gPiBDYW4geW91IHdhaXQgdW50aWwgdGhhdCBpcyBt
ZXJnZWQgYmVmb3JlIHNlbmRpbmcgdGhpcyBvdXQgdG8gdXMgYXMgd2UKPiA+ID4gPiBjYW4ndCBk
byBhbnl0aGluZyB1bnRpbCB0aGVuLgo+ID4gPiB0aGlzIGlzIGFscmVhZHkgaW4gbGludXgtbmV4
dC5naXQuCj4gPiA+IAo+ID4gPiBjYmUxNmYzIGdlbmlycTogQWRkIElSUUZfTk9fQVVUT0VOIGZv
ciByZXF1ZXN0X2lycS9ubWkoKQo+ID4gVGhhdCdzIGdyZWF0LCBidXQgbm90ZSB0aGF0IGxpbnV4
LW5leHQgaXMgYSBjb21iaW5lZCB0cmVlIG9mIGFsbAo+ID4gc3Vic3lzdGVtIHRyZWVzLiAgSXQn
cyBpbXBvc3NpYmxlIGZvciBhIHN1YnN5c3RlbSB0cmVlIHRvIGluY2x1ZGUKPiA+IGxpbnV4LW5l
eHQgOikKPiBNYXliZSB5b3UgY2FuIHJlZmVyZW5jZXRoaXMgdGFnIGh0dHBzOi8vZ2l0Lmtlcm5l
bC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpcC90aXAuZ2l0L3RhZy8/aD1pcnEtbm8t
YXV0b2VuLTIwMjEtMDMtMjUKCkluIHdoYXQgd2F5PwpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
