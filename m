Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B4483319B85
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:55:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C622B607C3
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 08:55:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B74BE666DC; Fri, 12 Feb 2021 08:55:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A472460F06;
	Fri, 12 Feb 2021 08:55:05 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C5D8960654
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:55:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B61DA60E20; Fri, 12 Feb 2021 08:55:03 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id C549F60654
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:55:02 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 610BB64DEA;
 Fri, 12 Feb 2021 08:55:01 +0000 (UTC)
Date: Fri, 12 Feb 2021 09:54:59 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <YCZCY+UlzdwGU6pw@kroah.com>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212081835.9497-2-pritthijit.nath@icloud.com>
 <YCY/1LCP404AZxhm@hovoldconsulting.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCY/1LCP404AZxhm@hovoldconsulting.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Pritthijit Nath <pritthijit.nath@icloud.com>
Subject: Re: [greybus-dev] [PATCH 2/2] staging: greybus: Fixed a misspelling
	in hid.c
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

T24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMDk6NDQ6MDRBTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIEZyaSwgRmViIDEyLCAyMDIxIGF0IDAxOjQ4OjM1UE0gKzA1MzAsIFByaXR0aGlq
aXQgTmF0aCB3cm90ZToKPiA+IEZpeGVkIHRoZSBzcGVsbGluZyBvZiAndHJhbnNmZXJlZCcgdG8g
J3RyYW5zZmVycmVkJy4KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUHJpdHRoaWppdCBOYXRoIDxw
cml0dGhpaml0Lm5hdGhAaWNsb3VkLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jIHwgMiArLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvaGlkLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwo+ID4gaW5kZXggYTU2YzNm
YjVkMzVhLi42YjE5ZmY0NzQzYTkgMTAwNjQ0Cj4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9oaWQuYwo+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKPiA+IEBA
IC0yNTQsNyArMjU0LDcgQEAgc3RhdGljIGludCBfX2diX2hpZF9vdXRwdXRfcmF3X3JlcG9ydChz
dHJ1Y3QgaGlkX2RldmljZSAqaGlkLCBfX3U4ICpidWYsCj4gPiAKPiA+ICAJcmV0ID0gZ2JfaGlk
X3NldF9yZXBvcnQoZ2hpZCwgcmVwb3J0X3R5cGUsIHJlcG9ydF9pZCwgYnVmLCBsZW4pOwo+ID4g
IAlpZiAocmVwb3J0X2lkICYmIHJldCA+PSAwKQo+ID4gLQkJcmV0Kys7IC8qIGFkZCByZXBvcnRf
aWQgdG8gdGhlIG51bWJlciBvZiB0cmFuc2ZlcmVkIGJ5dGVzICovCj4gPiArCQlyZXQrKzsgLyog
YWRkIHJlcG9ydF9pZCB0byB0aGUgbnVtYmVyIG9mIHRyYW5zZmVycmlkIGJ5dGVzICovCj4gCj4g
WW91IG5vdyBtaXNzcGVsbGVkIHRyYW5zZmVycmVkIGluIGEgZGlmZmVyZW50IHdheS4KCk9vcHMs
IHdpbGwgZ28gcmV2ZXJ0IHRoaXMsIEkgbmVlZCBtb3JlIGNvZmZlZS4uLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
