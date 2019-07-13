Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2459A67B0E
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jul 2019 17:49:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4778D60F4F
	for <lists+greybus-dev@lfdr.de>; Sat, 13 Jul 2019 15:49:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 354FC61513; Sat, 13 Jul 2019 15:49:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 39ED8617FC;
	Sat, 13 Jul 2019 15:48:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D9DAB60F4F
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 15:48:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C75A86152C; Sat, 13 Jul 2019 15:48:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B599A60F4F
 for <greybus-dev@lists.linaro.org>; Sat, 13 Jul 2019 15:48:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7480F2064A;
 Sat, 13 Jul 2019 15:48:45 +0000 (UTC)
Date: Sat, 13 Jul 2019 17:48:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vaishnav MA <mavaishnav007@gmail.com>
Message-ID: <20190713154843.GA12533@kroah.com>
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] Greybus For IoT : Click Board Support on
 Beaglebone Boards
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

CkE6IEJlY2F1c2UgaXQgbWVzc2VzIHVwIHRoZSBvcmRlciBpbiB3aGljaCBwZW9wbGUgbm9ybWFs
bHkgcmVhZCB0ZXh0LgpROiBXaHkgaXMgdG9wLXBvc3Rpbmcgc3VjaCBhIGJhZCB0aGluZz8KQTog
VG9wLXBvc3RpbmcuClE6IFdoYXQgaXMgdGhlIG1vc3QgYW5ub3lpbmcgdGhpbmcgaW4gZS1tYWls
PwoKQTogTm8uClE6IFNob3VsZCBJIGluY2x1ZGUgcXVvdGF0aW9ucyBhZnRlciBteSByZXBseT8K
Cmh0dHA6Ly9kYXJpbmdmaXJlYmFsbC5uZXQvMjAwNy8wNy9vbl90b3AKCk9uIFNhdCwgSnVsIDEz
LCAyMDE5IGF0IDA2OjAzOjAyUE0gKzA1MzAsIFZhaXNobmF2IE1BIHdyb3RlOgo+IEhpLAo+IAo+
IFRoYW5rcyBhIGxvdCBmb3IgeW91ciBxdWljayByZXNwb25zZSwgdGhlIHByb2plY3QgYWltcyB0
byBpbXBsZW1lbnQgc3VwcG9ydAo+IGZvciB0aGUgQ2xpY2tib2FyZHMobG9hZCB0aGUgY29ycmVz
cG9uZGluZyBrZXJuZWwgZHJpdmVyIGZvciB0aGUgY2xpY2tib2FyZAo+IHdpdGggY29ycmVzcG9u
ZGluZyBwYXJhbWV0ZXJzKSB0aHJvdWdoIGdyZXlidXMgbWFuaWZlc3RzIGluc3RlYWQgb2YgdGhl
Cj4gZXhpc3Rpbmcgc3VwcG9ydCB2aWEgRGV2aWNlIFRyZWUgb3ZlcmxheXMod2hpY2ggcmVxdWly
ZXMgYSByZWJvb3QgaW4KPiBCZWFnbGVib25lIHdoZW4gbG9hZGluZyBhIG5ldyBvdmVybGF5KSwg
IGRvZXMgZ3JleWJ1cyBjdXJyZW50bHkgYWxsb3cgdG8KPiBkZXNjcmliZSBkZXZpY2VzIG9uIEky
QywgU1BJLCBVQVJULCBldGMuIGJlaGluZCBhIGdyZXlidXMgZGV2aWNlPwoKWWVzLCBvZiBjb3Vy
c2UgaXQgZGVzY3JpYmVzIHRoZXNlIGRldmljZXMsIGJ1dCBpbiBhIHdheSBzbyB0aGF0IHRoZSBo
b3N0CmNhbiB0YWxrIHRvIHRoZSBkZXZpY2UuICBUaGUgc3BlY2lmaWNzIGFzIHRvIGhvdyB0aGUg
aTJjL3NwaS91YXJ0IGRldmljZQp0YWxrcyB0byB0aGUgInJlYWwiIGhhcmR3YXJlIG9uIHRoZSBk
ZXZpY2Ugc2lkZSBpcyB1cCB0byB0aGUKZmlybXdhcmUvY29kZSBpbiB0aGUgZGV2aWNlLiAgR3Jl
eWJ1cyBkb2VzIG5vdCBjYXJlIGF0IGFsbCBhYm91dCB0aGF0LAppdCBpcyBtZXJlbHkgYSB0cmFu
c3BvcnQgbGF5ZXIgZm9yIGRhdGEgdGhhdCBnb2VzIGFjcm9zcyB0aGVzZSB0eXBlcyBvZgpoYXJk
d2FyZSBidXNzZXMuCgo+IElmIG5vdAo+IHdoYXQgd291bGQgYmUgdGhlIGJlc3Qgd2F5IHRvIGRv
IGl0PyAoZ29pbmcgdGhyb3VnaCBzb21lIG9mIHRoZSBwcmV2aW91cwo+IGRpc2N1c3Npb25zIG9u
IHRoZSBtYWlpbmcgbGlzdCBJIHNhdyBzdWdnZXN0aW9ucyByZWdhcmRpbmcgYWRkaW5nIERldmlj
ZQo+IFRyZWUgU3VwcG9ydCwgaWYgaXQgaXMgZmVhc2libGUgY291bGQgeW91IHBsZWFzZSBlbGFi
b3JhdGUgb24gaG93IGl0IGNhbiBiZQo+IGltcGxlbWVudGVkIHNvIHRoYXQgSSBjYW4gdHJ5IHRv
IGRvIGl0LikKCklzIExpbnV4IHJ1bm5pbmcgb24gdGhlICJkZXZpY2UiIHNpZGU/ICBJIGRvbid0
IGtub3cgd2hhdCBhIENsaWNrYm9hcmQKaXMsIG5vciBob3cgdGhleSB3b3JrIGF0IGFsbCwgc29y
cnkuICBZb3UgY2FuIGxvb2sgYXQgdGhlIGZpcm13YXJlIHRoYXQKd2FzIHdyaXR0ZW4gZm9yIG1h
bnkgZ3JleWJ1cyBkZXZpY2VzIHVzaW5nIE51dHRYIGluIHRoZSBnaXRodWIgcmVwb3MgaWYKeW91
IHdhbnQgZXhhbXBsZXMgb2YgaG93IHRvIGhhbmRsZSB0aGlzIG9uIHRoZSBkZXZpY2Ugc2lkZS4g
IFBlcmhhcHMKdGhhdCBpcyB0aGUgcGllY2UgeW91IGFyZSBtaXNzaW5nPwoKdGhhbmtzLAoKZ3Jl
ZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
