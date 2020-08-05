Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B1723CC92
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 18:53:02 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 354A96192C
	for <lists+greybus-dev@lfdr.de>; Wed,  5 Aug 2020 16:53:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2231F619B5; Wed,  5 Aug 2020 16:53:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB1326601C;
	Wed,  5 Aug 2020 16:52:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0BB2C607DB
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 16:52:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F11B1619B5; Wed,  5 Aug 2020 16:52:47 +0000 (UTC)
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
 [209.85.214.193])
 by lists.linaro.org (Postfix) with ESMTPS id 12C21607DB
 for <greybus-dev@lists.linaro.org>; Wed,  5 Aug 2020 16:52:47 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id g19so12998166plq.0
 for <greybus-dev@lists.linaro.org>; Wed, 05 Aug 2020 09:52:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zXZGtsOURmZyHZLbU5fvxhNJ7/uuuH+Jf1Odf6vVQ/Y=;
 b=ePKyNp9oYEGgCsqRdDP+DYvOjDq6HHBJZpuMQj8s4T7mnyVp/Al7HI9MFj46RSHfbq
 gv8jNkTcfh7gsSKt0jIEv0gm+Yb3jDlR4KpLT+OTp6iSPW4JIjqGfc+ylFRjJI90xa/o
 +/QsdkhQIMuypOJAm0awVVFyDNXJgAJYGn69ZoGzQP94OyJj1mnhUMAK7OBFUAo92lng
 6gMuVkSdAnPFueoPnene/Ytphl3BKaP17JNzZcUd1dYouErT45Xh1oBQGXREKfcbULSI
 p96q0v2VsVrw21xr3lM90XHs3bqCP75zpVpp1L7Ma956EckWsh+O/OerT+2v5WqLiI5T
 U69g==
X-Gm-Message-State: AOAM5308PPRSbFYtlsFbfYhjsu9ini44wr6pdesOp7kb6DJzsuPguWC9
 Je2Qd5+4shDEvvgRU5KkEqa3sWx9CQ6jtliDuRo=
X-Google-Smtp-Source: ABdhPJzq2IoaaG/XACuojhMxN71N1xV8rgh0jzB4NCZ3up/DasYj5P+gibCzFgPgwUVAYsmZlRJnUeV8JfW04Jc8fHk=
X-Received: by 2002:a17:90a:148:: with SMTP id
 z8mr4414464pje.197.1596646366165; 
 Wed, 05 Aug 2020 09:52:46 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1594290158.git.vaibhav.sr@gmail.com>
 <896b8e24d990f2bca5aafaebd26e37095042951e.1594290158.git.vaibhav.sr@gmail.com>
 <7cbc0daa-993f-ffc9-78f4-b1e62fd54304@linaro.org>
In-Reply-To: <7cbc0daa-993f-ffc9-78f4-b1e62fd54304@linaro.org>
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Wed, 5 Aug 2020 22:22:09 +0530
Message-ID: <CAAs364-PFw2OGGhwBH8RB7jBPD4Xre4puu9G-7P+z6Ur_Ni-yA@mail.gmail.com>
To: Alex Elder <elder@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [greybus-dev] [PATCH v4 1/7] staging: greybus: audio: Update
 snd_jack FW usage as per new APIs
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

T24gV2VkLCBBdWcgNSwgMjAyMCBhdCA2OjM1IFBNIEFsZXggRWxkZXIgPGVsZGVyQGxpbmFyby5v
cmc+IHdyb3RlOgo+Cj4gT24gNy85LzIwIDU6MjcgQU0sIFZhaWJoYXYgQWdhcndhbCB3cm90ZToK
PiA+IHNuZF9zb2NfamFjayBBUElzIGFyZSBtb2RpZmllZCBpbiByZWNlbnQga2VybmVsIHZlcnNp
b25zLiBUaGlzIHBhdGNoCj4gPiB1cGRhdGVzIHRoZSBjb2RlYyBkcml2ZXIgdG8gcmVzb2x2ZSB0
aGUgY29tcGlsYXRpb24gZXJyb3JzIHJlbGF0ZWQgdG8KPiA+IGphY2sgZnJhbWV3b3JrLgo+Cj4g
R3JlZyBoYXMgYWxyZWFkeSBhY2NlcHRlZCB0aGlzIHNlcmllcyBzbyBJIHdvbid0IHJldmlldyB0
aGlzIG5vdy4gIEJ1dAo+IEkgc3RpbGwgd2FudGVkIHRvIHByb3ZpZGUgdGhpcyBjb21tZW50Lgo+
Cj4gSXQgd291bGQgYmUgaGVscGZ1bCBpbiB0aGUgZnV0dXJlIHRvIHByb3ZpZGUgYSBsaXR0bGUg
bW9yZSBpbmZvcm1hdGlvbgo+IGFib3V0IHRoZSBuYXR1cmUgb2YgdGhlIGNoYW5nZXMgdG8gdGhl
c2UgQVBJcy4gIEFzIGEgcmV2aWV3ZXIgSSBoYWQgdG8KPiBnbyB0cmFjayB0aGVtIGRvd24gdG8g
Z2V0IGEgbGl0dGxlIG1vcmUgY29udGV4dCBhYm91dCB3aGF0IHlvdSBhcmUgZG9pbmcKPiBoZXJl
LiAgU28geW91IGNvdWxkIHNheSBzb21ldGhpbmcgbGlrZToKPgo+ICAgQXVkaW8gamFja3MgYXJl
IG5vdyByZWdpc3RlcmVkIGF0IHRoZSBjYXJkIGxldmVsIHJhdGhlciB0aGFuIGJlaW5nCj4gICBh
c3NvY2lhdGVkIHdpdGggYSBDT0RFQy4gIFRoZSBuZXcgY2FyZC1iYXNlZCBBUEkgYWxsb3dzIGEg
amFjaydzIHBpbnMKPiAgIHRvIGJlIHN1cHBsaWVkIHdoZW4gdGhlIGphY2sgaXMgZmlyc3QgcmVn
aXN0ZXJlZC4gIFNlZTogOTcwOTM5OTY0YzI2Cj4gICAoIkFTb0M6IEFsbG93IHRvIHJlZ2lzdGVy
IGphY2tzIGF0IHRoZSBjYXJkIGxldmVsIikKPgo+IEluIG90aGVyIHdvcmRzLCBkb24ndCBqdXN0
IHNheSAidGhlIEFQSXMgY2hhbmdlZCwiIHNheSAiaGVyZSBpcyBob3cKPiB0aGUgQVBJcyBoYXZl
IGNoYW5nZWQuIiAgVGhpcyBraW5kIG9mIGludHJvZHVjdGlvbiBjYW4gYmUgdmVyeSBoZWxwZnVs
Cj4gYW5kIHRpbWUgc2F2aW5nIGZvciB5b3VyIHJldmlld2Vycy4KPgoKVGhhbmtzIGZvciB0aGUg
ZmVlZGJhY2sgQWxleC4gSSdsbCB0YWtlIGNhcmUgb2YgdGhlIGNvbW1pdCBtZXNzYWdlIHdoaWxl
CnNoYXJpbmcgc2ltaWxhciBwYXRjaGVzLgoKLS0KdmFpYmhhdgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=
