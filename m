Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A01F276F35
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 13:01:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A0B5566464
	for <lists+greybus-dev@lfdr.de>; Thu, 24 Sep 2020 11:00:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 922FD66529; Thu, 24 Sep 2020 11:00:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC81466524;
	Thu, 24 Sep 2020 11:00:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8311366464
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 11:00:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 649FA66521; Thu, 24 Sep 2020 11:00:43 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2F9C166464
 for <greybus-dev@lists.linaro.org>; Thu, 24 Sep 2020 11:00:42 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 841AA2396E;
 Thu, 24 Sep 2020 11:00:40 +0000 (UTC)
Date: Thu, 24 Sep 2020 13:00:57 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Coiby Xu <coiby.xu@gmail.com>
Message-ID: <20200924110057.GA319713@kroah.com>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <20200924102039.43895-3-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200924102039.43895-3-coiby.xu@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 "moderated list:SOUND" <alsa-devel@alsa-project.org>,
 Alex Elder <elder@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Johan Hovold <johan@kernel.org>, Jaroslav Kysela <perex@perex.cz>
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

T24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMDY6MjA6MzlQTSArMDgwMCwgQ29pYnkgWHUgd3JvdGU6
Cj4gVXNlIF9fOCB0byByZXBsYWNlIGludCBhbmQgcmVtb3ZlIHRoZSB1bm5lY2Vzc2FyeSBfX2Jp
dHdpc2UgdHlwZSBhdHRyaWJ1dGUuCj4gCj4gRm91bmQgYnkgc3BhcnNlLAo+IAo+ICQgbWFrZSBD
PTIgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvCj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9fdG9wb2xvZ3kuYzoxODU6MjQ6IHdhcm5pbmc6IGNhc3QgdG8gcmVzdHJpY3RlZCBzbmRfY3Rs
X2VsZW1fdHlwZV90Cj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo2
Nzk6MTQ6IHdhcm5pbmc6IHJlc3RyaWN0ZWQgc25kX2N0bF9lbGVtX2lmYWNlX3QgZGVncmFkZXMg
dG8gaW50ZWdlcgo+IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6OTA2
OjE0OiB3YXJuaW5nOiByZXN0cmljdGVkIHNuZF9jdGxfZWxlbV9pZmFjZV90IGRlZ3JhZGVzIHRv
IGludGVnZXIKPiAKPiBTaWduZWQtb2ZmLWJ5OiBDb2lieSBYdSA8Y29pYnkueHVAZ21haWwuY29t
Pgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jIHwgMiAr
LQo+ICBpbmNsdWRlL3VhcGkvc291bmQvYXNvdW5kLmggICAgICAgICAgICAgIHwgNCArKy0tCj4g
IDIgZmlsZXMgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jIGIvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwo+IGluZGV4IDU2YmYxYTRmOTVh
ZC4uZjYwMjNmZjM5MGMyIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1
ZGlvX3RvcG9sb2d5LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb190b3Bv
bG9neS5jCj4gQEAgLTE4Miw3ICsxODIsNyBAQCBzdGF0aWMgaW50IGdiY29kZWNfbWl4ZXJfY3Rs
X2luZm8oc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4gIAkvKiB1cGRhdGUgdWluZm8g
Ki8KPiAgCXVpbmZvLT5hY2Nlc3MgPSBkYXRhLT5hY2Nlc3M7Cj4gIAl1aW5mby0+Y291bnQgPSBk
YXRhLT52Y291bnQ7Cj4gLQl1aW5mby0+dHlwZSA9IChzbmRfY3RsX2VsZW1fdHlwZV90KWluZm8t
PnR5cGU7Cj4gKwl1aW5mby0+dHlwZSA9IGluZm8tPnR5cGU7Cj4gIAo+ICAJc3dpdGNoIChpbmZv
LT50eXBlKSB7Cj4gIAljYXNlIEdCX0FVRElPX0NUTF9FTEVNX1RZUEVfQk9PTEVBTjoKPiBkaWZm
IC0tZ2l0IGEvaW5jbHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oIGIvaW5jbHVkZS91YXBpL3NvdW5k
L2Fzb3VuZC5oCj4gaW5kZXggNTM1YTcyMjllMWQ5Li44ZTcxYTk1NjQ0YWIgMTAwNjQ0Cj4gLS0t
IGEvaW5jbHVkZS91YXBpL3NvdW5kL2Fzb3VuZC5oCj4gKysrIGIvaW5jbHVkZS91YXBpL3NvdW5k
L2Fzb3VuZC5oCj4gQEAgLTk1MCw3ICs5NTAsNyBAQCBzdHJ1Y3Qgc25kX2N0bF9jYXJkX2luZm8g
ewo+ICAJdW5zaWduZWQgY2hhciBjb21wb25lbnRzWzEyOF07CS8qIGNhcmQgY29tcG9uZW50cyAv
IGZpbmUgaWRlbnRpZmljYXRpb24sIGRlbGltaXRlZCB3aXRoIG9uZSBzcGFjZSAoQUM5NyBldGMu
LikgKi8KPiAgfTsKPiAgCj4gLXR5cGVkZWYgaW50IF9fYml0d2lzZSBzbmRfY3RsX2VsZW1fdHlw
ZV90Owo+ICt0eXBlZGVmIF9fdTggc25kX2N0bF9lbGVtX3R5cGVfdDsKPiAgI2RlZmluZQlTTkRS
Vl9DVExfRUxFTV9UWVBFX05PTkUJKChfX2ZvcmNlIHNuZF9jdGxfZWxlbV90eXBlX3QpIDApIC8q
IGludmFsaWQgKi8KPiAgI2RlZmluZQlTTkRSVl9DVExfRUxFTV9UWVBFX0JPT0xFQU4JKChfX2Zv
cmNlIHNuZF9jdGxfZWxlbV90eXBlX3QpIDEpIC8qIGJvb2xlYW4gdHlwZSAqLwo+ICAjZGVmaW5l
CVNORFJWX0NUTF9FTEVNX1RZUEVfSU5URUdFUgkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX3R5cGVf
dCkgMikgLyogaW50ZWdlciB0eXBlICovCj4gQEAgLTk2MCw3ICs5NjAsNyBAQCB0eXBlZGVmIGlu
dCBfX2JpdHdpc2Ugc25kX2N0bF9lbGVtX3R5cGVfdDsKPiAgI2RlZmluZQlTTkRSVl9DVExfRUxF
TV9UWVBFX0lOVEVHRVI2NAkoKF9fZm9yY2Ugc25kX2N0bF9lbGVtX3R5cGVfdCkgNikgLyogNjQt
Yml0IGludGVnZXIgdHlwZSAqLwo+ICAjZGVmaW5lCVNORFJWX0NUTF9FTEVNX1RZUEVfTEFTVAlT
TkRSVl9DVExfRUxFTV9UWVBFX0lOVEVHRVI2NAo+ICAKPiAtdHlwZWRlZiBpbnQgX19iaXR3aXNl
IHNuZF9jdGxfZWxlbV9pZmFjZV90Owo+ICt0eXBlZGVmIF9fdTggc25kX2N0bF9lbGVtX2lmYWNl
X3Q7Cj4gICNkZWZpbmUJU05EUlZfQ1RMX0VMRU1fSUZBQ0VfQ0FSRAkoKF9fZm9yY2Ugc25kX2N0
bF9lbGVtX2lmYWNlX3QpIDApIC8qIGdsb2JhbCBjb250cm9sICovCj4gICNkZWZpbmUJU05EUlZf
Q1RMX0VMRU1fSUZBQ0VfSFdERVAJKChfX2ZvcmNlIHNuZF9jdGxfZWxlbV9pZmFjZV90KSAxKSAv
KiBoYXJkd2FyZSBkZXBlbmRlbnQgZGV2aWNlICovCj4gICNkZWZpbmUJU05EUlZfQ1RMX0VMRU1f
SUZBQ0VfTUlYRVIJKChfX2ZvcmNlIHNuZF9jdGxfZWxlbV9pZmFjZV90KSAyKSAvKiB2aXJ0dWFs
IG1peGVyIGRldmljZSAqLwoKSSBjYW4ndCB0YWtlIGEgdWFwaSBzb3VuZCBoZWFkZXIgZmlsZSBw
YXRjaCBhbG9uZyB3aXRoIGEgZHJpdmVyIGNoYW5nZSwKdGhlc2UgbmVlZCB0byBiZSBpbmRlcGVu
ZGFudC4KCkFuZCB0aGlzIGlzIGEgdXNlcnNwYWNlIGFwaSwgeW91IGp1c3QgY2hhbmdlZCB0aGUg
c2l6ZSBvZiBhbiBleHRlcm5hbGx5CmZhY2luZyB2YXJpYWJsZSwgYXJlIHlvdSBfU1VSRV8gdGhh
dCBpcyBvayB0byBkbz8KCnRoYW5rcywKCmdyZWcgay1oCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2dyZXlidXMtZGV2Cg==
