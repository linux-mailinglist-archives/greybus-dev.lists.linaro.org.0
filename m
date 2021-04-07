Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C10B3569A0
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:28:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5B0946187F
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:28:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4E1E661957; Wed,  7 Apr 2021 10:28:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DFB87667B0;
	Wed,  7 Apr 2021 10:24:51 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AE5EF66746
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A18976679E; Wed,  7 Apr 2021 10:24:22 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 1D91A66746
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:53 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 27C7B613C0;
 Wed,  7 Apr 2021 10:23:51 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008Rn-Uu; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:34 +0200
Message-Id: <20210407102334.32361-17-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 16/16] tty: synclink_gt: drop redundant
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
aGFuIEhvdm9sZCA8am9oYW5Aa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL3R0eS9zeW5jbGlua19n
dC5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy90dHkvc3luY2xpbmtfZ3QuYyBiL2RyaXZlcnMvdHR5L3N5bmNsaW5rX2d0LmMKaW5k
ZXggMWRiOTA4ZjYyZmRlLi45OTQ2MTg2MTg0NjYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3N5
bmNsaW5rX2d0LmMKKysrIGIvZHJpdmVycy90dHkvc3luY2xpbmtfZ3QuYwpAQCAtMzUxMSw4ICsz
NTExLDYgQEAgc3RhdGljIHN0cnVjdCBzbGd0X2luZm8gKmFsbG9jX2RldihpbnQgYWRhcHRlcl9u
dW0sIGludCBwb3J0X251bSwgc3RydWN0IHBjaV9kZXYKIAkJaW5mby0+bWF4X2ZyYW1lX3NpemUg
PSA0MDk2OwogCQlpbmZvLT5iYXNlX2Nsb2NrID0gMTQ3NDU2MDA7CiAJCWluZm8tPnJidWZfZmls
bF9sZXZlbCA9IERNQUJVRlNJWkU7Ci0JCWluZm8tPnBvcnQuY2xvc2VfZGVsYXkgPSA1KkhaLzEw
OwotCQlpbmZvLT5wb3J0LmNsb3Npbmdfd2FpdCA9IDMwKkhaOwogCQlpbml0X3dhaXRxdWV1ZV9o
ZWFkKCZpbmZvLT5zdGF0dXNfZXZlbnRfd2FpdF9xKTsKIAkJaW5pdF93YWl0cXVldWVfaGVhZCgm
aW5mby0+ZXZlbnRfd2FpdF9xKTsKIAkJc3Bpbl9sb2NrX2luaXQoJmluZm8tPm5ldGxvY2spOwot
LSAKMi4yNi4zCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpo
dHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
