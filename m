Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C849283159
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Oct 2020 10:04:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6A6A60F5B
	for <lists+greybus-dev@lfdr.de>; Mon,  5 Oct 2020 08:04:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A1AC8615EF; Mon,  5 Oct 2020 08:04:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 617C26167C;
	Mon,  5 Oct 2020 08:04:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 90BF166464
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 10:54:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7479A66519; Thu, 24 Sep 2020 10:54:55 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [207.82.80.151])
 by lists.linaro.org (Postfix) with ESMTPS id 4108E66464
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 10:54:54 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.126 [156.67.243.126]) (Using
 TLS) by relay.mimecast.com with ESMTP id uk-mta-8-FcGvPxsNMYiYtlI_mOjfwA-1;
 Thu, 24 Sep 2020 11:54:51 +0100
X-MC-Unique: FcGvPxsNMYiYtlI_mOjfwA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:43c:695e:880f:8750) with Microsoft SMTP
 Server (TLS) id 15.0.1347.2; Thu, 24 Sep 2020 11:54:50 +0100
Received: from AcuMS.Aculab.com ([fe80::43c:695e:880f:8750]) by
 AcuMS.aculab.com ([fe80::43c:695e:880f:8750%12]) with mapi id 15.00.1347.000; 
 Thu, 24 Sep 2020 11:54:50 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Coiby Xu' <coiby.xu@gmail.com>, "devel@driverdev.osuosl.org"
 <devel@driverdev.osuosl.org>
Thread-Topic: [PATCH 3/3] [PATCH] staging: greybus: __u8 is sufficient for
 snd_ctl_elem_type_t and snd_ctl_elem_iface_t
Thread-Index: AQHWklx17fnZOC5vd0GG3zjgQ4eUS6l3nRcQ
Date: Thu, 24 Sep 2020 10:54:50 +0000
Message-ID: <0175c477851243baa8a92177667d6312@AcuMS.aculab.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
In-Reply-To: <20200924102039.43895-3-coiby.xu@gmail.com>
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
Cc: "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Johan Hovold <johan@kernel.org>, Jaroslav Kysela <perex@perex.cz>, "moderated
 list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 open list <linux-kernel@vger.kernel.org>
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

RnJvbTogQ29pYnkgWHUKPiBTZW50OiAyNCBTZXB0ZW1iZXIgMjAyMCAxMToyMQo+IFVzZSBfXzgg
dG8gcmVwbGFjZSBpbnQgYW5kIHJlbW92ZSB0aGUgdW5uZWNlc3NhcnkgX19iaXR3aXNlIHR5cGUg
YXR0cmlidXRlLgo+IAo+IEZvdW5kIGJ5IHNwYXJzZSwKLi4uCj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvdWFwaS9zb3VuZC9hc291bmQuaCBiL2luY2x1ZGUvdWFwaS9zb3VuZC9hc291bmQuaAo+IGlu
ZGV4IDUzNWE3MjI5ZTFkOS4uOGU3MWE5NTY0NGFiIDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvdWFw
aS9zb3VuZC9hc291bmQuaAo+ICsrKyBiL2luY2x1ZGUvdWFwaS9zb3VuZC9hc291bmQuaAo+IEBA
IC05NTAsNyArOTUwLDcgQEAgc3RydWN0IHNuZF9jdGxfY2FyZF9pbmZvIHsKPiAgCXVuc2lnbmVk
IGNoYXIgY29tcG9uZW50c1sxMjhdOwkvKiBjYXJkIGNvbXBvbmVudHMgLyBmaW5lIGlkZW50aWZp
Y2F0aW9uLCBkZWxpbWl0ZWQgd2l0aCBvbmUKPiBzcGFjZSAoQUM5NyBldGMuLikgKi8KPiAgfTsK
PiAKPiAtdHlwZWRlZiBpbnQgX19iaXR3aXNlIHNuZF9jdGxfZWxlbV90eXBlX3Q7Cj4gK3R5cGVk
ZWYgX191OCBzbmRfY3RsX2VsZW1fdHlwZV90Owo+ICAjZGVmaW5lCVNORFJWX0NUTF9FTEVNX1RZ
UEVfTk9ORQkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX3R5cGVfdCkgMCkgLyogaW52YWxpZCAqLwo+
ICAjZGVmaW5lCVNORFJWX0NUTF9FTEVNX1RZUEVfQk9PTEVBTgkoKF9fZm9yY2Ugc25kX2N0bF9l
bGVtX3R5cGVfdCkgMSkgLyogYm9vbGVhbiB0eXBlICovCj4gICNkZWZpbmUJU05EUlZfQ1RMX0VM
RU1fVFlQRV9JTlRFR0VSCSgoX19mb3JjZSBzbmRfY3RsX2VsZW1fdHlwZV90KSAyKSAvKiBpbnRl
Z2VyIHR5cGUgKi8KCldURiBpcyBhbGwgdGhhdCBhYm91dCBhbnl3YXk/PwpXaGF0IGlzIHdyb25n
IHdpdGg6CiNkZWZpbmUJU05EUlZfQ1RMX0VMRU1fVFlQRV9OT05FCTB1IC8qIGludmFsaWQgKi8K
CglEYXZpZAoKLQpSZWdpc3RlcmVkIEFkZHJlc3MgTGFrZXNpZGUsIEJyYW1sZXkgUm9hZCwgTW91
bnQgRmFybSwgTWlsdG9uIEtleW5lcywgTUsxIDFQVCwgVUsKUmVnaXN0cmF0aW9uIE5vOiAxMzk3
Mzg2IChXYWxlcykKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
