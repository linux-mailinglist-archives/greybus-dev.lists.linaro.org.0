Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B19A4F36
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Sep 2019 08:31:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 98DA4609B5
	for <lists+greybus-dev@lfdr.de>; Mon,  2 Sep 2019 06:31:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8D2B9609BB; Mon,  2 Sep 2019 06:31:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1E31617B0;
	Mon,  2 Sep 2019 06:31:26 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BA9FC609BB
 for <greybus-dev@lists.linaro.org>; Mon,  2 Sep 2019 06:31:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AD48561786; Mon,  2 Sep 2019 06:31:21 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id BB9F9609BB
 for <greybus-dev@lists.linaro.org>; Mon,  2 Sep 2019 06:31:20 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0D65822D6D;
 Mon,  2 Sep 2019 06:31:18 +0000 (UTC)
Date: Mon, 2 Sep 2019 08:31:17 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pavel Machek <pavel@ucw.cz>
Message-ID: <20190902063117.GA10402@kroah.com>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
 <20190901172303.GA1005@bug>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190901172303.GA1005@bug>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org
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

T24gU3VuLCBTZXAgMDEsIDIwMTkgYXQgMDc6MjM6MDNQTSArMDIwMCwgUGF2ZWwgTWFjaGVrIHdy
b3RlOgo+IEhpIQo+IAo+ID4gVGhlIEdyZXlidXMgY29kZSBoYXMgbG9uZyBiZWVuICJzdGFibGUi
IGJ1dCB3YXMgbGl2aW5nIGluIHRoZQo+ID4gZHJpdmVycy9zdGFnaW5nLyBkaXJlY3RvcnkgdG8g
c2VlIGlmIHRoZXJlIHJlYWxseSB3YXMgZ29pbmcgdG8gYmUKPiA+IGRldmljZXMgdXNpbmcgdGhp
cyBwcm90b2NvbCBvdmVyIHRoZSBsb25nLXRlcm0uICBXaXRoIHRoZSBzdWNjZXNzIG9mCj4gPiBt
aWxsaW9ucyBvZiBwaG9uZXMgd2l0aCB0aGlzIGhhcmR3YXJlIGFuZCBjb2RlIGluIGl0LCBhbmQg
dGhlIHJlY2VudAo+IAo+IFNvLCB3aGF0IHBob25lcyBkbyBoYXZlIHRoaXMsIGZvciBleGFtcGxl
PwoKVGhlIE1vdG9yb2xhIFogbGluZSwgYWxsIG9mIHRoZSAiTW90byBNb2RzIiB1c2UgdGhpcyBp
bnRlcmZhY2UgdG8KY29tbXVuaWNhdGUuCgo+IERvZXMgdGhhdCBtZWFuIHRoYXQgdGhlcmUncyBs
YXJnZSBjaG9pY2Ugb2YgcGhvbmVzIHdlbGwgc3VwcG9ydGVkIGJ5IHRoZQo+IG1haW5saW5lPwoK
SSBoYXZlIG5vIGlkZWEgd2hhdCBrZXJuZWwgdmVyc2lvbiB0aGV5IHVzZSwgeW91IHdpbGwgaGF2
ZSB0byB0YWxrIHRvCk1vdG9yb2xhIGFib3V0IHRoYXQuCgpncmVnIGstaApfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
