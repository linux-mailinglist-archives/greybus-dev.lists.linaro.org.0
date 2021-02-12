Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42A319C43
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 11:03:17 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 490A460F06
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:03:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3C4BF66034; Fri, 12 Feb 2021 10:03:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 41A18618F4;
	Fri, 12 Feb 2021 10:02:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4668660649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 10:02:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2B37F60F06; Fri, 12 Feb 2021 10:02:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 20F7960649
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 10:02:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BD0C464E6B;
 Fri, 12 Feb 2021 10:02:54 +0000 (UTC)
Date: Fri, 12 Feb 2021 11:02:52 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Pritthijit Nath <pritthijit.nath@icloud.com>
Message-ID: <YCZSTJuDiPGaQ1yV@kroah.com>
References: <20210212095008.11741-1-pritthijit.nath@icloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212095008.11741-1-pritthijit.nath@icloud.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
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

T24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMDM6MjA6MDhQTSArMDUzMCwgUHJpdHRoaWppdCBOYXRo
IHdyb3RlOgo+IEZpeGVkIHRoZSBzcGVsbGluZyBvZiAndHJhbnNmZXJlZCcgdG8gJ3RyYW5zZmVy
cmVkJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQcml0dGhpaml0IE5hdGggPHByaXR0aGlqaXQubmF0
aEBpY2xvdWQuY29tPgo+IC0tLQo+ICBGaXhlZCB0aGUgdHlwbyBpbiB0aGUgcGF0Y2ggd2hpY2gg
d2FzIG1lYW50IHRvIGZpeCB0aGF0IHZlcnkgdHlwby4KPiAgUmVhbGx5IHNvcnJ5IGZvciBsYXN0
IHRpbWUuCj4gIEhvcGUgdGhpcyBkb2VzIG5vdCBoYXZlIGFueSBvdGhlciB0eXBvLgo+IAo+ICBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2hpZC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKPiBpbmRl
eCBhNTZjM2ZiNWQzNWEuLmFkYjkxMjg2ODAzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9oaWQuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCj4g
QEAgLTI1NCw3ICsyNTQsNyBAQCBzdGF0aWMgaW50IF9fZ2JfaGlkX291dHB1dF9yYXdfcmVwb3J0
KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIF9fdTggKmJ1ZiwKPiAgCj4gIAlyZXQgPSBnYl9oaWRf
c2V0X3JlcG9ydChnaGlkLCByZXBvcnRfdHlwZSwgcmVwb3J0X2lkLCBidWYsIGxlbik7Cj4gIAlp
ZiAocmVwb3J0X2lkICYmIHJldCA+PSAwKQo+IC0JCXJldCsrOyAvKiBhZGQgcmVwb3J0X2lkIHRv
IHRoZSBudW1iZXIgb2YgdHJhbnNmZXJlZCBieXRlcyAqLwo+ICsJCXJldCsrOyAvKiBhZGQgcmVw
b3J0X2lkIHRvIHRoZSBudW1iZXIgb2YgdHJhbnNmZXJyZWQgYnl0ZXMgKi8KPiAgCj4gIAlyZXR1
cm4gMDsKPiAgfQo+IC0tIAo+IDIuMjUuMQo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4gZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZGV2ZWxAbGludXhk
cml2ZXJwcm9qZWN0Lm9yZwo+IGh0dHA6Ly9kcml2ZXJkZXYubGludXhkcml2ZXJwcm9qZWN0Lm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaXZlcmRldi1kZXZlbAoKSGksCgpUaGlzIGlzIHRoZSBmcmll
bmRseSBwYXRjaC1ib3Qgb2YgR3JlZyBLcm9haC1IYXJ0bWFuLiAgWW91IGhhdmUgc2VudCBoaW0K
YSBwYXRjaCB0aGF0IGhhcyB0cmlnZ2VyZWQgdGhpcyByZXNwb25zZS4gIEhlIHVzZWQgdG8gbWFu
dWFsbHkgcmVzcG9uZAp0byB0aGVzZSBjb21tb24gcHJvYmxlbXMsIGJ1dCBpbiBvcmRlciB0byBz
YXZlIGhpcyBzYW5pdHkgKGhlIGtlcHQKd3JpdGluZyB0aGUgc2FtZSB0aGluZyBvdmVyIGFuZCBv
dmVyLCB5ZXQgdG8gZGlmZmVyZW50IHBlb3BsZSksIEkgd2FzCmNyZWF0ZWQuICBIb3BlZnVsbHkg
eW91IHdpbGwgbm90IHRha2Ugb2ZmZW5jZSBhbmQgd2lsbCBmaXggdGhlIHByb2JsZW0KaW4geW91
ciBwYXRjaCBhbmQgcmVzdWJtaXQgaXQgc28gdGhhdCBpdCBjYW4gYmUgYWNjZXB0ZWQgaW50byB0
aGUgTGludXgKa2VybmVsIHRyZWUuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1lc3NhZ2UgYmVj
YXVzZSBvZiB0aGUgZm9sbG93aW5nIGNvbW1vbiBlcnJvcihzKQphcyBpbmRpY2F0ZWQgYmVsb3c6
CgotIFRoaXMgbG9va3MgbGlrZSBhIG5ldyB2ZXJzaW9uIG9mIGEgcHJldmlvdXNseSBzdWJtaXR0
ZWQgcGF0Y2gsIGJ1dCB5b3UKICBkaWQgbm90IGxpc3QgYmVsb3cgdGhlIC0tLSBsaW5lIGFueSBj
aGFuZ2VzIGZyb20gdGhlIHByZXZpb3VzIHZlcnNpb24sCiAgb3IgcHJvcGVybHkgdmVyc2lvbiB0
aGUgc3ViamVjdCBsaW5lIG9mIHlvdXIgcGF0Y2guICBQbGVhc2UgcmVhZCB0aGUKICBzZWN0aW9u
IGVudGl0bGVkICJUaGUgY2Fub25pY2FsIHBhdGNoIGZvcm1hdCIgaW4gdGhlIGtlcm5lbCBmaWxl
LAogIERvY3VtZW50YXRpb24vU3VibWl0dGluZ1BhdGNoZXMgZm9yIHdoYXQgbmVlZHMgdG8gYmUg
ZG9uZSBoZXJlIHRvCiAgcHJvcGVybHkgZGVzY3JpYmUgdGhpcy4KCklmIHlvdSB3aXNoIHRvIGRp
c2N1c3MgdGhpcyBwcm9ibGVtIGZ1cnRoZXIsIG9yIHlvdSBoYXZlIHF1ZXN0aW9ucyBhYm91dApo
b3cgdG8gcmVzb2x2ZSB0aGlzIGlzc3VlLCBwbGVhc2UgZmVlbCBmcmVlIHRvIHJlc3BvbmQgdG8g
dGhpcyBlbWFpbCBhbmQKR3JlZyB3aWxsIHJlcGx5IG9uY2UgaGUgaGFzIGR1ZyBvdXQgZnJvbSB0
aGUgcGVuZGluZyBwYXRjaGVzIHJlY2VpdmVkCmZyb20gb3RoZXIgZGV2ZWxvcGVycy4KCnRoYW5r
cywKCmdyZWcgay1oJ3MgcGF0Y2ggZW1haWwgYm90Cl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRl
dkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2dyZXlidXMtZGV2Cg==
