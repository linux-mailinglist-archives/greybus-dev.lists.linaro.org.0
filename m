Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C15BF64ACC
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jul 2019 18:35:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 82FB661758
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Jul 2019 16:35:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 767636177D; Wed, 10 Jul 2019 16:35:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BBB186177C;
	Wed, 10 Jul 2019 16:35:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E2BAE61719
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 16:35:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D1CE261778; Wed, 10 Jul 2019 16:35:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 118D661719
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 16:35:43 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BD06020844;
 Wed, 10 Jul 2019 16:35:41 +0000 (UTC)
Date: Wed, 10 Jul 2019 18:35:38 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Keyur Patel <iamkeyur96@gmail.com>
Message-ID: <20190710163538.GA30902@kroah.com>
References: <20190710122018.2250-1-iamkeyur96@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190710122018.2250-1-iamkeyur96@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, David Lin <dtwlin@gmail.com>
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

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDg6MjA6MTdBTSAtMDQwMCwgS2V5dXIgUGF0ZWwgd3Jv
dGU6Cj4gQWRkZWQgbWlzc2luZyBsb2dnaW5nIHN0YXRlbWVudCB3aGVuIGtmaWZvX2FsbG9jIGZh
aWxzLCB0byBpbXByb3ZlCj4gZGVidWdnaW5nLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEtleXVyIFBh
dGVsIDxpYW1rZXl1cjk2QGdtYWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvdWFydC5jIHwgNCArKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFy
dC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jCj4gaW5kZXggYjNiZmZlOTFhZTk5
Li44NmEzOTVhZTE3N2QgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFy
dC5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jCj4gQEAgLTg1Niw4ICs4
NTYsMTAgQEAgc3RhdGljIGludCBnYl91YXJ0X3Byb2JlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdi
cGh5X2RldiwKPiAgCj4gIAlyZXR2YWwgPSBrZmlmb19hbGxvYygmZ2JfdHR5LT53cml0ZV9maWZv
LCBHQl9VQVJUX1dSSVRFX0ZJRk9fU0laRSwKPiAgCQkJICAgICBHRlBfS0VSTkVMKTsKPiAtCWlm
IChyZXR2YWwpCj4gKwlpZiAocmV0dmFsKSB7Cj4gKwkJcHJfZXJyKCJrZmlmb19hbGxvYyBmYWls
ZWRcbiIpOwo+ICAJCWdvdG8gZXhpdF9idWZfZnJlZTsKPiArCX0KCllvdSBzaG91bGQgaGF2ZSBh
bHJlYWR5IGdvdHRlbiBhbiBlcnJvciBtZXNzYWdlIGZyb20gdGhlIGxvZyBpZiB0aGlzCmZhaWxz
LCBmcm9tIHRoZSBrbWFsbG9jX2FycmF5KCkgY2FsbCBmYWlsaW5nLCByaWdodD8KClNvIHdoeSBp
cyB0aGlzIG5lZWRlZD8gIFdlIGhhdmUgYmVlbiB0cnlpbmcgdG8gcmVtb3ZlIHRoZXNlIHR5cGVz
IG9mCm1lc3NhZ2VzIGFuZCBrZWVwIHRoZW0gaW4gdGhlICJyb290IiBwbGFjZSB3aGVyZSB0aGUg
ZmFpbHVyZSBoYXBwZW5zLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
