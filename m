Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 12AD7195110
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Mar 2020 07:28:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3CE05605D7
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Mar 2020 06:28:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2B2A06602A; Fri, 27 Mar 2020 06:28:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A14866029;
	Fri, 27 Mar 2020 06:28:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8080C605D7
 for <greybus-dev@lists.linaro.org>; Fri, 27 Mar 2020 06:28:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7080C66023; Fri, 27 Mar 2020 06:28:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 7B977605D7
 for <greybus-dev@lists.linaro.org>; Fri, 27 Mar 2020 06:28:14 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2727E20705;
 Fri, 27 Mar 2020 06:28:12 +0000 (UTC)
Date: Fri, 27 Mar 2020 07:28:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20200327062810.GD1601217@kroah.com>
References: <20200326232357.7516-1-sashal@kernel.org>
 <20200326232357.7516-12-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326232357.7516-12-sashal@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH AUTOSEL 5.5 12/28] staging: greybus:
 loopback_test: fix potential path truncation
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

T24gVGh1LCBNYXIgMjYsIDIwMjAgYXQgMDc6MjM6NDFQTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gRnJvbTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IAo+IFsgVXBzdHJl
YW0gY29tbWl0IGYxNjAyMzgzNDg2MzkzMmY5NWRmYWQxM2ZhYzNmYzQ3Zjc3ZDJmMjkgXQo+IAo+
IE5ld2VyIEdDQyB3YXJucyBhYm91dCBhIHBvc3NpYmxlIHRydW5jYXRpb24gb2YgYSBnZW5lcmF0
ZWQgc3lzZnMgcGF0aAo+IG5hbWUgYXMgd2UncmUgY29uY2F0ZW5hdGluZyBhIGRpcmVjdG9yeSBw
YXRoIHdpdGggYSBmaWxlIG5hbWUgYW5kCj4gcGxhY2luZyB0aGUgcmVzdWx0IGluIGEgYnVmZmVy
IHRoYXQgaXMgaGFsZiB0aGUgc2l6ZSBvZiB0aGUgbWF4aW11bQo+IGxlbmd0aCBvZiB0aGUgZGly
ZWN0b3J5IHBhdGggKHdoaWNoIGlzIHVzZXIgY29udHJvbGxlZCkuCj4gCj4gbG9vcGJhY2tfdGVz
dC5jOiBJbiBmdW5jdGlvbiAnb3Blbl9wb2xsX2ZpbGVzJzoKPiBsb29wYmFja190ZXN0LmM6NjUx
OjMxOiB3YXJuaW5nOiAnJXMnIGRpcmVjdGl2ZSBvdXRwdXQgbWF5IGJlIHRydW5jYXRlZCB3cml0
aW5nIHVwIHRvIDUxMSBieXRlcyBpbnRvIGEgcmVnaW9uIG9mIHNpemUgMjU1IFstV2Zvcm1hdC10
cnVuY2F0aW9uPV0KPiAgIDY1MSB8ICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiVzJXMi
LCBkZXYtPnN5c2ZzX2VudHJ5LCAiaXRlcmF0aW9uX2NvdW50Iik7Cj4gICAgICAgfCAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBefgo+IGxvb3BiYWNrX3Rlc3QuYzo2NTE6Mzogbm90ZTog
J3NucHJpbnRmJyBvdXRwdXQgYmV0d2VlbiAxNiBhbmQgNTI3IGJ5dGVzIGludG8gYSBkZXN0aW5h
dGlvbiBvZiBzaXplIDI1NQo+ICAgNjUxIHwgICBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCAi
JXMlcyIsIGRldi0+c3lzZnNfZW50cnksICJpdGVyYXRpb25fY291bnQiKTsKPiAgICAgICB8ICAg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn4KPiAKPiBGaXggdGhpcyBieSBtYWtpbmcgc3VyZSB0aGUgYnVmZmVyIGlz
IGxhcmdlIGVub3VnaCB0aGUgY29uY2F0ZW5hdGVkCj4gc3RyaW5ncy4KPiAKPiBGaXhlczogNmIw
NjU4ZjY4Nzg2ICgiZ3JleWJ1czogdG9vbHM6IEFkZCB0b29scyBkaXJlY3RvcnkgdG8gZ3JleWJ1
cyByZXBvIGFuZCBhZGQgbG9vcGJhY2siKQo+IEZpeGVzOiA5MjUwYzBlZTI2MjYgKCJncmV5YnVz
OiBMb29wYmFja190ZXN0OiB1c2UgcG9sbCBpbnN0ZWFkIG9mIGlub3RpZnkiKQo+IFNpZ25lZC1v
ZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KPiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9yLzIwMjAwMzEyMTEwMTUxLjIyMDI4LTMtam9oYW5Aa2VybmVsLm9yZwo+
IFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlv
bi5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgo+
IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0
LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMKPiBpbmRl
eCBiYTZmOTA1ZjI2ZmFkLi41Y2U3ZDZmYTA4NmNjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+IEBAIC02MzcsNyArNjM3LDcgQEAgaW50
IGZpbmRfbG9vcGJhY2tfZGV2aWNlcyhzdHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKPiAgc3RhdGlj
IGludCBvcGVuX3BvbGxfZmlsZXMoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCj4gIHsKPiAgCXN0
cnVjdCBsb29wYmFja19kZXZpY2UgKmRldjsKPiAtCWNoYXIgYnVmW01BWF9TVFJfTEVOXTsKPiAr
CWNoYXIgYnVmW01BWF9TWVNGU19QQVRIICsgTUFYX1NUUl9MRU5dOwo+ICAJY2hhciBkdW1teTsK
PiAgCWludCBmZHNfaWR4ID0gMDsKPiAgCWludCBpOwo+IC0tIAo+IDIuMjAuMQo+IAoKQWxyZWFk
eSBpbiBhbGwgc3RhYmxlIHJlbGVhc2VzLCBzbyBubyBuZWVkIHRvIGFkZCBpdCBhZ2Fpbi4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
