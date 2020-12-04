Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 933B42CEC56
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Dec 2020 11:40:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 993B7617DA
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Dec 2020 10:40:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 82F396248D; Fri,  4 Dec 2020 10:40:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22621666F6;
	Fri,  4 Dec 2020 10:40:05 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B258160B02
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 10:39:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A414C6248D; Fri,  4 Dec 2020 10:39:59 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by lists.linaro.org (Postfix) with ESMTPS id 75F3A60B02
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 10:39:58 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id q8so6010525ljc.12
 for <greybus-dev@lists.linaro.org>; Fri, 04 Dec 2020 02:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=hlZCJEKzokNwCxy9PppGO+4osNv7sekOt95QGYGMFIY=;
 b=UH90snEWvSFq7lnlfCOhEOmWrIR1Vn5tsfrGJqiYa/d1aeBeK/uaKuypfZSjsk5H8N
 vjd60srS4gRLn1VGLq2CbIgyeRqiqkOX9riGZ8y4xxypBynFuOoZVm33KLQVvTcArdTj
 ctFLZd5xUEhxP69NxVABcsq7r5OVFv6GAgOVEZY1IPfXOMIwHCpY2y+l9M/PGzNKXifC
 iLgom5/i5P95SQq21veCQnd2U/kFjPXTjBtXyv1K5aIwc4mxJK6VqqbA7NmWM/Vv0Mx8
 ySu4WSZZzSWx10DjoXBqN674rxNQYCOb3qJMpfl0b7iFd+rpietdzegcuzRu4h04nO5K
 QXQQ==
X-Gm-Message-State: AOAM530rogsNc3IHTfkyWjnzvsjKeDPS9y5lzRr/gwx4pj/mFKl+qY4W
 kHQU2VBFLuIphgxuxMyjn4w=
X-Google-Smtp-Source: ABdhPJwJfv10aOeyJIlJZY7U4xVm/2/Apb5jMujh/Ugx1ulLYSPkB2FbOrnNq0jrlcThClHnr5QLnw==
X-Received: by 2002:a05:651c:323:: with SMTP id
 b3mr3029571ljp.452.1607078397416; 
 Fri, 04 Dec 2020 02:39:57 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id m16sm1515838lfa.57.2020.12.04.02.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 02:39:56 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl8Vq-0005Ys-Fa; Fri, 04 Dec 2020 11:40:30 +0100
Date: Fri, 4 Dec 2020 11:40:30 +0100
From: Johan Hovold <johan@kernel.org>
To: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <X8oSHkQZFHCv+Fza@localhost>
References: <20201204021350.28182-1-wanghai38@huawei.com>
 <X8n2CL58pQ/077rQ@localhost>
 <d95dac95-09d0-66bb-4f3b-5ffa154be174@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d95dac95-09d0-66bb-4f3b-5ffa154be174@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, dan.carpenter@oracle.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Add missing
 unlock in gbaudio_dapm_free_controls()
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

T24gRnJpLCBEZWMgMDQsIDIwMjAgYXQgMDU6MTk6MjVQTSArMDgwMCwgd2FuZ2hhaSAoTSkgd3Jv
dGU6Cj4gCj4g5ZyoIDIwMjAvMTIvNCAxNjo0MCwgSm9oYW4gSG92b2xkIOWGmemBkzoKPiA+IE9u
IEZyaSwgRGVjIDA0LCAyMDIwIGF0IDEwOjEzOjUwQU0gKzA4MDAsIFdhbmcgSGFpIHdyb3RlOgo+
ID4+IEFkZCB0aGUgbWlzc2luZyB1bmxvY2sgYmVmb3JlIHJldHVybiBmcm9tIGZ1bmN0aW9uCj4g
Pj4gZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoKSBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgY2Fz
ZS4KPiA+Pgo+ID4+IEZpeGVzOiA1MTBlMzQwZWZlMGMgKCJzdGFnaW5nOiBncmV5YnVzOiBhdWRp
bzogQWRkIGhlbHBlciBBUElzIGZvciBkeW5hbWljIGF1ZGlvIG1vZHVsZSIpCj4gPj4gUmVwb3J0
ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+ID4+IFNpZ25lZC1vZmYtYnk6
IFdhbmcgSGFpIDx3YW5naGFpMzhAaHVhd2VpLmNvbT4KPiA+PiAtLS0KPiA+PiAgIGRyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIHwgMSArCj4gPj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9hdWRpb19oZWxwZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hl
bHBlci5jCj4gPj4gaW5kZXggMjM3NTMxYmE2MGYzLi4yOTM2NzVkYmVhMTAgMTAwNjQ0Cj4gPj4g
LS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMKPiA+PiArKysgYi9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwo+ID4+IEBAIC0xMzUsNiArMTM1
LDcgQEAgaW50IGdiYXVkaW9fZGFwbV9mcmVlX2NvbnRyb2xzKHN0cnVjdCBzbmRfc29jX2RhcG1f
Y29udGV4dCAqZGFwbSwKPiA+PiAgIAkJaWYgKCF3KSB7Cj4gPj4gICAJCQlkZXZfZXJyKGRhcG0t
PmRldiwgIiVzOiB3aWRnZXQgbm90IGZvdW5kXG4iLAo+ID4+ICAgCQkJCXdpZGdldC0+bmFtZSk7
Cj4gPj4gKwkJCW11dGV4X3VubG9jaygmZGFwbS0+Y2FyZC0+ZGFwbV9tdXRleCk7Cj4gPj4gICAJ
CQlyZXR1cm4gLUVJTlZBTDsKPiA+PiAgIAkJfQo+ID4+ICAgCQl3aWRnZXQrKzsKPiA+IFRoaXMg
c3VwZXJmaWNpYWxseSBsb29rcyBjb3JyZWN0LCBidXQgdGhlcmUgc2VlbXMgdG8gYmUgYW5vdGhl
ciBidWcgaW4KPiA+IHRoaXMgZnVuY3Rpb24uIEl0IGNhbiBiZSB1c2VkIGZyZWUgYW4gYXJyYXkg
b2Ygd2lkZ2V0cywgYnV0IGlmIG9uZSBvZgo+ID4gdGhlbSBpc24ndCBmb3VuZCB3ZSBqdXN0IGxl
YWsgdGhlIHJlc3QuIFBlcmhhcHMgdGhhdCByZXR1cm4gc2hvdWxkCj4gPiByYXRoZXIgYmUgIndp
ZGdldCsrOyBjb250aW51ZTsiLgo+ID4KPiBJIHRoaW5rIHRoaXMgaXMgYSBnb29kIGlkZWEsIHNo
b3VsZCBJIHNlbmQgYSB2MiBwYXRjaD8KCkxldCdzIGp1c3Qgd2FpdCBhIGJpdCBhbmQgc2VlIHdo
YXQgVmFpYmhhdiBvciBNYXJrIHNheXMgZmlyc3QuCgpKb2hhbgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3Jl
eWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1h
bi9saXN0aW5mby9ncmV5YnVzLWRldgo=
