Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F2572A1DF1
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Aug 2019 16:53:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 198DC617F2
	for <lists+greybus-dev@lfdr.de>; Thu, 29 Aug 2019 14:53:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0C5C661831; Thu, 29 Aug 2019 14:53:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 694D361833;
	Thu, 29 Aug 2019 14:53:30 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7C3E161738
 for <greybus-dev@lists.linaro.org>; Thu, 29 Aug 2019 14:53:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 69D3D61813; Thu, 29 Aug 2019 14:53:28 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by lists.linaro.org (Postfix) with ESMTPS id 29C40617F2
 for <greybus-dev@lists.linaro.org>; Thu, 29 Aug 2019 14:53:27 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id p13so4211301wmh.1
 for <greybus-dev@lists.linaro.org>; Thu, 29 Aug 2019 07:53:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version;
 bh=rDl3XjmzWq1Bt/Mn9v6gfnxlgojJ+gdaOYg/Ia4k7aQ=;
 b=MPFWLs4CnC9yFGggWYPxxupQBW7TbxFzwCHcr77eBqGwzlu0b7+uXeM5nAGB73z+07
 9oJ+gdQqbD/lEGlKpbyYgUfdeDM2U8GpbT07S7jZ4ySYaq99yjxOWk/VE5Od/hdUXGuo
 OboaG5q8Uoksh5C3VEWa80l6Of1jUhI+osHCGCAjBLA4N/ICCEkMf3vZ6nC/YlI58jRm
 plKKiZ17GcsSSimocBs7ESpxFpgARU6LMHALoGFwrm/QRkGlOmis51UX0+VxTB6SJyoT
 1lgIAJxaPEMtsZ+y/IRxV9QK0ep0L8NM0427DYfbsAtHEJzAE/4qDAens/ywTNyQ7aNS
 sz5Q==
X-Gm-Message-State: APjAAAXZrt7iTxWoHa7nST5NDxRqk2bPpxBjSUAgcLW7L9D2yWpHDNhA
 09B0q2dqFroRE+jBf0o+eEY=
X-Google-Smtp-Source: APXvYqyuColfybcl19EFArHYWnVMSMThE1XsoWoel4pqWY5H4K++iOkEOzm36CFw4522OL1h4Z3+jw==
X-Received: by 2002:a1c:4e19:: with SMTP id g25mr6193427wmh.30.1567090405896; 
 Thu, 29 Aug 2019 07:53:25 -0700 (PDT)
Received: from arch-late ([87.196.81.67])
 by smtp.gmail.com with ESMTPSA id e14sm1958252wma.37.2019.08.29.07.53.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Aug 2019 07:53:24 -0700 (PDT)
References: <20190829122839.GA20116@mwanda>
User-agent: mu4e 1.2.0; emacs 27.0.50
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
In-reply-to: <20190829122839.GA20116@mwanda>
Date: Thu, 29 Aug 2019 15:53:20 +0100
Message-ID: <m35zmgvx9b.fsf@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kernel-janitors@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: light: fix a couple
	double frees
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

SGkgRGFuLApPbiBUaHUgMjkgQXVnIDIwMTkgYXQgMTM6MjgsIERhbiBDYXJwZW50ZXIgd3JvdGU6
Cj4gVGhlIHByb2JsZW0gaXMgaW4gZ2JfbGlnaHRzX3JlcXVlc3RfaGFuZGxlcigpLiAgSWYgd2Ug
Z2V0IGEgcmVxdWVzdCB0bwo+IGNoYW5nZSB0aGUgY29uZmlnIHRoZW4gd2UgcmVsZWFzZSB0aGUg
bGlnaHQgd2l0aCBnYl9saWdodHNfbGlnaHRfcmVsZWFzZSgpCj4gYW5kIHJlLWFsbG9jYXRlZCBp
dC4gIEhvd2V2ZXIsIGlmIHRoZSBhbGxvY2F0aW9uIGZhaWxzIHBhcnQgd2F5IHRocm91Z2gKPiB0
aGVuIHdlIGNhbGwgZ2JfbGlnaHRzX2xpZ2h0X3JlbGVhc2UoKSBhZ2Fpbi4gIFRoaXMgY2FuIGxl
YWQgdG8gYSBjb3VwbGUKPiBkaWZmZXJlbnQgZG91YmxlIGZyZWVzIHdoZXJlIHdlIGhhdmVuJ3Qg
Y2xlYXJlZCBvdXQgdGhlIG9yaWdpbmFsIHZhbHVlczoKPgo+IAlnYl9saWdodHNfbGlnaHRfdjRs
Ml91bnJlZ2lzdGVyKGxpZ2h0KTsKPiAJLi4uCj4gCWtmcmVlKGxpZ2h0LT5jaGFubmVscyk7Cj4g
CWtmcmVlKGxpZ2h0LT5uYW1lKTsKPgo+IEkgYWxzbyBtYWRlIGEgc21hbGwgY2hhbmdlIHRvIGhv
dyB3ZSBzZXQgImxpZ2h0LT5jaGFubmVsc19jb3VudCA9IDA7Ii4KPiBUaGUgb3JpZ2luYWwgY29k
ZSBoYW5kbGVkIHRoaXMgcGFydCBmaW5lIGFuZCBkaWQgbm90IGNhdXNlIGEgdXNlIGFmdGVyCj4g
ZnJlZSBidXQgaXQgd2FzIHNvcnQgb2YgY29tcGxpY2F0ZWQgdG8gcmVhZC4KPgo+IEZpeGVzOiAy
ODcwYjUyYmFlNGMgKCJncmV5YnVzOiBsaWdodHM6IGFkZCBsaWdodHMgaW1wbGVtZW50YXRpb24i
KQo+IFNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRhbi5jYXJwZW50ZXJAb3JhY2xlLmNv
bT4KPgoKVGhhbmtzIHNvIG11Y2ggZm9yIHRoaXMsIEkgd2FzIGxvb2tpbmcgZm9yIHNvbWUgdGlt
ZSBhdCB0aGlzIGFuZAp3YXMgaGFsZiB3YXkgdG8gYSBtdWNoIGxlc3MgZWxlZ2FudCBmaXggdGhl
biB5b3Vycy4KCkFja2VkLWJ5OiBSdWkgTWlndWVsIFNpbHZhIDxybWZyZnNAZ21haWwuY29tPgoK
Q2hlZXJzLAogICAgUnVpCgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5j
IHwgMTIgKysrKysrLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYg
ZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGln
aHQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMKPiBpbmRleCAwMTBhZTFlOWM3
ZmIuLjQwNjgwZWFmMzk3NCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9s
aWdodC5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwo+IEBAIC0xMDk4
LDIxICsxMDk4LDIxIEBAIHN0YXRpYyB2b2lkIGdiX2xpZ2h0c19jaGFubmVsX3JlbGVhc2Uoc3Ry
dWN0IGdiX2NoYW5uZWwgKmNoYW5uZWwpCj4gIHN0YXRpYyB2b2lkIGdiX2xpZ2h0c19saWdodF9y
ZWxlYXNlKHN0cnVjdCBnYl9saWdodCAqbGlnaHQpCj4gIHsKPiAgCWludCBpOwo+IC0JaW50IGNv
dW50Owo+Cj4gIAlsaWdodC0+cmVhZHkgPSBmYWxzZTsKPgo+IC0JY291bnQgPSBsaWdodC0+Y2hh
bm5lbHNfY291bnQ7Cj4gLQo+ICAJaWYgKGxpZ2h0LT5oYXNfZmxhc2gpCj4gIAkJZ2JfbGlnaHRz
X2xpZ2h0X3Y0bDJfdW5yZWdpc3RlcihsaWdodCk7Cj4gKwlsaWdodC0+aGFzX2ZsYXNoID0gZmFs
c2U7Cj4KPiAtCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7Cj4gKwlmb3IgKGkgPSAwOyBp
IDwgbGlnaHQtPmNoYW5uZWxzX2NvdW50OyBpKyspCj4gIAkJZ2JfbGlnaHRzX2NoYW5uZWxfcmVs
ZWFzZSgmbGlnaHQtPmNoYW5uZWxzW2ldKTsKPiAtCQlsaWdodC0+Y2hhbm5lbHNfY291bnQtLTsK
PiAtCX0KPiArCWxpZ2h0LT5jaGFubmVsc19jb3VudCA9IDA7Cj4gKwo+ICAJa2ZyZWUobGlnaHQt
PmNoYW5uZWxzKTsKPiArCWxpZ2h0LT5jaGFubmVscyA9IE5VTEw7Cj4gIAlrZnJlZShsaWdodC0+
bmFtZSk7Cj4gKwlsaWdodC0+bmFtZSA9IE5VTEw7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBnYl9s
aWdodHNfcmVsZWFzZShzdHJ1Y3QgZ2JfbGlnaHRzICpnbGlnaHRzKQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
