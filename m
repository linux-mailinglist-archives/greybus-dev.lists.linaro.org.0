Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C20E4194CE5
	for <lists+greybus-dev@lfdr.de>; Fri, 27 Mar 2020 00:27:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EFD3B66040
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Mar 2020 23:27:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DD16866052; Thu, 26 Mar 2020 23:27:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 26E3F66041;
	Thu, 26 Mar 2020 23:26:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A926D66038
 for <greybus-dev@lists.linaro.org>; Thu, 26 Mar 2020 23:26:12 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 973C066048; Thu, 26 Mar 2020 23:26:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 96BB96603B
 for <greybus-dev@lists.linaro.org>; Thu, 26 Mar 2020 23:25:20 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1D7E4208E0;
 Thu, 26 Mar 2020 23:25:19 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 26 Mar 2020 19:25:08 -0400
Message-Id: <20200326232513.8212-5-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200326232513.8212-1-sashal@kernel.org>
References: <20200326232513.8212-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Sasha Levin <sashal@kernel.org>, devel@driverdev.osuosl.org,
 Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH AUTOSEL 4.14 05/10] staging: greybus:
	loopback_test: fix potential path truncation
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
ZjE2MDIzODM0ODYzOTMyZjk1ZGZhZDEzZmFjM2ZjNDdmNzdkMmYyOSBdCgpOZXdlciBHQ0Mgd2Fy
bnMgYWJvdXQgYSBwb3NzaWJsZSB0cnVuY2F0aW9uIG9mIGEgZ2VuZXJhdGVkIHN5c2ZzIHBhdGgK
bmFtZSBhcyB3ZSdyZSBjb25jYXRlbmF0aW5nIGEgZGlyZWN0b3J5IHBhdGggd2l0aCBhIGZpbGUg
bmFtZSBhbmQKcGxhY2luZyB0aGUgcmVzdWx0IGluIGEgYnVmZmVyIHRoYXQgaXMgaGFsZiB0aGUg
c2l6ZSBvZiB0aGUgbWF4aW11bQpsZW5ndGggb2YgdGhlIGRpcmVjdG9yeSBwYXRoICh3aGljaCBp
cyB1c2VyIGNvbnRyb2xsZWQpLgoKbG9vcGJhY2tfdGVzdC5jOiBJbiBmdW5jdGlvbiAnb3Blbl9w
b2xsX2ZpbGVzJzoKbG9vcGJhY2tfdGVzdC5jOjY1MTozMTogd2FybmluZzogJyVzJyBkaXJlY3Rp
dmUgb3V0cHV0IG1heSBiZSB0cnVuY2F0ZWQgd3JpdGluZyB1cCB0byA1MTEgYnl0ZXMgaW50byBh
IHJlZ2lvbiBvZiBzaXplIDI1NSBbLVdmb3JtYXQtdHJ1bmNhdGlvbj1dCiAgNjUxIHwgICBzbnBy
aW50ZihidWYsIHNpemVvZihidWYpLCAiJXMlcyIsIGRldi0+c3lzZnNfZW50cnksICJpdGVyYXRp
b25fY291bnQiKTsKICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBefgpsb29w
YmFja190ZXN0LmM6NjUxOjM6IG5vdGU6ICdzbnByaW50Zicgb3V0cHV0IGJldHdlZW4gMTYgYW5k
IDUyNyBieXRlcyBpbnRvIGEgZGVzdGluYXRpb24gb2Ygc2l6ZSAyNTUKICA2NTEgfCAgIHNucHJp
bnRmKGJ1Ziwgc2l6ZW9mKGJ1ZiksICIlcyVzIiwgZGV2LT5zeXNmc19lbnRyeSwgIml0ZXJhdGlv
bl9jb3VudCIpOwogICAgICB8ICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KCkZpeCB0aGlzIGJ5IG1ha2luZyBz
dXJlIHRoZSBidWZmZXIgaXMgbGFyZ2UgZW5vdWdoIHRoZSBjb25jYXRlbmF0ZWQKc3RyaW5ncy4K
CkZpeGVzOiA2YjA2NThmNjg3ODYgKCJncmV5YnVzOiB0b29sczogQWRkIHRvb2xzIGRpcmVjdG9y
eSB0byBncmV5YnVzIHJlcG8gYW5kIGFkZCBsb29wYmFjayIpCkZpeGVzOiA5MjUwYzBlZTI2MjYg
KCJncmV5YnVzOiBMb29wYmFja190ZXN0OiB1c2UgcG9sbCBpbnN0ZWFkIG9mIGlub3RpZnkiKQpT
aWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Ckxpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDAzMTIxMTAxNTEuMjIwMjgtMy1qb2hhbkBrZXJuZWwu
b3JnClNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRh
dGlvbi5vcmc+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgYi9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMKaW5kZXggZmJlNTg5ZmNh
ODQwOC4uZGRlYTUwNTIzZDU2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
dG9vbHMvbG9vcGJhY2tfdGVzdC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xz
L2xvb3BiYWNrX3Rlc3QuYwpAQCAtNjQ0LDcgKzY0NCw3IEBAIGludCBmaW5kX2xvb3BiYWNrX2Rl
dmljZXMoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCiBzdGF0aWMgaW50IG9wZW5fcG9sbF9maWxl
cyhzdHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKIHsKIAlzdHJ1Y3QgbG9vcGJhY2tfZGV2aWNlICpk
ZXY7Ci0JY2hhciBidWZbTUFYX1NUUl9MRU5dOworCWNoYXIgYnVmW01BWF9TWVNGU19QQVRIICsg
TUFYX1NUUl9MRU5dOwogCWNoYXIgZHVtbXk7CiAJaW50IGZkc19pZHggPSAwOwogCWludCBpOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
