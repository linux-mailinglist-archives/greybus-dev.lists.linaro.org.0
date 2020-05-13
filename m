Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C95E1D1F62
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 21:38:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C564465F8B
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 19:38:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B8D7165F8F; Wed, 13 May 2020 19:38:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 77B5565F8C;
	Wed, 13 May 2020 19:38:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 79A9E65F89
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 19:38:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 652AE65F8B; Wed, 13 May 2020 19:38:15 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by lists.linaro.org (Postfix) with ESMTPS id 6FA9065F89
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 19:38:14 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id y13so515955vsk.8
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 12:38:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ke4uWAP9sQZ5K5ZqcbNueL/vqjGx4KuSfWacNnG9IP8=;
 b=VV9gxkBvtruKDKGuoGguWz3b+D090inxa3vJd/SYPmTCR3tVVSQYjUlKQ3kgFvjH7m
 jIKvBDpMF/dc9gLJCGd8kC+KKAbaB5SXueAc9HDl7Pk+jtCjx0TGE/kZD3+8OL1u4lEJ
 EYlOBgsclLSRv9+EL5O6Tpm2jktRZHweDWe+xI6q0NrXAjR6S+62Zk25pkRiXsJcdbuu
 +yYvzFIqh6OXdfj2eKGlBf8M4J1BGa0xFJPS/mEWsln+mhzsoxr3Bbq8rYCzKmBUlW2C
 Pt0zv7lCzrqjBaLwnZmBqPHJhi18yBvWACXrpWCXR3ToeWvnuC2kUiiOI2hvCDrljNYd
 gDDw==
X-Gm-Message-State: AOAM531tpkBOFsEijybg9ZhgqfShLWQqdNeazAmMmxyWRQDkUDvpeiiY
 ULhvey6bji/Y6GLm+TBCZ+o7vFLJUdpD8hh0YfI=
X-Google-Smtp-Source: ABdhPJxXY5J5q/rrCCt9ey3fgywEcsxm9dJjt4mAdeE5DwUTG5N/TW670z8VUoUjQ46NKw8Hm0DCwBQ7+Eq+mRYUQ04=
X-Received: by 2002:a67:7f0a:: with SMTP id a10mr669800vsd.147.1589398693723; 
 Wed, 13 May 2020 12:38:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200507212912.599433-1-alexandre.belloni@bootlin.com>
 <20200513174530.GA32096@animalcreek.com>
In-Reply-To: <20200513174530.GA32096@animalcreek.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Thu, 14 May 2020 01:07:36 +0530
Message-ID: <CAAs3649-3dAmUqjLiEP8Ar3dKamp7ek1o0R5WN3g8kxTgz6fFg@mail.gmail.com>
To: Mark Greer <mgreer@animalcreek.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
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

T24gV2VkLCBNYXkgMTMsIDIwMjAgYXQgMTE6MTUgUE0gTWFyayBHcmVlciA8bWdyZWVyQGFuaW1h
bGNyZWVrLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIE1heSAwNywgMjAyMCBhdCAxMToyOToxMVBN
ICswMjAwLCBBbGV4YW5kcmUgQmVsbG9uaSB3cm90ZToKPiA+IEdSRVlCVVNfQVVESU9fTVNNODk5
NCBpcyBub3QgYW4gZXhpc3RpbmcgY29uZmlndXJhdGlvbiBvcHRpb24gYW5kIGFzCj4gPiByZXBv
cnRlZCBpbiBTZXB0ZW1iZXIgMjAxNiwgaXQgZGVwZW5kcyBvbiBhbiAib3V0LW9mLXRyZWUgcXVh
bGNvbW0gYXVkaW8KPiA+IGRyaXZlciIuIFRoaXMgZHJpdmVyIG5ldmVyIG1hZGUgaXQgdXBzdHJl
YW0uCj4gPgo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDE2MDkyMTA3MzkwNS5H
QTMxMjYzQGtyb2FoLmNvbS8KPiA+Cj4gPiBNb3Jlb3ZlciwgdGhlcmUgZG9lc24ndCBzZWVtIHRv
IGJlIGFueSBpbnRlcmVzdCBpbiBhY3R1YWxseSBmaXhpbmcgdGhlCj4gPiBkcml2ZXIgYXMgaXQg
dXNlcyBBU29DIEFQSXMgdGhhdCBoYXZlIGJlZW4gcmVtb3ZlZCBmcm9tIHRoZSBrZXJuZWwgaW4g
MjAxOAo+ID4gYXMgc2hvd24gYnkgaXRzIHVzZSBvZiBzbmRfc29jX3JlZ2lzdGVyX2NvZGVjIGFu
ZAo+ID4gc25kX3NvY19jb2RlY19nZXRfZHJ2ZGF0YSwgcmVtb3ZlZCBpbiBjb21taXQgOTk5Zjdm
NWFmOGViICgiQVNvQzogcmVtb3ZlCj4gPiBDb2RlYyByZWxhdGVkIGNvZGUiKS4KPiA+Cj4gPiBT
aWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgQmVsbG9uaSA8YWxleGFuZHJlLmJlbGxvbmlAYm9vdGxp
bi5jb20+Cj4gPiAtLS0KSGkgQWxleGFuZHJlLAoKQXMgbWVudGlvbmVkIGluIHRoZSBtYWlsIGFy
Y2hpdmUgcmVmZXJyZWQsIHRoZSBHQiBDb2RlYyBkcml2ZXIgdGhhdCBpcwpjdXJyZW50bHkgYXZh
aWxhYmxlIGluIGtlcm5lbCB0cmVlIGlzIGRlcGVuZGVudCBvbiBxdWFsY29tbSBhdWRpbwpkcml2
ZXIuIEFuZCBzb21lIHRpbWUgbGF0ZXIgSSBtYWRlIHNvbWUgbWlub3IgbW9kaWZpY2F0aW9ucyB0
byByZW1vdmUKdGhlIHVubmVjZXNzYXJ5IGRlcGVuZGVuY2llcy4gSG93ZXZlciwgSSBtaXNzZWQg
dG8gc2hhcmUgdGhlIHNhbWUgd2l0aAp0aGUgY29tbXVuaXR5IDooCgpUaGFua3MgdG8geW91IGZv
ciB0cmlnZ2VyaW5nIHRoZSB0aHJlYWQuIE5vdywgSSBjb3VsZCByZXRyaWV2ZSBteSBsb2NhbApj
aGFuZ2VzIGFuZCBJIGhhdmUgYmVlbiBpbiB0aGUgcHJvY2VzcyBvZiB1cGRhdGluZyBpdCBhZ2Fp
biB0byBtYWtlIGl0CmNvbXBhdGlibGUgd2l0aCBsYXRlc3Qga2VybmVsLgoKSSdtIHBsYW5uaW5n
IHRvIHNoYXJlIHRoZSBzYW1lIGhlcmUgaW4gdGhlIG5leHQgZmV3IGRheXMuICBJJ2xsIG1hcmsg
eW91CmluIENDIHRvIHNlZWsgeW91ciByZXZpZXcgY29tbWVudHMgYXMgd2VsbC4KCkluIGNhc2Us
IEknbSB1bmFibGUgdG8gbWFrZSB0aG9zZSBjaGFuZ2VzIHRvIHRoZSBzdGFnaW5nIHRyZWUsIEkg
d291bGQKYWxzbyByZWNvbW1lbmQgdG8gZHJvcCB0aGlzIGNvZGUuIEtpbmRseSBsZXQgbWUga25v
dyB5b3VyIG9waW5pb24uCgotLQp0aGFua3MsCi4vdmEKCj4KPiBFdmVyeXRoaW5nIHlvdSBzYXkg
aXMgdHJ1ZSBidXQgaXQgaXMgc3RpbGwga2luZGEgc2FkIHRvIHNlZSB0aGlzIGdvLgo+IEJ1dCB0
aGF0IGlzIGxpZmUuLi4gIElmIGFuZCB3aGVuIHNvbWVvbmUgaGFzIHRoZSBtb3RpdmF0aW9uIHRv
IGdldCB0aGlzCj4gd29ya2luZyBhZ2FpbiB0aGV5IGNhbiB0YWtlIGEgbG9vayBhdCB0aGUgZ2l0
IGhpc3RvcnkuCj4KPiBUaGFua3MgZm9yIHRoaXMsIEFsZXhhbmRyZS4KPgo+IEFja2VkLWJ5OiBN
YXJrIEdyZWVyIDxtZ3JlZXJAYW5pbWFsY3JlZWsuY29tPgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ncmV5YnVzLWRldgo=
