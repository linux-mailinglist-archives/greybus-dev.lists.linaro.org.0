Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 076E91D2879
	for <lists+greybus-dev@lfdr.de>; Thu, 14 May 2020 09:05:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 33A7065F90
	for <lists+greybus-dev@lfdr.de>; Thu, 14 May 2020 07:05:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 25CF265F91; Thu, 14 May 2020 07:05:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C4A3A65F8A;
	Thu, 14 May 2020 07:04:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1B8D660ED5
 for <greybus-dev@lists.linaro.org>; Thu, 14 May 2020 07:04:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F1B6C65F89; Thu, 14 May 2020 07:04:51 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id D8DE560ED5
 for <greybus-dev@lists.linaro.org>; Thu, 14 May 2020 07:04:50 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id a4so1631405lfh.12
 for <greybus-dev@lists.linaro.org>; Thu, 14 May 2020 00:04:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=I9WnzFdmVQbheZ8Ai9Qer5xXiDc1MgImnC5EGlPBIDA=;
 b=ZBcgMJuSONfy5B/f3Mw8DeeqPb3d1Y1pWzOXfNBNte8+EBn8S7ZqK0T01PzZZoos71
 ToUhLoSPk7RvW7bODDawEfDAr4x5pRgC1WKdXCzdnO5Q75mCkIsxYJXOJLwLSVWtBIKT
 FXhhjM4AjFbya8kK49Ffr8aw+tujiiLKblBtUbMtj/LVNVSbjgFxkHktAS5kL9RGUrEi
 iEZP6/ZiS8pLcHrgTZGUTpQb0Koq/y4F/Yw9PaplCttd7Cz5/l5vUpP14J9/O9dyAtt/
 /ONjUWbLG4p+/fArhjwYJOprO/RNmHYiAspYp1c9GYfR45A3oP6cxT4uB7yoZqKhRhQ4
 KAZA==
X-Gm-Message-State: AOAM530YGFaLhdRbYNfgJ42Dcfat6Hud0KivI1Dbu9MUkbjvxJtxlXia
 OXPIoBCrs2wlXb5h2vvPA7I=
X-Google-Smtp-Source: ABdhPJzbhRRGhNeIlXT1SpAvrdP+VLu4RYUXW0vcX5PRMC55VImUYwDNmGzuxiMOD5YnC/GXLi5E5A==
X-Received: by 2002:ac2:5542:: with SMTP id l2mr2220386lfk.113.1589439889686; 
 Thu, 14 May 2020 00:04:49 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id c20sm937831ljk.59.2020.05.14.00.04.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 00:04:45 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jZ7vA-00018d-2b; Thu, 14 May 2020 09:04:44 +0200
Date: Thu, 14 May 2020 09:04:44 +0200
From: Johan Hovold <johan@kernel.org>
To: Alex Elder <elder@linaro.org>
Message-ID: <20200514070444.GB25962@localhost>
References: <20200429190022.12671-1-arnd@arndb.de>
 <7146e1ca-1fc7-61ab-e798-7b017c7c974b@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7146e1ca-1fc7-61ab-e798-7b017c7c974b@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Johan Hovold <johan@kernel.org>,
 David Lin <dtwlin@gmail.com>, greybus-dev@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@google.com>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@hovoldconsulting.com>
Subject: Re: [greybus-dev] [PATCH] greybus: uart: fix uninitialized flow
 control variable
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

T24gV2VkLCBBcHIgMjksIDIwMjAgYXQgMDM6MDA6NDRQTSAtMDUwMCwgQWxleCBFbGRlciB3cm90
ZToKPiBPbiA0LzI5LzIwIDI6MDAgUE0sIEFybmQgQmVyZ21hbm4gd3JvdGU6Cj4gPiBnY2MtMTAg
cG9pbnRzIG91dCBhbiB1bmluaXRpYWxpemVkIHZhcmlhYmxlIHVzZToKPiAKPiBXb3csIG5pY2Us
IGNoZWNraW5nIGluZGl2aWR1YWwgdW5pbml0aWFsaXplZCBmaWVsZHMgd2l0aGluCj4gdGhlIHN0
cnVjdHVyZS4KPiAKPiBUaGUgc3RydWN0dXJlIHNob3VsZCByZWFsbHkgYmUgemVyby1pbml0aWFs
aXplZCBhbnl3YXk7IGl0J3MKPiBwYXNzZWQgYXMgYSBzdHJ1Y3R1cmUgaW4gYSBtZXNzYWdlIGVs
c2V3aGVyZS4gIFdpdGggeW91cgo+IGNoYW5nZSwgYWxsIGZpZWxkcyBpbiB0aGUgc3RydWN0dXJl
IGFyZSB3cml0dGVuLCBidXQgaW4KPiB0aGVvcnkgdGhlIHN0cnVjdHVyZSBjb3VsZCBjaGFuZ2Ug
YW5kIHN0YWNrIGdhcmJhZ2UgY291bGQKPiBiZSBzZW50IG92ZXIgdGhlIHdpcmUuCj4gCj4gV2hh
dCBkbyB5b3UgdGhpbmsgb2YgZG9pbmcgdGhpcyBpbnN0ZWFkPyAgT3IgaW4gYWRkaXRpb24/Cj4g
Cj4gICAgICAgICBzdHJ1Y3QgZ2JfdHR5X2xpbmVfY29kaW5nIG5ld2xpbmUgPSB7IH07Cj4gCj4g
KFByZXN1bWFibHkgdGhhdCB3b3VsZCBhbHNvIHNpbGVuY2UgdGhlIHdhcm5pbmcuKQo+IAo+IEkg
ZW5kb3JzZSBvZiB5b3VyIGNoYW5nZSwgZWl0aGVyIHdheS4KCkxvb2tzIGxpa2UgR3JlZyBlbmRl
ZCB1cCBhcHBseWluZyBhbiBpZGVudGljYWwgdmVyc2lvbiBvZiB0aGlzIHBhdGNoCnRoYXQgd2Fz
IHN1Ym1pdHRlZCB0aGlzIHdlZWsgaW5zdGVhZC4KClRha2luZyBhIGNsb3NlciBsb29rIGF0IHRo
aXMgY29kZSBJIG5vdGljZWQgd2UgaGF2ZSB0d28gdmVyc2lvbnMgb2YgdGhpcwpsaW5lLWNvZGlu
ZyBzdHJ1Y3Qgd2hpY2ggYXJlIHN1cHBvc2VkIGJ5IGJlIGlkZW50aWNhbCwgYnV0IHdoaWNoIGNv
dWxkCmdldCBvdXQgb2Ygc3luYyAoYW5kIGhhdmUgb25jZSBhbHJlYWR5IGl0IHR1cm5zIG91dCku
CgpKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
