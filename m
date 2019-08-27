Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F94F9F1E5
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 19:52:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DCC2560785
	for <lists+greybus-dev@lfdr.de>; Tue, 27 Aug 2019 17:52:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id CDD8B61731; Tue, 27 Aug 2019 17:52:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0B43D617F2;
	Tue, 27 Aug 2019 17:51:55 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3DBB360785
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 17:51:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2C8B861731; Tue, 27 Aug 2019 17:51:53 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by lists.linaro.org (Postfix) with ESMTPS id 4797060785
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 17:51:52 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id c3so19681221wrd.7
 for <greybus-dev@lists.linaro.org>; Tue, 27 Aug 2019 10:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=PSPns5WfCYFgrREtP7j0ef3CbxP+J42N6/4rZx+AOlA=;
 b=VUXhOnDRQwMWL7wbTe/XfLDhrytl0OuFcX3DUMWp+nvDHQYK0er9jcmEtgYrE5dw77
 XXLtk9c/5CtjBpr8YhKfDP6vpWrHt05Mki8WTeSC0+j05OQNmqyioK7iIAXHe+HI/Coa
 R7jvRwyqsL11UBSH7ADKHZCaGVC9L081+T2SIpYUKhlb1ZCTk6y42xQ42GHHRz7z37J8
 gTvR7GX2t+OunJCYLMaKlZx/7J4hVY8Tz06axKE6Dx8ZFJpjMB0/pnZe0yEIKol0G8do
 APmAIEe+89Na8TRHn1ALx2AY6on1M5MiOBldRFYfv0ZU0e+1pU7NktE9IKSm0nLjAlaY
 M0/g==
X-Gm-Message-State: APjAAAUnCykzwSs4QNrfFo6RZGcTDV/9bwBJ7Nex1abZVYGaYL8DRjxP
 jImauagkmkMj/nkE7ShHtlc=
X-Google-Smtp-Source: APXvYqwLmXHdAI5yY/HsZBGbUjy8vQvXD5Ap3DN1vHmVCPd6SuXA4lLDcg87p+Yj7KPIb3ROjfp22w==
X-Received: by 2002:a5d:698f:: with SMTP id g15mr32511329wru.310.1566928311271; 
 Tue, 27 Aug 2019 10:51:51 -0700 (PDT)
Received: from arch-late (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id o8sm215933wma.1.2019.08.27.10.51.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Aug 2019 10:51:50 -0700 (PDT)
References: <20190827155302.25704-1-rui.silva@linaro.org>
 <c73e68a7-2a70-724c-0b70-f922682828c3@ieee.org>
User-agent: mu4e 1.2.0; emacs 27.0.50
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Alex Elder <elder@ieee.org>
In-reply-to: <c73e68a7-2a70-724c-0b70-f922682828c3@ieee.org>
Date: Tue, 27 Aug 2019 18:51:45 +0100
Message-ID: <m31rx67az2.fsf@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: add missing includes
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

SGkgQWxleCwKT24gVHVlIDI3IEF1ZyAyMDE5IGF0IDE4OjIyLCBBbGV4IEVsZGVyIHdyb3RlOgo+
IE9uIDgvMjcvMTkgMTA6NTMgQU0sIFJ1aSBNaWd1ZWwgU2lsdmEgd3JvdGU6Cj4+IEJlZm9yZSBt
b3ZpbmcgZ3JleWJ1cyBjb3JlIG91dCBvZiBzdGFnaW5nIGFuZCBtb3ZpbmcgaGVhZGVyIGZpbGVz
IHRvCj4+IGluY2x1ZGUvbGludXggc29tZSBncmV5YnVzIGhlYWRlciBmaWxlcyB3ZXJlIG1pc3Np
bmcgdGhlIG5lY2Vzc2FyeQo+PiBpbmNsdWRlcy4gVGhpcyB3b3VsZCB0cmlnZ2VyIGNvbXBpbGF0
aW9uIGZhaWxsdXJlcyB3aXRoIHNvbWUgZXhhbXBsZQo+PiBlcnJvcnMgbG9nZ2VkIGJlbGxvdyBm
b3Igd2l0aCBDT05GSUdfS0VSTkVMX0hFQURFUl9URVNUPXkuCj4+Cj4+IFNvLCBhZGQgdGhlIG5l
Y2Vzc2FyeSBoZWFkZXJzIHRvIGNvbXBpbGUgY2xlYW4gYmVmb3JlIHJlbG9jYXRpbmcgdGhlCj4+
IGhlYWRlciBmaWxlcy4KPgo+IFRoaXMgbG9va3MgZ29vZCB0byBtZTsgSSB0cnVzdCB5b3UgY29t
cGlsZWQgaXQuCj4KClllYWgsIGluIHRoZSBzdGFnaW5nIGFuZCBpbiB0aGUgbmV3IGxvY2F0aW9u
IHRvIG1ha2Ugc3VyZSBpdAptYWtlIHRoZSBjb21waWxhdGlvbiBpc3N1ZXMgZ28gYXdheS4KCj4g
VGhlcmUgaXMgb25lIGV4dHJhCj4gYmxhbmsgbGluZSB5b3UgYWRkZWQgaW4gIm9wZXJhdGlvbi5o
IiBidXQgdGhhdCdzIG5vdCBpbXBvcnRhbnQuCj4KClJpZ2h0LCBJIG1pc3NlZCB0aGF0LgoKPgo+
IEkgZG9uJ3QgdGhpbmsgd2hhdCBJJ3ZlIGRvbmUgaGVyZSBzZXJ2ZXMgYXMgYSByZWFsIHJldmll
dywgc286Cj4KPiBBY2tlZC1ieTogQWxleCBFbGRlciA8ZWxkZXJAa2VybmVsLm9yZz4KPgoKSSB0
aGluayBHcmVnIGFscmVhZHkgcXVldWVkIHVwIHRoaXMgb25lIGluIHN0YWdpbmctbmV4dCwKbmV2
ZXJ0aGVsZXNzIG1hbnkgdGhhbmtzIGZvciB0aGUgYWNrZWQuCgotLS0KQ2hlZXJzLAoJUnVpCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
