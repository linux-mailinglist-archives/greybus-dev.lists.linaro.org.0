Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC45241E94
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Aug 2020 18:46:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C188766609
	for <lists+greybus-dev@lfdr.de>; Tue, 11 Aug 2020 16:46:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A87B866628; Tue, 11 Aug 2020 16:46:34 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B06EC6660D;
	Tue, 11 Aug 2020 16:46:24 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D753A605D8
 for <greybus-dev@lists.linaro.org>; Tue, 11 Aug 2020 16:46:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CB87266609; Tue, 11 Aug 2020 16:46:21 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id E0366605D8
 for <greybus-dev@lists.linaro.org>; Tue, 11 Aug 2020 16:46:20 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id i92so1743921pje.0
 for <greybus-dev@lists.linaro.org>; Tue, 11 Aug 2020 09:46:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SoICVdOMd4Tqpxtq18KsD1itKSO8FUEzkBoLmDLhcow=;
 b=MibgSLUykJ3NulCmbqjqSdwQsEv0x8NkkJZG2XLvQ6lqDj2kPSuIRO92/tGkFEatkC
 ETkQe6WezlVHius1a8fB2XjIutoVdjRZqdzOBp6a76ilEjq4mAq/JfW2YocW78LSyReg
 nrxO8YzkIolskcqyIl/2pu3uyykBWfRl109FmvmkCrm1g3RZnIUyBLJkc0AHNSC9at0k
 PWmd9NcC9hUmB6E24AtD1zmNyKXVH9iyF9TaqtRH4JAQh4XxReHDdR1fA5doEKtsPYpz
 HD3EFPsD5reee1428K7P/Mj3/QLW+5Quy9R++dXM39C/G+CjT1CeXNHjb+k0FLFstFXs
 V4Vw==
X-Gm-Message-State: AOAM532t+SLRVGaj8a7/BTaYQ25ZWRYUhiKoSWCr+lJURmnn9B+DXYxl
 FLi01sqzqCj5DoJCdU6XyexUCV4dCGm+wcU+hf8=
X-Google-Smtp-Source: ABdhPJyEIOzjg18QmQ+dOADWbUqwbtJr18f5lR5OziHFc0pyu8YJaX9K7YoLYsGzJYyelYQz3gnZJ7hJy2SKUsGpMbg=
X-Received: by 2002:a17:90a:4f45:: with SMTP id
 w5mr1974736pjl.11.1597164379902; 
 Tue, 11 Aug 2020 09:46:19 -0700 (PDT)
MIME-Version: 1.0
References: <a5d4bb540e606d7980d4127a82e6af9b436e0642.1596730667.git.vaibhav.sr@gmail.com>
 <20200810150356.GL1793@kadam>
In-Reply-To: <20200810150356.GL1793@kadam>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Tue, 11 Aug 2020 22:15:42 +0530
Message-ID: <CAAs3649URK20TyU=EpfoY9ow-fK6jSjP1214KTPnUUU_t2d-7g@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org,
 Colin Ian King <colin.king@canonical.com>, linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v1] staging: greybus: audio: fix
	uninitialized value issue
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

T24gTW9uLCBBdWcgMTAsIDIwMjAgYXQgODozNCBQTSBEYW4gQ2FycGVudGVyIDxkYW4uY2FycGVu
dGVyQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBBdWcgMDYsIDIwMjAgYXQgMDk6NTE6
NTdQTSArMDUzMCwgVmFpYmhhdiBBZ2Fyd2FsIHdyb3RlOgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hdWRpb190b3BvbG9neS5jCj4gPiBpbmRleCAyZjlmZGJkY2Q1NDcuLjRiOTE0ZDBlZGVm
MiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5
LmMKPiA+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmMKPiA+
IEBAIC00NTYsNiArNDU2LDEzIEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9kYXBtX2N0bF9w
dXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4gPiAgICAgICB2YWwgPSB1Y29udHJv
bC0+dmFsdWUuaW50ZWdlci52YWx1ZVswXSAmIG1hc2s7Cj4gPiAgICAgICBjb25uZWN0ID0gISF2
YWw7Cj4gPgo+ID4gKyAgICAgcmV0ID0gZ2JfcG1fcnVudGltZV9nZXRfc3luYyhidW5kbGUpOwo+
ID4gKyAgICAgaWYgKHJldCkKPiA+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICsKPiA+
ICsgICAgIHJldCA9IGdiX2F1ZGlvX2diX2dldF9jb250cm9sKG1vZHVsZS0+bWdtdF9jb25uZWN0
aW9uLCBkYXRhLT5jdGxfaWQsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBHQl9BVURJT19JTlZBTElEX0lOREVYLCAmZ2J2YWx1ZSk7Cj4KPgo+IFdlIG5lZWQgdG8gY2hl
Y2sgInJldCIgYWZ0ZXIgdGhpcy4KCk9vcHMsIG15IGJhZC4gVGhhbmtzIERhbiBmb3IgcmVwb3J0
aW5nIHRoaXMuIEknbGwgc2hhcmUgYW4gdXBkYXRlZCBwYXRjaCBzb29uLgoKLS0KcmVnYXJkcywK
dmFpYmhhdgo+Cj4gPiArCj4gPiAgICAgICAvKiB1cGRhdGUgdWNvbnRyb2wgKi8KPiA+ICAgICAg
IGlmIChnYnZhbHVlLnZhbHVlLmludGVnZXJfdmFsdWVbMF0gIT0gdmFsKSB7Cj4gPiAgICAgICAg
ICAgICAgIGZvciAod2kgPSAwOyB3aSA8IHdsaXN0LT5udW1fd2lkZ2V0czsgd2krKykgewo+ID4g
QEAgLTQ2NiwxNiArNDczLDEwIEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19taXhlcl9kYXBtX2N0bF9w
dXQoc3RydWN0IHNuZF9rY29udHJvbCAqa2NvbnRyb2wsCj4KPiByZWdhcmRzLAo+IGRhbiBjYXJw
ZW50ZXIKPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
