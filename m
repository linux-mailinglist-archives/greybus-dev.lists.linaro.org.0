Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F7D19D626
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 13:55:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 31DCB6050C
	for <lists+greybus-dev@lfdr.de>; Fri,  3 Apr 2020 11:55:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2690D60E02; Fri,  3 Apr 2020 11:55:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 58DB8608B0;
	Fri,  3 Apr 2020 11:55:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 165C4608F6
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 14:49:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 043C760E39; Sat, 28 Mar 2020 14:49:20 +0000 (UTC)
Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com
 [209.85.219.67])
 by lists.linaro.org (Postfix) with ESMTPS id 2B734608F6
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 14:49:19 +0000 (UTC)
Received: by mail-qv1-f67.google.com with SMTP id s18so2053573qvn.1
 for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2020 07:49:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eMnrU0WApKI2kUmNaae7d2SayiuChIphibAUFUJDPBg=;
 b=YnLD6PIwgoD/jJO60KuPayGtsvmHL6z5qSPRR9N/gXbKQn+U73+agOiRSU8J6n2qfH
 4EwuVXWWAoBVt5pxrnlHbrHjWXltmpO9uY+00LYvrd4ruIQaGEAUbw/NtnTxyKtGFWNo
 BnG+EA0hofV8Lgf97Q89KkAvE04cSvz9HAHztqA7d7Td4AYboRzy5dDPXuSGp+PSQCzT
 KyGSimFROw7rr7tRhQ1cKgdtOOB2FebfcgjbVzQRTtYv30nlEUHJ1ZDS1eQ1m0zLvtek
 AfPFQD2qPGMs7nNt5lenwQYwItLzl2k4hFD+RBoIUpJ+qxRjP92kwqA0XZLG1TO7USem
 VNLg==
X-Gm-Message-State: ANhLgQ2wM7ayuu863UlL7S9YFBtGKv68pmLNa+wcmHC00aIbT/itA8LR
 iJnRInpF71zznmXI3ziBSoM=
X-Google-Smtp-Source: ADFU+vtcQqGLyxHZ21q6S1SEEqzYrfRoAiFZCjxif91giIS1h8/CzXG61jmKZ5G/0yhpJvO0oEnDLA==
X-Received: by 2002:a0c:a998:: with SMTP id a24mr4141032qvb.141.1585406958495; 
 Sat, 28 Mar 2020 07:49:18 -0700 (PDT)
Received: from gaia.fios-router.home
 (pool-108-46-51-236.nycmny.fios.verizon.net. [108.46.51.236])
 by smtp.gmail.com with ESMTPSA id q1sm6910092qtn.69.2020.03.28.07.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Mar 2020 07:49:17 -0700 (PDT)
From: Dan Jessie <dtjessie@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org
Date: Sat, 28 Mar 2020 10:49:00 -0400
Message-Id: <20200328144900.31423-1-dtjessie@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 31 Mar 2020 12:27:06 +0000
Cc: Dan Jessie <dtjessie@gmail.com>
Subject: [greybus-dev] [PATCH RESEND] staging: greybus: hid: remove braces
	{} around single statement block
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

VGhpcyBwYXRjaCBmaXhlcyB0aGUgY2hlY2twYXRjaC5wbCB3YXJuaW5nOgoKV0FSTklORzogYnJh
Y2VzIHt9IGFyZSBub3QgbmVjZXNzYXJ5IGZvciBzaW5nbGUgc3RhdGVtZW50IGJsb2NrcwoKUGVy
IEFsZXggRWxkZXIncyA8ZWxkZXJAaWVlZS5vcmc+IHN1Z2dlc3Rpb24sIG5vdGluZyB0aGF0IHRo
aXMgaXMgdGhlIG9ubHkKaW5zdGFuY2Ugb2YgdGhlIHByb2JsZW0gbm90ZWQgYnkgY2hlY2twYXRj
aC5wbCBpbiBzdGFnaW5nOiBncmV5YnVzLgoKU2lnbmVkLW9mZi1ieTogRGFuIEplc3NpZSA8ZHRq
ZXNzaWVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2hpZC5jIHwgMyAr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYyBiL2RyaXZlcnMvc3RhZ2luZy9n
cmV5YnVzL2hpZC5jCmluZGV4IDA0YmZkOTExMDUwMi4uZWQ3MDZmMzllODdhIDEwMDY0NAotLS0g
YS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9oaWQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9oaWQuYwpAQCAtMjkwLDkgKzI5MCw4IEBAIHN0YXRpYyBpbnQgZ2JfaGlkX3BhcnNlKHN0
cnVjdCBoaWRfZGV2aWNlICpoaWQpCiAJfQogCiAJcmRlc2MgPSBremFsbG9jKHJzaXplLCBHRlBf
S0VSTkVMKTsKLQlpZiAoIXJkZXNjKSB7CisJaWYgKCFyZGVzYykKIAkJcmV0dXJuIC1FTk9NRU07
Ci0JfQogCiAJcmV0ID0gZ2JfaGlkX2dldF9yZXBvcnRfZGVzYyhnaGlkLCByZGVzYyk7CiAJaWYg
KHJldCkgewotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGlu
YXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVz
LWRldgo=
