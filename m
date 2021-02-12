Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DF940319BA4
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 10:07:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 07A1560F06
	for <lists+greybus-dev@lfdr.de>; Fri, 12 Feb 2021 09:07:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EF2356675A; Fri, 12 Feb 2021 09:07:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B4D3A665EF;
	Fri, 12 Feb 2021 09:07:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DC31960E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:07:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CD01A66034; Fri, 12 Feb 2021 09:07:34 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com
 [209.85.215.169])
 by lists.linaro.org (Postfix) with ESMTPS id C484B60E20
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 09:07:33 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id o38so5804934pgm.9
 for <greybus-dev@lists.linaro.org>; Fri, 12 Feb 2021 01:07:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6MpurOZa0mv3rlud19+UrDfFOlySt773FOU0UbP6jCM=;
 b=GCtzFsJEAxka47g5E654tpzvYi6N6MBnyuCa2b2iEQbi+sdWNVg8kEMCwKTobBWRCC
 lYQY1oDIAJ3p31Ur4g9zW5AxEt6fa7eGtxE0bDFXRI8NyGUstJ/T3LYNqwCjbCWKLd0L
 7uxmX5oIC8SLuQcS6O0vr912dSSuih+49KpWhTx2VMCjmHYoxtFDDUtOZ0YEpTqRKZYM
 8zuAY0a2VJZ4+mF+/XP9P4+Jo3pZtZ3ZL5nBcTNHjCESoID5gl7qEpUjAtUZExTzcSil
 K7zNyQumjz392obLVs8dTtciCvLb6ENAUSCZSUkwaC2MBTNdCKhpgiKcbj8TgMpnarbi
 dDQA==
X-Gm-Message-State: AOAM530K1Yi7S928NyJflY0Y0BtrAhLKH55guwws6rG0qU9NlR3Wmex/
 Z7BMAeENOHc4hsX4pto5E4rPt8VC
X-Google-Smtp-Source: ABdhPJzckJvZqN95IsVA2av6UB6S5iPiC56AQHWQsGqRBxE1qW91mw0dHw0tjcxCTu8hrwtVbE6bow==
X-Received: by 2002:a62:ce82:0:b029:1d9:1872:294b with SMTP id
 y124-20020a62ce820000b02901d91872294bmr2043072pfg.36.1613120852892; 
 Fri, 12 Feb 2021 01:07:32 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id t17sm8587548pfc.43.2021.02.12.01.07.31
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Feb 2021 01:07:32 -0800 (PST)
Date: Fri, 12 Feb 2021 14:37:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Greg KH <gregkh@linuxfoundation.org>
Message-ID: <20210212090730.mgpafwrkx4pvggyr@vireshk-i7>
References: <20210212081835.9497-1-pritthijit.nath@icloud.com>
 <20210212081835.9497-2-pritthijit.nath@icloud.com>
 <YCY/1LCP404AZxhm@hovoldconsulting.com>
 <YCZCY+UlzdwGU6pw@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YCZCY+UlzdwGU6pw@kroah.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, Pritthijit Nath <pritthijit.nath@icloud.com>
Subject: Re: [greybus-dev] [PATCH 2/2] staging: greybus: Fixed a misspelling
	in hid.c
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

T24gMTItMDItMjEsIDA5OjU0LCBHcmVnIEtIIHdyb3RlOgo+IE9uIEZyaSwgRmViIDEyLCAyMDIx
IGF0IDA5OjQ0OjA0QU0gKzAxMDAsIEpvaGFuIEhvdm9sZCB3cm90ZToKPiA+IE9uIEZyaSwgRmVi
IDEyLCAyMDIxIGF0IDAxOjQ4OjM1UE0gKzA1MzAsIFByaXR0aGlqaXQgTmF0aCB3cm90ZToKPiA+
ID4gRml4ZWQgdGhlIHNwZWxsaW5nIG9mICd0cmFuc2ZlcmVkJyB0byAndHJhbnNmZXJyZWQnLgo+
ID4gPiAKPiA+ID4gU2lnbmVkLW9mZi1ieTogUHJpdHRoaWppdCBOYXRoIDxwcml0dGhpaml0Lm5h
dGhAaWNsb3VkLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9o
aWQuYyB8IDIgKy0KPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2hpZC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMKPiA+ID4gaW5kZXggYTU2YzNm
YjVkMzVhLi42YjE5ZmY0NzQzYTkgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCj4g
PiA+IEBAIC0yNTQsNyArMjU0LDcgQEAgc3RhdGljIGludCBfX2diX2hpZF9vdXRwdXRfcmF3X3Jl
cG9ydChzdHJ1Y3QgaGlkX2RldmljZSAqaGlkLCBfX3U4ICpidWYsCj4gPiA+IAo+ID4gPiAgCXJl
dCA9IGdiX2hpZF9zZXRfcmVwb3J0KGdoaWQsIHJlcG9ydF90eXBlLCByZXBvcnRfaWQsIGJ1Ziwg
bGVuKTsKPiA+ID4gIAlpZiAocmVwb3J0X2lkICYmIHJldCA+PSAwKQo+ID4gPiAtCQlyZXQrKzsg
LyogYWRkIHJlcG9ydF9pZCB0byB0aGUgbnVtYmVyIG9mIHRyYW5zZmVyZWQgYnl0ZXMgKi8KPiA+
ID4gKwkJcmV0Kys7IC8qIGFkZCByZXBvcnRfaWQgdG8gdGhlIG51bWJlciBvZiB0cmFuc2ZlcnJp
ZCBieXRlcyAqLwo+ID4gCj4gPiBZb3Ugbm93IG1pc3NwZWxsZWQgdHJhbnNmZXJyZWQgaW4gYSBk
aWZmZXJlbnQgd2F5Lgo+IAo+IE9vcHMsIHdpbGwgZ28gcmV2ZXJ0IHRoaXMsIEkgbmVlZCBtb3Jl
IGNvZmZlZS4uLgoKWWVhaCwgaXRzIEZyaWRheS4uIFlvdSBuZWVkIGEgYnJlYWsgdG9vIDopCgot
LSAKdmlyZXNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0
dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
