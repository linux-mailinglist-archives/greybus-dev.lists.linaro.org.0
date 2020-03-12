Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 336CC182E8C
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 12:03:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5112260785
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 11:03:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3E20660E9E; Thu, 12 Mar 2020 11:03:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 292F8619E2;
	Thu, 12 Mar 2020 11:03:06 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DEA4060887
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D1FFF60E9E; Thu, 12 Mar 2020 11:02:58 +0000 (UTC)
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
 [209.85.167.67])
 by lists.linaro.org (Postfix) with ESMTPS id 52DFB60887
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:30 +0000 (UTC)
Received: by mail-lf1-f67.google.com with SMTP id b186so4334103lfg.11
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 04:02:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Mj3MJcwV2Ob5PmZcW233AWny7Gxsi3b1PdwO4Wtlog=;
 b=tKGpQ7jyLX0OnCfC9Pc/RajDp+ZEP7/6CFm6Z/tANgx27iTVdO3w8v803D0rXBL/rB
 Y1PUoACOuGKlb/6mDDW6sSgXO4d3dwnkVAEvU9QtA02ecA1H/M5R/Y+LWwbj/ivyey0L
 nR0y2BxLgLf+e9PWG3KqshuZ1BEeKSqZtJgjvqFnAny3jDhcG8Cz28if5gl02XPZGjx8
 eCdx7RXfiq44vp3NHP7Jq4CYtoZ4GDARAx6E7947rOG8w5jbu/vhQGIztgekc/9Be3RR
 6ZjOE9yi4P60FwiPou3x5n5DA/3lcD5Znarcdk/WRbl9KPOlu4dsy7GFZjGb7kquKPGd
 3LbQ==
X-Gm-Message-State: ANhLgQ3MQHiQXs0RN+mmS01x8dA/WPN5x0mbhBAWndmu9tEktXo1G8lo
 wtP/1AKNqV5H4z0hLXajMLY=
X-Google-Smtp-Source: ADFU+vur2Hbz9dWEyrJsg/slUxBKugdWUurH4O/r2TmqsuxboHAg+aABhoo4sGy+ldWfEnNpdgPsyg==
X-Received: by 2002:ac2:5e31:: with SMTP id o17mr4661566lfg.123.1584010949191; 
 Thu, 12 Mar 2020 04:02:29 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id s21sm2096862lfc.28.2020.03.12.04.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 04:02:26 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@xi.terra>)
 id 1jCLbS-0005kR-M1; Thu, 12 Mar 2020 12:02:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 12 Mar 2020 12:01:51 +0100
Message-Id: <20200312110151.22028-4-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312110151.22028-1-johan@kernel.org>
References: <20200312110151.22028-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 3/3] staging: greybus: loopback_test: fix
	potential path truncations
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

TmV3ZXIgR0NDIHdhcm5zIGFib3V0IHBvc3NpYmxlIHRydW5jYXRpb25zIG9mIHR3byBnZW5lcmF0
ZWQgcGF0aCBuYW1lcyBhcwp3ZSdyZSBjb25jYXRlbmF0aW5nIHRoZSBjb25maWd1cmFibGUgc3lz
ZnMgYW5kIGRlYnVnZnMgcGF0aCBwcmVmaXhlcwp3aXRoIGEgZmlsZW5hbWUgYW5kIHBsYWNpbmcg
dGhlIHJlc3VsdHMgaW4gYnVmZmVycyBvZiB0aGUgc2FtZSBzaXplIGFzCnRoZSBtYXhpbXVtIGxl
bmd0aCBvZiB0aGUgcHJlZml4ZXMuCgoJc25wcmludGYoZC0+bmFtZSwgTUFYX1NUUl9MRU4sICJn
Yl9sb29wYmFjayV1IiwgZGV2X2lkKTsKCglzbnByaW50ZihkLT5zeXNmc19lbnRyeSwgTUFYX1NZ
U0ZTX1BBVEgsICIlcyVzLyIsCgkJIHQtPnN5c2ZzX3ByZWZpeCwgZC0+bmFtZSk7CgoJc25wcmlu
dGYoZC0+ZGVidWdmc19lbnRyeSwgTUFYX1NZU0ZTX1BBVEgsICIlc3Jhd19sYXRlbmN5XyVzIiwK
CQkgdC0+ZGVidWdmc19wcmVmaXgsIGQtPm5hbWUpOwoKRml4IHRoaXMgYnkgc2VwYXJhdGluZyB0
aGUgbWF4aW11bSBwYXRoIGxlbmd0aCBmcm9tIHRoZSBtYXhpbXVtIHByZWZpeApsZW5ndGggYW5k
IHJlZHVjaW5nIHRoZSBsYXR0ZXIgZW5vdWdoIHRvIGZpdCB0aGUgZ2VuZXJhdGVkIHN0cmluZ3Mu
CgpOb3RlIHRoYXQgd2UgYWxzbyBuZWVkIHRvIHJlZHVjZSB0aGUgZGV2aWNlLW5hbWUgYnVmZmVy
IHNpemUgYXMgR0NDCmlzbid0IHNtYXJ0IGVub3VnaCB0byBmaWd1cmUgb3V0IHRoYXQgd2UgZXZl
ciBvbmx5IHVzZWQgTUFYX1NUUl9MRU4KYnl0ZXMgb2YgaXQuCgpGaXhlczogNmIwNjU4ZjY4Nzg2
ICgiZ3JleWJ1czogdG9vbHM6IEFkZCB0b29scyBkaXJlY3RvcnkgdG8gZ3JleWJ1cyByZXBvIGFu
ZCBhZGQgbG9vcGJhY2siKQpTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5l
bC5vcmc+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5j
IHwgMTUgKysrKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xz
L2xvb3BiYWNrX3Rlc3QuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNr
X3Rlc3QuYwppbmRleCBkMzhiYjRmYmQ2YjkuLjY5YzZkY2U5YmUzMSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCisrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwpAQCAtMTksNiArMTksNyBAQAog
I2luY2x1ZGUgPHNpZ25hbC5oPgogCiAjZGVmaW5lIE1BWF9OVU1fREVWSUNFUyAxMAorI2RlZmlu
ZSBNQVhfU1lTRlNfUFJFRklYIDB4ODAKICNkZWZpbmUgTUFYX1NZU0ZTX1BBVEgJMHgyMDAKICNk
ZWZpbmUgQ1NWX01BWF9MSU5FCTB4MTAwMAogI2RlZmluZSBTWVNGU19NQVhfSU5UCTB4MjAKQEAg
LTY3LDcgKzY4LDcgQEAgc3RydWN0IGxvb3BiYWNrX3Jlc3VsdHMgewogfTsKIAogc3RydWN0IGxv
b3BiYWNrX2RldmljZSB7Ci0JY2hhciBuYW1lW01BWF9TWVNGU19QQVRIXTsKKwljaGFyIG5hbWVb
TUFYX1NUUl9MRU5dOwogCWNoYXIgc3lzZnNfZW50cnlbTUFYX1NZU0ZTX1BBVEhdOwogCWNoYXIg
ZGVidWdmc19lbnRyeVtNQVhfU1lTRlNfUEFUSF07CiAJc3RydWN0IGxvb3BiYWNrX3Jlc3VsdHMg
cmVzdWx0czsKQEAgLTkzLDggKzk0LDggQEAgc3RydWN0IGxvb3BiYWNrX3Rlc3QgewogCWludCBz
dG9wX2FsbDsKIAlpbnQgcG9sbF9jb3VudDsKIAljaGFyIHRlc3RfbmFtZVtNQVhfU1RSX0xFTl07
Ci0JY2hhciBzeXNmc19wcmVmaXhbTUFYX1NZU0ZTX1BBVEhdOwotCWNoYXIgZGVidWdmc19wcmVm
aXhbTUFYX1NZU0ZTX1BBVEhdOworCWNoYXIgc3lzZnNfcHJlZml4W01BWF9TWVNGU19QUkVGSVhd
OworCWNoYXIgZGVidWdmc19wcmVmaXhbTUFYX1NZU0ZTX1BSRUZJWF07CiAJc3RydWN0IHRpbWVz
cGVjIHBvbGxfdGltZW91dDsKIAlzdHJ1Y3QgbG9vcGJhY2tfZGV2aWNlIGRldmljZXNbTUFYX05V
TV9ERVZJQ0VTXTsKIAlzdHJ1Y3QgbG9vcGJhY2tfcmVzdWx0cyBhZ2dyZWdhdGVfcmVzdWx0czsK
QEAgLTkwNywxMCArOTA4LDEwIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJ
CQl0Lml0ZXJhdGlvbl9tYXggPSBhdG9pKG9wdGFyZyk7CiAJCQlicmVhazsKIAkJY2FzZSAnUyc6
Ci0JCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BBVEgsICIlcyIsIG9wdGFy
Zyk7CisJCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwg
b3B0YXJnKTsKIAkJCWJyZWFrOwogCQljYXNlICdEJzoKLQkJCXNucHJpbnRmKHQuZGVidWdmc19w
cmVmaXgsIE1BWF9TWVNGU19QQVRILCAiJXMiLCBvcHRhcmcpOworCQkJc25wcmludGYodC5kZWJ1
Z2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwgb3B0YXJnKTsKIAkJCWJyZWFrOwog
CQljYXNlICdtJzoKIAkJCXQubWFzayA9IGF0b2wob3B0YXJnKTsKQEAgLTk2MSwxMCArOTYyLDEw
IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJfQogCiAJaWYgKCFzdHJjbXAo
dC5zeXNmc19wcmVmaXgsICIiKSkKLQkJc25wcmludGYodC5zeXNmc19wcmVmaXgsIE1BWF9TWVNG
U19QQVRILCAiJXMiLCBzeXNmc19wcmVmaXgpOworCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZpeCwg
TUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwgc3lzZnNfcHJlZml4KTsKIAogCWlmICghc3RyY21wKHQu
ZGVidWdmc19wcmVmaXgsICIiKSkKLQkJc25wcmludGYodC5kZWJ1Z2ZzX3ByZWZpeCwgTUFYX1NZ
U0ZTX1BBVEgsICIlcyIsIGRlYnVnZnNfcHJlZml4KTsKKwkJc25wcmludGYodC5kZWJ1Z2ZzX3By
ZWZpeCwgTUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwgZGVidWdmc19wcmVmaXgpOwogCiAJcmV0ID0g
ZmluZF9sb29wYmFja19kZXZpY2VzKCZ0KTsKIAlpZiAocmV0KQotLSAKMi4yNC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
