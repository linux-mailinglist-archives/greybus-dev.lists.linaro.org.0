Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 842353567EE
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:25:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A83216187F
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:25:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 9D1EF665EE; Wed,  7 Apr 2021 09:25:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BA06B66795;
	Wed,  7 Apr 2021 09:23:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9F81F6088A
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 06:49:49 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7DEC86187F; Wed,  7 Apr 2021 06:49:49 +0000 (UTC)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by lists.linaro.org (Postfix) with ESMTPS id 9784A6088A
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 06:49:47 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FFZgk2gTNzNtPD;
 Wed,  7 Apr 2021 14:46:58 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Wed, 7 Apr 2021 14:49:38 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <hvaibhav.linux@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
 <gregkh@linuxfoundation.org>
Date: Wed, 7 Apr 2021 14:50:03 +0800
Message-ID: <1617778203-23117-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Tian Tao <tiantao6@hisilicon.com>
Subject: [greybus-dev] [PATCH] staging: greybus: move to use request_irq by
	IRQF_NO_AUTOEN flag
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

ZGlzYWJsZV9pcnEoKSBhZnRlciByZXF1ZXN0X2lycSgpIHN0aWxsIGhhcyBhIHRpbWUgZ2FwIGlu
IHdoaWNoCmludGVycnVwdHMgY2FuIGNvbWUuIHJlcXVlc3RfaXJxKCkgd2l0aCBJUlFGX05PX0FV
VE9FTiBmbGFnIHdpbGwKZGlzYWJsZSBJUlEgYXV0by1lbmFibGUgYmVjYXVzZSBvZiByZXF1ZXN0
aW5nLgoKdGhpcyBwYXRjaCBpcyBtYWRlIGJhc2Ugb24gImFkZCBJUlFGX05PX0FVVE9FTiBmb3Ig
cmVxdWVzdF9pcnEiIHdoaWNoCmlzIGJlaW5nIG1lcmdlZDogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvcGF0Y2h3b3JrL3BhdGNoLzEzODg3NjUvCgpTaWduZWQtb2ZmLWJ5OiBUaWFuIFRhbyA8dGlh
bnRhbzZAaGlzaWxpY29uLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1w
bGF0Zm9ybS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2FyY2hlLXBs
YXRmb3JtLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1wbGF0Zm9ybS5jCmluZGV4
IGUzNzRkZmMuLmJlMjdhY2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Fy
Y2hlLXBsYXRmb3JtLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZv
cm0uYwpAQCAtNTAwLDEzICs1MDAsMTMgQEAgc3RhdGljIGludCBhcmNoZV9wbGF0Zm9ybV9wcm9i
ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCQkJCQlhcmNoZV9wbGF0Zm9ybV93ZF9p
cnEsCiAJCQkJCWFyY2hlX3BsYXRmb3JtX3dkX2lycV90aHJlYWQsCiAJCQkJCUlSUUZfVFJJR0dF
Ul9GQUxMSU5HIHwKLQkJCQkJSVJRRl9UUklHR0VSX1JJU0lORyB8IElSUUZfT05FU0hPVCwKKwkJ
CQkJSVJRRl9UUklHR0VSX1JJU0lORyB8IElSUUZfT05FU0hPVCB8CisJCQkJCUlSUUZfTk9fQVVU
T0VOLAogCQkJCQlkZXZfbmFtZShkZXYpLCBhcmNoZV9wZGF0YSk7CiAJaWYgKHJldCkgewogCQlk
ZXZfZXJyKGRldiwgImZhaWxlZCB0byByZXF1ZXN0IHdha2UgZGV0ZWN0IElSUSAlZFxuIiwgcmV0
KTsKIAkJcmV0dXJuIHJldDsKIAl9Ci0JZGlzYWJsZV9pcnEoYXJjaGVfcGRhdGEtPndha2VfZGV0
ZWN0X2lycSk7CiAKIAlyZXQgPSBkZXZpY2VfY3JlYXRlX2ZpbGUoZGV2LCAmZGV2X2F0dHJfc3Rh
dGUpOwogCWlmIChyZXQpIHsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgo=
