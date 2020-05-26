Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B251EB7D2
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 11:03:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8C5B960F10
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Jun 2020 09:03:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7DB7A60F4F; Tue,  2 Jun 2020 09:03:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6961065F7A;
	Tue,  2 Jun 2020 09:01:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8FBEE65F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:19:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 65AB965F96; Tue, 26 May 2020 15:19:20 +0000 (UTC)
Received: from mail-oo1-f66.google.com (mail-oo1-f66.google.com
 [209.85.161.66])
 by lists.linaro.org (Postfix) with ESMTPS id 4B81365F91
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 15:19:19 +0000 (UTC)
Received: by mail-oo1-f66.google.com with SMTP id p123so4305138oop.12
 for <greybus-dev@lists.linaro.org>; Tue, 26 May 2020 08:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=VZBcz6P8XvlHsbrU2eTtG7/ScIEzLwH8fekfbRdSKRQ=;
 b=VIbow0uJC4P2a3yTzONh11psFg4R0JQ5jO5QaVvJKvn9ufk6ExOPBCuv2L9naQMg6W
 ZXhAntk6UK2l6TI5EwBBpeiyG7yjVHiqLEh3oTEy1vwC7130WXLzcJbgKRLpMNNynFI/
 q4TEnuBwzCSfbH5zBrtQobbn2E/XLilPkmCkMD6wDY5UnR4cIAuDunXdIkG9czCwQkUr
 xJ0G4eGnN7Db64aTjUA1qdaPCmXQqgC/nJIqGxEV0Vyg0oWq9fwyoIb/zpn9lypTBKlO
 FnLCsfiGiudIoWdREEfKwC3o2uc9WLXORJDa1IGw1oSSo1PYFWg8kdSAUJNXhjB3X3Gn
 G7RA==
X-Gm-Message-State: AOAM532+kx/wuQWgwesb1vlbxFa+3EjoMiHS7CxPvXpNdMlSKEtaaMb3
 fNgeqqBdxFHfvVAxDr+lJ14VP2By/+q6iiRVw/w=
X-Google-Smtp-Source: ABdhPJz6T1ptdbNy/G/lwrqbnMsBUWMLewVuG8K8TUsIgnEptYY3NNFI0VGqY6Fo8CDoDMoNJVTCuZ+6jxk8hfWP6YI=
X-Received: by 2002:a4a:be07:: with SMTP id l7mr17198759oop.38.1590506358744; 
 Tue, 26 May 2020 08:19:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200525182608.1823735-1-kw@linux.com>
 <20200525182608.1823735-9-kw@linux.com>
 <20200526063521.GC2578492@kroah.com> <20200526150744.GC75990@rocinante>
In-Reply-To: <20200526150744.GC75990@rocinante>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 26 May 2020 17:19:07 +0200
Message-ID: <CAJZ5v0grVQhmk=q9_=CbBa8y_8XbTOeqv-Hb6Hivi6ffKsVHmQ@mail.gmail.com>
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 02 Jun 2020 09:01:36 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Linux PCI <linux-pci@vger.kernel.org>,
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

T24gVHVlLCBNYXkgMjYsIDIwMjAgYXQgNTowNyBQTSBLcnp5c3p0b2YgV2lsY3p5xYRza2kgPGt3
QGxpbnV4LmNvbT4gd3JvdGU6Cj4KPiBIZWxsbyBHcmVnLAo+Cj4gWy4uLl0KPiA+IEl0J3MgImlu
dGVyZXN0aW5nIiBob3cgdXNpbmcgeW91ciBuZXcgaGVscGVyIGRvZXNuJ3QgYWN0dWFsbHkgbWFr
ZSB0aGUKPiA+IGNvZGUgc21hbGxlci4gIFBlcmhhcHMgaXQgaXNuJ3QgYSBnb29kIGhlbHBlciBm
dW5jdGlvbj8KPgo+IFRoZSBpZGVhIGZvciB0aGUgaGVscGVyIHdhcyBpbnNwaXJlZCBieSB0aGUg
Y29tbWVudCBEYW4gbWFkZSB0byBCam9ybgo+IGFib3V0IEJqb3JuJ3MgY2hhbmdlLCBhcyBwZXI6
Cj4KPiAgIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2RyaXZlcmRldi1kZXZlbC8yMDE5MTAxNjEz
NTAwMi5HQTI0Njc4QGthZGFtLwo+Cj4gSXQgbG9va2VkIGxpa2UgYSBnb29kIGlkZWEgdG8gdHJ5
IHRvIHJlZHVjZSB0aGUgZm9sbG93aW5nOgo+Cj4gICBkZXYtPmRyaXZlciAmJiBkZXYtPmRyaXZl
ci0+cG0gJiYgZGV2LT5kcml2ZXItPnBtLT5wcmVwYXJlCj4KPiBJbnRvIHNvbWV0aGluZyBtb3Jl
IHN1Y2NpbmN0LiAgQWxiZWl0LCBnaXZlbiB0aGUgZmVlZGJhY2sgZnJvbSB5b3Vyc2VsZgo+IGFu
ZCBSYWZhZWwsIEkgZ2F0aGVyIHRoYXQgdGhpcyBoZWxwZXIgaXMgbm90IHJlYWxseSBhIGdvb2Qg
YWRkaXRpb24uCgpJTU8gaXQgY291bGQgYmUgdXNlZCBmb3IgcmVkdWNpbmcgY29kZSBkdXBsaWNh
dGlvbiBsaWtlIHlvdSBkaWQgaW4gdGhlClBDSSBjb2RlLCBidXQgbm90IG5lY2Vzc2FyaWx5IGlu
IHRoZSBvdGhlciBwbGFjZXMgd2hlcmUgdGhlIGNvZGUgaW4KcXVlc3Rpb24gaXMgbm90IGV4YWN0
bHkgZHVwbGljYXRlZC4KClRoYW5rcyEKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3Jl
eWJ1cy1kZXYK
