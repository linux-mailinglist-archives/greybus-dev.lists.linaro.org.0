Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1E9278A75
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Sep 2020 16:10:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D337E664DF
	for <lists+greybus-dev@lfdr.de>; Fri, 25 Sep 2020 14:10:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BF04766519; Fri, 25 Sep 2020 14:10:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 698FC66529;
	Fri, 25 Sep 2020 14:09:47 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D1258616DC
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 14:09:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C4BE966519; Fri, 25 Sep 2020 14:09:43 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by lists.linaro.org (Postfix) with ESMTPS id A0886616DC
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 14:09:41 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id u24so2704020pgi.1
 for <greybus-dev@lists.linaro.org>; Fri, 25 Sep 2020 07:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=0g8As1BPIW+mxp09I9Q/3/lncjQOHPnfpBrzGk+edKs=;
 b=RsncI7p1+9G9pYTCoHdldBOj2JCaJxqNUPKJQZl60NR6kbBdaJWokaYB8uTWQuvaqf
 yUTaWwXy6Q9KnWAysb4q1ZAprSXVjucJszIyAAUT/i0zf04ttEeAS1rIgoFwlSvIWEQe
 gwZWXq8C/IRjHuyuWnB/bE1eJeo7ULJEWeOSEGpuPnjKrDaYwNX4CSHA26o807LoGVKL
 22WOBouvdpStOTPnjDLFJbQIZn7yJq6n0x3KnxfjMy/OHhtSqwB/qNxlzbYYlObElstb
 8NauhrH2TwgzcVj08btsEqVnDEemA7M50dChG9Cn8arF/Q2QIBiCs7+DicubE7nPMTP/
 9atA==
X-Gm-Message-State: AOAM533t8YQOOf10l6C+I3W8CGTs0lYMACyGrRW+qTsBIHFGfgQZY0X6
 boUwEQ+Syh4PnsaVQijolK8=
X-Google-Smtp-Source: ABdhPJwk68+UWFlYWcCpKkQ8+c+rYqCmlV6pLOaXJQRxXzB9Dulo4yoG8/DhVauFLxz7iyIvFrtHdw==
X-Received: by 2002:a63:c74a:: with SMTP id v10mr207846pgg.240.1601042980847; 
 Fri, 25 Sep 2020 07:09:40 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id a13sm2416696pgq.41.2020.09.25.07.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Sep 2020 07:09:40 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
X-Google-Original-From: Coiby Xu <Coiby.Xu@gmail.com>
Date: Fri, 25 Sep 2020 22:09:30 +0800
To: Alex Elder <elder@linaro.org>
Message-ID: <20200925140930.z6yvqvm6crrq5k3a@Rk>
References: <20200924102039.43895-1-coiby.xu@gmail.com>
 <3fda9226-6f6f-6c5f-aa02-c9047a3d2dce@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3fda9226-6f6f-6c5f-aa02-c9047a3d2dce@linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH 1/3] [PATCH] staging: greybus: fix
 warnings about endianness detected by sparse
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gVGh1LCBTZXAgMjQsIDIwMjAgYXQgMDc6NTA6NTdBTSAtMDUwMCwgQWxleCBFbGRlciB3cm90
ZToKPk9uIDkvMjQvMjAgNToyMCBBTSwgQ29pYnkgWHUgd3JvdGU6Cj4+IFRoaXMgcGF0Y2ggZml4
IHRoZSBmb2xsb3dpbmcgd2FybmluZ3MgZnJvbSBzcGFyc2UsCj4KPllvdSBuZWVkIHRvIGFkZHJl
c3MgR3JlZydzIGNvbW1lbnQuCj4KPkJ1dCBpbiBnZW5lcmFsIHRoaXMgbG9va3MgZ29vZC4gIEkg
aGF2ZSBvbmUgY29tbWVudCBiZWxvdywgd2hpY2gKPnlvdSBjYW4gYWRkcmVzcyBpbiB2Mi4gIElm
IHlvdSAob3Igb3RoZXJzKSBkaXNhZ3JlZSB3aXRoIGl0LCBJJ20KPmZpbmUgd2l0aCB5b3VyIGNv
ZGUgYXMtaXMuICBFaXRoZXIgd2F5LCB5b3UgY2FuIGFkZCB0aGlzOgo+Cj5SZXZpZXdlZC1ieTog
QWxleCBFbGRlciA8ZWxkZXJAbGluYXJvLm9yZz4KClRoYW5rIHlvdSBmb3JlIHJldmlld2luZyB0
aGlzIHBhdGNoIQoKPgo+PiAkIG1ha2UgQz0yIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzLwo+PiBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6IHdhcm5pbmc6IGlu
Y29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5cGVzKQo+PiBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6ICAgIGV4cGVjdGVkIHJl
c3RyaWN0ZWQgX19sZTE2IFt1c2VydHlwZV0gZGF0YV9jcG9ydAo+PiBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb19tb2R1bGUuYzoyMjI6MjU6ICAgIGdvdCB1bnNpZ25lZCBzaG9ydCBbdXNl
cnR5cGVdIGludGZfY3BvcnRfaWQKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9w
b2xvZ3kuYzo0NjA6NDA6IHdhcm5pbmc6IHJlc3RyaWN0ZWQgX19sZTMyIGRlZ3JhZGVzIHRvIGlu
dGVnZXIKPj4gZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYzo2OTE6NDE6
IHdhcm5pbmc6IGluY29ycmVjdCB0eXBlIGluIGFzc2lnbm1lbnQgKGRpZmZlcmVudCBiYXNlIHR5
cGVzKQo+Cj4uIC4gLgo+Cj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
dWRpb190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3ku
Ywo+PiBpbmRleCA4M2IzOGFlODkwOGMuLjU2YmYxYTRmOTVhZCAxMDA2NDQKPj4gLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwo+PiArKysgYi9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb190b3BvbG9neS5jCj4+IEBAIC00NjYsNyArNDY2LDcgQEAgc3Rh
dGljIGludCBnYmNvZGVjX21peGVyX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICpr
Y29udHJvbCwKPj4gIAkJZ290byBleGl0Owo+Pgo+PiAgCS8qIHVwZGF0ZSB1Y29udHJvbCAqLwo+
PiAtCWlmIChnYnZhbHVlLnZhbHVlLmludGVnZXJfdmFsdWVbMF0gIT0gdmFsKSB7Cj4+ICsJaWYg
KGdidmFsdWUudmFsdWUuaW50ZWdlcl92YWx1ZVswXSAhPSBjcHVfdG9fbGUzMih2YWwpKSB7Cj4K
Pkl0J3MgZXF1aXZhbGVudCwgYnV0IEkgaGF2ZSBhIHNtYWxsIHByZWZlcmVuY2UgdG8gY29udmVy
dAo+dGhlIHZhbHVlIGZyb20gZ2J2YWx1ZSBpbnRvIENQVSBieXRlIG9yZGVyIHJhdGhlciB0aGFu
Cj53aGF0IHlvdSBoYXZlIGhlcmUuCgpUaGFuayB5b3UgZm9yIHRoZSBzdWdnZXN0aW9uISBJJ2xs
IHVzZSBDUFUgYnl0ZSBvcmRlciB3aGVuIHN1Ym1pdHRpbmcKbmV4dCB2ZXJzaW9uLgo+Cj4+ICAJ
CWZvciAod2kgPSAwOyB3aSA8IHdsaXN0LT5udW1fd2lkZ2V0czsgd2krKykgewo+PiAgCQkJd2lk
Z2V0ID0gd2xpc3QtPndpZGdldHNbd2ldOwo+PiAgCQkJc25kX3NvY19kYXBtX21peGVyX3VwZGF0
ZV9wb3dlcih3aWRnZXQtPmRhcG0sIGtjb250cm9sLAo+PiBAQCAtNjg5LDcgKzY4OSw3IEBAIHN0
YXRpYyBpbnQgZ2JhdWRpb190cGxnX2NyZWF0ZV9rY29udHJvbChzdHJ1Y3QgZ2JhdWRpb19tb2R1
bGVfaW5mbyAqZ2IsCj4+ICAJCQkJcmV0dXJuIC1FTk9NRU07Cj4+ICAJCQljdGxkYXRhLT5jdGxf
aWQgPSBjdGwtPmlkOwo+PiAgCQkJY3RsZGF0YS0+ZGF0YV9jcG9ydCA9IGxlMTZfdG9fY3B1KGN0
bC0+ZGF0YV9jcG9ydCk7Cj4+IC0JCQljdGxkYXRhLT5hY2Nlc3MgPSBjdGwtPmFjY2VzczsKPj4g
KwkJCWN0bGRhdGEtPmFjY2VzcyA9IGxlMzJfdG9fY3B1KGN0bC0+YWNjZXNzKTsKPj4gIAkJCWN0
bGRhdGEtPnZjb3VudCA9IGN0bC0+Y291bnRfdmFsdWVzOwo+PiAgCQkJY3RsZGF0YS0+aW5mbyA9
ICZjdGwtPmluZm87Cj4+ICAJCQkqa2N0bCA9IChzdHJ1Y3Qgc25kX2tjb250cm9sX25ldykKPj4g
QEAgLTc0NCwxMCArNzQ0LDEwIEBAIHN0YXRpYyBpbnQgZ2Jjb2RlY19lbnVtX2RhcG1fY3RsX2dl
dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJvbCwKPj4gIAkJcmV0dXJuIHJldDsKPj4gIAl9
Cj4+Cj4+IC0JdWNvbnRyb2wtPnZhbHVlLmVudW1lcmF0ZWQuaXRlbVswXSA9IGdidmFsdWUudmFs
dWUuZW51bWVyYXRlZF9pdGVtWzBdOwo+PiArCXVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0
ZW1bMF0gPSBsZTMyX3RvX2NwdShnYnZhbHVlLnZhbHVlLmVudW1lcmF0ZWRfaXRlbVswXSk7Cj4+
ICAJaWYgKGUtPnNoaWZ0X2wgIT0gZS0+c2hpZnRfcikKPj4gIAkJdWNvbnRyb2wtPnZhbHVlLmVu
dW1lcmF0ZWQuaXRlbVsxXSA9Cj4+IC0JCQlnYnZhbHVlLnZhbHVlLmVudW1lcmF0ZWRfaXRlbVsx
XTsKPj4gKwkJCWxlMzJfdG9fY3B1KGdidmFsdWUudmFsdWUuZW51bWVyYXRlZF9pdGVtWzFdKTsK
Pj4KPj4gIAlyZXR1cm4gMDsKPj4gIH0KPj4gQEAgLTgwMSwxMCArODAxLDEwIEBAIHN0YXRpYyBp
bnQgZ2Jjb2RlY19lbnVtX2RhcG1fY3RsX3B1dChzdHJ1Y3Qgc25kX2tjb250cm9sICprY29udHJv
bCwKPj4gIAltYXNrID0gZS0+bWFzayA8PCBlLT5zaGlmdF9sOwo+Pgo+PiAgCWlmIChnYnZhbHVl
LnZhbHVlLmVudW1lcmF0ZWRfaXRlbVswXSAhPQo+PiAtCSAgICB1Y29udHJvbC0+dmFsdWUuZW51
bWVyYXRlZC5pdGVtWzBdKSB7Cj4+ICsJICAgIGNwdV90b19sZTMyKHVjb250cm9sLT52YWx1ZS5l
bnVtZXJhdGVkLml0ZW1bMF0pKSB7Cj4+ICAJCWNoYW5nZSA9IDE7Cj4+ICAJCWdidmFsdWUudmFs
dWUuZW51bWVyYXRlZF9pdGVtWzBdID0KPj4gLQkJCXVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVk
Lml0ZW1bMF07Cj4+ICsJCQljcHVfdG9fbGUzMih1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5p
dGVtWzBdKTsKPj4gIAl9Cj4+Cj4+ICAJaWYgKGUtPnNoaWZ0X2wgIT0gZS0+c2hpZnRfcikgewo+
PiBAQCAtODEzLDEwICs4MTMsMTAgQEAgc3RhdGljIGludCBnYmNvZGVjX2VudW1fZGFwbV9jdGxf
cHV0KHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAo+PiAgCQl2YWwgfD0gdWNvbnRyb2wt
PnZhbHVlLmVudW1lcmF0ZWQuaXRlbVsxXSA8PCBlLT5zaGlmdF9yOwo+PiAgCQltYXNrIHw9IGUt
Pm1hc2sgPDwgZS0+c2hpZnRfcjsKPj4gIAkJaWYgKGdidmFsdWUudmFsdWUuZW51bWVyYXRlZF9p
dGVtWzFdICE9Cj4+IC0JCSAgICB1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzFdKSB7
Cj4+ICsJCSAgICBjcHVfdG9fbGUzMih1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzFd
KSkgewo+PiAgCQkJY2hhbmdlID0gMTsKPj4gIAkJCWdidmFsdWUudmFsdWUuZW51bWVyYXRlZF9p
dGVtWzFdID0KPj4gLQkJCQl1Y29udHJvbC0+dmFsdWUuZW51bWVyYXRlZC5pdGVtWzFdOwo+PiAr
CQkJCWNwdV90b19sZTMyKHVjb250cm9sLT52YWx1ZS5lbnVtZXJhdGVkLml0ZW1bMV0pOwo+PiAg
CQl9Cj4+ICAJfQo+Pgo+PiBAQCAtODg3LDcgKzg4Nyw3IEBAIHN0YXRpYyBpbnQgZ2JhdWRpb190
cGxnX2NyZWF0ZV9taXhlcl9jdGwoc3RydWN0IGdiYXVkaW9fbW9kdWxlX2luZm8gKmdiLAo+PiAg
CQlyZXR1cm4gLUVOT01FTTsKPj4gIAljdGxkYXRhLT5jdGxfaWQgPSBjdGwtPmlkOwo+PiAgCWN0
bGRhdGEtPmRhdGFfY3BvcnQgPSBsZTE2X3RvX2NwdShjdGwtPmRhdGFfY3BvcnQpOwo+PiAtCWN0
bGRhdGEtPmFjY2VzcyA9IGN0bC0+YWNjZXNzOwo+PiArCWN0bGRhdGEtPmFjY2VzcyA9IGxlMzJf
dG9fY3B1KGN0bC0+YWNjZXNzKTsKPj4gIAljdGxkYXRhLT52Y291bnQgPSBjdGwtPmNvdW50X3Zh
bHVlczsKPj4gIAljdGxkYXRhLT5pbmZvID0gJmN0bC0+aW5mbzsKPj4gIAkqa2N0bCA9IChzdHJ1
Y3Qgc25kX2tjb250cm9sX25ldykKPj4KPgoKLS0KQmVzdCByZWdhcmRzLApDb2lieQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
