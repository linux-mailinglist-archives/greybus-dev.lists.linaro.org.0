Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FE0356701
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:41:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B4E460861
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 08:41:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 502A860919; Wed,  7 Apr 2021 08:41:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 36F276187F;
	Wed,  7 Apr 2021 08:41:00 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 268DF60861
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:40:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id EF56F60919; Wed,  7 Apr 2021 08:40:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 0F48C60861
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 08:40:57 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B3F1611CC;
 Wed,  7 Apr 2021 08:40:55 +0000 (UTC)
Date: Wed, 7 Apr 2021 10:40:53 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "tiantao (H)" <tiantao6@huawei.com>
Message-ID: <YG1wFcQvKmYsziLt@kroah.com>
References: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
 <YG1rwdRzKk83RBmG@kroah.com>
 <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5126cb93-4227-8a0f-1421-7685ade4b2e2@huawei.com>
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

T24gV2VkLCBBcHIgMDcsIDIwMjEgYXQgMDQ6Mjk6NTlQTSArMDgwMCwgdGlhbnRhbyAoSCkgd3Jv
dGU6Cj4gCj4g5ZyoIDIwMjEvNC83IDE2OjIyLCBHcmVnIEtIIOWGmemBkzoKPiA+IE9uIFdlZCwg
QXByIDA3LCAyMDIxIGF0IDAyOjUwOjAzUE0gKzA4MDAsIFRpYW4gVGFvIHdyb3RlOgo+ID4gPiBk
aXNhYmxlX2lycSgpIGFmdGVyIHJlcXVlc3RfaXJxKCkgc3RpbGwgaGFzIGEgdGltZSBnYXAgaW4g
d2hpY2gKPiA+ID4gaW50ZXJydXB0cyBjYW4gY29tZS4gcmVxdWVzdF9pcnEoKSB3aXRoIElSUUZf
Tk9fQVVUT0VOIGZsYWcgd2lsbAo+ID4gPiBkaXNhYmxlIElSUSBhdXRvLWVuYWJsZSBiZWNhdXNl
IG9mIHJlcXVlc3RpbmcuCj4gPiA+IAo+ID4gPiB0aGlzIHBhdGNoIGlzIG1hZGUgYmFzZSBvbiAi
YWRkIElSUUZfTk9fQVVUT0VOIGZvciByZXF1ZXN0X2lycSIgd2hpY2gKPiA+ID4gaXMgYmVpbmcg
bWVyZ2VkOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9wYXRjaHdvcmsvcGF0Y2gvMTM4ODc2NS8K
PiA+IENhbiB5b3Ugd2FpdCB1bnRpbCB0aGF0IGlzIG1lcmdlZCBiZWZvcmUgc2VuZGluZyB0aGlz
IG91dCB0byB1cyBhcyB3ZQo+ID4gY2FuJ3QgZG8gYW55dGhpbmcgdW50aWwgdGhlbi4KPiAKPiB0
aGlzIGlzIGFscmVhZHkgaW4gbGludXgtbmV4dC5naXQuCj4gCj4gY2JlMTZmMyBnZW5pcnE6IEFk
ZCBJUlFGX05PX0FVVE9FTiBmb3IgcmVxdWVzdF9pcnEvbm1pKCkKClRoYXQncyBncmVhdCwgYnV0
IG5vdGUgdGhhdCBsaW51eC1uZXh0IGlzIGEgY29tYmluZWQgdHJlZSBvZiBhbGwKc3Vic3lzdGVt
IHRyZWVzLiAgSXQncyBpbXBvc3NpYmxlIGZvciBhIHN1YnN5c3RlbSB0cmVlIHRvIGluY2x1ZGUK
bGludXgtbmV4dCA6KQoKU28gaG93IGFib3V0IHdlIHdhaXQgdW50aWwgdGhpcyBnZXRzIGludG8g
TGludXMncyB0cmVlIHNvIHRoYXQgd2UgZG8gbm90CmFsbCBzdWRkZW5seSBnZXQgcHJvYmxlbXMg
aW4gb3VyIGluZGl2aWR1YWwgc3Vic3lzdGVtIHRyZWVzLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
