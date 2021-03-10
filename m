Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 209FD33363A
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 08:17:23 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9FF9260F1F
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 07:17:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 88EC86678F; Wed, 10 Mar 2021 07:17:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 191436651C;
	Wed, 10 Mar 2021 07:17:07 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6E3AD60EFD
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 07:17:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4E034617DA; Wed, 10 Mar 2021 07:17:04 +0000 (UTC)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com
 [209.85.217.50])
 by lists.linaro.org (Postfix) with ESMTPS id 610D060EFD
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 07:17:03 +0000 (UTC)
Received: by mail-vs1-f50.google.com with SMTP id a12so8224809vsd.3
 for <greybus-dev@lists.linaro.org>; Tue, 09 Mar 2021 23:17:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5O4bWXBCQeQuk0BdQom2dNS7Jmj8ph1wsbHk08MJAMo=;
 b=EIJ/YPSd+wYvhkwBBeR7Z1zGyzzhPwVF2AHhDCU9384e1XyCeI6m9F5QGOvxNBbQES
 nJGjfJqW9P+ATDZxPkOTIFQ9VSJTVS5rA3/Mx8iKyRqBu37MHoTc54wyfrK0eLorUwXg
 CGCJ3sRv5abbauJe40zmbJXNYp/TEOrhxPCmRHC00SYuuTk4CSuqqIyBCBfCeQicOXCQ
 aEICIdVO8vpJy8/qYZgBUfbNRi4R/inxI82rZOn/9LouTOsy1OCBcWd9CwG76XzODI9/
 /3x50T4wbGZCLXTQSScXObQeyYSCndxccVkNcYI43IWONVg9W7rOaW+T9EIS5+kXu6Rw
 YHUA==
X-Gm-Message-State: AOAM530wQlovO1StTQwI/v5tz1PGnroF7yPpRLkDPb8VoK6hq5Y05LBo
 cBHFYJstrxzv3yPy8kWnljxfoHFX2MTXwYcttTkq0g==
X-Google-Smtp-Source: ABdhPJytTW7QIOLB8UPImbCUal1chmTmNyv6Z6uRJmeRfc+N68L2N1shNta5YcuAAXSn3Da5NzDEfquDQar0GSWxbDA=
X-Received: by 2002:a67:31d1:: with SMTP id x200mr972514vsx.16.1615360622918; 
 Tue, 09 Mar 2021 23:17:02 -0800 (PST)
MIME-Version: 1.0
References: <20210308145502.1075689-1-aardelean@deviqon.com>
 <20210308145502.1075689-2-aardelean@deviqon.com>
 <8a6ec9a1-71f8-ce1d-600a-66eba9244a54@metafoo.de>
In-Reply-To: <8a6ec9a1-71f8-ce1d-600a-66eba9244a54@metafoo.de>
From: Alexandru Ardelean <aardelean@deviqon.com>
Date: Wed, 10 Mar 2021 09:16:51 +0200
Message-ID: <CAASAkoZ+3T27KK0HN6YikKczUFS15xSpOssaOmx4NtDQKiKvHQ@mail.gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, ldewangan@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-spi@vger.kernel.org,
 greybus-dev@lists.linaro.org, broonie@kernel.org,
 bcm-kernel-feedback-list@broadcom.com, vireshk@kernel.org,
 linux-tegra@vger.kernel.org, f.fainelli@gmail.com, johan@kernel.org,
 thierry.reding@gmail.com, linux@deviqon.com
Subject: Re: [greybus-dev] [PATCH 01/10] spi: spi-axi-spi-engine: remove
	usage of delay_usecs
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

T24gTW9uLCA4IE1hciAyMDIxIGF0IDE4OjQyLCBMYXJzLVBldGVyIENsYXVzZW4gPGxhcnNAbWV0
YWZvby5kZT4gd3JvdGU6Cj4KPiBPbiAzLzgvMjEgMzo1NCBQTSwgQWxleGFuZHJ1IEFyZGVsZWFu
IHdyb3RlOgo+ID4gVGhlICdkZWxheV91c2VjcycgZmllbGQgd2FzIGhhbmRsZWQgZm9yIGJhY2t3
YXJkcyBjb21wYXRpYmlsaXR5IGluIGNhc2UKPiA+IHRoZXJlIHdlcmUgc29tZSB1c2VycyB0aGF0
IHN0aWxsIGNvbmZpZ3VyZWQgU1BJIGRlbGF5IHRyYW5zZmVycyB3aXRoCj4gPiB0aGlzIGZpZWxk
Lgo+ID4KPiA+IFRoZXkgc2hvdWxkIGFsbCBiZSByZW1vdmVkIGJ5IG5vdy4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFhcmRlbGVhbkBkZXZpcW9uLmNvbT4KPiA+
IC0tLQo+ID4gICBkcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYyB8IDEyICsrKystLS0t
LS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygt
KQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYyBi
L2RyaXZlcnMvc3BpL3NwaS1heGktc3BpLWVuZ2luZS5jCj4gPiBpbmRleCBhZjg2ZTZkNmUxNmIu
LjgwYzNlMzhmNWMxYiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3BpL3NwaS1heGktc3BpLWVu
Z2luZS5jCj4gPiArKysgYi9kcml2ZXJzL3NwaS9zcGktYXhpLXNwaS1lbmdpbmUuYwo+ID4gQEAg
LTE3MCwxNCArMTcwLDEwIEBAIHN0YXRpYyB2b2lkIHNwaV9lbmdpbmVfZ2VuX3NsZWVwKHN0cnVj
dCBzcGlfZW5naW5lX3Byb2dyYW0gKnAsIGJvb2wgZHJ5LAo+ID4gICAgICAgdW5zaWduZWQgaW50
IHQ7Cj4gPiAgICAgICBpbnQgZGVsYXk7Cj4gPgo+ID4gLSAgICAgaWYgKHhmZXItPmRlbGF5X3Vz
ZWNzKSB7Cj4gPiAtICAgICAgICAgICAgIGRlbGF5ID0geGZlci0+ZGVsYXlfdXNlY3M7Cj4gPiAt
ICAgICB9IGVsc2Ugewo+ID4gLSAgICAgICAgICAgICBkZWxheSA9IHNwaV9kZWxheV90b19ucygm
eGZlci0+ZGVsYXksIHhmZXIpOwo+ID4gLSAgICAgICAgICAgICBpZiAoZGVsYXkgPCAwKQo+ID4g
LSAgICAgICAgICAgICAgICAgICAgIHJldHVybjsKPiA+IC0gICAgICAgICAgICAgZGVsYXkgLz0g
MTAwMDsKPiA+IC0gICAgIH0KPiA+ICsgICAgIGRlbGF5ID0gc3BpX2RlbGF5X3RvX25zKCZ4ZmVy
LT5kZWxheSwgeGZlcik7Cj4gPiArICAgICBpZiAoZGVsYXkgPCAwKQo+ID4gKyAgICAgICAgICAg
ICByZXR1cm47Cj4KPiBCaXQgb2YgYSBuaXQsIGJ1dCB0aGlzIGNvdWxkIGJlIGBkZWxheSA8PSAw
YCBhbmQgdGhlbiBkcm9wIHRoZSBjaGVjayBmb3IKPiBgZGVsYXkgPT0gMGAgYmVsb3cuCgpobW0s
IHRoYXQncyBhIGJpdCBkZWJhdGFibGUsIGJlY2F1c2UgdGhlIGBkZWxheSA9PSAwYCBjaGVjayBj
b21lcwphZnRlciBgZGVsYXkgLz0gMTAwMGAgOwp0byBkbyB3aGF0IHlvdSdyZSBzdWdnZXN0aW5n
LCBpdCB3b3VsZCBwcm9iYWJseSBuZWVkIGEKRElWX1JPVU5EX1VQKGRlbGF5LCAxMDAwKSB0byBt
YWtlIHN1cmUgdGhhdCBldmVuIHN1Yi1taWNyb3NlY29uZApkZWxheXMgZG9uJ3QgYmVjb21lIHpl
cm87CgppZiB5b3UncmUgYWNraW5nIHRoaXMgc3VnZ2VzdGlvbiBpJ2xsIGltcGxlbWVudCBpdDsK
aSdsbCB3YWl0IGEgZmV3IG1vcmUgZGF5cyB0byBzZWUgaWYgdGhlcmUgYXJlIGFueSBvdGhlciBh
Y2tzIG9yCmNvbXBsYWludHMgb24gdGhlIHNldCBiZWZvcmUgc2VuZGluZyBhIFYyOwoKYnR3OiB0
aGlzIG5ldyBzcGlfZGVsYXkgc3RydWN0IHN1cHBvcnRzIGRlbGF5cyBpbiBtaWNyb3NlY29uZHMs
Cm5hbm9zZWNvbmRzIGFuZCBjbG9jayBjeWNsZXM7CmF0IHNvbWUgcG9pbnQgaXQgbWF5IGJlIGlu
dGVyZXN0aW5nIHRvIHVzZSBhCmBzcGlfZGVsYXlfdG9fY2xrX2N5Y2xlcygpYCBmb3IgdGhpcyBk
cml2ZXIgYW5kIG90aGVyIHNpbWlsYXI7Cgo+Cj4gPiArICAgICBkZWxheSAvPSAxMDAwOwo+ID4K
PiA+ICAgICAgIGlmIChkZWxheSA9PSAwKQo+ID4gICAgICAgICAgICAgICByZXR1cm47Cj4KPgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
