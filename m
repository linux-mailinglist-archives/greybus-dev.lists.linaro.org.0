Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B218EAE0
	for <lists+greybus-dev@lfdr.de>; Sun, 22 Mar 2020 18:31:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 847F26602C
	for <lists+greybus-dev@lfdr.de>; Sun, 22 Mar 2020 17:31:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7722166031; Sun, 22 Mar 2020 17:31:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 203526602D;
	Sun, 22 Mar 2020 17:30:54 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 73FBE66012
 for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2020 17:30:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 67C8C6602C; Sun, 22 Mar 2020 17:30:52 +0000 (UTC)
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
 [209.85.215.195])
 by lists.linaro.org (Postfix) with ESMTPS id 8756A66012
 for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2020 17:30:51 +0000 (UTC)
Received: by mail-pg1-f195.google.com with SMTP id d17so5355586pgo.0
 for <greybus-dev@lists.linaro.org>; Sun, 22 Mar 2020 10:30:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=4ZoVQ1c9ycCJ8Gj1lfk5UAo2vuQPMTOZvWhGMpvKEUE=;
 b=ZAl+DprU06mJGmxpbhixcj5PYEcqFYtp5hrClcWVoQDhYP2TDUgHkjGZQQ+vlX8kJD
 mPEbMykMLi7T/ALc320EGgwH9dFsY3XrEr0ryT/en942vyuwwdoKAQvwLqcZ81mLNlcH
 Z3opXNhtSFyj/Ns9PnmWBBgbSVMEQccjY4kryCkdJoCn+jWeoIMvynfBjmgVeV1NeI8t
 yCdFnjNE5ihw7JlgfJmja8JE/dInGGk0JfJzzKdw27VI+Bvn1/AoYIER51sIX7QKLpjL
 KrWXMXtWONdSLdKfcQAAu3ikjzjhG6L83JnabK2Dp9gjVg2NvuZXooJIERcIsxvR3zZN
 NXFQ==
X-Gm-Message-State: ANhLgQ3LdJVb3pr7Tvd9R3OfxTnflhIwEcAQ/CUTLkWk48hvf9c7I8Sw
 zzW7+CKb8w/hDvs32kP2Fzg=
X-Google-Smtp-Source: ADFU+vsc9Fkdk9zntgPTPaN31WhDeuT4qIt/2hez13I2SE6xGSsiXmMfBlFOK/tcmzJE/O3ONSjnoA==
X-Received: by 2002:a62:6244:: with SMTP id w65mr20692876pfb.89.1584898250652; 
 Sun, 22 Mar 2020 10:30:50 -0700 (PDT)
Received: from simran-Inspiron-5558 ([14.139.82.6])
 by smtp.gmail.com with ESMTPSA id f64sm11732499pfb.72.2020.03.22.10.30.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Mar 2020 10:30:49 -0700 (PDT)
Date: Sun, 22 Mar 2020 23:00:45 +0530
From: Simran Singhal <singhalsimran0@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org,
 outreachy-kernel <outreachy-kernel@googlegroups.com>
Message-ID: <20200322173045.GA24700@simran-Inspiron-5558>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP
Subject: [greybus-dev] [PATCH] staging: greybus: tools: Fix braces {} style
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

VGhpcyBwYXRjaCBmaXhlcyB0aGUgY2hlY2sgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaC5wbApmb3Ig
YnJhY2VzIHt9IHNob3VsZCBiZSB1c2VkIG9uIGFsbCBhcm1zIG9mIHRoaXMgc3RhdGVtZW50LgoK
U2lnbmVkLW9mZi1ieTogU2ltcmFuIFNpbmdoYWwgPHNpbmdoYWxzaW1yYW4wQGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwppbmRleCBiYTZmOTA1
ZjI2ZmEuLmQ0NjcyMTUwMjg5NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
dG9vbHMvbG9vcGJhY2tfdGVzdC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xz
L2xvb3BiYWNrX3Rlc3QuYwpAQCAtODAxLDggKzgwMSw5IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVf
ZGV2aWNlcyhzdHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKIAkJCXdyaXRlX3N5c2ZzX3ZhbCh0LT5k
ZXZpY2VzW2ldLnN5c2ZzX2VudHJ5LAogCQkJCQkib3V0c3RhbmRpbmdfb3BlcmF0aW9uc19tYXgi
LAogCQkJCQl0LT5hc3luY19vdXRzdGFuZGluZ19vcGVyYXRpb25zKTsKLQkJfSBlbHNlCisJCX0g
ZWxzZSB7CiAJCQl3cml0ZV9zeXNmc192YWwodC0+ZGV2aWNlc1tpXS5zeXNmc19lbnRyeSwgImFz
eW5jIiwgMCk7CisJCX0KIAl9CiB9CiAKLS0gCjIuMTcuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
