Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE7A9BB9
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 09:25:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3F5D617E2
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 07:25:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C91C0617F2; Thu,  5 Sep 2019 07:25:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DAB2961875;
	Thu,  5 Sep 2019 07:25:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D5F0361738
 for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2019 07:25:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CAFE6617F2; Thu,  5 Sep 2019 07:25:36 +0000 (UTC)
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
 [209.85.167.65])
 by lists.linaro.org (Postfix) with ESMTPS id E088461738
 for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2019 07:25:35 +0000 (UTC)
Received: by mail-lf1-f65.google.com with SMTP id u29so1093286lfk.7
 for <greybus-dev@lists.linaro.org>; Thu, 05 Sep 2019 00:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WzKYcu+ow4nlDzAihnpp11IJFNrWpQ7yO1/2sHTAIpM=;
 b=Gi+23UUvSKzC8EVsTN8aHOQhl2iZPylf034a+esn9E+a2LuchhvX0gatAOgmjw0pk3
 jkSgIfPPhJVLxPX8/aTG/4Xq1dthN/1kWiImwm/fooX70WXRCG9eelvWmdX1bSiOJQdq
 vr0fRiSD8a0GQPCZddpjq4vHhF6ZDAfqDQXJMzDuIZIb673amPOlkzK43hMhipTbdSRh
 hnI72tZ83IbDZS7bxp/dGwGI1EBzyQlapjSQYjKDMuhWlxqjKE/f9kSIAi0bB1wKEOQk
 lkVZ7r+IqWMDpenFtT9mBuWOF3MY8rVl4jL6d5BSvanyB9ebIdbsLp2RCGJI91diBr2w
 6Hig==
X-Gm-Message-State: APjAAAUNLdLdSAQ8JiGNytAaz7o+mVtrDVz0j/viyS1IeZeXDqrB6Dvs
 wj9DcOdTAKeEU6M2ZQBc7DGDVLbZ
X-Google-Smtp-Source: APXvYqwe3GqiNgKMNJMqteE0llK6NR+GrtVeJQE+oALj1fVSx0lVXrJ4d8Zq5QmxsfepPIf5nxfz9g==
X-Received: by 2002:a19:2207:: with SMTP id i7mr1308567lfi.185.1567668334824; 
 Thu, 05 Sep 2019 00:25:34 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id s21sm212789ljj.22.2019.09.05.00.25.34
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 00:25:34 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
 (envelope-from <johan@kernel.org>)
 id 1i5m92-0007mx-SQ; Thu, 05 Sep 2019 09:25:28 +0200
Date: Thu, 5 Sep 2019 09:25:28 +0200
From: Johan Hovold <johan@kernel.org>
To: Pedro Chinen <ph.u.chinen@gmail.com>
Message-ID: <20190905072528.GE1701@localhost>
References: <20190904210547.5288-1-ph.u.chinen@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904210547.5288-1-ph.u.chinen@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, lkcamp@lists.libreplanetbr.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: loopback_test: remove
 multiple blank lines
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

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDk6MDU6NDdQTSArMDAwMCwgUGVkcm8gQ2hpbmVuIHdy
b3RlOgo+IEZpeCBmb2xsb3dpbmcgY2hlY2twYXRoIHdhcm5pbmdzIGluIG11bHRpcGxlIGxpbmVz
Ogo+IENIRUNLOiBQbGVhc2UgZG9uJ3QgdXNlIG11bHRpcGxlIGJsYW5rIGxpbmVzCgpDaGVja3Bh
dGNoIHJlcG9ydHMgZml2ZSBpbnN0YW5jZXMgb2YgdGhpcyBDSEVDSywgcGxlYXNlIGZpeCB0aGVt
IGFsbCBpbgpvbmUgZ28uCgo+IFNpZ25lZC1vZmYtYnk6IFBlZHJvIENoaW5lbiA8cGgudS5jaGlu
ZW5AZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29w
YmFja190ZXN0LmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVz
dC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCj4gaW5k
ZXggYmE2ZjkwNWYyNmZhLi4xZTc4YzE0OGQ3Y2IgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCj4gKysrIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCj4gQEAgLTc3OSw3ICs3NzksNiBAQCBzdGF0
aWMgdm9pZCBwcmVwYXJlX2RldmljZXMoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCj4gIAkJaWYg
KHQtPnN0b3BfYWxsIHx8IGRldmljZV9lbmFibGVkKHQsIGkpKQo+ICAJCQl3cml0ZV9zeXNmc192
YWwodC0+ZGV2aWNlc1tpXS5zeXNmc19lbnRyeSwgInR5cGUiLCAwKTsKPiAgCj4gLQo+ICAJZm9y
IChpID0gMDsgaSA8IHQtPmRldmljZV9jb3VudDsgaSsrKSB7Cj4gIAkJaWYgKCFkZXZpY2VfZW5h
YmxlZCh0LCBpKSkKPiAgCQkJY29udGludWU7Cj4gQEAgLTg1MCw3ICs4NDksNiBAQCB2b2lkIGxv
b3BiYWNrX3J1bihzdHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKPiAgCWlmIChyZXQpCj4gIAkJZ290
byBlcnI7Cj4gIAo+IC0KPiAgCWdldF9yZXN1bHRzKHQpOwo+ICAKPiAgCWxvZ19yZXN1bHRzKHQp
Owo+IEBAIC04ODIsNyArODgwLDYgQEAgc3RhdGljIGludCBzYW5pdHlfY2hlY2soc3RydWN0IGxv
b3BiYWNrX3Rlc3QgKnQpCj4gIAo+ICAJfQo+ICAKPiAtCj4gIAlyZXR1cm4gMDsKPiAgfQoKSm9o
YW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1
cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9s
aXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
