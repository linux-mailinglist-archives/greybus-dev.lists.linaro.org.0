Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D8136538D
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Apr 2021 09:51:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F2C1D66828
	for <lists+greybus-dev@lfdr.de>; Tue, 20 Apr 2021 07:51:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DA95666834; Tue, 20 Apr 2021 07:51:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9B19D66826;
	Tue, 20 Apr 2021 07:51:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3506366795
 for <greybus-dev@lists.linaro.org>; Tue, 20 Apr 2021 07:51:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 182506681D; Tue, 20 Apr 2021 07:51:23 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id F0B0766795
 for <greybus-dev@lists.linaro.org>; Tue, 20 Apr 2021 07:51:21 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0B0B16101E;
 Tue, 20 Apr 2021 07:51:19 +0000 (UTC)
Date: Tue, 20 Apr 2021 09:51:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kyle Harding <kyle@balena.io>
Message-ID: <YH6H9SR1h0Mg4x2Q@kroah.com>
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
 <YHmQPbufUqbthg55@kroah.com>
 <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
 <YHp7dsQsKa4K05d3@kroah.com>
 <CAMgvH3rnDQ2OOwwtnSWiuquV_S5EU9iQ4i2gOoWbOkvigE-MtA@mail.gmail.com>
 <YH0zXh2AMZAJUnAo@kroah.com>
 <CAMgvH3pgBehB3799TLLzAWZWSyeD0qCiJfUqkvzVVr5ZO5JxmQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMgvH3pgBehB3799TLLzAWZWSyeD0qCiJfUqkvzVVr5ZO5JxmQ@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] DMA support via gb-netlink and gbridge
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

QTogaHR0cDovL2VuLndpa2lwZWRpYS5vcmcvd2lraS9Ub3BfcG9zdApROiBXZXJlIGRvIEkgZmlu
ZCBpbmZvIGFib3V0IHRoaXMgdGhpbmcgY2FsbGVkIHRvcC1wb3N0aW5nPwpBOiBCZWNhdXNlIGl0
IG1lc3NlcyB1cCB0aGUgb3JkZXIgaW4gd2hpY2ggcGVvcGxlIG5vcm1hbGx5IHJlYWQgdGV4dC4K
UTogV2h5IGlzIHRvcC1wb3N0aW5nIHN1Y2ggYSBiYWQgdGhpbmc/CkE6IFRvcC1wb3N0aW5nLgpR
OiBXaGF0IGlzIHRoZSBtb3N0IGFubm95aW5nIHRoaW5nIGluIGUtbWFpbD8KCkE6IE5vLgpROiBT
aG91bGQgSSBpbmNsdWRlIHF1b3RhdGlvbnMgYWZ0ZXIgbXkgcmVwbHk/CgpodHRwOi8vZGFyaW5n
ZmlyZWJhbGwubmV0LzIwMDcvMDcvb25fdG9wCgpPbiBNb24sIEFwciAxOSwgMjAyMSBhdCAwMjo1
OTo1NlBNIC0wNDAwLCBLeWxlIEhhcmRpbmcgd3JvdGU6Cj4gVGhhbmtzIEdyZWcsIEkndmUgZXhw
bGFpbmVkIG91ciBzb2x1dGlvbiBwb29ybHkgc28gSSdsbCBxdW90ZSBhIGNvbGxlYWd1ZQo+IGFz
IEknbSB0b28gY2xvc2UgdG8gdGhlIHByb2JsZW0gYXQgdGhpcyBwb2ludCEKPiAKPiBXZSdkIGxp
a2UgdG8gZXNzZW50aWFsbHkgcnVuIGEgdmlydHVhbGl6ZWQgdmVuZG9yIGtlcm5lbCB0byBtYW5h
Z2UgYQo+IGhhcmR3YXJlIGRldmljZSBzdWNoIGFzIGFuIFNESU8gd2lyZWxlc3MgY2FyZCBwYXNz
ZWQgdGhyb3VnaCBmcm9tIHRoZSBob3N0LAo+IHJ1bm5pbmcgYSBtYWlubGluZSBrZXJuZWwuIE5l
dHdvcmsgdHJhZmZpYyB3b3VsZCBiZSByb3V0ZWQgZnJvbSBob3N0IHRvCj4gZ3Vlc3Qgb3ZlciBh
IHZpcnRpbyBpbnRlcmZhY2UuCj4gCj4gSXMgaXQgcG9zc2libGUgdG8gdXNlIEdyZXlidXMgaW4g
dGhpcyB3YXksIG9yIGFtIEkgbWlzdW5kZXJzdGFuZGluZyB0aGUgdXNlCj4gY2FzZSBvZiB0aGlz
IHN1YnN5c3RlbT8KCllvdSBjb3VsZCBhYnVzZSBncmV5YnVzIHRvIGRvIHNvbWV0aGluZyBsaWtl
IHRoaXMsIGJ1dCB0aGF0IGZlZWxzIGxpa2UgYQp0b24gb2YgZXh0cmEgd29yayB3aGVuIHRoZXJl
IGFyZSBhbHJlYWR5IHNvbHV0aW9ucyBmb3IgdGhpcyB0eXBlIG9mCnRoaW5nIHRvZGF5IGluIExp
bnV4LiAgV2h5IG5vdCBqdXN0IHVzZSBzb21lIG9mIHRoZSBleGlzdGluZyBoYXJkd2FyZQpwYXNz
LXRocm91Z2ggc29sdXRpb25zIHRoYXQgYXJlIG91dCB0aGVyZSB0aGF0IGFsbG93IHZpcnR1YWwg
a2VybmVscyB0bwpoYXZlIGFjY2VzcyB0byBoYXJkd2FyZSBkaXJlY3RseT8gIFdoeSB0cnkgdG8g
Y3JlYXRlIHlldC1hbm90aGVyIHdheSB0bwpkbyB0aGlzPwoKQnV0IGhleSwgaWYgeW91IHdhbnQg
dG8gdGFrZSB0aGUgdGltZSB0byB3cml0ZSBzdWNoIGtlcm5lbCBjb2RlLCBhbGwgdGhlCmJlc3Qh
ICA6KQoKZ3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
