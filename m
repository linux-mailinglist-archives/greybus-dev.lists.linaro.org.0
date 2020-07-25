Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 277F122D5CB
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Jul 2020 09:30:05 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 476AA609B5
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Jul 2020 07:30:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3AB77609C0; Sat, 25 Jul 2020 07:30:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9BB75609C5;
	Sat, 25 Jul 2020 07:29:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 30065609A2
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jul 2020 07:29:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1CE95609C0; Sat, 25 Jul 2020 07:29:48 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by lists.linaro.org (Postfix) with ESMTPS id E60BD609A2
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jul 2020 07:29:46 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id h19so12150312ljg.13
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jul 2020 00:29:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NFKiTLk4YQj4CQlqKNPWANcICm1Rabpmzh+rUQVs7dg=;
 b=QhLv0ell6Wecq+59n8MHD8HeXqsOQK1S0y1AtawcZ/VYtrlElmDrbZ6Ac50Sz+HohR
 lnYgKLWhja1ugS920cHAtDtVhY3fSRecDKO9JkQuedO13/w9EXHb0upxhTAPOvxPMhL8
 UDTcWHr8d093rhKEsDOORCSmsCDth7HgoPlGp8o1JQCEb/D46v3bbNwFLktzyYOZQ3Mg
 vZ5aoc/Bs3XXLUHgssAt9jTzc4LZXVYtm3PRA4vBTmQRET1kspq+v+AfJXPubA4IweLi
 HIVQJaPBTspaml9Mdjky7Hkj0NwOelY02wijx8+NgUr4WL038hR0waJPZvY355gGZ6f2
 5jqw==
X-Gm-Message-State: AOAM530UIkfjpBjhM25SRq9we8wfVFcfCNvA3datawFGDN4dVcE2FMXD
 UuUOu5WRNCcZaPj/7RmNINk=
X-Google-Smtp-Source: ABdhPJzpoD92jn7emirtBlyhivTUkCCnZY+Bbfmlt2Mn/k6pRPDuIo0iv/HdUCEAwLL8BnvDkPy2LA==
X-Received: by 2002:a2e:864b:: with SMTP id i11mr5746421ljj.64.1595662185716; 
 Sat, 25 Jul 2020 00:29:45 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id n29sm1158278lfi.9.2020.07.25.00.29.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Jul 2020 00:29:44 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1jzEci-0008MI-7r; Sat, 25 Jul 2020 09:29:36 +0200
Date: Sat, 25 Jul 2020 09:29:36 +0200
From: Johan Hovold <johan@kernel.org>
To: Li Heng <liheng40@huawei.com>
Message-ID: <20200725072936.GQ3634@localhost>
References: <1595646397-53868-1-git-send-email-liheng40@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1595646397-53868-1-git-send-email-liheng40@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, johan@kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] svc: add missed destroy_workqueue when
 gb_svc_create fails
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

T24gU2F0LCBKdWwgMjUsIDIwMjAgYXQgMTE6MDY6MzdBTSArMDgwMCwgTGkgSGVuZyB3cm90ZToK
PiBkZXN0cm95X3dvcmtxdWV1ZSgpIHNob3VsZCBiZSBjYWxsZWQgdG8gZGVzdHJveSBzdmMtPndx
Cj4gd2hlbiBnYl9zdmNfY3JlYXRlKCkgaW5pdCByZXNvdXJjZXMgZmFpbHMuCj4gCj4gRml4ZXM6
IDg0NjVkZWY0OTljNyAoInN0YWdpbmc6IGdyZXlidXM6IG1vdmUgdGhlIGdyZXlidXMgY29yZSB0
byBkcml2ZXJzL2dyZXlidXMiKQo+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVh
d2VpLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBMaSBIZW5nIDxsaWhlbmc0MEBodWF3ZWkuY29tPgo+
IC0tLQo+ICBkcml2ZXJzL2dyZXlidXMvc3ZjLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9zdmMuYyBiL2Ry
aXZlcnMvZ3JleWJ1cy9zdmMuYwo+IGluZGV4IGNlNzc0MGUuLjM4Zjg1OGYgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncmV5YnVzL3N2Yy5jCj4gKysrIGIvZHJpdmVycy9ncmV5YnVzL3N2Yy5jCj4g
QEAgLTEzNDAsNiArMTM0MCw3IEBAIHN0cnVjdCBnYl9zdmMgKmdiX3N2Y19jcmVhdGUoc3RydWN0
IGdiX2hvc3RfZGV2aWNlICpoZCkKPiAgCj4gIGVycl9wdXRfZGV2aWNlOgo+ICAJcHV0X2Rldmlj
ZSgmc3ZjLT5kZXYpOwo+ICsJZGVzdHJveV93b3JrcXVldWUoc3ZjLT53cSk7CgpZb3VyIGJvdCBp
cyBicm9rZW47IHRoZSB3b3JrcXVldWUgaXMgcmVsZWFzZWQgaW4gZ2Jfc3ZjX3JlbGVhc2UoKS4g
CgpBbmQgcGxlYXNlIGZpeCB5b3VyIGludGVybmFsIHJldmlldyBwcm9jZXNzIHNvIHRoYXQgeW91
IGNhdGNoIHRoaW5ncwpsaWtlIHRoaXMgYmVmb3JlIHBvc3RpbmcuCgo+ICAJcmV0dXJuIE5VTEw7
Cj4gIH0KCkpvaGFuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3Jn
Cmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
