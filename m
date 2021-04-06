Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 33653355A30
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Apr 2021 19:21:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 553DF66706
	for <lists+greybus-dev@lfdr.de>; Tue,  6 Apr 2021 17:21:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4872C66742; Tue,  6 Apr 2021 17:21:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,UNPARSEABLE_RELAY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 010A266706;
	Tue,  6 Apr 2021 17:21:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9F32A619C1
 for <greybus-dev@lists.linaro.org>; Tue,  6 Apr 2021 17:21:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 89984666FC; Tue,  6 Apr 2021 17:21:43 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0004.hostedemail.com
 [216.40.44.4])
 by lists.linaro.org (Postfix) with ESMTPS id 9D48B619C1
 for <greybus-dev@lists.linaro.org>; Tue,  6 Apr 2021 17:21:42 +0000 (UTC)
Received: from omf15.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
 by smtprelay05.hostedemail.com (Postfix) with ESMTP id C3182180428ED;
 Tue,  6 Apr 2021 17:21:41 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by
 omf15.hostedemail.com (Postfix) with ESMTPA id 601A2C4182; 
 Tue,  6 Apr 2021 17:21:40 +0000 (UTC)
Message-ID: <7d7be8bcc0e80d826083890ed7791070ad25e603.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Zhansaya Bagdauletkyzy
 <zhansayabagdaulet@gmail.com>
Date: Tue, 06 Apr 2021 10:21:38 -0700
In-Reply-To: <YGxhrLZPIPjILWUH@kroah.com>
References: <20210406124259.GA96537@zhans> <YGxhrLZPIPjILWUH@kroah.com>
User-Agent: Evolution 3.38.1-1 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 601A2C4182
X-Stat-Signature: c6sadr7ectuaniqta9h19aj9ajc7unsy
X-Rspamd-Server: rspamout04
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1+jIsA223eKF3R6VcYnwZUQdsfBWilGY3I=
X-HE-Tag: 1617729700-769365
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

T24gVHVlLCAyMDIxLTA0LTA2IGF0IDE1OjI3ICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFR1
ZSwgQXByIDA2LCAyMDIxIGF0IDA2OjQyOjU5UE0gKzA2MDAsIFpoYW5zYXlhIEJhZ2RhdWxldGt5
enkgd3JvdGU6Cj4gPiBNYXRjaCBuZXh0IGxpbmUgd2l0aCBvcGVuIHBhcmVudGhlc2VzIGJ5IGFk
ZGluZyB0YWJzL3NwYWNlcwo+ID4gdG8gY29uZm9ybSB3aXRoIExpbnV4IGtlcm5lbCBjb2Rpbmcg
c3R5bGUuCj4gPiBSZXBvcnRlZCBieSBjaGVja3BhdGNoLgpbXQo+ID4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2NhbWVyYS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
Y2FtZXJhLmMKW10KPiA+IEBAIC0zNzgsOCArMzc4LDggQEAgc3RydWN0IGFwX2NzaV9jb25maWdf
cmVxdWVzdCB7Cj4gPiDCoCNkZWZpbmUgR0JfQ0FNRVJBX0NTSV9DTEtfRlJFUV9NQVJHSU4JCTE1
MDAwMDAwMFUKPiA+IMKgCj4gPiAKPiA+IMKgc3RhdGljIGludCBnYl9jYW1lcmFfc2V0dXBfZGF0
YV9jb25uZWN0aW9uKHN0cnVjdCBnYl9jYW1lcmEgKmdjYW0sCj4gPiAtCQlzdHJ1Y3QgZ2JfY2Ft
ZXJhX2NvbmZpZ3VyZV9zdHJlYW1zX3Jlc3BvbnNlICpyZXNwLAo+ID4gLQkJc3RydWN0IGdiX2Nh
bWVyYV9jc2lfcGFyYW1zICpjc2lfcGFyYW1zKQo+ID4gKwkJCQkJICAgc3RydWN0IGdiX2NhbWVy
YV9jb25maWd1cmVfc3RyZWFtc19yZXNwb25zZSAqcmVzcCwKPiA+ICsJCQkJCSAgIHN0cnVjdCBn
Yl9jYW1lcmFfY3NpX3BhcmFtcyAqY3NpX3BhcmFtcykKPiAKPiBBbmQgbm93IHlvdSB2aW9sYXRl
IGFub3RoZXIgY29kaW5nIHN0eWxlIHJlcXVpcmVtZW50LCB3aGljaCBtZWFucwo+IHNvbWVvbmUg
d2lsbCBzZW5kIGFub3RoZXIgcGF0Y2ggdG8gZml4IHRoYXQgdXAgYW5kIGFyb3VuZCBhbmQgYXJv
dW5kIGl0Cj4gZ29lcy4uLgoKTm9uZSBvZiB0aGUgY29kaW5nIHN0eWxlIGRvY3VtZW50IGlzIGFu
IGFjdHVhbCByZXF1aXJlbWVudCBHcmVnLgpJdCdzIGFsbCBydWxlcyBvZiB0aHVtYi4gIFVzZWZ1
bCBydWxlcywgYnV0IG5vdCBoYXJkIGFuZCBmYXN0IHJpZ2h0PwoKVG8gbWUsIHRoZSBiaWdnZXN0
IGlzc3VlIHdpdGggdGhpcyBjb2RlIGlzbid0IHdoZXRoZXIgb3Igbm90IHRoZQpjb2RlIGlzIGFs
aWduZWQgYXQgb3BlbiBwYXJlbnRoZXNlcyBvciBzdGF5cyB3aXRoaW4gODAgY29sdW1ucywKYnV0
IGlzIHRoZSB1c2Ugb2YgMzArIGNoYXJhY3RlciBsZW5ndGggaWRlbnRpZmllcnMuCgpVc2luZyBp
ZGVudGlmaWVycyBvZiB0aGF0IGxlbmd0aCBtYWtlcyB1c2luZyA4MCBjb2x1bW4sIG9yIGV2ZW4K
MTAwIGNvbHVtbiBsZW5ndGggbGluZXMgaW5mZWFzaWJsZS4KClBlcmhhcHMgc2VlaW5nIGlmIGlu
Y2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oCmNvdWxkIGJlIHVwZGF0ZWQg
dG8gdXNlIHNob3J0ZXIgbGVuZ3RoIGlkZW50aWZpZXJzIG1pZ2h0IGJlIHVzZWZ1bC4KClRoZSBt
ZWRpYW4gbGVuZ3RoIGlkZW50aWZpZXIgdGhlcmUgaXMgfjI1IGNoYXJzIGxvbmcgYW5kIHRoZQpt
YXhpbXVtIGxlbmd0aCBpZGVudGlmaWVyIGlzIH41MCBjaGFycy4KCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
