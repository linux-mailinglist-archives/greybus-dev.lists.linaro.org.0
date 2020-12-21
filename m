Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3313B2E0B06
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Dec 2020 14:45:01 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF8476677A
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Dec 2020 13:44:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6690466781; Tue, 22 Dec 2020 13:44:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 16D3066757;
	Tue, 22 Dec 2020 13:43:07 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 97D38665CA
 for <greybus-dev@lists.linaro.org>; Mon, 21 Dec 2020 13:02:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 848E16672C; Mon, 21 Dec 2020 13:02:30 +0000 (UTC)
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by lists.linaro.org (Postfix) with ESMTPS id 59117665CA
 for <greybus-dev@lists.linaro.org>; Mon, 21 Dec 2020 13:02:26 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D003S72SKz15h0q;
 Mon, 21 Dec 2020 21:01:40 +0800 (CST)
Received: from ubuntu.network (10.175.138.68) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.498.0; Mon, 21 Dec 2020 21:02:12 +0800
From: Zheng Yongjun <zhengyongjun3@huawei.com>
To: <johan@kernel.org>, <elder@kernel.org>, <gregkh@linuxfoundation.org>,
 <greybus-dev@lists.linaro.org>, <devel@driverdev.osuosl.org>,
 <linux-kernel@vger.kernel.org>
Date: Mon, 21 Dec 2020 21:02:46 +0800
Message-ID: <20201221130246.1807-1-zhengyongjun3@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.175.138.68]
X-CFilter-Loop: Reflected
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 22 Dec 2020 13:40:34 +0000
Cc: Zheng Yongjun <zhengyongjun3@huawei.com>
Subject: [greybus-dev] [PATCH -next] greybus/audio_helper: Add missing
	unlock to avoid mismatched lock
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

Rml4IGEgbWlzc2luZyB1bmxvY2sgaW4gdGhlIGVycm9yIGJyYW5jaC4KClNpZ25lZC1vZmYtYnk6
IFpoZW5nIFlvbmdqdW4gPHpoZW5neW9uZ2p1bjNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVs
cGVyLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRpb19oZWxwZXIuYwppbmRleCAyMzc1
MzFiYTYwZjMuLjI5MzY3NWRiZWExMCAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXli
dXMvYXVkaW9faGVscGVyLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9faGVs
cGVyLmMKQEAgLTEzNSw2ICsxMzUsNyBAQCBpbnQgZ2JhdWRpb19kYXBtX2ZyZWVfY29udHJvbHMo
c3RydWN0IHNuZF9zb2NfZGFwbV9jb250ZXh0ICpkYXBtLAogCQlpZiAoIXcpIHsKIAkJCWRldl9l
cnIoZGFwbS0+ZGV2LCAiJXM6IHdpZGdldCBub3QgZm91bmRcbiIsCiAJCQkJd2lkZ2V0LT5uYW1l
KTsKKwkJCW11dGV4X3VubG9jaygmZGFwbS0+Y2FyZC0+ZGFwbV9tdXRleCk7CiAJCQlyZXR1cm4g
LUVJTlZBTDsKIAkJfQogCQl3aWRnZXQrKzsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cmdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
