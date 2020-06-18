Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 597C21FDDAD
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jun 2020 03:27:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 89D366650A
	for <lists+greybus-dev@lfdr.de>; Thu, 18 Jun 2020 01:27:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5FBD166524; Thu, 18 Jun 2020 01:27:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 08D3F66519;
	Thu, 18 Jun 2020 01:27:19 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3AAFA664FE
 for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2020 01:26:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2F60A664F5; Thu, 18 Jun 2020 01:26:51 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id F054A664F5
 for <greybus-dev@lists.linaro.org>; Thu, 18 Jun 2020 01:26:49 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5977520B1F;
 Thu, 18 Jun 2020 01:26:48 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Wed, 17 Jun 2020 21:24:49 -0400
Message-Id: <20200618012600.608744-37-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200618012600.608744-1-sashal@kernel.org>
References: <20200618012600.608744-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Sasha Levin <sashal@kernel.org>,
 greybus-dev@lists.linaro.org, Chen Zhou <chenzhou10@huawei.com>
Subject: [greybus-dev] [PATCH AUTOSEL 4.14 037/108] staging: greybus: fix a
	missing-check bug in gb_lights_light_config()
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

RnJvbTogQ2hlbiBaaG91IDxjaGVuemhvdTEwQGh1YXdlaS5jb20+CgpbIFVwc3RyZWFtIGNvbW1p
dCA5YmIwODZlNWJhOTQ5NWFjMTUwZmJiY2M1YzhjMmJjY2MwNjI2MWRkIF0KCkluIGdiX2xpZ2h0
c19saWdodF9jb25maWcoKSwgJ2xpZ2h0LT5uYW1lJyBpcyBhbGxvY2F0ZWQgYnkga3N0cm5kdXAo
KS4KSXQgcmV0dXJucyBOVUxMIHdoZW4gZmFpbHMsIGFkZCBjaGVjayBmb3IgaXQuCgpTaWduZWQt
b2ZmLWJ5OiBDaGVuIFpob3UgPGNoZW56aG91MTBAaHVhd2VpLmNvbT4KQWNrZWQtYnk6IFJ1aSBN
aWd1ZWwgU2lsdmEgPHJtZnJmc0BnbWFpbC5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL3IvMjAyMDA0MDEwMzAwMTcuMTAwMjc0LTEtY2hlbnpob3UxMEBodWF3ZWkuY29tClNpZ25l
ZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9saWdodC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwppbmRleCA0
ZTc1NzUxNDc3NzUuLjlmYWIwZTI3NTFhYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvbGlnaHQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jCkBAIC0x
MDMzLDcgKzEwMzMsOCBAQCBzdGF0aWMgaW50IGdiX2xpZ2h0c19saWdodF9jb25maWcoc3RydWN0
IGdiX2xpZ2h0cyAqZ2xpZ2h0cywgdTggaWQpCiAKIAlsaWdodC0+Y2hhbm5lbHNfY291bnQgPSBj
b25mLmNoYW5uZWxfY291bnQ7CiAJbGlnaHQtPm5hbWUgPSBrc3RybmR1cChjb25mLm5hbWUsIE5B
TUVTX01BWCwgR0ZQX0tFUk5FTCk7Ci0KKwlpZiAoIWxpZ2h0LT5uYW1lKQorCQlyZXR1cm4gLUVO
T01FTTsKIAlsaWdodC0+Y2hhbm5lbHMgPSBrY2FsbG9jKGxpZ2h0LT5jaGFubmVsc19jb3VudCwK
IAkJCQkgIHNpemVvZihzdHJ1Y3QgZ2JfY2hhbm5lbCksIEdGUF9LRVJORUwpOwogCWlmICghbGln
aHQtPmNoYW5uZWxzKQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
