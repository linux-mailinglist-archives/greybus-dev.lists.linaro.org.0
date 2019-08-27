Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 670D49F101
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 19:00:09 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 842E6616FC
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 17:00:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7818E6183B; Tue, 27 Aug 2019 17:00:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5BE4061836;
	Tue, 27 Aug 2019 16:59:55 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 524A261805
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 16:59:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3F36B6182E; Tue, 27 Aug 2019 16:59:53 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1ADA361805
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 16:59:52 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B88072173E;
 Tue, 27 Aug 2019 16:59:50 +0000 (UTC)
Date: Tue, 27 Aug 2019 18:59:48 +0200
From: Greg KH <greg@kroah.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <20190827165948.GA16855@kroah.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190827133611.GE23584@kadam> <20190827134557.GA25038@kroah.com>
 <m3d0gqisua.fsf@gmail.com> <20190827154308.GD534@kroah.com>
 <m3blwaiotb.fsf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3blwaiotb.fsf@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 driverdev-devel@linuxdriverproject.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH 0/9] staging: move greybus core out of
	staging
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDQ6NTc6MjBQTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2
YSB3cm90ZToKPiBIaSBHcmVnLAo+IE9uIFR1ZSAyNyBBdWcgMjAxOSBhdCAxNjo0MywgR3JlZyBL
SCB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDAzOjMwOjIxUE0gKzAxMDAsIFJ1
aSBNaWd1ZWwgU2lsdmEgd3JvdGU6Cj4gPj4gSGksCj4gPj4gT24gVHVlIDI3IEF1ZyAyMDE5IGF0
IDE0OjQ1LCBHcmVnIEtyb2FoLUhhcnRtYW4gd3JvdGU6Cj4gPj4gPiBPbiBUdWUsIEF1ZyAyNywg
MjAxOSBhdCAwNDozNjoxMVBNICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+ID4+ID4+IEkg
Y2FuJ3QgY29tcGlsZSBncmV5YnVzIHNvIGl0J3MgaGFyZCB0byBydW4gU21hdGNoIG9uIGl0Li4u
ICBJIGhhdmUgYQo+ID4+ID4+IFNtYXRjaCB0aGluZyB3aGljaCBpZ25vcmVzIG1pc3NpbmcgaW5j
bHVkZXMgYW5kIGp1c3QgdHJpZXMgaXRzIGJlc3QuCj4gPj4gPj4gSXQgbW9zdGx5IGdlbmVyYXRl
cyBnYXJiYWdlIG91dHB1dCBidXQgYSBjb3VwbGUgb2YgdGhlc2UgbG9vayBsaWtlCj4gPj4gPj4g
cG90ZW50aWFsIGlzc3VlczoKPiA+PiA+Cj4gPj4gPiBXaHkgY2FuJ3QgeW91IGNvbXBpbGUgdGhl
IGNvZGU/Cj4gPj4gPgo+ID4+Cj4gPj4gSSB0aGluayB3ZSBhcmUgbWlzc2luZyBpbmNsdWRlcyBp
biBzb21lIG9mIHRoZQo+ID4+IGdyZXlidXMgaGVhZGVyIGZpbGVzLgo+ID4KPiA+IFJlYWxseT8g
IFdoZXJlPyAgQnVpbGRzIGZpbmUgaGVyZSBhbmQgcGFzc2VzIDAtZGF5IDopCj4gPgo+IAo+IFll
YWg7IGp1c3Qgc2VudCBhIHBhdGNoIHRvIGZpeCBpdC4KClRoYW5rcywgbm93IG1lcmdlZCEKCmdy
ZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
