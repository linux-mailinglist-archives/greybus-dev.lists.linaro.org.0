Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC1B2D2945
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 11:53:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D317760E91
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 10:53:44 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C7C5C60EFE; Tue,  8 Dec 2020 10:53:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CF0B36604C;
	Tue,  8 Dec 2020 10:53:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E3B8160C37
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 10:53:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D672A60E91; Tue,  8 Dec 2020 10:53:17 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id A5E0E6604C
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 10:51:21 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id s30so22363580lfc.4
 for <greybus-dev@lists.linaro.org>; Tue, 08 Dec 2020 02:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GJIypj7aFv+EkGs5X79db2AgKKCjUhxQkXJzRHihlW4=;
 b=VXM6Z/UaMtlOHIg65YhDB4IcepdihAmwpQQY7t3G6lWGJowgZ124bNuN90uJXqursQ
 JASncYji4hwwaYXjb127GiH5/S8DMEBDM0V5jDoUcfW7pNBP+iN10JCS7gLuPfrhqtyF
 wJNlLVYWjtZlbJzreKOZf1VQ8p5Yze1KesgZK4h6UtgF6Cc0V94U7n1n4QGap6kLW6Zn
 JU6mFRARRH4aeNCQOqMR5LrdQAJwbQvQ60BNHr9OFO5KTSQ1DAILt6GtBtySS7MSeMy2
 8cO4MYF4hi4HOqQGx6A8I8bT2r106IqQ8/J9Wp6sD8YL8GFKx8TWjHhv90RGduRT6Wq4
 MmDA==
X-Gm-Message-State: AOAM532ahKtuu2FMRQBL3aA247mSWV0JjADD4GTmSWnhwHrCGQ/B0Xwk
 SFZsWFthpHJiR6EcdqvqwUI=
X-Google-Smtp-Source: ABdhPJye8l8gwL4nXPcg3I4TNDJMJmiNV8b8jOOn38pTD8/MkgrkrpCw2W4bZFxmsVA5YkOvDRpVEg==
X-Received: by 2002:a19:2489:: with SMTP id k131mr3604491lfk.236.1607424680466; 
 Tue, 08 Dec 2020 02:51:20 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id n10sm1161481ljg.139.2020.12.08.02.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 02:51:19 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kmab6-00038e-VF; Tue, 08 Dec 2020 11:51:57 +0100
Date: Tue, 8 Dec 2020 11:51:56 +0100
From: Johan Hovold <johan@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Message-ID: <X89azMazQfKZCKwm@localhost>
References: <20201208101607.42785-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201208101607.42785-1-uwe@kleine-koenig.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: Add TODO item about
 modernizing the pwm code
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

T24gVHVlLCBEZWMgMDgsIDIwMjAgYXQgMTE6MTY6MDdBTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgdXNlcyB0aGUgb2xkIHN0
eWxlIFBXTSBjYWxsYmFja3MsIG5ldyBkcml2ZXJzCj4gc2hvdWxkIHN0aWNrIHRvIHRoZSBhdG9t
aWMgQVBJIGluc3RlYWQuCj4gCj4gU2lnbmVkLW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHV3
ZUBrbGVpbmUta29lbmlnLm9yZz4KPiAtLS0KPiBPbiAxMi84LzIwIDEwOjM5IEFNLCBKb2hhbiBI
b3ZvbGQgd3JvdGU6Cj4gPiBObyBzaWduIG9mZj8KPiA+IAo+ID4gUGxlYXNlIGFsc28gYWRkIGEg
c3RhZ2luZyBwcmVmaXggc2luY2UgdGhpcyBwYXJ0IG9mIGdyZXlidXMgc3RpbGwgbGl2ZXMKPiA+
IHRoZXJlLgo+IAo+IFRoYXQgYWZ0ZXIgYWxsIHRoZXNlIHllYXJzIEkgc3RpbGwgZmFpbCBvY2Nh
c2lvbmFsbHkgdG8gYWRkIGEgc2lnbi1vZmYKPiAuLi4gL21lIHNoYWtlcyBoaXMgaGVhZCBhYm91
dCBoaW1zZWxmLgoKKippdCBoYXBwZW5zLiA6KQoKPiBBbnlob3csIGhlcmUgY29tZXMgYSB2Miwg
YWxzbyB3aXRoIHRoZSByZXF1ZXN0ZWQgcHJlZml4LgoKVGhhbmtzLgoKQWNrZWQtYnk6IEpvaGFu
IEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KCkpvaGFuCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVz
LWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2dyZXlidXMtZGV2Cg==
