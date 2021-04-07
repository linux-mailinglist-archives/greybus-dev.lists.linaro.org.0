Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E421335699B
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:27:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D7FE6088A
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:27:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0F2E961957; Wed,  7 Apr 2021 10:27:36 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6B905667A6;
	Wed,  7 Apr 2021 10:24:43 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1C9466673E
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0E87B66790; Wed,  7 Apr 2021 10:24:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 734756673E
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C3C75613E5;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008RW-Gp; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:29 +0200
Message-Id: <20210407102334.32361-12-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 11/16] tty: moxa: fix TIOCSSERIAL permission
	check
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

Q2hhbmdpbmcgdGhlIHBvcnQgY2xvc2UgZGVsYXkgb3IgdHlwZSBhcmUgcHJpdmlsZWdlZCBvcGVy
YXRpb25zIHNvIG1ha2UKc3VyZSB0byByZXR1cm4gLUVQRVJNIGlmIGEgcmVndWxhciB1c2VyIHRy
aWVzIHRvIGNoYW5nZSB0aGVtLgoKQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcKU2lnbmVkLW9m
Zi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvdHR5L21v
eGEuYyB8IDE2ICsrKysrKysrKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdHR5L21veGEuYyBiL2Ry
aXZlcnMvdHR5L21veGEuYwppbmRleCA1YjdiYzdhZjhiMWUuLjYzZTQ0MGQ5MDBmZiAxMDA2NDQK
LS0tIGEvZHJpdmVycy90dHkvbW94YS5jCisrKyBiL2RyaXZlcnMvdHR5L21veGEuYwpAQCAtMjA0
OCw2ICsyMDQ4LDcgQEAgc3RhdGljIGludCBtb3hhX3NldF9zZXJpYWxfaW5mbyhzdHJ1Y3QgdHR5
X3N0cnVjdCAqdHR5LAogCQlzdHJ1Y3Qgc2VyaWFsX3N0cnVjdCAqc3MpCiB7CiAJc3RydWN0IG1v
eGFfcG9ydCAqaW5mbyA9IHR0eS0+ZHJpdmVyX2RhdGE7CisJdW5zaWduZWQgaW50IGNsb3NlX2Rl
bGF5OwogCiAJaWYgKHR0eS0+aW5kZXggPT0gTUFYX1BPUlRTKQogCQlyZXR1cm4gLUVJTlZBTDsK
QEAgLTIwNTksMTkgKzIwNjAsMjQgQEAgc3RhdGljIGludCBtb3hhX3NldF9zZXJpYWxfaW5mbyhz
dHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LAogCQkJc3MtPmJhdWRfYmFzZSAhPSA5MjE2MDApCiAJCXJl
dHVybiAtRVBFUk07CiAKKwljbG9zZV9kZWxheSA9IG1zZWNzX3RvX2ppZmZpZXMoc3MtPmNsb3Nl
X2RlbGF5ICogMTApOworCiAJbXV0ZXhfbG9jaygmaW5mby0+cG9ydC5tdXRleCk7CiAJaWYgKCFj
YXBhYmxlKENBUF9TWVNfQURNSU4pKSB7Ci0JCWlmICgoKHNzLT5mbGFncyAmIH5BU1lOQ19VU1Jf
TUFTSykgIT0KKwkJaWYgKGNsb3NlX2RlbGF5ICE9IGluZm8tPnBvcnQuY2xvc2VfZGVsYXkgfHwK
KwkJICAgIHNzLT50eXBlICE9IGluZm8tPnR5cGUgfHwKKwkJICAgICgoc3MtPmZsYWdzICYgfkFT
WU5DX1VTUl9NQVNLKSAhPQogCQkgICAgIChpbmZvLT5wb3J0LmZsYWdzICYgfkFTWU5DX1VTUl9N
QVNLKSkpIHsKIAkJCW11dGV4X3VubG9jaygmaW5mby0+cG9ydC5tdXRleCk7CiAJCQlyZXR1cm4g
LUVQRVJNOwogCQl9Ci0JfQotCWluZm8tPnBvcnQuY2xvc2VfZGVsYXkgPSBtc2Vjc190b19qaWZm
aWVzKHNzLT5jbG9zZV9kZWxheSAqIDEwKTsKKwl9IGVsc2UgeworCQlpbmZvLT5wb3J0LmNsb3Nl
X2RlbGF5ID0gY2xvc2VfZGVsYXk7CiAKLQlNb3hhU2V0RmlmbyhpbmZvLCBzcy0+dHlwZSA9PSBQ
T1JUXzE2NTUwQSk7CisJCU1veGFTZXRGaWZvKGluZm8sIHNzLT50eXBlID09IFBPUlRfMTY1NTBB
KTsKIAotCWluZm8tPnR5cGUgPSBzcy0+dHlwZTsKKwkJaW5mby0+dHlwZSA9IHNzLT50eXBlOwor
CX0KIAltdXRleF91bmxvY2soJmluZm8tPnBvcnQubXV0ZXgpOwogCXJldHVybiAwOwogfQotLSAK
Mi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpn
cmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRw
czovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
