Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AA082164FB0
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Feb 2020 21:19:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C99C619B5
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Feb 2020 20:19:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3FFAF619B4; Wed, 19 Feb 2020 20:19:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CBFCD6197A;
	Wed, 19 Feb 2020 20:19:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A6D4B61932
 for <greybus-dev@lists.linaro.org>; Wed, 19 Feb 2020 20:19:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9110A61945; Wed, 19 Feb 2020 20:19:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 906AA61932
 for <greybus-dev@lists.linaro.org>; Wed, 19 Feb 2020 20:19:17 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5B33B24654;
 Wed, 19 Feb 2020 20:19:16 +0000 (UTC)
Date: Wed, 19 Feb 2020 21:19:13 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Kaaira Gupta <kgupta@es.iitr.ac.in>
Message-ID: <20200219201913.GA2882443@kroah.com>
References: <20200219195651.GA485@kaaira-HP-Pavilion-Notebook>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200219195651.GA485@kaaira-HP-Pavilion-Notebook>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: match parenthesis
	alignment
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

T24gVGh1LCBGZWIgMjAsIDIwMjAgYXQgMDE6MjY6NTFBTSArMDUzMCwgS2FhaXJhIEd1cHRhIHdy
b3RlOgo+IEZpeCBjaGVja3BhdGNoLnBsIHdhcm5pbmcgb2YgYWxpZ25tZW50IHNob3VsZCBtYXRj
aCBvcGVuIHBhcmVudGhlc2lzIGluCj4gYXVkaW9fY29kZWMuYwo+IAo+IFNpZ25lZC1vZmYtYnk6
IEthYWlyYSBHdXB0YSA8a2d1cHRhQGVzLmlpdHIuYWMuaW4+Cj4gLS0tCj4gIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgfCA4ICsrKystLS0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19jb2RlYy5jCj4gaW5kZXggMDg3NDZjODVkZWE2Li5kNjJmOTFmNGU5YTIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fY29kZWMuYwo+ICsrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2NvZGVjLmMKPiBAQCAtNzAsNyArNzAsNyBAQCBz
dGF0aWMgaW50IGdiYXVkaW9fbW9kdWxlX2VuYWJsZV90eChzdHJ1Y3QgZ2JhdWRpb19jb2RlY19p
bmZvICpjb2RlYywKPiAgCQlpMnNfcG9ydCA9IDA7CS8qIGZpeGVkIGZvciBub3cgKi8KPiAgCQlj
cG9ydGlkID0gZGF0YS0+Y29ubmVjdGlvbi0+aGRfY3BvcnRfaWQ7Cj4gIAkJcmV0ID0gZ2JfYXVk
aW9fYXBicmlkZ2VhX3JlZ2lzdGVyX2Nwb3J0KGRhdGEtPmNvbm5lY3Rpb24sCj4gLQkJCQkJCWky
c19wb3J0LCBjcG9ydGlkLAo+ICsJCQkJCQkJaTJzX3BvcnQsIGNwb3J0aWQsCj4gIAkJCQkJCUFV
RElPX0FQQlJJREdFQV9ESVJFQ1RJT05fVFgpOwoKWW91IGNhbid0IGRvIGl0IGZvciBvbmUgbGlu
ZSwgYW5kIG5vdCBhbGwgb2YgdGhlIGxpbmVzLgoKQW5kIGlmIHlvdSBkbyBpdCBmb3IgYWxsIGxp
bmVzLCB0aGVuIHlvdSBwdXNoIHBhc3QgdGhlIGxpbmUtbGVuZ3RoLgoKU28geW91IGFyZSBiYWNr
IHRvIHdoYXQgd2UgY3VycmVudGx5IGhhdmUsIHdoaWNoIGlzIHRoZSBiZXN0IHdlIGNhbiBkbywK
c29ycnkuCgpncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
