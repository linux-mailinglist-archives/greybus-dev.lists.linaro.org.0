Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F038D363CD4
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Apr 2021 09:38:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25592667FE
	for <lists+greybus-dev@lfdr.de>; Mon, 19 Apr 2021 07:38:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1A70E66800; Mon, 19 Apr 2021 07:38:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0316866804;
	Mon, 19 Apr 2021 07:38:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 800B1667FE
 for <greybus-dev@lists.linaro.org>; Mon, 19 Apr 2021 07:38:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 615A966802; Mon, 19 Apr 2021 07:38:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 8D13C667FE
 for <greybus-dev@lists.linaro.org>; Mon, 19 Apr 2021 07:38:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 128F86102A;
 Mon, 19 Apr 2021 07:38:08 +0000 (UTC)
Date: Mon, 19 Apr 2021 09:38:06 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Kyle Harding <kyle@balena.io>
Message-ID: <YH0zXh2AMZAJUnAo@kroah.com>
References: <CAMgvH3p9L8D6ZeGbzVqMSahUU-mUL7K1-yijgz+D=B6MYHJjSQ@mail.gmail.com>
 <YHmQPbufUqbthg55@kroah.com>
 <CAMgvH3qf84NqzguGHAe4EASoAWyV15NpwsjKNvuTaq_drMXnyw@mail.gmail.com>
 <YHp7dsQsKa4K05d3@kroah.com>
 <CAMgvH3rnDQ2OOwwtnSWiuquV_S5EU9iQ4i2gOoWbOkvigE-MtA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMgvH3rnDQ2OOwwtnSWiuquV_S5EU9iQ4i2gOoWbOkvigE-MtA@mail.gmail.com>
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

T24gU3VuLCBBcHIgMTgsIDIwMjEgYXQgMDE6MzE6MjNQTSAtMDQwMCwgS3lsZSBIYXJkaW5nIHdy
b3RlOgo+IFRoYXQgZG9lcyBoZWxwLCB0aGFuayB5b3UgR3JlZyEgSXQgc2VlbXMgdGhhdCBpbiBn
ZW5lcmFsIHRoZSB0cmFuc3BvcnQKPiBzaG91bGRuJ3QgYmUgYSBwcm9ibGVtLgo+IAo+IFdoYXQg
aWYgdGhlIG5vbi1oYXJkd2FyZSBzaWRlIGlzIGEga3ZtIGd1ZXN0IGtlcm5lbCB3aXRob3V0IElP
TU1VIHN1cHBvcnQ/Cj4gSWYgd2UgdXNlZCBncmV5YnVzIHRvIGV4cG9zZSB0aGUgU0RJTyBidXMg
dG8gdGhlIGt2bSB3b3VsZCB0aGUgRE1BIHRyYW5zZmVyCj4gZ2FyYmFnZSBpbiBIb3N0IE1lbW9y
eT8KPiAKPiBJIHVuZGVyc3RhbmQgdGhpcyBpcyBhIG5vbi10cmFkaXRpb25hbCBhcHByb2FjaCwg
YW5kIEkgYmVsaWV2ZSB0aGF0IHdpdGgKPiBJT01NVSB0aGlzIHdvdWxkbid0IGJlIGFuIGlzc3Vl
LgoKQWdhaW4sIEkgdGhpbmsgeW91IGFyZSBnZXR0aW5nIHZlcnkgY29uZnVzZWQgYXMgdG8gd2hh
dCB0aGUgZ3JleWJ1cwpwcm90b2NvbCBzdGFjayBpcyBmb3IuCgpZb3UgY2FuIHVzZSBpdCBmb3Ig
YW55IHR5cGUgb2YgYnVzIHlvdSB3YW50LCB5b3UganVzdCBuZWVkIHRvIHdyaXRlIGEKZHJpdmVy
IGZvciB0aGF0IHRyYW5zcG9ydCBsYXllci4gIEJ1dCBmb3IgdGFsa2luZyB0byB2aXJ0dWFsIG1h
Y2hpbmVzLAp3aHkgbm90IGp1c3QgdXNlIHRoZSB2aXJ0aW8gbGF5ZXIgd2hpY2ggaXMgZGVzaWdu
ZWQganVzdCBmb3IgdGhhdD8gIFlvdQpjb3VsZCBtYWtlIGEgdmlydGlvIHRyYW5zcG9ydCBmb3Ig
Z3JleWJ1cywgYnV0IHJlYWxseSwgd2h5PyAgV2hvIHdvdWxkCnVzZSB0aGF0PwoKQW5kIGFnYWlu
LCBJT01NVXMgaGF2ZSBub3RoaW5nIHRvIGRvIHdpdGggdGhpcyBhdCBhbGwuCgp0aGFua3MsCgpn
cmVnIGstaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
