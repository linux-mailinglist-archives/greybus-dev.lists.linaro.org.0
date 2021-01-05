Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6A02EB17E
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 18:38:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F34DB6672A
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 17:38:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E34D366727; Tue,  5 Jan 2021 17:38:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3A7F066729;
	Tue,  5 Jan 2021 17:37:54 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 62D7260631
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 17:37:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4628266727; Tue,  5 Jan 2021 17:37:51 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com
 [209.85.210.44])
 by lists.linaro.org (Postfix) with ESMTPS id 2AE2B60631
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 17:37:50 +0000 (UTC)
Received: by mail-ot1-f44.google.com with SMTP id n42so392789ota.12
 for <greybus-dev@lists.linaro.org>; Tue, 05 Jan 2021 09:37:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yuy5JJ3bjHN9EMQ96OeaASllv5HajCnGNF+VbfmyEcs=;
 b=QwaDs9EiyHFiwHAgwqZz6aNKgFiT0Qhbv4uB24JN1k8sMbKsiyA94Jb7j/NFiA84Io
 1slb6+4W/ByML8xbIFgnbd7EWPCTzb8Vw0F2lIRkDdkrppf9FqsGs0DV/hZuJDdfWwuC
 4+5mmJ1vkAmkj8P32+MyXrmd/cimSDMtPjyoNUnnHNWSW3Qp/bFz07CvOI1wAnbkRCHy
 /93b2GFfZEZJ5YZL5ZGBLLQbgpOFWvJkcPZ1uNKB0I551DFejH+E6Ugkj73OXhnN/B6r
 GZm3rJuGdh2iSsHEPs2jxN81QGzmPHdJT9DYHM3w6PGgS2JskfYDt7JMBjRbTlJI+goO
 rbIw==
X-Gm-Message-State: AOAM530oPZfppbyMeOtjclUvk0E/D2WDe21DqzJ2vk7kI0qN4jtozzi6
 NHVwcukzo7na//HChZOWFLZYkXj1J+MRt9nPiw8=
X-Google-Smtp-Source: ABdhPJzww3bT1qb+J8hgWBBehna53/IAwmxXZ/L5bhghgnz5Oq0bJTG0bRt8dkkqzB/NEbpAXvtpj3mIFdLsqRGNZs8=
X-Received: by 2002:a9d:675a:: with SMTP id w26mr410336otm.340.1609868269456; 
 Tue, 05 Jan 2021 09:37:49 -0800 (PST)
MIME-Version: 1.0
References: <CAF4BF-R1gKuRZ3g3DSHROSxbmBT2gFJxSsZkzjNgBcw1mjuv5Q@mail.gmail.com>
 <135673dd-2732-e453-5833-796af3ea867b@linaro.org>
In-Reply-To: <135673dd-2732-e453-5833-796af3ea867b@linaro.org>
From: Christopher Friedt <chrisfriedt@gmail.com>
Date: Tue, 5 Jan 2021 12:37:38 -0500
Message-ID: <CAF4BF-QQFKTdQtgBXNPeSG+QwFJ7fetZPfkvuMn7Ajy51JUGvA@mail.gmail.com>
To: Alex Elder <elder@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, johan@kernel.org, Greg KH <greg@kroah.com>
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

SGkgQWxleCAmIGFsbC4KCkhhcHB5IE5ldyBZZWFyLCBhbmQgdGhhbmtzIGZvciBhbGwgb2YgdGhl
IGFkdmljZSA6LSkKCkkgZW5kZWQgdXAgdGFraW5nIGl0IGFuZCBhbSB1c2luZyBUTFMgZm9yIGF1
dGhlbnRpY2F0aW9uIGFuZAplbmNyeXB0aW9uLiBTdGFuZGFyZHMgYXJlIG5pY2UuCgpCb3RoIG9u
ZS13YXkgYXV0aGVudGljYXRpb24gKHNpbWlsYXIgdG8gSFRUUFMpIGFuZCBtdXR1YWwKYXV0aGVu
dGljYXRpb24gKHNpbWlsYXIgdG8gU1NIIHB1YmxpYyBrZXkpIGFyZSBzdXBwb3J0ZWQgbm93IGJl
dHdlZW4KWmVwaHlyWzFdIGFuZCBHYnJpZGdlWzJdLgoKT24gU2F0LCBOb3YgNywgMjAyMCBhdCAx
MjozMyBQTSBBbGV4IEVsZGVyIDxlbGRlckBsaW5hcm8ub3JnPiB3cm90ZToKPgo+IE9uIDkvMTEv
MjAgODo1MiBBTSwgQ2hyaXN0b3BoZXIgRnJpZWR0IHdyb3RlOgo+IEkgYWxzbyBjb25jdXIgd2l0
aCBHcmVnJ3MgcXVlc3Rpb25zIGFib3V0IHdoeSB5b3UgZmVlbAo+IHRoZXNlIHRoaW5ncyBuZWVk
IHRvIGJlIGluY29ycG9yYXRlZCAqaW50byogR3JleWJ1cywgcmF0aGVyCj4gdGhhbiBzZXQgdXAg
KmFyb3VuZCogR3JleWJ1cyBzb21laG93LiAgT24gUHJvamVjdCBBcmEsIHRoZQoKSSB3b3VsZCBh
bHNvIGNvbmN1ciBhdCB0aGlzIHBvaW50LiBNeSBvcmlnaW5hbCBjaGFuZ2VzIHdlcmUgbW9zdGx5
CmRvaW5nIHRoZSBzYW1lIHRoaW5nIHRoYXQgVExTIGRvZXMgYnV0IGp1c3QgaW4gYSBub24tc3Rh
bmRhcmQgd2F5LgpPcmlnaW5hbGx5LCBpdCB3YXMganVzdCBhIHByb29mIG9mIGNvbmNlcHQgZm9y
IHRoZSBjbGllbnQgZHVlIHRvCnVuZGVyc3BlY2lmaWNhdGlvbiwgYnV0IFRMUyBqdXN0IG1ha2Vz
IHdheSBtb3JlIHNlbnNlLgoKSSd2ZSB1c2VkIFplcGh5cidzIFRMUyBleHRlbnNpb25zIGZvciB0
aGUgc29ja2V0IEFQSSBhbmQgT3BlblNTTApvbiB0aGUgTGludXggc2lkZS4gU28gaXQncyBwcmV0
dHkgY2xlYW4gYW5kIGFsc28gdmVyeSB0ZXN0YWJsZS4KClRoZXJlIGFyZSBubyBjaGFuZ2VzIHJl
cXVpcmVkIHRvIHRoZSBHcmV5YnVzIHNwZWMgc28gdGhhdCB3b3JrcyBhcy1pcywKYW5kIGVuY3J5
cHRpb24gaXMga2VwdCBhcyBhIHRyYW5zcG9ydC1sYXllciBvcHRpb24uIEZvciBnYnJpZGdlLCBp
dCdzCmEgc2VwYXJhdGUgbG9naWNhbCB0cmFuc3BvcnQgYW5kIGNhbiBiZSB1c2VkIGluZGVwZW5k
ZW50bHkgb2YKcGxhaW4tdGV4dCBUQ1AvSVAgdG9vLiBUaGUgc2VydmljZSBpcyBhZHZlcnRpc2Vk
IHVzaW5nCiJfZ3JleWJ1c3MuX3RjcCIgcmF0aGVyIHRoYW4gIl9ncmV5YnVzLl90Y3AiLgoKUXVp
dGUgYSBudW1iZXIgb2YgZmVhdHVyZXMgd2VyZSBhZGRlZCB0byBaZXBoeXIgdG8gc3VwcG9ydCB0
aGlzLCBpbmNsdWRpbmcKCiogRE5TLVNEIChhbmQgc2xpZ2h0IG1vZGlmaWNhdGlvbiBvZiB0aGUg
ZXhpc3RpbmcgbUROUyBpbXBsKQoqIGFsaWduZWQgaGVhcCBhbGxvY2F0b3JzCiogZHluYW1pYyBw
dGhyZWFkIHN0YWNrIHN1cHBvcnQKKiBzb21lIG1pbm9yIGJ1Z2ZpeGVzIHRvIFRDUAoqIHNvbWUg
ZHJpdmVyIHN1cHBvcnQgZm9yIHRoZSBwaHlzaWNhbCBsYXllciAoSUVFRSA4MDIuMTUuNCwgQkxF
KQoqIGEgZm9ydGhjb21pbmcgdGVtcGxhdGUgZm9yIGV4dGVybmFsIG1vZHVsZXMKClRoZSBmYWN0
IHRoYXQgZ2JyaWRnZSB1c2VzIGEgc2VwYXJhdGUgc29ja2V0IHBlciBDUG9ydCAoYWx0aG91Z2gg
a2luZApvZiBuaWNlIGNvbmNlcHR1YWxseSkgZG9lcyBoYXZlIGEgbm9uLW5lZ2xpZ2FibGUgaW1w
YWN0IG9uCm1lbW9yeS1jb25zdHJhaW5lZCBkZXZpY2VzIHRob3VnaC4KClRoYXQgaW1wYWN0IGlz
IGV4YWNlcmJhdGVkIHdoZW4gVExTIGlzIHRocm93biBpbnRvIHRoZSBtaXguIEkndmUgYWRkZWQK
YW5vdGhlciBwYWlyIG9mIHRpY2tldHMgdG8gIGNvbmNlbnRyYXRlIGFsbCB0cmFmZmljIGludG8g
YSBzaW5nbGUgc29ja2V0CmNvbm5lY3Rpb24gbGlrZSB3aGF0IGlzIGN1cnJlbnRseSBkb25lIGZv
ciB0aGUgVUFSVCB0cmFuc3BvcnQuIFRoYXQgcmVkdWNlcwpub3Qgb25seSB0aGUgbWVtb3J5IHJl
cXVpcmVkIHBlciBzb2NrZXQsIGJ1dCBhbHNvIHRoZSBkdXBsaWNhdGlvbiBvZiBUTFMKcmVzb3Vy
Y2VzIG9uIGEgcGVyLXNvY2tldCBiYXNpcyAoZXNwZWNpYWxseSB3aGVuIG11dHVhbCBhdXRoIGlz
IHVzZWQpLiBBIGZ1dHVyZQpjaGFuZ2UgZm9yIGdicmlkZ2UgYW5kIExpbnV4IG1pZ2h0IGJlIHRv
IG1vdmUgc29ja2V0IEkvTyB0byB0aGUga2VybmVsCmFmdGVyIFRMUyBhdXRoICsgQUVTIGlzIHNl
dCB1cC4gVGhhdCB3YXMgb3V0IG9mIHNjb3BlIGZvciBteSBleGlzdGluZwpjb250cmFjdCwgYnV0
IGl0IHdvdWxkIGJlICJpbnRlcmVzdGluZyIgdG8gaW1wbGVtZW50LgoKQXQgdGhpcyBwb2ludCwg
bXkgR3JleWJ1cyBmb3IgWmVwaHlyIG1vZHVsZSBpcyBhbHBoYSByZWFkeS4gSXQgd29ya3MKb3Zl
ciBVQVJULCBidXQgYWxzbyBhbnkgb3RoZXIgdHJhbnNwb3J0IHRoYXQgc3VwcG9ydHMgVENQL0lQ
IHN1Y2ggYXMKRXRoZXJuZXQsIFdpRmksIEJMRSwgODAyLjE1LjQgKGJvdGggMi40IEdIeiBhbmQg
U3ViIEdIeiksIENBTgooYWx0aG91Z2ggdGhhdCdzIHVudGVzdGVkKS4gU3RpbGwgbG90cyBvZiB3
b3JrIHRvIGJlIGRvbmUgKGxpa2UKc3VwcG9ydCBmb3IgZGlmZmVyZW50IEdyZXlidXMgcHJvdG9j
b2xzKSwgYnV0IGl0J3MgcXVpdGUgdXNhYmxlIGZvcgpHUElPLCBJMkMsIGFuZCBTUEkgbm93IDst
KQoKVGhhbmtzIGFnYWluIGZvciBhbGwgb2YgdGhlIGZlZWRiYWNrIGFuZCBmb3IgZXZlcnlvbmUn
cyBjb250cmlidXRpb25zCnRvIEdyZXlidXMgb3ZlciB0aGUgeWVhcnMhCgpDaHJpcwoKWzFdIGh0
dHBzOi8vZ2l0aHViLmNvbS9jZnJpZWR0L2dyZXlidXMtZm9yLXplcGh5ci9wdWxsLzM0L2ZpbGVz
ClsyXSBodHRwczovL2dpdGh1Yi5jb20vY2ZyaWVkdC9nYnJpZGdlL3B1bGwvNy9maWxlcwpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
