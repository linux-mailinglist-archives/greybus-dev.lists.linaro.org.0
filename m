Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 19810149C4D
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jan 2020 19:30:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3C9FB60999
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jan 2020 18:30:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2FBB16088A; Sun, 26 Jan 2020 18:30:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 115E560999;
	Sun, 26 Jan 2020 18:30:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E1B09607B2
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 18:30:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D4D506090A; Sun, 26 Jan 2020 18:30:38 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 0289E607B2
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 18:30:38 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA16C206F0;
 Sun, 26 Jan 2020 18:30:36 +0000 (UTC)
Date: Sun, 26 Jan 2020 19:30:34 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <20200126183034.GA4086664@kroah.com>
References: <20200126083130.GA17725@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200126083130.GA17725@google.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 saurav.girepunje@hotmail.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix fw is NULL but
	dereferenced.
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

T24gU3VuLCBKYW4gMjYsIDIwMjAgYXQgMDI6MDE6MzBQTSArMDUzMCwgU2F1cmF2IEdpcmVwdW5q
ZSB3cm90ZToKPiBGaXggdGhlIHdhcm5pbmcgcmVwb3J0ZWQgYnkgY29jY2kgY2hlY2suCgpXaGF0
IGlzICJjb2NjaSBjaGVjayI/Cgo+IENoYW5nZXM6Cj4gCgpXaHkgYWRkIHRoYXQgbGluZT8KCj4g
SW4gcXVldWVfd29yayBmdyBkZXJlZmVyZW5jZSBiZWZvcmUgaXQgYWN0dWFsbHkgZ2V0IGFzc2ln
bmVkLgo+IG1vdmUgcXVldWVfd29yayBiZWZvcmUgZ2JfYm9vdHJvbV9zZXRfdGltZW91dC4KPiAK
PiBBcyBnYl9ib290cm9tX2dldF9maXJtd2FyZSAoKSByZXR1cm4gTkVYVF9SRVFfUkVBRFlfVE9f
Qk9PVAo+IG9ubHkgd2hlbiB0aGVyZSBpcyBubyBlcnJvciBhbmQgb2Zmc2V0ICsgc2l6ZSBpcyBh
Y3R1YWxseSBlcXVhbAo+IHRvIGZ3LT5zaXplLiBTbyBpbml0aWFsaXplZCBuZXh0X3JlcXVlc3Qg
dG8gTkVYVF9SRVFfR0VUX0ZJUk1XQVJFCj4gZm9yIHJldHVybiBpbiBvdGhlciBjYXNlLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IFNhdXJhdiBHaXJlcHVuamUgPHNhdXJhdi5naXJlcHVuamVAZ21haWwu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMgfCA2ICsrLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKQXMg
Sm9oYW4gc2FpZCwgdGhlcmUgYXJlIGEgbG90IG9mIHJlYWxseSBiYWQgInN0YXRpYyBjaGVja2lu
ZyIKdG9vbHMgb3V0IHRoZXJlIHRoYXQgY2FuIG5vdCBwcm9wZXJseSBwYXJzZSBDIGNvZGUuICBB
bHdheXMgdmVyaWZ5IGJ5CmhhbmQgd2hhdCB0aGUgdG9vbHMgc2FpZCBpcyB3cm9uZywgcmVhbGx5
IGlzIGFuIGlzc3VlIGJlZm9yZSBzZW5kaW5nIGEKcGF0Y2ggb3V0IGZvciBzb21ldGhpbmcgdGhh
dCBpcyBub3QgY29ycmVjdC4gIFRoaXMgbG9va3MgbGlrZSB5b3UgbmVlZAp0byB1c2UgYSBiZXR0
ZXIgdG9vbC4KCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
