Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 77048181E1A
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 17:40:33 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 84E4965FD5
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 16:40:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7A1C865FD8; Wed, 11 Mar 2020 16:40:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1ACEC65FD3;
	Wed, 11 Mar 2020 16:40:20 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AB092619B5
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 16:40:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8E10865FCC; Wed, 11 Mar 2020 16:40:17 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by lists.linaro.org (Postfix) with ESMTPS id 66E9F619B5
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 16:40:16 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id j17so2286559lfe.7
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 09:40:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=CQIcBy++lHyFVoklpZOGyu0d/n/C4e98cfAviFgLA40=;
 b=fyinbK68nt9QZdsYfXr57idNuhlk0c6MCUuplFUear2BxyoDRs57pm4QXxvTzPAjCr
 TFw4bTfJomtAXPTGFj8GgIpSUElcAw0rcmlRstTwf1l8pArH4M2lvm8+zLaHlAubpv7l
 aaeKsuWLZ4lHRm2tElIfCVORov992xGS0CYHgq8ma3oCGt7tthse/XNh/x+pSoJLpLiu
 JgEw1Rh5VF7sGBdFsTh959NJEuVno3O7XcsYe9VF3nUVJ2DeVh7BGphEg5IBoxJaRWcA
 w3rtxrEhmE/k3iF2kfdwUrHq2F0CJIFV/LTau2C+lx0ixBUevGQXLF8XWduKzQ2IzE6Z
 SyAA==
X-Gm-Message-State: ANhLgQ0O3LG5pEt+8X2wKLfbKjA0qQBf/CUiSm4LO0FSg4Uec4kN/6dU
 JFqWCRoqMIEh81OXQsmyPXk=
X-Google-Smtp-Source: ADFU+vsKli5lM9s2I7oLXmnLiT+0q6KNC6an93G/DMH2bGr0eLj2LPw+wAZCmBEhWbVDAodTdHzFgg==
X-Received: by 2002:ac2:5222:: with SMTP id i2mr2698506lfl.81.1583944815271;
 Wed, 11 Mar 2020 09:40:15 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id j6sm5961936lfb.13.2020.03.11.09.40.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 09:40:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jC4Oo-0006WF-Qu; Wed, 11 Mar 2020 17:40:02 +0100
Date: Wed, 11 Mar 2020 17:40:02 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200311164002.GL14211@localhost>
References: <20200311091906.22980-1-tiwai@suse.de>
 <20200311095814.GI14211@localhost> <s5hmu8n8b0m.wl-tiwai@suse.de>
 <20200311100903.GJ14211@localhost> <s5hy2s7nojd.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5hy2s7nojd.wl-tiwai@suse.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Use scnprintf() for
 avoiding potential buffer overflow
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTI6MDE6MjZQTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IE9uIFdlZCwgMTEgTWFyIDIwMjAgMTE6MDk6MDMgKzAxMDAsCj4gSm9oYW4gSG92b2xk
IHdyb3RlOgo+ID4gCj4gPiBPbiBXZWQsIE1hciAxMSwgMjAyMCBhdCAxMTowMjozM0FNICswMTAw
LCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4gPiA+IE9uIFdlZCwgMTEgTWFyIDIwMjAgMTA6NTg6MTQg
KzAxMDAsCj4gPiA+IEpvaGFuIEhvdm9sZCB3cm90ZToKPiA+ID4gPiAKPiA+ID4gPiBPbiBXZWQs
IE1hciAxMSwgMjAyMCBhdCAxMDoxOTowNkFNICswMTAwLCBUYWthc2hpIEl3YWkgd3JvdGU6Cj4g
PiA+ID4gPiBTaW5jZSBzbnByaW50ZigpIHJldHVybnMgdGhlIHdvdWxkLWJlLW91dHB1dCBzaXpl
IGluc3RlYWQgb2YgdGhlCj4gPiA+ID4gPiBhY3R1YWwgb3V0cHV0IHNpemUsIHRoZSBzdWNjZWVk
aW5nIGNhbGxzIG1heSBnbyBiZXlvbmQgdGhlIGdpdmVuCj4gPiA+ID4gPiBidWZmZXIgbGltaXQu
ICBGaXggaXQgYnkgcmVwbGFjaW5nIHdpdGggc2NucHJpbnRmKCkuCj4gPiA+ID4gPiAKPiA+ID4g
PiA+IFNpZ25lZC1vZmYtYnk6IFRha2FzaGkgSXdhaSA8dGl3YWlAc3VzZS5kZT4KPiA+ID4gPiA+
IC0tLQo+ID4gPiA+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rl
c3QuYyB8IDI0ICsrKysrKysrKysrKy0tLS0tLS0tLS0tLQo+ID4gPiA+IAo+ID4gPiA+IFRoYW5r
cyBmb3IgdGhlIGZpeC4KPiA+ID4gPiAKPiA+ID4gPiBXb3VsZCB5b3UgbWluZCByZXNlbmRpbmcg
d2l0aCBhICJzdGFnaW5nOiBncmV5YnVzOiBsb29wYmFja190ZXN0OiIKPiA+ID4gPiBwcmVmaXgg
c2luY2UgdGhpcyBpcyBub3QgYSBzdWJzeXN0ZW0gd2lkZSBpc3N1ZSwgYnVyIHJhdGhlciBhIGJ1
ZyBpbiBhCj4gPiA+ID4gc3BlY2lmaWMgdXNlci1zcGFjZSB0b29sPwo+ID4gPiAKPiA+ID4gT0ss
IHdpbGwgZG8gdGhhdC4KPiA+IAo+ID4gVGhhbmtzLgo+ID4gCj4gPiBQZXJoYXBzIHlvdSBzaG91
bGQgcmVwbGFjZSB0aGUgc25wcmludGYoKSBhdCB0aGUgc3RhcnQgb2YgdGhlIGZ1bmN0aW9uCj4g
PiBpbiBxdWVzdGlvbiBhcyB3ZWxsIGJ5IHRoZSB3YXkuCj4gCj4gWWVhaCwgaXQncyBJIGFsc28g
d29uZGVyIHdoaWxlIHdvcmtpbmcgb24gbWFueSBvdGhlciBjb2RlcywgdG9vLgo+IEkgZGVjaWRl
ZCB0byBtaW5pbWl6ZSB0aGUgY2hhbmdlcyBhdCB0aGlzIHRpbWUgYW5kIGNvbmNlbnRyYXRlIG9u
bHkgb24KPiB0aGUgY29kZSB0aGF0IGhhcyBhIHBhdHRlcm4gbGlrZToKPiAgICBwb3MgKz0gc25w
cmludGYoYnVmLCBsaW1pdCAtIHBvcywgLi4uKQoKQnV0IGlzbid0IHRoZSBmaXJzdCBzbnByaW50
ZigpIGluIHN1Y2ggYSBzZXF1ZW5jZSBhcyBtdWNoIGEgcGFydCBvZiB0aGUKcHJvYmxlbSBhcyB0
aGUgZm9sbG93aW5nIG9uZXM/CgpJZiB0aGUgZmlyc3QgcG9zID0gc25wcmludGYoYnVmLCBsaW1p
dCwgLi4uKSBvdmVyZmxvd3MgYnVmLCB0aGVuIHRoZQpuZXh0IHBvcyArPSBzbnByaW50ZihidWYs
IGxpbWl0IC0gcG9zLCAuLi4pIHdpbGwgYmUgY2FsbGVkIHdpdGggd2l0aCBhCm5lZ2F0aXZlIHNp
emUgYXJndW1lbnQgKGkuZS4gYSB2ZXJ5IGxhcmdlIHVuc2lnbmVkIHZhbHVlKSwgd2hpY2gKZWZm
ZWN0aXZlbHkgYnJlYWtzIHRoZSBsZW5ndGggY2hlY2sgcmVnYXJkbGVzcyBvZiB3aGV0aGVyIHlv
dSByZXBsYWNlIGl0CndpdGggc2NucHJpbnRmKCkgb3Igbm90LiBBbmQgYWxsIGxhdGVyIGNhbGxz
IHdpbGwgc2ltaWxhcmx5IGNvbnRpbnVlCndyaXRpbmcgYmV5b25kIHRoZSBlbmQgb2YgYnVmLgoK
QnV0IHdhaXQgYSBtaW51dGUuIFRoaXMgaXMgdXNlci1zcGFjZSBjb2RlLCBzbyB0aGVyZSdzIG5v
IHNjbnByaW50ZigpLgpEaWQgeW91IG5vdCBjb21waWxlIHRlc3QgdGhpcz8gO1AKCkluIGZhY3Qg
aXQgc2VlbXMgbm8tb25lIGhhcyBmb3IgYSB3aGlsZS4gVGhpcyBjb2RlIGlzIGp1c3QgYnJva2Vu
IGFuZApkb2Vzbid0IGV2ZW4gY29tcGlsZSBhbnkgbW9yZS4gTWF5YmUgd2Ugc2hvdWxkIGp1c3Qg
ZHJvcCBpdCBpbnN0ZWFkLgoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3Jl
eWJ1cy1kZXYK
