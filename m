Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA3D15A272
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Feb 2020 08:55:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 81EFC6193D
	for <lists+greybus-dev@lfdr.de>; Wed, 12 Feb 2020 07:55:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 76EA061939; Wed, 12 Feb 2020 07:55:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29C7760EE3;
	Wed, 12 Feb 2020 07:55:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A42FF60E15
 for <greybus-dev@lists.linaro.org>; Wed, 12 Feb 2020 07:55:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8602760EBF; Wed, 12 Feb 2020 07:55:00 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by lists.linaro.org (Postfix) with ESMTPS id 3599B60E15
 for <greybus-dev@lists.linaro.org>; Wed, 12 Feb 2020 07:54:59 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id l18so908147lfc.1
 for <greybus-dev@lists.linaro.org>; Tue, 11 Feb 2020 23:54:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XOeJJO/gHIHj8IPyKogVmbQJ5pI6iqanQ/nqcsZTJg4=;
 b=bJeUajXfNMczxi5IR+kMhCCNvlQXoFzlcenYwlE+swDF8/ZoozdU8motTBC4iPAcB8
 EzW+tIumEATCfvF6109ASLby3hHaxoikWrDwOI9k11af5746lvhnm7yfiKz06HK2ryAy
 BYK9MahT12tD6tQJIn8tAH0nrqxpVQsuZu+ZQ7BLew4AgeGpIpFbK0ZLCxJOVO3HYh5l
 YebSOgv5LcfhNyy1U57YRk01sqpuvS0VrJA0AUIF5S3ZwsjV2YacoBBYWqPGCNlpGZrn
 i1K4UpgEAmW4cEJDvZyKxidl7WhFb2e9jr5Cu8t4GnQrRCwNpMynXySZ6RqaSK9zlphP
 Lseg==
X-Gm-Message-State: APjAAAXHPmmjHYEplxu01M5I81FxqPheXHgnzbw6YBqhnFdzxQRl3p1N
 p5CpxffzO+C34ONvKvPZVH8=
X-Google-Smtp-Source: APXvYqwiqKB4EAN/96Tkd3vj9smH96Nvs43kXzhiz5qG0VLbRhU5S/mNpmL53tNqBKQrPI7aBPWvcw==
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr5909864lfl.64.1581494098087;
 Tue, 11 Feb 2020 23:54:58 -0800 (PST)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id x10sm3474024ljd.68.2020.02.11.23.54.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 23:54:57 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1j1mrI-0006TD-3b; Wed, 12 Feb 2020 08:54:56 +0100
Date: Wed, 12 Feb 2020 08:54:56 +0100
From: Johan Hovold <johan@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Message-ID: <20200212075456.GD4150@localhost>
References: <20200211211219.GA673@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200211211219.GA673@embeddedor>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Replace zero-length
 array with flexible-array member
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

T24gVHVlLCBGZWIgMTEsIDIwMjAgYXQgMDM6MTI6MTlQTSAtMDYwMCwgR3VzdGF2byBBLiBSLiBT
aWx2YSB3cm90ZToKPiBUaGUgY3VycmVudCBjb2RlYmFzZSBtYWtlcyB1c2Ugb2YgdGhlIHplcm8t
bGVuZ3RoIGFycmF5IGxhbmd1YWdlCj4gZXh0ZW5zaW9uIHRvIHRoZSBDOTAgc3RhbmRhcmQsIGJ1
dCB0aGUgcHJlZmVycmVkIG1lY2hhbmlzbSB0byBkZWNsYXJlCj4gdmFyaWFibGUtbGVuZ3RoIHR5
cGVzIHN1Y2ggYXMgdGhlc2Ugb25lcyBpcyBhIGZsZXhpYmxlIGFycmF5IG1lbWJlclsxXVsyXSwK
PiBpbnRyb2R1Y2VkIGluIEM5OToKPiAKPiBzdHJ1Y3QgZm9vIHsKPiAgICAgICAgIGludCBzdHVm
ZjsKPiAgICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKPiB9Owo+IAo+IEJ5IG1ha2luZyB1c2Ug
b2YgdGhlIG1lY2hhbmlzbSBhYm92ZSwgd2Ugd2lsbCBnZXQgYSBjb21waWxlciB3YXJuaW5nCj4g
aW4gY2FzZSB0aGUgZmxleGlibGUgYXJyYXkgZG9lcyBub3Qgb2NjdXIgbGFzdCBpbiB0aGUgc3Ry
dWN0dXJlLCB3aGljaAo+IHdpbGwgaGVscCB1cyBwcmV2ZW50IHNvbWUga2luZCBvZiB1bmRlZmlu
ZWQgYmVoYXZpb3IgYnVncyBmcm9tIGJlaW5nCj4gaW5hZHZlcnRlbmx5IGludHJvZHVjZWRbM10g
dG8gdGhlIGNvZGViYXNlIGZyb20gbm93IG9uLgo+IAo+IFRoaXMgaXNzdWUgd2FzIGZvdW5kIHdp
dGggdGhlIGhlbHAgb2YgQ29jY2luZWxsZS4KCkxvb2tzIGxpa2UgdGhlIHNjcmlwdHMgbWF5IG5l
ZWQgdG8gYmUgdXBkYXRlZC4gWW91IG1pc3NlZCBhdCBsZWFzdCBhCmNvdXBsZSBvZiBpbnN0YW5j
ZXM6CgoJJCBnaXQgZ3JlcCAnXFswXF07JyBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy8KCWRyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2FwYnJpZGdlYS5oOiAgICAgIF9fdTggICAgZGF0YVsw
XTsKCS4uLgoJZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdXNiLmM6ICB1OCBidWZbMF07CgpXb3Vs
ZCB5b3UgbWluZCByZXBsYWNpbmcgdGhlc2UgYXMgd2VsbCBzbyB0aGF0IHdlIHJlYWxseSBkbyB0
aGlzIGluIG9uZQpwYXRjaCBwZXIgc3Vic3lzdGVtPwoKPiBbMV0gaHR0cHM6Ly9nY2MuZ251Lm9y
Zy9vbmxpbmVkb2NzL2djYy9aZXJvLUxlbmd0aC5odG1sCj4gWzJdIGh0dHBzOi8vZ2l0aHViLmNv
bS9LU1BQL2xpbnV4L2lzc3Vlcy8yMQo+IFszXSBjb21taXQgNzY0OTc3MzI5MzJmICgiY3hnYjMv
bDJ0OiBGaXggdW5kZWZpbmVkIGJlaGF2aW91ciIpCj4gCj4gU2lnbmVkLW9mZi1ieTogR3VzdGF2
byBBLiBSLiBTaWx2YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvcmF3LmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9yYXcuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Jhdy5jCj4gaW5kZXggODM4YWNi
ZTg0Y2EwLi4yYjMwMWIyYWExMDcgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvcmF3LmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9yYXcuYwo+IEBAIC0zMCw3
ICszMCw3IEBAIHN0cnVjdCBnYl9yYXcgewo+ICBzdHJ1Y3QgcmF3X2RhdGEgewo+ICAJc3RydWN0
IGxpc3RfaGVhZCBlbnRyeTsKPiAgCXUzMiBsZW47Cj4gLQl1OCBkYXRhWzBdOwo+ICsJdTggZGF0
YVtdOwo+ICB9Owo+ICAKPiAgc3RhdGljIHN0cnVjdCBjbGFzcyAqcmF3X2NsYXNzOwoKVGhhbmtz
LApKb2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
