Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id B827714A01B
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 09:53:27 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DADE461843
	for <lists+greybus-dev@lfdr.de>; Mon, 27 Jan 2020 08:53:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C96A06183B; Mon, 27 Jan 2020 08:53:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPOOFED_FREEMAIL
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 48AF26193C;
	Mon, 27 Jan 2020 08:52:53 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id AA0C960749
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 08:31:40 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 95EE360BF7; Sun, 26 Jan 2020 08:31:40 +0000 (UTC)
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by lists.linaro.org (Postfix) with ESMTPS id A206060749
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 08:31:39 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id x185so3409629pfc.5
 for <greybus-dev@lists.linaro.org>; Sun, 26 Jan 2020 00:31:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:user-agent;
 bh=A/HVm3170PfNClVZmwRIPi9sbl79x5ttiRZ0PyXbaOs=;
 b=JxnW2PL2kS/5I/V27hjbZ9vuDIrHagMEn7cr5rxk6gVRDLuuaJFdjqAhcyCMJX3fo7
 zvVbDiA44ZJWb9YBBlGrYAswEfpA5B2fAWccHM3nkYwFvYSL1nCIDee3piUXVMxYdzxV
 szN3IEK4CuQMBusFrUUrl/wF47KE0Z5yVmfmFwrPSvJO/hqFb5T2KWZFy7p/2AXTCMoF
 7KOhSgpDNQIIP8uM5OxlaRPPN+ihUwoodhfLAY5Wt9ovO33MliC3Q1B1eKDSKq0B3dKo
 eJsIHtdCdiLPCPft5WXuU4SyTOFoSGtqDPyOsp+FMqHRl5VqM1f7/mzlTM2DjdX95dKE
 df3Q==
X-Gm-Message-State: APjAAAVVWolFmqTWnBGyQjdYkmaOccKAcxU5XrgpZpEjO/6Odi/5HPG4
 vCnR9S1zaavCEm8UjMeqR3Q=
X-Google-Smtp-Source: APXvYqz2446wQU1D2ewWSd1GC8zgFgAP1p3+ZdA0gpPBv7Ouie0P26ycGZPJYf/Z05ATp0/rZQWRBA==
X-Received: by 2002:a65:5ccc:: with SMTP id b12mr13255457pgt.124.1580027498692; 
 Sun, 26 Jan 2020 00:31:38 -0800 (PST)
Received: from google.com ([123.201.163.10])
 by smtp.gmail.com with ESMTPSA id z64sm11988940pfz.23.2020.01.26.00.31.35
 (version=TLS1_2 cipher=AES128-SHA bits=128/128);
 Sun, 26 Jan 2020 00:31:38 -0800 (PST)
Date: Sun, 26 Jan 2020 14:01:30 +0530
From: Saurav Girepunje <saurav.girepunje@gmail.com>
To: vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Message-ID: <20200126083130.GA17725@google.com>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.6.2-neo (NetBSD/sparc64)
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 27 Jan 2020 08:52:51 +0000
Cc: saurav.girepunje@hotmail.com
Subject: [greybus-dev] [PATCH] staging: greybus: fix fw is NULL but
	dereferenced.
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

Rml4IHRoZSB3YXJuaW5nIHJlcG9ydGVkIGJ5IGNvY2NpIGNoZWNrLgoKQ2hhbmdlczoKCkluIHF1
ZXVlX3dvcmsgZncgZGVyZWZlcmVuY2UgYmVmb3JlIGl0IGFjdHVhbGx5IGdldCBhc3NpZ25lZC4K
bW92ZSBxdWV1ZV93b3JrIGJlZm9yZSBnYl9ib290cm9tX3NldF90aW1lb3V0LgoKQXMgZ2JfYm9v
dHJvbV9nZXRfZmlybXdhcmUgKCkgcmV0dXJuIE5FWFRfUkVRX1JFQURZX1RPX0JPT1QKb25seSB3
aGVuIHRoZXJlIGlzIG5vIGVycm9yIGFuZCBvZmZzZXQgKyBzaXplIGlzIGFjdHVhbGx5IGVxdWFs
CnRvIGZ3LT5zaXplLiBTbyBpbml0aWFsaXplZCBuZXh0X3JlcXVlc3QgdG8gTkVYVF9SRVFfR0VU
X0ZJUk1XQVJFCmZvciByZXR1cm4gaW4gb3RoZXIgY2FzZS4KClNpZ25lZC1vZmYtYnk6IFNhdXJh
diBHaXJlcHVuamUgPHNhdXJhdi5naXJlcHVuamVAZ21haWwuY29tPgotLS0KICBkcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMgfCA2ICsrLS0tLQogIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvYm9vdHJvbS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYm9vdHJvbS5jCmlu
ZGV4IGE4ZWZiODYuLmY1NDUxNGUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2Jvb3Ryb20uYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9ib290cm9tLmMKQEAgLTI0
Niw3ICsyNDYsNyBAQCBzdGF0aWMgaW50IGdiX2Jvb3Ryb21fZ2V0X2Zpcm13YXJlKHN0cnVjdCBn
Yl9vcGVyYXRpb24gKm9wKQogIAlzdHJ1Y3QgZ2JfYm9vdHJvbV9nZXRfZmlybXdhcmVfcmVzcG9u
c2UgKmZpcm13YXJlX3Jlc3BvbnNlOwogIAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmb3AtPmNvbm5l
Y3Rpb24tPmJ1bmRsZS0+ZGV2OwogIAl1bnNpZ25lZCBpbnQgb2Zmc2V0LCBzaXplOwotCWVudW0g
bmV4dF9yZXF1ZXN0X3R5cGUgbmV4dF9yZXF1ZXN0OworCWVudW0gbmV4dF9yZXF1ZXN0X3R5cGUg
bmV4dF9yZXF1ZXN0ID0gTkVYVF9SRVFfR0VUX0ZJUk1XQVJFOwogIAlpbnQgcmV0ID0gMDsKICAK
ICAJLyogRGlzYWJsZSB0aW1lb3V0cyAqLwpAQCAtMjk2LDEzICsyOTYsMTEgQEAgc3RhdGljIGlu
dCBnYl9ib290cm9tX2dldF9maXJtd2FyZShzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpvcCkKICB1bmxv
Y2s6CiAgCW11dGV4X3VubG9jaygmYm9vdHJvbS0+bXV0ZXgpOwogIAotcXVldWVfd29yazoKICAJ
LyogUmVmcmVzaCB0aW1lb3V0ICovCiAgCWlmICghcmV0ICYmIChvZmZzZXQgKyBzaXplID09IGZ3
LT5zaXplKSkKICAJCW5leHRfcmVxdWVzdCA9IE5FWFRfUkVRX1JFQURZX1RPX0JPT1Q7Ci0JZWxz
ZQotCQluZXh0X3JlcXVlc3QgPSBORVhUX1JFUV9HRVRfRklSTVdBUkU7CiAgCitxdWV1ZV93b3Jr
OgogIAlnYl9ib290cm9tX3NldF90aW1lb3V0KGJvb3Ryb20sIG5leHRfcmVxdWVzdCwgTkVYVF9S
RVFfVElNRU9VVF9NUyk7CiAgCiAgCXJldHVybiByZXQ7Ci0tIAoxLjkuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3Jn
L21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
