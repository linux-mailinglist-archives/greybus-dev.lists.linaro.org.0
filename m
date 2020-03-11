Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F4D181E43
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 17:51:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B7CB665FCC
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 16:51:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AC46465FD9; Wed, 11 Mar 2020 16:51:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2519C65FE0;
	Wed, 11 Mar 2020 16:51:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id ED74165FCC
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 16:51:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E013365FD3; Wed, 11 Mar 2020 16:51:30 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id 4553765FE0
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 16:50:13 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id q9so2311485lfc.10
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 09:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2WQ5QOhhtqyxc21CZANuOHGJ1oB8RH0uBOvaI9t9ga8=;
 b=BfqYutfqMzDmk1HGFe7huceJt+eiCyqqtfMLXub9xfHiDraoK/SwOPHtjIBgFS8W1U
 tRFhws73f/rNQOfg06RXsA0nBvTC6oiq/7oGrfseAVkFIwPwBU3krcb5AYwImQo7nPLo
 w1GC8o+n3S2KGQbxWMGJ+/Cbdj6azjUV+16XS01scehHQEw1SuvAjnK+vKn1pzTJ+G4t
 XUjvmxfR+rCU1ER7xcFYgOvAEMyIB+RBuNEOPMG0QAOjXUsZNgV96C9cyZqI00wUqA8T
 cKl45DANNAAfG5WAvYKyl0OQJERdvUKyZcyz2FLFR8a8P9sINpg7xW1vaqHFu/hCKUa1
 4JKg==
X-Gm-Message-State: ANhLgQ0srZIOfpzY5NrsCtaaQ/tiSrzAI3zgDAfd18mHvQ+Zq4Yuj/HE
 r3d2znDQDvYTOabxp77A6wgMtrmS
X-Google-Smtp-Source: ADFU+vs+MJAb3FR7/qAqR8AKzz/tytZKX5/oWzlP1X9KOKpe8QflhBi6kXm70N7J58UJLz6kz0jIBw==
X-Received: by 2002:a19:8292:: with SMTP id e140mr244707lfd.137.1583945412151; 
 Wed, 11 Mar 2020 09:50:12 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id 3sm6381291ljq.18.2020.03.11.09.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 09:50:11 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jC4YS-0006Zi-2G; Wed, 11 Mar 2020 17:50:00 +0100
Date: Wed, 11 Mar 2020 17:50:00 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200311165000.GN14211@localhost>
References: <20200311091906.22980-1-tiwai@suse.de>
 <20200311095814.GI14211@localhost> <s5hmu8n8b0m.wl-tiwai@suse.de>
 <20200311100903.GJ14211@localhost> <s5hy2s7nojd.wl-tiwai@suse.de>
 <20200311164002.GL14211@localhost> <s5h8sk67sd0.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <s5h8sk67sd0.wl-tiwai@suse.de>
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMDU6NDU6MzFQTSArMDEwMCwgVGFrYXNoaSBJd2FpIHdy
b3RlOgo+IE9uIFdlZCwgMTEgTWFyIDIwMjAgMTc6NDA6MDIgKzAxMDAsIEpvaGFuIEhvdm9sZCB3
cm90ZToKCj4gPiBCdXQgaXNuJ3QgdGhlIGZpcnN0IHNucHJpbnRmKCkgaW4gc3VjaCBhIHNlcXVl
bmNlIGFzIG11Y2ggYSBwYXJ0IG9mIHRoZQo+ID4gcHJvYmxlbSBhcyB0aGUgZm9sbG93aW5nIG9u
ZXM/Cj4gPiAKPiA+IElmIHRoZSBmaXJzdCBwb3MgPSBzbnByaW50ZihidWYsIGxpbWl0LCAuLi4p
IG92ZXJmbG93cyBidWYsIHRoZW4gdGhlCj4gPiBuZXh0IHBvcyArPSBzbnByaW50ZihidWYsIGxp
bWl0IC0gcG9zLCAuLi4pIHdpbGwgYmUgY2FsbGVkIHdpdGggd2l0aCBhCj4gPiBuZWdhdGl2ZSBz
aXplIGFyZ3VtZW50IChpLmUuIGEgdmVyeSBsYXJnZSB1bnNpZ25lZCB2YWx1ZSksIHdoaWNoCj4g
PiBlZmZlY3RpdmVseSBicmVha3MgdGhlIGxlbmd0aCBjaGVjayByZWdhcmRsZXNzIG9mIHdoZXRo
ZXIgeW91IHJlcGxhY2UgaXQKPiA+IHdpdGggc2NucHJpbnRmKCkgb3Igbm90LiBBbmQgYWxsIGxh
dGVyIGNhbGxzIHdpbGwgc2ltaWxhcmx5IGNvbnRpbnVlCj4gPiB3cml0aW5nIGJleW9uZCB0aGUg
ZW5kIG9mIGJ1Zi4KPiAKPiBZZWFoLCB0aGF0J3MgdGhlIHBvc3NpYmxlIGNhc2UgYWx0aG91Z2gg
bW9zdCBjYWxscyBhcmUgZmluZSB3aXRoIGl0Cj4gc2luY2UgdGhlIGxpbWl0IGlzIFBBR0VfU0la
RSBvciBzby4gIFRoaXMgbWlnaHQgbmVlZCBhIGJpdCBtb3JlCj4gc3BlY2lhbCBjYXJlLgoKWWVh
aCwgc3VyZSwgaXQgc2hvdWxkIGJlIGZpbmUgaGVyZSB0b28gY3VycmVudGx5LCBldmVuIGlmIHRo
ZSBidWZmZXIKc2l6ZSBpcyBkZWZpbmVkIGluIHRoZSBjYWxsZXIuCgo+ID4gQnV0IHdhaXQgYSBt
aW51dGUuIFRoaXMgaXMgdXNlci1zcGFjZSBjb2RlLCBzbyB0aGVyZSdzIG5vIHNjbnByaW50Zigp
Lgo+ID4gRGlkIHlvdSBub3QgY29tcGlsZSB0ZXN0IHRoaXM/IDtQCj4gPgo+ID4gSW4gZmFjdCBp
dCBzZWVtcyBuby1vbmUgaGFzIGZvciBhIHdoaWxlLiBUaGlzIGNvZGUgaXMganVzdCBicm9rZW4g
YW5kCj4gPiBkb2Vzbid0IGV2ZW4gY29tcGlsZSBhbnkgbW9yZS4gTWF5YmUgd2Ugc2hvdWxkIGp1
c3QgZHJvcCBpdCBpbnN0ZWFkLgo+IAo+IEJhaCwgSSdtIGFmcmFpZCB0aGF0IEkgb3Zlcmxvb2tl
ZCB0aGlzIHBvaW50IQo+IAo+IEkndmUgc2NyYXBlZCBvdmVyIG1hbnkgcGxhY2VzIHZpYSBhIHNj
cmlwdC1saWtlIHdvcmssIGFuZCBkaWQgdGhlCj4gY29tcGlsZSB0ZXN0aW5nIG9mIHRoZSBrZXJu
ZWwsIGJ1dCBub3QgYWJvdXQgdG9vbHMuICBJZiB0aGF0J3MgdGhlCj4gY2FzZSwgc29ycnkgZm9y
IHRoZSBtZXNzLCBmZWVsIGZyZWUgdG8gZHJvcCBpdC4gCgpObyB3b3JyaWVzLiBJJ2xsIHRyeSB0
byB0YWtlIGEgbG9vayBhdCB0aGUgb3RoZXIgYnJlYWthZ2VzIHRvbW9ycm93IGFuZApzZWUgaWYg
dGhlcmUncyBhbnkgcG9pbnQgdHJ5aW5nIHRvIHNhbHZhZ2UgdGhpcyBhdCBhbGwuCgpKb2hhbgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
