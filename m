Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D1567CD04A
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Oct 2019 12:09:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D4F08608DD
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Oct 2019 10:09:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C92F961928; Sun,  6 Oct 2019 10:09:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22F23609E7;
	Sun,  6 Oct 2019 10:09:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C84B56087C
 for <greybus-dev@lists.linaro.org>; Sun,  6 Oct 2019 10:09:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BAE99608E1; Sun,  6 Oct 2019 10:09:29 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0159.hostedemail.com
 [216.40.44.159])
 by lists.linaro.org (Postfix) with ESMTPS id B65676087C
 for <greybus-dev@lists.linaro.org>; Sun,  6 Oct 2019 10:09:28 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay06.hostedemail.com (Postfix) with ESMTP id 0D0B318224D86;
 Sun,  6 Oct 2019 10:09:28 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: night97_5277490531e42
X-Filterd-Recvd-Size: 1619
Received: from XPS-9350.home (unknown [47.151.152.152])
 (Authenticated sender: joe@perches.com)
 by omf12.hostedemail.com (Postfix) with ESMTPA;
 Sun,  6 Oct 2019 10:09:26 +0000 (UTC)
Message-ID: <2ed3bf96312dbd9abcd626868ce84e01a066b201.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Greg KH <gregkh@linuxfoundation.org>, Gabriela Bittencourt
 <gabrielabittencourt00@gmail.com>
Date: Sun, 06 Oct 2019 03:09:25 -0700
In-Reply-To: <20191006095042.GA2918514@kroah.com>
References: <20191005210046.27224-1-gabrielabittencourt00@gmail.com>
 <20191006095042.GA2918514@kroah.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, greybus-dev@lists.linaro.org,
 johan@kernel.org, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add blank line after
	declarations
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

T24gU3VuLCAyMDE5LTEwLTA2IGF0IDExOjUwICswMjAwLCBHcmVnIEtIIHdyb3RlOgo+IE9uIFNh
dCwgT2N0IDA1LCAyMDE5IGF0IDA2OjAwOjQ2UE0gLTAzMDAsIEdhYnJpZWxhIEJpdHRlbmNvdXJ0
IHdyb3RlOgo+ID4gRml4IENIRUNLOiBhZGQgYmxhbmsgbGluZSBhZnRlciBkZWNsYXJhdGlvbnMK
W10KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb250cm9sLmggYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9jb250cm9sLmgKW10KPiA+IEBAIC0yNCw2ICsyNCw3IEBA
IHN0cnVjdCBnYl9jb250cm9sIHsKPiA+ICAJY2hhciAqdmVuZG9yX3N0cmluZzsKPiA+ICAJY2hh
ciAqcHJvZHVjdF9zdHJpbmc7Cj4gPiAgfTsKPiA+ICsKPiA+ICAjZGVmaW5lIHRvX2diX2NvbnRy
b2woZCkgY29udGFpbmVyX29mKGQsIHN0cnVjdCBnYl9jb250cm9sLCBkZXYpCj4gCj4gTm8sIHRo
ZSBvcmlnaW5hbCBjb2RlIGlzICJiZXR0ZXIiIGhlcmUsIGl0J3MgYSBjb21tb24gcGF0dGVybiBk
ZXNwaXRlCj4gd2hhdCBjaGVja3BhdGNoLnBsIHRlbGxzIHlvdSwgc29ycnkuCgpTdGF0aXN0aWNz
IHBsZWFzZS4KCkkgYmVsaWV2ZSBpdCdzIG5vdCBhIGNvbW1vbiBwYXR0ZXJuLgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJv
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
