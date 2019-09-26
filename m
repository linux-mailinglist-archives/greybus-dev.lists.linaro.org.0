Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9E1BEBC2
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Sep 2019 07:57:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F043B61940
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Sep 2019 05:57:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E57E06193F; Thu, 26 Sep 2019 05:57:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78EE161940;
	Thu, 26 Sep 2019 05:57:14 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D6F8B61937
 for <greybus-dev@lists.linaro.org>; Thu, 26 Sep 2019 05:57:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BBFF06193F; Thu, 26 Sep 2019 05:57:12 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by lists.linaro.org (Postfix) with ESMTPS id 7E42561937
 for <greybus-dev@lists.linaro.org>; Thu, 26 Sep 2019 05:57:11 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id r134so714554lff.12
 for <greybus-dev@lists.linaro.org>; Wed, 25 Sep 2019 22:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tv1CVBkJYPlU1j1V6OUzMhflRJNxhhdmMY2H2CfxK90=;
 b=g8zivPa1CVE4OExCaI+ltQL4LemqCnhn9nwxK5+2DhoWGJxQZPkyAeuRkeKRe5ikB9
 O90T2wyA4vl8U9cKRq3PkGeUsaO/Cq/UUN1TQtFrl1mG0WiqRP0n552sDked7Iek6Tlt
 iRtMmLC6mein3HgzGpxItXEFtT1eIUG5hoTmzmodfqbWhclyYpQkvqK5zqIenUMm2zh0
 0omqZ+amgtjHZ5ipuUn/+ua2FZfJxMr9JAS2uco4TKDgV6A82pqDA34u+JBXIPG66H6y
 myuQCW0hc8Y5+9g+M3qe9GCyJ8C8v94ADi7R7SmJzNyOTfzz6yROngQmvQkumSELbOYd
 2pbw==
X-Gm-Message-State: APjAAAXn1ZHf4FFznoeLfaIBFJlxgUgH/hjRfGVOZVh5jYiD99qoN0Yf
 0f0J2ISSRTeD/gf9ht9mTtc=
X-Google-Smtp-Source: APXvYqyyf8wfTb2uxD9DIhyRKWC96iF9NBJAJEAox9HQ67JE5q5stO2z7v7nMB2vZVaz90d7+KLxgw==
X-Received: by 2002:a19:4bd7:: with SMTP id y206mr1029411lfa.9.1569477430290; 
 Wed, 25 Sep 2019 22:57:10 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id y8sm246833ljh.21.2019.09.25.22.57.09
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Sep 2019 22:57:09 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.2)
 (envelope-from <johan@kernel.org>)
 id 1iDMmB-0001Nn-BI; Thu, 26 Sep 2019 07:57:15 +0200
Date: Thu, 26 Sep 2019 07:57:15 +0200
From: Johan Hovold <johan@kernel.org>
To: Denis Efremov <efremov@linux.com>
Message-ID: <20190926055715.GI14159@localhost>
References: <20190925213656.8950-1-efremov@linux.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190925213656.8950-1-efremov@linux.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] greybus: remove excessive check in
 gb_connection_hd_cport_quiesce()
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

T24gVGh1LCBTZXAgMjYsIDIwMTkgYXQgMTI6MzY6NTZBTSArMDMwMCwgRGVuaXMgRWZyZW1vdiB3
cm90ZToKPiBGdW5jdGlvbiBwb2ludGVyICJoZC0+ZHJpdmVyLT5jcG9ydF9xdWllc2NlIiBpcyBh
bHJlYWR5IGNoZWNrZWQKPiBhdCB0aGUgYmVnaW5uaW5nIG9mIGdiX2Nvbm5lY3Rpb25faGRfY3Bv
cnRfcXVpZXNjZSgpLiBUaHVzLCB0aGUKPiBzZWNvbmQgY2hlY2sgY2FuIGJlIHJlbW92ZWQuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogRGVuaXMgRWZyZW1vdiA8ZWZyZW1vdkBsaW51eC5jb20+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9uLmMgfCAzIC0tLQo+ICAxIGZpbGUgY2hhbmdl
ZCwgMyBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL2Nvbm5l
Y3Rpb24uYyBiL2RyaXZlcnMvZ3JleWJ1cy9jb25uZWN0aW9uLmMKPiBpbmRleCBmYzhmNTdmOTdj
ZTYuLmUzNzk5YTUzYTE5MyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dyZXlidXMvY29ubmVjdGlv
bi5jCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL2Nvbm5lY3Rpb24uYwo+IEBAIC0zNjEsOSArMzYx
LDYgQEAgc3RhdGljIGludCBnYl9jb25uZWN0aW9uX2hkX2Nwb3J0X3F1aWVzY2Uoc3RydWN0IGdi
X2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24pCj4gIAlpZiAoY29ubmVjdGlvbi0+bW9kZV9zd2l0Y2gp
Cj4gIAkJcGVlcl9zcGFjZSArPSBzaXplb2Yoc3RydWN0IGdiX29wZXJhdGlvbl9tc2dfaGRyKTsK
PiAgCj4gLQlpZiAoIWhkLT5kcml2ZXItPmNwb3J0X3F1aWVzY2UpCj4gLQkJcmV0dXJuIDA7Cj4g
LQo+ICAJcmV0ID0gaGQtPmRyaXZlci0+Y3BvcnRfcXVpZXNjZShoZCwgY29ubmVjdGlvbi0+aGRf
Y3BvcnRfaWQsCj4gIAkJCQkJcGVlcl9zcGFjZSwKPiAgCQkJCQlHQl9DT05ORUNUSU9OX0NQT1JU
X1FVSUVTQ0VfVElNRU9VVCk7CgpOaWNlIGNhdGNoLCB0aGFua3MuCgpBY2tlZC1ieTogSm9oYW4g
SG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
