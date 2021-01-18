Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B03B92FA37B
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Jan 2021 15:47:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CF3BF617F5
	for <lists+greybus-dev@lfdr.de>; Mon, 18 Jan 2021 14:47:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C25446671E; Mon, 18 Jan 2021 14:47:38 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E30A566714;
	Mon, 18 Jan 2021 14:47:26 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DCE0F608E0
 for <greybus-dev@lists.linaro.org>; Mon, 18 Jan 2021 14:47:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D051E617F5; Mon, 18 Jan 2021 14:47:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id B094B66714
 for <greybus-dev@lists.linaro.org>; Mon, 18 Jan 2021 14:46:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9D72E22BE9;
 Mon, 18 Jan 2021 14:46:52 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1l1Vo2-0006eb-Mx; Mon, 18 Jan 2021 15:46:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 18 Jan 2021 15:46:29 +0100
Message-Id: <20210118144629.25533-1-johan@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Alex Elder <elder@linaro.org>
Subject: [greybus-dev] [PATCH] greybus: es2: drop short control-transfer
	checks
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

VGhlcmUncyBubyBuZWVkIHRvIGNoZWNrIGZvciBzaG9ydCBVU0IgY29udHJvbCB0cmFuc2ZlcnMg
d2hlbiBzZW5kaW5nCmRhdGEgdXNpbmcgc28gcmVtb3ZlIHRoZSByZWR1bmRhbnQgc2FuaXR5IGNo
ZWNrcy4KClNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0t
CiBkcml2ZXJzL2dyZXlidXMvZXMyLmMgfCA5ICsrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXli
dXMvZXMyLmMgYi9kcml2ZXJzL2dyZXlidXMvZXMyLmMKaW5kZXggMWRmNmFiNWQzMzlkLi40OGFk
MTU0ZGYzYTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9lczIuYworKysgYi9kcml2ZXJz
L2dyZXlidXMvZXMyLmMKQEAgLTU2NywxMiArNTY3LDkgQEAgc3RhdGljIGludCBjcG9ydF9lbmFi
bGUoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCwgdTE2IGNwb3J0X2lkLAogCQkJICAgICAgVVNC
X0RJUl9PVVQgfCBVU0JfVFlQRV9WRU5ET1IgfAogCQkJICAgICAgVVNCX1JFQ0lQX0lOVEVSRkFD
RSwgY3BvcnRfaWQsIDAsCiAJCQkgICAgICByZXEsIHNpemVvZigqcmVxKSwgRVMyX1VTQl9DVFJM
X1RJTUVPVVQpOwotCWlmIChyZXQgIT0gc2l6ZW9mKCpyZXEpKSB7CisJaWYgKHJldCA8IDApIHsK
IAkJZGV2X2VycigmdWRldi0+ZGV2LCAiZmFpbGVkIHRvIHNldCBjcG9ydCBmbGFncyBmb3IgcG9y
dCAlZFxuIiwKIAkJCWNwb3J0X2lkKTsKLQkJaWYgKHJldCA+PSAwKQotCQkJcmV0ID0gLUVJTzsK
LQogCQlnb3RvIG91dDsKIAl9CiAKQEAgLTk2MSwxMiArOTU4LDEwIEBAIHN0YXRpYyBpbnQgYXJw
Y19zZW5kKHN0cnVjdCBlczJfYXBfZGV2ICplczIsIHN0cnVjdCBhcnBjICpycGMsIGludCB0aW1l
b3V0KQogCQkJCSAwLCAwLAogCQkJCSBycGMtPnJlcSwgbGUxNl90b19jcHUocnBjLT5yZXEtPnNp
emUpLAogCQkJCSBFUzJfVVNCX0NUUkxfVElNRU9VVCk7Ci0JaWYgKHJldHZhbCAhPSBsZTE2X3Rv
X2NwdShycGMtPnJlcS0+c2l6ZSkpIHsKKwlpZiAocmV0dmFsIDwgMCkgewogCQlkZXZfZXJyKCZ1
ZGV2LT5kZXYsCiAJCQkiZmFpbGVkIHRvIHNlbmQgQVJQQyByZXF1ZXN0ICVkOiAlZFxuIiwKIAkJ
CXJwYy0+cmVxLT50eXBlLCByZXR2YWwpOwotCQlpZiAocmV0dmFsID4gMCkKLQkJCXJldHZhbCA9
IC1FSU87CiAJCXJldHVybiByZXR2YWw7CiAJfQogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
