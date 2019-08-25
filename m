Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A54729C231
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 07:55:41 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C693461752
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 05:55:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id BB4BC618B2; Sun, 25 Aug 2019 05:55:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 85868617B5;
	Sun, 25 Aug 2019 05:55:21 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2008060EDE
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0D95461810; Sun, 25 Aug 2019 05:55:14 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1B71160EDE
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:54:59 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 005772173E;
 Sun, 25 Aug 2019 05:54:57 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org
Date: Sun, 25 Aug 2019 07:54:23 +0200
Message-Id: <20190825055429.18547-4-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH 3/9] staging: greybus: hd: Fix up some
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
LgoKQ2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KQ2M6IEFsZXggRWxkZXIgPGVs
ZGVyQGtlcm5lbC5vcmc+CkNjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCkNjOiBkZXZl
bEBkcml2ZXJkZXYub3N1b3NsLm9yZwpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4g
PGdyZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2hkLmMgfCAxMCArKysrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hkLmMg
Yi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oZC5jCmluZGV4IDk2OWY4NjY5NzY3My4uZTJiOWFi
NWY2ZWMyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oZC5jCisrKyBiL2Ry
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hkLmMKQEAgLTMxLDcgKzMxLDcgQEAgaW50IGdiX2hkX291
dHB1dChzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkLCB2b2lkICpyZXEsIHUxNiBzaXplLCB1OCBj
bWQsCiBFWFBPUlRfU1lNQk9MX0dQTChnYl9oZF9vdXRwdXQpOwogCiBzdGF0aWMgc3NpemVfdCBi
dXNfaWRfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsCi0JCQkJc3RydWN0IGRldmljZV9hdHRyaWJ1
dGUgKmF0dHIsIGNoYXIgKmJ1ZikKKwkJCSAgIHN0cnVjdCBkZXZpY2VfYXR0cmlidXRlICphdHRy
LCBjaGFyICpidWYpCiB7CiAJc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCA9IHRvX2diX2hvc3Rf
ZGV2aWNlKGRldik7CiAKQEAgLTcwLDcgKzcwLDcgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZ2JfaGRf
Y3BvcnRfcmVsZWFzZV9yZXNlcnZlZCk7CiAKIC8qIExvY2tpbmc6IENhbGxlciBndWFyYW50ZWVz
IHNlcmlhbGlzYXRpb24gKi8KIGludCBnYl9oZF9jcG9ydF9hbGxvY2F0ZShzdHJ1Y3QgZ2JfaG9z
dF9kZXZpY2UgKmhkLCBpbnQgY3BvcnRfaWQsCi0JCQkJdW5zaWduZWQgbG9uZyBmbGFncykKKwkJ
CSB1bnNpZ25lZCBsb25nIGZsYWdzKQogewogCXN0cnVjdCBpZGEgKmlkX21hcCA9ICZoZC0+Y3Bv
cnRfaWRfbWFwOwogCWludCBpZGFfc3RhcnQsIGlkYV9lbmQ7CkBAIC0xMjIsOSArMTIyLDkgQEAg
c3RydWN0IGRldmljZV90eXBlIGdyZXlidXNfaGRfdHlwZSA9IHsKIH07CiAKIHN0cnVjdCBnYl9o
b3N0X2RldmljZSAqZ2JfaGRfY3JlYXRlKHN0cnVjdCBnYl9oZF9kcml2ZXIgKmRyaXZlciwKLQkJ
CQkJc3RydWN0IGRldmljZSAqcGFyZW50LAotCQkJCQlzaXplX3QgYnVmZmVyX3NpemVfbWF4LAot
CQkJCQlzaXplX3QgbnVtX2Nwb3J0cykKKwkJCQkgICAgc3RydWN0IGRldmljZSAqcGFyZW50LAor
CQkJCSAgICBzaXplX3QgYnVmZmVyX3NpemVfbWF4LAorCQkJCSAgICBzaXplX3QgbnVtX2Nwb3J0
cykKIHsKIAlzdHJ1Y3QgZ2JfaG9zdF9kZXZpY2UgKmhkOwogCWludCByZXQ7Ci0tIAoyLjIzLjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
