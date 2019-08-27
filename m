Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 29E109E169
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 10:12:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C7D92618C5
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 08:12:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BB281618C7; Tue, 27 Aug 2019 08:12:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DDC0361885;
	Tue, 27 Aug 2019 08:11:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 205756080D
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 08:09:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 132BC60E23; Tue, 27 Aug 2019 08:09:10 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 27F1F6080D
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 08:09:08 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D64462173E;
 Tue, 27 Aug 2019 08:09:06 +0000 (UTC)
Date: Tue, 27 Aug 2019 09:58:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20190827075802.GA29204@kroah.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190825055429.18547-2-gregkh@linuxfoundation.org>
 <20190826055119.4pbmf5ape224giwz@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190826055119.4pbmf5ape224giwz@vireshk-i7>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Viresh Kumar <vireshk@kernel.org>, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 1/9] staging: greybus: fix up SPDX comment
	in .h files
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

T24gTW9uLCBBdWcgMjYsIDIwMTkgYXQgMTE6MjE6MTlBTSArMDUzMCwgVmlyZXNoIEt1bWFyIHdy
b3RlOgo+IE9uIDI1LTA4LTE5LCAwNzo1NCwgR3JlZyBLcm9haC1IYXJ0bWFuIHdyb3RlOgo+ID4g
V2hlbiB0aGVzZSBmaWxlcyBvcmlnaW5hbGx5IGdvdCBhbiBTUERYIHRhZywgSSB1c2VkIC8vIGlu
c3RlYWQgb2YgLyogKi8KPiA+IGZvciB0aGUgLmggZmlsZXMuICBGaXggdGhpcyB1cCB0byB1c2Ug
Ly8gcHJvcGVybHkuCj4gPiAKPiA+IENjOiBWaXJlc2ggS3VtYXIgPHZpcmVzaGtAa2VybmVsLm9y
Zz4KPiA+IENjOiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Cj4gPiBDYzogQWxleCBF
bGRlciA8ZWxkZXJAa2VybmVsLm9yZz4KPiA+IENjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCj4gPiBDYzogZGV2ZWxAZHJpdmVyZGV2Lm9zdW9zbC5vcmcKPiA+IFNpZ25lZC1vZmYtYnk6
IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4gPiAtLS0K
PiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9maXJtd2FyZS5oICAgICAgICAgICAgICAgfCAy
ICstCj4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ2ItY2FtZXJhLmggICAgICAgICAgICAg
IHwgMiArLQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dicGh5LmggICAgICAgICAgICAg
ICAgICB8IDIgKy0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5YnVzLmggICAgICAg
ICAgICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvZ3JleWJ1c19hdXRo
ZW50aWNhdGlvbi5oIHwgMiArLQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2dyZXlidXNf
ZmlybXdhcmUuaCAgICAgICB8IDIgKy0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ncmV5
YnVzX21hbmlmZXN0LmggICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
Z3JleWJ1c19wcm90b2NvbHMuaCAgICAgIHwgMiArLQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2dyZXlidXNfdHJhY2UuaCAgICAgICAgICB8IDIgKy0KPiA+ICBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9oZC5oICAgICAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvaW50ZXJmYWNlLmggICAgICAgICAgICAgIHwgMiArLQo+ID4gIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL21hbmlmZXN0LmggICAgICAgICAgICAgICB8IDIgKy0KPiA+ICBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9tb2R1bGUuaCAgICAgICAgICAgICAgICAgfCAyICstCj4gPiAg
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvb3BlcmF0aW9uLmggICAgICAgICAgICAgIHwgMiArLQo+
ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5oICAgICAgICAgICAgICAgICB8IDIg
Ky0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zdmMuaCAgICAgICAgICAgICAgICAgICAg
fCAyICstCj4gPiAgMTYgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTYgZGVsZXRp
b25zKC0pCj4gCj4gQWNrZWQtYnk6IFZpcmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5v
cmc+CgpUaGFua3MgZm9yIGFsbCBvZiB0aGUgYWNrcyEKCmdyZWcgay1oCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
