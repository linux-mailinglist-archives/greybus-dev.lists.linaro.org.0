Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 78D2B356996
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:26:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 79523665FB
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:26:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6D9EB66631; Wed,  7 Apr 2021 10:26:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A8C6B66799;
	Wed,  7 Apr 2021 10:24:25 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2E686666F6
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1863C6677C; Wed,  7 Apr 2021 10:23:59 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2FE4E666F6
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83935613CD;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008RN-94; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:26 +0200
Message-Id: <20210407102334.32361-9-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Jiri Slaby <jirislaby@kernel.org>
Subject: [greybus-dev] [PATCH 08/16] tty: amiserial: fix TIOCSSERIAL
	permission check
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

Q2hhbmdpbmcgdGhlIHBvcnQgY2xvc2luZ193YWl0IHBhcmFtZXRlciBpcyBhIHByaXZpbGVnZWQg
b3BlcmF0aW9uLgoKQWRkIHRoZSBtaXNzaW5nIGNoZWNrIHRvIFRJT0NTU0VSSUFMIHNvIHRoYXQg
LUVQRVJNIGlzIHJldHVybmVkIGluIGNhc2UKYW4gdW5wcml2aWxlZ2VkIHVzZXIgdHJpZXMgdG8g
Y2hhbmdlIHRoZSBjbG9zaW5nLXdhaXQgc2V0dGluZy4KCkNjOiBzdGFibGVAdmdlci5rZXJuZWwu
b3JnClNpZ25lZC1vZmYtYnk6IEpvaGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0tCiBk
cml2ZXJzL3R0eS9hbWlzZXJpYWwuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkvYW1pc2VyaWFsLmMgYi9kcml2ZXJzL3R0eS9h
bWlzZXJpYWwuYwppbmRleCAwYzgxNTdmYWIxN2YuLmVjNjgwMmJhMmJmOCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy90dHkvYW1pc2VyaWFsLmMKKysrIGIvZHJpdmVycy90dHkvYW1pc2VyaWFsLmMKQEAg
LTk3MCw2ICs5NzAsNyBAQCBzdGF0aWMgaW50IHNldF9zZXJpYWxfaW5mbyhzdHJ1Y3QgdHR5X3N0
cnVjdCAqdHR5LCBzdHJ1Y3Qgc2VyaWFsX3N0cnVjdCAqc3MpCiAJaWYgKCFzZXJpYWxfaXNyb290
KCkpIHsKIAkJaWYgKChzcy0+YmF1ZF9iYXNlICE9IHN0YXRlLT5iYXVkX2Jhc2UpIHx8CiAJCSAg
ICAoc3MtPmNsb3NlX2RlbGF5ICE9IHBvcnQtPmNsb3NlX2RlbGF5KSB8fAorCQkgICAgKHNzLT5j
bG9zaW5nX3dhaXQgIT0gcG9ydC0+Y2xvc2luZ193YWl0KSB8fAogCQkgICAgKHNzLT54bWl0X2Zp
Zm9fc2l6ZSAhPSBzdGF0ZS0+eG1pdF9maWZvX3NpemUpIHx8CiAJCSAgICAoKHNzLT5mbGFncyAm
IH5BU1lOQ19VU1JfTUFTSykgIT0KIAkJICAgICAocG9ydC0+ZmxhZ3MgJiB+QVNZTkNfVVNSX01B
U0spKSkgewotLSAKMi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
