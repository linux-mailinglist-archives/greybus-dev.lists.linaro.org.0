Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E7B919F9BD
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Apr 2020 18:07:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 00511610F5
	for <lists+greybus-dev@lfdr.de>; Mon,  6 Apr 2020 16:07:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id DE6DF610F9; Mon,  6 Apr 2020 16:07:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1A33F610FE;
	Mon,  6 Apr 2020 16:07:18 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CA9F460831
 for <greybus-dev@lists.linaro.org>; Wed,  1 Apr 2020 02:57:51 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AEF65608E4; Wed,  1 Apr 2020 02:57:51 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by lists.linaro.org (Postfix) with ESMTPS id CB0EF60831
 for <greybus-dev@lists.linaro.org>; Wed,  1 Apr 2020 02:57:49 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 66C657877F15F2D3AB0C;
 Wed,  1 Apr 2020 10:57:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Wed, 1 Apr 2020 10:57:38 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <rmfrfs@gmail.com>, <johan@kernel.org>, <elder@kernel.org>,
 <gregkh@linuxfoundation.org>
Date: Wed, 1 Apr 2020 11:00:17 +0800
Message-ID: <20200401030017.100274-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 06 Apr 2020 16:07:17 +0000
Cc: chenzhou10@huawei.com, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH -next] staging: greybus: fix a missing-check
	bug in gb_lights_light_config()
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

SW4gZ2JfbGlnaHRzX2xpZ2h0X2NvbmZpZygpLCAnbGlnaHQtPm5hbWUnIGlzIGFsbG9jYXRlZCBi
eSBrc3RybmR1cCgpLgpJdCByZXR1cm5zIE5VTEwgd2hlbiBmYWlscywgYWRkIGNoZWNrIGZvciBp
dC4KClNpZ25lZC1vZmYtYnk6IENoZW4gWmhvdSA8Y2hlbnpob3UxMEBodWF3ZWkuY29tPgotLS0K
IGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL2xpZ2h0LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9saWdodC5jCmlu
ZGV4IGQ2YmEyNWYuLmQyNjcyYjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2xpZ2h0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwpAQCAtMTAyNiw3
ICsxMDI2LDggQEAgc3RhdGljIGludCBnYl9saWdodHNfbGlnaHRfY29uZmlnKHN0cnVjdCBnYl9s
aWdodHMgKmdsaWdodHMsIHU4IGlkKQogCiAJbGlnaHQtPmNoYW5uZWxzX2NvdW50ID0gY29uZi5j
aGFubmVsX2NvdW50OwogCWxpZ2h0LT5uYW1lID0ga3N0cm5kdXAoY29uZi5uYW1lLCBOQU1FU19N
QVgsIEdGUF9LRVJORUwpOwotCisJaWYgKCFsaWdodC0+bmFtZSkKKwkJcmV0dXJuIC1FTk9NRU07
CiAJbGlnaHQtPmNoYW5uZWxzID0ga2NhbGxvYyhsaWdodC0+Y2hhbm5lbHNfY291bnQsCiAJCQkJ
ICBzaXplb2Yoc3RydWN0IGdiX2NoYW5uZWwpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWxpZ2h0LT5j
aGFubmVscykKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
