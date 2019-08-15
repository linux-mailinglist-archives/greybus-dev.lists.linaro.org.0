Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F36908F516
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 21:47:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 33CE9607EC
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 19:47:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 26CD0609A2; Thu, 15 Aug 2019 19:47:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8A5F6615DE;
	Thu, 15 Aug 2019 19:47:10 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E7D74607EC
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 19:47:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DC12E609C3; Thu, 15 Aug 2019 19:47:06 +0000 (UTC)
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by lists.linaro.org (Postfix) with ESMTPS id AFD4E607EC
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 19:47:04 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id o9so1556980iom.3
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 12:47:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tvcvIGiFYNgjd30cMu6dns+AA62fR222JYqi03bEiNQ=;
 b=qrjGTUkWPygTUeX0AcqjPIqq/+izyO2/NAU8ah7tjsFrW5QcgbKfMYXnfqVhL6o31k
 uYAQC3jNk5jIJZHf7RCsgbXBKONQSKGpLljdeNwz1wZNMbmgMIkeDvQDPiBBdIw+Ah/I
 p5y+OSYwwTZHTumNZB4m4eh80Bxws8KuXbcVyL0bjR2P7Og7oU/rWIahaimC+Sl8jk+3
 B9meZkPqVVRJTp79bmPJe9Q17hPkT4JmazYqlusDlO69m5p6C3KcXgdjxSMOa71Y3+IC
 Qx8JjheLC4To54EnBmMDzde3kGNWq6M0Q+ncidXa8syl9opPoG7eqNRHy6BGPyQC0x7z
 TGJA==
X-Gm-Message-State: APjAAAX5MZqgyJnWFDGRNsM5OyDRbuNe3sWSSE64jto+15qsetI0IrY/
 Rhz2GQd1rwu0Et+4xBndHnXmulUgzH6ptf50XC+c87yj
X-Google-Smtp-Source: APXvYqzSR0wlrmuNudydgwNkBH5PowobPcdByJfBK8vnslv9Uxj83co9KMzkGme8scau1Xt3Xf1NOAiKIrmRYmaYdh8=
X-Received: by 2002:a5e:c30f:: with SMTP id a15mr5195411iok.246.1565898424005; 
 Thu, 15 Aug 2019 12:47:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAF4BF-R5yjta8zTcsFc8auYQ8cAHDqN0yM5rYwG6JctCbkOm1g@mail.gmail.com>
 <20190815193922.GI30437@kroah.com>
In-Reply-To: <20190815193922.GI30437@kroah.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Thu, 15 Aug 2019 15:46:53 -0400
Message-ID: <CAF4BF-TpZYteWN2VM5B5+yQrOLQR_czJMaJBE2gAbMGmSo1iJw@mail.gmail.com>
To: Greg KH <greg@kroah.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] binding gb gpio device to gb-phy driver?
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMzozOSBQTSBHcmVnIEtIIDxncmVnQGtyb2FoLmNvbT4g
d3JvdGU6Cj4gT24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6NDk6NTFQTSAtMDQwMCwgQ2hyaXN0
b3BoZXIgRnJpZWR0IHdyb3RlOgo+ID4gSXMgYW55b25lIGF3YXJlIGlmIGEgc2VwYXJhdGUgc3Rl
cCB0aGF0IGlzIHJlcXVpcmVkIHRvIGJpbmQgdGhlIGRldmljZQo+ID4gdG8gdGhlIGRyaXZlcj8K
PiA+IEkndmUgdHJpZWQKPiA+Cj4gPiBzdWRvIHNoIC1jICdlY2hvIC1uIDEtMi4yLjEgPiAvc3lz
L2J1cy9nYnBoeS9kcml2ZXJzL2dwaW8vYmluZCcKPiA+Cj4gPiBidXQgdGhhdCBnaXZlcyBtZSAt
RU5PREVWCj4KPiBJdCBzaG91bGQgImp1c3Qgd29yayIgaWYgdGhlIG1hbmlmZXN0IHNpZ25hdHVy
ZXMgbWF0Y2ggdGhlIHdoYXQgdGhlCj4gZ3JleWJ1cyBncGlvIGRyaXZlciBleHBlY3RzLgo+Cj4g
RG8geW91IGdldCBhbnkgbG9nZ2luZyBtZXNzYWdlcyBpbiB5b3VyIGtlcm5lbCBsb2cgd2hlbiB5
b3UgZG8gdGhpcz8KClRoZSBidW5kbGUgY2xhc3MgaW4gdGhlIG1hbmlmZXN0IHdhcyBpbmNvcnJl
Y3QuIFNob3VsZCBoYXZlIGJlZW4gMHgwYQooYnJpZGdlZCBwaHkpIC0gR1BJTyBwcm90b2NvbCBp
cyBhIGdvIDstKQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
