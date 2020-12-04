Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB8B2CEA02
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Dec 2020 09:40:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CC6DC617DA
	for <lists+greybus-dev@lfdr.de>; Fri,  4 Dec 2020 08:40:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B96D1666E7; Fri,  4 Dec 2020 08:40:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C9876248D;
	Fri,  4 Dec 2020 08:40:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E4BBA60D86
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 08:40:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C81C3617DA; Fri,  4 Dec 2020 08:40:10 +0000 (UTC)
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
 [209.85.208.194])
 by lists.linaro.org (Postfix) with ESMTPS id 8932860D86
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 08:40:09 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id t22so5709175ljk.0
 for <greybus-dev@lists.linaro.org>; Fri, 04 Dec 2020 00:40:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Yiu8+tXTBsSe5C/YobYcYIjj+kze1oiRLa7kn7MZ3yI=;
 b=MArtvIf7H6Kn2SJLofZFXo0QkIVmrj/RMsRT8i+88ZGdMzEfetXL2i6nEYb4p7f0yY
 vEuhz6WiDHfd+HdixzWM2w90ZInMjvhCiXf6CR9N3cvIvGo7rPKjerClT2HjK5/hPAxc
 K7nddugDBVFdGJur5oMPq/dEvscL9wiDmajmfn5MjV+XEX2TYubrOFi53lBSot17Yshv
 UF639msyqJPCsWgebOFDEOCpJdLOlmI4fxEqj9uvAKgu+BCfkqQnFXVks6F92WxLlOOs
 hEVBNV/5LAA293G7gd5p7iR4vuGLBsRdtAfdedsizz4CFxPAkEYpsT1WFMFeCbgBHVVd
 8Shw==
X-Gm-Message-State: AOAM532H5NyrbvkEWs9NAi9YWnHghMb1Q4GBh+l2YEYnecWvC/dkg891
 YPpeiklYnjLPmtoPiPKEDdw=
X-Google-Smtp-Source: ABdhPJwS5qFQ/psaUnmGAsXqz3qI0zifCh+9HilqTaB7ZSeLltQnMtnjfev1SDanVLsQifCMjicNgA==
X-Received: by 2002:a2e:97c1:: with SMTP id m1mr3095064ljj.278.1607071208414; 
 Fri, 04 Dec 2020 00:40:08 -0800 (PST)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id q26sm1444609lfd.260.2020.12.04.00.40.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 00:40:07 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kl6ds-0001aJ-JQ; Fri, 04 Dec 2020 09:40:41 +0100
Date: Fri, 4 Dec 2020 09:40:40 +0100
From: Johan Hovold <johan@kernel.org>
To: Wang Hai <wanghai38@huawei.com>, Vaibhav Agarwal <vaibhav.sr@gmail.com>
Message-ID: <X8n2CL58pQ/077rQ@localhost>
References: <20201204021350.28182-1-wanghai38@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204021350.28182-1-wanghai38@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org, johan@kernel.org,
 aibhav.sr@gmail.com, linux-kernel@vger.kernel.org,
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

T24gRnJpLCBEZWMgMDQsIDIwMjAgYXQgMTA6MTM6NTBBTSArMDgwMCwgV2FuZyBIYWkgd3JvdGU6
Cj4gQWRkIHRoZSBtaXNzaW5nIHVubG9jayBiZWZvcmUgcmV0dXJuIGZyb20gZnVuY3Rpb24KPiBn
YmF1ZGlvX2RhcG1fZnJlZV9jb250cm9scygpIGluIHRoZSBlcnJvciBoYW5kbGluZyBjYXNlLgo+
IAo+IEZpeGVzOiA1MTBlMzQwZWZlMGMgKCJzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogQWRkIGhl
bHBlciBBUElzIGZvciBkeW5hbWljIGF1ZGlvIG1vZHVsZSIpCj4gUmVwb3J0ZWQtYnk6IEh1bGsg
Um9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgSGFpIDx3YW5n
aGFpMzhAaHVhd2VpLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9f
aGVscGVyLmMgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIGIvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMKPiBpbmRleCAyMzc1MzFiYTYwZjMuLjI5
MzY3NWRiZWExMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19o
ZWxwZXIuYwo+ICsrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCj4g
QEAgLTEzNSw2ICsxMzUsNyBAQCBpbnQgZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoc3RydWN0
IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpkYXBtLAo+ICAJCWlmICghdykgewo+ICAJCQlkZXZfZXJy
KGRhcG0tPmRldiwgIiVzOiB3aWRnZXQgbm90IGZvdW5kXG4iLAo+ICAJCQkJd2lkZ2V0LT5uYW1l
KTsKPiArCQkJbXV0ZXhfdW5sb2NrKCZkYXBtLT5jYXJkLT5kYXBtX211dGV4KTsKPiAgCQkJcmV0
dXJuIC1FSU5WQUw7Cj4gIAkJfQo+ICAJCXdpZGdldCsrOwoKVGhpcyBzdXBlcmZpY2lhbGx5IGxv
b2tzIGNvcnJlY3QsIGJ1dCB0aGVyZSBzZWVtcyB0byBiZSBhbm90aGVyIGJ1ZyBpbgp0aGlzIGZ1
bmN0aW9uLiBJdCBjYW4gYmUgdXNlZCBmcmVlIGFuIGFycmF5IG9mIHdpZGdldHMsIGJ1dCBpZiBv
bmUgb2YKdGhlbSBpc24ndCBmb3VuZCB3ZSBqdXN0IGxlYWsgdGhlIHJlc3QuIFBlcmhhcHMgdGhh
dCByZXR1cm4gc2hvdWxkCnJhdGhlciBiZSAid2lkZ2V0Kys7IGNvbnRpbnVlOyIuCgpWYWliaGF2
PwoKSm9oYW4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
