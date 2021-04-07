Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC65356970
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:24:20 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E062E6676B
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:24:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D0D776679A; Wed,  7 Apr 2021 10:24:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2FE3666783;
	Wed,  7 Apr 2021 10:23:56 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CFB0766740
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A24526088A; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 44C066088A
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 494C36124B;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008RE-1S; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:23 +0200
Message-Id: <20210407102334.32361-6-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 05/16] staging: greybus: uart: fix TIOCSSERIAL
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

VGhlIHBvcnQgY2xvc2VfZGVsYXkgYW5kIGNsb3Npbmdfd2FpdCBwYXJhbWV0ZXJzIHNldCBieSBU
SU9DU1NFUklBTCBhcmUKc3BlY2lmaWVkIGluIGppZmZpZXMgYW5kIG5vdCBtaWxsaXNlY29uZHMu
CgpBZGQgdGhlIG1pc3NpbmcgY29udmVyc2lvbnMgc28gdGhhdCBUSU9DU1NFUklBTCB3b3JrcyBh
cyBleHBlY3RlZCBhbHNvCndoZW4gSFogaXMgbm90IDEwMDAuCgpGaXhlczogZTY4NDUzZWQyOGM1
ICgiZ3JleWJ1czogdWFydC1nYjogbm93IGJ1aWxkcywgbW9yZSBmcmFtZXdvcmsgYWRkZWQiKQpD
Yzogc3RhYmxlQHZnZXIua2VybmVsLm9yZwkjIDQuOQpTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3Zv
bGQgPGpvaGFuQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5j
IHwgMTEgKysrKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDQgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jCmluZGV4IDYwNzM3OGJmZWJiNy4uMjk4NDZk
YzFlMWJmIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMKKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdWFydC5jCkBAIC02MTQsMTAgKzYxNCwxMiBAQCBzdGF0
aWMgaW50IGdldF9zZXJpYWxfaW5mbyhzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LAogCXNzLT5saW5l
ID0gZ2JfdHR5LT5taW5vcjsKIAlzcy0+eG1pdF9maWZvX3NpemUgPSAxNjsKIAlzcy0+YmF1ZF9i
YXNlID0gOTYwMDsKLQlzcy0+Y2xvc2VfZGVsYXkgPSBnYl90dHktPnBvcnQuY2xvc2VfZGVsYXkg
LyAxMDsKKwlzcy0+Y2xvc2VfZGVsYXkgPSBqaWZmaWVzX3RvX21zZWNzKGdiX3R0eS0+cG9ydC5j
bG9zZV9kZWxheSkgLyAxMDsKIAlzcy0+Y2xvc2luZ193YWl0ID0KIAkJZ2JfdHR5LT5wb3J0LmNs
b3Npbmdfd2FpdCA9PSBBU1lOQ19DTE9TSU5HX1dBSVRfTk9ORSA/Ci0JCUFTWU5DX0NMT1NJTkdf
V0FJVF9OT05FIDogZ2JfdHR5LT5wb3J0LmNsb3Npbmdfd2FpdCAvIDEwOworCQlBU1lOQ19DTE9T
SU5HX1dBSVRfTk9ORSA6CisJCWppZmZpZXNfdG9fbXNlY3MoZ2JfdHR5LT5wb3J0LmNsb3Npbmdf
d2FpdCkgLyAxMDsKKwogCXJldHVybiAwOwogfQogCkBAIC02MjksOSArNjMxLDEwIEBAIHN0YXRp
YyBpbnQgc2V0X3NlcmlhbF9pbmZvKHN0cnVjdCB0dHlfc3RydWN0ICp0dHksCiAJdW5zaWduZWQg
aW50IGNsb3NlX2RlbGF5OwogCWludCByZXR2YWwgPSAwOwogCi0JY2xvc2VfZGVsYXkgPSBzcy0+
Y2xvc2VfZGVsYXkgKiAxMDsKKwljbG9zZV9kZWxheSA9IG1zZWNzX3RvX2ppZmZpZXMoc3MtPmNs
b3NlX2RlbGF5ICogMTApOwogCWNsb3Npbmdfd2FpdCA9IHNzLT5jbG9zaW5nX3dhaXQgPT0gQVNZ
TkNfQ0xPU0lOR19XQUlUX05PTkUgPwotCQkJQVNZTkNfQ0xPU0lOR19XQUlUX05PTkUgOiBzcy0+
Y2xvc2luZ193YWl0ICogMTA7CisJCQlBU1lOQ19DTE9TSU5HX1dBSVRfTk9ORSA6CisJCQltc2Vj
c190b19qaWZmaWVzKHNzLT5jbG9zaW5nX3dhaXQgKiAxMCk7CiAKIAltdXRleF9sb2NrKCZnYl90
dHktPnBvcnQubXV0ZXgpOwogCWlmICghY2FwYWJsZShDQVBfU1lTX0FETUlOKSkgewotLSAKMi4y
Ni4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczov
L2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
