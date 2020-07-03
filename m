Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BC9213433
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Jul 2020 08:30:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 338C060900
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Jul 2020 06:30:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 23EDE665AF; Fri,  3 Jul 2020 06:30:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 197E860911;
	Fri,  3 Jul 2020 06:30:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2F13360654
 for <greybus-dev@lists.linaro.org>; Fri,  3 Jul 2020 06:30:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0A2D760900; Fri,  3 Jul 2020 06:30:38 +0000 (UTC)
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by lists.linaro.org (Postfix) with ESMTPS id 21B7960654
 for <greybus-dev@lists.linaro.org>; Fri,  3 Jul 2020 06:30:37 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id k7so15226018vso.2
 for <greybus-dev@lists.linaro.org>; Thu, 02 Jul 2020 23:30:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=K4CTOkloIJSngYKP9mYdXYRzGngQiHdh+SB3XRrQL7w=;
 b=RqSUpAOKrQfy8NcblCoaLhYKgwhvci7yaLZen+ScsHbjD9xXLzTrPazPfML9StbRqi
 XsTgrGpXOlSeFIAvbRRE+6aa9eMdJXrM/IWEKpywPEIbWR0mvOzKlsSEeWJXEFBnX+ne
 fJ7Dk2YoYc/YfwAsYZnksRy4lZDY+yx78muiEIz0ygLQv2hLRXidZKiDwlYtQzCzdTiG
 jJcBJWYSjy2ybzQwEhJ1+CQeXN5OVfUzcyNsgXumwllntgI20p73e5O6Dh3dQx4jE43W
 37Mzj1Yz+sUQlD5NUzOFsAtaJt17znL2mXrPIWw3mvXOM7R7xRHp8SH+Wx9FIU5wVSOf
 +DBA==
X-Gm-Message-State: AOAM530bzQ/Fu9AgMZzNxtqItEzr1Rm5FS625JhDseSZCiWIntkjroN9
 BioPkowcHQ9aOgVeD58uhIVUrwPzoeXopaJumrM=
X-Google-Smtp-Source: ABdhPJyFlr0qEIYFkZ5F4P9NqPrjy6PHLc2lkC9tuBddmoGutZTuHxrOvaPN/Mn4860Mx5DPCVFTT9IqZGI4YyfycKU=
X-Received: by 2002:a67:8cc7:: with SMTP id
 o190mr25922203vsd.168.1593757836584; 
 Thu, 02 Jul 2020 23:30:36 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1592537217.git.vaibhav.sr@gmail.com>
 <e9aaa09c6688aa5ed8bddf51f5cd402bb8cf39b3.1592537217.git.vaibhav.sr@gmail.com>
 <20200701133655.GA2373798@kroah.com>
In-Reply-To: <20200701133655.GA2373798@kroah.com>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Fri, 3 Jul 2020 12:00:00 +0530
Message-ID: <CAAs3648mdWoeByMP_4s3Rcu4fbbChTW9C8s=DeyQQ=g_=W_EbA@mail.gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Elder <elder@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH v3 6/6] staging: greybus: audio: Enable GB
 codec, audio module compilation.
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

T24gV2VkLCBKdWwgMDEsIDIwMjAgYXQgMDM6MzY6NTVQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIEZyaSwgSnVuIDE5LCAyMDIwIGF0IDA0OjUwOjI2UE0gKzA1MzAsIFZh
aWJoYXYgQWdhcndhbCB3cm90ZToKPiA+IEN1cnJlbnRseSB5b3UgY2FuJ3QgZW5hYmxlIHRoZSBH
ZXkgQnVzIEF1ZGlvIENvZGVjIGJlY2F1c2UgdGhlcmUgaXMgbm8KPiA+IGVudHJ5IGZvciBpdCBp
biB0aGUgS2NvbmZpZyBmaWxlLiBPcmlnaW5hbGx5IHRoZSBjb25maWcgbmFtZSB3YXMgZ29pbmcK
PiA+IHRvIGJlIEFVRElPX01TTTg5OTQgYnV0IHRoYXQncyBub3QgY29ycmVjdCBiZWNhdXNlIG90
aGVyIHR5cGVzIG9mCj4gPiBoYXJkd2FyZSBhcmUgc3VwcG9ydGVkIG5vdy4gSSBoYXZlIGNob3Nl
biB0aGUgbmFtZSBBVURJT19BUEJfQ09ERUMKPiA+IGluc3RlYWQuICBBbHNvIEkgaGFkIHRvIHVw
ZGF0ZSB0aGUgZGVwZW5kZW5jaWVzIGZvciBHUkVZQlVTX0FVRElPIHRvCj4gPiBtYWtlIHRoZSBj
b21waWxlIHdvcmsuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVmFpYmhhdiBBZ2Fyd2FsIDx2YWli
aGF2LnNyQGdtYWlsLmNvbT4KPiA+IFJldmlld2VkLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQG9yYWNsZS5jb20+Cj4gPiAtLS0KPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9L
Y29uZmlnICB8IDE0ICsrKysrKysrKysrKystCj4gPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
TWFrZWZpbGUgfCAgNCArKy0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCsp
LCAzIGRlbGV0aW9ucygtKQo+Cj4gQ2FuIHlvdSBmaXggdGhlIGJ1aWxkIGlzc3VlcyBmb3VuZCBi
eSB0aGUgYm90IGFuZCByZXNlbmQ/CgpTdXJlIEdyZWcsIEknbGwgc2hhcmUgdGhlIHVwZGF0ZWQg
cGF0Y2ggc2V0IHdpdGggZml4ZXMgZm9yIHRoZSBpc3N1ZXMKcmVwb3J0ZWQuCgotLQp0aGFua3Ms
CnZhaWJoYXYKCj4KPiB0aGFua3MsCj4KPiBncmVnIGstaApfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1
cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ncmV5YnVzLWRldgo=
