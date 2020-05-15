Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DAABB1D4F71
	for <lists+greybus-dev@lfdr.de>; Fri, 15 May 2020 15:44:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 102B265F89
	for <lists+greybus-dev@lfdr.de>; Fri, 15 May 2020 13:44:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 02E2A65F92; Fri, 15 May 2020 13:44:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E97F765F91;
	Fri, 15 May 2020 13:44:19 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1B8B265F80
 for <greybus-dev@lists.linaro.org>; Fri, 15 May 2020 13:44:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 062D465F89; Fri, 15 May 2020 13:44:17 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4771B65F80
 for <greybus-dev@lists.linaro.org>; Fri, 15 May 2020 13:44:15 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0FED420657;
 Fri, 15 May 2020 13:44:13 +0000 (UTC)
Date: Fri, 15 May 2020 15:44:12 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <20200515134412.GA2083757@kroah.com>
References: <20200507212912.599433-1-alexandre.belloni@bootlin.com>
 <20200513174530.GA32096@animalcreek.com>
 <CAAs3649-3dAmUqjLiEP8Ar3dKamp7ek1o0R5WN3g8kxTgz6fFg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAAs3649-3dAmUqjLiEP8Ar3dKamp7ek1o0R5WN3g8kxTgz6fFg@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH] greybus: audio: remove unused code
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

T24gVGh1LCBNYXkgMTQsIDIwMjAgYXQgMDE6MDc6MzZBTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2Fs
IHdyb3RlOgo+IE9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDExOjE1IFBNIE1hcmsgR3JlZXIgPG1n
cmVlckBhbmltYWxjcmVlay5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFRodSwgTWF5IDA3LCAyMDIw
IGF0IDExOjI5OjExUE0gKzAyMDAsIEFsZXhhbmRyZSBCZWxsb25pIHdyb3RlOgo+ID4gPiBHUkVZ
QlVTX0FVRElPX01TTTg5OTQgaXMgbm90IGFuIGV4aXN0aW5nIGNvbmZpZ3VyYXRpb24gb3B0aW9u
IGFuZCBhcwo+ID4gPiByZXBvcnRlZCBpbiBTZXB0ZW1iZXIgMjAxNiwgaXQgZGVwZW5kcyBvbiBh
biAib3V0LW9mLXRyZWUgcXVhbGNvbW0gYXVkaW8KPiA+ID4gZHJpdmVyIi4gVGhpcyBkcml2ZXIg
bmV2ZXIgbWFkZSBpdCB1cHN0cmVhbS4KPiA+ID4KPiA+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvbGttbC8yMDE2MDkyMTA3MzkwNS5HQTMxMjYzQGtyb2FoLmNvbS8KPiA+ID4KPiA+ID4gTW9y
ZW92ZXIsIHRoZXJlIGRvZXNuJ3Qgc2VlbSB0byBiZSBhbnkgaW50ZXJlc3QgaW4gYWN0dWFsbHkg
Zml4aW5nIHRoZQo+ID4gPiBkcml2ZXIgYXMgaXQgdXNlcyBBU29DIEFQSXMgdGhhdCBoYXZlIGJl
ZW4gcmVtb3ZlZCBmcm9tIHRoZSBrZXJuZWwgaW4gMjAxOAo+ID4gPiBhcyBzaG93biBieSBpdHMg
dXNlIG9mIHNuZF9zb2NfcmVnaXN0ZXJfY29kZWMgYW5kCj4gPiA+IHNuZF9zb2NfY29kZWNfZ2V0
X2RydmRhdGEsIHJlbW92ZWQgaW4gY29tbWl0IDk5OWY3ZjVhZjhlYiAoIkFTb0M6IHJlbW92ZQo+
ID4gPiBDb2RlYyByZWxhdGVkIGNvZGUiKS4KPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxl
eGFuZHJlIEJlbGxvbmkgPGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgo+ID4gPiAtLS0K
PiBIaSBBbGV4YW5kcmUsCj4gCj4gQXMgbWVudGlvbmVkIGluIHRoZSBtYWlsIGFyY2hpdmUgcmVm
ZXJyZWQsIHRoZSBHQiBDb2RlYyBkcml2ZXIgdGhhdCBpcwo+IGN1cnJlbnRseSBhdmFpbGFibGUg
aW4ga2VybmVsIHRyZWUgaXMgZGVwZW5kZW50IG9uIHF1YWxjb21tIGF1ZGlvCj4gZHJpdmVyLiBB
bmQgc29tZSB0aW1lIGxhdGVyIEkgbWFkZSBzb21lIG1pbm9yIG1vZGlmaWNhdGlvbnMgdG8gcmVt
b3ZlCj4gdGhlIHVubmVjZXNzYXJ5IGRlcGVuZGVuY2llcy4gSG93ZXZlciwgSSBtaXNzZWQgdG8g
c2hhcmUgdGhlIHNhbWUgd2l0aAo+IHRoZSBjb21tdW5pdHkgOigKPiAKPiBUaGFua3MgdG8geW91
IGZvciB0cmlnZ2VyaW5nIHRoZSB0aHJlYWQuIE5vdywgSSBjb3VsZCByZXRyaWV2ZSBteSBsb2Nh
bAo+IGNoYW5nZXMgYW5kIEkgaGF2ZSBiZWVuIGluIHRoZSBwcm9jZXNzIG9mIHVwZGF0aW5nIGl0
IGFnYWluIHRvIG1ha2UgaXQKPiBjb21wYXRpYmxlIHdpdGggbGF0ZXN0IGtlcm5lbC4KPiAKPiBJ
J20gcGxhbm5pbmcgdG8gc2hhcmUgdGhlIHNhbWUgaGVyZSBpbiB0aGUgbmV4dCBmZXcgZGF5cy4g
IEknbGwgbWFyayB5b3UKPiBpbiBDQyB0byBzZWVrIHlvdXIgcmV2aWV3IGNvbW1lbnRzIGFzIHdl
bGwuCgpJJ2xsIGdpdmUgeW91IGEgZmV3IG1vcmUgZGF5cyBmb3IgdGhhdCBwYXRjaCB0byBiZSBz
ZW50IGJlZm9yZSBJIGFwcGx5CnRoaXMgb25lLi4uCgp0aGFua3MsCgpncmVnIGstaApfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
