Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A97631D189E
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 17:04:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C58FA619AC
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 15:04:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B94EB65F88; Wed, 13 May 2020 15:04:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 80C6065F85;
	Wed, 13 May 2020 15:03:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 69A4C6086C
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 15:03:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5B55C65F82; Wed, 13 May 2020 15:03:44 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by lists.linaro.org (Postfix) with ESMTPS id 029B06086C
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 15:03:43 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id f18so18154670lja.13
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 08:03:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oHtiFD5v56mzUK/ohaUZXeJFXEarl7NanKdDOND7Tvg=;
 b=HljIQQoaT/INeJOm5dhgOeccqoqz/LkDGosTkA9EoPCf6KDYu+axLfrWKxB+ayggvP
 AQKsxSD3gqiCu4ihulK9uqwGCuP7E5L/hH7kVxCnkGV/2BpV1yg5wyt81S2JnrTOJzi7
 TnL8pdjqhzwXsMdczeoIwHQrqZJZ9JTOB5VM0bgEEDaBHM01Qlsxdx1qITE/meZkct9m
 WIm1UvSvNBkXYZ/di1av7Dyz4rZ5rWBLaXD31jUqhjJNngdcaflAJ/OKK4dvtpquG0rP
 UFzyxKVajxhCUkNCa2IgTUiubGNsN2rNVI8XtkoWZ9rOANH1mAm0VzC3WTGEGJNaq35f
 RFTg==
X-Gm-Message-State: AOAM530LeCh3fFxqgXrYBSH9rgGFadTS+mLHlK7G1Ivr6lbudGJyjl8E
 zKU/3QFI4UESLzy8m513IcA=
X-Google-Smtp-Source: ABdhPJzEBxUN4whSR6fnt1OXSUxkaw4AZeRwwElMMAMzYZXYPEY7ZwQA6tYJGrWf2jBieosdpSLfyA==
X-Received: by 2002:a2e:b4a5:: with SMTP id q5mr18500430ljm.58.1589382221650; 
 Wed, 13 May 2020 08:03:41 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id 134sm16212893lfj.20.2020.05.13.08.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 08:03:40 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jYsv9-0003I8-6i; Wed, 13 May 2020 17:03:43 +0200
Date: Wed, 13 May 2020 17:03:43 +0200
From: Johan Hovold <johan@kernel.org>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Message-ID: <20200513150343.GZ25962@localhost>
References: <20200507185318.GA14393@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200507185318.GA14393@embeddedor>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Replace zero-length
 array with flexible-array
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

T24gVGh1LCBNYXkgMDcsIDIwMjAgYXQgMDE6NTM6MThQTSAtMDUwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBUaGUgY3VycmVudCBjb2RlYmFzZSBtYWtlcyB1c2Ugb2YgdGhlIHplcm8t
bGVuZ3RoIGFycmF5IGxhbmd1YWdlCj4gZXh0ZW5zaW9uIHRvIHRoZSBDOTAgc3RhbmRhcmQsIGJ1
dCB0aGUgcHJlZmVycmVkIG1lY2hhbmlzbSB0byBkZWNsYXJlCj4gdmFyaWFibGUtbGVuZ3RoIHR5
cGVzIHN1Y2ggYXMgdGhlc2Ugb25lcyBpcyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlclsxXVsyXSwK
PiBpbnRyb2R1Y2VkIGluIEM5OToKPiAKPiBzdHJ1Y3QgZm9vIHsKPiAgICAgICAgIGludCBzdHVm
ZjsKPiAgICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKPiB9Owo+IAo+IEJ5IG1ha2luZyB1c2Ug
b2YgdGhlIG1lY2hhbmlzbSBhYm92ZSwgd2Ugd2lsbCBnZXQgYSBjb21waWxlciB3YXJuaW5nCj4g
aW4gY2FzZSB0aGUgZmxleGlibGUgYXJyYXkgZG9lcyBub3Qgb2NjdXIgbGFzdCBpbiB0aGUgc3Ry
dWN0dXJlLCB3aGljaAo+IHdpbGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmlu
ZWQgYmVoYXZpb3IgYnVncyBmcm9tIGJlaW5nCj4gaW5hZHZlcnRlbnRseSBpbnRyb2R1Y2VkWzNd
IHRvIHRoZSBjb2RlYmFzZSBmcm9tIG5vdyBvbi4KPiAKPiBBbHNvLCBub3RpY2UgdGhhdCwgZHlu
YW1pYyBtZW1vcnkgYWxsb2NhdGlvbnMgd29uJ3QgYmUgYWZmZWN0ZWQgYnkKPiB0aGlzIGNoYW5n
ZToKPiAKPiAiRmxleGlibGUgYXJyYXkgbWVtYmVycyBoYXZlIGluY29tcGxldGUgdHlwZSwgYW5k
IHNvIHRoZSBzaXplb2Ygb3BlcmF0b3IKPiBtYXkgbm90IGJlIGFwcGxpZWQuIEFzIGEgcXVpcmsg
b2YgdGhlIG9yaWdpbmFsIGltcGxlbWVudGF0aW9uIG9mCj4gemVyby1sZW5ndGggYXJyYXlzLCBz
aXplb2YgZXZhbHVhdGVzIHRvIHplcm8uIlsxXQo+IAo+IHNpemVvZihmbGV4aWJsZS1hcnJheS1t
ZW1iZXIpIHRyaWdnZXJzIGEgd2FybmluZyBiZWNhdXNlIGZsZXhpYmxlIGFycmF5Cj4gbWVtYmVy
cyBoYXZlIGluY29tcGxldGUgdHlwZVsxXS4gVGhlcmUgYXJlIHNvbWUgaW5zdGFuY2VzIG9mIGNv
ZGUgaW4KPiB3aGljaCB0aGUgc2l6ZW9mIG9wZXJhdG9yIGlzIGJlaW5nIGluY29ycmVjdGx5L2Vy
cm9uZW91c2x5IGFwcGxpZWQgdG8KPiB6ZXJvLWxlbmd0aCBhcnJheXMgYW5kIHRoZSByZXN1bHQg
aXMgemVyby4gU3VjaCBpbnN0YW5jZXMgbWF5IGJlIGhpZGluZwo+IHNvbWUgYnVncy4gU28sIHRo
aXMgd29yayAoZmxleGlibGUtYXJyYXkgbWVtYmVyIGNvbnZlcnNpb25zKSB3aWxsIGFsc28KPiBo
ZWxwIHRvIGdldCBjb21wbGV0ZWx5IHJpZCBvZiB0aG9zZSBzb3J0cyBvZiBpc3N1ZXMuCj4gCj4g
VGhpcyBpc3N1ZSB3YXMgZm91bmQgd2l0aCB0aGUgaGVscCBvZiBDb2NjaW5lbGxlLgo+IAo+IFsx
XSBodHRwczovL2djYy5nbnUub3JnL29ubGluZWRvY3MvZ2NjL1plcm8tTGVuZ3RoLmh0bWwKPiBb
Ml0gaHR0cHM6Ly9naXRodWIuY29tL0tTUFAvbGludXgvaXNzdWVzLzIxCj4gWzNdIGNvbW1pdCA3
NjQ5NzczMjkzMmYgKCJjeGdiMy9sMnQ6IEZpeCB1bmRlZmluZWQgYmVoYXZpb3VyIikKPiAKPiBT
aWduZWQtb2ZmLWJ5OiBHdXN0YXZvIEEuIFIuIFNpbHZhIDxndXN0YXZvYXJzQGtlcm5lbC5vcmc+
Cj4gLS0tCj4gIGRyaXZlcnMvZ3JleWJ1cy9hcnBjLmggICAgICAgICAgICAgICAgICAgIHwgICAg
MiAtCj4gIGluY2x1ZGUvbGludXgvZ3JleWJ1cy9ncmV5YnVzX3Byb3RvY29scy5oIHwgICA0NCAr
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0KCkkgbm90aWNlZCBHcmVnIGp1c3QgYXBwbGll
ZCB0aGlzIG9uZSB0byBoaXMgLXRlc3RpbmcgYnJhbmNoLCBidXQgZG8gd2UKcmVhbGx5IHdhbnQg
dGhpcyBpbiBncmV5YnVzX3Byb3RvY29scy5oLCB3aGljaCBpcyBtZWFudCB0byBiZSBzaGFyZWQK
d2l0aCB0aGUgZmlybXdhcmUgc2lkZT8gUGVyaGFwcyBub3QgYW4gaXNzdWUsIGp1c3QgZmlndXJl
ZCBJJ2QgcG9pbnQKdGhpcyBvdXQuCgpKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgo=
