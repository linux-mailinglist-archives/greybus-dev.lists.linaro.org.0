Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1D0348E5A
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Mar 2021 11:52:16 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 200F26670E
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Mar 2021 10:52:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1334566713; Thu, 25 Mar 2021 10:52:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4417D66716;
	Thu, 25 Mar 2021 10:52:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 87B136670E
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 10:51:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7A4ED66713; Thu, 25 Mar 2021 10:51:59 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by lists.linaro.org (Postfix) with ESMTPS id 460EF6670E
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 10:51:58 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id s21so879063pjq.1
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 03:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WDOizguRq8drFQk38ZzODxVZB2x4EMxsWev3Revxw0Y=;
 b=QKoxeLIcNEbmJw8NYkOJJZGBkgU6dSBYMSU/vTa6FTz4NyLAKAlP+19vy4nhP7eD2C
 pXPmahJEc5W0xoqyWbS9w3vBCSxOmoP/cmDDPF6Zh7nXrgCgIjnWRe6Yf9q4hDxE03NO
 CB1rXjVRVWFOEhEY22FDZCY2/nmjkvPG+PPpO4RAdRgc3FJD3wcxMJN+laagEj82w4dU
 4UzeyajUleBnDB7w5wwH3qfoU16FCz7gxO5zH7O7bv3WssmVcej0dEX2YmNtsYRjuMnB
 vuqm3FQ14oqwO69/lILE+ypmwKkxvv211DL2tSMh1R4VaUaIsxPnhXKeLSBEM+jEDdiT
 uwNg==
X-Gm-Message-State: AOAM5337pPLzm9fqT2vRb6GjPduatHEaSKA4ydP4+VevMzq+mQIQrbbD
 OaXOKFQXoDA8t9Cg2fOyB/Bh78TQ
X-Google-Smtp-Source: ABdhPJzJ88HGwhjdHY9GCeoUb+nzbyyDI7PQS65b0tAaHdH75UzKxuxTPXW/sj/RZBXVjkKpy4Cz2A==
X-Received: by 2002:a17:90a:a96:: with SMTP id
 22mr8391016pjw.200.1616669517416; 
 Thu, 25 Mar 2021 03:51:57 -0700 (PDT)
Received: from localhost ([122.172.6.13])
 by smtp.gmail.com with ESMTPSA id p1sm5409324pfn.22.2021.03.25.03.51.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 25 Mar 2021 03:51:57 -0700 (PDT)
Date: Thu, 25 Mar 2021 16:21:55 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Jian Dong <dj0227@163.com>
Message-ID: <20210325105155.c52zc7mswoh33yjz@vireshk-i7>
References: <1616667566-58997-1-git-send-email-dj0227@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616667566-58997-1-git-send-email-dj0227@163.com>
User-Agent: NeoMutt/20180716-391-311a52
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, vireshk@kernel.org,
 johan@kernel.org, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 huyue2@yulong.com, Jian Dong <dongjian@yulong.com>
Subject: Re: [greybus-dev] [PATCH] staging: greybus: fix fw is NULL but
	dereferenced
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

T24gMjUtMDMtMjEsIDE4OjE5LCBKaWFuIERvbmcgd3JvdGU6Cj4gRnJvbTogSmlhbiBEb25nIDxk
b25namlhbkB5dWxvbmcuY29tPgo+IAo+ICBmaXhlcyBjb2NjaWNoZWNrIEVycm9yOgo+IAo+ICBk
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmM6MzAxOjQxLTQ1OiBFUlJPUjoKPiAgZncg
aXMgTlVMTCBidXQgZGVyZWZlcmVuY2VkLgo+IAo+ICBpZiBwcm9jZWR1cmUgZ290byBsYWJlbCBk
aXJlY3RseSwgcmV0IHdpbGwgYmUgbmVmYXRpdmUsIHNvIHRoZSBmdyBpcyBOVUxMCj4gIGFuZCB0
aGUgaWYoY29uZGl0aW9uKSBlbmQgd2l0aCBkZXJlZmVyZW5jZWQgZncuIGxldCdzIGZpeCBpdC4K
Ck5vLCBmdyBpcyBhY2Nlc3NlZCBvbmx5IGZvciAhcmV0IGNhc2UuCgo+IFNpZ25lZC1vZmYtYnk6
IEppYW4gRG9uZyA8ZG9uZ2ppYW5AeXVsb25nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYm9vdHJvbS5jIHwgOCArKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9ib290cm9tLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMK
PiBpbmRleCBhOGVmYjg2Li4wNDM5ZWZhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2Jvb3Ryb20uYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20u
Ywo+IEBAIC0yNDYsNyArMjQ2LDcgQEAgc3RhdGljIGludCBnYl9ib290cm9tX2dldF9maXJtd2Fy
ZShzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcCkKPiAgCXN0cnVjdCBnYl9ib290cm9tX2dldF9maXJt
d2FyZV9yZXNwb25zZSAqZmlybXdhcmVfcmVzcG9uc2U7Cj4gIAlzdHJ1Y3QgZGV2aWNlICpkZXYg
PSAmb3AtPmNvbm5lY3Rpb24tPmJ1bmRsZS0+ZGV2Owo+ICAJdW5zaWduZWQgaW50IG9mZnNldCwg
c2l6ZTsKPiAtCWVudW0gbmV4dF9yZXF1ZXN0X3R5cGUgbmV4dF9yZXF1ZXN0Owo+ICsJZW51bSBu
ZXh0X3JlcXVlc3RfdHlwZSBuZXh0X3JlcXVlc3QgPSBORVhUX1JFUV9HRVRfRklSTVdBUkU7Cj4g
IAlpbnQgcmV0ID0gMDsKPiAgCj4gIAkvKiBEaXNhYmxlIHRpbWVvdXRzICovCj4gQEAgLTI5OCwx
MCArMjk4LDEwIEBAIHN0YXRpYyBpbnQgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmUoc3RydWN0IGdi
X29wZXJhdGlvbiAqb3ApCj4gIAo+ICBxdWV1ZV93b3JrOgo+ICAJLyogUmVmcmVzaCB0aW1lb3V0
ICovCj4gLQlpZiAoIXJldCAmJiAob2Zmc2V0ICsgc2l6ZSA9PSBmdy0+c2l6ZSkpCj4gLQkJbmV4
dF9yZXF1ZXN0ID0gTkVYVF9SRVFfUkVBRFlfVE9fQk9PVDsKPiAtCWVsc2UKPiArCWlmICghIXJl
dCkKPiAgCQluZXh0X3JlcXVlc3QgPSBORVhUX1JFUV9HRVRfRklSTVdBUkU7Cj4gKwllbHNlIGlm
IChvZmZzZXQgKyBzaXplID09IGZ3LT5zaXplKQo+ICsJCW5leHRfcmVxdWVzdCA9IE5FWFRfUkVR
X1JFQURZX1RPX0JPT1Q7Cj4gIAo+ICAJZ2JfYm9vdHJvbV9zZXRfdGltZW91dChib290cm9tLCBu
ZXh0X3JlcXVlc3QsIE5FWFRfUkVRX1RJTUVPVVRfTVMpOwoKVGhlIGNvZGUgaXMgZmluZSBBRkFJ
Q1QsIHRoZSBjb2NjaWNoZWNrIGlzIGJ1Z2d5IGFzIGl0IGlzIGRldGVjdGluZyBhCmJ1ZyBoZXJl
LgoKLS0gCnZpcmVzaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9y
ZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
