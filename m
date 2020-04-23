Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B48951B5D2D
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Apr 2020 16:03:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 645EA619BE
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Apr 2020 14:03:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 55B60619D6; Thu, 23 Apr 2020 14:03:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 54947619D7;
	Thu, 23 Apr 2020 14:02:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EC982619BE
 for <greybus-dev@lists.linaro.org>; Thu, 23 Apr 2020 14:02:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DD569619D6; Thu, 23 Apr 2020 14:02:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id EE27A619BE
 for <greybus-dev@lists.linaro.org>; Thu, 23 Apr 2020 14:02:52 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6B0E2077D;
 Thu, 23 Apr 2020 14:02:51 +0000 (UTC)
Date: Thu, 23 Apr 2020 16:02:50 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: zenyu@tuta.io
Message-ID: <20200423140250.GA4127839@kroah.com>
References: <M4NtmuK--3-2@tuta.io>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <M4NtmuK--3-2@tuta.io>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] greybus: fix typo in GREYBUS help text
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

T24gV2VkLCBBcHIgMDgsIDIwMjAgYXQgMTA6Mjg6MTBBTSArMDIwMCwgemVueXVAdHV0YS5pbyB3
cm90ZToKPiBGcm9tOiBaZW55dSBTeSA8emVueXVAdHV0YS5pbz4KPiAKPiBGaXggdGhlIGFydGlj
bGUgdHlwbyAiYW4iIC0+ICJhIiBpbiBLY29uZmlnCj4gCj4gU2lnbmVkLW9mZi1ieTogWmVueXUg
U3kgPHplbnl1QHR1dGEuaW8+Cj4gLS0tCj4gYmFzZS1jb21taXQ6IGY1ZTk0ZDEwZTRjNDY4MzU3
MDE5ZTVjMjhkNDg0OTlmNjc3YjI4NGYKPiBkcml2ZXJzL2dyZXlidXMvS2NvbmZpZyB8IDIgKy0K
PiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL0tjb25maWcgYi9kcml2ZXJzL2dyZXlidXMvS2NvbmZp
Zwo+IGluZGV4IGI4NGZjYWY4Yi4uNTZjYmQ4N2ZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3Jl
eWJ1cy9LY29uZmlnCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL0tjb25maWcKPiBAQCAtMyw3ICsz
LDcgQEAgbWVudWNvbmZpZyBHUkVZQlVTCj4gwqDCoMKgwqDCoMKgwqAgdHJpc3RhdGUgIkdyZXli
dXMgc3VwcG9ydCIKPiDCoMKgwqDCoMKgwqDCoCBkZXBlbmRzIG9uIFNZU0ZTCj4gwqDCoMKgwqDC
oMKgwqAgLS0taGVscC0tLQo+IC3CoMKgwqDCoMKgwqDCoMKgIFRoaXMgb3B0aW9uIGVuYWJsZXMg
dGhlIEdyZXlidXMgZHJpdmVyIGNvcmUuwqAgR3JleWJ1cyBpcyBhbgo+ICvCoMKgwqDCoMKgwqDC
oMKgIFRoaXMgb3B0aW9uIGVuYWJsZXMgdGhlIEdyZXlidXMgZHJpdmVyIGNvcmUuwqAgR3JleWJ1
cyBpcyBhCj4gwqDCoMKgwqDCoMKgwqDCoMKgIGhhcmR3YXJlIHByb3RvY29sIHRoYXQgd2FzIGRl
c2lnbmVkIHRvIHByb3ZpZGUgVW5pcHJvIHdpdGggYQo+IMKgwqDCoMKgwqDCoMKgwqDCoCBzYW5l
IGFwcGxpY2F0aW9uIGxheWVyLsKgIEl0IHdhcyBvcmlnaW5hbGx5IGRlc2lnbmVkIGZvciB0aGUK
PiDCoMKgwqDCoMKgwqDCoMKgwqAgQVJBIHByb2plY3QsIGEgbW9kdWxlIHBob25lIHN5c3RlbSwg
YnV0IGhhcyBzaG93biB1cCBpbiBvdGhlcgo+IC0tCj4gMi4yNi4wCgpZb3UgY2FuJ3Qgc2VuZCBw
YXRjaGVzIGluIGh0bWwgZm9ybWF0LCBwbGVhc2UgdXNlIGdpdCBzZW5kLWVtYWlsIHRvIGRvCnRo
aXMgcHJvcGVybHkuCgp0aGFua3MsCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1k
ZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0
aW5mby9ncmV5YnVzLWRldgo=
