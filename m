Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B5E3567DA
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:24:00 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 19A8860919
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:24:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0028661957; Wed,  7 Apr 2021 09:23:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,FREEMAIL_FROM,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F2C9266631;
	Wed,  7 Apr 2021 09:23:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6A75E66710
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 10:20:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4D43466716; Thu, 25 Mar 2021 10:20:15 +0000 (UTC)
Received: from m12-16.163.com (m12-16.163.com [220.181.12.16])
 by lists.linaro.org (Postfix) with ESMTPS id 9D53466710
 for <greybus-dev@lists.linaro.org>; Thu, 25 Mar 2021 10:20:13 +0000 (UTC)
Received: from bf-rmnj-02.ccdomain.com (unknown [218.94.48.178])
 by smtp12 (Coremail) with SMTP id EMCowAD3BFGyY1xgGRBqiQ--.42582S2;
 Thu, 25 Mar 2021 18:19:36 +0800 (CST)
From: Jian Dong <dj0227@163.com>
To: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Date: Thu, 25 Mar 2021 18:19:26 +0800
Message-Id: <1616667566-58997-1-git-send-email-dj0227@163.com>
X-Mailer: git-send-email 1.9.1
X-CM-TRANSID: EMCowAD3BFGyY1xgGRBqiQ--.42582S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZrW8ZFyfWw13uFyfWrW3KFg_yoW8XrW5pF
 4UA3sFk3WrWa4Yqa45CFWDXFyrKFWxJrWxG348G3s5Jr4rZFnYqr1Utry3WF1fAFZ3Jw15
 Xanagr4Fq3WIyF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07j7nYrUUUUU=
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: dgmqjjqx6rljoofrz/1tbiEBhg3V8YFVxYfwAAsc
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, huyue2@yulong.com,
 Jian Dong <dongjian@yulong.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: fix fw is NULL but
	dereferenced
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

RnJvbTogSmlhbiBEb25nIDxkb25namlhbkB5dWxvbmcuY29tPgoKIGZpeGVzIGNvY2NpY2hlY2sg
RXJyb3I6CgogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jOjMwMTo0MS00NTogRVJS
T1I6CiBmdyBpcyBOVUxMIGJ1dCBkZXJlZmVyZW5jZWQuCgogaWYgcHJvY2VkdXJlIGdvdG8gbGFi
ZWwgZGlyZWN0bHksIHJldCB3aWxsIGJlIG5lZmF0aXZlLCBzbyB0aGUgZncgaXMgTlVMTAogYW5k
IHRoZSBpZihjb25kaXRpb24pIGVuZCB3aXRoIGRlcmVmZXJlbmNlZCBmdy4gbGV0J3MgZml4IGl0
LgoKU2lnbmVkLW9mZi1ieTogSmlhbiBEb25nIDxkb25namlhbkB5dWxvbmcuY29tPgotLS0KIGRy
aXZlcnMvc3RhZ2luZy9ncmV5YnVzL2Jvb3Ryb20uYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9v
dHJvbS5jCmluZGV4IGE4ZWZiODYuLjA0MzllZmEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2lu
Zy9ncmV5YnVzL2Jvb3Ryb20uYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9t
LmMKQEAgLTI0Niw3ICsyNDYsNyBAQCBzdGF0aWMgaW50IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJl
KHN0cnVjdCBnYl9vcGVyYXRpb24gKm9wKQogCXN0cnVjdCBnYl9ib290cm9tX2dldF9maXJtd2Fy
ZV9yZXNwb25zZSAqZmlybXdhcmVfcmVzcG9uc2U7CiAJc3RydWN0IGRldmljZSAqZGV2ID0gJm9w
LT5jb25uZWN0aW9uLT5idW5kbGUtPmRldjsKIAl1bnNpZ25lZCBpbnQgb2Zmc2V0LCBzaXplOwot
CWVudW0gbmV4dF9yZXF1ZXN0X3R5cGUgbmV4dF9yZXF1ZXN0OworCWVudW0gbmV4dF9yZXF1ZXN0
X3R5cGUgbmV4dF9yZXF1ZXN0ID0gTkVYVF9SRVFfR0VUX0ZJUk1XQVJFOwogCWludCByZXQgPSAw
OwogCiAJLyogRGlzYWJsZSB0aW1lb3V0cyAqLwpAQCAtMjk4LDEwICsyOTgsMTAgQEAgc3RhdGlj
IGludCBnYl9ib290cm9tX2dldF9maXJtd2FyZShzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcCkKIAog
cXVldWVfd29yazoKIAkvKiBSZWZyZXNoIHRpbWVvdXQgKi8KLQlpZiAoIXJldCAmJiAob2Zmc2V0
ICsgc2l6ZSA9PSBmdy0+c2l6ZSkpCi0JCW5leHRfcmVxdWVzdCA9IE5FWFRfUkVRX1JFQURZX1RP
X0JPT1Q7Ci0JZWxzZQorCWlmICghIXJldCkKIAkJbmV4dF9yZXF1ZXN0ID0gTkVYVF9SRVFfR0VU
X0ZJUk1XQVJFOworCWVsc2UgaWYgKG9mZnNldCArIHNpemUgPT0gZnctPnNpemUpCisJCW5leHRf
cmVxdWVzdCA9IE5FWFRfUkVRX1JFQURZX1RPX0JPT1Q7CiAKIAlnYl9ib290cm9tX3NldF90aW1l
b3V0KGJvb3Ryb20sIG5leHRfcmVxdWVzdCwgTkVYVF9SRVFfVElNRU9VVF9NUyk7CiAKLS0gCjEu
OS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3Jl
eWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6
Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
