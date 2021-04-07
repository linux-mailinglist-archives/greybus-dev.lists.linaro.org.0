Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B92356998
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:26:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A16796088A
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:26:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8DA956187F; Wed,  7 Apr 2021 10:26:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13BB06679A;
	Wed,  7 Apr 2021 10:24:35 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7185566707
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 666036678F; Wed,  7 Apr 2021 10:24:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 3CF4C66707
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E294613CE;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008RQ-BN; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:27 +0200
Message-Id: <20210407102334.32361-10-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 09/16] tty: amiserial: add missing TIOCSSERIAL
	jiffies conversions
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

VGhlIHR0eS1wb3J0IGNsb3NlX2RlbGF5IGFuZCBjbG9zaW5nX3dhaXQgcGFyYW1ldGVycyBzZXQg
YnkgVElPQ1NTRVJJQUwKYXJlIHNwZWNpZmllZCBpbiBqaWZmaWVzLCB3aGlsZSB0aGUgdmFsdWVz
IHJldHVybmVkIGJ5IFRJT0NHU0VSSUFMIGFyZQpzcGVjaWZpZWQgaW4gY2VudGlzZWNvbmRzLgoK
QWRkIHRoZSBtaXNzaW5nIGNvbnZlcnNpb25zIHNvIHRoYXQgVElPQ1NTRVJJQUwgd29ya3MgYXMg
ZXhwZWN0ZWQgYWxzbwppZiB0aGlzIGNvZGUgaXMgZXZlciByZXVzZWQgb24gYSBzeXN0ZW0gd2hl
cmUgSFogaXMgbm90IDEwMC4KClNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2Vy
bmVsLm9yZz4KLS0tCiBkcml2ZXJzL3R0eS9hbWlzZXJpYWwuYyB8IDI2ICsrKysrKysrKysrKysr
KysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTkgaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9hbWlzZXJpYWwuYyBiL2RyaXZlcnMvdHR5
L2FtaXNlcmlhbC5jCmluZGV4IGVjNjgwMmJhMmJmOC4uY2E0OGNlNWEwODYyIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3R0eS9hbWlzZXJpYWwuYworKysgYi9kcml2ZXJzL3R0eS9hbWlzZXJpYWwuYwpA
QCAtOTM3LDE1ICs5MzcsMjEgQEAgc3RhdGljIHZvaWQgcnNfdW50aHJvdHRsZShzdHJ1Y3QgdHR5
X3N0cnVjdCAqIHR0eSkKIHN0YXRpYyBpbnQgZ2V0X3NlcmlhbF9pbmZvKHN0cnVjdCB0dHlfc3Ry
dWN0ICp0dHksIHN0cnVjdCBzZXJpYWxfc3RydWN0ICpzcykKIHsKIAlzdHJ1Y3Qgc2VyaWFsX3N0
YXRlICpzdGF0ZSA9IHR0eS0+ZHJpdmVyX2RhdGE7CisJdW5zaWduZWQgaW50IGNsb3NlX2RlbGF5
LCBjbG9zaW5nX3dhaXQ7CiAKIAl0dHlfbG9jayh0dHkpOworCWNsb3NlX2RlbGF5ID0gamlmZmll
c190b19tc2VjcyhzdGF0ZS0+dHBvcnQuY2xvc2VfZGVsYXkpIC8gMTA7CisJY2xvc2luZ193YWl0
ID0gc3RhdGUtPnRwb3J0LmNsb3Npbmdfd2FpdDsKKwlpZiAoY2xvc2luZ193YWl0ICE9IEFTWU5D
X0NMT1NJTkdfV0FJVF9OT05FKQorCQljbG9zaW5nX3dhaXQgPSBqaWZmaWVzX3RvX21zZWNzKGNs
b3Npbmdfd2FpdCkgLyAxMDsKKwogCXNzLT5saW5lID0gdHR5LT5pbmRleDsKIAlzcy0+cG9ydCA9
IHN0YXRlLT5wb3J0OwogCXNzLT5mbGFncyA9IHN0YXRlLT50cG9ydC5mbGFnczsKIAlzcy0+eG1p
dF9maWZvX3NpemUgPSBzdGF0ZS0+eG1pdF9maWZvX3NpemU7CiAJc3MtPmJhdWRfYmFzZSA9IHN0
YXRlLT5iYXVkX2Jhc2U7Ci0Jc3MtPmNsb3NlX2RlbGF5ID0gc3RhdGUtPnRwb3J0LmNsb3NlX2Rl
bGF5OwotCXNzLT5jbG9zaW5nX3dhaXQgPSBzdGF0ZS0+dHBvcnQuY2xvc2luZ193YWl0OworCXNz
LT5jbG9zZV9kZWxheSA9IGNsb3NlX2RlbGF5OworCXNzLT5jbG9zaW5nX3dhaXQgPSBjbG9zaW5n
X3dhaXQ7CiAJc3MtPmN1c3RvbV9kaXZpc29yID0gc3RhdGUtPmN1c3RvbV9kaXZpc29yOwogCXR0
eV91bmxvY2sodHR5KTsKIAlyZXR1cm4gMDsKQEAgLTk1Nyw2ICs5NjMsNyBAQCBzdGF0aWMgaW50
IHNldF9zZXJpYWxfaW5mbyhzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LCBzdHJ1Y3Qgc2VyaWFsX3N0
cnVjdCAqc3MpCiAJc3RydWN0IHR0eV9wb3J0ICpwb3J0ID0gJnN0YXRlLT50cG9ydDsKIAlib29s
IGNoYW5nZV9zcGQ7CiAJaW50IAkJCXJldHZhbCA9IDA7CisJdW5zaWduZWQgaW50IGNsb3NlX2Rl
bGF5LCBjbG9zaW5nX3dhaXQ7CiAKIAl0dHlfbG9jayh0dHkpOwogCWNoYW5nZV9zcGQgPSAoKHNz
LT5mbGFncyBeIHBvcnQtPmZsYWdzKSAmIEFTWU5DX1NQRF9NQVNLKSB8fApAQCAtOTY2LDExICs5
NzMsMTYgQEAgc3RhdGljIGludCBzZXRfc2VyaWFsX2luZm8oc3RydWN0IHR0eV9zdHJ1Y3QgKnR0
eSwgc3RydWN0IHNlcmlhbF9zdHJ1Y3QgKnNzKQogCQl0dHlfdW5sb2NrKHR0eSk7CiAJCXJldHVy
biAtRUlOVkFMOwogCX0KLSAgCisKKwljbG9zZV9kZWxheSA9IG1zZWNzX3RvX2ppZmZpZXMoc3Mt
PmNsb3NlX2RlbGF5ICogMTApOworCWNsb3Npbmdfd2FpdCA9IHNzLT5jbG9zaW5nX3dhaXQ7CisJ
aWYgKGNsb3Npbmdfd2FpdCAhPSBBU1lOQ19DTE9TSU5HX1dBSVRfTk9ORSkKKwkJY2xvc2luZ193
YWl0ID0gbXNlY3NfdG9famlmZmllcyhjbG9zaW5nX3dhaXQgKiAxMCk7CisKIAlpZiAoIXNlcmlh
bF9pc3Jvb3QoKSkgewogCQlpZiAoKHNzLT5iYXVkX2Jhc2UgIT0gc3RhdGUtPmJhdWRfYmFzZSkg
fHwKLQkJICAgIChzcy0+Y2xvc2VfZGVsYXkgIT0gcG9ydC0+Y2xvc2VfZGVsYXkpIHx8Ci0JCSAg
ICAoc3MtPmNsb3Npbmdfd2FpdCAhPSBwb3J0LT5jbG9zaW5nX3dhaXQpIHx8CisJCSAgICAoY2xv
c2VfZGVsYXkgIT0gcG9ydC0+Y2xvc2VfZGVsYXkpIHx8CisJCSAgICAoY2xvc2luZ193YWl0ICE9
IHBvcnQtPmNsb3Npbmdfd2FpdCkgfHwKIAkJICAgIChzcy0+eG1pdF9maWZvX3NpemUgIT0gc3Rh
dGUtPnhtaXRfZmlmb19zaXplKSB8fAogCQkgICAgKChzcy0+ZmxhZ3MgJiB+QVNZTkNfVVNSX01B
U0spICE9CiAJCSAgICAgKHBvcnQtPmZsYWdzICYgfkFTWU5DX1VTUl9NQVNLKSkpIHsKQEAgLTk5
Nyw4ICsxMDA5LDggQEAgc3RhdGljIGludCBzZXRfc2VyaWFsX2luZm8oc3RydWN0IHR0eV9zdHJ1
Y3QgKnR0eSwgc3RydWN0IHNlcmlhbF9zdHJ1Y3QgKnNzKQogCXBvcnQtPmZsYWdzID0gKChwb3J0
LT5mbGFncyAmIH5BU1lOQ19GTEFHUykgfAogCQkJKHNzLT5mbGFncyAmIEFTWU5DX0ZMQUdTKSk7
CiAJc3RhdGUtPmN1c3RvbV9kaXZpc29yID0gc3MtPmN1c3RvbV9kaXZpc29yOwotCXBvcnQtPmNs
b3NlX2RlbGF5ID0gc3MtPmNsb3NlX2RlbGF5ICogSFovMTAwOwotCXBvcnQtPmNsb3Npbmdfd2Fp
dCA9IHNzLT5jbG9zaW5nX3dhaXQgKiBIWi8xMDA7CisJcG9ydC0+Y2xvc2VfZGVsYXkgPSBjbG9z
ZV9kZWxheTsKKwlwb3J0LT5jbG9zaW5nX3dhaXQgPSBjbG9zaW5nX3dhaXQ7CiAKIGNoZWNrX2Fu
ZF9leGl0OgogCWlmICh0dHlfcG9ydF9pbml0aWFsaXplZChwb3J0KSkgewotLSAKMi4yNi4zCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
