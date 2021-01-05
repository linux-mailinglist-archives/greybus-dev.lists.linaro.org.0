Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A07D2EB35F
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 20:16:31 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2830560F2C
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 19:16:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1BBEB66727; Tue,  5 Jan 2021 19:16:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08EAF6672A;
	Tue,  5 Jan 2021 19:16:11 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 86F6060F2C
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 19:16:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7618166729; Tue,  5 Jan 2021 19:16:08 +0000 (UTC)
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com
 [209.85.210.54])
 by lists.linaro.org (Postfix) with ESMTPS id 3E5AB60F2C
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 19:16:07 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id j20so753080otq.5
 for <greybus-dev@lists.linaro.org>; Tue, 05 Jan 2021 11:16:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HE/haP1fX1NlGYUcWeXk4U0VjTMBn1U7oI/adP+D490=;
 b=BqeaNdZg1H9AnnVRmyeYJMaQHhoNQu0qGUiGdUl2/m0A+IIRYw6pHUbSX68JpvoYIx
 pnS+zgfeshOYkG+DihrbfDNR/qNeeK0XuHh9MMl6nBHGa2YJCJPb3OFVIAKMB/ZXGH75
 Pv7uu09CvEy+XJwlCB4J4PbVsYoAPnEqkctaTZ8fj7N38h/YwFWCWsBj5rUixSumsx41
 iu0hLKFOpEXQrSHziVs7cU3JsNgLu3rh2umu8qIEFGFc4ac/w2pZMVKOfpEoLVo1bIop
 Uer16CV5CX6VQ2Vlz6T52eHxp9Gh4BcVzYumwYW+ZAAIKBXXNxfjxzNhiG3cBD10TybE
 Fe/A==
X-Gm-Message-State: AOAM531oAWr3WX/F4FDc+cyd2m18+sNqYW0X+sJexjiqO7K4BMOUAJ+5
 FJKT2m9jHco14sBNP5XbI1XCAtc9rjJXHN00jwQZcsoJXF0=
X-Google-Smtp-Source: ABdhPJzFhOnRHddg8NpPJLAuJvjTLy9adRKlvRDVBVUaXu1TQ1rk5xi14QUbwdskc692DfoDCnCFtUp9jzZOWJ1tGAE=
X-Received: by 2002:a9d:4e87:: with SMTP id v7mr727039otk.302.1609874166453;
 Tue, 05 Jan 2021 11:16:06 -0800 (PST)
MIME-Version: 1.0
References: <CAF4BF-R1gKuRZ3g3DSHROSxbmBT2gFJxSsZkzjNgBcw1mjuv5Q@mail.gmail.com>
 <135673dd-2732-e453-5833-796af3ea867b@linaro.org>
 <CAF4BF-QQFKTdQtgBXNPeSG+QwFJ7fetZPfkvuMn7Ajy51JUGvA@mail.gmail.com>
 <X/SuffmTcTuXj0dp@kroah.com>
In-Reply-To: <X/SuffmTcTuXj0dp@kroah.com>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Tue, 5 Jan 2021 14:15:55 -0500
Message-ID: <CAF4BF-TMkQAhcgPqDq_Pf7ncOAMcSjBOUV838NOZivEe2VxN1Q@mail.gmail.com>
To: Greg KH <greg@kroah.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, johan@kernel.org,
 Alex Elder <elder@linaro.org>
Subject: Re: [greybus-dev] Authentication and Ecryption
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

T24gVHVlLCBKYW4gNSwgMjAyMSBhdCAxOjIxIFBNIEdyZWcgS0ggPGdyZWdAa3JvYWguY29tPiB3
cm90ZToKPgo+IE9uIFR1ZSwgSmFuIDA1LCAyMDIxIGF0IDEyOjM3OjM4UE0gLTA1MDAsIENocmlz
dG9waGVyIEZyaWVkdCB3cm90ZToKPiA+IEhpIEFsZXggJiBhbGwuCj4gPiBUaGUgZmFjdCB0aGF0
IGdicmlkZ2UgdXNlcyBhIHNlcGFyYXRlIHNvY2tldCBwZXIgQ1BvcnQgKGFsdGhvdWdoIGtpbmQK
PiA+IG9mIG5pY2UgY29uY2VwdHVhbGx5KSBkb2VzIGhhdmUgYSBub24tbmVnbGlnYWJsZSBpbXBh
Y3Qgb24KPiA+IG1lbW9yeS1jb25zdHJhaW5lZCBkZXZpY2VzIHRob3VnaC4KPgo+IEluIHdoYXQg
d2F5PyAgSXMgdGhpcyBiZWNhdXNlIGEgc29ja2V0IGhhcyBhIGxvdCBvZiBtZW1vcnkgc3RhdGUg
bmVlZGVkLAo+IG9yIGlzIHRoaXMgc29tZSBvdGhlciBncmV5YnVzIG92ZXJoZWFkPwoKTm90aGlu
ZyB0byBkbyB3aXRoIEdyZXlidXMuCgpJJ20gcHVsbGluZyBudW1iZXJzIG91dCBvZiB0aGluIGFp
ciBoZXJlLCBidXQgaW4gWmVwaHlyLCBlYWNoIFRDUApzZXJ2aWNlIGNvbnN1bWVzCiogPj0gMiBQ
T1NJWCBmZCdzIChhbmQgZW50cmllcyBpbiB0aGUgZmQgdGFibGUpCiogPj0gMiBUQ1AgY29udGV4
dHMKKiA+PSBzb21lIG1pbmltYWwgbnVtYmVyIG9mIG5ldHdvcmsgYnVmZmVycyAoZWFjaCBjb25z
dW1pbmcgc29tZSBzaXplKQoKTW9zdCBvZiB0aG9zZSBhcmUgc3RhdGljYWxseSBhbGxvY2F0ZWQg
KGNvbmZpZ3VyZWQgdmlhIEtjb25maWcpLCBidXQgdGhleSBkbwphZGQgdXAuIEkgZG9uJ3QgaGF2
ZSBhIHNwZWNpZmljIG51bWJlciBvZiBieXRlcyBmb3IgZWFjaCBvZiB0aGVzZS4KClRoZSByZWFs
IGdvdGNoYSBpcyBpbiB0aGUgVExTIGNvbnRleHRzLiBTbyBmb3IgZWFjaCBUTFMgc2VydmljZSwg
dGhlcmUgYXJlCiogYWRkaXRpb25hbCBmZCdzICgyIGlpcmMsIGJ1dCBkb24ndCBxdW90ZSBtZSBv
biBpdCkKKiAyIGJ1ZmZlcnMgb2YgPj0gNTEyIGJ5dGVzIChvbmUgZm9yIGVhY2ggb2YgVFgsIFJY
KSAqKnBlciBzb2NrZXQqKgoqIDEgYnVmZmVyIGZvciB0aGUgY2xpZW50IGNlcnQgKGlmIG11dHVh
bCBhdXRoIGlzIHVzZWQpICoqcGVyIHNvY2tldCoqCiogMSBidWZmZXIgZm9yIHRoZSBjYSBjZXJ0
IChpZiBtdXR1YWwgYXV0aCBpcyB1c2VkKSAqKnBlciBzb2NrZXQqKgoKUlNBIGtleSBtaW5pbXVt
IHNhZmUtaXNoIHNpemUgaXMgMmssIHNvIHRob3NlIG51bWJlcnMgZG8gYWRkIHVwCm9uIGEgdGlu
eSBkZXZpY2Ugd2l0aCBlLmcuIDY0ayBvZiBTUkFNLCBlc3BlY2lhbGx5IHdoZW4gY29uc2lkZXJp
bmcKdGhhdCBtb3N0IEdyZXlidXMgaGFuZGxlcnMgYXJlIHRocmVhZGVkIChJIHRoaW5rIHRoZSBk
ZWZhdWx0IHRocmVhZCBzaXplIGlzIDFrKS4KCj4gPiBBdCB0aGlzIHBvaW50LCBteSBHcmV5YnVz
IGZvciBaZXBoeXIgbW9kdWxlIGlzIGFscGhhIHJlYWR5LiBJdCB3b3Jrcwo+ID4gb3ZlciBVQVJU
LCBidXQgYWxzbyBhbnkgb3RoZXIgdHJhbnNwb3J0IHRoYXQgc3VwcG9ydHMgVENQL0lQIHN1Y2gg
YXMKPiA+IEV0aGVybmV0LCBXaUZpLCBCTEUsIDgwMi4xNS40IChib3RoIDIuNCBHSHogYW5kIFN1
YiBHSHopLCBDQU4KPiA+IChhbHRob3VnaCB0aGF0J3MgdW50ZXN0ZWQpLiBTdGlsbCBsb3RzIG9m
IHdvcmsgdG8gYmUgZG9uZSAobGlrZQo+ID4gc3VwcG9ydCBmb3IgZGlmZmVyZW50IEdyZXlidXMg
cHJvdG9jb2xzKSwgYnV0IGl0J3MgcXVpdGUgdXNhYmxlIGZvcgo+ID4gR1BJTywgSTJDLCBhbmQg
U1BJIG5vdyA7LSkKPgo+IEFueSBMaW51eCBrZXJuZWwtc2lkZSBjaGFuZ2VzIG5lZWRlZCBmb3Ig
YW55IG9mIHRoaXM/CgpTbyBmYXIsIG5vbmUuIFRoZSBvbmx5IGNhdmVhdCB0byB0aGF0IGlzLCB0
aGF0IHRvIGF1dG9tYWdpY2FsbHkgcHJvYmUKdGhlIExpbnV4IGRyaXZlciBmb3IgYSBudW1iZXIg
b2YgU1BJIG9yIEkyQyBkZXZpY2VzLCBzb21lIHBsYXRmb3JtCmRhdGEgaXMgcmVxdWlyZWQuIFZh
aXNobmF2IE1hIGlzIHdvcmtpbmcgb24gdGhhdCBhdG0gKGZvciBtaWNyb2J1cykKYW5kIGhlJ3Mg
cHJldHR5IGZhciBhbG9uZyBub3cuIFRoZSBzYW1lIGlkZWFzIGNvdWxkIGJlIHJldXNlZCBmb3IK
ZGlmZmVyZW50IGZvcm0gZmFjdG9ycyBzdWNoIGFzIEZlYXRoZXIsIGV0Yywgc28gdGhlcmUgaXMg
c29tZSBvdmVybGFwLgoKPiBJIGFtIGludGVyZXN0ZWQgaW4gZ2V0dGluZyB0aGUgcmVtYWluaW5n
IGdyZXlidXMgY29kZSBvdXQgb2Ygc3RhZ2luZwo+IHRoaXMgeWVhciwgYXMgdGhlcmUncyBubyBn
b29kIHJlYXNvbiBmb3IgaXQgdG8gYmUgaGFuZ2luZyBhcm91bmQgd2l0aCBubwo+IHJlYWwgZGV2
ZWxvcG1lbnQgaGFwcGVuaW5nLiAgSWYgdGhlcmUncyBhbnl0aGluZyBsZWZ0IHRvIGJlIGRvbmUg
b24gdGhlCj4gTGludXggcG9ydGlvbiwgdGhhdCB3b3VsZCBiZSBnb29kIHRvIGtub3csIG90aGVy
d2lzZSBJIHRoaW5rIHdlJ2xsIGp1c3QKPiBzdGFydCBtb3ZpbmcgaW5kaXZkdWFsIGRyaXZlcnMg
b3V0IG9mIHN0YWdpbmcgc2xvd2x5Li4uCgpJIGNhbiBhcHByZWNpYXRlIHRoYXQuIE5vdGhpbmcg
dGhhdCBJJ3ZlIHNlZW4gaW4gdXBzdHJlYW0gaGFzIHNlZW1lZCB0bwpjYXVzZSBhbnkgaXNzdWVz
IHRoYXQgSSd2ZSBlbmNvdW50ZXJlZCBhdCB0aGlzIHBvaW50LgoKSSBiZWxpZXZlIHRoYXQgZ2Jf
bmV0bGluayBhbmQgZ2JyaWRnZSByZXF1aXJlIHNvbWUgd29yayB0byBiZSBkb25lIGluCnRlcm1z
IG9mIGdyYWNlZnVsIHNodXRkb3duLCBlcnJvciwgYW5kIGNvbm5lY3Rpb24gaGFuZGxpbmcsIGFz
IHRoZXJlIGFyZQpvY2Nhc2lvbmFsbHkgcGFuaWNzLCBidXQgKGZyb20gbXkgZXhwZXJpZW5jZSkg
dGhvc2UgYXJlIG1vc3QgbGlrZWx5IGR1ZSB0bwppc3N1ZXMgaW4gZ2JfbmV0bGluayBvciBnYnJp
ZGdlIGFuZCBub3QgdGhlIHVwc3RyZWFtIGtlcm5lbCBjb2RlLgoKRm9yIGV4YW1wbGUsCgpodHRw
czovL2dpdGh1Yi5jb20vYW5vYmxpL2dicmlkZ2UvYmxvYi9tYXN0ZXIvY29udHJvbGxlcnMvdGNw
aXAuYyNMMjA3CgpBbHNvLCB0aGUgc2ltcGxlIGZhY3QgdGhhdCB0aGUgZ2JyaWRnZSBwcm9jZXNz
IGRvZXMgbm90IHJlcXVpcmUgcm9vdApwcml2aWxlZ2VzIGlzCihhIGJpdCkgY29uY2VybmluZy4g
VGhlIGdiX25ldGxpbmsgbW9kdWxlIHNob3VsZCBwcm9iYWJseSBiZSBtb2RpZmllZCB0bwpjaGVj
ayB0aGUgcGVybWlzc2lvbnMgb2YgdGhlIHByb2Nlc3Mgc2VuZGluZyBpdCBkYXRhLCBtYXliZSBz
b21lIHVzZXJzcGFjZQpncmV5YnVzIHVzZXIgLyBncm91cCBzaG91bGQgYmUgY3JlYXRlZCwgZXRj
LgoKCkMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
