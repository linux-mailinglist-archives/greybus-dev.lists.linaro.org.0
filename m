Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B413154489
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Feb 2020 14:06:53 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 46EA7608FC
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Feb 2020 13:06:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 352386179C; Thu,  6 Feb 2020 13:06:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B6AD61789;
	Thu,  6 Feb 2020 13:06:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B6B43608FC
 for <greybus-dev@lists.linaro.org>; Thu,  6 Feb 2020 13:06:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A21976174C; Thu,  6 Feb 2020 13:06:39 +0000 (UTC)
Received: from mail-ua1-f65.google.com (mail-ua1-f65.google.com
 [209.85.222.65])
 by lists.linaro.org (Postfix) with ESMTPS id CC5B6608FC
 for <greybus-dev@lists.linaro.org>; Thu,  6 Feb 2020 13:06:38 +0000 (UTC)
Received: by mail-ua1-f65.google.com with SMTP id 1so2222387uao.1
 for <greybus-dev@lists.linaro.org>; Thu, 06 Feb 2020 05:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zxNga9z+bqzzVroxYEdiyYn2FBBMLZCuOvPY3yafzJU=;
 b=ULyXrBwfBKp5guSWvzfAnYWTk2gX1TxLIxIorQfgMvfcgn2DMHNNkLKvxWuPbnGZs/
 KQExkoPdmsIgnb1+SE/GiiU23I63L098lvaIQvQrdI3xaerz4/bAm2EkhU8DvoUvmij5
 Iy8Jv3+j6WST9BihkyRpbrSMBYpuS5ZZM8S9R4hkqxzeoOb5f3jYwQdSuSbDWnE2MjIK
 LPlJ1JGR/OXedwtlL40cXIcozwOjzQknayHyWzhWvMpqyomOk7zIjMklwdcdArLqoH+A
 nmzN6+DktvCWF9PhRX3tyzDVNQAQfXJnEhzjyy/Bqp+cvazFXSv6fQBcdwhpLypVVQ7d
 HdAA==
X-Gm-Message-State: APjAAAXnaFuTB5ekEXWcS9pp5YBg7plaKOp1QY/xm+3Stgz+LoiEE198
 awu2GCwlueHKzf9xL84Cy1M3kNdCMC+B4wBqxP8=
X-Google-Smtp-Source: APXvYqyiepijoYXT0w9jOthh76NhSwBKvoO3RDIjDnpJgrONVnEegbSic/ZQrxHIRDnlt2kTh5uRvNlVc09YuGaXBMg=
X-Received: by 2002:ab0:7025:: with SMTP id u5mr1585116ual.52.1580994398017;
 Thu, 06 Feb 2020 05:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20200205123217.jreendkyxulqsool@kili.mountain>
In-Reply-To: <20200205123217.jreendkyxulqsool@kili.mountain>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Thu, 6 Feb 2020 18:36:01 +0530
Message-ID: <CAAs364-wmtnpfF0eQERhP5pUgRV1SCucW+hLPQgu0GKnFx982g@mail.gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 Dinko Mironov <dmironov@mm-sol.com>, greybus-dev@lists.linaro.org,
 Greg Kroah-Hartman <gregkh@google.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: use after free in
	gb_audio_manager_remove_all()
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

T24gV2VkLCBGZWIgNSwgMjAyMCBhdCA2OjAyIFBNIERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50
ZXJAb3JhY2xlLmNvbT4gd3JvdGU6Cj4KPiBXaGVuIHdlIGNhbGwga29iamVjdF9wdXQoKSBhbmQg
aXQncyB0aGUgbGFzdCByZWZlcmVuY2UgdG8gdGhlIGtvYmplY3QKPiB0aGVuIGl0IGNhbGxzIGdi
X2F1ZGlvX21vZHVsZV9yZWxlYXNlKCkgYW5kIGZyZWVzIG1vZHVsZS4gIFdlIGRlcmVmZXJlbmNl
Cj4gIm1vZHVsZSIgb24gdGhlIG5leHQgbGluZSB3aGljaCBpcyBhIHVzZSBhZnRlciBmcmVlLgo+
Cj4gRml4ZXM6IGM3N2Y4NWJiYzkxYSAoImdyZXlidXM6IGF1ZGlvOiBGaXggaW5jb3JyZWN0IGNv
dW50aW5nIG9mICdpZGEnIikKPiBTaWduZWQtb2ZmLWJ5OiBEYW4gQ2FycGVudGVyIDxkYW4uY2Fy
cGVudGVyQG9yYWNsZS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlv
X21hbmFnZXIuYyB8IDIgKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRl
bGV0aW9uKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
bWFuYWdlci5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlci5jCj4gaW5k
ZXggOWIxOWVhOWQzZmExLi45YTNmN2MwMzRhYjQgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXVkaW9fbWFuYWdlci5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9fbWFuYWdlci5jCj4gQEAgLTkyLDggKzkyLDggQEAgdm9pZCBnYl9hdWRpb19tYW5h
Z2VyX3JlbW92ZV9hbGwodm9pZCkKPgo+ICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZl
KG1vZHVsZSwgbmV4dCwgJm1vZHVsZXNfbGlzdCwgbGlzdCkgewo+ICAgICAgICAgICAgICAgICBs
aXN0X2RlbCgmbW9kdWxlLT5saXN0KTsKPiAtICAgICAgICAgICAgICAga29iamVjdF9wdXQoJm1v
ZHVsZS0+a29iaik7Cj4gICAgICAgICAgICAgICAgIGlkYV9zaW1wbGVfcmVtb3ZlKCZtb2R1bGVf
aWQsIG1vZHVsZS0+aWQpOwo+ICsgICAgICAgICAgICAgICBrb2JqZWN0X3B1dCgmbW9kdWxlLT5r
b2JqKTsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgaXNfZW1wdHkgPSBsaXN0X2VtcHR5KCZtb2R1
bGVzX2xpc3QpOwo+IC0tCj4gMi4xMS4wCj4KVGhhbmtzIERhbiBmb3Igc2hhcmluZyB0aGUgZml4
LgoKUmV2aWV3ZWQtYnk6IFZhaWJoYXYgQWdhcndhbCA8dmFpYmhhdi5zckBnbWFpbC5jb20+Cl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2
IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMu
bGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
