Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 60647356989
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:25:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 80C7F667B7
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:25:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 75263667BC; Wed,  7 Apr 2021 10:25:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A654C6678D;
	Wed,  7 Apr 2021 10:24:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1EF8B61957
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0C47166779; Wed,  7 Apr 2021 10:23:55 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 4B66661957
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4C24F613A7;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5La-0008R4-PD; Wed, 07 Apr 2021 12:23:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:20 +0200
Message-Id: <20210407102334.32361-3-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 02/16] staging: fwserial: fix TIOCSSERIAL
	permission check
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

Q2hhbmdpbmcgdGhlIHBvcnQgY2xvc2UtZGVsYXkgcGFyYW1ldGVyIGlzIGEgcHJpdmlsZWdlZCBv
cGVyYXRpb24gc28KbWFrZSBzdXJlIHRvIHJldHVybiAtRVBFUk0gaWYgYSByZWd1bGFyIHVzZXIg
dHJpZXMgdG8gY2hhbmdlIGl0LgoKRml4ZXM6IDczNTViYTM0NDVmMiAoInN0YWdpbmc6IGZ3c2Vy
aWFsOiBBZGQgVFRZLW92ZXItRmlyZXdpcmUgc2VyaWFsIGRyaXZlciIpCkNjOiBzdGFibGVAdmdl
ci5rZXJuZWwub3JnICAgICAgIyAzLjgKU2lnbmVkLW9mZi1ieTogSm9oYW4gSG92b2xkIDxqb2hh
bkBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9md3NlcmlhbC9md3NlcmlhbC5jIHwg
OCArKysrKystLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZndzZXJpYWwvZndzZXJpYWwuYyBiL2Ry
aXZlcnMvc3RhZ2luZy9md3NlcmlhbC9md3NlcmlhbC5jCmluZGV4IGM5NjM4NDg1MjJiMS4uNDQw
ZDExNDIzODEyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZndzZXJpYWwvZndzZXJpYWwu
YworKysgYi9kcml2ZXJzL3N0YWdpbmcvZndzZXJpYWwvZndzZXJpYWwuYwpAQCAtMTIzMiwyMCAr
MTIzMiwyNCBAQCBzdGF0aWMgaW50IHNldF9zZXJpYWxfaW5mbyhzdHJ1Y3QgdHR5X3N0cnVjdCAq
dHR5LAogCQkJICAgc3RydWN0IHNlcmlhbF9zdHJ1Y3QgKnNzKQogewogCXN0cnVjdCBmd3R0eV9w
b3J0ICpwb3J0ID0gdHR5LT5kcml2ZXJfZGF0YTsKKwl1bnNpZ25lZCBpbnQgY2RlbGF5OwogCiAJ
aWYgKHNzLT5pcnEgIT0gMCB8fCBzcy0+cG9ydCAhPSAwIHx8IHNzLT5jdXN0b21fZGl2aXNvciAh
PSAwIHx8CiAJICAgIHNzLT5iYXVkX2Jhc2UgIT0gNDAwMDAwMDAwKQogCQlyZXR1cm4gLUVQRVJN
OwogCisJY2RlbGF5ID0gbXNlY3NfdG9famlmZmllcyhzcy0+Y2xvc2VfZGVsYXkgKiAxMCk7CisK
IAltdXRleF9sb2NrKCZwb3J0LT5wb3J0Lm11dGV4KTsKIAlpZiAoIWNhcGFibGUoQ0FQX1NZU19B
RE1JTikpIHsKLQkJaWYgKCgoc3MtPmZsYWdzICYgfkFTWU5DX1VTUl9NQVNLKSAhPQorCQlpZiAo
Y2RlbGF5ICE9IHBvcnQtPnBvcnQuY2xvc2VfZGVsYXkgfHwKKwkJICAgICgoc3MtPmZsYWdzICYg
fkFTWU5DX1VTUl9NQVNLKSAhPQogCQkgICAgIChwb3J0LT5wb3J0LmZsYWdzICYgfkFTWU5DX1VT
Ul9NQVNLKSkpIHsKIAkJCW11dGV4X3VubG9jaygmcG9ydC0+cG9ydC5tdXRleCk7CiAJCQlyZXR1
cm4gLUVQRVJNOwogCQl9CiAJfQotCXBvcnQtPnBvcnQuY2xvc2VfZGVsYXkgPSBtc2Vjc190b19q
aWZmaWVzKHNzLT5jbG9zZV9kZWxheSAqIDEwKTsKKwlwb3J0LT5wb3J0LmNsb3NlX2RlbGF5ID0g
Y2RlbGF5OwogCW11dGV4X3VubG9jaygmcG9ydC0+cG9ydC5tdXRleCk7CiAKIAlyZXR1cm4gMDsK
LS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
