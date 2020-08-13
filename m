Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DCA243B9C
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Aug 2020 16:35:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 069F360665
	for <lists+greybus-dev@lfdr.de>; Thu, 13 Aug 2020 14:35:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id EC2C766015; Thu, 13 Aug 2020 14:35:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SUBJ_OBFU_PUNCT_FEW autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 990A7666DA;
	Thu, 13 Aug 2020 14:35:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 720BE665C5
 for <greybus-dev@lists.linaro.org>; Thu, 13 Aug 2020 03:35:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 664A9666D3; Thu, 13 Aug 2020 03:35:04 +0000 (UTC)
Received: from m17618.mail.qiye.163.com (m17618.mail.qiye.163.com
 [59.111.176.18])
 by lists.linaro.org (Postfix) with ESMTPS id 83B9B665C5
 for <greybus-dev@lists.linaro.org>; Thu, 13 Aug 2020 03:35:02 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.226])
 by m17618.mail.qiye.163.com (Hmail) with ESMTPA id E181A4E1F13;
 Thu, 13 Aug 2020 11:34:57 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
Date: Thu, 13 Aug 2020 11:34:48 +0800
Message-Id: <1597289690-22857-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZT08fH0MfGUlMGh9OVkpOQkxJQ0JNQkNKQk9VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OQg6LQw*FD8dOUMODioeVhYc
 EzFPCQ5VSlVKTkJMSUNCTUJDTUxIVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlJTVlXWQgBWUFJSE1INwY+
X-HM-Tid: 0a73e5e293459376kuwse181a4e1f13
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 13 Aug 2020 14:35:14 +0000
Cc: Wang Qing <wangqing@vivo.com>
Subject: [greybus-dev] [PATCH] drivers/greybus: Use kobj_to_dev() instead
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

VXNlIGtvYmpfdG9fZGV2KCkgaW5zdGVhZCBvZiBjb250YWluZXJfb2YoKQoKU2lnbmVkLW9mZi1i
eTogV2FuZyBRaW5nIDx3YW5ncWluZ0B2aXZvLmNvbT4KLS0tCiBkcml2ZXJzL2dyZXlidXMvaW50
ZXJmYWNlLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvaW50ZXJmYWNlLmMgYi9k
cml2ZXJzL2dyZXlidXMvaW50ZXJmYWNlLmMKaW5kZXggNjdkYmU2Zi4uZGUxNjdmMQotLS0gYS9k
cml2ZXJzL2dyZXlidXMvaW50ZXJmYWNlLmMKKysrIGIvZHJpdmVycy9ncmV5YnVzL2ludGVyZmFj
ZS5jCkBAIC02MjAsNyArNjIwLDcgQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmludGVyZmFj
ZV9jb21tb25fYXR0cnNbXSA9IHsKIHN0YXRpYyB1bW9kZV90IGludGVyZmFjZV91bmlwcm9faXNf
dmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKIAkJCQkJICAgc3RydWN0IGF0dHJpYnV0ZSAq
YXR0ciwgaW50IG4pCiB7Ci0Jc3RydWN0IGRldmljZSAqZGV2ID0gY29udGFpbmVyX29mKGtvYmos
IHN0cnVjdCBkZXZpY2UsIGtvYmopOworCXN0cnVjdCBkZXZpY2UgKmRldiA9IGtvYmpfdG9fZGV2
KGtvYmopOwogCXN0cnVjdCBnYl9pbnRlcmZhY2UgKmludGYgPSB0b19nYl9pbnRlcmZhY2UoZGV2
KTsKIAogCXN3aXRjaCAoaW50Zi0+dHlwZSkgewpAQCAtNjM1LDcgKzYzNSw3IEBAIHN0YXRpYyB1
bW9kZV90IGludGVyZmFjZV91bmlwcm9faXNfdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwK
IHN0YXRpYyB1bW9kZV90IGludGVyZmFjZV9ncmV5YnVzX2lzX3Zpc2libGUoc3RydWN0IGtvYmpl
Y3QgKmtvYmosCiAJCQkJCSAgICBzdHJ1Y3QgYXR0cmlidXRlICphdHRyLCBpbnQgbikKIHsKLQlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSBjb250YWluZXJfb2Yoa29iaiwgc3RydWN0IGRldmljZSwga29i
aik7CisJc3RydWN0IGRldmljZSAqZGV2ID0ga29ial90b19kZXYoa29iaik7CiAJc3RydWN0IGdi
X2ludGVyZmFjZSAqaW50ZiA9IHRvX2diX2ludGVyZmFjZShkZXYpOwogCiAJc3dpdGNoIChpbnRm
LT50eXBlKSB7CkBAIC02NDksNyArNjQ5LDcgQEAgc3RhdGljIHVtb2RlX3QgaW50ZXJmYWNlX2dy
ZXlidXNfaXNfdmlzaWJsZShzdHJ1Y3Qga29iamVjdCAqa29iaiwKIHN0YXRpYyB1bW9kZV90IGlu
dGVyZmFjZV9wb3dlcl9pc192aXNpYmxlKHN0cnVjdCBrb2JqZWN0ICprb2JqLAogCQkJCQkgIHN0
cnVjdCBhdHRyaWJ1dGUgKmF0dHIsIGludCBuKQogewotCXN0cnVjdCBkZXZpY2UgKmRldiA9IGNv
bnRhaW5lcl9vZihrb2JqLCBzdHJ1Y3QgZGV2aWNlLCBrb2JqKTsKKwlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBrb2JqX3RvX2Rldihrb2JqKTsKIAlzdHJ1Y3QgZ2JfaW50ZXJmYWNlICppbnRmID0gdG9f
Z2JfaW50ZXJmYWNlKGRldik7CiAKIAlzd2l0Y2ggKGludGYtPnR5cGUpIHsKLS0gCjIuNy40Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRl
diBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3Rz
LmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
