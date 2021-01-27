Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D578305A8F
	for <lists+greybus-dev@lfdr.de>; Wed, 27 Jan 2021 13:00:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ABA566675B
	for <lists+greybus-dev@lfdr.de>; Wed, 27 Jan 2021 12:00:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9FE3A6675C; Wed, 27 Jan 2021 12:00:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9F4FF66756;
	Wed, 27 Jan 2021 12:00:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5CFE866538
 for <greybus-dev@lists.linaro.org>; Wed, 27 Jan 2021 12:00:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4EB4666755; Wed, 27 Jan 2021 12:00:42 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4B8BD66538
 for <greybus-dev@lists.linaro.org>; Wed, 27 Jan 2021 12:00:41 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BAC4320770;
 Wed, 27 Jan 2021 12:00:39 +0000 (UTC)
Date: Wed, 27 Jan 2021 13:00:37 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: B K Karthik <bkkarthik@pesu.pes.edu>
Message-ID: <YBFV5eo5AYmLd4E0@kroah.com>
References: <20210109132731.tczawd5p74xnfz7p@pesu.pes.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109132731.tczawd5p74xnfz7p@pesu.pes.edu>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio_helper.c: Replace
 strlcpy() with strscpy()
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

T24gU2F0LCBKYW4gMDksIDIwMjEgYXQgMDY6NTc6MzFQTSArMDUzMCwgQiBLIEthcnRoaWsgd3Jv
dGU6Cj4gSW4gZ2JhdWRpb19yZW1vdmVfY29udHJvbHMoKSAsIHJlcGxhY2UgdGhlIHVzYWdlIG9m
IHN0cmxjcHkoKSB3aXRoCj4gc3Ryc2NweSgpIGJlY2F1c2Ugc3RybGNweSgpIG9ubHkgbGltaXRz
IHRoZSAqZGVzdGluYXRpb24qCj4gc2l6ZSwgYW5kIHRoZSBzb3VyY2UgaXMgYWx3YXlzIHJlYWQg
ZnVsbHkuCj4gCj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci9DQUhrLT13Z2ZSblh6MFczRDM3
ZDAxcTNKRmtyX2lfdVRMPVY2QTZHMW9VWmNwcm1rbndAbWFpbC5nbWFpbC5jb20vCj4gd2FzIHF1
b3RlZCBieSBjaGVja3BhdGNoIHdoaWxlIHNob3dpbmcgdGhpcyB3YXJuaW5nLgo+IAo+IFNpZ25l
ZC1vZmYtYnk6IEIgSyBLYXJ0aGlrIDxia2thcnRoaWtAcGVzdS5wZXMuZWR1Pgo+IC0tLQo+ICBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyB8IDIgKy0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIGIvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXVkaW9faGVscGVyLmMKPiBpbmRleCAzMDExYjhhYmNlMzguLjFlZDQ3NzJkMjc3MSAx
MDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+ICsr
KyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCj4gQEAgLTE2Niw3ICsx
NjYsNyBAQCBzdGF0aWMgaW50IGdiYXVkaW9fcmVtb3ZlX2NvbnRyb2xzKHN0cnVjdCBzbmRfY2Fy
ZCAqY2FyZCwgc3RydWN0IGRldmljZSAqZGV2LAo+ICAJCQlzbnByaW50ZihpZC5uYW1lLCBzaXpl
b2YoaWQubmFtZSksICIlcyAlcyIsIHByZWZpeCwKPiAgCQkJCSBjb250cm9sLT5uYW1lKTsKPiAg
CQllbHNlCj4gLQkJCXN0cmxjcHkoaWQubmFtZSwgY29udHJvbC0+bmFtZSwgc2l6ZW9mKGlkLm5h
bWUpKTsKPiArCQkJc3Ryc2NweShpZC5uYW1lLCBjb250cm9sLT5uYW1lLCBzaXplb2YoaWQubmFt
ZSkpOwoKSXMgdGhpcyBzb21ldGhpbmcgdGhhdCBtYXR0ZXJzIGhlcmU/ICBJc24ndCB0aGUgc3Ry
aW5nIGNvbWluZyBmcm9tIHRoZQprZXJuZWwgKGkuZS4gYSB0cnVzdGVkIHNvdXJjZSksIG9yIGlm
IG5vdCwgd2hlcmUgaXMgaXQgY29taW5nIGZyb20/Cgp0aGFua3MsCgpncmVnIGstaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
