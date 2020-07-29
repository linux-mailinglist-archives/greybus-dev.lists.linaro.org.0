Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBC32316BB
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Jul 2020 02:26:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DBDD466588
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Jul 2020 00:26:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CF50D665AA; Wed, 29 Jul 2020 00:26:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B8ABB66609;
	Wed, 29 Jul 2020 00:25:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D7F87617ED
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 00:25:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C57DF665AA; Wed, 29 Jul 2020 00:25:55 +0000 (UTC)
Received: from smtprelay.hostedemail.com (smtprelay0139.hostedemail.com
 [216.40.44.139])
 by lists.linaro.org (Postfix) with ESMTPS id D89B5617ED
 for <greybus-dev@lists.linaro.org>; Wed, 29 Jul 2020 00:25:54 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
 [216.40.38.60])
 by smtprelay02.hostedemail.com (Postfix) with ESMTP id 3AA9D2473;
 Wed, 29 Jul 2020 00:25:54 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: rock34_340ae5326f6e
X-Filterd-Recvd-Size: 1689
Received: from XPS-9350.home (unknown [47.151.133.149])
 (Authenticated sender: joe@perches.com)
 by omf05.hostedemail.com (Postfix) with ESMTPA;
 Wed, 29 Jul 2020 00:25:52 +0000 (UTC)
Message-ID: <e301110c6aa504be56ec73a355d3aa9215fc9633.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Alex Elder <elder@ieee.org>, "Gustavo A. R. Silva"
 <gustavoars@kernel.org>,  Johan Hovold <johan@kernel.org>, Alex Elder
 <elder@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 28 Jul 2020 17:25:50 -0700
In-Reply-To: <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
References: <20200727183258.GA28571@embeddedor>
 <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
User-Agent: Evolution 3.36.3-0ubuntu1 
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH][next] greybus: Use fallthrough
	pseudo-keyword
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

T24gVHVlLCAyMDIwLTA3LTI4IGF0IDE3OjM3IC0wNTAwLCBBbGV4IEVsZGVyIHdyb3RlOgo+IE9u
IDcvMjcvMjAgMTozMiBQTSwgR3VzdGF2byBBLiBSLiBTaWx2YSB3cm90ZToKPiA+IFJlcGxhY2Ug
dGhlIGV4aXN0aW5nIC8qIGZhbGwgdGhyb3VnaCAqLyBjb21tZW50cyBhbmQgaXRzIHZhcmlhbnRz
IHdpdGgKPiA+IHRoZSBuZXcgcHNldWRvLWtleXdvcmQgbWFjcm8gZmFsbHRocm91Z2hbMV0uCj4g
PiAKPiA+IFsxXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2RvYy9odG1sL3Y1LjcvcHJvY2Vzcy9k
ZXByZWNhdGVkLmh0bWw/aGlnaGxpZ2h0PWZhbGx0aHJvdWdoI2ltcGxpY2l0LXN3aXRjaC1jYXNl
LWZhbGwtdGhyb3VnaAo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLiAgSXQgbG9va3MgZ29vZCwg
YnV0IGl0IHJhaXNlcwo+IGFub3RoZXIgcXVlc3Rpb24gSSdkIGxpa2UgZGlzY3Vzc2lvbiBvbi4K
PiAKPiBJdCBzZWVtcyB0aGF0IEpvaGFuIGxpa2VzIGRlZmF1bHQgKG9yIGZpbmFsKSBjYXNlcyBp
bgo+IHN3aXRjaCBzdGF0ZW1lbnRzIHdpdGhvdXQgYSAiYnJlYWsiIHN0YXRlbWVudC4gIFZpcmVz
aAo+IGFuZCBCcnlhbiBhcHBlYXIgdG8gYmUgZm9uZCBvZiB0aGlzIHRvby4KPiAKPiBJdCdzIHBl
ZGFudGljLCBidXQgSSBkb24ndCBsaWtlIHRoYXQuICBBbSBJIHdyb25nPwoKTm8sIHlvdSBhcmUg
bm90IHdyb25nLgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
