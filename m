Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F714210C63
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Jul 2020 15:37:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2D0C36654F
	for <lists+greybus-dev@lfdr.de>; Wed,  1 Jul 2020 13:37:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2071566553; Wed,  1 Jul 2020 13:37:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 24B6F66566;
	Wed,  1 Jul 2020 13:37:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 554936654F
 for <greybus-dev@lists.linaro.org>; Wed,  1 Jul 2020 13:37:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 39EDA66561; Wed,  1 Jul 2020 13:37:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 56DF56654F
 for <greybus-dev@lists.linaro.org>; Wed,  1 Jul 2020 13:37:10 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CC4B2206BE;
 Wed,  1 Jul 2020 13:37:08 +0000 (UTC)
Date: Wed, 1 Jul 2020 15:36:55 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200701133655.GA2373798@kroah.com>
References: <cover.1592537217.git.vaibhav.sr@gmail.com>
 <e9aaa09c6688aa5ed8bddf51f5cd402bb8cf39b3.1592537217.git.vaibhav.sr@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e9aaa09c6688aa5ed8bddf51f5cd402bb8cf39b3.1592537217.git.vaibhav.sr@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH v3 6/6] staging: greybus: audio: Enable GB
 codec, audio module compilation.
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

T24gRnJpLCBKdW4gMTksIDIwMjAgYXQgMDQ6NTA6MjZQTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IEN1cnJlbnRseSB5b3UgY2FuJ3QgZW5hYmxlIHRoZSBHZXkgQnVzIEF1ZGlvIENv
ZGVjIGJlY2F1c2UgdGhlcmUgaXMgbm8KPiBlbnRyeSBmb3IgaXQgaW4gdGhlIEtjb25maWcgZmls
ZS4gT3JpZ2luYWxseSB0aGUgY29uZmlnIG5hbWUgd2FzIGdvaW5nCj4gdG8gYmUgQVVESU9fTVNN
ODk5NCBidXQgdGhhdCdzIG5vdCBjb3JyZWN0IGJlY2F1c2Ugb3RoZXIgdHlwZXMgb2YKPiBoYXJk
d2FyZSBhcmUgc3VwcG9ydGVkIG5vdy4gSSBoYXZlIGNob3NlbiB0aGUgbmFtZSBBVURJT19BUEJf
Q09ERUMKPiBpbnN0ZWFkLiAgQWxzbyBJIGhhZCB0byB1cGRhdGUgdGhlIGRlcGVuZGVuY2llcyBm
b3IgR1JFWUJVU19BVURJTyB0bwo+IG1ha2UgdGhlIGNvbXBpbGUgd29yay4KPiAKPiBTaWduZWQt
b2ZmLWJ5OiBWYWliaGF2IEFnYXJ3YWwgPHZhaWJoYXYuc3JAZ21haWwuY29tPgo+IFJldmlld2Vk
LWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL0tjb25maWcgIHwgMTQgKysrKysrKysrKysrKy0KPiAgZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUgfCAgNCArKy0tCj4gIDIgZmlsZXMgY2hhbmdl
ZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCkNhbiB5b3UgZml4IHRoZSBidWls
ZCBpc3N1ZXMgZm91bmQgYnkgdGhlIGJvdCBhbmQgcmVzZW5kPwoKdGhhbmtzLAoKZ3JlZyBrLWgK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1k
ZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0
cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
