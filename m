Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FF33569A1
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:28:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2CAAA6088A
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:28:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 20FA46187F; Wed,  7 Apr 2021 10:28:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1AD38667B1;
	Wed,  7 Apr 2021 10:24:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7B48F66742
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6E00866799; Wed,  7 Apr 2021 10:24:24 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1068B66742
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id ED45D613EA;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008Rc-Ma; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:31 +0200
Message-Id: <20210407102334.32361-14-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 13/16] tty: mxser: fix TIOCSSERIAL jiffies
	conversions
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

VGhlIHBvcnQgY2xvc2VfZGVsYXkgYW5kIGNsb3Npbmcgd2FpdCBwYXJhbWV0ZXJzIHNldCBieSBU
SU9DU1NFUklBTCBhcmUKc3BlY2lmaWVkIGluIGppZmZpZXMsIHdoaWxlIHRoZSB2YWx1ZXMgcmV0
dXJuZWQgYnkgVElPQ0dTRVJJQUwgYXJlCnNwZWNpZmllZCBpbiBjZW50aXNlY29uZHMuCgpBZGQg
dGhlIG1pc3NpbmcgY29udmVyc2lvbnMgc28gdGhhdCBUSU9DU1NFUklBTCB3b3JrcyBhcyBleHBl
Y3RlZCBhbHNvCndoZW4gSFogaXMgbm90IDEwMC4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwub3Jn
ClNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0tCiBkcml2
ZXJzL3R0eS9teHNlci5jIHwgMjQgKysrKysrKysrKysrKysrKysrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3R0eS9teHNlci5jIGIvZHJpdmVycy90dHkvbXhzZXIuYwppbmRleCA0MjAzYjY0YmNjZGIu
LjkxNGIyMzA3MTk2MSAxMDA2NDQKLS0tIGEvZHJpdmVycy90dHkvbXhzZXIuYworKysgYi9kcml2
ZXJzL3R0eS9teHNlci5jCkBAIC0xMjA4LDE5ICsxMjA4LDI2IEBAIHN0YXRpYyBpbnQgbXhzZXJf
Z2V0X3NlcmlhbF9pbmZvKHN0cnVjdCB0dHlfc3RydWN0ICp0dHksCiB7CiAJc3RydWN0IG14c2Vy
X3BvcnQgKmluZm8gPSB0dHktPmRyaXZlcl9kYXRhOwogCXN0cnVjdCB0dHlfcG9ydCAqcG9ydCA9
ICZpbmZvLT5wb3J0OworCXVuc2lnbmVkIGludCBjbG9zaW5nX3dhaXQsIGNsb3NlX2RlbGF5Owog
CiAJaWYgKHR0eS0+aW5kZXggPT0gTVhTRVJfUE9SVFMpCiAJCXJldHVybiAtRU5PVFRZOwogCiAJ
bXV0ZXhfbG9jaygmcG9ydC0+bXV0ZXgpOworCisJY2xvc2VfZGVsYXkgPSBqaWZmaWVzX3RvX21z
ZWNzKGluZm8tPnBvcnQuY2xvc2VfZGVsYXkpIC8gMTA7CisJY2xvc2luZ193YWl0ID0gaW5mby0+
cG9ydC5jbG9zaW5nX3dhaXQ7CisJaWYgKGNsb3Npbmdfd2FpdCAhPSBBU1lOQ19DTE9TSU5HX1dB
SVRfTk9ORSkKKwkJY2xvc2luZ193YWl0ID0gamlmZmllc190b19tc2VjcyhjbG9zaW5nX3dhaXQp
IC8gMTA7CisKIAlzcy0+dHlwZSA9IGluZm8tPnR5cGUsCiAJc3MtPmxpbmUgPSB0dHktPmluZGV4
LAogCXNzLT5wb3J0ID0gaW5mby0+aW9hZGRyLAogCXNzLT5pcnEgPSBpbmZvLT5ib2FyZC0+aXJx
LAogCXNzLT5mbGFncyA9IGluZm8tPnBvcnQuZmxhZ3MsCiAJc3MtPmJhdWRfYmFzZSA9IGluZm8t
PmJhdWRfYmFzZSwKLQlzcy0+Y2xvc2VfZGVsYXkgPSBpbmZvLT5wb3J0LmNsb3NlX2RlbGF5LAot
CXNzLT5jbG9zaW5nX3dhaXQgPSBpbmZvLT5wb3J0LmNsb3Npbmdfd2FpdCwKKwlzcy0+Y2xvc2Vf
ZGVsYXkgPSBjbG9zZV9kZWxheTsKKwlzcy0+Y2xvc2luZ193YWl0ID0gY2xvc2luZ193YWl0Owog
CXNzLT5jdXN0b21fZGl2aXNvciA9IGluZm8tPmN1c3RvbV9kaXZpc29yLAogCW11dGV4X3VubG9j
aygmcG9ydC0+bXV0ZXgpOwogCXJldHVybiAwOwpAQCAtMTIzMyw3ICsxMjQwLDcgQEAgc3RhdGlj
IGludCBteHNlcl9zZXRfc2VyaWFsX2luZm8oc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwKIAlzdHJ1
Y3QgdHR5X3BvcnQgKnBvcnQgPSAmaW5mby0+cG9ydDsKIAlzcGVlZF90IGJhdWQ7CiAJdW5zaWdu
ZWQgbG9uZyBzbF9mbGFnczsKLQl1bnNpZ25lZCBpbnQgZmxhZ3M7CisJdW5zaWduZWQgaW50IGZs
YWdzLCBjbG9zZV9kZWxheSwgY2xvc2luZ193YWl0OwogCWludCByZXR2YWwgPSAwOwogCiAJaWYg
KHR0eS0+aW5kZXggPT0gTVhTRVJfUE9SVFMpCkBAIC0xMjU1LDkgKzEyNjIsMTQgQEAgc3RhdGlj
IGludCBteHNlcl9zZXRfc2VyaWFsX2luZm8oc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwKIAogCWZs
YWdzID0gcG9ydC0+ZmxhZ3MgJiBBU1lOQ19TUERfTUFTSzsKIAorCWNsb3NlX2RlbGF5ID0gbXNl
Y3NfdG9famlmZmllcyhzcy0+Y2xvc2VfZGVsYXkgKiAxMCk7CisJY2xvc2luZ193YWl0ID0gc3Mt
PmNsb3Npbmdfd2FpdDsKKwlpZiAoY2xvc2luZ193YWl0ICE9IEFTWU5DX0NMT1NJTkdfV0FJVF9O
T05FKQorCQljbG9zaW5nX3dhaXQgPSBtc2Vjc190b19qaWZmaWVzKGNsb3Npbmdfd2FpdCAqIDEw
KTsKKwogCWlmICghY2FwYWJsZShDQVBfU1lTX0FETUlOKSkgewogCQlpZiAoKHNzLT5iYXVkX2Jh
c2UgIT0gaW5mby0+YmF1ZF9iYXNlKSB8fAotCQkJCShzcy0+Y2xvc2VfZGVsYXkgIT0gaW5mby0+
cG9ydC5jbG9zZV9kZWxheSkgfHwKKwkJCQkoY2xvc2VfZGVsYXkgIT0gaW5mby0+cG9ydC5jbG9z
ZV9kZWxheSkgfHwKIAkJCQkoKHNzLT5mbGFncyAmIH5BU1lOQ19VU1JfTUFTSykgIT0gKGluZm8t
PnBvcnQuZmxhZ3MgJiB+QVNZTkNfVVNSX01BU0spKSkgewogCQkJbXV0ZXhfdW5sb2NrKCZwb3J0
LT5tdXRleCk7CiAJCQlyZXR1cm4gLUVQRVJNOwpAQCAtMTI3MSw4ICsxMjgzLDggQEAgc3RhdGlj
IGludCBteHNlcl9zZXRfc2VyaWFsX2luZm8oc3RydWN0IHR0eV9zdHJ1Y3QgKnR0eSwKIAkJICov
CiAJCXBvcnQtPmZsYWdzID0gKChwb3J0LT5mbGFncyAmIH5BU1lOQ19GTEFHUykgfAogCQkJCShz
cy0+ZmxhZ3MgJiBBU1lOQ19GTEFHUykpOwotCQlwb3J0LT5jbG9zZV9kZWxheSA9IHNzLT5jbG9z
ZV9kZWxheSAqIEhaIC8gMTAwOwotCQlwb3J0LT5jbG9zaW5nX3dhaXQgPSBzcy0+Y2xvc2luZ193
YWl0ICogSFogLyAxMDA7CisJCXBvcnQtPmNsb3NlX2RlbGF5ID0gY2xvc2VfZGVsYXk7CisJCXBv
cnQtPmNsb3Npbmdfd2FpdCA9IGNsb3Npbmdfd2FpdDsKIAkJaWYgKChwb3J0LT5mbGFncyAmIEFT
WU5DX1NQRF9NQVNLKSA9PSBBU1lOQ19TUERfQ1VTVCAmJgogCQkJCShzcy0+YmF1ZF9iYXNlICE9
IGluZm8tPmJhdWRfYmFzZSB8fAogCQkJCXNzLT5jdXN0b21fZGl2aXNvciAhPQotLSAKMi4yNi4z
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xp
c3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
