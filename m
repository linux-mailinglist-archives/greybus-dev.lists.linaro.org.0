Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 429D62D05DE
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 17:16:34 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6A26F61892
	for <lists+greybus-dev@lfdr.de>; Sun,  6 Dec 2020 16:16:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5D67E619B1; Sun,  6 Dec 2020 16:16:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SUBJ_OBFU_PUNCT_FEW,SUBJ_OBFU_PUNCT_MANY autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E76B46670D;
	Sun,  6 Dec 2020 16:15:45 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AC10C616DC
 for <greybus-dev@lists.linaro.org>; Sat,  5 Dec 2020 10:32:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 85B9B666FE; Sat,  5 Dec 2020 10:32:56 +0000 (UTC)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by lists.linaro.org (Postfix) with ESMTPS id BF7D5616DC
 for <greybus-dev@lists.linaro.org>; Sat,  5 Dec 2020 10:32:54 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cp5Vj3PsRzhmyr;
 Sat,  5 Dec 2020 18:32:29 +0800 (CST)
Received: from huawei.com (10.175.113.133) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sat, 5 Dec 2020
 18:32:49 +0800
From: Wang Hai <wanghai38@huawei.com>
To: <johan@kernel.org>, <vaibhav.sr@gmail.com>
Date: Sat, 5 Dec 2020 18:38:27 +0800
Message-ID: <20201205103827.31244-1-wanghai38@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.133]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Sun, 06 Dec 2020 16:15:43 +0000
Cc: devel@driverdev.osuosl.org, elder@kernel.org, linux-kernel@vger.kernel.org,
 aibhav.sr@gmail.com, greybus-dev@lists.linaro.org, dan.carpenter@oracle.com
Subject: [greybus-dev] [PATCH] staging: greybus: audio: Fix possible leak
	free widgets in gbaudio_dapm_free_controls
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

SW4gZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMoKSwgaWYgb25lIG9mIHRoZSB3aWRnZXRzIGlz
IG5vdCBmb3VuZCwgYW4gZXJyb3IKd2lsbCBiZSByZXR1cm5lZCBkaXJlY3RseSwgd2hpY2ggd2ls
bCBjYXVzZSB0aGUgcmVzdCB0byBiZSB1bmFibGUgdG8gYmUgZnJlZWQsCnJlc3VsdGluZyBpbiBs
ZWFrLgoKVGhpcyBwYXRjaCBmaXhlcyB0aGUgYnVnLiBJZiBpZiBvbmUgb2YgdGhlbSBpcyBub3Qg
Zm91bmQsIGp1c3Qgc2tpcCBhbmQgZnJlZSB0aGUgb3RoZXJzLgoKRml4ZXM6IDUxMGUzNDBlZmUw
YyAoInN0YWdpbmc6IGdyZXlidXM6IGF1ZGlvOiBBZGQgaGVscGVyIEFQSXMgZm9yIGR5bmFtaWMg
YXVkaW8gbW9kdWxlIikKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29t
PgpTaWduZWQtb2ZmLWJ5OiBXYW5nIEhhaSA8d2FuZ2hhaTM4QGh1YXdlaS5jb20+Ci0tLQogZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVscGVyLmMgfCAzICsrLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMv
YXVkaW9faGVscGVyLmMKaW5kZXggMjM3NTMxYmE2MGYzLi4zMDExYjhhYmNlMzggMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCisrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2F1ZGlvX2hlbHBlci5jCkBAIC0xMzUsNyArMTM1LDggQEAgaW50IGdi
YXVkaW9fZGFwbV9mcmVlX2NvbnRyb2xzKHN0cnVjdCBzbmRfc29jX2RhcG1fY29udGV4dCAqZGFw
bSwKIAkJaWYgKCF3KSB7CiAJCQlkZXZfZXJyKGRhcG0tPmRldiwgIiVzOiB3aWRnZXQgbm90IGZv
dW5kXG4iLAogCQkJCXdpZGdldC0+bmFtZSk7Ci0JCQlyZXR1cm4gLUVJTlZBTDsKKwkJCXdpZGdl
dCsrOworCQkJY29udGludWU7CiAJCX0KIAkJd2lkZ2V0Kys7CiAjaWZkZWYgQ09ORklHX0RFQlVH
X0ZTCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
