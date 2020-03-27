Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 361C6195116
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Mar 2020 07:29:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4E5D566035
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Mar 2020 06:29:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3D4AC66036; Fri, 27 Mar 2020 06:29:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB49066029;
	Fri, 27 Mar 2020 06:28:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D39F466023
 for <greybus-dev@lists.linaro.org>; Fri, 27 Mar 2020 06:28:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C5D7066029; Fri, 27 Mar 2020 06:28:39 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1AE5766035
 for <greybus-dev@lists.linaro.org>; Fri, 27 Mar 2020 06:28:37 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DC1C320705;
 Fri, 27 Mar 2020 06:28:35 +0000 (UTC)
Date: Fri, 27 Mar 2020 07:28:33 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Sasha Levin <sashal@kernel.org>
Message-ID: <20200327062833.GE1601217@kroah.com>
References: <20200326232357.7516-1-sashal@kernel.org>
 <20200326232357.7516-13-sashal@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200326232357.7516-13-sashal@kernel.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH AUTOSEL 5.5 13/28] staging: greybus:
 loopback_test: fix potential path truncations
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

T24gVGh1LCBNYXIgMjYsIDIwMjAgYXQgMDc6MjM6NDJQTSAtMDQwMCwgU2FzaGEgTGV2aW4gd3Jv
dGU6Cj4gRnJvbTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IAo+IFsgVXBzdHJl
YW0gY29tbWl0IGFlNjJjZjVlYjI3OTJkOWE4MThjMmQ5MzcyOGVkOTIxMTkzNTcwMTcgXQo+IAo+
IE5ld2VyIEdDQyB3YXJucyBhYm91dCBwb3NzaWJsZSB0cnVuY2F0aW9ucyBvZiB0d28gZ2VuZXJh
dGVkIHBhdGggbmFtZXMgYXMKPiB3ZSdyZSBjb25jYXRlbmF0aW5nIHRoZSBjb25maWd1cmFibGUg
c3lzZnMgYW5kIGRlYnVnZnMgcGF0aCBwcmVmaXhlcwo+IHdpdGggYSBmaWxlbmFtZSBhbmQgcGxh
Y2luZyB0aGUgcmVzdWx0cyBpbiBidWZmZXJzIG9mIHRoZSBzYW1lIHNpemUgYXMKPiB0aGUgbWF4
aW11bSBsZW5ndGggb2YgdGhlIHByZWZpeGVzLgo+IAo+IAlzbnByaW50ZihkLT5uYW1lLCBNQVhf
U1RSX0xFTiwgImdiX2xvb3BiYWNrJXUiLCBkZXZfaWQpOwo+IAo+IAlzbnByaW50ZihkLT5zeXNm
c19lbnRyeSwgTUFYX1NZU0ZTX1BBVEgsICIlcyVzLyIsCj4gCQkgdC0+c3lzZnNfcHJlZml4LCBk
LT5uYW1lKTsKPiAKPiAJc25wcmludGYoZC0+ZGVidWdmc19lbnRyeSwgTUFYX1NZU0ZTX1BBVEgs
ICIlc3Jhd19sYXRlbmN5XyVzIiwKPiAJCSB0LT5kZWJ1Z2ZzX3ByZWZpeCwgZC0+bmFtZSk7Cj4g
Cj4gRml4IHRoaXMgYnkgc2VwYXJhdGluZyB0aGUgbWF4aW11bSBwYXRoIGxlbmd0aCBmcm9tIHRo
ZSBtYXhpbXVtIHByZWZpeAo+IGxlbmd0aCBhbmQgcmVkdWNpbmcgdGhlIGxhdHRlciBlbm91Z2gg
dG8gZml0IHRoZSBnZW5lcmF0ZWQgc3RyaW5ncy4KPiAKPiBOb3RlIHRoYXQgd2UgYWxzbyBuZWVk
IHRvIHJlZHVjZSB0aGUgZGV2aWNlLW5hbWUgYnVmZmVyIHNpemUgYXMgR0NDCj4gaXNuJ3Qgc21h
cnQgZW5vdWdoIHRvIGZpZ3VyZSBvdXQgdGhhdCB3ZSBldmVyIG9ubHkgdXNlZCBNQVhfU1RSX0xF
Tgo+IGJ5dGVzIG9mIGl0Lgo+IAo+IEZpeGVzOiA2YjA2NThmNjg3ODYgKCJncmV5YnVzOiB0b29s
czogQWRkIHRvb2xzIGRpcmVjdG9yeSB0byBncmV5YnVzIHJlcG8gYW5kIGFkZCBsb29wYmFjayIp
Cj4gU2lnbmVkLW9mZi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgo+IExpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDAzMTIxMTAxNTEuMjIwMjgtNC1qb2hhbkBr
ZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGlu
dXhmb3VuZGF0aW9uLm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBTYXNoYSBMZXZpbiA8c2FzaGFsQGtl
cm5lbC5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNr
X3Rlc3QuYyB8IDE1ICsrKysrKysrLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90
b29scy9sb29wYmFja190ZXN0LmMKPiBpbmRleCA1Y2U3ZDZmYTA4NmNjLi4zZWU5MTA5YzM4ZjYw
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rl
c3QuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3Qu
Ywo+IEBAIC0xOSw2ICsxOSw3IEBACj4gICNpbmNsdWRlIDxzaWduYWwuaD4KPiAgCj4gICNkZWZp
bmUgTUFYX05VTV9ERVZJQ0VTIDEwCj4gKyNkZWZpbmUgTUFYX1NZU0ZTX1BSRUZJWCAweDgwCj4g
ICNkZWZpbmUgTUFYX1NZU0ZTX1BBVEgJMHgyMDAKPiAgI2RlZmluZSBDU1ZfTUFYX0xJTkUJMHgx
MDAwCj4gICNkZWZpbmUgU1lTRlNfTUFYX0lOVAkweDIwCj4gQEAgLTY3LDcgKzY4LDcgQEAgc3Ry
dWN0IGxvb3BiYWNrX3Jlc3VsdHMgewo+ICB9Owo+ICAKPiAgc3RydWN0IGxvb3BiYWNrX2Rldmlj
ZSB7Cj4gLQljaGFyIG5hbWVbTUFYX1NZU0ZTX1BBVEhdOwo+ICsJY2hhciBuYW1lW01BWF9TVFJf
TEVOXTsKPiAgCWNoYXIgc3lzZnNfZW50cnlbTUFYX1NZU0ZTX1BBVEhdOwo+ICAJY2hhciBkZWJ1
Z2ZzX2VudHJ5W01BWF9TWVNGU19QQVRIXTsKPiAgCXN0cnVjdCBsb29wYmFja19yZXN1bHRzIHJl
c3VsdHM7Cj4gQEAgLTkzLDggKzk0LDggQEAgc3RydWN0IGxvb3BiYWNrX3Rlc3Qgewo+ICAJaW50
IHN0b3BfYWxsOwo+ICAJaW50IHBvbGxfY291bnQ7Cj4gIAljaGFyIHRlc3RfbmFtZVtNQVhfU1RS
X0xFTl07Cj4gLQljaGFyIHN5c2ZzX3ByZWZpeFtNQVhfU1lTRlNfUEFUSF07Cj4gLQljaGFyIGRl
YnVnZnNfcHJlZml4W01BWF9TWVNGU19QQVRIXTsKPiArCWNoYXIgc3lzZnNfcHJlZml4W01BWF9T
WVNGU19QUkVGSVhdOwo+ICsJY2hhciBkZWJ1Z2ZzX3ByZWZpeFtNQVhfU1lTRlNfUFJFRklYXTsK
PiAgCXN0cnVjdCB0aW1lc3BlYyBwb2xsX3RpbWVvdXQ7Cj4gIAlzdHJ1Y3QgbG9vcGJhY2tfZGV2
aWNlIGRldmljZXNbTUFYX05VTV9ERVZJQ0VTXTsKPiAgCXN0cnVjdCBsb29wYmFja19yZXN1bHRz
IGFnZ3JlZ2F0ZV9yZXN1bHRzOwo+IEBAIC05MDcsMTAgKzkwOCwxMCBAQCBpbnQgbWFpbihpbnQg
YXJnYywgY2hhciAqYXJndltdKQo+ICAJCQl0Lml0ZXJhdGlvbl9tYXggPSBhdG9pKG9wdGFyZyk7
Cj4gIAkJCWJyZWFrOwo+ICAJCWNhc2UgJ1MnOgo+IC0JCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZp
eCwgTUFYX1NZU0ZTX1BBVEgsICIlcyIsIG9wdGFyZyk7Cj4gKwkJCXNucHJpbnRmKHQuc3lzZnNf
cHJlZml4LCBNQVhfU1lTRlNfUFJFRklYLCAiJXMiLCBvcHRhcmcpOwo+ICAJCQlicmVhazsKPiAg
CQljYXNlICdEJzoKPiAtCQkJc25wcmludGYodC5kZWJ1Z2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BB
VEgsICIlcyIsIG9wdGFyZyk7Cj4gKwkJCXNucHJpbnRmKHQuZGVidWdmc19wcmVmaXgsIE1BWF9T
WVNGU19QUkVGSVgsICIlcyIsIG9wdGFyZyk7Cj4gIAkJCWJyZWFrOwo+ICAJCWNhc2UgJ20nOgo+
ICAJCQl0Lm1hc2sgPSBhdG9sKG9wdGFyZyk7Cj4gQEAgLTk2MSwxMCArOTYyLDEwIEBAIGludCBt
YWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4gIAl9Cj4gIAo+ICAJaWYgKCFzdHJjbXAodC5z
eXNmc19wcmVmaXgsICIiKSkKPiAtCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZpeCwgTUFYX1NZU0ZT
X1BBVEgsICIlcyIsIHN5c2ZzX3ByZWZpeCk7Cj4gKwkJc25wcmludGYodC5zeXNmc19wcmVmaXgs
IE1BWF9TWVNGU19QUkVGSVgsICIlcyIsIHN5c2ZzX3ByZWZpeCk7Cj4gIAo+ICAJaWYgKCFzdHJj
bXAodC5kZWJ1Z2ZzX3ByZWZpeCwgIiIpKQo+IC0JCXNucHJpbnRmKHQuZGVidWdmc19wcmVmaXgs
IE1BWF9TWVNGU19QQVRILCAiJXMiLCBkZWJ1Z2ZzX3ByZWZpeCk7Cj4gKwkJc25wcmludGYodC5k
ZWJ1Z2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwgZGVidWdmc19wcmVmaXgpOwo+
ICAKPiAgCXJldCA9IGZpbmRfbG9vcGJhY2tfZGV2aWNlcygmdCk7Cj4gIAlpZiAocmV0KQo+IC0t
IAo+IDIuMjAuMQoKQUxzbyBhbHJlYWR5IGluIGFsbCB0cmVlcywgcGxlYXNlIGRvbid0IHRyeSB0
byBhZGQgaXQgYWdhaW4uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
