Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E552AD77E
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Nov 2020 14:29:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C07E661627
	for <lists+greybus-dev@lfdr.de>; Tue, 10 Nov 2020 13:29:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B529361900; Tue, 10 Nov 2020 13:29:35 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2C6D8665EE;
	Tue, 10 Nov 2020 13:29:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 64CE3665A5
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 13:10:08 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 59FCE665BF; Mon,  9 Nov 2020 13:10:08 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by lists.linaro.org (Postfix) with ESMTPS id 2ADFC665B5
 for <greybus-dev@lists.linaro.org>; Mon,  9 Nov 2020 13:10:04 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CVBDH08ymzLwYL;
 Mon,  9 Nov 2020 21:09:51 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 9 Nov 2020
 21:10:00 +0800
From: Zhang Qilong <zhangqilong3@huawei.com>
To: <vaibhav.sr@gmail.com>, <mgreer@animalcreek.com>, <johan@kernel.org>,
 <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Mon, 9 Nov 2020 21:13:47 +0800
Message-ID: <20201109131347.1725288-3-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201109131347.1725288-1-zhangqilong3@huawei.com>
References: <20201109131347.1725288-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 10 Nov 2020 13:29:10 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 2/2] greybus: audio: apbridgea: Fix reference
	counter leak in error handling
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
dXRwdXQKZmFpbGVkLgoKRml4ZXM6IDZiYTdmYWQ0MzBkNjMgKCJBZGQgcnVudGltZSBwbSBzdXBw
b3J0IHRvIGF1ZGlvIHByb3RvY29sIGRldmljZSBjbGFzcyBkcml2ZXIuIikKU2lnbmVkLW9mZi1i
eTogWmhhbmcgUWlsb25nIDx6aGFuZ3FpbG9uZzNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19hcGJyaWRnZWEuYyB8IDYgKysrKystCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXVkaW9fYXBicmlkZ2VhLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb19hcGJyaWRnZWEuYwppbmRleCAyNjExN2UzOTBkZWIuLjUwNTQ1ZmQ5NzU2YyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fYXBicmlkZ2VhLmMKKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fYXBicmlkZ2VhLmMKQEAgLTQyLDggKzQyLDEy
IEBAIGludCBnYl9hdWRpb19hcGJyaWRnZWFfcmVnaXN0ZXJfY3BvcnQoc3RydWN0IGdiX2Nvbm5l
Y3Rpb24gKmNvbm5lY3Rpb24sCiAJaWYgKHJldCkKIAkJcmV0dXJuIHJldDsKIAotCXJldHVybiBn
Yl9oZF9vdXRwdXQoY29ubmVjdGlvbi0+aGQsICZyZXEsIHNpemVvZihyZXEpLAorCXJldCA9IGdi
X2hkX291dHB1dChjb25uZWN0aW9uLT5oZCwgJnJlcSwgc2l6ZW9mKHJlcSksCiAJCQkgICAgR0Jf
QVBCX1JFUVVFU1RfQVVESU9fQ09OVFJPTCwgdHJ1ZSk7CisJaWYgKHJldCkKKwkJZ2JfcG1fcnVu
dGltZV9wdXRfYXV0b3N1c3BlbmQoY29ubmVjdGlvbi0+YnVuZGxlKTsKKworCXJldHVybiByZXQ7
CiB9CiBFWFBPUlRfU1lNQk9MX0dQTChnYl9hdWRpb19hcGJyaWRnZWFfcmVnaXN0ZXJfY3BvcnQp
OwogCi0tIAoyLjI1LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
