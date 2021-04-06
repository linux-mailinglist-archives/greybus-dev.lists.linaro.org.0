Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E235550C
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Apr 2021 15:27:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 572916090B
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Apr 2021 13:27:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4BFAC622F1; Tue,  6 Apr 2021 13:27:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 18636619C1;
	Tue,  6 Apr 2021 13:27:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8CEEE6090B
 for <greybus-dev@lists.linaro.org>; Tue,  6 Apr 2021 13:27:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6943F60D73; Tue,  6 Apr 2021 13:27:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 844606090B
 for <greybus-dev@lists.linaro.org>; Tue,  6 Apr 2021 13:27:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C38E1613B8;
 Tue,  6 Apr 2021 13:27:10 +0000 (UTC)
Date: Tue, 6 Apr 2021 15:27:08 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Zhansaya Bagdauletkyzy <zhansayabagdaulet@gmail.com>
Message-ID: <YGxhrLZPIPjILWUH@kroah.com>
References: <20210406124259.GA96537@zhans>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210406124259.GA96537@zhans>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, outreachy-kernel@googlegroups.com,
 linux-staging@lists.linux.dev, johan@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Match parentheses
	alignment
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

T24gVHVlLCBBcHIgMDYsIDIwMjEgYXQgMDY6NDI6NTlQTSArMDYwMCwgWmhhbnNheWEgQmFnZGF1
bGV0a3l6eSB3cm90ZToKPiBNYXRjaCBuZXh0IGxpbmUgd2l0aCBvcGVuIHBhcmVudGhlc2VzIGJ5
IGFkZGluZyB0YWJzL3NwYWNlcwo+IHRvIGNvbmZvcm0gd2l0aCBMaW51eCBrZXJuZWwgY29kaW5n
IHN0eWxlLgo+IFJlcG9ydGVkIGJ5IGNoZWNrcGF0Y2guCj4gCj4gU2lnbmVkLW9mZi1ieTogWmhh
bnNheWEgQmFnZGF1bGV0a3l6eSA8emhhbnNheWFiYWdkYXVsZXRAZ21haWwuY29tPgo+IC0tLQo+
ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jYW1lcmEuYyB8IDEwICsrKysrLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvY2FtZXJhLmMgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9jYW1lcmEuYwo+IGluZGV4IGNkYmI0MmNkNDEzYi4uNWRjYTU4NTY5NGMwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2NhbWVyYS5jCj4gKysrIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvY2FtZXJhLmMKPiBAQCAtMjIwLDcgKzIyMCw3IEBAIHN0YXRpYyBp
bnQgZ2JfY2FtZXJhX29wZXJhdGlvbl9zeW5jX2ZsYWdzKHN0cnVjdCBnYl9jb25uZWN0aW9uICpj
b25uZWN0aW9uLAo+ICB9Cj4gIAo+ICBzdGF0aWMgaW50IGdiX2NhbWVyYV9nZXRfbWF4X3BrdF9z
aXplKHN0cnVjdCBnYl9jYW1lcmEgKmdjYW0sCj4gLQkJc3RydWN0IGdiX2NhbWVyYV9jb25maWd1
cmVfc3RyZWFtc19yZXNwb25zZSAqcmVzcCkKPiArCQkJCSAgICAgIHN0cnVjdCBnYl9jYW1lcmFf
Y29uZmlndXJlX3N0cmVhbXNfcmVzcG9uc2UgKnJlc3ApCj4gIHsKPiAgCXVuc2lnbmVkIGludCBt
YXhfcGt0X3NpemUgPSAwOwo+ICAJdW5zaWduZWQgaW50IGk7Cj4gQEAgLTM3OCw4ICszNzgsOCBA
QCBzdHJ1Y3QgYXBfY3NpX2NvbmZpZ19yZXF1ZXN0IHsKPiAgI2RlZmluZSBHQl9DQU1FUkFfQ1NJ
X0NMS19GUkVRX01BUkdJTgkJMTUwMDAwMDAwVQo+ICAKPiAgc3RhdGljIGludCBnYl9jYW1lcmFf
c2V0dXBfZGF0YV9jb25uZWN0aW9uKHN0cnVjdCBnYl9jYW1lcmEgKmdjYW0sCj4gLQkJc3RydWN0
IGdiX2NhbWVyYV9jb25maWd1cmVfc3RyZWFtc19yZXNwb25zZSAqcmVzcCwKPiAtCQlzdHJ1Y3Qg
Z2JfY2FtZXJhX2NzaV9wYXJhbXMgKmNzaV9wYXJhbXMpCj4gKwkJCQkJICAgc3RydWN0IGdiX2Nh
bWVyYV9jb25maWd1cmVfc3RyZWFtc19yZXNwb25zZSAqcmVzcCwKPiArCQkJCQkgICBzdHJ1Y3Qg
Z2JfY2FtZXJhX2NzaV9wYXJhbXMgKmNzaV9wYXJhbXMpCgpBbmQgbm93IHlvdSB2aW9sYXRlIGFu
b3RoZXIgY29kaW5nIHN0eWxlIHJlcXVpcmVtZW50LCB3aGljaCBtZWFucwpzb21lb25lIHdpbGwg
c2VuZCBhbm90aGVyIHBhdGNoIHRvIGZpeCB0aGF0IHVwIGFuZCBhcm91bmQgYW5kIGFyb3VuZCBp
dApnb2VzLi4uCgpTb3JyeSwgbm90IGdvaW5nIHRvIHRha2UgdGhpcy4KCmdyZWcgay1oCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1h
aWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGlu
YXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
