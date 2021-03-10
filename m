Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCB6334024
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 15:18:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 96D9360631
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 14:18:03 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 81B42618DF; Wed, 10 Mar 2021 14:18:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_MED,SPF_HELO_PASS autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1CB9E665E9;
	Wed, 10 Mar 2021 14:17:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 53C7660631
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:17:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 38934665E9; Wed, 10 Mar 2021 14:17:46 +0000 (UTC)
Received: from ustc.edu.cn (smtp2.ustc.edu.cn [202.38.64.46])
 by lists.linaro.org (Postfix) with ESMTP id 1404860631
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 14:17:43 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [114.214.224.243])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAXBGEE1UhgCM0EAA--.2042S4; 
 Wed, 10 Mar 2021 22:17:40 +0800 (CST)
From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed, 10 Mar 2021 06:17:36 -0800
Message-Id: <20210310141736.3459-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAXBGEE1UhgCM0EAA--.2042S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XryftrW8Cr1rAr18tw48tFb_yoWfCFc_u3
 W8trsxAF4kJrs8Kasruw13ZrySyr4v9r18ur1ft39xA342vr1DJrWDWr4kWrWUGry8Xrnx
 Aa4DJryUXr1xujkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAG
 YxC7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Zr0_Wr1UMIIF0xvEx4A2jsIE14v26r1j6r4U
 MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUlQ6LUUU
 UU=
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH v2] greybus/operation: Drop reference when
	message has been sent
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

SW4gZ2Jfb3BlcmF0aW9uX3Jlc3BvbnNlX3NlbmQsIGdldCBhbiBleHRyYSByZWZlcmVuY2UKYmVm
b3JlIGdiX21lc3NhZ2Vfc2VuZCgpIHdpdGggdGhpcyBjb21tZW50ICIvKiBSZWZlcmVuY2Ugd2ls
bApiZSBkcm9wcGVkIHdoZW4gbWVzc2FnZSBoYXMgYmVlbiBzZW50LiAqLyIuIFRoZXJlZm9yZSwg
d2UKc2hvdWxkIGRyb3AgdGhlIGdvdCByZWZlcmVuY2Ugbm90IG9ubHkgaW4gdGhlIGVycm9yIGJy
YW5jaCwKYnV0IGFsc28gaW4gdGhlIGNvbXBsZXRlIGJyYW5jaC4KClNpZ25lZC1vZmYtYnk6IEx2
IFl1bmxvbmcgPGx5bDIwMTlAbWFpbC51c3RjLmVkdS5jbj4KLS0tCiBkcml2ZXJzL2dyZXlidXMv
b3BlcmF0aW9uLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMgYi9kcml2ZXJzL2dyZXlidXMv
b3BlcmF0aW9uLmMKaW5kZXggODQ1OWU5YmMwNzQ5Li41MDBiM2ZlNTNhMDQgMTAwNjQ0Ci0tLSBh
L2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYworKysgYi9kcml2ZXJzL2dyZXlidXMvb3BlcmF0
aW9uLmMKQEAgLTg1NSw2ICs4NTUsMTAgQEAgc3RhdGljIGludCBnYl9vcGVyYXRpb25fcmVzcG9u
c2Vfc2VuZChzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcGVyYXRpb24sCiAJaWYgKHJldCkKIAkJZ290
byBlcnJfcHV0X2FjdGl2ZTsKIAorCS8qRHJvcCByZWZlcmVuY2UgYWZ0ZXIgbWVzc2FnZSBzZW5k
IGNvbXBsZXRlcy4gKi8KKwlnYl9vcGVyYXRpb25fcHV0X2FjdGl2ZShvcGVyYXRpb24pOworCWdi
X29wZXJhdGlvbl9wdXQob3BlcmF0aW9uKTsKKwogCXJldHVybiAwOwogCiBlcnJfcHV0X2FjdGl2
ZToKLS0gCjIuMjUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
