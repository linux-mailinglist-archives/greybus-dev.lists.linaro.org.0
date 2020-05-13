Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E520E1D19D8
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 17:48:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0AE0865F87
	for <lists+greybus-dev@lfdr.de>; Wed, 13 May 2020 15:48:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F259065F8C; Wed, 13 May 2020 15:48:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B5AA65F85;
	Wed, 13 May 2020 15:48:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E665F65F85
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 15:48:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D680365F8B; Wed, 13 May 2020 15:48:14 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by lists.linaro.org (Postfix) with ESMTPS id DD62565F85
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 15:48:06 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id u4so14032289lfm.7
 for <greybus-dev@lists.linaro.org>; Wed, 13 May 2020 08:48:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=E0eWepkBc+wyH1dt54rBpIGFByPwRAmtQvTPXFRLG1M=;
 b=QMQFITLuwFMQpeSHZhCWaMqNmH+a9ziiA8ZA4Xb6+iqvWXdYZbGMkmnHL24r1Z5dDq
 wLNykpXA8atmitkGAVy9vzmvYEmEekeWrviGc+W1/raeb9Oilw2CHBclToi7IkhxKSMe
 LgyYHo9ifeUK3VQZm+t0oCmxGcg99RKKLBJn/aBSY/mvJ/kRgQDh2cI4fl7x1/wJQPHW
 0czLj20RrKl6IYZcrtiHbemuHHIOWu2PVOSMzuPR9X0/1QWJ47swndjR+eir6yuTjAzt
 Nspp9sJYfsHEv1MwRLS0YCMSk5NcloVmk0Vh8uoXdRXjShKbd5k9dbHK3Eq8+d6MYZXA
 8naw==
X-Gm-Message-State: AOAM533jsFf276o++2ZxuKwsZRqUaHQN707JfEzh9ODSyzPALY/gKqEg
 RC6/XXq8DZSfAuWGR2qKi7Y=
X-Google-Smtp-Source: ABdhPJyYXWSK4bVajhB+UkPysvZo2jrccl8u1VTjaedjPyyacfCHOO2khVJxTWq8/B93x3YN98YPpg==
X-Received: by 2002:ac2:5212:: with SMTP id a18mr94069lfl.83.1589384885667;
 Wed, 13 May 2020 08:48:05 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id f10sm6904lfl.82.2020.05.13.08.48.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2020 08:48:04 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jYtc7-0004rB-9k; Wed, 13 May 2020 17:48:07 +0200
Date: Wed, 13 May 2020 17:48:07 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200513154807.GA25962@localhost>
References: <20200507185318.GA14393@embeddedor>
 <20200513150343.GZ25962@localhost>
 <20200513153918.GA1360420@kroah.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200513153918.GA1360420@kroah.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
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

T24gV2VkLCBNYXkgMTMsIDIwMjAgYXQgMDU6Mzk6MThQTSArMDIwMCwgR3JlZyBLcm9haC1IYXJ0
bWFuIHdyb3RlOgo+IE9uIFdlZCwgTWF5IDEzLCAyMDIwIGF0IDA1OjAzOjQzUE0gKzAyMDAsIEpv
aGFuIEhvdm9sZCB3cm90ZToKPiA+IE9uIFRodSwgTWF5IDA3LCAyMDIwIGF0IDAxOjUzOjE4UE0g
LTA1MDAsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4gPiA+IFRoZSBjdXJyZW50IGNvZGVi
YXNlIG1ha2VzIHVzZSBvZiB0aGUgemVyby1sZW5ndGggYXJyYXkgbGFuZ3VhZ2UKPiA+ID4gZXh0
ZW5zaW9uIHRvIHRoZSBDOTAgc3RhbmRhcmQsIGJ1dCB0aGUgcHJlZmVycmVkIG1lY2hhbmlzbSB0
byBkZWNsYXJlCj4gPiA+IHZhcmlhYmxlLWxlbmd0aCB0eXBlcyBzdWNoIGFzIHRoZXNlIG9uZXMg
aXMgYSBmbGV4aWJsZSBhcnJheSBtZW1iZXJbMV1bMl0sCj4gPiA+IGludHJvZHVjZWQgaW4gQzk5
Ogo+ID4gPiAKPiA+ID4gc3RydWN0IGZvbyB7Cj4gPiA+ICAgICAgICAgaW50IHN0dWZmOwo+ID4g
PiAgICAgICAgIHN0cnVjdCBib28gYXJyYXlbXTsKPiA+ID4gfTsKCj4gPiA+ICBkcml2ZXJzL2dy
ZXlidXMvYXJwYy5oICAgICAgICAgICAgICAgICAgICB8ICAgIDIgLQo+ID4gPiAgaW5jbHVkZS9s
aW51eC9ncmV5YnVzL2dyZXlidXNfcHJvdG9jb2xzLmggfCAgIDQ0ICsrKysrKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLQo+ID4gCj4gPiBJIG5vdGljZWQgR3JlZyBqdXN0IGFwcGxpZWQgdGhpcyBv
bmUgdG8gaGlzIC10ZXN0aW5nIGJyYW5jaCwgYnV0IGRvIHdlCj4gPiByZWFsbHkgd2FudCB0aGlz
IGluIGdyZXlidXNfcHJvdG9jb2xzLmgsIHdoaWNoIGlzIG1lYW50IHRvIGJlIHNoYXJlZAo+ID4g
d2l0aCB0aGUgZmlybXdhcmUgc2lkZT8gUGVyaGFwcyBub3QgYW4gaXNzdWUsIGp1c3QgZmlndXJl
ZCBJJ2QgcG9pbnQKPiA+IHRoaXMgb3V0Lgo+IAo+IFdoeSBub3QsIGl0IHNob3VsZCBiZSB0aGUg
c2FtZSB0aGluZywgcmlnaHQ/ICBObyBsb2dpYyBoYXMgY2hhbmdlZCB0aGF0Cj4gSSBzZWUuCgpZ
ZXMsIHRoZSBzdHJ1Y3R1cmUncyB0aGUgc2FtZSwgYnV0IHRoZSBmaXJtd2FyZSB0b29sY2hhaW4g
bWF5IG5vdApleHBlY3QgZmxleGlibGUgYXJyYXlzLiBJIGJlbGlldmUgd2UncmUgaG9sZGluZyBi
YWNrIG9uIHRoZXNlIGNoYW5nZXMKZm9yIHVhcGkgaGVhZGVycyBhcyB3ZWxsIGZvciB0aGF0IHJl
YXNvbj8KCkFnYWluLCBwZXJoYXBzIG5vdCBhbiBpc3N1ZS4gV2UgY2FuIGp1c3QgbWFuZGF0ZSBm
dyB0b29sY2hhaW5zIHRoYXQKc3VwcG9ydCBDOTkgaWYgeW91IHdhbnQgdG8gdXNlIGFuIHVubW9k
aWZpZWQgaGVhZGVyLCBJIGd1ZXNzLgoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2
QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGlu
Zm8vZ3JleWJ1cy1kZXYK
