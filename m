Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AD77F9EF37
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 17:43:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C94AC61805
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 15:43:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BCA6A6182E; Tue, 27 Aug 2019 15:43:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A41E361731;
	Tue, 27 Aug 2019 15:43:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 92AAE607DB
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:43:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7661F616FC; Tue, 27 Aug 2019 15:43:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 82174607DB
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 15:43:11 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 28DE220578;
 Tue, 27 Aug 2019 15:43:09 +0000 (UTC)
Date: Tue, 27 Aug 2019 17:43:08 +0200
From: Greg KH <greg@kroah.com>
To: Rui Miguel Silva <rmfrfs@gmail.com>
Message-ID: <20190827154308.GD534@kroah.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190827133611.GE23584@kadam> <20190827134557.GA25038@kroah.com>
 <m3d0gqisua.fsf@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <m3d0gqisua.fsf@gmail.com>
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

T24gVHVlLCBBdWcgMjcsIDIwMTkgYXQgMDM6MzA6MjFQTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2
YSB3cm90ZToKPiBIaSwKPiBPbiBUdWUgMjcgQXVnIDIwMTkgYXQgMTQ6NDUsIEdyZWcgS3JvYWgt
SGFydG1hbiB3cm90ZToKPiA+IE9uIFR1ZSwgQXVnIDI3LCAyMDE5IGF0IDA0OjM2OjExUE0gKzAz
MDAsIERhbiBDYXJwZW50ZXIgd3JvdGU6Cj4gPj4gSSBjYW4ndCBjb21waWxlIGdyZXlidXMgc28g
aXQncyBoYXJkIHRvIHJ1biBTbWF0Y2ggb24gaXQuLi4gIEkgaGF2ZSBhCj4gPj4gU21hdGNoIHRo
aW5nIHdoaWNoIGlnbm9yZXMgbWlzc2luZyBpbmNsdWRlcyBhbmQganVzdCB0cmllcyBpdHMgYmVz
dC4KPiA+PiBJdCBtb3N0bHkgZ2VuZXJhdGVzIGdhcmJhZ2Ugb3V0cHV0IGJ1dCBhIGNvdXBsZSBv
ZiB0aGVzZSBsb29rIGxpa2UKPiA+PiBwb3RlbnRpYWwgaXNzdWVzOgo+ID4KPiA+IFdoeSBjYW4n
dCB5b3UgY29tcGlsZSB0aGUgY29kZT8KPiA+Cj4gCj4gSSB0aGluayB3ZSBhcmUgbWlzc2luZyBp
bmNsdWRlcyBpbiBzb21lIG9mIHRoZQo+IGdyZXlidXMgaGVhZGVyIGZpbGVzLgoKUmVhbGx5PyAg
V2hlcmU/ICBCdWlsZHMgZmluZSBoZXJlIGFuZCBwYXNzZXMgMC1kYXkgOikKCnRoYW5rcywKCmdy
ZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
