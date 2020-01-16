Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9647F14380F
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jan 2020 09:11:18 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3CBBC61A09
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Jan 2020 08:11:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2B7EE61A08; Tue, 21 Jan 2020 08:11:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EF61E60999;
	Tue, 21 Jan 2020 08:10:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A04516013A
 for <greybus-dev@lists.linaro.org>; Thu, 16 Jan 2020 17:11:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9327D619D9; Thu, 16 Jan 2020 17:11:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 39C686013A
 for <greybus-dev@lists.linaro.org>; Thu, 16 Jan 2020 17:11:11 +0000 (UTC)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6808024694;
 Thu, 16 Jan 2020 17:11:09 +0000 (UTC)
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 16 Jan 2020 12:02:36 -0500
Message-Id: <20200116170509.12787-255-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116170509.12787-1-sashal@kernel.org>
References: <20200116170509.12787-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 21 Jan 2020 08:10:48 +0000
Cc: Sasha Levin <sashal@kernel.org>, devel@driverdev.osuosl.org,
 greybus-dev@lists.linaro.org, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [greybus-dev] [PATCH AUTOSEL 4.19 518/671] staging: greybus: light:
	fix a couple double frees
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

RnJvbTogRGFuIENhcnBlbnRlciA8ZGFuLmNhcnBlbnRlckBvcmFjbGUuY29tPgoKWyBVcHN0cmVh
bSBjb21taXQgMzI5MTAxMjQ0ZjIxNDk1MjYwNjM1OWQyNTRhZTg4M2I3MTA5ZTFhNSBdCgpUaGUg
cHJvYmxlbSBpcyBpbiBnYl9saWdodHNfcmVxdWVzdF9oYW5kbGVyKCkuICBJZiB3ZSBnZXQgYSBy
ZXF1ZXN0IHRvCmNoYW5nZSB0aGUgY29uZmlnIHRoZW4gd2UgcmVsZWFzZSB0aGUgbGlnaHQgd2l0
aCBnYl9saWdodHNfbGlnaHRfcmVsZWFzZSgpCmFuZCByZS1hbGxvY2F0ZWQgaXQuICBIb3dldmVy
LCBpZiB0aGUgYWxsb2NhdGlvbiBmYWlscyBwYXJ0IHdheSB0aHJvdWdoCnRoZW4gd2UgY2FsbCBn
Yl9saWdodHNfbGlnaHRfcmVsZWFzZSgpIGFnYWluLiAgVGhpcyBjYW4gbGVhZCB0byBhIGNvdXBs
ZQpkaWZmZXJlbnQgZG91YmxlIGZyZWVzIHdoZXJlIHdlIGhhdmVuJ3QgY2xlYXJlZCBvdXQgdGhl
IG9yaWdpbmFsIHZhbHVlczoKCglnYl9saWdodHNfbGlnaHRfdjRsMl91bnJlZ2lzdGVyKGxpZ2h0
KTsKCS4uLgoJa2ZyZWUobGlnaHQtPmNoYW5uZWxzKTsKCWtmcmVlKGxpZ2h0LT5uYW1lKTsKCkkg
YWxzbyBtYWRlIGEgc21hbGwgY2hhbmdlIHRvIGhvdyB3ZSBzZXQgImxpZ2h0LT5jaGFubmVsc19j
b3VudCA9IDA7Ii4KVGhlIG9yaWdpbmFsIGNvZGUgaGFuZGxlZCB0aGlzIHBhcnQgZmluZSBhbmQg
ZGlkIG5vdCBjYXVzZSBhIHVzZSBhZnRlcgpmcmVlIGJ1dCBpdCB3YXMgc29ydCBvZiBjb21wbGlj
YXRlZCB0byByZWFkLgoKRml4ZXM6IDI4NzBiNTJiYWU0YyAoImdyZXlidXM6IGxpZ2h0czogYWRk
IGxpZ2h0cyBpbXBsZW1lbnRhdGlvbiIpClNpZ25lZC1vZmYtYnk6IERhbiBDYXJwZW50ZXIgPGRh
bi5jYXJwZW50ZXJAb3JhY2xlLmNvbT4KQWNrZWQtYnk6IFJ1aSBNaWd1ZWwgU2lsdmEgPHJtZnJm
c0BnbWFpbC5jb20+Ckxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAxOTA4MjkxMjI4
MzkuR0EyMDExNkBtd2FuZGEKU2lnbmVkLW9mZi1ieTogR3JlZyBLcm9haC1IYXJ0bWFuIDxncmVn
a2hAbGludXhmb3VuZGF0aW9uLm9yZz4KU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hh
bEBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMgfCAxMiAr
KysrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYyBiL2RyaXZl
cnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMKaW5kZXggMDEwYWUxZTljN2ZiLi40MDY4MGVhZjM5
NzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xpZ2h0LmMKKysrIGIvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvbGlnaHQuYwpAQCAtMTA5OCwyMSArMTA5OCwyMSBAQCBzdGF0
aWMgdm9pZCBnYl9saWdodHNfY2hhbm5lbF9yZWxlYXNlKHN0cnVjdCBnYl9jaGFubmVsICpjaGFu
bmVsKQogc3RhdGljIHZvaWQgZ2JfbGlnaHRzX2xpZ2h0X3JlbGVhc2Uoc3RydWN0IGdiX2xpZ2h0
ICpsaWdodCkKIHsKIAlpbnQgaTsKLQlpbnQgY291bnQ7CiAKIAlsaWdodC0+cmVhZHkgPSBmYWxz
ZTsKIAotCWNvdW50ID0gbGlnaHQtPmNoYW5uZWxzX2NvdW50OwotCiAJaWYgKGxpZ2h0LT5oYXNf
Zmxhc2gpCiAJCWdiX2xpZ2h0c19saWdodF92NGwyX3VucmVnaXN0ZXIobGlnaHQpOworCWxpZ2h0
LT5oYXNfZmxhc2ggPSBmYWxzZTsKIAotCWZvciAoaSA9IDA7IGkgPCBjb3VudDsgaSsrKSB7CisJ
Zm9yIChpID0gMDsgaSA8IGxpZ2h0LT5jaGFubmVsc19jb3VudDsgaSsrKQogCQlnYl9saWdodHNf
Y2hhbm5lbF9yZWxlYXNlKCZsaWdodC0+Y2hhbm5lbHNbaV0pOwotCQlsaWdodC0+Y2hhbm5lbHNf
Y291bnQtLTsKLQl9CisJbGlnaHQtPmNoYW5uZWxzX2NvdW50ID0gMDsKKwogCWtmcmVlKGxpZ2h0
LT5jaGFubmVscyk7CisJbGlnaHQtPmNoYW5uZWxzID0gTlVMTDsKIAlrZnJlZShsaWdodC0+bmFt
ZSk7CisJbGlnaHQtPm5hbWUgPSBOVUxMOwogfQogCiBzdGF0aWMgdm9pZCBnYl9saWdodHNfcmVs
ZWFzZShzdHJ1Y3QgZ2JfbGlnaHRzICpnbGlnaHRzKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxp
c3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcv
bWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
