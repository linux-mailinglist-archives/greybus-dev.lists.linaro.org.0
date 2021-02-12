Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D761319B5A
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:44:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CFCE960E20
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 08:44:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C50DE666DC; Fri, 12 Feb 2021 08:44:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 302FE60F06;
	Fri, 12 Feb 2021 08:43:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7899660654
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:43:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 56C6660E20; Fri, 12 Feb 2021 08:43:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 5EDB260654
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 08:43:50 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 486B664E56;
 Fri, 12 Feb 2021 08:43:49 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lAU3Y-0006X6-2I; Fri, 12 Feb 2021 09:44:04 +0100
Date: Fri, 12 Feb 2021 09:44:04 +0100
From: Johan Hovold <johan@kernel.org>
To: Pritthijit Nath <pritthijit.nath@icloud.com>
Message-ID: <YCY/1LCP404AZxhm@hovoldconsulting.com>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212081835.9497-2-pritthijit.nath@icloud.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210212081835.9497-2-pritthijit.nath@icloud.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
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

T24gRnJpLCBGZWIgMTIsIDIwMjEgYXQgMDE6NDg6MzVQTSArMDUzMCwgUHJpdHRoaWppdCBOYXRo
IHdyb3RlOgo+IEZpeGVkIHRoZSBzcGVsbGluZyBvZiAndHJhbnNmZXJlZCcgdG8gJ3RyYW5zZmVy
cmVkJy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBQcml0dGhpaml0IE5hdGggPHByaXR0aGlqaXQubmF0
aEBpY2xvdWQuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyB8IDIg
Ky0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvaGlkLmMKPiBpbmRleCBhNTZjM2ZiNWQzNWEuLjZiMTlmZjQ3NDNhOSAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwo+ICsrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2hpZC5jCj4gQEAgLTI1NCw3ICsyNTQsNyBAQCBzdGF0aWMgaW50IF9f
Z2JfaGlkX291dHB1dF9yYXdfcmVwb3J0KHN0cnVjdCBoaWRfZGV2aWNlICpoaWQsIF9fdTggKmJ1
ZiwKPiAKPiAgCXJldCA9IGdiX2hpZF9zZXRfcmVwb3J0KGdoaWQsIHJlcG9ydF90eXBlLCByZXBv
cnRfaWQsIGJ1ZiwgbGVuKTsKPiAgCWlmIChyZXBvcnRfaWQgJiYgcmV0ID49IDApCj4gLQkJcmV0
Kys7IC8qIGFkZCByZXBvcnRfaWQgdG8gdGhlIG51bWJlciBvZiB0cmFuc2ZlcmVkIGJ5dGVzICov
Cj4gKwkJcmV0Kys7IC8qIGFkZCByZXBvcnRfaWQgdG8gdGhlIG51bWJlciBvZiB0cmFuc2ZlcnJp
ZCBieXRlcyAqLwoKWW91IG5vdyBtaXNzcGVsbGVkIHRyYW5zZmVycmVkIGluIGEgZGlmZmVyZW50
IHdheS4KCj4gCj4gIAlyZXR1cm4gMDsKPiAgfQoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
