Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7561EA9B8D
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 09:18:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3037261724
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 07:18:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 238EC61875; Thu,  5 Sep 2019 07:18:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 24151617F2;
	Thu,  5 Sep 2019 07:17:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2923B60BF7
 for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2019 07:17:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0C47361738; Thu,  5 Sep 2019 07:17:54 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by lists.linaro.org (Postfix) with ESMTPS id 0D79360BF7
 for <greybus-dev@lists.linaro.org>; Thu,  5 Sep 2019 07:17:53 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r134so1050703lff.12
 for <greybus-dev@lists.linaro.org>; Thu, 05 Sep 2019 00:17:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=RTxQxEPMu/S6pvKFwk3GURZ2Pv3mdgBCFDIodIwFr0k=;
 b=WKKJaxxPK7T8o1wmF6IOKGDQhK9qFEkdMPiIKBOx8aRYW2w2cDX5McP4bogVwP64kC
 F75WoU+MKRr5mPU5IMSUAr7Cr3oprkF/ZQq7jJu+9dqq/6QfPIq5PBAmpYF1AcJ9YKth
 dThm4stW0QJhI1YTBI8Tk9z5Nl7jbaLFk6RJggm7z+vWW4Z+LjngnogPJImK+xX4iJxn
 fZ5QWSxlbHmy1xb3oo+Wm/XxukCqEhJEyW1QimlzYCTuKLj6IzSbbVFAjnafE6pbdALW
 MiAFXkROK3V/xYxU1RaBvW0ftKG119A3AmYydr9t7EGW+mIa3Nb3qB2MAbIM+eKxhz9d
 1frA==
X-Gm-Message-State: APjAAAX8Ysuis5IejVKgiivuCLJmF7u72OzUN3/DwRsjyJbqUJyqbRBS
 kGteIgwY9F0ip2dW224+Ql4=
X-Google-Smtp-Source: APXvYqwYrRtF5ta/sNfxWtl9EmJfjp7gB1SroU3Sbkzpe/nf6vYGuQdoCKOrdZisMXsHRIeGrVG0MQ==
X-Received: by 2002:ac2:5ec1:: with SMTP id d1mr1235343lfq.83.1567667871895;
 Thu, 05 Sep 2019 00:17:51 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id i17sm96012ljd.2.2019.09.05.00.17.50
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 00:17:51 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
 (envelope-from <johan@kernel.org>)
 id 1i5m1Y-0007hH-Vh; Thu, 05 Sep 2019 09:17:45 +0200
Date: Thu, 5 Sep 2019 09:17:44 +0200
From: Johan Hovold <johan@kernel.org>
To: joahannes <joahannes@gmail.com>
Message-ID: <20190905071744.GC1701@localhost>
References: <20190904205558.27666-1-joahannes@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190904205558.27666-1-joahannes@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, jevsilv@gmail.com,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 lkcamp@lists.libreplanetbr.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: remove blank line after
 an open brace '{'.
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

T24gV2VkLCBTZXAgMDQsIDIwMTkgYXQgMDg6NTU6NThQTSArMDAwMCwgam9haGFubmVzIHdyb3Rl
Ogo+IEZpeCBjaGVja3BhdGNoIGVycm9yCj4gIkNIRUNLOiBCbGFuayBsaW5lcyBhcmVuJ3QgbmVj
ZXNzYXJ5IGFmdGVyIGFuIG9wZW4gYnJhY2UgJ3snIgo+IGluIGxvb3BiYWNrX3Rlc3QuYzo3NDIu
CgpQbGVhc2UgZml4IHVwIGFsbCBvZiB0aGUgYmxhbmsgbGluZXMgYmVmb3JlL2FmdGVyIGNsb3Np
bmcvb3BlbmluZyBicmFjZQpjaGVja3BhdGNoIENIRUNLcyBpbiBvbmUgZ28uIFRoZXJlIGFwcGVh
cnMgdG8gYmUgbWFueSBvZiB0aGVtLgoKPiBTaWduZWQtb2ZmLWJ5OiBqb2FoYW5uZXMgPGpvYWhh
bm5lc0BnbWFpbC5jb20+CgpXZSBuZWVkIHlvdXIgZnVsbCBuYW1lIGhlcmUgYW5kIGluIHRoZSBG
cm9tIGxpbmUuCgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFj
a190ZXN0LmMgfCAxIC0KCkFsc28sIHBsZWFzZSBpbmNsdWRlIHRoZSBjb21wb25lbnQgeW91ciBt
b2RpZnlpbmcgaW4gdGhlIHN1YmplY3QgbGluZQpldmVuIGlmIHlvdSBuZWVkIHRvIHNob3J0ZW4g
dGhlIGRlc2NyaXB0aW9uIHNvbWVob3csIGZvciBleGFtcGxlLCAKCglzdGFnaW5nOiBncmV5YnVz
OiBsb29wYmFja190ZXN0OiByZW1vdmUgdW5uZWNlc3NhcnkgYmxhbmsgbGluZXMKCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+IGluZGV4IGJhNmY5MDVmMi4uMjUxYjA1NzEwIDEwMDY0
NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+
ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwo+IEBA
IC03MzksNyArNzM5LDYgQEAgc3RhdGljIGludCB3YWl0X2Zvcl9jb21wbGV0ZShzdHJ1Y3QgbG9v
cGJhY2tfdGVzdCAqdCkKPiAgCQl0cyA9ICZ0LT5wb2xsX3RpbWVvdXQ7Cj4gIAo+ICAJd2hpbGUg
KDEpIHsKPiAtCj4gIAkJcmV0ID0gcHBvbGwodC0+ZmRzLCB0LT5wb2xsX2NvdW50LCB0cywgJm1h
c2tfb2xkKTsKPiAgCQlpZiAocmV0IDw9IDApIHsKPiAgCQkJc3RvcF90ZXN0cyh0KTsKCkpvaGFu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
