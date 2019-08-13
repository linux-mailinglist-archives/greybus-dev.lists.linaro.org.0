Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD88C123
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Aug 2019 20:57:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6CE2161883
	for <lists+greybus-dev@lfdr.de>; Tue, 13 Aug 2019 18:57:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5E7A061885; Tue, 13 Aug 2019 18:57:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B89466187F;
	Tue, 13 Aug 2019 18:56:46 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DF9586186A
 for <greybus-dev@lists.linaro.org>; Tue, 13 Aug 2019 18:56:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D04136187B; Tue, 13 Aug 2019 18:56:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 90C5B6186A
 for <greybus-dev@lists.linaro.org>; Tue, 13 Aug 2019 18:56:42 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 50E5520842;
 Tue, 13 Aug 2019 18:56:41 +0000 (UTC)
Date: Tue, 13 Aug 2019 20:55:15 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Christopher Friedt <chrisfriedt@gmail.com>
Message-ID: <20190813185515.GA11890@kroah.com>
References: <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
 <20190713154843.GA12533@kroah.com>
 <CAFPGqov1AbeA16sJLJCWKod6QMqkCigt57sC1n-+FH9-Wxgpvw@mail.gmail.com>
 <20190716192544.GA27918@kroah.com>
 <CA+T6QPnSqhi4Xr+0ooh+Thkd8oQFfH=djZ=NgoWFWE4D=Mz0Jw@mail.gmail.com>
 <CA+T6QPm5+f2mLqbv3o9yd2S9BvvVD-U9GA-yisXuowhuB6Qijg@mail.gmail.com>
 <CA+T6QPkSZr9ignCZGhaifpOWE6517fELRDjJp6f3bAWDOft0JQ@mail.gmail.com>
 <CAF4BF-TE2OyH9z16NWisy856qULa6F1+ao4BDgQukSDqi6vmEw@mail.gmail.com>
 <CAF4BF-Qmem3xQGKCfREi5__N0QhAJkP6K1LZX5q6bSkKxzmwHA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAF4BF-Qmem3xQGKCfREi5__N0QhAJkP6K1LZX5q6bSkKxzmwHA@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Christopher Friedt <chris@friedt.co>, greybus-dev@lists.linaro.org,
 Vaishnav MA <mavaishnav007@gmail.com>
Subject: Re: [greybus-dev] Greybus For IoT : Click Board Support on
 Beaglebone Boards
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTI6NDk6NTlQTSAtMDQwMCwgQ2hyaXN0b3BoZXIgRnJp
ZWR0IHdyb3RlOgo+IE9uIE1vbiwgQXVnIDEyLCAyMDE5IGF0IDEyOjQ3IFBNIENocmlzdG9waGVy
IEZyaWVkdAo+IDxjaHJpc2ZyaWVkdEBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwg
QXVnIDEyLCAyMDE5IGF0IDExOjIzIEFNIEphc29uIEtyaWRuZXIgPGprcmlkbmVyQGJlYWdsZWJv
YXJkLm9yZz4gd3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDEyOjQz
IFBNIEphc29uIEtyaWRuZXIgPGprcmlkbmVyQGJlYWdsZWJvYXJkLm9yZz4gd3JvdGU6Cj4gPiA+
ID4gT24gV2VkLCBKdWwgMTcsIDIwMTkgYXQgMTE6MjggQU0gSmFzb24gS3JpZG5lciA8amtyaWRu
ZXJAYmVhZ2xlYm9hcmQub3JnPiB3cm90ZToKPiA+ID4gPiA+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5
IGF0IDM6MjUgUE0gR3JlZyBLSCA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+
ID4gPiA+ID4gPiBPbiBTdW4sIEp1bCAxNCwgMjAxOSBhdCAwMToxMzozN0FNICswNTMwLCBWYWlz
aG5hdiBNQSB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IE9uIFNhdCwgSnVsIDEzLCAyMDE5IGF0IDA2
OjAzOjAyUE0gKzA1MzAsIFZhaXNobmF2IE1BIHdyb3RlOgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkg
YmVsaWV2ZSB0aGVyZSBhcmUgdHdvIHByb2JsZW1zIGhlcmUgdG8gc29sdmU6Cj4gPiA+Cj4gPiA+
IExldCdzIGp1c3QgZm9jdXMgb24gIzEuCj4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gMS4gSG93
IGRvIHdlIHNwZWNpZnkgdGhlIGV4dHJhIGRhdGE/Cj4gPiA+Cj4gPiA+IFRoZSAqZXh0cmEqIGRh
dGEgaGVyZSBpcyB3aGF0ZXZlciBlbHNlIGEgZHJpdmVyIG5lZWRzIHRvIGxvYWQuIE1hbmlmZXN0
cyBoYXZlIHRoZSBidXNlcyBuZWVkZWQgYW5kIG5hbWUgdG8gZmluZCB0aGUgZHJpdmVyLCBidXQg
YXJlIG1pc3NpbmcgYW55IGFzc29jaWF0aW9uIGJldHdlZW4gZXh0cmEgc2lnbmFscywgbGlrZSBJ
UlEgb3Igb3RoZXIgbmFtZWQgR1BJT3MuIFdlJ2QgbGlrZSBhIGNvbW1vbiB3YXkgdG8gc3BlY2lm
eSB0aG9zZS4KPiA+ID4KPiA+ID4gQ2hyaXMgaGFzIHN1Z2dlc3RlZCBhZGRpbmcgc29tZSBhZGRp
dGlvbmFsIGRhdGEgdG8gdGhlIG1hbmlmZXN0cywgbGlrZQo+ID4gPgo+ID4gPiBbc3RyaW5nLWRl
c2NyaXB0b3IgMl1zdHJpbmcgPSBkcml2ZXItc3BlY2lmaWMtZ3Bpby1uYW1lPW1hbmlmZXN0LXNw
ZWNpZmljLWdwaW8tbmFtZQo+ID4KPiA+IEhpIC0gSSdsbCBjaGltZSBpbiBoZXJlIGJlY2F1c2Ug
SVJDIGRpZCBub3QgcmVhbGx5IHByZXNlcnZlCj4gPiBmb3JtYXR0aW5nLiBNYXliZSBncmV5YnVz
IGtlcm5lbCBjb2RlIC8gbWFuaWZlc3RvIGFscmVhZHkgaW1wbGVtZW50cwo+ID4gc29tZXRoaW5n
IGxpa2UgdGhpcywgYnV0IEkganVzdCBoYXZlbid0IHNlZW4gaXQuCj4gPgo+ID4gTXkgdGhvdWdo
dHMgd2VyZSB0aGF0IG1hbmlmZXN0cyBjb3VsZCBiZSBhIHNvdXJjZSBvZiBwbGF0Zm9ybV9kYXRh
IGluCj4gPiB0aGUga2VybmVsIGp1c3QgbGlrZSBkZXZpY2V0cmVlIG9yIGFjcGksIGFjY2Vzc2Vk
IHRocm91Z2ggdGhlCj4gPiBsaW51eC9vZi5oIGludGVyZmFjZSBpbiBkcml2ZXIgY29kZS4KPiA+
Cj4gPiBGb3IgYSBjb250cml2ZWQgZXhhbXBsZSwgaW1hZ2luZSBhbiBzZW5zb3IgImZvbyIsIHRo
YXQgaW50ZXJydXB0cyB0aGUKPiA+IGhvc3Qgd2hlbiB0ZW1wZXJhdHVyZSBnZXRzIHJlYWxseSBo
b3QsIHRoZSBkcml2ZXIgZGVwZW5kcyBvbiBEVCBvcgo+ID4gc29tZXRoaW5nIHRvIHF1ZXJ5IHRo
ZSB2YWx1ZSBhc3NvY2lhdGVkIHdpdGggdGhlCj4gPiAiZm9vLGludGVycnVwdC1zb3VyY2UiIGtl
eS4gVGhlIGRyaXZlciB3b3VsZCB0aGVuIG1ha2UgYQo+ID4KPiA+IG9mX3Byb3BlcnR5X3JlYWRf
c3RyaW5nKG5vZGUsICJmb28saW50ZXJydXB0LXNvdXJjZSIpID0+Cj4gPiAibXltb2R1bGUsZm9v
LWludGVycnVwdC1ncGlvIgo+ID4gLi4uCj4gPiBncGlvX2ZpbmRfZGV2aWNlKCAibXltb2R1bGUs
Zm9vLWludGVycnVwdC1ncGlvIiApCj4gPgo+ID4gSW4gYW55IGNhc2UsIG15IHN1Z2dlc3Rpb24g
aXMgdG8gZG8gc29tZXRoaW5nIGxpa2UgdGhlIGZvbGxvd2luZwo+ID4gaW5zaWRlIHRoZSBtYW5p
ZmVzdDoKPiA+Cj4gPiBbcHJvcGVydHkgMV0KPiA+IHR5cGUgPSBzdHJpbmcKPiA+IHZhbHVlID0g
bXltb2R1bGUsZm9vLWludGVycnVwdC1ncGlvCj4gPgo+ID4gW3Byb3BlcnR5IDJdCj4gPiB0eXBl
ID0gdTgKPiA+IHZhbHVlID0gMTEKPiA+Cj4gPiA7IFNlbnNvciBwcm90b2NvbCBvbiBDUG9ydCAx
Cj4gPiBbY3BvcnQtZGVzY3JpcHRvciAxXQo+ID4gYnVuZGxlID0gMQo+ID4gcHJvdG9jb2wgPSAw
eDBlCj4gPiBwcm9wZXJ0eSA9IGZvbyxpbnRlcnJ1cHQtc291cmNlLCAxCj4gPgo+ID4gOyBHUElP
IHByb3RvY29sIG9uIENQb3J0IDIKPiA+IFtjcG9ydC1kZXNjcmlwdG9yIDJdCj4gPiBidW5kbGUg
PSAyCj4gPiBwcm90b2NvbCA9IDB4MDIKPiA+IHByb3BlcnR5ID0gbXltb2R1bGUsZm9vLWludGVy
cnVwdC1ncGlvLCAyCj4gPgo+ID4gQ2FyZSB3b3VsZCBuZWVkIHRvIGJlIHRha2VuIHRoYXQgYWxs
IG9mIHRoZSBwcm9wZXJ0eSB0eXBlcyBkZWZpbmVkIGluCj4gPiBsaW51eC9vZi5oIHdlcmUgYWNj
b3VudGVkIGZvci4KPiAKPiBUaGlzIHdvdWxkIHJlcXVpcmUgYSByZXYgdG8gdGhlIG1hbmlmZXN0
IHNwZWNpZmljYXRpb24sIGFuZCBhbHNvIHNvbWUKPiBwbHVtYmluZyBpbiB0aGUga2VybmVsLgoK
SSBoYXZlIG5vIG9iamVjdGlvbiB0byB0aGF0IGFzIGxvbmcgYXMgd2UgY2FuIGRvIHNvIGluIGEK
YmFja3dhcmRzLWNvbXBhdGlibGUgd2F5IChhbmQgSSB0aGluayB3ZSBjYW4pLgoKdGhhbmtzLAoK
Z3JlZyBrLWgKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
