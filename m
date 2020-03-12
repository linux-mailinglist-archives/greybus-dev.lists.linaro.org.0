Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD34182E89
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 12:03:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1F5E60F57
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 11:03:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D55A16105C; Thu, 12 Mar 2020 11:03:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DCB02617EF;
	Thu, 12 Mar 2020 11:03:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 000DA6097D
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E553B60E9E; Thu, 12 Mar 2020 11:02:56 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by lists.linaro.org (Postfix) with ESMTPS id 3EC0360BE7
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:28 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id j17so4413202lfe.7
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 04:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uKBLUr88wbraOZEGa0RYFtyftngjWe+Uqnh/hMum3do=;
 b=WVir9DZN2kbEUEji0wNJcu1lYFaCC3QiigAEyUYzmnkAs0kUgsm6/Xv6c2njUPWXoZ
 v6JdtVMBu9GqPVhFhgXPPYTLnhpyx7MCb2wiM5MLIg68bpmFepY5SzQrRQRtzXXQ0y6Z
 NFPGA7BzI/zz1d9CetQVB0lFpbNpBACRY+P28ld5bpMD1LXCZQTNRz5sCbigtzwaoGjt
 GG9aHNpSI4m7jf1B+GmjwReA5Hb7DmPeV1qlBy0lAaw4ULF3Voro54ZFCl0FxhvBr3RL
 KE3d7t3wUfIU94g+yYrjBwLW/OV4UHufyw4jS+R5aRoslviu1xyCPdz21GM1ibmec6fg
 48aQ==
X-Gm-Message-State: ANhLgQ05pqC7gLrFm2+3bn/XVlJgGx2q7RZPWCjuWsycBwcYvhlQa+64
 99IkkzHbLmu7M5GYfAXfy0g=
X-Google-Smtp-Source: ADFU+vtHQqIHRNS01AKN1SrdHijm/KUgsYTIXJncnVu1hPocEsSAZTp8kIzRZAEWQIU2bwBzgPerlA==
X-Received: by 2002:ac2:538e:: with SMTP id g14mr5041703lfh.208.1584010946939; 
 Thu, 12 Mar 2020 04:02:26 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id a17sm19109789ljk.42.2020.03.12.04.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 04:02:25 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@xi.terra>)
 id 1jCLbS-0005kL-JP; Thu, 12 Mar 2020 12:02:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 12 Mar 2020 12:01:50 +0100
Message-Id: <20200312110151.22028-3-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312110151.22028-1-johan@kernel.org>
References: <20200312110151.22028-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 2/3] staging: greybus: loopback_test: fix
	potential path truncation
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

TmV3ZXIgR0NDIHdhcm5zIGFib3V0IGEgcG9zc2libGUgdHJ1bmNhdGlvbiBvZiBhIGdlbmVyYXRl
ZCBzeXNmcyBwYXRoCm5hbWUgYXMgd2UncmUgY29uY2F0ZW5hdGluZyBhIGRpcmVjdG9yeSBwYXRo
IHdpdGggYSBmaWxlIG5hbWUgYW5kCnBsYWNpbmcgdGhlIHJlc3VsdCBpbiBhIGJ1ZmZlciB0aGF0
IGlzIGhhbGYgdGhlIHNpemUgb2YgdGhlIG1heGltdW0KbGVuZ3RoIG9mIHRoZSBkaXJlY3Rvcnkg
cGF0aCAod2hpY2ggaXMgdXNlciBjb250cm9sbGVkKS4KCmxvb3BiYWNrX3Rlc3QuYzogSW4gZnVu
Y3Rpb24gJ29wZW5fcG9sbF9maWxlcyc6Cmxvb3BiYWNrX3Rlc3QuYzo2NTE6MzE6IHdhcm5pbmc6
ICclcycgZGlyZWN0aXZlIG91dHB1dCBtYXkgYmUgdHJ1bmNhdGVkIHdyaXRpbmcgdXAgdG8gNTEx
IGJ5dGVzIGludG8gYSByZWdpb24gb2Ygc2l6ZSAyNTUgWy1XZm9ybWF0LXRydW5jYXRpb249XQog
IDY1MSB8ICAgc25wcmludGYoYnVmLCBzaXplb2YoYnVmKSwgIiVzJXMiLCBkZXYtPnN5c2ZzX2Vu
dHJ5LCAiaXRlcmF0aW9uX2NvdW50Iik7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgXn4KbG9vcGJhY2tfdGVzdC5jOjY1MTozOiBub3RlOiAnc25wcmludGYnIG91dHB1dCBi
ZXR3ZWVuIDE2IGFuZCA1MjcgYnl0ZXMgaW50byBhIGRlc3RpbmF0aW9uIG9mIHNpemUgMjU1CiAg
NjUxIHwgICBzbnByaW50ZihidWYsIHNpemVvZihidWYpLCAiJXMlcyIsIGRldi0+c3lzZnNfZW50
cnksICJpdGVyYXRpb25fY291bnQiKTsKICAgICAgfCAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+CgpGaXggdGhp
cyBieSBtYWtpbmcgc3VyZSB0aGUgYnVmZmVyIGlzIGxhcmdlIGVub3VnaCB0aGUgY29uY2F0ZW5h
dGVkCnN0cmluZ3MuCgpGaXhlczogNmIwNjU4ZjY4Nzg2ICgiZ3JleWJ1czogdG9vbHM6IEFkZCB0
b29scyBkaXJlY3RvcnkgdG8gZ3JleWJ1cyByZXBvIGFuZCBhZGQgbG9vcGJhY2siKQpGaXhlczog
OTI1MGMwZWUyNjI2ICgiZ3JleWJ1czogTG9vcGJhY2tfdGVzdDogdXNlIHBvbGwgaW5zdGVhZCBv
ZiBpbm90aWZ5IikKU2lnbmVkLW9mZi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3Jn
PgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyB8IDIg
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwppbmRleCA0MWUxODIw
ZDlhYzkuLmQzOGJiNGZiZDZiOSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
dG9vbHMvbG9vcGJhY2tfdGVzdC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xz
L2xvb3BiYWNrX3Rlc3QuYwpAQCAtNjM3LDcgKzYzNyw3IEBAIGludCBmaW5kX2xvb3BiYWNrX2Rl
dmljZXMoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCiBzdGF0aWMgaW50IG9wZW5fcG9sbF9maWxl
cyhzdHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKIHsKIAlzdHJ1Y3QgbG9vcGJhY2tfZGV2aWNlICpk
ZXY7Ci0JY2hhciBidWZbTUFYX1NUUl9MRU5dOworCWNoYXIgYnVmW01BWF9TWVNGU19QQVRIICsg
TUFYX1NUUl9MRU5dOwogCWNoYXIgZHVtbXk7CiAJaW50IGZkc19pZHggPSAwOwogCWludCBpOwot
LSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
