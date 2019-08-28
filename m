Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 03168A02FD
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 15:16:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1A6CE617F1
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 13:16:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0C0966162E; Wed, 28 Aug 2019 13:16:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 281B9617E7;
	Wed, 28 Aug 2019 13:16:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 90B566088F
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 13:16:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7E9766162E; Wed, 28 Aug 2019 13:16:33 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by lists.linaro.org (Postfix) with ESMTPS id 532476088F
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 13:16:32 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id z21so2152879lfe.1
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 06:16:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8gkg8AyrMQ7zRIAJQTyGmu2XIwtEpflTp13b6P2wFnA=;
 b=ThloM50fS1LL7wLP7Cp7X0Bh1Ru+gMJ6XZIV22Mb5odcmMmhF9QGDP8y1GTdyIkG2i
 Gktwgh7l/VbiKvfDtPJbXVcJHnIMTpBpF/NSmrvYC3xOQpFFwaf0xPQK5+NReCem75ZL
 HJf/lqxHdocLx54WkW3pn56P7CyZTuXVK7Y59ADWmQow/PwcU3YvPT+2AKJJxfXY2rn8
 PqcoO6TebI1MMuc8Ap+MSCdtWgoIoVkDR099LiNJAtwOUEAIjCFbA3cxwSVBDFn5+bvV
 alK5xYfMubBfIPSyIGUf3Jd70MF1EwPbBVVD0I8+3WuwPr8yBVNg4EqNeoOIbmPZpARo
 EiGA==
X-Gm-Message-State: APjAAAXg7etgtvJEYieymLtwipVHTthytg4MD/k74f375d28r3JDjbS5
 KM4CJdOYhAjYaIKHVqzUXNo=
X-Google-Smtp-Source: APXvYqy9SbKWqCM+LP95NcWikOcdDzVHK9f11OhcPiI7ZYQ/XGenRPoSeL27K+qoM6V6AuJK8vgXQQ==
X-Received: by 2002:ac2:42cc:: with SMTP id n12mr2669705lfl.47.1566998191244; 
 Wed, 28 Aug 2019 06:16:31 -0700 (PDT)
Received: from xi.terra (c-51f1e055.07-184-6d6c6d4.bbcust.telenor.se.
 [85.224.241.81])
 by smtp.gmail.com with ESMTPSA id t66sm598650lje.66.2019.08.28.06.16.30
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 28 Aug 2019 06:16:30 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
 (envelope-from <johan@kernel.org>)
 id 1i2xoI-0005cy-Oa; Wed, 28 Aug 2019 15:16:27 +0200
Date: Wed, 28 Aug 2019 15:16:26 +0200
From: Johan Hovold <johan@kernel.org>
To: Rui Miguel Silva <rui.silva@linaro.org>
Message-ID: <20190828131626.GF13017@localhost>
References: <20190828124825.20800-1-rui.silva@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190828124825.20800-1-rui.silva@linaro.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 kbuild test robot <lkp@intel.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [greybus-dev] [PATCH v2] staging: greybus: fix more header
	declarations
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

T24gV2VkLCBBdWcgMjgsIDIwMTkgYXQgMDE6NDg6MjVQTSArMDEwMCwgUnVpIE1pZ3VlbCBTaWx2
YSB3cm90ZToKPiBNb3JlIGhlYWRlcnMgbmVlZGVkIHRvIGJlIGZpeGVkIHdoZW4gbW92aW5nIGdy
ZXlidXMgb3V0IG9mIHN0YWdpbmcgYW5kCj4gZW5hYmxpbmcgdGhlIENPTVBJTEVfVEVTVCBvcHRp
b24uCj4gCj4gQWRkIGZvcndhcmQgZGVjbGFyYXRpb25zIGZvciB0aGUgbmVlZGVkIHN0cnVjdHVy
ZXMuCj4gCj4gUmVwb3J0ZWQtYnk6IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgo+
IFNpZ25lZC1vZmYtYnk6IFJ1aSBNaWd1ZWwgU2lsdmEgPHJ1aS5zaWx2YUBsaW5hcm8ub3JnPgo+
IC0tLQo+IHYxLT52MjoKPiBKb2hhbiBIb3ZvbGQ6Cj4gICAtIHVzZSBmb3J3YXJkIGRlY2xhcmF0
aW9ucyBpbnN0ZWFkIGluY2x1ZGluZyBhbGwgaGVhZGVycwoKUmV2aWV3ZWQtYnk6IEpvaGFuIEhv
dm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KCj4gIGluY2x1ZGUvbGludXgvZ3JleWJ1cy9vcGVyYXRp
b24uaCB8IDIgKy0KPiAgaW5jbHVkZS9saW51eC9ncmV5YnVzL3N2Yy5oICAgICAgIHwgMiArKwo+
ICAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmggYi9pbmNsdWRlL2xp
bnV4L2dyZXlidXMvb3BlcmF0aW9uLmgKPiBpbmRleCA4Y2E4NjRiYmEyM2UuLmNiOGU0ZWY0NTIy
MiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgKPiArKysg
Yi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgKPiBAQCAtMTUsNyArMTUsNyBAQAo+
ICAjaW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3dvcmtxdWV1ZS5o
Pgo+ICAKPiAtCj4gK3N0cnVjdCBnYl9ob3N0X2RldmljZTsKPiAgc3RydWN0IGdiX29wZXJhdGlv
bjsKPiAgCj4gIC8qIFRoZSBkZWZhdWx0IGFtb3VudCBvZiB0aW1lIGEgcmVxdWVzdCBpcyBnaXZl
biB0byBjb21wbGV0ZSAqLwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3Zj
LmggYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKPiBpbmRleCA1MDdmOGJkNGU0YzguLjVh
ZmFmNWYwNjg1NiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKPiAr
KysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKPiBAQCAtMTIsNiArMTIsOCBAQAo+ICAj
aW5jbHVkZSA8bGludXgvdHlwZXMuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgo+ICAK
PiArc3RydWN0IGdiX3N2Y19sMl90aW1lcl9jZmc7Cj4gKwo+ICAjZGVmaW5lIEdCX1NWQ19DUE9S
VF9GTEFHX0UyRUZDCQlCSVQoMCkKPiAgI2RlZmluZSBHQl9TVkNfQ1BPUlRfRkxBR19DU0RfTgkJ
QklUKDEpCj4gICNkZWZpbmUgR0JfU1ZDX0NQT1JUX0ZMQUdfQ1NWX04JCUJJVCgyKQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
