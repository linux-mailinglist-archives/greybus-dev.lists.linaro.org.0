Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EC822D79E
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Jul 2020 15:00:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CDFA96066C
	for <lists+greybus-dev@lfdr.de>; Sat, 25 Jul 2020 13:00:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C205865FD7; Sat, 25 Jul 2020 13:00:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8DA1B66611;
	Sat, 25 Jul 2020 12:58:46 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6AD9060688
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jul 2020 03:05:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5F151617CF; Sat, 25 Jul 2020 03:05:25 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by lists.linaro.org (Postfix) with ESMTPS id BD4C660688
 for <greybus-dev@lists.linaro.org>; Sat, 25 Jul 2020 03:05:23 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id B1F0FFCE756F0518781A;
 Sat, 25 Jul 2020 11:05:20 +0800 (CST)
Received: from huawei.com (10.175.104.57) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Sat, 25 Jul 2020
 11:05:07 +0800
From: Li Heng <liheng40@huawei.com>
To: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>
Date: Sat, 25 Jul 2020 11:06:37 +0800
Message-ID: <1595646397-53868-1-git-send-email-liheng40@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.104.57]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sat, 25 Jul 2020 12:58:45 +0000
Cc: linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH] svc: add missed destroy_workqueue when
	gb_svc_create fails
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

ZGVzdHJveV93b3JrcXVldWUoKSBzaG91bGQgYmUgY2FsbGVkIHRvIGRlc3Ryb3kgc3ZjLT53cQp3
aGVuIGdiX3N2Y19jcmVhdGUoKSBpbml0IHJlc291cmNlcyBmYWlscy4KCkZpeGVzOiA4NDY1ZGVm
NDk5YzcgKCJzdGFnaW5nOiBncmV5YnVzOiBtb3ZlIHRoZSBncmV5YnVzIGNvcmUgdG8gZHJpdmVy
cy9ncmV5YnVzIikKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpT
aWduZWQtb2ZmLWJ5OiBMaSBIZW5nIDxsaWhlbmc0MEBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMv
Z3JleWJ1cy9zdmMuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncmV5YnVzL3N2Yy5jIGIvZHJpdmVycy9ncmV5YnVzL3N2Yy5jCmlu
ZGV4IGNlNzc0MGUuLjM4Zjg1OGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9zdmMuYwor
KysgYi9kcml2ZXJzL2dyZXlidXMvc3ZjLmMKQEAgLTEzNDAsNiArMTM0MCw3IEBAIHN0cnVjdCBn
Yl9zdmMgKmdiX3N2Y19jcmVhdGUoc3RydWN0IGdiX2hvc3RfZGV2aWNlICpoZCkKIAogZXJyX3B1
dF9kZXZpY2U6CiAJcHV0X2RldmljZSgmc3ZjLT5kZXYpOworCWRlc3Ryb3lfd29ya3F1ZXVlKHN2
Yy0+d3EpOwogCXJldHVybiBOVUxMOwogfQogCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cmdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
