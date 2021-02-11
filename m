Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE23318543
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 07:44:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 384E96088F
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 06:44:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 27FC0608BA; Thu, 11 Feb 2021 06:44:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A0DD7665EF;
	Thu, 11 Feb 2021 06:44:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AAE2E6088F
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 06:44:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 990B860CA7; Thu, 11 Feb 2021 06:44:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 5B2FC6088F
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 06:44:08 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95E5E64E77;
 Thu, 11 Feb 2021 06:44:06 +0000 (UTC)
Date: Thu, 11 Feb 2021 07:44:04 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fatih YILDIRIM <yildirim.fatih@gmail.com>
Message-ID: <YCTSNKrFQ88ipedb@kroah.com>
References: <20210210221439.3489-1-yildirim.fatih@gmail.com>
 <20210210221439.3489-2-yildirim.fatih@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210210221439.3489-2-yildirim.fatih@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH 1/1] Macros with multiple statements
 should be enclosed in a do - while loop.
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

T24gVGh1LCBGZWIgMTEsIDIwMjEgYXQgMDE6MTQ6MzlBTSArMDMwMCwgRmF0aWggWUlMRElSSU0g
d3JvdGU6Cj4gU2lnbmVkLW9mZi1ieTogRmF0aWggWUlMRElSSU0gPHlpbGRpcmltLmZhdGloQGdt
YWlsLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYyB8IDEw
ICsrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlv
bnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2su
YyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMKPiBpbmRleCAyNDcxNDQ4YmE0
MmEuLmM4OGVmM2U4OTRmYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9s
b29wYmFjay5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYwo+IEBA
IC0xNjIsMTAgKzE2MiwxMiBAQCBzdGF0aWMgc3NpemVfdCBuYW1lIyNfYXZnX3Nob3coc3RydWN0
IGRldmljZSAqZGV2LAkJXAo+ICB9CQkJCQkJCQkJXAo+ICBzdGF0aWMgREVWSUNFX0FUVFJfUk8o
bmFtZSMjX2F2ZykKPiAgCj4gLSNkZWZpbmUgZ2JfbG9vcGJhY2tfc3RhdHNfYXR0cnMoZmllbGQp
CQkJCVwKPiAtCWdiX2xvb3BiYWNrX3JvX3N0YXRzX2F0dHIoZmllbGQsIG1pbiwgdSk7CQlcCj4g
LQlnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZpZWxkLCBtYXgsIHUpOwkJXAo+IC0JZ2JfbG9v
cGJhY2tfcm9fYXZnX2F0dHIoZmllbGQpCj4gKyNkZWZpbmUgZ2JfbG9vcGJhY2tfc3RhdHNfYXR0
cnMoZmllbGQpCQkJCQlcCj4gKwlkbyB7CQkJCQkJCQlcCj4gKwkJZ2JfbG9vcGJhY2tfcm9fc3Rh
dHNfYXR0cihmaWVsZCwgbWluLCB1KTsJCVwKPiArCQlnYl9sb29wYmFja19yb19zdGF0c19hdHRy
KGZpZWxkLCBtYXgsIHUpOwkJXAo+ICsJCWdiX2xvb3BiYWNrX3JvX2F2Z19hdHRyKGZpZWxkKTsJ
CQkJXAo+ICsJfSB3aGlsZSAoMCkKPiAgCj4gICNkZWZpbmUgZ2JfbG9vcGJhY2tfYXR0cihmaWVs
ZCwgdHlwZSkJCQkJCVwKPiAgc3RhdGljIHNzaXplX3QgZmllbGQjI19zaG93KHN0cnVjdCBkZXZp
Y2UgKmRldiwJCQkJXAo+IC0tIAo+IDIuMjAuMQo+IAoKSGksCgpUaGlzIGlzIHRoZSBmcmllbmRs
eSBwYXRjaC1ib3Qgb2YgR3JlZyBLcm9haC1IYXJ0bWFuLiAgWW91IGhhdmUgc2VudCBoaW0KYSBw
YXRjaCB0aGF0IGhhcyB0cmlnZ2VyZWQgdGhpcyByZXNwb25zZS4gIEhlIHVzZWQgdG8gbWFudWFs
bHkgcmVzcG9uZAp0byB0aGVzZSBjb21tb24gcHJvYmxlbXMsIGJ1dCBpbiBvcmRlciB0byBzYXZl
IGhpcyBzYW5pdHkgKGhlIGtlcHQKd3JpdGluZyB0aGUgc2FtZSB0aGluZyBvdmVyIGFuZCBvdmVy
LCB5ZXQgdG8gZGlmZmVyZW50IHBlb3BsZSksIEkgd2FzCmNyZWF0ZWQuICBIb3BlZnVsbHkgeW91
IHdpbGwgbm90IHRha2Ugb2ZmZW5jZSBhbmQgd2lsbCBmaXggdGhlIHByb2JsZW0KaW4geW91ciBw
YXRjaCBhbmQgcmVzdWJtaXQgaXQgc28gdGhhdCBpdCBjYW4gYmUgYWNjZXB0ZWQgaW50byB0aGUg
TGludXgKa2VybmVsIHRyZWUuCgpZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1lc3NhZ2UgYmVjYXVz
ZSBvZiB0aGUgZm9sbG93aW5nIGNvbW1vbiBlcnJvcihzKQphcyBpbmRpY2F0ZWQgYmVsb3c6Cgot
IFlvdXIgcGF0Y2ggYnJlYWtzIHRoZSBidWlsZC4KCi0gWW91IGRpZCBub3Qgc3BlY2lmeSBhIGRl
c2NyaXB0aW9uIG9mIHdoeSB0aGUgcGF0Y2ggaXMgbmVlZGVkLCBvcgogIHBvc3NpYmx5LCBhbnkg
ZGVzY3JpcHRpb24gYXQgYWxsLCBpbiB0aGUgZW1haWwgYm9keS4gIFBsZWFzZSByZWFkIHRoZQog
IHNlY3Rpb24gZW50aXRsZWQgIlRoZSBjYW5vbmljYWwgcGF0Y2ggZm9ybWF0IiBpbiB0aGUga2Vy
bmVsIGZpbGUsCiAgRG9jdW1lbnRhdGlvbi9TdWJtaXR0aW5nUGF0Y2hlcyBmb3Igd2hhdCBpcyBu
ZWVkZWQgaW4gb3JkZXIgdG8KICBwcm9wZXJseSBkZXNjcmliZSB0aGUgY2hhbmdlLgoKLSBZb3Ug
ZGlkIG5vdCB3cml0ZSBhIGRlc2NyaXB0aXZlIFN1YmplY3Q6IGZvciB0aGUgcGF0Y2gsIGFsbG93
aW5nIEdyZWcsCiAgYW5kIGV2ZXJ5b25lIGVsc2UsIHRvIGtub3cgd2hhdCB0aGlzIHBhdGNoIGlz
IGFsbCBhYm91dC4gIFBsZWFzZSByZWFkCiAgdGhlIHNlY3Rpb24gZW50aXRsZWQgIlRoZSBjYW5v
bmljYWwgcGF0Y2ggZm9ybWF0IiBpbiB0aGUga2VybmVsIGZpbGUsCiAgRG9jdW1lbnRhdGlvbi9T
dWJtaXR0aW5nUGF0Y2hlcyBmb3Igd2hhdCBhIHByb3BlciBTdWJqZWN0OiBsaW5lIHNob3VsZAog
IGxvb2sgbGlrZS4KCklmIHlvdSB3aXNoIHRvIGRpc2N1c3MgdGhpcyBwcm9ibGVtIGZ1cnRoZXIs
IG9yIHlvdSBoYXZlIHF1ZXN0aW9ucyBhYm91dApob3cgdG8gcmVzb2x2ZSB0aGlzIGlzc3VlLCBw
bGVhc2UgZmVlbCBmcmVlIHRvIHJlc3BvbmQgdG8gdGhpcyBlbWFpbCBhbmQKR3JlZyB3aWxsIHJl
cGx5IG9uY2UgaGUgaGFzIGR1ZyBvdXQgZnJvbSB0aGUgcGVuZGluZyBwYXRjaGVzIHJlY2VpdmVk
CmZyb20gb3RoZXIgZGV2ZWxvcGVycy4KCnRoYW5rcywKCmdyZWcgay1oJ3MgcGF0Y2ggZW1haWwg
Ym90Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
