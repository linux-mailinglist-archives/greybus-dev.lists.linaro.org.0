Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A301A2D27D3
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 10:39:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D089A60E91
	for <lists+greybus-dev@lfdr.de>; Tue,  8 Dec 2020 09:39:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C2AF160EFE; Tue,  8 Dec 2020 09:39:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 795E260F23;
	Tue,  8 Dec 2020 09:38:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8C74C60E75
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 09:38:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7D6BF60EFE; Tue,  8 Dec 2020 09:38:48 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by lists.linaro.org (Postfix) with ESMTPS id 670C860E75
 for <greybus-dev@lists.linaro.org>; Tue,  8 Dec 2020 09:38:47 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id f11so6479286ljn.2
 for <greybus-dev@lists.linaro.org>; Tue, 08 Dec 2020 01:38:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=DTvJajZ3HUb4nu8M5pZUhUsPRLHsfu5EOUbf+sGZc2Q=;
 b=qtDm4TD6jXWil+co5SM+AO1sM1ps03OKJ1rogSDI7FuE6NX6Ncn9999Gd6PCx80kGj
 dgOlO0in2r4fNx5LykuiQrLxj5q0Q7Hu1Rf8GZgV+c1p51SzhXS3c5jTBepN27jG0jOH
 aoJpL4HLCo3rk05/G+W1EJCl3gFevxMSI7qkvFzU46xCYcu3zL3/zqh/Iza97nDD2zu1
 PFxb919RywlPVU2R54qqNj5aOXi4Dzss2IPC3yTS1kiqhYo68+chQ1yCe5rEwntl0GQj
 Bt1B6ZFBWMTufzYnPr6vpkdfgVYGjpGAqinDdXA592DITYmLoPJRQLKmCaV3QjF0MS6l
 TDyQ==
X-Gm-Message-State: AOAM532Za5OePkRlYL4nxMw3aGU6/xNFrB6RthUiU45yjeA8q+YAV8Mu
 eMrsVkmWrpz1yntnJzfTPt8=
X-Google-Smtp-Source: ABdhPJzXZe26yxx/l3kvM/RPCez5mYI4jwN42wzERbqcaO2zVyY1QWfCknrrrH7IZHoGDHwqqBrarw==
X-Received: by 2002:a2e:b5d9:: with SMTP id g25mr797ljn.471.1607420326452;
 Tue, 08 Dec 2020 01:38:46 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id y22sm3337923ljy.89.2020.12.08.01.38.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 01:38:45 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kmZSt-0002VW-Mh; Tue, 08 Dec 2020 10:39:23 +0100
Date: Tue, 8 Dec 2020 10:39:23 +0100
From: Johan Hovold <johan@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Message-ID: <X89JyygGo8FV5Heo@localhost>
References: <20201204183335.3839726-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204183335.3839726-1-uwe@kleine-koenig.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, linux-pwm@vger.kernel.org,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>
Subject: Re: [greybus-dev] [PATCH] greybus: Add TODO item about modernizing
	the pwm code
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

T24gRnJpLCBEZWMgMDQsIDIwMjAgYXQgMDc6MzM6MzVQTSArMDEwMCwgVXdlIEtsZWluZS1Lw7Zu
aWcgd3JvdGU6Cj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvcHdtLmMgdXNlcyB0aGUgb2xkIHN0
eWxlIFBXTSBjYWxsYmFja3MsIG5ldyBkcml2ZXJzCj4gc2hvdWxkIHN0aWNrIHRvIHRoZSBhdG9t
aWMgQVBJIGluc3RlYWQuCj4gLS0tCgpObyBzaWduIG9mZj8KClBsZWFzZSBhbHNvIGFkZCBhIHN0
YWdpbmcgcHJlZml4IHNpbmNlIHRoaXMgcGFydCBvZiBncmV5YnVzIHN0aWxsIGxpdmVzCnRoZXJl
LgoKPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvVE9ETyB8IDIgKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9UT0RPIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvVE9ETwo+IGluZGV4IDMxZjFmMmNi
NDAxYy4uNjQ2MWUwMTMyZmUzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L1RPRE8KPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9UT0RPCj4gQEAgLTEsMyArMSw1
IEBACj4gICogQ29udmVydCBhbGwgdXNlcyBvZiB0aGUgb2xkIEdQSU8gQVBJIGZyb20gPGxpbnV4
L2dwaW8uaD4gdG8gdGhlCj4gICAgR1BJTyBkZXNjcmlwdG9yIEFQSSBpbiA8bGludXgvZ3Bpby9j
b25zdW1lci5oPiBhbmQgbG9vayB1cCBHUElPCj4gICAgbGluZXMgZnJvbSBkZXZpY2UgdHJlZSBv
ciBBQ1BJLgo+ICsqIE1ha2UgcHdtLmMgdXNlIHRoZSBzdHJ1Y3QgcHdtX29wczo6YXBwbHkgaW5z
dGVhZCBvZiA6OmNvbmZpZywgOjpzZXRfcG9sYXJpdHksCj4gKyAgOjplbmFibGUgYW5kIDo6ZGlz
YWJsZS4KCkpvaGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
