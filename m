Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1220E3BF682
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 09:56:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F1D4A66933
	for <lists+greybus-dev@lfdr.de>; Thu,  8 Jul 2021 07:56:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 393C06694D; Thu,  8 Jul 2021 07:56:00 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D17EF6676A;
	Thu,  8 Jul 2021 07:55:57 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 410EC6687D
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:35:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3C7B466884; Tue,  6 Jul 2021 10:35:58 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by lists.linaro.org (Postfix) with ESMTPS id 352596687D
 for <greybus-dev@lists.linaro.org>; Tue,  6 Jul 2021 10:35:56 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t15so22127692wry.11
 for <greybus-dev@lists.linaro.org>; Tue, 06 Jul 2021 03:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
 b=Yt+wwRbDrooYfJ07+RIOcvlbNAmDArbrvJ7r1S0Vf2cjg/rLU7fAYgPxXpkS/Es1c/
 LcGWWFOVsEF/0XQJw8Ic4i6Dtc59Y/PIazeWXS81o/I5/ykvg7NDoqtNhU6ZQY0qgpts
 hX13gyhgO6x+I73AAGb4ZN/+qaseZR6quq5U1fL8NFgVa2YoJXURs1gKcClPP7oowGFt
 CUO7YRn27lhbGlEADkw/xBbGzLYaM6sE1cZhR+vatbGDVqfyXQOHsgSlmcoOTDifCPOm
 ISHjTYrtj1Tj6vkK+FyowiPdLCC1ljyYKvKt5eTXHZu+z0mb6AF50iygoibOaTtpwXde
 Om/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=6xuYHcNFKOKQBrKUFUDH+4OX/ZzxgolWWFVCDDtB2Y0=;
 b=sVaTJQNT9zgjrSU6toxyaD10WrdSWwVbHIilnVSCs3t3+iFCjyJIdAzCjnMbMZljNa
 RiRsqVYQ+Utc2VKeQYSkURwXE8dhD7zvyNTPQPCqOVGgd7V1ApNWAyvYgaPHy8L8jwrq
 ZwdZHpc3EOuTuIz5yOrsa4mgx1V0B9S7bp9UN3My1lithD4YcxAYgbZHkC+cFj+O0lJv
 e+QQlh0VXe1tj93L9h5IvsQCMUsizV8j1Tbn95O6o3tS6sXiTMXltC0hYWWzNaV82PuS
 8sFt519/llTABrmmLEgIQuPyjwoSQXSL3weaORIkU2NchPqnhGG91ya/pR/ZvdL1m2d8
 bHdA==
X-Gm-Message-State: AOAM532t/PgagOo9xlxV9wCEyw9NCsplwW/jWPmwOAuDbUZtdeS1LwY7
 CxROK3TxGeAUitABSFCt7wkVdbZa
X-Google-Smtp-Source: ABdhPJxx+Xr4AcuLpRSkCC4EtytSRujE0SZ0zcPphvKN4FEK+8OpQKjY5aHg/Lctw2KdmVZr98nK+A==
X-Received: by 2002:a05:6000:12d0:: with SMTP id
 l16mr21397024wrx.189.1625567755049; 
 Tue, 06 Jul 2021 03:35:55 -0700 (PDT)
Received: from dell ([109.180.115.218])
 by smtp.gmail.com with ESMTPSA id l9sm16428319wrp.14.2021.07.06.03.35.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jul 2021 03:35:54 -0700 (PDT)
Date: Tue, 6 Jul 2021 11:35:52 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Message-ID: <YOQxRS8HLTYthWNn@dell>
References: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210706095037.1425211-1-u.kleine-koenig@pengutronix.de>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 08 Jul 2021 07:55:56 +0000
Subject: Re: [greybus-dev] [PATCH] bus: Make remove callback return void
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: nvdimm@lists.linux.dev, linux-hyperv@vger.kernel.org, kvm@vger.kernel.org,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, linux-fpga@vger.kernel.org,
 linux-pci@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-cxl@vger.kernel.org, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 target-devel@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-i3c@lists.infradead.org, linux1394-devel@lists.sourceforge.net,
 linux-scsi@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev,
 Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org,
 industrypack-devel@lists.sourceforge.net, linux-input@vger.kernel.org,
 linux-mmc@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-sunxi@lists.linux.dev, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-remoteproc@vger.kernel.org, greybus-dev@lists.linaro.org,
 xen-devel@lists.xenproject.org, platform-driver-x86@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Geoff Levand <geoff@infradead.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, kernel@pengutronix.de, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-ntb@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gVHVlLCAwNiBKdWwgMjAyMSwgVXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cgo+IFRoZSBkcml2
ZXIgY29yZSBpZ25vcmVzIHRoZSByZXR1cm4gdmFsdWUgb2YgdGhpcyBjYWxsYmFjayBiZWNhdXNl
IHRoZXJlCj4gaXMgb25seSBsaXR0bGUgaXQgY2FuIGRvIHdoZW4gYSBkZXZpY2UgZGlzYXBwZWFy
cy4KPiAKPiBUaGlzIGlzIHRoZSBmaW5hbCBiaXQgb2YgYSBsb25nIGxhc3RpbmcgY2xlYW51cCBx
dWVzdCB3aGVyZSBzZXZlcmFsCj4gYnVzZXMgd2VyZSBjb252ZXJ0ZWQgdG8gYWxzbyByZXR1cm4g
dm9pZCBmcm9tIHRoZWlyIHJlbW92ZSBjYWxsYmFjay4KPiBBZGRpdGlvbmFsbHkgc29tZSByZXNv
dXJjZSBsZWFrcyB3ZXJlIGZpeGVkIHRoYXQgd2VyZSBjYXVzZWQgYnkgZHJpdmVycwo+IHJldHVy
bmluZyBhbiBlcnJvciBjb2RlIGluIHRoZSBleHBlY3RhdGlvbiB0aGF0IHRoZSBkcml2ZXIgd29u
J3QgZ28KPiBhd2F5Lgo+IAo+IFdpdGggc3RydWN0IGJ1c190eXBlOjpyZW1vdmUgcmV0dXJuaW5n
IHZvaWQgaXQncyBwcmV2ZW50ZWQgdGhhdCBuZXdseQo+IGltcGxlbWVudGVkIGJ1c2VzIHJldHVy
biBhbiBpZ25vcmVkIGVycm9yIGNvZGUgYW5kIHNvIGRvbid0IGFudGljaXBhdGUKPiB3cm9uZyBl
eHBlY3RhdGlvbnMgZm9yIGRyaXZlciBhdXRob3JzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFV3ZSBL
bGVpbmUtS8O2bmlnIDx1LmtsZWluZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+Cj4gLS0tCj4gSGVs
bG8sCj4gCj4gdGhpcyBwYXRjaCBkZXBlbmRzIG9uICJQQ0k6IGVuZHBvaW50OiBNYWtlIHN0cnVj
dCBwY2lfZXBmX2RyaXZlcjo6cmVtb3ZlCj4gcmV0dXJuIHZvaWQiIHRoYXQgaXMgbm90IHlldCBh
cHBsaWVkLCBzZWUKPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjEwMjIzMDkwNzU3LjU3
NjA0LTEtdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4LmRlLgo+IAo+IEkgdGVzdGVkIGl0IHVz
aW5nIGFsbG1vZGNvbmZpZyBvbiBhbWQ2NCBhbmQgYXJtLCBidXQgSSB3b3VsZG4ndCBiZQo+IHN1
cnByaXNlZCBpZiBJIHN0aWxsIG1pc3NlZCB0byBjb252ZXJ0IGEgZHJpdmVyLiBTbyBpdCB3b3Vs
ZCBiZSBncmVhdCB0bwo+IGdldCB0aGlzIGludG8gbmV4dCBlYXJseSBhZnRlciB0aGUgbWVyZ2Ug
d2luZG93IGNsb3Nlcy4KPiAKPiBJIHNlbmQgdGhpcyBtYWlsIHRvIGFsbCBwZW9wbGUgdGhhdCBn
ZXRfbWFpbnRhaW5lci5wbCBlbWl0cyBmb3IgdGhpcwo+IHBhdGNoLiBJIHdvbmRlciBob3cgbWFu
eSByZWNpcGVudHMgd2lsbCByZWZ1c2UgdGhpcyBtYWlsIGJlY2F1c2Ugb2YgdGhlCj4gbG9uZyBD
YzogbGlzdCA6LSkKPiAKPiBCZXN0IHJlZ2FyZHMKPiBVd2UKPiAKPiAgYXJjaC9hcm0vY29tbW9u
L2xvY29tby5jICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBhcmNoL2FybS9jb21tb24vc2Ex
MTExLmMgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBhcmNoL2FybS9tYWNoLXJwYy9lY2Fy
ZC5jICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBhcmNoL21pcHMvc2dpLWlwMjIvaXAyMi1n
aW8uYyAgICAgICAgICAgICB8IDMgKy0tCj4gIGFyY2gvcGFyaXNjL2tlcm5lbC9kcml2ZXJzLmMg
ICAgICAgICAgICAgIHwgNSArKy0tLQo+ICBhcmNoL3Bvd2VycGMvcGxhdGZvcm1zL3BzMy9zeXN0
ZW0tYnVzLmMgICB8IDMgKy0tCj4gIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvcHNlcmllcy9pYm1l
YnVzLmMgIHwgMyArLS0KPiAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9wc2VyaWVzL3Zpby5jICAg
ICAgfCAzICstLQo+ICBkcml2ZXJzL2FjcGkvYnVzLmMgICAgICAgICAgICAgICAgICAgICAgICB8
IDMgKy0tCj4gIGRyaXZlcnMvYW1iYS9idXMuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCAr
LS0tCj4gIGRyaXZlcnMvYmFzZS9hdXhpbGlhcnkuYyAgICAgICAgICAgICAgICAgIHwgNCArLS0t
Cj4gIGRyaXZlcnMvYmFzZS9pc2EuYyAgICAgICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4g
IGRyaXZlcnMvYmFzZS9wbGF0Zm9ybS5jICAgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRy
aXZlcnMvYmNtYS9tYWluLmMgICAgICAgICAgICAgICAgICAgICAgIHwgNiArKy0tLS0KPiAgZHJp
dmVycy9idXMvc3VueGktcnNiLmMgICAgICAgICAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVy
cy9jeGwvY29yZS5jICAgICAgICAgICAgICAgICAgICAgICAgfCAzICstLQo+ICBkcml2ZXJzL2Rh
eC9idXMuYyAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2RtYS9p
ZHhkL3N5c2ZzLmMgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2ZpcmV3aXJl
L2NvcmUtZGV2aWNlLmMgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2Zpcm13YXJlL2Fy
bV9zY21pL2J1cy5jICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2Zpcm13YXJlL2dvb2ds
ZS9jb3JlYm9vdF90YWJsZS5jICB8IDQgKy0tLQo+ICBkcml2ZXJzL2ZwZ2EvZGZsLmMgICAgICAg
ICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2hpZC9oaWQtY29yZS5jICAgICAg
ICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2hpZC9pbnRlbC1pc2gtaGlkL2lzaHRw
L2J1cy5jICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2h2L3ZtYnVzX2Rydi5jICAgICAgICAgICAg
ICAgICAgICB8IDUgKy0tLS0KPiAgZHJpdmVycy9od3RyYWNpbmcvaW50ZWxfdGgvY29yZS5jICAg
ICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pMmMvaTJjLWNvcmUtYmFzZS5jICAgICAgICAgICAg
ICAgfCA1ICstLS0tCj4gIGRyaXZlcnMvaTNjL21hc3Rlci5jICAgICAgICAgICAgICAgICAgICAg
IHwgNCArLS0tCj4gIGRyaXZlcnMvaW5wdXQvZ2FtZXBvcnQvZ2FtZXBvcnQuYyAgICAgICAgIHwg
MyArLS0KPiAgZHJpdmVycy9pbnB1dC9zZXJpby9zZXJpby5jICAgICAgICAgICAgICAgfCAzICst
LQo+ICBkcml2ZXJzL2lwYWNrL2lwYWNrLmMgICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+
ICBkcml2ZXJzL21hY2ludG9zaC9tYWNpb19hc2ljLmMgICAgICAgICAgICB8IDQgKy0tLQo+ICBk
cml2ZXJzL21jYi9tY2ItY29yZS5jICAgICAgICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2
ZXJzL21lZGlhL3BjaS9idDh4eC9idHR2LWdwaW8uYyAgICAgICB8IDMgKy0tCj4gIGRyaXZlcnMv
bWVtc3RpY2svY29yZS9tZW1zdGljay5jICAgICAgICAgIHwgMyArLS0KCj4gIGRyaXZlcnMvbWZk
L21jcC1jb3JlLmMgICAgICAgICAgICAgICAgICAgIHwgMyArLS0KCkFja2VkLWJ5OiBMZWUgSm9u
ZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgoKLS0gCkxlZSBKb25lcyBb5p2O55C85pavXQpTZW5p
b3IgVGVjaG5pY2FsIExlYWQgLSBEZXZlbG9wZXIgU2VydmljZXMKTGluYXJvLm9yZyDilIIgT3Bl
biBzb3VyY2Ugc29mdHdhcmUgZm9yIEFybSBTb0NzCkZvbGxvdyBMaW5hcm86IEZhY2Vib29rIHwg
VHdpdHRlciB8IEJsb2cKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
