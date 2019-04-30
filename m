Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (ec2-54-158-76-221.compute-1.amazonaws.com [54.158.76.221])
	by mail.lfdr.de (Postfix) with ESMTPS id 3546110276
	for <lists+greybus-dev@lfdr.de>; Wed,  1 May 2019 00:36:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 500A460F31
	for <lists+greybus-dev@lfdr.de>; Tue, 30 Apr 2019 22:36:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4340B61724; Tue, 30 Apr 2019 22:36:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI
	autolearn=disabled version=3.4.2
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 50604615C0;
	Tue, 30 Apr 2019 22:36:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F0F7960EF5
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 13:00:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DD9FA615C0; Tue, 30 Apr 2019 13:00:03 +0000 (UTC)
Received: from mail.osadl.at (178.115.242.59.static.drei.at [178.115.242.59])
 by lists.linaro.org (Postfix) with ESMTP id B5C5960EF5
 for <greybus-dev@lists.linaro.org>; Tue, 30 Apr 2019 13:00:01 +0000 (UTC)
Received: by mail.osadl.at (Postfix, from userid 1001)
 id D097A5C1015; Tue, 30 Apr 2019 14:59:09 +0200 (CEST)
Date: Tue, 30 Apr 2019 14:59:09 +0200
From: Nicholas Mc Guire <der.herr@hofr.at>
To: Dan Carpenter <dan.carpenter@oracle.com>
Message-ID: <20190430125909.GC26274@osadl.at>
References: <1556335645-7583-1-git-send-email-hofrat@osadl.org>
 <20190430095821.GD2269@kadam>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190430095821.GD2269@kadam>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 30 Apr 2019 22:36:43 +0000
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, David Lin <dtwlin@gmail.com>,
 greybus-dev@lists.linaro.org, Nicholas Mc Guire <hofrat@osadl.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: use proper return type
 for wait_for_completion_timeout
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

T24gVHVlLCBBcHIgMzAsIDIwMTkgYXQgMTI6NTg6MjFQTSArMDMwMCwgRGFuIENhcnBlbnRlciB3
cm90ZToKPiBPbiBTYXQsIEFwciAyNywgMjAxOSBhdCAwNToyNzoyNUFNICswMjAwLCBOaWNob2xh
cyBNYyBHdWlyZSB3cm90ZToKPiA+IHdhaXRfZm9yX2NvbXBsZXRpb25fdGltZW91dCgpIHJldHVy
bnMgdW5zaWduZWQgbG9uZyAoMCBvbiB0aW1lb3V0IG9yCj4gPiByZW1haW5pbmcgamlmZmllcykg
bm90IGludC4gCj4gPiAKPiAKPiBZZWFoLCBidXQgaXQncyBmaW5lIHRob3VnaCBiZWNhdXNlIDEw
MDAwIC8gMjU2IGZpdHMgaW50byBpbnQgd2l0aG91dCBhCj4gcHJvYmxlbS4KPiAKPiBJJ20gbm90
IHN1cmUgdGhpcyBzb3J0IG9mIHBhdGNoIGlzIHdvcnRoIGl0IHdoZW4gaXQncyBqdXN0IGEgc3R5
bGUKPiBkZWJhdGUgaW5zdGVhZCBvZiBhIGJ1Z2ZpeC4gIEknbSBhIGxpdHRsZSBiaXQgdG9ybiBh
Ym91dCB0aGlzLiAgSW4KPiBTbWF0Y2gsIEkgcnVuIGludG8gdGhpcyBpc3N1ZSBvbmUgaW4gYSB3
aGlsZSB3aGVyZSBTbWF0Y2ggZG9lc24ndCBrbm93Cj4gaWYgdGhlIHRpbWVvdXQgaXMgbGVzcyB0
aGFuIGludC4gIFJpZ2h0IG5vdyBJIGhhY2tlZCB0aGUgREIgdG8gc2F5IHRoYXQKPiB0aGVzZSBm
dW5jdGlvbnMgYWx3YXlzIHJldHVybiA8IElOVF9NQVguCj4gCj4gQW55d2F5LCBmb3Igc3VyZSB0
aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHNheSB0aGF0IGl0J3MganVzdCBhIGNsZWFudXAKPiBh
bmQgbm90IGEgYnVnZml4Lgo+Ckkga25vdyBpdHMgbm90IGEgZnVuY3Rpb25hbCBidWcgaXRzICJv
bmx5IiBhbiBBUEkgdmlvbGF0aW9uIC0gdGhlIHByb2JsZW0KaXMgbW9yZSB0aGF0IGNvZGUgaXMg
b2Z0ZW4gY3V0JnBhc3QgYW5kIGF0IHNvbWUgcG9pbnQgaXQgbWF5IGJlIGEgCnByb2JsZW0gb3Ig
c29tZW9lIGV4cGVjdHMgYSBuZWdhdGl2ZSByZXR1cm4gdmFsdWUgd2l0aG91dCB0aGF0IHRoaXMg
ZXZlZgpjYW4gb2NjdXJlLgoKQnV0IHllcyAtIHRoZSBjb21taXQgbWVzc2FnZSBzaG91bGQgaGF2
ZSBzdGF0ZWQgdGhhdCB0aGlzIG5vbi1jb25mb3JtYW5jZQppbiB0aGlzIGNhc2UgaGFzIG5vIGVm
ZmVjdCAtIHdpbGwgcmVzZW5kLgoKdGh4IQpob2ZyYXQKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
