Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 837CCA9BAB
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 09:22:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A8F2661877
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 07:22:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9B5B06187F; Thu,  5 Sep 2019 07:22:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3689161875;
	Thu,  5 Sep 2019 07:22:19 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D20B761738
 for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2019 07:22:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C2C9461724; Thu,  5 Sep 2019 07:22:16 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by lists.linaro.org (Postfix) with ESMTPS id BEA3261724
 for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2019 07:22:15 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id x80so1100197lff.3
 for <greybus-dev@lists.linaro.org>; Thu, 05 Sep 2019 00:22:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JR81XguHf8NA2x2LS/6JeusAt8AO3fo+lEK825RiQgY=;
 b=tTQVo2rvUMWIA4cHvu4lJAisxIGt2OHAWtkPwSWQ+cfYlWm5XfplCq0IpSsoFScS2B
 KfbBPHQ4Vk/u9EhPC+iw7nCYr8Ao0NEJXAmtzJbqKcehRCWq86Ur4IUCGy5Su8ly2AD0
 sGtRFawvsvglJWSxT8MTWVlNqrzlOdBHBwcyRL3Y19CqcHgre9RnXoTPLKnzOtHoLxJb
 PbLdD88KrfK8sRoS2oWQCotogAZgy4ApYS6xU8pxldpJPLrtR/Mtd8aSeuM3Cr7xwhxj
 kjtpiamZkHkv9qWy33V2sGn7J3bKTnVTq6vt++QBZ7d/iYyFQVontXckjIxgxVr8Kb7Z
 6mQg==
X-Gm-Message-State: APjAAAWyoGu0Mtgwpj3VhanJlC7E6s03Zo+8hjOIddIwoTC37nG1tE1m
 VP+ScQaloGP+RVVNLTtzr8A=
X-Google-Smtp-Source: APXvYqxIZVBiVFBRq6W7rWWvNIi8E2DVFJEM7Yp7Sa+BMdKA5rA5QwsF3dvCQYTsOCRV/mfCpqQwgg==
X-Received: by 2002:ac2:4352:: with SMTP id o18mr1354078lfl.164.1567668134676; 
 Thu, 05 Sep 2019 00:22:14 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id f22sm266655lfa.41.2019.09.05.00.22.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 00:22:14 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
 (envelope-from <johan@kernel.org>)
 id 1i5m5o-0007l4-Ng; Thu, 05 Sep 2019 09:22:08 +0200
Date: Thu, 5 Sep 2019 09:22:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Julio Faracco <jcfaracco@gmail.com>
Message-ID: <20190905072208.GD1701@localhost>
References: <20190904203209.8669-1-jcfaracco@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904203209.8669-1-jcfaracco@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 lkcamp@lists.libreplanetbr.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Adding missing brackets
 into if..else block.
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

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDg6MzI6MDlQTSArMDAwMCwgSnVsaW8gRmFyYWNjbyB3
cm90ZToKPiBJbnNpZGUgYSBibG9jayBvZiBpZi4uZWxzZSBjb25kaXRpb25hbCwgZWxzZSBzdHJ1
Y3R1cmUgZG9lcyBub3QgY29udGFpbgo+IGJyYWNrZXRzLiBUaGlzIGlzIG5vdCBmb2xsb3dpbmcg
cmVndWxhciBwb2xpY2llcyBvZiBnb29kIGNvZGluZyBzdHlsZS4KCnMvZ29vZC9rZXJuZWwvID8K
Cj4gQWxsIHBhcnRzIG9mIHRoaXMgY29uZGl0aW9uYWwgYmxvY2tzIHNob3VsZCByZXNwZWN0IGJy
YWNrZXRzIGluY2x1c2lvbi4KCkRpZCB5b3UgY2hlY2sgdGhhdCB0aGVyZSBhcmVuJ3QgZnVydGhl
ciBpbnN0YW5jZXMgb2YgdGhpcyBzdHlsZQppc3N1ZSBpbiB0aGlzIGZpbGU/IElmIHNvLCBwbGVh
c2UgdGhlbSBhbGwgaW4gb25lIGdvLgoKQWxzbyBwbGVhc2UgaW5jbHVkZSBncmV5YnVzIGNvbXBv
bmVudCB5b3UgYXJlIGNoYW5naW5nIGluIHlvdXIgc3ViamVjdApwcmVmaXg6CgoJc3RhZ2luZzog
Z3JleWJ1czogbG9vcGJhY2tfdGVzdDogLi4uCgo+IFNpZ25lZC1vZmYtYnk6IEp1bGlvIEZhcmFj
Y28gPGpjZmFyYWNjb0BnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyB8IDMgKystCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
dG9vbHMvbG9vcGJhY2tfdGVzdC5jCj4gaW5kZXggYmE2ZjkwNWYyLi5kNDY3MjE1MDIgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCj4g
KysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCj4gQEAg
LTgwMSw4ICs4MDEsOSBAQCBzdGF0aWMgdm9pZCBwcmVwYXJlX2RldmljZXMoc3RydWN0IGxvb3Bi
YWNrX3Rlc3QgKnQpCj4gIAkJCXdyaXRlX3N5c2ZzX3ZhbCh0LT5kZXZpY2VzW2ldLnN5c2ZzX2Vu
dHJ5LAo+ICAJCQkJCSJvdXRzdGFuZGluZ19vcGVyYXRpb25zX21heCIsCj4gIAkJCQkJdC0+YXN5
bmNfb3V0c3RhbmRpbmdfb3BlcmF0aW9ucyk7Cj4gLQkJfSBlbHNlCj4gKwkJfSBlbHNlIHsKPiAg
CQkJd3JpdGVfc3lzZnNfdmFsKHQtPmRldmljZXNbaV0uc3lzZnNfZW50cnksICJhc3luYyIsIDAp
Owo+ICsJCX0KPiAgCX0KPiAgfQoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8v
Z3JleWJ1cy1kZXYK
