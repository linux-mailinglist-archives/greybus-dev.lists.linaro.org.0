Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 60741333925
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 10:47:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9053F617DA
	for <lists+greybus-dev@lfdr.de>; Wed, 10 Mar 2021 09:47:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 84F796678D; Wed, 10 Mar 2021 09:47:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=BAYES_00,FORGED_SPF_HELO,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_PASS autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CED0A66716;
	Wed, 10 Mar 2021 09:47:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1067F617DA
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 09:10:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0168C665B5; Wed, 10 Mar 2021 09:10:30 +0000 (UTC)
Received: from ustc.edu.cn (smtp2.ustc.edu.cn [202.38.64.46])
 by lists.linaro.org (Postfix) with ESMTP id B1AC3617DA
 for <greybus-dev@lists.linaro.org>; Wed, 10 Mar 2021 09:10:28 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [114.214.224.243])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBHM2AAjUhg5foCAA--.130S4; 
 Wed, 10 Mar 2021 17:10:24 +0800 (CST)
From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed, 10 Mar 2021 01:10:14 -0800
Message-Id: <20210310091014.6407-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBHM2AAjUhg5foCAA--.130S4
X-Coremail-Antispam: 1UD129KBjvdXoW7XryftrW8Cr1rAr18tw48tFb_yoWftFc_uF
 18trs7A3WkJr4DK347uw1fZrnayr4v9r1xur17t39xA34avr1DJr98Wws5WrW7Wr18Xr1a
 ya4DJF1UXrn7ujkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbx8FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
 6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
 v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkG
 c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
 0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6rWUJVWrZr1UMIIF0xvEx4A2jsIE14v26r1j
 6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUQZ2
 3UUUUU=
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 10 Mar 2021 09:47:16 +0000
Cc: greybus-dev@lists.linaro.org, Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] greybus/operation: Drop reference when
	message has been set
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
b3BlcmF0aW9uLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMgYi9kcml2
ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMKaW5kZXggMjk2ZjBiOTNkMTcxLi41MDBiM2ZlNTNhMDQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYworKysgYi9kcml2ZXJzL2dy
ZXlidXMvb3BlcmF0aW9uLmMKQEAgLTg1NSw3ICs4NTUsNyBAQCBzdGF0aWMgaW50IGdiX29wZXJh
dGlvbl9yZXNwb25zZV9zZW5kKHN0cnVjdCBnYl9vcGVyYXRpb24gKm9wZXJhdGlvbiwKIAlpZiAo
cmV0KQogCQlnb3RvIGVycl9wdXRfYWN0aXZlOwogCi0JLypEcm9wIHJlZmVyZW5jZSBhZnRlciBt
ZXNzYWdlIHNlbmQgc3VjY2Vzc2Z1bGx5LiAqLworCS8qRHJvcCByZWZlcmVuY2UgYWZ0ZXIgbWVz
c2FnZSBzZW5kIGNvbXBsZXRlcy4gKi8KIAlnYl9vcGVyYXRpb25fcHV0X2FjdGl2ZShvcGVyYXRp
b24pOwogCWdiX29wZXJhdGlvbl9wdXQob3BlcmF0aW9uKTsKIAotLSAKMi4yNS4xCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFp
bGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5h
cm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
