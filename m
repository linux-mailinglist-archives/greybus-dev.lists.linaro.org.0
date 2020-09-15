Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0107C26AA70
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Sep 2020 19:23:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D31806175A
	for <lists+greybus-dev@lfdr.de>; Tue, 15 Sep 2020 17:23:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C7E05666D3; Tue, 15 Sep 2020 17:23:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SUBJ_OBFU_PUNCT_FEW autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 85D68666D5;
	Tue, 15 Sep 2020 17:22:44 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id C1874607E0
 for <greybus-dev@lists.linaro.org>; Tue, 15 Sep 2020 03:04:07 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id B4BE0615AD; Tue, 15 Sep 2020 03:04:07 +0000 (UTC)
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by lists.linaro.org (Postfix) with ESMTPS id 31169607E0
 for <greybus-dev@lists.linaro.org>; Tue, 15 Sep 2020 03:04:06 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 04C4FDE06A4004652D42;
 Tue, 15 Sep 2020 11:04:03 +0800 (CST)
Received: from huawei.com (10.175.113.32) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.487.0; Tue, 15 Sep 2020
 11:03:52 +0800
From: Liu Shixin <liushixin2@huawei.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Johan Hovold
 <johan@kernel.org>, Alex Elder <elder@kernel.org>
Date: Tue, 15 Sep 2020 11:26:30 +0800
Message-ID: <20200915032630.1772621-1-liushixin2@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.32]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 15 Sep 2020 17:22:43 +0000
Cc: Liu Shixin <liushixin2@huawei.com>, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH -next] staging: greybus: simplify the return
	expression of gb_svc_add()
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

U2ltcGxpZnkgdGhlIHJldHVybiBleHByZXNzaW9uLgoKU2lnbmVkLW9mZi1ieTogTGl1IFNoaXhp
biA8bGl1c2hpeGluMkBodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3JleWJ1cy9zdmMuYyB8IDgg
Ky0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvc3ZjLmMgYi9kcml2ZXJzL2dyZXlidXMvc3Zj
LmMKaW5kZXggY2U3NzQwZWY0NDliLi5kY2EyNTExNzJjZDIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3JleWJ1cy9zdmMuYworKysgYi9kcml2ZXJzL2dyZXlidXMvc3ZjLmMKQEAgLTEzNDUsMTggKzEz
NDUsMTIgQEAgc3RydWN0IGdiX3N2YyAqZ2Jfc3ZjX2NyZWF0ZShzdHJ1Y3QgZ2JfaG9zdF9kZXZp
Y2UgKmhkKQogCiBpbnQgZ2Jfc3ZjX2FkZChzdHJ1Y3QgZ2Jfc3ZjICpzdmMpCiB7Ci0JaW50IHJl
dDsKLQogCS8qCiAJICogVGhlIFNWQyBwcm90b2NvbCBpcyBjdXJyZW50bHkgZHJpdmVuIGJ5IHRo
ZSBTVkMsIHNvIHRoZSBTVkMgZGV2aWNlCiAJICogaXMgYWRkZWQgZnJvbSB0aGUgY29ubmVjdGlv
biByZXF1ZXN0IGhhbmRsZXIgd2hlbiBlbm91Z2gKIAkgKiBpbmZvcm1hdGlvbiBoYXMgYmVlbiBy
ZWNlaXZlZC4KIAkgKi8KLQlyZXQgPSBnYl9jb25uZWN0aW9uX2VuYWJsZShzdmMtPmNvbm5lY3Rp
b24pOwotCWlmIChyZXQpCi0JCXJldHVybiByZXQ7Ci0KLQlyZXR1cm4gMDsKKwlyZXR1cm4gZ2Jf
Y29ubmVjdGlvbl9lbmFibGUoc3ZjLT5jb25uZWN0aW9uKTsKIH0KIAogc3RhdGljIHZvaWQgZ2Jf
c3ZjX3JlbW92ZV9tb2R1bGVzKHN0cnVjdCBnYl9zdmMgKnN2YykKLS0gCjIuMjUuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5h
cm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
