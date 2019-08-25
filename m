Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D519C233
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 07:56:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B0643617D1
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 05:56:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A2B8F618D2; Sun, 25 Aug 2019 05:56:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 04134617E2;
	Sun, 25 Aug 2019 05:55:28 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5EEFD615AF
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 50A2E617C9; Sun, 25 Aug 2019 05:55:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 18978617B5
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:07 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 013622173E;
 Sun, 25 Aug 2019 05:55:05 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org
Date: Sun, 25 Aug 2019 07:54:25 +0200
Message-Id: <20190825055429.18547-6-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-kernel@vger.kernel.org, David Lin <dtwlin@gmail.com>
Subject: [greybus-dev] [PATCH 5/9] staging: greybus: log: Fix up some
	alignment checkpatch issues
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

U29tZSBmdW5jdGlvbiBwcm90b3R5cGVzIGRvIG5vdCBtYXRjaCB0aGUgZXhwZWN0ZWQgYWxpZ25t
ZW50IGZvcm1hdHRpbmcKc28gZml4IHRoYXQgdXAgc28gdGhhdCBjaGVja3BhdGNoIGlzIGhhcHB5
LgoKQ2M6IERhdmlkIExpbiA8ZHR3bGluQGdtYWlsLmNvbT4KQ2M6IEpvaGFuIEhvdm9sZCA8am9o
YW5Aa2VybmVsLm9yZz4KQ2M6IEFsZXggRWxkZXIgPGVsZGVyQGtlcm5lbC5vcmc+CkNjOiBncmV5
YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCkNjOiBkZXZlbEBkcml2ZXJkZXYub3N1b3NsLm9yZwpT
aWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdyZWdraEBsaW51eGZvdW5kYXRpb24u
b3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvZy5jIHwgNiArKystLS0KIDEgZmls
ZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9nLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9s
b2cuYwppbmRleCAxNWE4ODU3NGRiYjAuLjRmMWYxNjFmZjExYyAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvbG9nLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9n
LmMKQEAgLTMxLDE0ICszMSwxNCBAQCBzdGF0aWMgaW50IGdiX2xvZ19yZXF1ZXN0X2hhbmRsZXIo
c3RydWN0IGdiX29wZXJhdGlvbiAqb3ApCiAJLyogVmVyaWZ5IHNpemUgb2YgcGF5bG9hZCAqLwog
CWlmIChvcC0+cmVxdWVzdC0+cGF5bG9hZF9zaXplIDwgc2l6ZW9mKCpyZWNlaXZlKSkgewogCQlk
ZXZfZXJyKGRldiwgImxvZyByZXF1ZXN0IHRvbyBzbWFsbCAoJXp1IDwgJXp1KVxuIiwKLQkJCQlv
cC0+cmVxdWVzdC0+cGF5bG9hZF9zaXplLCBzaXplb2YoKnJlY2VpdmUpKTsKKwkJCW9wLT5yZXF1
ZXN0LT5wYXlsb2FkX3NpemUsIHNpemVvZigqcmVjZWl2ZSkpOwogCQlyZXR1cm4gLUVJTlZBTDsK
IAl9CiAJcmVjZWl2ZSA9IG9wLT5yZXF1ZXN0LT5wYXlsb2FkOwogCWxlbiA9IGxlMTZfdG9fY3B1
KHJlY2VpdmUtPmxlbik7CiAJaWYgKGxlbiAhPSAob3AtPnJlcXVlc3QtPnBheWxvYWRfc2l6ZSAt
IHNpemVvZigqcmVjZWl2ZSkpKSB7CiAJCWRldl9lcnIoZGV2LCAibG9nIHJlcXVlc3Qgd3Jvbmcg
c2l6ZSAlZCB2cyAlenVcbiIsIGxlbiwKLQkJCQkob3AtPnJlcXVlc3QtPnBheWxvYWRfc2l6ZSAt
IHNpemVvZigqcmVjZWl2ZSkpKTsKKwkJCShvcC0+cmVxdWVzdC0+cGF5bG9hZF9zaXplIC0gc2l6
ZW9mKCpyZWNlaXZlKSkpOwogCQlyZXR1cm4gLUVJTlZBTDsKIAl9CiAJaWYgKGxlbiA9PSAwKSB7
CkBAIC04Myw3ICs4Myw3IEBAIHN0YXRpYyBpbnQgZ2JfbG9nX3Byb2JlKHN0cnVjdCBnYl9idW5k
bGUgKmJ1bmRsZSwKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAljb25uZWN0aW9uID0gZ2JfY29ubmVj
dGlvbl9jcmVhdGUoYnVuZGxlLCBsZTE2X3RvX2NwdShjcG9ydF9kZXNjLT5pZCksCi0JCQlnYl9s
b2dfcmVxdWVzdF9oYW5kbGVyKTsKKwkJCQkJICBnYl9sb2dfcmVxdWVzdF9oYW5kbGVyKTsKIAlp
ZiAoSVNfRVJSKGNvbm5lY3Rpb24pKSB7CiAJCXJldHZhbCA9IFBUUl9FUlIoY29ubmVjdGlvbik7
CiAJCWdvdG8gZXJyb3JfZnJlZTsKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
