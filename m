Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5B11D1A9D
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 18:08:16 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9F4C765F88
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 16:08:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9249365F8D; Wed, 13 May 2020 16:08:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 98BF565F8B;
	Wed, 13 May 2020 16:07:59 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F287065F87
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 16:07:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E06EB65F89; Wed, 13 May 2020 16:07:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 98A8D65F87
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 16:07:53 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A815B204EC;
 Wed, 13 May 2020 16:07:52 +0000 (UTC)
Date: Wed, 13 May 2020 18:07:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Johan Hovold <johan@kernel.org>
Message-ID: <20200513160750.GA1362525@kroah.com>
References: <20200507185318.GA14393@embeddedor>
 <20200513150343.GZ25962@localhost>
 <20200513153918.GA1360420@kroah.com>
 <20200513154807.GA25962@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513154807.GA25962@localhost>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Replace zero-length
 array with flexible-array
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

T24gV2VkLCBNYXkgMTMsIDIwMjAgYXQgMDU6NDg6MDdQTSArMDIwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDA1OjM5OjE4UE0gKzAyMDAsIEdyZWcgS3Jv
YWgtSGFydG1hbiB3cm90ZToKPiA+IE9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDA1OjAzOjQzUE0g
KzAyMDAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPiA+ID4gT24gVGh1LCBNYXkgMDcsIDIwMjAgYXQg
MDE6NTM6MThQTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiA+ID4gPiBUaGUg
Y3VycmVudCBjb2RlYmFzZSBtYWtlcyB1c2Ugb2YgdGhlIHplcm8tbGVuZ3RoIGFycmF5IGxhbmd1
YWdlCj4gPiA+ID4gZXh0ZW5zaW9uIHRvIHRoZSBDOTAgc3RhbmRhcmQsIGJ1dCB0aGUgcHJlZmVy
cmVkIG1lY2hhbmlzbSB0byBkZWNsYXJlCj4gPiA+ID4gdmFyaWFibGUtbGVuZ3RoIHR5cGVzIHN1
Y2ggYXMgdGhlc2Ugb25lcyBpcyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlclsxXVsyXSwKPiA+ID4g
PiBpbnRyb2R1Y2VkIGluIEM5OToKPiA+ID4gPiAKPiA+ID4gPiBzdHJ1Y3QgZm9vIHsKPiA+ID4g
PiAgICAgICAgIGludCBzdHVmZjsKPiA+ID4gPiAgICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsK
PiA+ID4gPiB9Owo+IAo+ID4gPiA+ICBkcml2ZXJzL2dyZXlidXMvYXJwYy5oICAgICAgICAgICAg
ICAgICAgICB8ICAgIDIgLQo+ID4gPiA+ICBpbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19w
cm90b2NvbHMuaCB8ICAgNDQgKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4gPiA+IAo+
ID4gPiBJIG5vdGljZWQgR3JlZyBqdXN0IGFwcGxpZWQgdGhpcyBvbmUgdG8gaGlzIC10ZXN0aW5n
IGJyYW5jaCwgYnV0IGRvIHdlCj4gPiA+IHJlYWxseSB3YW50IHRoaXMgaW4gZ3JleWJ1c19wcm90
b2NvbHMuaCwgd2hpY2ggaXMgbWVhbnQgdG8gYmUgc2hhcmVkCj4gPiA+IHdpdGggdGhlIGZpcm13
YXJlIHNpZGU/IFBlcmhhcHMgbm90IGFuIGlzc3VlLCBqdXN0IGZpZ3VyZWQgSSdkIHBvaW50Cj4g
PiA+IHRoaXMgb3V0Lgo+ID4gCj4gPiBXaHkgbm90LCBpdCBzaG91bGQgYmUgdGhlIHNhbWUgdGhp
bmcsIHJpZ2h0PyAgTm8gbG9naWMgaGFzIGNoYW5nZWQgdGhhdAo+ID4gSSBzZWUuCj4gCj4gWWVz
LCB0aGUgc3RydWN0dXJlJ3MgdGhlIHNhbWUsIGJ1dCB0aGUgZmlybXdhcmUgdG9vbGNoYWluIG1h
eSBub3QKPiBleHBlY3QgZmxleGlibGUgYXJyYXlzLiBJIGJlbGlldmUgd2UncmUgaG9sZGluZyBi
YWNrIG9uIHRoZXNlIGNoYW5nZXMKPiBmb3IgdWFwaSBoZWFkZXJzIGFzIHdlbGwgZm9yIHRoYXQg
cmVhc29uPwo+IAo+IEFnYWluLCBwZXJoYXBzIG5vdCBhbiBpc3N1ZS4gV2UgY2FuIGp1c3QgbWFu
ZGF0ZSBmdyB0b29sY2hhaW5zIHRoYXQKPiBzdXBwb3J0IEM5OSBpZiB5b3Ugd2FudCB0byB1c2Ug
YW4gdW5tb2RpZmllZCBoZWFkZXIsIEkgZ3Vlc3MuCgpJIHRoaW5rIHdlIGNhbiBtYW5kYXRlIHRo
YXQgZm9yIG5vdywgbGV0J3Mgc2VlIGlmIGFueW9uZSBhY3R1YWxseSBidWlsZHMKZmlybXdhcmUg
YWdhaW5zdCB0aGlzIGhlYWRlciBmaWxlIGFueW1vcmUgOikKCmdyZWcgay1oCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
