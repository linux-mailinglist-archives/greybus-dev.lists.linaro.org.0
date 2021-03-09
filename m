Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E27E3321F6
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 10:29:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7C42D66794
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 09:29:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 68A0D66793; Tue,  9 Mar 2021 09:29:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HK_RANDOM_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03A3E66716;
	Tue,  9 Mar 2021 09:29:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5A5A660665
 for <greybus-dev@lists.linaro.org>; Tue,  9 Mar 2021 09:29:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 421D6665E9; Tue,  9 Mar 2021 09:29:37 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 by lists.linaro.org (Postfix) with ESMTPS id 22E1860665
 for <greybus-dev@lists.linaro.org>; Tue,  9 Mar 2021 09:29:36 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id v15so14414227wrx.4
 for <greybus-dev@lists.linaro.org>; Tue, 09 Mar 2021 01:29:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=sO+epgmRhJDMZTjy7AJEtlpTCWTyWl78HxLY6u7YYT4=;
 b=Dsy7o3cLkNlPqTCiFrv4kwTkesb8MYWDVJyha4HxZ4zk4cCnuFfNPfHWsNahLysjC4
 hfSF01UlqFaJ/sSMhGGu+5IygnkwUHq4T3Kezdi/kQYqamxpkzvCThEEBaMBdClg0FkF
 HnFmgNuOqJnwtMJnOWvrk8Xq/9PVt65K6D8EwZ/ICdnFRFbOHmlxueAyomPxkYH5qBt5
 xE3OBLDY35kcZU20Lm/1qdL+UjyltN3HvJjsVwI6mPLl0BJnwQQV8/e3OXyhIA8no5HH
 TLapCOMCnwqPlEpDPbp1bzq1DN392w2OuJjIsB2oDEsKvHX6T1o+5FhchWAJp9ML3lqg
 hz4Q==
X-Gm-Message-State: AOAM533p2FiNjil3nNpW3YC3Dm4kVDtW+pdAkr6wG0JJkr8Oc+mP95NX
 bau79ACmdd7SEP7Yt6ETfdw=
X-Google-Smtp-Source: ABdhPJxRf5rC6bFM/jX0jWPH/MjxZL5FZ/8xf3aU9Yy6CPERflbdpoh/R7KczYhwdnyHNlKIBhJKmg==
X-Received: by 2002:adf:f841:: with SMTP id d1mr26884305wrq.36.1615282175248; 
 Tue, 09 Mar 2021 01:29:35 -0800 (PST)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt.
 [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id o9sm3154597wmc.8.2021.03.09.01.29.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 01:29:34 -0800 (PST)
Date: Tue, 9 Mar 2021 09:29:32 +0000
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20210309092932.kliwq6ylqlnpqekk@arch-thunder.localdomain>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
 <20210308145502.1075689-7-aardelean@deviqon.com>
 <20210309042809.dgop5dli36z27sj2@vireshk-i7>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210309042809.dgop5dli36z27sj2@vireshk-i7>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, ldewangan@nvidia.com,
 linux-kernel@vger.kernel.org, jonathanh@nvidia.com, linux-spi@vger.kernel.org,
 greybus-dev@lists.linaro.org, broonie@kernel.org,
 bcm-kernel-feedback-list@broadcom.com,
 Alexandru Ardelean <aardelean@deviqon.com>, vireshk@kernel.org,
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

SGksCk9uIFR1ZSwgTWFyIDA5LCAyMDIxIGF0IDA5OjU4OjA5QU0gKzA1MzAsIFZpcmVzaCBLdW1h
ciB3cm90ZToKPiBPbiAwOC0wMy0yMSwgMTY6NTQsIEFsZXhhbmRydSBBcmRlbGVhbiB3cm90ZToK
PiA+IFRoZSBpbnRlbnQgaXMgdGhlIHJlbW92YWwgb2YgdGhlICdkZWxheV91c2VjcycgZmllbGQg
ZnJvbSB0aGUKPiA+IHNwaV90cmFuc2ZlciBzdHJ1Y3QsIGFzIHRoZXJlIGlzIGEgJ2RlbGF5JyBm
aWVsZCB0aGF0IGRvZXMgdGhlIHNhbWUKPiA+IHRoaW5nLgo+ID4gCj4gPiBUaGUgc3BpX2RlbGF5
X3RvX25zKCkgY2FuIGJlIHVzZWQgdG8gZ2V0IHRoZSB0cmFuc2ZlciBkZWxheS4gSXQgd29ya3Mg
YnkKPiA+IHVzaW5nIHRoZSAnZGVsYXlfdXNlY3MnIGZpZWxkIGZpcnN0IChpZiBpdCBpcyBub24t
emVybyksIGFuZCBmaW5hbGx5Cj4gPiB1c2VzIHRoZSAnZGVsYXknIGZpZWxkLgo+ID4gCj4gPiBT
aW5jZSB0aGUgJ2RlbGF5X3VzZWNzJyBmaWVsZCBpcyBnb2luZyBhd2F5LCB0aGlzIGNoYW5nZSBt
YWtlcyB1c2Ugb2YgdGhlCj4gPiBzcGlfZGVsYXlfdG9fbnMoKSBmdW5jdGlvbi4gVGhpcyBhbHNv
IG1lYW5zIGRpdmlkaW5nIHRoZSByZXR1cm4gdmFsdWUgb2YKPiA+IHRoZSBmdW5jdGlvbiBieSAx
MDAwLCB0byBjb252ZXJ0IGl0IHRvIG1pY3Jvc2Vjb25kcy4KPiA+IFRvIHByZXZlbnQgYW55IHBv
dGVudGlhbCBmYXVsdHMgd2hlbiBjb252ZXJ0aW5nIHRvIG1pY3Jvc2Vjb25kcyBhbmQgc2luY2UK
PiA+IHRoZSByZXN1bHQgb2Ygc3BpX2RlbGF5X3RvX25zKCkgaXMgaW50LCB0aGUgZGVsYXkgaXMg
YmVpbmcgY29tcHV0ZWQgaW4gMzIKPiA+IGJpdHMgYW5kIHRoZW4gY2xhbXBlZCBiZXR3ZWVuIDAg
JiBVMTZfTUFYLgo+ID4gCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFh
cmRlbGVhbkBkZXZpcW9uLmNvbT4KPiA+IC0tLQo+ID4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3NwaWxpYi5jIHwgNSArKysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3NwaWxpYi5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc3BpbGliLmMKPiA+IGluZGV4
IDY3MmQ1NDBkMzM2NS4uMzA2NTUxNTNkZjZhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvc3BpbGliLmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Nw
aWxpYi5jCj4gPiBAQCAtMjQ1LDYgKzI0NSw3IEBAIHN0YXRpYyBzdHJ1Y3QgZ2Jfb3BlcmF0aW9u
ICpnYl9zcGlfb3BlcmF0aW9uX2NyZWF0ZShzdHJ1Y3QgZ2Jfc3BpbGliICpzcGksCj4gPiAgCS8q
IEZpbGwgaW4gdGhlIHRyYW5zZmVycyBhcnJheSAqLwo+ID4gIAl4ZmVyID0gc3BpLT5maXJzdF94
ZmVyOwo+ID4gIAl3aGlsZSAobXNnLT5zdGF0ZSAhPSBHQl9TUElfU1RBVEVfT1BfRE9ORSkgewo+
ID4gKwkJaW50IHhmZXJfZGVsYXk7Cj4gPiAgCQlpZiAoeGZlciA9PSBzcGktPmxhc3RfeGZlcikK
PiA+ICAJCQl4ZmVyX2xlbiA9IHNwaS0+bGFzdF94ZmVyX3NpemU7Cj4gPiAgCQllbHNlCj4gPiBA
QCAtMjU5LDcgKzI2MCw5IEBAIHN0YXRpYyBzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpnYl9zcGlfb3Bl
cmF0aW9uX2NyZWF0ZShzdHJ1Y3QgZ2Jfc3BpbGliICpzcGksCj4gPiAgCj4gPiAgCQlnYl94ZmVy
LT5zcGVlZF9oeiA9IGNwdV90b19sZTMyKHhmZXItPnNwZWVkX2h6KTsKPiA+ICAJCWdiX3hmZXIt
PmxlbiA9IGNwdV90b19sZTMyKHhmZXJfbGVuKTsKPiA+IC0JCWdiX3hmZXItPmRlbGF5X3VzZWNz
ID0gY3B1X3RvX2xlMTYoeGZlci0+ZGVsYXlfdXNlY3MpOwo+ID4gKwkJeGZlcl9kZWxheSA9IHNw
aV9kZWxheV90b19ucygmeGZlci0+ZGVsYXksIHhmZXIpIC8gMTAwMDsKPiA+ICsJCXhmZXJfZGVs
YXkgPSBjbGFtcF90KHUxNiwgeGZlcl9kZWxheSwgMCwgVTE2X01BWCk7Cj4gPiArCQlnYl94ZmVy
LT5kZWxheV91c2VjcyA9IGNwdV90b19sZTE2KHhmZXJfZGVsYXkpOwo+ID4gIAkJZ2JfeGZlci0+
Y3NfY2hhbmdlID0geGZlci0+Y3NfY2hhbmdlOwo+ID4gIAkJZ2JfeGZlci0+Yml0c19wZXJfd29y
ZCA9IHhmZXItPmJpdHNfcGVyX3dvcmQ7Cj4gCj4gQWNrZWQtYnk6IFZpcmVzaCBLdW1hciA8dmly
ZXNoLmt1bWFyQGxpbmFyby5vcmc+CgpBY2tlZC1ieTogUnVpIE1pZ3VlbCBTaWx2YSA8cm1mcmZz
QGdtYWlsLmNvbT4KCi0tLS0tLQpDaGVlcnMsCiAgICAgUnVpCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
