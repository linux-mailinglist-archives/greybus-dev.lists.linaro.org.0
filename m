Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A2229792
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 13:38:55 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F05F16699B
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Jul 2020 11:38:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E52F06699C; Wed, 22 Jul 2020 11:38:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9DD426699A;
	Wed, 22 Jul 2020 11:38:33 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 4B80166997
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 11:38:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 307A766999; Wed, 22 Jul 2020 11:38:31 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by lists.linaro.org (Postfix) with ESMTPS id 1FC9566997
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 11:38:30 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id l17so2163290iok.7
 for <greybus-dev@lists.linaro.org>; Wed, 22 Jul 2020 04:38:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7BvqwU62lyk+QqW87ddDq6c2qHEGbPshqO9XqHiYg8k=;
 b=rMi1kDR40cqYpYgx36etDCRlvhz3ViwAN/QngQ8j7KADNmBbKySIjjhuTv6n4BPISu
 NNr5Ge7/9HmtHNZEwOT59zcnBVybDTsYHZtZ6pOr2n8goajd+88lFwS+lKTBUFFzbYts
 RVfKb6WOX5wIgfc21diganETq7gpoi/HKNviSjdNqQXAV3KIqKdtP1m3bFnwBT6hVtv2
 lJnrNkgRPdspeApT/hB5JAjUruVHSm8CWV4xpHT8z21lYNKJ1ZLA7QapF89rKpjzRo7J
 VtXqmg2bIAlPUcBle35KfmSwizYHoJFXG3E4NISPSGkMMUKBDyAlWyRH/ekyPwQb8GQA
 qlMg==
X-Gm-Message-State: AOAM53318oA0XMxMNd/o8zwmmOMdFP9pSl3/iLIP5dKDUZkXlZvAppUe
 J7McNqLsVWXiM4svLo8vlfGWNlpqhrZrsfmy
X-Google-Smtp-Source: ABdhPJxXUklEkfCgumsWHKy4BP6tAGCtjlORwVm02ewylmMdoLRU6ALm64bL1gSL53AZkgQCzeRwxg==
X-Received: by 2002:a05:6638:1442:: with SMTP id
 l2mr37731195jad.132.1595417909250; 
 Wed, 22 Jul 2020 04:38:29 -0700 (PDT)
Received: from [172.22.22.26] (c-73-185-129-58.hsd1.mn.comcast.net.
 [73.185.129.58])
 by smtp.googlemail.com with ESMTPSA id l13sm11920166iob.28.2020.07.22.04.38.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Jul 2020 04:38:28 -0700 (PDT)
To: Christopher Friedt <chrisfriedt@gmail.com>, greybus-dev@lists.linaro.org
References: <CAF4BF-SDCA3Q1n0h9y4cxjFHAHEO4q1E8xPeZP3XQR-7501mVA@mail.gmail.com>
From: Alex Elder <elder@linaro.org>
Message-ID: <797f68c2-4e40-81ab-3adb-27a37dd8d502@linaro.org>
Date: Wed, 22 Jul 2020 06:38:28 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAF4BF-SDCA3Q1n0h9y4cxjFHAHEO4q1E8xPeZP3XQR-7501mVA@mail.gmail.com>
Content-Language: en-US
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: Re: [greybus-dev] PR for examples manifests
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

T24gNy84LzIwIDEyOjA4IFBNLCBDaHJpc3RvcGhlciBGcmllZHQgd3JvdGU6Cj4gSGkgbGlzdCwK
CkNocmlzdG9waGVyLCBJJ20gc29ycnkgdGhpcyBoYXNuJ3QgcmVjZWl2ZWQgdGhlIGF0dGVudGlv
biBpdApkZXNlcnZlcy4gIFRvIGJlIGhvbmVzdCwgeW91cnMgaXMgdGhlIGZpcnN0L29ubHkgcHVs
bCByZXF1ZXN0IG9uCnRoaXMgcmVwb3NpdG9yeSBzaW5jZSBQcm9qZWN0IEFyYSBzaHV0IGRvd24s
IGFuZCB0aGUgc3RhdHVzIG9mCnRoZSAicHJvamVjdGFyYSIgR2l0SHViIGFjY291bnQgaXMgYSBs
aXR0bGUgZnV6enkuICBZb3VyIHJlcXVlc3QKaGFzIG5vdCBiZWVuIGZvcmdvdHRlbiwgd2UncmUg
anVzdCB3b3JraW5nIG91dCBob3cgd2UnbGwgaGFuZGxlIGl0LgpXZSBtaWdodCBuZWVkIHRvIHJl
LWhvc3QgdGhlIG9mZmljaWFsIHVwc3RyZWFtIG9mICJtYW5pZmVzdG8iCnNvbWV3aGVyZSBlbHNl
LgoKSW4gYW55IGNhc2UsIHRoaXMgd2lsbCBiZSByZXZpZXdlZCBhbmQgYWRkcmVzc2VkICJzb29u
LCIgYW5kIEknbQpzb3JyeSBmb3IgdGhlIGRlbGF5LiAgSWYgd2UgY2hhbmdlIGFueXRoaW5nLCB3
ZSdsbCBhbm5vdW5jZSBpdApvbiB0aGUgbWFpbGluZyBsaXN0LCBhbmQgSSBzdXBwb3NlIEknbGwg
ZXhwbGFpbiB0aGUgcmVzb2x1dGlvbgpoZXJlIGVpdGhlciB3YXkuCgoJCQkJCS1BbGV4Cgo+IEkg
bWFkZSBhIFBSIHRvIEdpdEh1YiBiZWZvcmUgcmVhbGl6aW5nIHRoYXQgaXQncyBwcm9iYWJseSBw
cmVmZXJyZWQgdG8gc2VuZCBhIHBhdGNoIHRvIHRoZSBNTC4KPiAKPiBodHRwczovL2dpdGh1Yi5j
b20vcHJvamVjdGFyYS9tYW5pZmVzdG8vcHVsbC8xCj4gCj4gUGF0Y2ggaXMgYXR0YWNoZWQgYXMg
d2VsbC4KPiAKPiBJcyBhbnlvbmUgYWJsZSB0b8KgIG1lcmdlIHRoZSBQUiBvciBwYXRjaD8KPiAK
PiBUaGFua3MsCj4gCj4gQwo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4gZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cj4gZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwo+IGh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJv
Lm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRl
dgo=
