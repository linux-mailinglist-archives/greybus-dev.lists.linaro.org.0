Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B9F22D05DB
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 17:15:58 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E4E4166714
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 16:15:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D47AA66719; Sun,  6 Dec 2020 16:15:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SUBJ_OBFU_PUNCT_FEW,SUBJ_OBFU_PUNCT_MANY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 696F8619B1;
	Sun,  6 Dec 2020 16:15:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DED6A666E7
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 02:08:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CE83C666ED; Fri,  4 Dec 2020 02:08:19 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by lists.linaro.org (Postfix) with ESMTPS id 023AA666E7
 for <greybus-dev@lists.linaro.org>; Fri,  4 Dec 2020 02:08:18 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CnGLy0DCnzhlb8;
 Fri,  4 Dec 2020 10:07:54 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Fri, 4 Dec 2020
 10:08:10 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>,
 <dan.carpenter@oracle.com>, <aibhav.sr@gmail.com>
Date: Fri, 4 Dec 2020 10:13:50 +0800
Message-ID: <20201204021350.28182-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 06 Dec 2020 16:15:43 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: audio: Add missing unlock
	in gbaudio_dapm_free_controls()
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

QWRkIHRoZSBtaXNzaW5nIHVubG9jayBiZWZvcmUgcmV0dXJuIGZyb20gZnVuY3Rpb24KZ2JhdWRp
b19kYXBtX2ZyZWVfY29udHJvbHMoKSBpbiB0aGUgZXJyb3IgaGFuZGxpbmcgY2FzZS4KCkZpeGVz
OiA1MTBlMzQwZWZlMGMgKCJzdGFnaW5nOiBncmV5YnVzOiBhdWRpbzogQWRkIGhlbHBlciBBUElz
IGZvciBkeW5hbWljIGF1ZGlvIG1vZHVsZSIpClJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxr
Y2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogV2FuZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWku
Y29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIHwgMSArCiAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlv
X2hlbHBlci5jCmluZGV4IDIzNzUzMWJhNjBmMy4uMjkzNjc1ZGJlYTEwIDEwMDY0NAotLS0gYS9k
cml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYworKysgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwpAQCAtMTM1LDYgKzEzNSw3IEBAIGludCBnYmF1ZGlv
X2RhcG1fZnJlZV9jb250cm9scyhzdHJ1Y3Qgc25kX3NvY19kYXBtX2NvbnRleHQgKmRhcG0sCiAJ
CWlmICghdykgewogCQkJZGV2X2VycihkYXBtLT5kZXYsICIlczogd2lkZ2V0IG5vdCBmb3VuZFxu
IiwKIAkJCQl3aWRnZXQtPm5hbWUpOworCQkJbXV0ZXhfdW5sb2NrKCZkYXBtLT5jYXJkLT5kYXBt
X211dGV4KTsKIAkJCXJldHVybiAtRUlOVkFMOwogCQl9CiAJCXdpZGdldCsrOwotLSAKMi4xNy4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVz
LWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xp
c3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
