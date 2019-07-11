Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D90E365227
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 09:01:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 11D9F61503
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 07:01:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0407F6181D; Thu, 11 Jul 2019 07:01:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8D86361507;
	Thu, 11 Jul 2019 07:00:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F258361506
 for <greybus-dev@lists.linaro.org>; Thu, 11 Jul 2019 07:00:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E724061503; Thu, 11 Jul 2019 07:00:47 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 78A9E61503
 for <greybus-dev@lists.linaro.org>; Thu, 11 Jul 2019 07:00:46 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D0D721019;
 Thu, 11 Jul 2019 07:00:44 +0000 (UTC)
Date: Thu, 11 Jul 2019 09:00:42 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Keyur Patel <iamkeyur96@gmail.com>
Message-ID: <20190711070042.GA28487@kroah.com>
References: <20190710122018.2250-1-iamkeyur96@gmail.com>
 <20190710163538.GA30902@kroah.com> <20190710142406.GA6669@keyur-pc>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710142406.GA6669@keyur-pc>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 David Lin <dtwlin@gmail.com>, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add logging statement
 when kfifo_alloc fails
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

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMTA6MjQ6MDZBTSAtMDQwMCwgS2V5dXIgUGF0ZWwgd3Jv
dGU6Cj4gT24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDY6MzU6MzhQTSArMDIwMCwgR3JlZyBLcm9h
aC1IYXJ0bWFuIHdyb3RlOgo+ID4gT24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDg6MjA6MTdBTSAt
MDQwMCwgS2V5dXIgUGF0ZWwgd3JvdGU6Cj4gPiA+IEFkZGVkIG1pc3NpbmcgbG9nZ2luZyBzdGF0
ZW1lbnQgd2hlbiBrZmlmb19hbGxvYyBmYWlscywgdG8gaW1wcm92ZQo+ID4gPiBkZWJ1Z2dpbmcu
Cj4gPiA+IAo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBLZXl1ciBQYXRlbCA8aWFta2V5dXI5NkBnbWFp
bC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIHwg
NCArKystCj4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCj4gPiA+IAo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFy
dC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jCj4gPiA+IGluZGV4IGIzYmZmZTkx
YWU5OS4uODZhMzk1YWUxNzdkIDEwMDY0NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy91YXJ0LmMKPiA+ID4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jCj4g
PiA+IEBAIC04NTYsOCArODU2LDEwIEBAIHN0YXRpYyBpbnQgZ2JfdWFydF9wcm9iZShzdHJ1Y3Qg
Z2JwaHlfZGV2aWNlICpnYnBoeV9kZXYsCj4gPiA+ICAKPiA+ID4gIAlyZXR2YWwgPSBrZmlmb19h
bGxvYygmZ2JfdHR5LT53cml0ZV9maWZvLCBHQl9VQVJUX1dSSVRFX0ZJRk9fU0laRSwKPiA+ID4g
IAkJCSAgICAgR0ZQX0tFUk5FTCk7Cj4gPiA+IC0JaWYgKHJldHZhbCkKPiA+ID4gKwlpZiAocmV0
dmFsKSB7Cj4gPiA+ICsJCXByX2Vycigia2ZpZm9fYWxsb2MgZmFpbGVkXG4iKTsKPiA+ID4gIAkJ
Z290byBleGl0X2J1Zl9mcmVlOwo+ID4gPiArCX0KPiA+IAo+ID4gWW91IHNob3VsZCBoYXZlIGFs
cmVhZHkgZ290dGVuIGFuIGVycm9yIG1lc3NhZ2UgZnJvbSB0aGUgbG9nIGlmIHRoaXMKPiA+IGZh
aWxzLCBmcm9tIHRoZSBrbWFsbG9jX2FycmF5KCkgY2FsbCBmYWlsaW5nLCByaWdodD8KPiA+IAo+
ID4gU28gd2h5IGlzIHRoaXMgbmVlZGVkPyAgV2UgaGF2ZSBiZWVuIHRyeWluZyB0byByZW1vdmUg
dGhlc2UgdHlwZXMgb2YKPiA+IG1lc3NhZ2VzIGFuZCBrZWVwIHRoZW0gaW4gdGhlICJyb290IiBw
bGFjZSB3aGVyZSB0aGUgZmFpbHVyZSBoYXBwZW5zLgo+ID4gCj4gPiB0aGFua3MsCj4gPiAKPiA+
IGdyZWcgay1oCj4gCj4gRGlkbid0IG5vdGljZSB0aGF0LiBJIGFncmVlIHRoYXQgdGhpcyB3aWxs
IHJlc3VsdCBvbmx5IGludG8gcmVkdW5kYW5jeS4gCj4gUXVpY2sgbG9vayBvdmVyIGZpbGVzIHJl
dmVhbCB0aGF0IHRoZXJlIGFyZSBtdWx0aXBsZSBwbGFjZXMKPiB3aGVyZSBwZW9wbGUgYXJlIHVz
aW5nIHByaW50IHN0YXRlbWVudHMgYWZ0ZXIgbWVtb3J5IGFsbG9jYXRpb24gZmFpbHMuIAo+IFNo
b3VsZCBJIGdvIGFoZWFkIGFuZCBzZW5kIHBhdGNoZXMgdG8gcmVtb3ZlIHRob3NlCj4gcmVkdW5k
YW50IHByaW50IHN0YXRlbWVudHM/CgpJdCBhbGwgZGVwZW5kcyBvbiB3aGVyZSBpbiB0aGUga2Vy
bmVsIHRob3NlIGFyZS4gIFNvbWUgc3Vic3lzdGVtcyB3YW50Cm1pbm9yIGNsZWFudXBzIGxpa2Ug
dGhpcywgYnV0IG1vc3QgZG8gbm90LiAgU28gdW5sZXNzIHRoZSBpc3N1ZSB5b3UgZmluZAppcyBp
biB0aGUgZHJpdmVycy9zdGFnaW5nLyBkaXJlY3RvcnksIEkgd291bGQgbm90IHdvcnJ5IGFib3V0
IGl0LgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3Jl
eWJ1cy1kZXYK
