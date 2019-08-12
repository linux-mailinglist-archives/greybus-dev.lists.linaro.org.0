Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 351638A3AD
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 18:48:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6302461726
	for <lists+greybus-dev@lfdr.de>; Mon, 12 Aug 2019 16:48:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 57198617ED; Mon, 12 Aug 2019 16:48:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BF4AB61833;
	Mon, 12 Aug 2019 16:48:06 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4727B61726
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 16:48:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 38BB061831; Mon, 12 Aug 2019 16:48:04 +0000 (UTC)
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by lists.linaro.org (Postfix) with ESMTPS id 62F8261726
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 16:48:02 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id j7so16529602ota.9
 for <greybus-dev@lists.linaro.org>; Mon, 12 Aug 2019 09:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cCR4x/kIZB5YsRVSDLuYzv5OLqAEur1o2j+Jyb5Ffl8=;
 b=dld87rjSBYYmBQqs5eH93bfGKK3e+qYQPj/inWLqNZC8P5Uj/0iDP5y8W2pY8Crj05
 KpgcTE8Dxq1FQc+DNBOS4m/DCMf1xTefJufqUFR6hz7W8KG8u2f8eSegY1Q1+e3wrsRl
 tEUkAjKxVNIvOvrhM8Zx5SJ+PhIFDIorkIGn+6yFr7R0g46BEUwfKUJCv4Hn/jcHrrPf
 j1CJ5SGNKutUPArYbwRLexoIYSi+bJuWO6ZDuUhyaD/JlOWTjwF9y3AtN+Emov7oYfGf
 jaVc72w1TpzZ6IVVrDF+0XgEq+VFsdQmRiTw7rPnu4xAbOckM/cnNkZblFNg1ssOw2kH
 ntQg==
X-Gm-Message-State: APjAAAW6QdXY/C2uJyKbpetZthPT4dVQ0snCU4xkItNqEjDNx/dZ6cVE
 zaycD6QrAE7Fu57ijYRKISmVrDpiG5fmUR6ZTWE=
X-Google-Smtp-Source: APXvYqwx+BNDobSbEbmScOf3/LoQi3D0SEHkVYKE/spTIdS6VZrBJ4WPZA5IoSNORUAbTps3AnT14hWzJ7gKOOACu8Q=
X-Received: by 2002:a6b:621a:: with SMTP id f26mr746613iog.127.1565628481742; 
 Mon, 12 Aug 2019 09:48:01 -0700 (PDT)
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
In-Reply-To: <CA+T6QPkSZr9ignCZGhaifpOWE6517fELRDjJp6f3bAWDOft0JQ@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Mon, 12 Aug 2019 12:47:50 -0400
Message-ID: <CAF4BF-TE2OyH9z16NWisy856qULa6F1+ao4BDgQukSDqi6vmEw@mail.gmail.com>
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

T24gTW9uLCBBdWcgMTIsIDIwMTkgYXQgMTE6MjMgQU0gSmFzb24gS3JpZG5lciA8amtyaWRuZXJA
YmVhZ2xlYm9hcmQub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDEyOjQz
IFBNIEphc29uIEtyaWRuZXIgPGprcmlkbmVyQGJlYWdsZWJvYXJkLm9yZz4gd3JvdGU6Cj4gPiBP
biBXZWQsIEp1bCAxNywgMjAxOSBhdCAxMToyOCBBTSBKYXNvbiBLcmlkbmVyIDxqa3JpZG5lckBi
ZWFnbGVib2FyZC5vcmc+IHdyb3RlOgo+ID4gPiBPbiBUdWUsIEp1bCAxNiwgMjAxOSBhdCAzOjI1
IFBNIEdyZWcgS0ggPGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPiB3cm90ZToKPiA+ID4gPiBP
biBTdW4sIEp1bCAxNCwgMjAxOSBhdCAwMToxMzozN0FNICswNTMwLCBWYWlzaG5hdiBNQSB3cm90
ZToKPiA+ID4gPiA+ID4gT24gU2F0LCBKdWwgMTMsIDIwMTkgYXQgMDY6MDM6MDJQTSArMDUzMCwg
VmFpc2huYXYgTUEgd3JvdGU6Cj4gPiA+Cj4gPiA+IEkgYmVsaWV2ZSB0aGVyZSBhcmUgdHdvIHBy
b2JsZW1zIGhlcmUgdG8gc29sdmU6Cj4KPiBMZXQncyBqdXN0IGZvY3VzIG9uICMxLgo+Cj4gPiA+
Cj4gPiA+IDEuIEhvdyBkbyB3ZSBzcGVjaWZ5IHRoZSBleHRyYSBkYXRhPwo+Cj4gVGhlICpleHRy
YSogZGF0YSBoZXJlIGlzIHdoYXRldmVyIGVsc2UgYSBkcml2ZXIgbmVlZHMgdG8gbG9hZC4gTWFu
aWZlc3RzIGhhdmUgdGhlIGJ1c2VzIG5lZWRlZCBhbmQgbmFtZSB0byBmaW5kIHRoZSBkcml2ZXIs
IGJ1dCBhcmUgbWlzc2luZyBhbnkgYXNzb2NpYXRpb24gYmV0d2VlbiBleHRyYSBzaWduYWxzLCBs
aWtlIElSUSBvciBvdGhlciBuYW1lZCBHUElPcy4gV2UnZCBsaWtlIGEgY29tbW9uIHdheSB0byBz
cGVjaWZ5IHRob3NlLgo+Cj4gQ2hyaXMgaGFzIHN1Z2dlc3RlZCBhZGRpbmcgc29tZSBhZGRpdGlv
bmFsIGRhdGEgdG8gdGhlIG1hbmlmZXN0cywgbGlrZQo+Cj4gW3N0cmluZy1kZXNjcmlwdG9yIDJd
c3RyaW5nID0gZHJpdmVyLXNwZWNpZmljLWdwaW8tbmFtZT1tYW5pZmVzdC1zcGVjaWZpYy1ncGlv
LW5hbWUKCkhpIC0gSSdsbCBjaGltZSBpbiBoZXJlIGJlY2F1c2UgSVJDIGRpZCBub3QgcmVhbGx5
IHByZXNlcnZlCmZvcm1hdHRpbmcuIE1heWJlIGdyZXlidXMga2VybmVsIGNvZGUgLyBtYW5pZmVz
dG8gYWxyZWFkeSBpbXBsZW1lbnRzCnNvbWV0aGluZyBsaWtlIHRoaXMsIGJ1dCBJIGp1c3QgaGF2
ZW4ndCBzZWVuIGl0LgoKTXkgdGhvdWdodHMgd2VyZSB0aGF0IG1hbmlmZXN0cyBjb3VsZCBiZSBh
IHNvdXJjZSBvZiBwbGF0Zm9ybV9kYXRhIGluCnRoZSBrZXJuZWwganVzdCBsaWtlIGRldmljZXRy
ZWUgb3IgYWNwaSwgYWNjZXNzZWQgdGhyb3VnaCB0aGUKbGludXgvb2YuaCBpbnRlcmZhY2UgaW4g
ZHJpdmVyIGNvZGUuCgpGb3IgYSBjb250cml2ZWQgZXhhbXBsZSwgaW1hZ2luZSBhbiBzZW5zb3Ig
ImZvbyIsIHRoYXQgaW50ZXJydXB0cyB0aGUKaG9zdCB3aGVuIHRlbXBlcmF0dXJlIGdldHMgcmVh
bGx5IGhvdCwgdGhlIGRyaXZlciBkZXBlbmRzIG9uIERUIG9yCnNvbWV0aGluZyB0byBxdWVyeSB0
aGUgdmFsdWUgYXNzb2NpYXRlZCB3aXRoIHRoZQoiZm9vLGludGVycnVwdC1zb3VyY2UiIGtleS4g
VGhlIGRyaXZlciB3b3VsZCB0aGVuIG1ha2UgYQoKb2ZfcHJvcGVydHlfcmVhZF9zdHJpbmcobm9k
ZSwgImZvbyxpbnRlcnJ1cHQtc291cmNlIikgPT4KIm15bW9kdWxlLGZvby1pbnRlcnJ1cHQtZ3Bp
byIKLi4uCmdwaW9fZmluZF9kZXZpY2UoICJteW1vZHVsZSxmb28taW50ZXJydXB0LWdwaW8iICkK
CkluIGFueSBjYXNlLCBteSBzdWdnZXN0aW9uIGlzIHRvIGRvIHNvbWV0aGluZyBsaWtlIHRoZSBm
b2xsb3dpbmcKaW5zaWRlIHRoZSBtYW5pZmVzdDoKCltwcm9wZXJ0eSAxXQp0eXBlID0gc3RyaW5n
CnZhbHVlID0gbXltb2R1bGUsZm9vLWludGVycnVwdC1ncGlvCgpbcHJvcGVydHkgMl0KdHlwZSA9
IHU4CnZhbHVlID0gMTEKCjsgU2Vuc29yIHByb3RvY29sIG9uIENQb3J0IDEKW2Nwb3J0LWRlc2Ny
aXB0b3IgMV0KYnVuZGxlID0gMQpwcm90b2NvbCA9IDB4MGUKcHJvcGVydHkgPSBmb28saW50ZXJy
dXB0LXNvdXJjZSwgMQoKOyBHUElPIHByb3RvY29sIG9uIENQb3J0IDIKW2Nwb3J0LWRlc2NyaXB0
b3IgMl0KYnVuZGxlID0gMgpwcm90b2NvbCA9IDB4MDIKcHJvcGVydHkgPSBteW1vZHVsZSxmb28t
aW50ZXJydXB0LWdwaW8sIDIKCkNhcmUgd291bGQgbmVlZCB0byBiZSB0YWtlbiB0aGF0IGFsbCBv
ZiB0aGUgcHJvcGVydHkgdHlwZXMgZGVmaW5lZCBpbgpsaW51eC9vZi5oIHdlcmUgYWNjb3VudGVk
IGZvci4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
