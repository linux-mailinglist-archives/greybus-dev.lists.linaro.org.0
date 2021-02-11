Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FA531CB6F
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:52:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A5606676A
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 13:52:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6C7FF6600D; Tue, 16 Feb 2021 13:52:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C9E4A66067;
	Tue, 16 Feb 2021 13:52:33 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BD4DA61624
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 15:30:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AE94265FE4; Thu, 11 Feb 2021 15:30:42 +0000 (UTC)
Received: from pv50p00im-ztdg10011301.me.com (pv50p00im-ztdg10011301.me.com
 [17.58.6.40]) by lists.linaro.org (Postfix) with ESMTPS id 9BA2B61624
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 15:30:41 +0000 (UTC)
Received: from everest.nathzi1505 (unknown [45.250.50.68])
 by pv50p00im-ztdg10011301.me.com (Postfix) with ESMTPSA id 9F631760552;
 Thu, 11 Feb 2021 15:30:37 +0000 (UTC)
From: Pritthijit Nath <pritthijit.nath@icloud.com>
To: vireshk@kernel.org, gregkh@linuxfoundation.org, johan@kernel.org,
 elder@kernel.org
Date: Thu, 11 Feb 2021 21:00:01 +0530
Message-Id: <20210211153001.10358-1-pritthijit.nath@icloud.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:52:33 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Pritthijit Nath <pritthijit.nath@icloud.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: Fixed misspelling and
	alignment issue in hid.c
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

VGhpcyBjaGFuZ2UgZml4ZXMgYSBjaGVja3BhdGNoIENIRUNLIHN0eWxlIGlzc3VlIGZvciAiQWxp
Z25tZW50IHNob3VsZCBtYXRjaCBvcGVuIHBhcmVudGhlc2lzIi4KSW4gYWRkaXRpb24gdGhlIG1p
c3NwZWxsaW5nIG9mICJ0cmFuc2ZlcnJlZCIgYWxzbyBoYXMgYmVlbiBmaXhlZC4KClNpZ25lZC1v
ZmYtYnk6IFByaXR0aGlqaXQgTmF0aCA8cHJpdHRoaWppdC5uYXRoQGljbG91ZC5jb20+Ci0tLQog
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvaGlkLmMgfCA2ICsrKy0tLQogMSBmaWxlIGNoYW5nZWQs
IDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9oaWQuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jCmluZGV4
IGVkNzA2ZjM5ZTg3YS4uYWRiOTEyODY4MDNhIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy9oaWQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYwpAQCAtMjIx
LDggKzIyMSw4IEBAIHN0YXRpYyB2b2lkIGdiX2hpZF9pbml0X3JlcG9ydHMoc3RydWN0IGdiX2hp
ZCAqZ2hpZCkKIH0KIAogc3RhdGljIGludCBfX2diX2hpZF9nZXRfcmF3X3JlcG9ydChzdHJ1Y3Qg
aGlkX2RldmljZSAqaGlkLAotCQl1bnNpZ25lZCBjaGFyIHJlcG9ydF9udW1iZXIsIF9fdTggKmJ1
Ziwgc2l6ZV90IGNvdW50LAotCQl1bnNpZ25lZCBjaGFyIHJlcG9ydF90eXBlKQorCQkJCSAgIHVu
c2lnbmVkIGNoYXIgcmVwb3J0X251bWJlciwgX191OCAqYnVmLCBzaXplX3QgY291bnQsCisJCQkJ
ICAgdW5zaWduZWQgY2hhciByZXBvcnRfdHlwZSkKIHsKIAlzdHJ1Y3QgZ2JfaGlkICpnaGlkID0g
aGlkLT5kcml2ZXJfZGF0YTsKIAlpbnQgcmV0OwpAQCAtMjU0LDcgKzI1NCw3IEBAIHN0YXRpYyBp
bnQgX19nYl9oaWRfb3V0cHV0X3Jhd19yZXBvcnQoc3RydWN0IGhpZF9kZXZpY2UgKmhpZCwgX191
OCAqYnVmLAogCiAJcmV0ID0gZ2JfaGlkX3NldF9yZXBvcnQoZ2hpZCwgcmVwb3J0X3R5cGUsIHJl
cG9ydF9pZCwgYnVmLCBsZW4pOwogCWlmIChyZXBvcnRfaWQgJiYgcmV0ID49IDApCi0JCXJldCsr
OyAvKiBhZGQgcmVwb3J0X2lkIHRvIHRoZSBudW1iZXIgb2YgdHJhbnNmZXJlZCBieXRlcyAqLwor
CQlyZXQrKzsgLyogYWRkIHJlcG9ydF9pZCB0byB0aGUgbnVtYmVyIG9mIHRyYW5zZmVycmVkIGJ5
dGVzICovCiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4v
bGlzdGluZm8vZ3JleWJ1cy1kZXYK
