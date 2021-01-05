Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B580E2EAE13
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 16:18:06 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DA17F66729
	for <lists+greybus-dev@lfdr.de>; Tue,  5 Jan 2021 15:18:05 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C41916672A; Tue,  5 Jan 2021 15:18:05 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61C0E66723;
	Tue,  5 Jan 2021 15:17:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 472FF6090B
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 15:17:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 389CD608ED; Tue,  5 Jan 2021 15:17:48 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 26D40608ED
 for <greybus-dev@lists.linaro.org>; Tue,  5 Jan 2021 15:17:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BCDE722B45;
 Tue,  5 Jan 2021 15:17:45 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: greybus-dev@lists.linaro.org
Date: Tue,  5 Jan 2021 16:19:02 +0100
Message-Id: <20210105151903.1761635-1-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 linus-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: vibrator: use proper
	API for vibrator devices
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

VGhlIGNvcnJlY3QgdXNlci9rZXJuZWwgYXBpIGZvciB2aWJyYXRvciBkZXZpY2VzIGlzIHRoZSBJ
bnB1dCBydW1ibGUKYXBpLCBub3QgYSByYW5kb20gc3lzZnMgZmlsZSBsaWtlIHRoZSBncmV5YnVz
IHZpYnJhdG9yIGRyaXZlciBjdXJyZW50bHkKdXNlcy4KCkFkZCBzdXBwb3J0IGZvciB0aGUgY29y
cmVjdCBpbnB1dCBhcGkgdG8gdGhlIHZpYnJhdG9yIGRyaXZlciBzbyB0aGF0IGl0Cmhvb2tzIHVw
IHRvIHRoZSBrZXJuZWwgYW5kIHVzZXJzcGFjZSBjb3JyZWN0bHkuCgpDYzogSm9oYW4gSG92b2xk
IDxqb2hhbkBrZXJuZWwub3JnPgpDYzogQWxleCBFbGRlciA8ZWxkZXJAa2VybmVsLm9yZz4KU2ln
bmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVna2hAbGludXhmb3VuZGF0aW9uLm9y
Zz4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jIHwgNTkgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTkgaW5zZXJ0aW9ucygrKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3ZpYnJhdG9yLmMgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jCmluZGV4IDBlMmIxODhlNWNhMy4uOTQxMTBjYWRi
NWJkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy92aWJyYXRvci5jCisrKyBi
L2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3ZpYnJhdG9yLmMKQEAgLTEzLDEzICsxMywxOCBAQAog
I2luY2x1ZGUgPGxpbnV4L2tkZXZfdC5oPgogI2luY2x1ZGUgPGxpbnV4L2lkci5oPgogI2luY2x1
ZGUgPGxpbnV4L3BtX3J1bnRpbWUuaD4KKyNpbmNsdWRlIDxsaW51eC9pbnB1dC5oPgogI2luY2x1
ZGUgPGxpbnV4L2dyZXlidXMuaD4KIAogc3RydWN0IGdiX3ZpYnJhdG9yX2RldmljZSB7CiAJc3Ry
dWN0IGdiX2Nvbm5lY3Rpb24JKmNvbm5lY3Rpb247CisJc3RydWN0IGlucHV0X2RldgkqaW5wdXQ7
CiAJc3RydWN0IGRldmljZQkJKmRldjsKIAlpbnQJCQltaW5vcjsJCS8qIHZpYnJhdG9yIG1pbm9y
IG51bWJlciAqLwogCXN0cnVjdCBkZWxheWVkX3dvcmsgICAgIGRlbGF5ZWRfd29yazsKKwlib29s
CQkJcnVubmluZzsKKwlib29sCQkJb247CisJc3RydWN0IHdvcmtfc3RydWN0CXBsYXlfd29yazsK
IH07CiAKIC8qIEdyZXlidXMgVmlicmF0b3Igb3BlcmF0aW9uIHR5cGVzICovCkBAIC0zNiw2ICs0
MSw3IEBAIHN0YXRpYyBpbnQgdHVybl9vZmYoc3RydWN0IGdiX3ZpYnJhdG9yX2RldmljZSAqdmli
KQogCiAJZ2JfcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoYnVuZGxlKTsKIAorCXZpYi0+b24g
PSBmYWxzZTsKIAlyZXR1cm4gcmV0OwogfQogCkBAIC01OSwxMSArNjUsNDggQEAgc3RhdGljIGlu
dCB0dXJuX29uKHN0cnVjdCBnYl92aWJyYXRvcl9kZXZpY2UgKnZpYiwgdTE2IHRpbWVvdXRfbXMp
CiAJCXJldHVybiByZXQ7CiAJfQogCisJdmliLT5vbiA9IHRydWU7CiAJc2NoZWR1bGVfZGVsYXll
ZF93b3JrKCZ2aWItPmRlbGF5ZWRfd29yaywgbXNlY3NfdG9famlmZmllcyh0aW1lb3V0X21zKSk7
CiAKIAlyZXR1cm4gMDsKIH0KIAorc3RhdGljIHZvaWQgZ2JfdmlicmF0b3JfcGxheV93b3JrKHN0
cnVjdCB3b3JrX3N0cnVjdCAqd29yaykKK3sKKwlzdHJ1Y3QgZ2JfdmlicmF0b3JfZGV2aWNlICp2
aWIgPQorCQljb250YWluZXJfb2Yod29yaywgc3RydWN0IGdiX3ZpYnJhdG9yX2RldmljZSwgcGxh
eV93b3JrKTsKKworCWlmICh2aWItPnJ1bm5pbmcpCisJCXR1cm5fb2ZmKHZpYik7CisJZWxzZQor
CQl0dXJuX29uKHZpYiwgMTAwKTsKK30KKworc3RhdGljIGludCBnYl92aWJyYXRvcl9wbGF5X2Vm
ZmVjdChzdHJ1Y3QgaW5wdXRfZGV2ICppbnB1dCwgdm9pZCAqZGF0YSwKKwkJCQkgICBzdHJ1Y3Qg
ZmZfZWZmZWN0ICplZmZlY3QpCit7CisJc3RydWN0IGdiX3ZpYnJhdG9yX2RldmljZSAqdmliID0g
aW5wdXRfZ2V0X2RydmRhdGEoaW5wdXQpOworCWludCBsZXZlbDsKKworCWxldmVsID0gZWZmZWN0
LT51LnJ1bWJsZS5zdHJvbmdfbWFnbml0dWRlOworCWlmICghbGV2ZWwpCisJCWxldmVsID0gZWZm
ZWN0LT51LnJ1bWJsZS53ZWFrX21hZ25pdHVkZTsKKworCXZpYi0+cnVubmluZyA9IGxldmVsOwor
CXNjaGVkdWxlX3dvcmsoJnZpYi0+cGxheV93b3JrKTsKKwlyZXR1cm4gMDsKK30KKworc3RhdGlj
IHZvaWQgZ2JfdmlicmF0b3JfY2xvc2Uoc3RydWN0IGlucHV0X2RldiAqaW5wdXQpCit7CisJc3Ry
dWN0IGdiX3ZpYnJhdG9yX2RldmljZSAqdmliID0gaW5wdXRfZ2V0X2RydmRhdGEoaW5wdXQpOwor
CisJY2FuY2VsX2RlbGF5ZWRfd29ya19zeW5jKCZ2aWItPmRlbGF5ZWRfd29yayk7CisJY2FuY2Vs
X3dvcmtfc3luYygmdmliLT5wbGF5X3dvcmspOworCXR1cm5fb2ZmKHZpYik7CisJdmliLT5ydW5u
aW5nID0gZmFsc2U7Cit9CisKIHN0YXRpYyB2b2lkIGdiX3ZpYnJhdG9yX3dvcmtlcihzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspCiB7CiAJc3RydWN0IGRlbGF5ZWRfd29yayAqZGVsYXllZF93b3Jr
ID0gdG9fZGVsYXllZF93b3JrKHdvcmspOwpAQCAtMTY5LDEwICsyMTIsMjYgQEAgc3RhdGljIGlu
dCBnYl92aWJyYXRvcl9wcm9iZShzdHJ1Y3QgZ2JfYnVuZGxlICpidW5kbGUsCiAKIAlJTklUX0RF
TEFZRURfV09SSygmdmliLT5kZWxheWVkX3dvcmssIGdiX3ZpYnJhdG9yX3dvcmtlcik7CiAKKwlJ
TklUX1dPUksoJnZpYi0+cGxheV93b3JrLCBnYl92aWJyYXRvcl9wbGF5X3dvcmspOworCXZpYi0+
aW5wdXQtPm5hbWUgPSAiZ3JleWJ1cy12aWJyYXRvciI7CisJdmliLT5pbnB1dC0+Y2xvc2UgPSBn
Yl92aWJyYXRvcl9jbG9zZTsKKwl2aWItPmlucHV0LT5kZXYucGFyZW50ID0gJmJ1bmRsZS0+ZGV2
OworCXZpYi0+aW5wdXQtPmlkLmJ1c3R5cGUgPSBCVVNfSE9TVDsKKworCWlucHV0X3NldF9kcnZk
YXRhKHZpYi0+aW5wdXQsIHZpYik7CisJaW5wdXRfc2V0X2NhcGFiaWxpdHkodmliLT5pbnB1dCwg
RVZfRkYsIEZGX1JVTUJMRSk7CisKKwlyZXR2YWwgPSBpbnB1dF9mZl9jcmVhdGVfbWVtbGVzcyh2
aWItPmlucHV0LCBOVUxMLAorCQkJCQkgZ2JfdmlicmF0b3JfcGxheV9lZmZlY3QpOworCWlmIChy
ZXR2YWwpCisJCWdvdG8gZXJyX2RldmljZV9yZW1vdmU7CisKIAlnYl9wbV9ydW50aW1lX3B1dF9h
dXRvc3VzcGVuZChidW5kbGUpOwogCiAJcmV0dXJuIDA7CiAKK2Vycl9kZXZpY2VfcmVtb3ZlOgor
CWRldmljZV91bnJlZ2lzdGVyKHZpYi0+ZGV2KTsKIGVycl9pZGFfcmVtb3ZlOgogCWlkYV9zaW1w
bGVfcmVtb3ZlKCZtaW5vcnMsIHZpYi0+bWlub3IpOwogZXJyX2Nvbm5lY3Rpb25fZGlzYWJsZToK
LS0gCjIuMzAuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
