Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 31490181E28
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 17:43:59 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 51C2965FD5
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2020 16:43:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3F9C265FD9; Wed, 11 Mar 2020 16:43:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 108B565FD8;
	Wed, 11 Mar 2020 16:43:48 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7B25B609BE
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 16:43:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6CF4565FD8; Wed, 11 Mar 2020 16:43:45 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by lists.linaro.org (Postfix) with ESMTPS id 71484619B5
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 16:43:44 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id j11so2321473lfg.4
 for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2020 09:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=773L+w0I9HPnHgYZP79UDOcRjAnkNWqJrs4B1M0USW0=;
 b=UHU05fjRCEcWjB+8Lk+eNyPBVhSNo4QlP06F2KffINDriu7Qs7ssBu2LM9BfZT085g
 SbxJA7Xu8RJ4VxeY62xtnE+Ov6sVl2vqZ2GMj14TZG3quC4axLcLNualVHdSAYazAx9I
 OB9kcX1KubDZpVbyLc3ys85bQKJmhmRlEqQDUtH8UjAeaon9VH3FEiXcaQz9D902O8NC
 qITK6KeJxS9UNK0AnlAeCjZjnFBYUQUVEbLyCVxinvIQFAsCT2xzJLH54jgjJN50CB8m
 iX4Fudty1CcreZZDHQM1Cfz/gvWqoF53rDIQfZ9VM//eLEbvN6VrVo8QXmhfLW7BvzGE
 MUgQ==
X-Gm-Message-State: ANhLgQ3gGb79iUb+JLdQNcgDtr8TURJwRAEABCMppv/ImewKZldGN9SF
 00NiJWsDf5PanzNK5epQRog=
X-Google-Smtp-Source: ADFU+vupgM0nN8Yt6G4yQPQDbaxHbVAAVZo2CZGdMQfpGSFxgRsbJpNcnX4c2VIYIQf4tFlxP6oBMQ==
X-Received: by 2002:a19:be03:: with SMTP id o3mr105298lff.84.1583945023431;
 Wed, 11 Mar 2020 09:43:43 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id v27sm9092293lfq.78.2020.03.11.09.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2020 09:43:42 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1jC4SB-0006Xi-Cf; Wed, 11 Mar 2020 17:43:31 +0100
Date: Wed, 11 Mar 2020 17:43:31 +0100
From: Johan Hovold <johan@kernel.org>
To: Takashi Iwai <tiwai@suse.de>
Message-ID: <20200311164331.GM14211@localhost>
References: <20200311100535.29635-1-tiwai@suse.de>
 <20200311100959.GK14211@localhost>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311100959.GK14211@localhost>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH RESEND] staging: greybus: loopback_test:
 Use scnprintf() for avoiding potential buffer overflow
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

T24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTE6MDk6NTlBTSArMDEwMCwgSm9oYW4gSG92b2xkIHdy
b3RlOgo+IE9uIFdlZCwgTWFyIDExLCAyMDIwIGF0IDExOjA1OjM1QU0gKzAxMDAsIFRha2FzaGkg
SXdhaSB3cm90ZToKPiA+IFNpbmNlIHNucHJpbnRmKCkgcmV0dXJucyB0aGUgd291bGQtYmUtb3V0
cHV0IHNpemUgaW5zdGVhZCBvZiB0aGUKPiA+IGFjdHVhbCBvdXRwdXQgc2l6ZSwgdGhlIHN1Y2Nl
ZWRpbmcgY2FsbHMgbWF5IGdvIGJleW9uZCB0aGUgZ2l2ZW4KPiA+IGJ1ZmZlciBsaW1pdC4gIEZp
eCBpdCBieSByZXBsYWNpbmcgd2l0aCBzY25wcmludGYoKS4KPiA+IAo+ID4gU2lnbmVkLW9mZi1i
eTogVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmRlPgo+ID4gLS0tCj4gPiAKPiA+IEp1c3QgY29y
cmVjdGVkIHRoZSBzdWJqZWN0IHByZWZpeCBwZXIgcmVxdWVzdC4KPiAKPiBBY2tlZC1ieTogSm9o
YW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgoKSSB0YWtlIHRoYXQgYmFjaywgdGhpcyBwYXRj
aCBzaG91bGQgTk9UIGJlIGFwcGxpZWQuCgpUaGlzIGlzIHVzZXItc3BhY2UgY29kZSBzbyB1c2lu
ZyBzY25wcmludGYoKSBkb2Vzbid0IG1ha2Ugc2Vuc2UuCgpKb2hhbgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QK
Z3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFp
bG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
