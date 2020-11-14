Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8B22B2DD2
	for <lists+greybus-dev@lfdr.de>; Sat, 14 Nov 2020 16:17:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EDA0D60733
	for <lists+greybus-dev@lfdr.de>; Sat, 14 Nov 2020 15:17:53 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E28B361653; Sat, 14 Nov 2020 15:17:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C8519617F0;
	Sat, 14 Nov 2020 15:17:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C186A666ED
 for <greybus-dev@lists.linaro.org>; Sat, 14 Nov 2020 03:14:10 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AD500666F0; Sat, 14 Nov 2020 03:14:10 +0000 (UTC)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by lists.linaro.org (Postfix) with ESMTPS id CC745666ED
 for <greybus-dev@lists.linaro.org>; Sat, 14 Nov 2020 03:14:08 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CY0mJ4DgKz76cj;
 Sat, 14 Nov 2020 11:13:52 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Sat, 14 Nov 2020
 11:13:58 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Sat, 14 Nov 2020 11:17:41 +0800
Message-ID: <20201114031741.3036814-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 14 Nov 2020 15:17:41 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH v2 2/2] greybus: audio: apbridgea: Fix
	reference counter leak in error handling
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

V2hlbiBnYl9hdWRpb19hcGJyaWRnZWFfcmVnaXN0ZXJfY3BvcnQgZmFpbGVkLCBtYXliZToKCiAg
MSkgZ2JfcG1fcnVudGltZV9nZXRfc3luYyBmYWlsZWQsIHVzYWdlIGNvdW50ZXIgcmVtYWluZWQg
dW5jaGFuZ2VkOwoKICAyKSBnYl9oZF9vdXRwdXQgZmFpbGVkLCB1c2FnZSBjb3VudGVyIHJlbWFp
bmVkIGluY3JlYXNlZDsKCkluIGVycm9yIHN0YXRlLCB0aGVyZSBhcmUgdHdvIGRpZmZlcmVudCBz
dGF0ZXMgaW4gdXNhZ2UgY3BvdW50ZXIuIFNvLAppZiBnYl9oZF9vdXRwdXQgZmFpbGVkLCB3ZSBz
aG91bGQgY2FsbCBnYl9wbV9ydW50aW1lX3B1dF9hdXRvc3VzcGVuZApvdCBkZWNyZWFzZSB1c2Fn
ZSBjb3VudGVyIGZvciBiYWxhYmNlIHByZXZlbnRpbmcgcmVmZXJlbmNlIGxlYWsuIEFuZAp3ZSBm
aXhlZCBpdCBieSBhZGQgZ2JfcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQgd2hlbiBnYl9oZF9v
dXRwdXQKZmFpbGVkLgoKRml4ZXM6IDZiYTdmYWQ0MzBkNjMgKCJncmV5YnVzOiBhdWRpbzogYWRk
IHJ1bnRpbWUgcG0gc3VwcG9ydCIpClNpZ25lZC1vZmYtYnk6IFpoYW5nIFFpbG9uZyA8emhhbmdx
aWxvbmczQGh1YXdlaS5jb20+Ci0tLQpDaGFuZ2Vsb2c6CnYyCi0gZml4IHRoZSBuYW1lIGZvciBm
aXhlZCBjb21taXQgaWQKLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19hcGJyaWRn
ZWEuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fYXBicmlk
Z2VhLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19hcGJyaWRnZWEuYwppbmRleCAy
NjExN2UzOTBkZWIuLjUwNTQ1ZmQ5NzU2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvYXVkaW9fYXBicmlkZ2VhLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVk
aW9fYXBicmlkZ2VhLmMKQEAgLTQyLDggKzQyLDEyIEBAIGludCBnYl9hdWRpb19hcGJyaWRnZWFf
cmVnaXN0ZXJfY3BvcnQoc3RydWN0IGdiX2Nvbm5lY3Rpb24gKmNvbm5lY3Rpb24sCiAJaWYgKHJl
dCkKIAkJcmV0dXJuIHJldDsKIAotCXJldHVybiBnYl9oZF9vdXRwdXQoY29ubmVjdGlvbi0+aGQs
ICZyZXEsIHNpemVvZihyZXEpLAorCXJldCA9IGdiX2hkX291dHB1dChjb25uZWN0aW9uLT5oZCwg
JnJlcSwgc2l6ZW9mKHJlcSksCiAJCQkgICAgR0JfQVBCX1JFUVVFU1RfQVVESU9fQ09OVFJPTCwg
dHJ1ZSk7CisJaWYgKHJldCkKKwkJZ2JfcG1fcnVudGltZV9wdXRfYXV0b3N1c3BlbmQoY29ubmVj
dGlvbi0+YnVuZGxlKTsKKworCXJldHVybiByZXQ7CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChnYl9h
dWRpb19hcGJyaWRnZWFfcmVnaXN0ZXJfY3BvcnQpOwogCi0tIAoyLjI1LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
