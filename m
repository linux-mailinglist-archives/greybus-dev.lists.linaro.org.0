Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9813D9C234
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 07:56:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B9A5E617C3
	for <lists+greybus-dev@lfdr.de>; Sun, 25 Aug 2019 05:56:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AEFE9617CC; Sun, 25 Aug 2019 05:56:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 25ABA6183B;
	Sun, 25 Aug 2019 05:55:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 53122617CC
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 442D161752; Sun, 25 Aug 2019 05:55:18 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 9E4C3617C9
 for <greybus-dev@lists.linaro.org>; Sun, 25 Aug 2019 05:55:09 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
 [83.86.89.107])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8B9352173E;
 Sun, 25 Aug 2019 05:55:08 +0000 (UTC)
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org, elder@kernel.org,
 johan@kernel.org
Date: Sun, 25 Aug 2019 07:54:26 +0200
Message-Id: <20190825055429.18547-7-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190825055429.18547-1-gregkh@linuxfoundation.org>
References: <20190825055429.18547-1-gregkh@linuxfoundation.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH 6/9] staging: greybus: loopback: Fix up some
	alignment checkpatch issues
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

U29tZSBmdW5jdGlvbiBwcm90b3R5cGVzIGRvIG5vdCBtYXRjaCB0aGUgZXhwZWN0ZWQgYWxpZ25t
ZW50IGZvcm1hdHRpbmcKc28gZml4IHRoYXQgdXAgc28gdGhhdCBjaGVja3BhdGNoIGlzIGhhcHB5
LgoKQ2M6ICJCcnlhbiBPJ0Rvbm9naHVlIiA8cHVyZS5sb2dpY0BuZXh1cy1zb2Z0d2FyZS5pZT4K
Q2M6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KQ2M6IEFsZXggRWxkZXIgPGVsZGVy
QGtlcm5lbC5vcmc+CkNjOiBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCkNjOiBkZXZlbEBk
cml2ZXJkZXYub3N1b3NsLm9yZwpTaWduZWQtb2ZmLWJ5OiBHcmVnIEtyb2FoLUhhcnRtYW4gPGdy
ZWdraEBsaW51eGZvdW5kYXRpb24ub3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xv
b3BiYWNrLmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2su
YyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMKaW5kZXggNDhkODVlYmU0MDRh
Li5iMGFiMGVlZDVjMTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3Bi
YWNrLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYwpAQCAtODgyLDcg
Kzg4Miw3IEBAIHN0YXRpYyBpbnQgZ2JfbG9vcGJhY2tfZm4odm9pZCAqZGF0YSkKIAkJCQlnYi0+
dHlwZSA9IDA7CiAJCQkJZ2ItPnNlbmRfY291bnQgPSAwOwogCQkJCXN5c2ZzX25vdGlmeSgmZ2It
PmRldi0+a29iaiwgIE5VTEwsCi0JCQkJCQkiaXRlcmF0aW9uX2NvdW50Iik7CisJCQkJCSAgICAg
Iml0ZXJhdGlvbl9jb3VudCIpOwogCQkJCWRldl9kYmcoJmJ1bmRsZS0+ZGV2LCAibG9hZCB0ZXN0
IGNvbXBsZXRlXG4iKTsKIAkJCX0gZWxzZSB7CiAJCQkJZGV2X2RiZygmYnVuZGxlLT5kZXYsCkBA
IC0xMDU0LDcgKzEwNTQsNyBAQCBzdGF0aWMgaW50IGdiX2xvb3BiYWNrX3Byb2JlKHN0cnVjdCBn
Yl9idW5kbGUgKmJ1bmRsZSwKIAogCS8qIEFsbG9jYXRlIGtmaWZvICovCiAJaWYgKGtmaWZvX2Fs
bG9jKCZnYi0+a2ZpZm9fbGF0LCBrZmlmb19kZXB0aCAqIHNpemVvZih1MzIpLAotCQkJICBHRlBf
S0VSTkVMKSkgeworCQkJR0ZQX0tFUk5FTCkpIHsKIAkJcmV0dmFsID0gLUVOT01FTTsKIAkJZ290
byBvdXRfY29ubjsKIAl9Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
