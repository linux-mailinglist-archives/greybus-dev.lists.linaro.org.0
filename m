Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id BED2C356999
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:27:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DD7ED6187F
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:27:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D09ED61957; Wed,  7 Apr 2021 10:27:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 32D916679F;
	Wed,  7 Apr 2021 10:24:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5A93766707
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:24:02 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4C10E6678D; Wed,  7 Apr 2021 10:24:02 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 5960066718
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D51F1613E8;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5Lb-0008RZ-Jh; Wed, 07 Apr 2021 12:23:43 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:30 +0200
Message-Id: <20210407102334.32361-13-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 12/16] tty: moxa: fix TIOCSSERIAL
	implementation
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

VElPQ1NTRVJJQUwgaXMgYSBob3JyaWQsIHVuZGVyc3BlY2lmaWVkLCBsZWdhY3kgaW50ZXJmYWNl
IHdoaWNoIGZvciBtb3N0CnNlcmlhbCBkZXZpY2VzIGlzIG9ubHkgdXNlZnVsIGZvciBzZXR0aW5n
IHRoZSBjbG9zZV9kZWxheSBhbmQKY2xvc2luZ193YWl0IHBhcmFtZXRlcnMuCgpBIG5vbi1wcml2
aWxlZ2VkIHVzZXIgaGFzIG9ubHkgZXZlciBiZWVuIGFibGUgdG8gc2V0IHRoZSBzaW5jZSBsb25n
CmRlcHJlY2F0ZWQgQVNZTkNfU1BEIGZsYWdzIGFuZCB0cnlpbmcgdG8gY2hhbmdlIGFueSBvdGhl
ciAqc3VwcG9ydGVkKgpmZWF0dXJlIHNob3VsZCByZXN1bHQgaW4gLUVQRVJNIGJlaW5nIHJldHVy
bmVkLiBTZXR0aW5nIHRoZSBjdXJyZW50CnZhbHVlcyBmb3IgYW55IHN1cHBvcnRlZCBmZWF0dXJl
cyBzaG91bGQgcmV0dXJuIHN1Y2Nlc3MuCgpGaXggdGhlIG1veGEgaW1wbGVtZW50YXRpb24gd2hp
Y2ggd2FzIHJldHVybmluZyAtRVBFUk0gYWxzbyBmb3IgYQpwcml2aWxlZ2VkIHVzZXIgd2hlbiB0
cnlpbmcgdG8gY2hhbmdlIGNlcnRhaW4gdW5zdXBwb3J0ZWQgcGFyYW1ldGVycyBhbmQKaW5zdGVh
ZCByZXR1cm4gc3VjY2VzcyBjb25zaXN0ZW50bHkuCgpTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3Zv
bGQgPGpvaGFuQGtlcm5lbC5vcmc+Ci0tLQogZHJpdmVycy90dHkvbW94YS5jIHwgNSAtLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy90dHkv
bW94YS5jIGIvZHJpdmVycy90dHkvbW94YS5jCmluZGV4IDYzZTQ0MGQ5MDBmZi4uNGQ0ZjE1YjVj
ZDI5IDEwMDY0NAotLS0gYS9kcml2ZXJzL3R0eS9tb3hhLmMKKysrIGIvZHJpdmVycy90dHkvbW94
YS5jCkBAIC0yMDU1LDExICsyMDU1LDYgQEAgc3RhdGljIGludCBtb3hhX3NldF9zZXJpYWxfaW5m
byhzdHJ1Y3QgdHR5X3N0cnVjdCAqdHR5LAogCWlmICghaW5mbykKIAkJcmV0dXJuIC1FTk9ERVY7
CiAKLQlpZiAoc3MtPmlycSAhPSAwIHx8IHNzLT5wb3J0ICE9IDAgfHwKLQkJCXNzLT5jdXN0b21f
ZGl2aXNvciAhPSAwIHx8Ci0JCQlzcy0+YmF1ZF9iYXNlICE9IDkyMTYwMCkKLQkJcmV0dXJuIC1F
UEVSTTsKLQogCWNsb3NlX2RlbGF5ID0gbXNlY3NfdG9famlmZmllcyhzcy0+Y2xvc2VfZGVsYXkg
KiAxMCk7CiAKIAltdXRleF9sb2NrKCZpbmZvLT5wb3J0Lm11dGV4KTsKLS0gCjIuMjYuMwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYg
bWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5s
aW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
