Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE74348DFF
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Mar 2021 11:29:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29D7166713
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Mar 2021 10:29:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1B99B66730; Thu, 25 Mar 2021 10:29:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0924466716;
	Thu, 25 Mar 2021 10:29:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 15C1C66710
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 10:29:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 009B86670E; Thu, 25 Mar 2021 10:29:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 084AC6670E
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 10:29:11 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4505461A25;
 Thu, 25 Mar 2021 10:29:09 +0000 (UTC)
Date: Thu, 25 Mar 2021 11:29:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Jian Dong <dj0227@163.com>
Message-ID: <YFxl8hyx7murtlzW@kroah.com>
References: <1616667566-58997-1-git-send-email-dj0227@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616667566-58997-1-git-send-email-dj0227@163.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix fw is NULL but
	dereferenced
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

T24gVGh1LCBNYXIgMjUsIDIwMjEgYXQgMDY6MTk6MjZQTSArMDgwMCwgSmlhbiBEb25nIHdyb3Rl
Ogo+IEZyb206IEppYW4gRG9uZyA8ZG9uZ2ppYW5AeXVsb25nLmNvbT4KPiAKPiAgZml4ZXMgY29j
Y2ljaGVjayBFcnJvcjoKPiAKPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jOjMw
MTo0MS00NTogRVJST1I6Cj4gIGZ3IGlzIE5VTEwgYnV0IGRlcmVmZXJlbmNlZC4KPiAKPiAgaWYg
cHJvY2VkdXJlIGdvdG8gbGFiZWwgZGlyZWN0bHksIHJldCB3aWxsIGJlIG5lZmF0aXZlLCBzbyB0
aGUgZncgaXMgTlVMTAo+ICBhbmQgdGhlIGlmKGNvbmRpdGlvbikgZW5kIHdpdGggZGVyZWZlcmVu
Y2VkIGZ3LiBsZXQncyBmaXggaXQuCgpXaHkgaXMgdGhpcyBhbGwgaW5kZW50ZWQgYSBzcGFjZT8K
Cj4gCj4gU2lnbmVkLW9mZi1ieTogSmlhbiBEb25nIDxkb25namlhbkB5dWxvbmcuY29tPgo+IC0t
LQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMgfCA4ICsrKystLS0tCj4gIDEg
ZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYyBiL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2Jvb3Ryb20uYwo+IGluZGV4IGE4ZWZiODYuLjA0MzllZmEgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jCj4gKysrIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYm9vdHJvbS5jCj4gQEAgLTI0Niw3ICsyNDYsNyBAQCBzdGF0aWMgaW50IGdi
X2Jvb3Ryb21fZ2V0X2Zpcm13YXJlKHN0cnVjdCBnYl9vcGVyYXRpb24gKm9wKQo+ICAJc3RydWN0
IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlX3Jlc3BvbnNlICpmaXJtd2FyZV9yZXNwb25zZTsKPiAg
CXN0cnVjdCBkZXZpY2UgKmRldiA9ICZvcC0+Y29ubmVjdGlvbi0+YnVuZGxlLT5kZXY7Cj4gIAl1
bnNpZ25lZCBpbnQgb2Zmc2V0LCBzaXplOwo+IC0JZW51bSBuZXh0X3JlcXVlc3RfdHlwZSBuZXh0
X3JlcXVlc3Q7Cj4gKwllbnVtIG5leHRfcmVxdWVzdF90eXBlIG5leHRfcmVxdWVzdCA9IE5FWFRf
UkVRX0dFVF9GSVJNV0FSRTsKPiAgCWludCByZXQgPSAwOwo+ICAKPiAgCS8qIERpc2FibGUgdGlt
ZW91dHMgKi8KPiBAQCAtMjk4LDEwICsyOTgsMTAgQEAgc3RhdGljIGludCBnYl9ib290cm9tX2dl
dF9maXJtd2FyZShzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcCkKPiAgCj4gIHF1ZXVlX3dvcms6Cj4g
IAkvKiBSZWZyZXNoIHRpbWVvdXQgKi8KPiAtCWlmICghcmV0ICYmIChvZmZzZXQgKyBzaXplID09
IGZ3LT5zaXplKSkKPiAtCQluZXh0X3JlcXVlc3QgPSBORVhUX1JFUV9SRUFEWV9UT19CT09UOwo+
IC0JZWxzZQo+ICsJaWYgKCEhcmV0KQoKVGhhdCBpcyBoYXJkIHRvIHVuZGVyc3RhbmQsIHBsZWFz
ZSBtYWtlIHRoaXMgbW9yZSBvYnZpb3VzLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
