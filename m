Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B36C8F49D
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 21:30:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C85A615DE
	for <lists+greybus-dev@lfdr.de>; Thu, 15 Aug 2019 19:30:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 626FE61758; Thu, 15 Aug 2019 19:30:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1A73161719;
	Thu, 15 Aug 2019 19:30:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AD0D0609A2
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 19:29:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 93F6B615DE; Thu, 15 Aug 2019 19:29:58 +0000 (UTC)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com
 [209.85.166.48])
 by lists.linaro.org (Postfix) with ESMTPS id 7EA44609A2
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 19:29:56 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id t6so1460536ios.7
 for <greybus-dev@lists.linaro.org>; Thu, 15 Aug 2019 12:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=HcyAiyhex4b5EN17PgmDLZQOJlfbCWe/mTG3wL9oP/Y=;
 b=pOmD75mFF1lmM04gQduNAQLOHu79zzIZZ3JzvpQopxuzMmo0RdlhpcXjf3/i3KwlPu
 W1c1sMUBNqMj1XxiwNQMuGFPAdg2Ya9OrI/jARli2yXy1yWIdCGHeYu5Xcbpr1TEMHqW
 OoisxpbRM8QQ+hG1TP9P8JEjZ3ZPqXQX9FsGZT4HrYV9iW8DoPywAA1OReAjdCZ4+nTg
 k2COjj+H2FoMnSkxN9w1nDEO+l2Pwji4cr9tgra4gOoL3XdHJLhyIw4tCXkgQP9kehI8
 syPl75RLlAbMoInBttlbNKvyneTM1Ze6XorCLDA/+VAH36IlnJAn/SgIPaarZf26FLca
 MRrg==
X-Gm-Message-State: APjAAAXnsX1GS3bayKDnn5HrzWTHYU6OcgE0QeRazKt/efw+6XM8intW
 GlO4SXxZIGcX9hjn7xwmD2oqwr982JkJVXxGrMhF4/hECeA=
X-Google-Smtp-Source: APXvYqxRV96ecBA6gIphwP2PxOxsxdGEQZAVxPljvGORGDkCEi6K68+dS2SyPat/OftvmuVI14Y14W1C92MMgp4am2A=
X-Received: by 2002:a5d:994b:: with SMTP id v11mr6672486ios.165.1565897395774; 
 Thu, 15 Aug 2019 12:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAF4BF-R5yjta8zTcsFc8auYQ8cAHDqN0yM5rYwG6JctCbkOm1g@mail.gmail.com>
In-Reply-To: <CAF4BF-R5yjta8zTcsFc8auYQ8cAHDqN0yM5rYwG6JctCbkOm1g@mail.gmail.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Thu, 15 Aug 2019 15:29:44 -0400
Message-ID: <CAF4BF-RnrVRHG=g=vhbMp=_K4DLL2+-qFyqDjwM+Hh4YBTF7WQ@mail.gmail.com>
To: greybus-dev@lists.linaro.org
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] binding gb gpio device to gb-phy driver?
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6NDkgUE0gQ2hyaXN0b3BoZXIgRnJpZWR0CjxjaHJp
c2ZyaWVkdEBnbWFpbC5jb20+IHdyb3RlOgo+IEknbSBjdXJyZW50bHkgdXNpbmcgZ2JyaWRnZSAv
IHRjcGlwIHdpdGggdGhlCj4gSUlEMS1zaW1wbGUtZ3Bpby1tb2R1bGUubW5mcyBleGFtcGxlIHRv
IGhvb2sgdXAgYSBmYWtlIG1vZHVsZSB0aGF0CgpJIHNlZSB3aGF0IHRoZSBwcm9ibGVtIGlzIC0g
aW4KbWFuaWZlc3QvZXhhbXBsZXMvSUlEMS1zaW1wbGUtZ3Bpby1tb2R1bGUubW5mcywgdGhlIGJ1
bmRsZSBjbGFzcwpzaG91bGQgaGF2ZSBiZWVuIDB4MGEgKGJyaWRnZWQgcGh5KSBub3QgMHgwMiAo
cmVzZXJ2ZWQpLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
