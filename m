Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8599523CC11
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 18:21:17 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ACA4E61513
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 16:21:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A1632618E2; Wed,  5 Aug 2020 16:21:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D1265619B5;
	Wed,  5 Aug 2020 16:21:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C571561513
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 16:21:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B80E56192C; Wed,  5 Aug 2020 16:21:02 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by lists.linaro.org (Postfix) with ESMTPS id D65BB61513
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 16:21:00 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id x24so7253982lfe.11
 for <greybus-dev@lists.linaro.org>; Wed, 05 Aug 2020 09:21:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=29PkptMrIh0wL9+y+cJ5jR3/l+AuSbnf80pfRQhXI6Y=;
 b=RQNJrtbwZkg5eOE5cu13+kEZ8z6uBeVl3EXL/MCLCNCB2FNC+q2K2d2o51R+ofZ9j4
 OS0lARlIEY3GIqVT0LMM99GNBCKlD+qgLdXFzWZC81CuxAjLppCebRGsk8ssenuK2XLM
 wCXYGjYe+Pflew4QybOHxs6sU8zv5rB1hBclRCWPV4zLVyI4kO7nJro3ogZEtBS0bqUK
 HxS8LxrRX0/OhVZnTd8H8JQp7orhRfHU/rkjE7S8bqxOoWxvztzMlRvITettCzD/7ZPx
 plrecjRerVzCFbC8hIaab2RpYrueOA7YfheUUQNJKRIFqlZVt7EnYxrwlKtVfvHctujR
 AfAA==
X-Gm-Message-State: AOAM533ITKx369xVgYQ4k1nBMNBMtbOce1LEooue5Kh6qEBZb9gM0fh8
 qgf9Eng3kTGEclzIOzTn5TQ=
X-Google-Smtp-Source: ABdhPJwRYPUdeEvLiz482raxZOFw8HkgE2IwIkweXVoWC2qvJ9WAhYrqx0qx0zGOZKDFxLndOgXJ3A==
X-Received: by 2002:a19:457:: with SMTP id 84mr1946291lfe.191.1596644459745;
 Wed, 05 Aug 2020 09:20:59 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id a16sm1165711ljj.108.2020.08.05.09.20.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2020 09:20:58 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1k3MA2-00005N-PL; Wed, 05 Aug 2020 18:21:02 +0200
Date: Wed, 5 Aug 2020 18:21:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex Elder <elder@ieee.org>
Message-ID: <20200805162102.GK3634@localhost>
References: <20200727183258.GA28571@embeddedor>
 <63871608-e076-26b0-85df-cff11699c3a3@ieee.org>
 <e36013ba-e19a-86c9-cb68-d7ad5559c292@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e36013ba-e19a-86c9-cb68-d7ad5559c292@ieee.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] [PATCH][next] greybus: Use fallthrough
	pseudo-keyword
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

T24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMDg6MTQ6NDdBTSAtMDUwMCwgQWxleCBFbGRlciB3cm90
ZToKPiBPbiA3LzI4LzIwIDU6MzcgUE0sIEFsZXggRWxkZXIgd3JvdGU6Cj4gPiBPbiA3LzI3LzIw
IDE6MzIgUE0sIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4gPj4gUmVwbGFjZSB0aGUgZXhp
c3RpbmcgLyogZmFsbCB0aHJvdWdoICovIGNvbW1lbnRzIGFuZCBpdHMgdmFyaWFudHMgd2l0aAo+
ID4+IHRoZSBuZXcgcHNldWRvLWtleXdvcmQgbWFjcm8gZmFsbHRocm91Z2hbMV0uCj4gPj4KPiA+
PiBbMV0gaHR0cHM6Ly93d3cua2VybmVsLm9yZy9kb2MvaHRtbC92NS43L3Byb2Nlc3MvZGVwcmVj
YXRlZC5odG1sP2hpZ2hsaWdodD1mYWxsdGhyb3VnaCNpbXBsaWNpdC1zd2l0Y2gtY2FzZS1mYWxs
LXRocm91Z2gKPiA+IAo+ID4gVGhhbmtzIGZvciB0aGUgcGF0Y2guwqAgSXQgbG9va3MgZ29vZCwg
YnV0IGl0IHJhaXNlcwo+ID4gYW5vdGhlciBxdWVzdGlvbiBJJ2QgbGlrZSBkaXNjdXNzaW9uIG9u
LgoKU29ycnkgYWJvdXQgdGhlIGxhdGUgcmVwbHkgb24gdGhpcy4KCj4gSXQncyBiZWVuIGEgd2Vl
aywgYW5kIHdlIGhlYXJkIGJhY2sgZnJvbSBWaXJlc2ggKGFuZCBKb2UpIG9uCj4gdGhpcywgYnV0
IG5vIG9uZSBlbHNlLiAgVmlyZXNoIGxlZnQgb3V0IHRoZSBicmVhayBzdGF0ZW1lbnQgb24KPiB0
aGUgbGFzdCBjYXNlIG9mIHRoZSBzd2l0Y2ggc3RhdGVtZW50IGludGVudGlvbmFsbHksIGFyZ3Vp
bmcKPiB0aGF0IGl0IGlzIG5vdCBuZWVkZWQgKG11Y2ggbGlrZSBhIHJldHVybiBzdGF0ZW1lbnQg
YXQgdGhlIGVuZAo+IG9mIGEgdm9pZCBmdW5jdGlvbikuICBCdXQgaGUgZG9lc24ndCBmZWVsIHN0
cm9uZ2x5IGVub3VnaAo+IGluc2lzdCBpdCBzaG91bGQgc3RheSB0aGF0IHdheS4gIEknbSBzdXJl
IHRoZSBvdGhlcnMgb21pdHRlZAo+IHRoZSBicmVhayBzdGF0ZW1lbnQgaW50ZW50aW9uYWxseSBh
cyB3ZWxsLgoKSSByZWFsbHkgZG9uJ3QgbWluZCBicmVhayBzdGF0ZW1lbnRzIGluIHRoZSBmaW5h
bCBjYXNlIGFuZCBvZnRlbiBkbyBhZGQKdGhlbSwgYnV0IEknbSBhIGJpdCByZWx1Y3RhbnQgdG8g
c3VnZ2VzdCB0aGF0IHRoaXMgaXMgc29tZXRoaW5nIHRoYXQKbmVlZCAiZml4aW5nIi4gVGhlcmUg
YXJlIGEgdG9uIG9mIHRoZXNlIGFsbCBvdmVyIHRoZSBrZXJuZWwsIGFuZCBJIHRoaW5rCndlIGhh
dmUgdG9vIG1hbnkgb3Bwb3J0dW5pdGllcyBmb3IgcGVvcGxlIHRvIGRvIG1lY2hhbmljYWwgY2xl
YW4gdXBzCmFscmVhZHkuCgpFc3BlY2lhbGx5IGFmdGVyIEd1c3Rhdm8ncyB3b3JrLCB0aGUgb25s
eSByZWFsIGFyZ3VtZW50IGZvciBhZGRpbmcgdGhlbQppcyBtb3N0bHkgbW9vdCBhcyB0aGUgY29t
cGlsZXIgd291bGQgY2F0Y2ggaXQgaWYgYW55b25lIGFkZHMgYSBuZXcgY2FzZQphbmQgZm9yZ2V0
cyBhYm91dCB0aGUgYnJlYWsgc3RhdGVtZW50LgoKPiBHaXZlbiBubyBzdHJvbmcgcHVzaGJhY2ss
IEknbGwgYXNrIHlvdSAoR3VzdGF2bykgdG8gcG9zdCBhCj4gc2Vjb25kIHBhdGNoIGFkZGluZyB0
aGUgbWlzc2luZyBicmVhayBzdGF0ZW1lbnRzIEkgZGVzY3JpYmVkCj4gKGFuZCBsb29rIGZvciBh
bnkgb3RoZXJzIEkgbWlnaHQgaGF2ZSBtaXNzZWQpLiAgSWYgeW91IHdvdWxkCj4gcHJlZmVyIG5v
dCB0byBkbyB0aGF0LCBqdXN0IHNheSBzbywgYW5kIEkgd2lsbCBzZW5kIG91dCBzdWNoCj4gYSBw
YXRjaCBteXNlbGYuCgpJJ2QgcHJvYmFibHkganVzdCBsZWF2ZSBpdCBhcyBpcywgaWYgb25seSB0
byBub3QgaW5zcGlyZSBvdGhlcnMgdG8gc2VuZApjb3B5LWNhdCAiZml4ZXMiLgoKSm9oYW4KX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
