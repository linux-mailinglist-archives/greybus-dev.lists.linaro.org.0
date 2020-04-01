Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB0419D92D
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 16:33:19 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BD5A060E02
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 14:33:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B221560EE1; Fri,  3 Apr 2020 14:33:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,HK_RANDOM_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 15B2660F21;
	Fri,  3 Apr 2020 14:33:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E3A5960831
 for <greybus-dev@lists.linaro.org>; Wed,  1 Apr 2020 10:16:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CE86260E45; Wed,  1 Apr 2020 10:16:27 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by lists.linaro.org (Postfix) with ESMTPS id B2A5A60831
 for <greybus-dev@lists.linaro.org>; Wed,  1 Apr 2020 10:16:26 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id z7so3267019wmk.1
 for <greybus-dev@lists.linaro.org>; Wed, 01 Apr 2020 03:16:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=b9ohpIeggQmJPpjoz9Sh0/yq4Y/ugE9//x5YLp0N6aY=;
 b=EG1CnmlJakHEX0r7f/jt00LCTERAjJcEu6dq5JEMWgDPdt51RAhNAPiFuvhcZrjFpM
 rD+FJoD39BzGSqTeVc31sNybUjX3MqAXXhW65o13m742dLuvGb4oPy5Kty692RhE2EWe
 GeOwXJgRWhCmuXyljAsWeA5+T5mKOZxQYmjQO/JHPR+AXmR4eTW2HkHAuQawQUxP0m0T
 xKkk0kSyGXlvcrby5ucpvO2fnK5XFG/EKuGo1bHRXQklbNG/KorGnTooO+kcbXNIEnz3
 Fkd0xO33zrn8NZDy969Ax4zmn00gRMTlQkwfXUIf0NXy8+p7ZtBJ8jHEtK79Koa3PLUG
 gdAg==
X-Gm-Message-State: AGi0PuY7XG2cHORQYZleAZug442dsQSTWvQZfQiwg08gHCOBAU7fnCd5
 ZemZc0cY4ByIn4GKIG9RcNM=
X-Google-Smtp-Source: APiQypLqvtaoPl6tWHtIyOhb76eFNQRYHnS71OLLlpIsY4OF8fxN7Ii+oG7jvnwZVuFM6QInSpsKpA==
X-Received: by 2002:a7b:c002:: with SMTP id c2mr3490813wmb.123.1585736185732; 
 Wed, 01 Apr 2020 03:16:25 -0700 (PDT)
Received: from arch-thunder.localdomain (a109-49-46-234.cpe.netcabo.pt.
 [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id h2sm2004921wmb.16.2020.04.01.03.16.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Apr 2020 03:16:25 -0700 (PDT)
Date: Wed, 1 Apr 2020 11:16:22 +0100
From: Rui Miguel Silva <rmfrfs@gmail.com>
To: Chen Zhou <chenzhou10@huawei.com>
Message-ID: <20200401101622.tj2bhnacetwt5rce@arch-thunder.localdomain>
References: <20200401030017.100274-1-chenzhou10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200401030017.100274-1-chenzhou10@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH -next] staging: greybus: fix a
 missing-check bug in gb_lights_light_config()
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

SGkgQ2hlbiBaaG91LApUaGFua3MgZm9yIHRoZSBwYXRjaC4KCk9uIFdlZCwgQXByIDAxLCAyMDIw
IGF0IDExOjAwOjE3QU0gKzA4MDAsIENoZW4gWmhvdSB3cm90ZToKPiBJbiBnYl9saWdodHNfbGln
aHRfY29uZmlnKCksICdsaWdodC0+bmFtZScgaXMgYWxsb2NhdGVkIGJ5IGtzdHJuZHVwKCkuCj4g
SXQgcmV0dXJucyBOVUxMIHdoZW4gZmFpbHMsIGFkZCBjaGVjayBmb3IgaXQuCj4gCj4gU2lnbmVk
LW9mZi1ieTogQ2hlbiBaaG91IDxjaGVuemhvdTEwQGh1YXdlaS5jb20+CgpBY2tlZC1ieTogUnVp
IE1pZ3VlbCBTaWx2YSA8cm1mcmZzQGdtYWlsLmNvbT4KCi0tLS0tLQpDaGVlcnMsCiAgICAgUnVp
Cgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jIHwgMyArKy0KPiAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jIGIvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvbGlnaHQuYwo+IGluZGV4IGQ2YmEyNWYuLmQyNjcyYjYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL2xpZ2h0LmMKPiBAQCAtMTAyNiw3ICsxMDI2LDggQEAgc3RhdGljIGludCBnYl9saWdodHNf
bGlnaHRfY29uZmlnKHN0cnVjdCBnYl9saWdodHMgKmdsaWdodHMsIHU4IGlkKQo+ICAKPiAgCWxp
Z2h0LT5jaGFubmVsc19jb3VudCA9IGNvbmYuY2hhbm5lbF9jb3VudDsKPiAgCWxpZ2h0LT5uYW1l
ID0ga3N0cm5kdXAoY29uZi5uYW1lLCBOQU1FU19NQVgsIEdGUF9LRVJORUwpOwo+IC0KPiArCWlm
ICghbGlnaHQtPm5hbWUpCj4gKwkJcmV0dXJuIC1FTk9NRU07Cj4gIAlsaWdodC0+Y2hhbm5lbHMg
PSBrY2FsbG9jKGxpZ2h0LT5jaGFubmVsc19jb3VudCwKPiAgCQkJCSAgc2l6ZW9mKHN0cnVjdCBn
Yl9jaGFubmVsKSwgR0ZQX0tFUk5FTCk7Cj4gIAlpZiAoIWxpZ2h0LT5jaGFubmVscykKPiAtLSAK
PiAyLjcuNAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
