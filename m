Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C5425E786
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Sep 2020 14:27:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F33526676A
	for <lists+greybus-dev@lfdr.de>; Sat,  5 Sep 2020 12:27:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E36DF6677B; Sat,  5 Sep 2020 12:27:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 113F966774;
	Sat,  5 Sep 2020 12:27:27 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C091B6675B
 for <greybus-dev@lists.linaro.org>; Sat,  5 Sep 2020 12:27:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A5AB96676A; Sat,  5 Sep 2020 12:27:25 +0000 (UTC)
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
 [209.85.208.195])
 by lists.linaro.org (Postfix) with ESMTPS id 73B3F6675B
 for <greybus-dev@lists.linaro.org>; Sat,  5 Sep 2020 12:27:24 +0000 (UTC)
Received: by mail-lj1-f195.google.com with SMTP id v23so11005927ljd.1
 for <greybus-dev@lists.linaro.org>; Sat, 05 Sep 2020 05:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=fp3c+EfwcSP/OW5FRCR7PDs50Mjf6gw6tEQauCbrrrM=;
 b=cFfqu7tdIC8XCZYhX5ropbf816qy7L0HFH8nToaui8GsGw9a1JjOdwygwZtUmVfJ6E
 IY1SySoEHZKkykGx0M6b5naMDMh1cBUzZFsF16guqkDOY3NxND6jl4hYmtW+1nX0xN9I
 RK4cEiaf9JoPK3QhM6J/q5cD56b09V16ywm2Rn0lwX49KKtnlwOPvSVGAHOtG9tBWzhd
 aVf9n0ozt8SYXdKtbKrcNQZD7sYmhawEdQYzySD3g+BiQ9SRcpU1Jk73QP0hRmZbiqN8
 i3PbV4+O2tbInfVp0eaez836RiFBinv7TfCtrb3qOM19nRsTdlAD+7HECPHGoZXf3+Q/
 DCiQ==
X-Gm-Message-State: AOAM53137nJvpzkkaXvKa3cxLpeiRZfaA3wvuJACEBMy3XIrURD6hq07
 ov1vd6yUQIYnvTL0yi+vzBk=
X-Google-Smtp-Source: ABdhPJw6kFSNuoSHfqGcep3yNEb14EtQ2b6LiESFW7gu3fJwshWYHimCyzrMGietbSCpJUoCMJ5gKw==
X-Received: by 2002:a2e:b4ba:: with SMTP id q26mr5491031ljm.79.1599308843268; 
 Sat, 05 Sep 2020 05:27:23 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.174.190])
 by smtp.gmail.com with ESMTPSA id m15sm1996477ljh.62.2020.09.05.05.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Sep 2020 05:27:22 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kEXHr-0007Hx-FI; Sat, 05 Sep 2020 14:27:19 +0200
Date: Sat, 5 Sep 2020 14:27:19 +0200
From: Johan Hovold <johan@kernel.org>
To: Ye Bin <yebin10@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20200905122719.GW21288@localhost>
References: <20200903015742.308765-1-yebin10@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903015742.308765-1-yebin10@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: elder@kernel.org, johan@kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] staging: greybus: Fix NULL ptr reference
 in gb_bootrom_get_firmware
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

T24gVGh1LCBTZXAgMDMsIDIwMjAgYXQgMDk6NTc6NDJBTSArMDgwMCwgWWUgQmluIHdyb3RlOgo+
IEluIGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlIGZ1bnRpb24gZncgbWF5YmUgbnVsbCwgd2UgbXVz
dCB0ZXN0IGl0IGJlZm9yZQo+IHVzZSBpdC4KCk5vLCBmdyB3aWxsIG5ldmVyIGJlIE5VTEwgd2hl
biByZXQgaXMgemVybyBzbyB0aGUgY3VycmVudCBjb2RlIGlzCmNvcnJlY3QuCgpHcmVnLCBwbGVh
c2UgZHJvcCB0aGlzIG9uZSBmcm9tIHlvdXIgdGVzdGluZyBicmFuY2guCgo+IFNpZ25lZC1vZmYt
Ynk6IFllIEJpbiA8eWViaW4xMEBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9ib290cm9tLmMgfCAyICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgMSBkZWxldGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9ib290cm9tLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMKPiBpbmRleCBh
OGVmYjg2ZGUxNDAuLmUxNTczYTVmZWJmMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9ib290cm9tLmMKPiArKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9t
LmMKPiBAQCAtMjk4LDcgKzI5OCw3IEBAIHN0YXRpYyBpbnQgZ2JfYm9vdHJvbV9nZXRfZmlybXdh
cmUoc3RydWN0IGdiX29wZXJhdGlvbiAqb3ApCj4gIAo+ICBxdWV1ZV93b3JrOgo+ICAJLyogUmVm
cmVzaCB0aW1lb3V0ICovCj4gLQlpZiAoIXJldCAmJiAob2Zmc2V0ICsgc2l6ZSA9PSBmdy0+c2l6
ZSkpCj4gKwlpZiAoIXJldCAmJiBmdyAmJiAob2Zmc2V0ICsgc2l6ZSA9PSBmdy0+c2l6ZSkpCj4g
IAkJbmV4dF9yZXF1ZXN0ID0gTkVYVF9SRVFfUkVBRFlfVE9fQk9PVDsKPiAgCWVsc2UKPiAgCQlu
ZXh0X3JlcXVlc3QgPSBORVhUX1JFUV9HRVRfRklSTVdBUkU7CgpKb2hhbgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
