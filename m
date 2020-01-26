Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C284E149A53
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jan 2020 12:04:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 77510608FC
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Jan 2020 11:04:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6227361063; Sun, 26 Jan 2020 11:04:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D4C79617B6;
	Sun, 26 Jan 2020 11:04:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1B768608FC
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 11:04:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0160E6164D; Sun, 26 Jan 2020 11:04:41 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by lists.linaro.org (Postfix) with ESMTPS id 0B3C3608FC
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 11:04:41 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id z18so4219812lfe.2
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 03:04:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=cBEvHipDhASp6SrgrMvSSIKcdMGAZhryboaA8IMUX2s=;
 b=bdHYqvK2EI8ou23jcj7XBe7mthXxcgBQ2aKXGKPk7guIvt7Rn+FNqrmWLGrEbkcPkt
 8OpFUVB0YmepUEk/p8lpkHE47aeQUIdzU/5tfMjfutXRQutoBLVzfIyEWIaohUUeLA5u
 U2S/7wbZOUUGR3bF/S5W2V6NVU81uKAQYIdR85Mlzftht8oxpIMvxEJXnbTDdXQqiDvC
 P5iywJpd2We2ttM7tCJMmMZQYy8B0L2EEklUkGhAU3dkANSYK8Qp42E3IeKhtOInrUHn
 3HXGBOhY3k9JM3rWeqciolrucmiW1sJvNsT469tneUCuNj+NrQkvH2cbXGHo2VnfZtdO
 WPKQ==
X-Gm-Message-State: APjAAAUrMGyAgBkhjPMz2mX8zQBy8pB3mpInOL6I2/PoT7HEC4+9tF5h
 7uewDi35LHhsMTCskZT3N0Q=
X-Google-Smtp-Source: APXvYqxUJWPIUdQ6aj4sUa6PfEhjDgxHlfrOt9/+bFdx0TGpwI3cBGPA3OkKviqn+eYt1PKhd4GFIw==
X-Received: by 2002:a19:cb95:: with SMTP id b143mr1425364lfg.158.1580036679872; 
 Sun, 26 Jan 2020 03:04:39 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.184.20])
 by smtp.gmail.com with ESMTPSA id s15sm812959ljs.58.2020.01.26.03.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Jan 2020 03:04:38 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1ivfiZ-0002mK-R5; Sun, 26 Jan 2020 12:04:39 +0100
Date: Sun, 26 Jan 2020 12:04:39 +0100
From: Johan Hovold <johan@kernel.org>
To: Saurav Girepunje <saurav.girepunje@gmail.com>
Message-ID: <20200126110439.GL8375@localhost>
References: <20200126083130.GA17725@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200126083130.GA17725@google.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 saurav.girepunje@hotmail.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix fw is NULL but
	dereferenced.
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

T24gU3VuLCBKYW4gMjYsIDIwMjAgYXQgMDI6MDE6MzBQTSArMDUzMCwgU2F1cmF2IEdpcmVwdW5q
ZSB3cm90ZToKPiBGaXggdGhlIHdhcm5pbmcgcmVwb3J0ZWQgYnkgY29jY2kgY2hlY2suCj4gCj4g
Q2hhbmdlczoKPiAKPiBJbiBxdWV1ZV93b3JrIGZ3IGRlcmVmZXJlbmNlIGJlZm9yZSBpdCBhY3R1
YWxseSBnZXQgYXNzaWduZWQuCj4gbW92ZSBxdWV1ZV93b3JrIGJlZm9yZSBnYl9ib290cm9tX3Nl
dF90aW1lb3V0LgoKTm9wZS4gQXMgSSBzYWlkIHllc3RlcmRheSwgeW91IG5lZWQgdG8gdmVyaWZ5
IHRoZSBvdXRwdXQgb2YgYW55IHN0YXRpYwpjaGVja2VycyB5b3UgdXNlLgoKVGhlIGNvZGUgbWF5
IGJlIHVubmVjZXNzYXJpbHkgc3VidGxlLCBidXQgdGhlcmUncyBubyB3YXkgZncgY2FuIGJlCmRl
cmVmZXJlbmNlZCBiZWZvcmUgYmVpbmcgaW5pdGlhbGlzZWQgY3VycmVudGx5LgoKPiAtcXVldWVf
d29yazoKPiAgIAkvKiBSZWZyZXNoIHRpbWVvdXQgKi8KPiAgIAlpZiAoIXJldCAmJiAob2Zmc2V0
ICsgc2l6ZSA9PSBmdy0+c2l6ZSkpCgpTcGVjaWZpY2FsbHksIHRoZSBzZWNvbmQgb3BlcmFuZCBp
cyBuZXZlciBldmFsdWF0ZWQgaWYgcmV0IGlzIG5vbi16ZXJvLgoKPiAgIAkJbmV4dF9yZXF1ZXN0
ID0gTkVYVF9SRVFfUkVBRFlfVE9fQk9PVDsKPiAtCWVsc2UKPiAtCQluZXh0X3JlcXVlc3QgPSBO
RVhUX1JFUV9HRVRfRklSTVdBUkU7Cj4gICAKPiArcXVldWVfd29yazoKPiAgIAlnYl9ib290cm9t
X3NldF90aW1lb3V0KGJvb3Ryb20sIG5leHRfcmVxdWVzdCwgTkVYVF9SRVFfVElNRU9VVF9NUyk7
Cj4gICAKPiAgIAlyZXR1cm4gcmV0OwoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vZ3JleWJ1cy1kZXYK
