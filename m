Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B625F60F8A
	for <lists+greybus-dev@lfdr.de>; Sat,  6 Jul 2019 10:56:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BE557617DA
	for <lists+greybus-dev@lfdr.de>; Sat,  6 Jul 2019 08:56:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B14F661808; Sat,  6 Jul 2019 08:56:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1E6B6617ED;
	Sat,  6 Jul 2019 08:56:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BDA1160ED5
 for <greybus-dev@lists.linaro.org>; Sat,  6 Jul 2019 08:56:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9DE44617DA; Sat,  6 Jul 2019 08:56:09 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 97E8260ED5
 for <greybus-dev@lists.linaro.org>; Sat,  6 Jul 2019 08:56:08 +0000 (UTC)
Received: from localhost (unknown [62.119.166.9])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D581821670;
 Sat,  6 Jul 2019 08:56:06 +0000 (UTC)
Date: Sat, 6 Jul 2019 10:56:03 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Vaishnav MA <mavaishnav007@gmail.com>
Message-ID: <20190706085603.GE9955@kroah.com>
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Jason Kridner <jkridner@gmail.com>, greybus-dev@lists.linaro.org,
 Ravi Kumar Prasad <7ravikp@gmail.com>
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

T24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMDE6MTY6NDhBTSArMDUzMCwgVmFpc2huYXYgTUEgd3Jv
dGU6Cj4gSGksCj4gCj4gSSBoYXZlIGJlZW4gd29ya2luZyBvbiB0aGUgR29vZ2xlIFN1bW1lciBv
ZiBDb2RlIFByb2plY3QgOiBDbGljayBCb2FyZAo+IFN1cHBvcnQgdGhyb3VnaCBHcmV5YnVzCj4g
PGh0dHBzOi8vc3VtbWVyb2Zjb2RlLndpdGhnb29nbGUuY29tL3Byb2plY3RzLyM1OTk2NDk5OTg3
NTk1MjY0PiAsIHdoaWNoCj4gYWltcyB0byBicmluZyBpbiBzdXBwb3J0IGZvciBNaWtyb0VsZWt0
cm9uaWthIENsaWNrIEJvYXJkcwo+IDxodHRwczovL3d3dy5taWtyb2UuY29tL2NsaWNrPiB0aHJv
dWdoIEdyZXlidXMgU2ltdWxhdG9yCj4gPGh0dHBzOi8vZ2l0aHViLmNvbS9wcm9qZWN0YXJhL2di
c2ltPiAsIEkgd2FzIGFibGUgdG8gc2V0IHVwIGFuZCBicmluZyBpbgo+IHN1cHBvcnQgZm9yIHNv
bWUgb2YgdGhlIENsaWNrIGJvYXJkcyB0aHJvdWdoIEdyZXlidXMgU2ltdWxhdG9yIGFuZCBwYXNz
aW5nCj4gdGhlIHByb3BlcnRpZXMgcmVsYXRlZCB0byB0aGUgQ2xpY2sgQm9hcmQgZGV2aWNlIGRy
aXZlciBtYW5pcHVsYXRpbmcgdGhlCj4gcHJvZHVjdCBzdHJpbmcgYW5kIHZlbmRvciBzdHJpbmcg
cHJvcGVydGllcyBpbiB0aGUgbWFuaWZlc3QsIGhvd2V2ZXIgSSBhbQo+IHN0dWNrIG5vdyBhcyBz
b21lIG9mIHRoZSBjbGljayBib2FyZHMgcmVxdWlyZSBhZGRpdGlvbmFsIHBsYXRmb3JtIGRhdGEo
bGlrZQo+IFJlc2V0IFBpbiwgSW50ZXJydXB0cy4uZXRjKSBwYXNzZWQgdG8gdGhlIHNwaV9uZXdf
ZGV2aWNlL2kyY19uZXdfZGV2aWNlCj4gY2FsbHMsIGRvZXMgR3JleWJ1cyBhbGxvdyBwYXNzaW5n
IG9mIHRoZXNlIHBhcmFtZXRlcnMgdG8gdGhlIGRyaXZlciwgaWYgc28KPiBjYW4gc29tZW9uZSBn
dWlkZSBtZSB3aXRoIHRoZSBkb2N1bWVudGF0aW9uIGZvciB0aGUgc2FtZSBvciBwb2ludCBtZSBh
Cj4gc3VpdGFibGUgZXhhbXBsZSBzbyB0aGF0IEkgY2FuIGltcGxlbWVudCB0aGUgc29sdXRpb24g
aW4gdGhlIHByb2plY3QuCgpHcmV5YnVzIGRvZXMgc3VwcG9ydCBwYXNzaW5nIHNvbWUgb2YgdGhv
c2Ugb3B0aW9ucyB0byB0aGUgZGV2aWNlLCBidXQgSQpkb24ndCBzZWUgaG93IHJlc2V0IHBpbiBh
bmQgaW50ZXJydXB0cyBtYXR0ZXIgZnJvbSB0aGUgaG9zdCBzaWRlIG9mCnRoaW5ncyBoZXJlLiAg
V2h5IGRvIHRoZXkgbmVlZCB0byBiZSBwYXNzZWQgdG8gdGhlIGdyZXlidXMgaG9zdD8gIEFyZW4n
dAp0aGV5IHNwZWNpZmljIHRvIHRoZSBncmV5YnVzICJkZXZpY2UiIGluIGhvdyBpdCBhY3R1YWxs
eSB0dXJucyB0aG9zZQpncmV5YnVzIG1lc3NhZ2VzIGludG8gc3BlY2lmaWMgY29tbWFuZHMgdG8g
dGhlIHJlYWwgaGFyZHdhcmU/CgpZb3UgImtub3ciIHRoZSBpbnRlcnJ1cHQgYW5kIHJlc2V0IHBp
biBhbmQgdGhvc2UgYXR0cmlidXRlcyBvbiB0aGUKZGV2aWNlLCBhbmQgdXNlIHRoYXQgZm9yIHdo
ZW4geW91IG5lZWQgdG8gdGFsayB0byB0aGUgcmVhbCBoYXJkd2FyZQpkZXZpY2UuICBHcmV5YnVz
IGlzIGp1c3QgYSB0cmFuc2ZlciBsYXllciBvZiBhIGdlbmVyaWMgU1BJL0kyQyBtZXNzYWdlCnRv
IHRoZSBkZXZpY2UgaXRzZWxmLgoKRG9lcyB0aGF0IGhlbHAgYW55PwoKPiAgSWYgZ3JleWJ1cyBk
b2Vzbid0IGFsbG93IGZvciBwYXNzaW5nIHRoZXNlIHBhcmFtZXRlcnMgd2hhdCB3b3VsZCBiZSB0
aGUKPiBpZGVhbCB3YXkgdG8gYnJpbmcgaW4gc3VwcG9ydCBmb3IgdGhlc2UgY2xpY2sgYm9hcmRz
KHdoaWNoIG1vc3RseSB1c2VzCj4gU1BJL0kyQyBpbnRlcmZhY2VzKSB0aHJvdWdoIHRoZSBncmV5
YnVzIHN1YnN5c3RlbT8uCgpKdXN0IGNyZWF0ZSBhIG5ldyBncmV5YnVzIGRldmljZSBmb3IgZWFj
aCBib2FyZCBhbmQgeW91IHNob3VsZCBiZSBmaW5lLgoKdGhhbmtzLAoKZ3JlZyBrLWgKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5h
cm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
