Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A9D8A3C3
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 18:50:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EC3FE61833
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 16:50:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DDDF961837; Mon, 12 Aug 2019 16:50:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ECBE161836;
	Mon, 12 Aug 2019 16:50:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DC4D961726
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 16:50:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CB08861834; Mon, 12 Aug 2019 16:50:11 +0000 (UTC)
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by lists.linaro.org (Postfix) with ESMTPS id C61D161726
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 16:50:10 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id r21so155394307otq.6
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 09:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i7JBtZhV98AqxZgYbHMVPBUaFEZRdtTot8p1Rs7dsDc=;
 b=hR5RowUP2pmw4zuvpivsGQEl/kz9/Ms6eyx6NEuhZIAbeMZEVremJAjKKiBMtNO+y6
 L5A/yjiv4BInpJFV8Bv4uthRz3L/qdbhql2+eRFoNalsdPDbliZ3awsMxjb7dtJD3L0l
 6xyURZG1BpfRD0RSVTl1lsqOgX2V4w3DSeUX07fdY/pAEq2hWOAcCEPOngssh34Ujkqm
 UPwEUifGCGdNqbF/8Lbp6RvhU2WdtqoRNfz+gkow6+B6GgvdCmzgs+eE197F9r0KMmBM
 m+diJ9GC/hnw9sn+pvKfPwudv8YdWL0w72Qx4hnljwnuC7cnQiIYOfWHSrAeik/nLq7P
 CRxA==
X-Gm-Message-State: APjAAAVG0fqNU9Dw8P+iiP76YiXA5Z3iddQ1n7WZP0VZg0r0KhEBFSNk
 kQ5hnoh3cxXFlKYw1MFz1+KaTUUqx4M2E/j7Tho=
X-Google-Smtp-Source: APXvYqyb6JT0HW4seG2FC5R0D7akb1kGGhcA4W7wUDj9IjMtlqF0CgUD+kG0Ta8jDX5Sp0m/uYOjd9SbWB8z8xXVfnE=
X-Received: by 2002:a6b:621a:: with SMTP id f26mr754088iog.127.1565628610212; 
 Mon, 12 Aug 2019 09:50:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAFPGqosrnQmroLFRmTRNCYyqdQXnhBhJuCLo=WMphs60KvhKZQ@mail.gmail.com>
 <20190706085603.GE9955@kroah.com>
 <CAFPGqovJPQFNSYtiYyZAEkpOe2C53cifZ7Yaei_GUWKNErVz7w@mail.gmail.com>
 <20190713154843.GA12533@kroah.com>
 <CAFPGqov1AbeA16sJLJCWKod6QMqkCigt57sC1n-+FH9-Wxgpvw@mail.gmail.com>
 <20190716192544.GA27918@kroah.com>
 <CA+T6QPnSqhi4Xr+0ooh+Thkd8oQFfH=djZ=NgoWFWE4D=Mz0Jw@mail.gmail.com>
 <CA+T6QPm5+f2mLqbv3o9yd2S9BvvVD-U9GA-yisXuowhuB6Qijg@mail.gmail.com>
 <CA+T6QPkSZr9ignCZGhaifpOWE6517fELRDjJp6f3bAWDOft0JQ@mail.gmail.com>
 <CAF4BF-TE2OyH9z16NWisy856qULa6F1+ao4BDgQukSDqi6vmEw@mail.gmail.com>
In-Reply-To: <CAF4BF-TE2OyH9z16NWisy856qULa6F1+ao4BDgQukSDqi6vmEw@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 12 Aug 2019 12:49:59 -0400
Message-ID: <CAF4BF-Qmem3xQGKCfREi5__N0QhAJkP6K1LZX5q6bSkKxzmwHA@mail.gmail.com>
To: Jason Kridner <jkridner@beagleboard.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Christopher Friedt <chris@friedt.co>, Vaishnav MA <mavaishnav007@gmail.com>,
 greybus-dev@lists.linaro.org
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTI6NDcgUE0gQ2hyaXN0b3BoZXIgRnJpZWR0CjxjaHJp
c2ZyaWVkdEBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTE6
MjMgQU0gSmFzb24gS3JpZG5lciA8amtyaWRuZXJAYmVhZ2xlYm9hcmQub3JnPiB3cm90ZToKPiA+
Cj4gPiBPbiBNb24sIEp1bCAyMiwgMjAxOSBhdCAxMjo0MyBQTSBKYXNvbiBLcmlkbmVyIDxqa3Jp
ZG5lckBiZWFnbGVib2FyZC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBXZWQsIEp1bCAxNywgMjAxOSBh
dCAxMToyOCBBTSBKYXNvbiBLcmlkbmVyIDxqa3JpZG5lckBiZWFnbGVib2FyZC5vcmc+IHdyb3Rl
Ogo+ID4gPiA+IE9uIFR1ZSwgSnVsIDE2LCAyMDE5IGF0IDM6MjUgUE0gR3JlZyBLSCA8Z3JlZ2to
QGxpbnV4Zm91bmRhdGlvbi5vcmc+IHdyb3RlOgo+ID4gPiA+ID4gT24gU3VuLCBKdWwgMTQsIDIw
MTkgYXQgMDE6MTM6MzdBTSArMDUzMCwgVmFpc2huYXYgTUEgd3JvdGU6Cj4gPiA+ID4gPiA+ID4g
T24gU2F0LCBKdWwgMTMsIDIwMTkgYXQgMDY6MDM6MDJQTSArMDUzMCwgVmFpc2huYXYgTUEgd3Jv
dGU6Cj4gPiA+ID4KPiA+ID4gPiBJIGJlbGlldmUgdGhlcmUgYXJlIHR3byBwcm9ibGVtcyBoZXJl
IHRvIHNvbHZlOgo+ID4KPiA+IExldCdzIGp1c3QgZm9jdXMgb24gIzEuCj4gPgo+ID4gPiA+Cj4g
PiA+ID4gMS4gSG93IGRvIHdlIHNwZWNpZnkgdGhlIGV4dHJhIGRhdGE/Cj4gPgo+ID4gVGhlICpl
eHRyYSogZGF0YSBoZXJlIGlzIHdoYXRldmVyIGVsc2UgYSBkcml2ZXIgbmVlZHMgdG8gbG9hZC4g
TWFuaWZlc3RzIGhhdmUgdGhlIGJ1c2VzIG5lZWRlZCBhbmQgbmFtZSB0byBmaW5kIHRoZSBkcml2
ZXIsIGJ1dCBhcmUgbWlzc2luZyBhbnkgYXNzb2NpYXRpb24gYmV0d2VlbiBleHRyYSBzaWduYWxz
LCBsaWtlIElSUSBvciBvdGhlciBuYW1lZCBHUElPcy4gV2UnZCBsaWtlIGEgY29tbW9uIHdheSB0
byBzcGVjaWZ5IHRob3NlLgo+ID4KPiA+IENocmlzIGhhcyBzdWdnZXN0ZWQgYWRkaW5nIHNvbWUg
YWRkaXRpb25hbCBkYXRhIHRvIHRoZSBtYW5pZmVzdHMsIGxpa2UKPiA+Cj4gPiBbc3RyaW5nLWRl
c2NyaXB0b3IgMl1zdHJpbmcgPSBkcml2ZXItc3BlY2lmaWMtZ3Bpby1uYW1lPW1hbmlmZXN0LXNw
ZWNpZmljLWdwaW8tbmFtZQo+Cj4gSGkgLSBJJ2xsIGNoaW1lIGluIGhlcmUgYmVjYXVzZSBJUkMg
ZGlkIG5vdCByZWFsbHkgcHJlc2VydmUKPiBmb3JtYXR0aW5nLiBNYXliZSBncmV5YnVzIGtlcm5l
bCBjb2RlIC8gbWFuaWZlc3RvIGFscmVhZHkgaW1wbGVtZW50cwo+IHNvbWV0aGluZyBsaWtlIHRo
aXMsIGJ1dCBJIGp1c3QgaGF2ZW4ndCBzZWVuIGl0Lgo+Cj4gTXkgdGhvdWdodHMgd2VyZSB0aGF0
IG1hbmlmZXN0cyBjb3VsZCBiZSBhIHNvdXJjZSBvZiBwbGF0Zm9ybV9kYXRhIGluCj4gdGhlIGtl
cm5lbCBqdXN0IGxpa2UgZGV2aWNldHJlZSBvciBhY3BpLCBhY2Nlc3NlZCB0aHJvdWdoIHRoZQo+
IGxpbnV4L29mLmggaW50ZXJmYWNlIGluIGRyaXZlciBjb2RlLgo+Cj4gRm9yIGEgY29udHJpdmVk
IGV4YW1wbGUsIGltYWdpbmUgYW4gc2Vuc29yICJmb28iLCB0aGF0IGludGVycnVwdHMgdGhlCj4g
aG9zdCB3aGVuIHRlbXBlcmF0dXJlIGdldHMgcmVhbGx5IGhvdCwgdGhlIGRyaXZlciBkZXBlbmRz
IG9uIERUIG9yCj4gc29tZXRoaW5nIHRvIHF1ZXJ5IHRoZSB2YWx1ZSBhc3NvY2lhdGVkIHdpdGgg
dGhlCj4gImZvbyxpbnRlcnJ1cHQtc291cmNlIiBrZXkuIFRoZSBkcml2ZXIgd291bGQgdGhlbiBt
YWtlIGEKPgo+IG9mX3Byb3BlcnR5X3JlYWRfc3RyaW5nKG5vZGUsICJmb28saW50ZXJydXB0LXNv
dXJjZSIpID0+Cj4gIm15bW9kdWxlLGZvby1pbnRlcnJ1cHQtZ3BpbyIKPiAuLi4KPiBncGlvX2Zp
bmRfZGV2aWNlKCAibXltb2R1bGUsZm9vLWludGVycnVwdC1ncGlvIiApCj4KPiBJbiBhbnkgY2Fz
ZSwgbXkgc3VnZ2VzdGlvbiBpcyB0byBkbyBzb21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nCj4g
aW5zaWRlIHRoZSBtYW5pZmVzdDoKPgo+IFtwcm9wZXJ0eSAxXQo+IHR5cGUgPSBzdHJpbmcKPiB2
YWx1ZSA9IG15bW9kdWxlLGZvby1pbnRlcnJ1cHQtZ3Bpbwo+Cj4gW3Byb3BlcnR5IDJdCj4gdHlw
ZSA9IHU4Cj4gdmFsdWUgPSAxMQo+Cj4gOyBTZW5zb3IgcHJvdG9jb2wgb24gQ1BvcnQgMQo+IFtj
cG9ydC1kZXNjcmlwdG9yIDFdCj4gYnVuZGxlID0gMQo+IHByb3RvY29sID0gMHgwZQo+IHByb3Bl
cnR5ID0gZm9vLGludGVycnVwdC1zb3VyY2UsIDEKPgo+IDsgR1BJTyBwcm90b2NvbCBvbiBDUG9y
dCAyCj4gW2Nwb3J0LWRlc2NyaXB0b3IgMl0KPiBidW5kbGUgPSAyCj4gcHJvdG9jb2wgPSAweDAy
Cj4gcHJvcGVydHkgPSBteW1vZHVsZSxmb28taW50ZXJydXB0LWdwaW8sIDIKPgo+IENhcmUgd291
bGQgbmVlZCB0byBiZSB0YWtlbiB0aGF0IGFsbCBvZiB0aGUgcHJvcGVydHkgdHlwZXMgZGVmaW5l
ZCBpbgo+IGxpbnV4L29mLmggd2VyZSBhY2NvdW50ZWQgZm9yLgoKVGhpcyB3b3VsZCByZXF1aXJl
IGEgcmV2IHRvIHRoZSBtYW5pZmVzdCBzcGVjaWZpY2F0aW9uLCBhbmQgYWxzbyBzb21lCnBsdW1i
aW5nIGluIHRoZSBrZXJuZWwuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
