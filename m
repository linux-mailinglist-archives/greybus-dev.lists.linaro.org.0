Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E895F35699C
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:27:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 14B9A61957
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:27:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id F0475665FB; Wed,  7 Apr 2021 10:27:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 936C266779;
	Wed,  7 Apr 2021 10:24:46 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AA21C6088A
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9ED2B6678F; Wed,  7 Apr 2021 10:24:04 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 102396088A
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15030613EE;
 Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008Ri-SN; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:33 +0200
Message-Id: <20210407102334.32361-16-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 15/16] pcmcia: synclink_cs: drop redundant
	tty-port initialisation
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

VGhlIHBvcnQgY2xvc2VfZGVsYXkgYW5kIGNsb3Npbmdfd2FpdCBwYXJhbWV0ZXJzIGhhdmUgYWxy
ZWFkeSBiZWVuIGJ5CnR0eV9wb3J0X2luaXQoKSBzbyBkcm9wIHRoZSByZWR1bmRhbnQgZHJpdmVy
IGluaXRpYWxpc2F0aW9uIHRvIHRoZQpkZWZhdWx0IHZhbHVlcy4KClNpZ25lZC1vZmYtYnk6IEpv
aGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL2NoYXIvcGNtY2lhL3N5
bmNsaW5rX2NzLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2NoYXIvcGNtY2lhL3N5bmNsaW5rX2NzLmMgYi9kcml2ZXJzL2NoYXIv
cGNtY2lhL3N5bmNsaW5rX2NzLmMKaW5kZXggMmJlOGQ5YThlZWM1Li4zMjg3YTc2MjdlZDAgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvY2hhci9wY21jaWEvc3luY2xpbmtfY3MuYworKysgYi9kcml2ZXJz
L2NoYXIvcGNtY2lhL3N5bmNsaW5rX2NzLmMKQEAgLTUzMCw4ICs1MzAsNiBAQCBzdGF0aWMgaW50
IG1nc2xwY19wcm9iZShzdHJ1Y3QgcGNtY2lhX2RldmljZSAqbGluaykKIAlpbmZvLT5wb3J0Lm9w
cyA9ICZtZ3NscGNfcG9ydF9vcHM7CiAJSU5JVF9XT1JLKCZpbmZvLT50YXNrLCBiaF9oYW5kbGVy
KTsKIAlpbmZvLT5tYXhfZnJhbWVfc2l6ZSA9IDQwOTY7Ci0JaW5mby0+cG9ydC5jbG9zZV9kZWxh
eSA9IDUqSFovMTA7Ci0JaW5mby0+cG9ydC5jbG9zaW5nX3dhaXQgPSAzMCpIWjsKIAlpbml0X3dh
aXRxdWV1ZV9oZWFkKCZpbmZvLT5zdGF0dXNfZXZlbnRfd2FpdF9xKTsKIAlpbml0X3dhaXRxdWV1
ZV9oZWFkKCZpbmZvLT5ldmVudF93YWl0X3EpOwogCXNwaW5fbG9ja19pbml0KCZpbmZvLT5sb2Nr
KTsKLS0gCjIuMjYuMwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
