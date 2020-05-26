Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A03D1EB7D8
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:03:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 90F0F60DA3
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 09:03:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7692260F10; Tue,  2 Jun 2020 09:03:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0E3C665F87;
	Tue,  2 Jun 2020 09:01:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A9250618F4
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 16:06:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 963A665F93; Tue, 26 May 2020 16:06:37 +0000 (UTC)
Received: from mail-oi1-f195.google.com (mail-oi1-f195.google.com
 [209.85.167.195])
 by lists.linaro.org (Postfix) with ESMTPS id 76A99618F4
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 16:06:36 +0000 (UTC)
Received: by mail-oi1-f195.google.com with SMTP id 23so17888656oiq.8
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 09:06:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=c26RmLFN4y9M7Vs7EfSWgMEviKc2MmyIW9oT1wuhozo=;
 b=kCyhDtaZAotLqMBoT9f5jnWofF3OkYYjocbhqJ0JN4+SAXrV5rHAC/DFw/lAd8XFgD
 kQUuPIYGyj33XuNR6M7Ds9w+MeKBHB1J0p2s38g7YKwfluW6llmCDor0eZ+r1NjNLpt1
 6hkHLC+yZr0VIwAE0ac2Re/tCe81ibckZyXUYchHvqjLFwXvqCAuOyMCLTJyvkszHJMP
 Anq6ZsSbJdd/2YXmmWw0/kEkcCv/W/bupHZ3Cq/zrI8jbsi4RVG4zu64jCHnXkDXGaaD
 fINBWXnvv19xbLw4hue7Op/ZVsJSeyjHVwqcdOUGWE4ZA/C75C06uKnnjf/0vUf6UkG5
 Dhpg==
X-Gm-Message-State: AOAM532Ekyb1pQJP/dETb2hDGXM7KgLANU3u+VPMY6EgXlmvcQGw2vJu
 ECPzRrT5Kah/lZEtNEkQ32ycyohVKyB5ppA0XQM=
X-Google-Smtp-Source: ABdhPJyiiCLhbG6JtUDbl1Up10+V4yfossUJYh4yAKCjzUPhWyxowp2NgBVmj4+4Sa3zxFepbl+ycVP4MzeV68GD/Vo=
X-Received: by 2002:aca:eb56:: with SMTP id j83mr15203344oih.110.1590509195948; 
 Tue, 26 May 2020 09:06:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com>
 <20200526063521.GC2578492@kroah.com> <20200526150744.GC75990@rocinante>
 <CAJZ5v0grVQhmk=q9_=CbBa8y_8XbTOeqv-Hb6Hivi6ffKsVHmQ@mail.gmail.com>
 <20200526152844.GA5809@rowland.harvard.edu>
In-Reply-To: <20200526152844.GA5809@rowland.harvard.edu>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 26 May 2020 18:06:24 +0200
Message-ID: <CAJZ5v0gTWaE_ehFg+JDpPEANiD-jr5P5D4LL2XpSiVzHZoZ-_g@mail.gmail.com>
To: Alan Stern <stern@rowland.harvard.edu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:01:36 +0000
Cc: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org,
 "open list:TARGET SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>,
 Len Brown <lenb@kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 "open list:ULTRA-WIDEBAND \(UWB\) SUBSYSTEM:" <linux-usb@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>
Subject: Re: [greybus-dev] [PATCH 8/8] net/iucv: Use the new device_to_pm()
 helper to access struct dev_pm_ops
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

T24gVHVlLCBNYXkgMjYsIDIwMjAgYXQgNToyOCBQTSBBbGFuIFN0ZXJuIDxzdGVybkByb3dsYW5k
LmhhcnZhcmQuZWR1PiB3cm90ZToKPgo+IE9uIFR1ZSwgTWF5IDI2LCAyMDIwIGF0IDA1OjE5OjA3
UE0gKzAyMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVHVlLCBNYXkgMjYsIDIw
MjAgYXQgNTowNyBQTSBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3QGxpbnV4LmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IEhlbGxvIEdyZWcsCj4gPiA+Cj4gPiA+IFsuLi5dCj4gPiA+ID4gSXQncyAi
aW50ZXJlc3RpbmciIGhvdyB1c2luZyB5b3VyIG5ldyBoZWxwZXIgZG9lc24ndCBhY3R1YWxseSBt
YWtlIHRoZQo+ID4gPiA+IGNvZGUgc21hbGxlci4gIFBlcmhhcHMgaXQgaXNuJ3QgYSBnb29kIGhl
bHBlciBmdW5jdGlvbj8KPiA+ID4KPiA+ID4gVGhlIGlkZWEgZm9yIHRoZSBoZWxwZXIgd2FzIGlu
c3BpcmVkIGJ5IHRoZSBjb21tZW50IERhbiBtYWRlIHRvIEJqb3JuCj4gPiA+IGFib3V0IEJqb3Ju
J3MgY2hhbmdlLCBhcyBwZXI6Cj4gPiA+Cj4gPiA+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcv
ZHJpdmVyZGV2LWRldmVsLzIwMTkxMDE2MTM1MDAyLkdBMjQ2NzhAa2FkYW0vCj4gPiA+Cj4gPiA+
IEl0IGxvb2tlZCBsaWtlIGEgZ29vZCBpZGVhIHRvIHRyeSB0byByZWR1Y2UgdGhlIGZvbGxvd2lu
ZzoKPiA+ID4KPiA+ID4gICBkZXYtPmRyaXZlciAmJiBkZXYtPmRyaXZlci0+cG0gJiYgZGV2LT5k
cml2ZXItPnBtLT5wcmVwYXJlCj4gPiA+Cj4gPiA+IEludG8gc29tZXRoaW5nIG1vcmUgc3VjY2lu
Y3QuICBBbGJlaXQsIGdpdmVuIHRoZSBmZWVkYmFjayBmcm9tIHlvdXJzZWxmCj4gPiA+IGFuZCBS
YWZhZWwsIEkgZ2F0aGVyIHRoYXQgdGhpcyBoZWxwZXIgaXMgbm90IHJlYWxseSBhIGdvb2QgYWRk
aXRpb24uCj4gPgo+ID4gSU1PIGl0IGNvdWxkIGJlIHVzZWQgZm9yIHJlZHVjaW5nIGNvZGUgZHVw
bGljYXRpb24gbGlrZSB5b3UgZGlkIGluIHRoZQo+ID4gUENJIGNvZGUsIGJ1dCBub3QgbmVjZXNz
YXJpbHkgaW4gdGhlIG90aGVyIHBsYWNlcyB3aGVyZSB0aGUgY29kZSBpbgo+ID4gcXVlc3Rpb24g
aXMgbm90IGV4YWN0bHkgZHVwbGljYXRlZC4KPgo+IFRoZSBjb2RlIGNvdWxkIGJlIGEgbGl0dGxl
IG1vcmUgc3VjY2luY3QsIGFsdGhvdWdoIGl0IHdvdWxkbid0IGZpdCBldmVyeQo+IHVzYWdlLiAg
Rm9yIGV4YW1wbGUsCj4KPiAjZGVmaW5lIHBtX2RvX2NhbGxiYWNrKGRldiwgbWV0aG9kKSBcCj4g
ICAgICAgICAoZGV2LT5kcml2ZXIgJiYgZGV2LT5kcml2ZXItPnBtICYmIGRldi0+ZHJpdmVyLT5w
bS0+Y2FsbGJhY2sgPyBcCj4gICAgICAgICBkZXYtPmRyaXZlci0+cG0tPmNhbGxiYWNrKGRldikg
OiAwKQo+Cj4gVGhlbiB0aGUgdXNhZ2UgaXMgc29tZXRoaW5nIGxpa2U6Cj4KPiAgICAgICAgIHJl
dCA9IHBtX2RvX2NhbGxiYWNrKGRldiwgcHJlcGFyZSk7Cj4KPiBXb3VsZCB0aGlzIGJlIGFuIG92
ZXJhbGwgaW1wcm92ZW1lbnQ/CgpJdCB3b3VsZG4ndCBjb3ZlciBhbGwgb2YgdGhlIHVzZSBjYXNl
cy4KCkZvciBleGFtcGxlLCBQQ0kgZG9lcyBvdGhlciB0aGluZ3MgaW4gYWRkaXRpb24gdG8gcnVu
bmluZyBhIGNhbGxiYWNrCndoZW4gaXQgaXMgcHJlc2VudC4KClNvbWV0aGluZyBsaWtlIHRoaXMg
bWlnaHQgYmUgZW5vdWdoIHRob3VnaDoKCiNkZWZpbmUgcG1fZHJpdmVyX2NhbGxiYWNrX2lzX3By
ZXNlbnQoZGV2LCBtZXRob2QpIFwKICAgICAgICAoZGV2LT5kcml2ZXIgJiYgZGV2LT5kcml2ZXIt
PnBtICYmIGRldi0+ZHJpdmVyLT5wbS0+bWV0aG9kKQoKI2RlZmluZSBwbV9ydW5fZHJpdmVyX2Nh
bGxiYWNrKGRldiwgbWV0aG9kKSBcCiAgICAgICAgKHBtX2RyaXZlcl9jYWxsYmFja19pc19wcmVz
ZW50KGRldiwgbWV0aG9kKSA/CmRldi0+ZHJpdmVyLT5wbS0+bWV0aG9kKGRldikgOiAwKQoKI2Rl
ZmluZSBwbV9nZXRfZHJpdmVyX2NhbGxiYWNrKGRldiwgbWV0aG9kKSBcCiAgICAgICAgKHBtX2Ry
aXZlcl9jYWxsYmFja19pc19wcmVzZW50KGRldiwgbWV0aG9kKSA/CmRldi0+ZHJpdmVyLT5wbS0+
bWV0aG9kIDogTlVMTCkKCnNvIHdob2V2ZXIgbmVlZHMgdGhlIGNhbGxiYWNrIHBvaW50ZXIgY2Fu
IHVzZSBwbV9nZXRfZHJpdmVyX2NhbGxiYWNrKCkKYW5kIHdob2V2ZXIgb25seSBuZWVkcyB0byBy
dW4gdGhlIGNhbGxiYWNrIGNhbiB1c2UKcG1fcnVuX2RyaXZlcl9jYWxsYmFjaygpLgoKQ2hlZXJz
IQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xp
c3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
