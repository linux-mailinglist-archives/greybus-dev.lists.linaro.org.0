Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AF2D1F2394
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Jun 2020 01:15:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7752C664F0
	for <lists+greybus-dev@lfdr.de>; Mon,  8 Jun 2020 23:15:57 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6BF4C664F5; Mon,  8 Jun 2020 23:15:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1640F664EC;
	Mon,  8 Jun 2020 23:15:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1A8BF664DE
 for <greybus-dev@lists.linaro.org>; Mon,  8 Jun 2020 23:15:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id F201C664E8; Mon,  8 Jun 2020 23:15:40 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2A55A664E8
 for <greybus-dev@lists.linaro.org>; Mon,  8 Jun 2020 23:15:39 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B48FF2068D;
 Mon,  8 Jun 2020 23:15:37 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon,  8 Jun 2020 19:04:57 -0400
Message-Id: <20200608231211.3363633-172-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Oscar Carter <oscar.carter@gmx.com>,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH AUTOSEL 5.6 172/606] staging: greybus: Fix
	uninitialized scalar variable
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

RnJvbTogT3NjYXIgQ2FydGVyIDxvc2Nhci5jYXJ0ZXJAZ214LmNvbT4KCmNvbW1pdCAzNDYyNWMx
OTMxZjgyMDRjMjM0YzUzMmI0NDZiOWY1M2M2OWY0YjY4IHVwc3RyZWFtLgoKSW4gdGhlICJnYl90
dHlfc2V0X3Rlcm1pb3MiIGZ1bmN0aW9uIHRoZSAibmV3bGluZSIgdmFyaWFibGUgaXMgZGVjbGFy
ZWQKYnV0IG5vdCBpbml0aWFsaXplZC4gU28gdGhlICJmbG93X2NvbnRyb2wiIG1lbWJlciBpcyBu
b3QgaW5pdGlhbGl6ZWQgYW5kCnRoZSBPUiAvIEFORCBvcGVyYXRpb25zIHdpdGggaXRzZWxmIHJl
c3VsdHMgaW4gYW4gdW5kZWZpbmVkIHZhbHVlIGluCnRoaXMgbWVtYmVyLgoKVGhlIHB1cnBvc2Ug
b2YgdGhlIGNvZGUgaXMgdG8gc2V0IHRoZSBmbG93IGNvbnRyb2wgdHlwZSwgc28gcmVtb3ZlIHRo
ZQpPUiAvIEFORCBzZWxmIG9wZXJhdG9yIGFuZCBzZXQgdGhlIHZhbHVlIGRpcmVjdGx5LgoKQWRk
cmVzc2VzLUNvdmVyaXR5LUlEOiAxMzc0MDE2ICgiVW5pbml0aWFsaXplZCBzY2FsYXIgdmFyaWFi
bGUiKQpGaXhlczogZTU1YzI1MjA2ZDVjOSAoImdyZXlidXM6IHVhcnQ6IEhhbmRsZSBDUlRTQ1RT
IGZsYWcgaW4gdGVybWlvcyIpClNpZ25lZC1vZmYtYnk6IE9zY2FyIENhcnRlciA8b3NjYXIuY2Fy
dGVyQGdteC5jb20+CkNjOiBzdGFibGUgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+Ckxpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMDA1MTAxMDE0MjYuMjM2MzEtMS1vc2Nhci5jYXJ0
ZXJAZ214LmNvbQpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51
eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYyB8IDQg
KystLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy91YXJ0LmMKaW5kZXggNTVjNTExNDNiYjA5Li40ZmZiMzM0Y2Q1Y2QgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYworKysgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy91YXJ0LmMKQEAgLTUzNyw5ICs1MzcsOSBAQCBzdGF0aWMgdm9pZCBnYl90dHlf
c2V0X3Rlcm1pb3Moc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwKIAl9CiAKIAlpZiAoQ19DUlRTQ1RT
KHR0eSkgJiYgQ19CQVVEKHR0eSkgIT0gQjApCi0JCW5ld2xpbmUuZmxvd19jb250cm9sIHw9IEdC
X1NFUklBTF9BVVRPX1JUU0NUU19FTjsKKwkJbmV3bGluZS5mbG93X2NvbnRyb2wgPSBHQl9TRVJJ
QUxfQVVUT19SVFNDVFNfRU47CiAJZWxzZQotCQluZXdsaW5lLmZsb3dfY29udHJvbCAmPSB+R0Jf
U0VSSUFMX0FVVE9fUlRTQ1RTX0VOOworCQluZXdsaW5lLmZsb3dfY29udHJvbCA9IDA7CiAKIAlp
ZiAobWVtY21wKCZnYl90dHktPmxpbmVfY29kaW5nLCAmbmV3bGluZSwgc2l6ZW9mKG5ld2xpbmUp
KSkgewogCQltZW1jcHkoJmdiX3R0eS0+bGluZV9jb2RpbmcsICZuZXdsaW5lLCBzaXplb2YobmV3
bGluZSkpOwotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
