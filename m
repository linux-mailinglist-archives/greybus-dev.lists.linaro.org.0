Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D1936194D1E
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Mar 2020 00:29:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0314B6603E
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Mar 2020 23:29:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EA02F66040; Thu, 26 Mar 2020 23:29:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BA7836604B;
	Thu, 26 Mar 2020 23:28:05 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6C4AE66040
 for <greybus-dev@lists.linaro.org>; Thu, 26 Mar 2020 23:26:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5894A66044; Thu, 26 Mar 2020 23:26:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 304C166040
 for <greybus-dev@lists.linaro.org>; Thu, 26 Mar 2020 23:25:32 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE6EC20774;
 Thu, 26 Mar 2020 23:25:30 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 26 Mar 2020 19:25:23 -0400
Message-Id: <20200326232526.8349-4-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232526.8349-1-sashal@kernel.org>
References: <20200326232526.8349-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Sasha Levin <sashal@kernel.org>, devel@driverdev.osuosl.org,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH AUTOSEL 4.9 4/7] staging: greybus:
	loopback_test: fix potential path truncations
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

RnJvbTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgoKWyBVcHN0cmVhbSBjb21taXQg
YWU2MmNmNWViMjc5MmQ5YTgxOGMyZDkzNzI4ZWQ5MjExOTM1NzAxNyBdCgpOZXdlciBHQ0Mgd2Fy
bnMgYWJvdXQgcG9zc2libGUgdHJ1bmNhdGlvbnMgb2YgdHdvIGdlbmVyYXRlZCBwYXRoIG5hbWVz
IGFzCndlJ3JlIGNvbmNhdGVuYXRpbmcgdGhlIGNvbmZpZ3VyYWJsZSBzeXNmcyBhbmQgZGVidWdm
cyBwYXRoIHByZWZpeGVzCndpdGggYSBmaWxlbmFtZSBhbmQgcGxhY2luZyB0aGUgcmVzdWx0cyBp
biBidWZmZXJzIG9mIHRoZSBzYW1lIHNpemUgYXMKdGhlIG1heGltdW0gbGVuZ3RoIG9mIHRoZSBw
cmVmaXhlcy4KCglzbnByaW50ZihkLT5uYW1lLCBNQVhfU1RSX0xFTiwgImdiX2xvb3BiYWNrJXUi
LCBkZXZfaWQpOwoKCXNucHJpbnRmKGQtPnN5c2ZzX2VudHJ5LCBNQVhfU1lTRlNfUEFUSCwgIiVz
JXMvIiwKCQkgdC0+c3lzZnNfcHJlZml4LCBkLT5uYW1lKTsKCglzbnByaW50ZihkLT5kZWJ1Z2Zz
X2VudHJ5LCBNQVhfU1lTRlNfUEFUSCwgIiVzcmF3X2xhdGVuY3lfJXMiLAoJCSB0LT5kZWJ1Z2Zz
X3ByZWZpeCwgZC0+bmFtZSk7CgpGaXggdGhpcyBieSBzZXBhcmF0aW5nIHRoZSBtYXhpbXVtIHBh
dGggbGVuZ3RoIGZyb20gdGhlIG1heGltdW0gcHJlZml4Cmxlbmd0aCBhbmQgcmVkdWNpbmcgdGhl
IGxhdHRlciBlbm91Z2ggdG8gZml0IHRoZSBnZW5lcmF0ZWQgc3RyaW5ncy4KCk5vdGUgdGhhdCB3
ZSBhbHNvIG5lZWQgdG8gcmVkdWNlIHRoZSBkZXZpY2UtbmFtZSBidWZmZXIgc2l6ZSBhcyBHQ0MK
aXNuJ3Qgc21hcnQgZW5vdWdoIHRvIGZpZ3VyZSBvdXQgdGhhdCB3ZSBldmVyIG9ubHkgdXNlZCBN
QVhfU1RSX0xFTgpieXRlcyBvZiBpdC4KCkZpeGVzOiA2YjA2NThmNjg3ODYgKCJncmV5YnVzOiB0
b29sczogQWRkIHRvb2xzIGRpcmVjdG9yeSB0byBncmV5YnVzIHJlcG8gYW5kIGFkZCBsb29wYmFj
ayIpClNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KTGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDIwMDMxMjExMDE1MS4yMjAyOC00LWpvaGFuQGtl
cm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhm
b3VuZGF0aW9uLm9yZz4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwu
b3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyB8
IDE1ICsrKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9s
b29wYmFja190ZXN0LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190
ZXN0LmMKaW5kZXggOTQzMGYzZTAxNjJiNS4uOGQyNjc4YjIyYzM2MCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCisrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwpAQCAtMjAsNiArMjAsNyBAQAog
I2luY2x1ZGUgPHNpZ25hbC5oPgogCiAjZGVmaW5lIE1BWF9OVU1fREVWSUNFUyAxMAorI2RlZmlu
ZSBNQVhfU1lTRlNfUFJFRklYIDB4ODAKICNkZWZpbmUgTUFYX1NZU0ZTX1BBVEgJMHgyMDAKICNk
ZWZpbmUgQ1NWX01BWF9MSU5FCTB4MTAwMAogI2RlZmluZSBTWVNGU19NQVhfSU5UCTB4MjAKQEAg
LTY4LDcgKzY5LDcgQEAgc3RydWN0IGxvb3BiYWNrX3Jlc3VsdHMgewogfTsKIAogc3RydWN0IGxv
b3BiYWNrX2RldmljZSB7Ci0JY2hhciBuYW1lW01BWF9TWVNGU19QQVRIXTsKKwljaGFyIG5hbWVb
TUFYX1NUUl9MRU5dOwogCWNoYXIgc3lzZnNfZW50cnlbTUFYX1NZU0ZTX1BBVEhdOwogCWNoYXIg
ZGVidWdmc19lbnRyeVtNQVhfU1lTRlNfUEFUSF07CiAJc3RydWN0IGxvb3BiYWNrX3Jlc3VsdHMg
cmVzdWx0czsKQEAgLTk0LDggKzk1LDggQEAgc3RydWN0IGxvb3BiYWNrX3Rlc3QgewogCWludCBz
dG9wX2FsbDsKIAlpbnQgcG9sbF9jb3VudDsKIAljaGFyIHRlc3RfbmFtZVtNQVhfU1RSX0xFTl07
Ci0JY2hhciBzeXNmc19wcmVmaXhbTUFYX1NZU0ZTX1BBVEhdOwotCWNoYXIgZGVidWdmc19wcmVm
aXhbTUFYX1NZU0ZTX1BBVEhdOworCWNoYXIgc3lzZnNfcHJlZml4W01BWF9TWVNGU19QUkVGSVhd
OworCWNoYXIgZGVidWdmc19wcmVmaXhbTUFYX1NZU0ZTX1BSRUZJWF07CiAJc3RydWN0IHRpbWVz
cGVjIHBvbGxfdGltZW91dDsKIAlzdHJ1Y3QgbG9vcGJhY2tfZGV2aWNlIGRldmljZXNbTUFYX05V
TV9ERVZJQ0VTXTsKIAlzdHJ1Y3QgbG9vcGJhY2tfcmVzdWx0cyBhZ2dyZWdhdGVfcmVzdWx0czsK
QEAgLTkxNywxMCArOTE4LDEwIEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJ
CQl0Lml0ZXJhdGlvbl9tYXggPSBhdG9pKG9wdGFyZyk7CiAJCQlicmVhazsKIAkJY2FzZSAnUyc6
Ci0JCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BBVEgsICIlcyIsIG9wdGFy
Zyk7CisJCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwg
b3B0YXJnKTsKIAkJCWJyZWFrOwogCQljYXNlICdEJzoKLQkJCXNucHJpbnRmKHQuZGVidWdmc19w
cmVmaXgsIE1BWF9TWVNGU19QQVRILCAiJXMiLCBvcHRhcmcpOworCQkJc25wcmludGYodC5kZWJ1
Z2ZzX3ByZWZpeCwgTUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwgb3B0YXJnKTsKIAkJCWJyZWFrOwog
CQljYXNlICdtJzoKIAkJCXQubWFzayA9IGF0b2wob3B0YXJnKTsKQEAgLTk3MSwxMCArOTcyLDEw
IEBAIGludCBtYWluKGludCBhcmdjLCBjaGFyICphcmd2W10pCiAJfQogCiAJaWYgKCFzdHJjbXAo
dC5zeXNmc19wcmVmaXgsICIiKSkKLQkJc25wcmludGYodC5zeXNmc19wcmVmaXgsIE1BWF9TWVNG
U19QQVRILCAiJXMiLCBzeXNmc19wcmVmaXgpOworCQlzbnByaW50Zih0LnN5c2ZzX3ByZWZpeCwg
TUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwgc3lzZnNfcHJlZml4KTsKIAogCWlmICghc3RyY21wKHQu
ZGVidWdmc19wcmVmaXgsICIiKSkKLQkJc25wcmludGYodC5kZWJ1Z2ZzX3ByZWZpeCwgTUFYX1NZ
U0ZTX1BBVEgsICIlcyIsIGRlYnVnZnNfcHJlZml4KTsKKwkJc25wcmludGYodC5kZWJ1Z2ZzX3By
ZWZpeCwgTUFYX1NZU0ZTX1BSRUZJWCwgIiVzIiwgZGVidWdmc19wcmVmaXgpOwogCiAJcmV0ID0g
ZmluZF9sb29wYmFja19kZXZpY2VzKCZ0KTsKIAlpZiAocmV0KQotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWls
aW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFy
by5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
