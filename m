Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2746F319BB9
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:21:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 442D060E20
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:21:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3104E60F06; Fri, 12 Feb 2021 09:21:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DBFDA665EF;
	Fri, 12 Feb 2021 09:21:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 47F1560E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:21:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2F57966034; Fri, 12 Feb 2021 09:21:35 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by lists.linaro.org (Postfix) with ESMTPS id 1274060E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:21:34 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id cv23so105278pjb.5
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 01:21:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4tMVbE5K32vyYAtUimwkTyAdAdVkkPvAdbHtWim/w/k=;
 b=PJvbw2UpGjeacmwkGxVQv9DqMnY51EmWrmNUSsDF5y69bNmJiqFwJyxUubwNFr29ol
 fRU8ZiXfQxr2A+7iEEolhmZ22OWo657t4ufDK60cZ+qQRV4xfRxgZR8ieArnI9+R2Dg2
 /MaO/5SbIoXabinScGnxox+YmgsiB1DPaEaxn0mYFKx/yLwc6B6C5h5jvE306siaaaMF
 NYUD38tg7y1c8d0JrocUh1TByvRPZYq+bgo7KzqXRo8p3J1lAbBHlxS2JM4vwE3W9oiK
 1fhd0P6OhKPMuAoj5KdHHXL8pVa7AgCc/R5zhCgzfj/1WZ6kDywwhWWDaf/BL4IknU/v
 TszA==
X-Gm-Message-State: AOAM5335ZkOMokKuJXi/I7khDKkNAt4b4CQcGDJfjB1jvazusJCXg5od
 3LRrRXRLkShOYd2OvnidO7VX7qzX
X-Google-Smtp-Source: ABdhPJzlYWbq3Uoc6euuEolsbl12AyqS4Jx+55EBCJa72JOp90zwNkhOgGEvVR5RRh9gMZ69VuxDyQ==
X-Received: by 2002:a17:902:6b01:b029:da:d295:2582 with SMTP id
 o1-20020a1709026b01b02900dad2952582mr2029260plk.14.1613121693146; 
 Fri, 12 Feb 2021 01:21:33 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id t17sm9493836pgk.25.2021.02.12.01.21.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Feb 2021 01:21:32 -0800 (PST)
Date: Fri, 12 Feb 2021 14:51:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20210212092130.cxo6tuess6msf4kb@vireshk-i7>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212090926.ox763j3btrqfzzzj@vireshk-i7>
 <YCZHsMPgyqtRMTII@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCZHsMPgyqtRMTII@kroah.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 Pritthijit Nath <pritthijit.nath@icloud.com>
Subject: Re: [greybus-dev] [PATCH 1/2] staging: greybus: Fixed alignment
	issue in hid.c
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

T24gMTItMDItMjEsIDEwOjE3LCBHcmVnIEtIIHdyb3RlOgo+IE9uIEZyaSwgRmViIDEyLCAyMDIx
IGF0IDAyOjM5OjI2UE0gKzA1MzAsIFZpcmVzaCBLdW1hciB3cm90ZToKPiA+IE9uIDEyLTAyLTIx
LCAxMzo0OCwgUHJpdHRoaWppdCBOYXRoIHdyb3RlOgo+ID4gPiBUaGlzIGNoYW5nZSBmaXhlcyBh
IGNoZWNrcGF0Y2ggQ0hFQ0sgc3R5bGUgaXNzdWUgZm9yICJBbGlnbm1lbnQgc2hvdWxkIG1hdGNo
Cj4gPiA+IG9wZW4gcGFyZW50aGVzaXMiLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogUHJp
dHRoaWppdCBOYXRoIDxwcml0dGhpaml0Lm5hdGhAaWNsb3VkLmNvbT4KPiA+ID4gLS0tCj4gPiA+
ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyB8IDQgKystLQo+ID4gPiAgMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4gCj4gPiA+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jCj4gPiA+IGluZGV4IGVkNzA2ZjM5ZTg3YS4uYTU2YzNmYjVkMzVhIDEwMDY0
NAo+ID4gPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwo+ID4gPiArKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwo+ID4gPiBAQCAtMjIxLDggKzIyMSw4IEBAIHN0
YXRpYyB2b2lkIGdiX2hpZF9pbml0X3JlcG9ydHMoc3RydWN0IGdiX2hpZCAqZ2hpZCkKPiA+ID4g
IH0KPiA+ID4gCj4gPiA+ICBzdGF0aWMgaW50IF9fZ2JfaGlkX2dldF9yYXdfcmVwb3J0KHN0cnVj
dCBoaWRfZGV2aWNlICpoaWQsCj4gPiA+IC0JCXVuc2lnbmVkIGNoYXIgcmVwb3J0X251bWJlciwg
X191OCAqYnVmLCBzaXplX3QgY291bnQsCj4gPiA+IC0JCXVuc2lnbmVkIGNoYXIgcmVwb3J0X3R5
cGUpCj4gPiA+ICsJCQkJICAgdW5zaWduZWQgY2hhciByZXBvcnRfbnVtYmVyLCBfX3U4ICpidWYs
IHNpemVfdCBjb3VudCwKPiA+ID4gKwkJCQkgICB1bnNpZ25lZCBjaGFyIHJlcG9ydF90eXBlKQo+
ID4gPiAgewo+ID4gPiAgCXN0cnVjdCBnYl9oaWQgKmdoaWQgPSBoaWQtPmRyaXZlcl9kYXRhOwo+
ID4gPiAgCWludCByZXQ7Cj4gPiAKPiA+IEkgY2FuJ3QgZXZlbiBjb3VudCB0aGUgbnVtYmVyIG9m
IGF0dGVtcHRzIHdlIGhhdmUgc2VlbiBpbiBwcmV2aW91cwo+ID4geWVhcnMgdG8gbWFrZSBjaGVj
a3BhdGNoIC0tc3RyaWN0IGhhcHB5IGZvciBncmV5YnVzLgo+ID4gCj4gPiBJIHNheSB3ZSBtYWtl
IHRoaXMgY2hhbmdlIG9uY2UgYW5kIGZvciBhbGwgYWNyb3NzIGdyZXlidXMsIHNvIHdlIGRvbid0
Cj4gPiBoYXZlIHRvIHJldmlldyBvciBOQUsgc29tZW9uZSBhZnRlcndhcmRzLgo+ID4gCj4gPiBT
aG91bGQgSSBzZW5kIGEgcGF0Y2ggZm9yIHRoaXMgPwo+IAo+IFN1cmUsIGJ1dCBub3RlIHRoYXQg
b3ZlciB0aW1lLCBjaGVja3BhdGNoIGFkZHMgbmV3IHRoaW5ncyBzbyB0aGVyZSB3aWxsCj4gYWx3
YXlzIGJlIHNvbWV0aGluZyB0byBjaGFuZ2UgaW4gaGVyZSwgdW50aWwgd2UgbW92ZSBpdCBvdXQg
b2YgdGhlCj4gZHJpdmVycy9zdGFnaW5nLyBhcmVhIDopCgpSaWdodCwgdGhvdWdoIEkgd2Fzbid0
IHdvcnJpZWQgYWJvdXQgb3RoZXIgY2hlY2twYXRjaCB3YXJuaW5nIGJ1dApzcGVjaWFsbHkgdGhl
ICJhbGlnbm1lbnQgLSBwYXJlbnRoZXNpcyIgb25lLiBFdmVyeW9uZSAoc3BlY2lhbGx5Cm5ld2Jp
ZXMpIHdhbnQgdG8gZml4IHRoYXQgZXZlcnl3aGVyZSA6KQoKLS0gCnZpcmVzaApfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
