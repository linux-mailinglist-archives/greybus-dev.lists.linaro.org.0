Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2774211F7EC
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Dec 2019 14:13:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CE6E960836
	for <lists+greybus-dev@lfdr.de>; Sun, 15 Dec 2019 13:13:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C2A156087F; Sun, 15 Dec 2019 13:13:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C562D60991;
	Sun, 15 Dec 2019 13:13:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BE8BF60836
 for <greybus-dev@lists.linaro.org>; Sun, 15 Dec 2019 13:13:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AC96E608CC; Sun, 15 Dec 2019 13:13:16 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by lists.linaro.org (Postfix) with ESMTPS id B137D60836
 for <greybus-dev@lists.linaro.org>; Sun, 15 Dec 2019 13:13:15 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id z17so3722922ljk.13
 for <greybus-dev@lists.linaro.org>; Sun, 15 Dec 2019 05:13:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YA+v63rNr4UkEaTv/uf0qeJ3VuXojXXGA4Hp4rZe/9A=;
 b=Nh3H8YadIoaJwx3WRs2RHHy5Dc6RdJCnPpSEW9A5SrJ2Xoyt5FN0aUtaKLwUCWwIT7
 UqZSs34YrHBb179v5tXXMFZYyo7E1xh58k7wu41YvbB4NsCdXnA6dKZ/boWKdLcbb6f7
 iGPy/J6CnK7ieOfeSJ33XhZNk4aSnPJ3+EKq3p0Fhl3bm13p8jHfElNul9a+C3hPnSH3
 0S0OO8PIvci6UnuSJihHviocmfJR4+Ow4AS0BjDclJu24ZdUY8FypNYgESZoNLT9BeIY
 S1GoGRFhYfHDh8zbr8m9fe1EHV2UottvVhDvGs0XVqLiQs++lwIjsiEbZna8B8VeW9b+
 GvDA==
X-Gm-Message-State: APjAAAWsQTs3pCBwCRrg3YMyxVFvYjdu20pAyBPzQ9fNrqx6bCXHcQMC
 vf0buBcVxjwAxTDitMzCsMg=
X-Google-Smtp-Source: APXvYqyUA3VB4AikGiDvERGbmcpyNPGFTp3CDf7esgUHHCqDgfFJWKQoR5pt7bNHadzW826mkJWHyw==
X-Received: by 2002:a2e:b5ac:: with SMTP id f12mr16804800ljn.0.1576415594157; 
 Sun, 15 Dec 2019 05:13:14 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se.
 [85.230.184.20])
 by smtp.gmail.com with ESMTPSA id w71sm8283224lff.0.2019.12.15.05.13.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2019 05:13:13 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@kernel.org>)
 id 1igThu-0001yG-R4; Sun, 15 Dec 2019 14:13:10 +0100
Date: Sun, 15 Dec 2019 14:13:10 +0100
From: Johan Hovold <johan@kernel.org>
To: Navid Emamdoost <navid.emamdoost@gmail.com>
Message-ID: <20191215131310.GA10631@localhost>
References: <CAEkB2ES3baAR-E9rqkkO+cEPCjvTnS1miKD_h8V7MSJz5a5eBw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAEkB2ES3baAR-E9rqkkO+cEPCjvTnS1miKD_h8V7MSJz5a5eBw@mail.gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>
Subject: Re: [greybus-dev] Potential memory leak in greybus/svc.c
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

T24gU2F0LCBEZWMgMTQsIDIwMTkgYXQgMDU6NDQ6MDVQTSAtMDYwMCwgTmF2aWQgRW1hbWRvb3N0
IHdyb3RlOgo+IEhlbGxvLAo+IAo+IEl0IHNlZW1zIHRvIG1lIHRoZXJlIGlzIGEgbWVtb3J5IGxl
YWsgaW4gdGhlIGltcGxlbWVudGF0aW9uIG9mIGdiX3N2Y19jcmVhdGUoKS4KPiBJbiB0aGUgZXJy
b3IgaGFuZGxpbmcgcGF0aCAobGFiZWxlZCBhcyBlcnJfcHV0X2RldmljZSkgdGhlIGNvZGUKPiBj
b3JyZWN0bHkgcHV0cyBzdmMtPmRldiwgYnV0IEkgYW0gc3VzcGljaW91cyB0aGF0IHN2Yy0+d3Eg
aXMgbGVha2luZy4KPiBUaGUgYWxsb2NhdGVkIHN2Yy0+d3EgbmVlZHMgYSByZWxlYXNlIHZpYSBk
ZXN0cm95X3dvcmtxdWV1ZSgpIGluIHRoZQo+IGVycm9yIGhhbmRsaW5nIHBhdGguIEFtIEkgbWlz
c2luZyBzb21ldGhpbmc/CgpZb3UgYXJlLiBKdXN0IGdyZXAgZm9yIGRlc3Ryb3lfd29ya3F1ZXVl
KCkgaW4gdGhhdCBmaWxlIHRvIHNlZSB3aGVyZQpzdmMtPndjIGlzIGZyZWVkIChhbmQgdGhhdCBm
dW5jdGlvbiBpcyBjYWxsZWQgb24gZmluYWwgcHV0X2RldmljZSgpKS4KCkpvaGFuCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxp
bmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJv
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
