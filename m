Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DFA28315A
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Oct 2020 10:04:43 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 39A3D616E2
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Oct 2020 08:04:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2B6846167C; Mon,  5 Oct 2020 08:04:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8F05066008;
	Mon,  5 Oct 2020 08:04:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2934E60E02
 for <greybus-dev@lists.linaro.org>; Sat, 26 Sep 2020 10:12:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 103166174C; Sat, 26 Sep 2020 10:12:05 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by lists.linaro.org (Postfix) with ESMTPS id E38CB60E02
 for <greybus-dev@lists.linaro.org>; Sat, 26 Sep 2020 10:12:03 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-64-PSRh-TBCNJOepc9cDIXbnQ-1; Sat, 26 Sep 2020 11:12:00 +0100
X-MC-Unique: PSRh-TBCNJOepc9cDIXbnQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Sat, 26 Sep 2020 11:11:59 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Sat, 26 Sep 2020 11:11:59 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Coiby Xu' <coiby.xu@gmail.com>
Thread-Topic: [PATCH 3/3] [PATCH] staging: greybus: __u8 is sufficient for
 snd_ctl_elem_type_t and snd_ctl_elem_iface_t
Thread-Index: AQHWklx17fnZOC5vd0GG3zjgQ4eUS6l3nRcQgAG47oCAAV+6oA==
Date: Sat, 26 Sep 2020 10:11:59 +0000
Message-ID: <cd09e7c7abaa4700bf9a0245d5844c44@AcuMS.aculab.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
 <0175c477851243baa8a92177667d6312@AcuMS.aculab.com>
 <20200925141125.vfm5sjnsfvxo2ras@Rk>
In-Reply-To: <20200925141125.vfm5sjnsfvxo2ras@Rk>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 05 Oct 2020 08:04:12 +0000
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Jaroslav Kysela <perex@perex.cz>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [greybus-dev] [PATCH 3/3] [PATCH] staging: greybus: __u8 is
 sufficient for snd_ctl_elem_type_t and snd_ctl_elem_iface_t
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

RnJvbTogQ29pYnkgWHUKPiBTZW50OiAyNSBTZXB0ZW1iZXIgMjAyMCAxNToxMQo+IAo+IE9uIFRo
dSwgU2VwIDI0LCAyMDIwIGF0IDEwOjU0OjUwQU0gKzAwMDAsIERhdmlkIExhaWdodCB3cm90ZToK
PiA+RnJvbTogQ29pYnkgWHUKPiA+PiBTZW50OiAyNCBTZXB0ZW1iZXIgMjAyMCAxMToyMQo+ID4+
IFVzZSBfXzggdG8gcmVwbGFjZSBpbnQgYW5kIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgX19iaXR3
aXNlIHR5cGUgYXR0cmlidXRlLgo+ID4+Cj4gPj4gRm91bmQgYnkgc3BhcnNlLAo+ID4uLi4KPiA+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oIGIvaW5jbHVkZS91YXBp
L3NvdW5kL2Fzb3VuZC5oCj4gPj4gaW5kZXggNTM1YTcyMjllMWQ5Li44ZTcxYTk1NjQ0YWIgMTAw
NjQ0Cj4gPj4gLS0tIGEvaW5jbHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oCj4gPj4gKysrIGIvaW5j
bHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oCj4gPj4gQEAgLTk1MCw3ICs5NTAsNyBAQCBzdHJ1Y3Qg
c25kX2N0bF9jYXJkX2luZm8gewo+ID4+ICAJdW5zaWduZWQgY2hhciBjb21wb25lbnRzWzEyOF07
CS8qIGNhcmQgY29tcG9uZW50cyAvIGZpbmUgaWRlbnRpZmljYXRpb24sIGRlbGltaXRlZCB3aXRo
IG9uZQo+ID4+IHNwYWNlIChBQzk3IGV0Yy4uKSAqLwo+ID4+ICB9Owo+ID4+Cj4gPj4gLXR5cGVk
ZWYgaW50IF9fYml0d2lzZSBzbmRfY3RsX2VsZW1fdHlwZV90Owo+ID4+ICt0eXBlZGVmIF9fdTgg
c25kX2N0bF9lbGVtX3R5cGVfdDsKPiA+PiAgI2RlZmluZQlTTkRSVl9DVExfRUxFTV9UWVBFX05P
TkUJKChfX2ZvcmNlIHNuZF9jdGxfZWxlbV90eXBlX3QpIDApIC8qIGludmFsaWQgKi8KPiA+PiAg
I2RlZmluZQlTTkRSVl9DVExfRUxFTV9UWVBFX0JPT0xFQU4JKChfX2ZvcmNlIHNuZF9jdGxfZWxl
bV90eXBlX3QpIDEpIC8qIGJvb2xlYW4gdHlwZSAqLwo+ID4+ICAjZGVmaW5lCVNORFJWX0NUTF9F
TEVNX1RZUEVfSU5URUdFUgkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX3R5cGVfdCkgMikgLyogaW50
ZWdlciB0eXBlICovCj4gPgo+ID5XVEYgaXMgYWxsIHRoYXQgYWJvdXQgYW55d2F5Pz8KPiA+V2hh
dCBpcyB3cm9uZyB3aXRoOgo+ID4jZGVmaW5lCVNORFJWX0NUTF9FTEVNX1RZUEVfTk9ORQkwdSAv
KiBpbnZhbGlkICovCj4gCj4gSSdtIHNvcnJ5IEkgZG9uJ3QgcXVpdGUgdW5kZXJzdGFuZCB5b3Uu
IEFyZSB5b3Ugc3VnZ2VzdGluZyBTTkRSVl9DVExfRUxFTV9UWVBFX05PTkUKPiBpc24ndCBuZWVk
ZWQgaW4gdGhlIGZpcnN0IHBsYWNlPwoKTm8sIGp1c3QgcmVtb3ZlIGFsbCB0aGUgY2FzdHMgZnJv
bSB0aGUgY29uc3RhbnRzLgpBcmUgdGhlIHR5cGVzIGV2ZW4gdXNlZCBhbnl3aGVyZSBlbHNlPwoK
CURhdmlkCgotClJlZ2lzdGVyZWQgQWRkcmVzcyBMYWtlc2lkZSwgQnJhbWxleSBSb2FkLCBNb3Vu
dCBGYXJtLCBNaWx0b24gS2V5bmVzLCBNSzEgMVBULCBVSwpSZWdpc3RyYXRpb24gTm86IDEzOTcz
ODYgKFdhbGVzKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
