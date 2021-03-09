Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FA0331DDF
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 05:28:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAF23665E9
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 04:28:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B8E3C666D5; Tue,  9 Mar 2021 04:28:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2E8EA666D4;
	Tue,  9 Mar 2021 04:28:16 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 50DFF617ED
 for <greybus-dev@lists.linaro.org>; Tue,  9 Mar 2021 04:28:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3EE7466626; Tue,  9 Mar 2021 04:28:14 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by lists.linaro.org (Postfix) with ESMTPS id F3ABB617ED
 for <greybus-dev@lists.linaro.org>; Tue,  9 Mar 2021 04:28:12 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id t85so3338964pfc.13
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 20:28:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=B+8YOxcfUeJ6df3e8CyV/VT9IvcELWSikbdkoM3b6Ug=;
 b=b/ehW64S5h5PqtZD2vL3YrZrN0fBL9XG3T9zxYdqKkv4is04iwLDH+M/cp72dcjy1k
 g3GU6OqtDbwuJNpzI9A5oMsFBDfA4ARNkCW76RrecZqA0CO3dJOB2xODYMNxSwmscGyq
 ZQ3cETpr9NVp0sUuF783oeXyJz9JUvPXkNokokzDaGAK+Z2tmYEYGUEpq0c+wFVPCAQM
 yITYHDvsJctMTVYwDTQ6ub4v01KpskPdVkf7Rqrvckeg63VC1WQt3PosX7ak2pqnUAIV
 iip3WmDp2pdUbAyeoC+jwlr3JiPrZ687S+3uKI7qW4OFsr+1Didob41u5dRtPl47Gxkp
 ty8Q==
X-Gm-Message-State: AOAM531y4I1vU15v57isTIqszMnLYxFMwQs6iL4yDZaW1NHID5sw04Jm
 EISjzKDs1+HNoJ45nL/neZlLBV96
X-Google-Smtp-Source: ABdhPJxLhPHdVshVOVKrFuQWBus/qDOL4qzrr0c6GqxPCA+N0GE32fx4ze30gezz4TNI4bi2Zd3iNg==
X-Received: by 2002:a63:4d4e:: with SMTP id n14mr23409013pgl.37.1615264092034; 
 Mon, 08 Mar 2021 20:28:12 -0800 (PST)
Received: from localhost ([122.171.124.15])
 by smtp.gmail.com with ESMTPSA id g2sm11719102pfi.28.2021.03.08.20.28.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 08 Mar 2021 20:28:11 -0800 (PST)
Date: Tue, 9 Mar 2021 09:58:09 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Alexandru Ardelean <aardelean@deviqon.com>
Message-ID: <20210309042809.dgop5dli36z27sj2@vireshk-i7>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
 <20210308145502.1075689-7-aardelean@deviqon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210308145502.1075689-7-aardelean@deviqon.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, ldewangan@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-spi@vger.kernel.org,
 greybus-dev@lists.linaro.org, broonie@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, vireshk@kernel.org,
 linux-tegra@vger.kernel.org, f.fainelli@gmail.com, johan@kernel.org,
 thierry.reding@gmail.com, linux@deviqon.com
Subject: Re: [greybus-dev] [PATCH 06/10] staging: greybus: spilib: use
 'spi_delay_to_ns' for getting xfer delay
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

T24gMDgtMDMtMjEsIDE2OjU0LCBBbGV4YW5kcnUgQXJkZWxlYW4gd3JvdGU6Cj4gVGhlIGludGVu
dCBpcyB0aGUgcmVtb3ZhbCBvZiB0aGUgJ2RlbGF5X3VzZWNzJyBmaWVsZCBmcm9tIHRoZQo+IHNw
aV90cmFuc2ZlciBzdHJ1Y3QsIGFzIHRoZXJlIGlzIGEgJ2RlbGF5JyBmaWVsZCB0aGF0IGRvZXMg
dGhlIHNhbWUKPiB0aGluZy4KPiAKPiBUaGUgc3BpX2RlbGF5X3RvX25zKCkgY2FuIGJlIHVzZWQg
dG8gZ2V0IHRoZSB0cmFuc2ZlciBkZWxheS4gSXQgd29ya3MgYnkKPiB1c2luZyB0aGUgJ2RlbGF5
X3VzZWNzJyBmaWVsZCBmaXJzdCAoaWYgaXQgaXMgbm9uLXplcm8pLCBhbmQgZmluYWxseQo+IHVz
ZXMgdGhlICdkZWxheScgZmllbGQuCj4gCj4gU2luY2UgdGhlICdkZWxheV91c2VjcycgZmllbGQg
aXMgZ29pbmcgYXdheSwgdGhpcyBjaGFuZ2UgbWFrZXMgdXNlIG9mIHRoZQo+IHNwaV9kZWxheV90
b19ucygpIGZ1bmN0aW9uLiBUaGlzIGFsc28gbWVhbnMgZGl2aWRpbmcgdGhlIHJldHVybiB2YWx1
ZSBvZgo+IHRoZSBmdW5jdGlvbiBieSAxMDAwLCB0byBjb252ZXJ0IGl0IHRvIG1pY3Jvc2Vjb25k
cy4KPiBUbyBwcmV2ZW50IGFueSBwb3RlbnRpYWwgZmF1bHRzIHdoZW4gY29udmVydGluZyB0byBt
aWNyb3NlY29uZHMgYW5kIHNpbmNlCj4gdGhlIHJlc3VsdCBvZiBzcGlfZGVsYXlfdG9fbnMoKSBp
cyBpbnQsIHRoZSBkZWxheSBpcyBiZWluZyBjb21wdXRlZCBpbiAzMgo+IGJpdHMgYW5kIHRoZW4g
Y2xhbXBlZCBiZXR3ZWVuIDAgJiBVMTZfTUFYLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
dSBBcmRlbGVhbiA8YWFyZGVsZWFuQGRldmlxb24uY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9zcGlsaWIuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9zcGlsaWIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jCj4gaW5k
ZXggNjcyZDU0MGQzMzY1Li4zMDY1NTE1M2RmNmEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvc3BpbGliLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zcGls
aWIuYwo+IEBAIC0yNDUsNiArMjQ1LDcgQEAgc3RhdGljIHN0cnVjdCBnYl9vcGVyYXRpb24gKmdi
X3NwaV9vcGVyYXRpb25fY3JlYXRlKHN0cnVjdCBnYl9zcGlsaWIgKnNwaSwKPiAgCS8qIEZpbGwg
aW4gdGhlIHRyYW5zZmVycyBhcnJheSAqLwo+ICAJeGZlciA9IHNwaS0+Zmlyc3RfeGZlcjsKPiAg
CXdoaWxlIChtc2ctPnN0YXRlICE9IEdCX1NQSV9TVEFURV9PUF9ET05FKSB7Cj4gKwkJaW50IHhm
ZXJfZGVsYXk7Cj4gIAkJaWYgKHhmZXIgPT0gc3BpLT5sYXN0X3hmZXIpCj4gIAkJCXhmZXJfbGVu
ID0gc3BpLT5sYXN0X3hmZXJfc2l6ZTsKPiAgCQllbHNlCj4gQEAgLTI1OSw3ICsyNjAsOSBAQCBz
dGF0aWMgc3RydWN0IGdiX29wZXJhdGlvbiAqZ2Jfc3BpX29wZXJhdGlvbl9jcmVhdGUoc3RydWN0
IGdiX3NwaWxpYiAqc3BpLAo+ICAKPiAgCQlnYl94ZmVyLT5zcGVlZF9oeiA9IGNwdV90b19sZTMy
KHhmZXItPnNwZWVkX2h6KTsKPiAgCQlnYl94ZmVyLT5sZW4gPSBjcHVfdG9fbGUzMih4ZmVyX2xl
bik7Cj4gLQkJZ2JfeGZlci0+ZGVsYXlfdXNlY3MgPSBjcHVfdG9fbGUxNih4ZmVyLT5kZWxheV91
c2Vjcyk7Cj4gKwkJeGZlcl9kZWxheSA9IHNwaV9kZWxheV90b19ucygmeGZlci0+ZGVsYXksIHhm
ZXIpIC8gMTAwMDsKPiArCQl4ZmVyX2RlbGF5ID0gY2xhbXBfdCh1MTYsIHhmZXJfZGVsYXksIDAs
IFUxNl9NQVgpOwo+ICsJCWdiX3hmZXItPmRlbGF5X3VzZWNzID0gY3B1X3RvX2xlMTYoeGZlcl9k
ZWxheSk7Cj4gIAkJZ2JfeGZlci0+Y3NfY2hhbmdlID0geGZlci0+Y3NfY2hhbmdlOwo+ICAJCWdi
X3hmZXItPmJpdHNfcGVyX3dvcmQgPSB4ZmVyLT5iaXRzX3Blcl93b3JkOwoKQWNrZWQtYnk6IFZp
cmVzaCBLdW1hciA8dmlyZXNoLmt1bWFyQGxpbmFyby5vcmc+CgotLSAKdmlyZXNoCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJv
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
