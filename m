Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AF68526A265
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Sep 2020 11:39:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D11BD610F9
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Sep 2020 09:39:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BC5F466608; Tue, 15 Sep 2020 09:39:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5CD8C666C2;
	Tue, 15 Sep 2020 09:39:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7E10C610F9
 for <greybus-dev@lists.linaro.org>; Tue, 15 Sep 2020 09:39:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6629E66608; Tue, 15 Sep 2020 09:39:34 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by lists.linaro.org (Postfix) with ESMTPS id E0085610F9
 for <greybus-dev@lists.linaro.org>; Tue, 15 Sep 2020 09:39:32 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id n25so2218867ljj.4
 for <greybus-dev@lists.linaro.org>; Tue, 15 Sep 2020 02:39:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=gsQS95Uk+X6C1ro4IWpVaBNknqSF3qG+Ftqq7mGtuJM=;
 b=QDwTRj9ljdDk9YVipg3Xl98Y+ssB9IDt9aRmMuc7PbEq26oyDWhQFl73i7RGP2GGJy
 JGGl0JbvGKHQUaox1LxcjYa3m8jbLOO197kQ+r7tjEsmOlLkutodZDFwMyDqpRMY4S6l
 rktipI8B3lwdEOYhWmThJJTIUKlMbCGBZ2s+1/iHOUg4O39r6Zh4P9SdQr+Kn0uXOKhU
 ljnqKgvP+73JgWlohvXDDEKgzYCA3GjRo641TEgL2fuPNdEzShIAsgdecLsznNVD51Up
 WssITOvHgsAJgmEMsS7m+KsrFk6hi/KLEgH7m7VZ1sBnWYYVwKjatozcjYHnXbDwh/uD
 DMlA==
X-Gm-Message-State: AOAM530ZkkFQmnRsbS7JWWyRXoEbSDHiHjusu3Tx2uhCRL8JELQRBoJ8
 mgrGmf8rp7tpgSqGuSL5WX8=
X-Google-Smtp-Source: ABdhPJxT4U446B9RyHHoxlY0C1zVy/91BYU/0K3ze2/e5l+769DK9WnAtaylL3grijOpOooNXJi5Rw==
X-Received: by 2002:a05:651c:1073:: with SMTP id
 y19mr6961972ljm.57.1600162771665; 
 Tue, 15 Sep 2020 02:39:31 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id 80sm4228874lff.61.2020.09.15.02.39.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 02:39:30 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kI7Qv-00058k-Pa; Tue, 15 Sep 2020 11:39:29 +0200
Date: Tue, 15 Sep 2020 11:39:29 +0200
From: Johan Hovold <johan@kernel.org>
To: Liu Shixin <liushixin2@huawei.com>
Message-ID: <20200915093929.GM24441@localhost>
References: <20200915032630.1772621-1-liushixin2@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915032630.1772621-1-liushixin2@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH -next] staging: greybus: simplify the
 return expression of gb_svc_add()
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

T24gVHVlLCBTZXAgMTUsIDIwMjAgYXQgMTE6MjY6MzBBTSArMDgwMCwgTGl1IFNoaXhpbiB3cm90
ZToKPiBTaW1wbGlmeSB0aGUgcmV0dXJuIGV4cHJlc3Npb24uCj4gCj4gU2lnbmVkLW9mZi1ieTog
TGl1IFNoaXhpbiA8bGl1c2hpeGluMkBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dyZXli
dXMvc3ZjLmMgfCA4ICstLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
NyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL3N2Yy5jIGIv
ZHJpdmVycy9ncmV5YnVzL3N2Yy5jCj4gaW5kZXggY2U3NzQwZWY0NDliLi5kY2EyNTExNzJjZDIg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncmV5YnVzL3N2Yy5jCj4gKysrIGIvZHJpdmVycy9ncmV5
YnVzL3N2Yy5jCj4gQEAgLTEzNDUsMTggKzEzNDUsMTIgQEAgc3RydWN0IGdiX3N2YyAqZ2Jfc3Zj
X2NyZWF0ZShzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkKQo+ICAKPiAgaW50IGdiX3N2Y19hZGQo
c3RydWN0IGdiX3N2YyAqc3ZjKQo+ICB7Cj4gLQlpbnQgcmV0Owo+IC0KPiAgCS8qCj4gIAkgKiBU
aGUgU1ZDIHByb3RvY29sIGlzIGN1cnJlbnRseSBkcml2ZW4gYnkgdGhlIFNWQywgc28gdGhlIFNW
QyBkZXZpY2UKPiAgCSAqIGlzIGFkZGVkIGZyb20gdGhlIGNvbm5lY3Rpb24gcmVxdWVzdCBoYW5k
bGVyIHdoZW4gZW5vdWdoCj4gIAkgKiBpbmZvcm1hdGlvbiBoYXMgYmVlbiByZWNlaXZlZC4KPiAg
CSAqLwo+IC0JcmV0ID0gZ2JfY29ubmVjdGlvbl9lbmFibGUoc3ZjLT5jb25uZWN0aW9uKTsKPiAt
CWlmIChyZXQpCj4gLQkJcmV0dXJuIHJldDsKPiAtCj4gLQlyZXR1cm4gMDsKPiArCXJldHVybiBn
Yl9jb25uZWN0aW9uX2VuYWJsZShzdmMtPmNvbm5lY3Rpb24pOwoKVGhlcmUgbm8gbmVlZCBmb3Ig
dGhpcyBjaGFuZ2UuIFRoaXMgY29kZSB3YXMgd3JpdHRlbiB3aXRoIGFuIGV4cGxpY2l0CnN1Y2Nl
c3MgcGF0aCBvbiBwdXJwb3NlLgoKQWxzbywgdGhpcyBkcml2ZXIgZG9lc24ndCBsaXZlIGluIHN0
YWdpbmcgYW55bW9yZSBhcyB5b3VyIHBhdGNoIHByZWZpeApzdWdnZXN0cy4KCj4gIH0KPiAgCj4g
IHN0YXRpYyB2b2lkIGdiX3N2Y19yZW1vdmVfbW9kdWxlcyhzdHJ1Y3QgZ2Jfc3ZjICpzdmMpCgpK
b2hhbgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczov
L2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
