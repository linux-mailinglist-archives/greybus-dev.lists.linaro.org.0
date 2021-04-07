Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 94172356991
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 12:25:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1F29665FB
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 10:25:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A6B2F66725; Wed,  7 Apr 2021 10:25:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3743366790;
	Wed,  7 Apr 2021 10:24:12 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1F24666779
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 091CF6677C; Wed,  7 Apr 2021 10:23:56 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.linaro.org (Postfix) with ESMTPS id 2D58566631
 for <greybus-dev@lists.linaro.org>; Wed,  7 Apr 2021 10:23:52 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 54215613A3;
 Wed,  7 Apr 2021 10:23:50 +0000 (UTC)
Received: from johan by xi.lan with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1lU5La-0008R6-Rk; Wed, 07 Apr 2021 12:23:42 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed,  7 Apr 2021 12:23:21 +0200
Message-Id: <20210407102334.32361-4-johan@kernel.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210407102334.32361-1-johan@kernel.org>
References: <20210407102334.32361-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 Jiri Slaby <jirislaby@kernel.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
Subject: [greybus-dev] [PATCH 03/16] staging: fwserial: fix TIOCSSERIAL
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
cyBzaG91bGQgcmV0dXJuIHN1Y2Nlc3MuCgpGaXggdGhlIGZ3c2VyaWFsIGltcGxlbWVudGF0aW9u
IHdoaWNoIHdhcyByZXR1cm5pbmcgLUVQRVJNIGFsc28gZm9yIGEKcHJpdmlsZWdlZCB1c2VyIHdo
ZW4gdHJ5aW5nIHRvIGNoYW5nZSBjZXJ0YWluIHVuc3VwcG9ydGVkIHBhcmFtZXRlcnMsCmFuZCBp
bnN0ZWFkIHJldHVybiBzdWNjZXNzIGNvbnNpc3RlbnRseS4KCkZpeGVzOiA3MzU1YmEzNDQ1ZjIg
KCJzdGFnaW5nOiBmd3NlcmlhbDogQWRkIFRUWS1vdmVyLUZpcmV3aXJlIHNlcmlhbCBkcml2ZXIi
KQpTaWduZWQtb2ZmLWJ5OiBKb2hhbiBIb3ZvbGQgPGpvaGFuQGtlcm5lbC5vcmc+Ci0tLQogZHJp
dmVycy9zdGFnaW5nL2Z3c2VyaWFsL2Z3c2VyaWFsLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2Vk
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9md3NlcmlhbC9m
d3NlcmlhbC5jIGIvZHJpdmVycy9zdGFnaW5nL2Z3c2VyaWFsL2Z3c2VyaWFsLmMKaW5kZXggNDQw
ZDExNDIzODEyLi4yODg4YjgwYTJjMWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9md3Nl
cmlhbC9md3NlcmlhbC5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9md3NlcmlhbC9md3NlcmlhbC5j
CkBAIC0xMjM0LDEwICsxMjM0LDYgQEAgc3RhdGljIGludCBzZXRfc2VyaWFsX2luZm8oc3RydWN0
IHR0eV9zdHJ1Y3QgKnR0eSwKIAlzdHJ1Y3QgZnd0dHlfcG9ydCAqcG9ydCA9IHR0eS0+ZHJpdmVy
X2RhdGE7CiAJdW5zaWduZWQgaW50IGNkZWxheTsKIAotCWlmIChzcy0+aXJxICE9IDAgfHwgc3Mt
PnBvcnQgIT0gMCB8fCBzcy0+Y3VzdG9tX2Rpdmlzb3IgIT0gMCB8fAotCSAgICBzcy0+YmF1ZF9i
YXNlICE9IDQwMDAwMDAwMCkKLQkJcmV0dXJuIC1FUEVSTTsKLQogCWNkZWxheSA9IG1zZWNzX3Rv
X2ppZmZpZXMoc3MtPmNsb3NlX2RlbGF5ICogMTApOwogCiAJbXV0ZXhfbG9jaygmcG9ydC0+cG9y
dC5tdXRleCk7Ci0tIAoyLjI2LjMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXli
dXMtZGV2Cg==
