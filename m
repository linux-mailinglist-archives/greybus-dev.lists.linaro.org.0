Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A50C7A9B9F
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 09:21:21 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D367661724
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 07:21:20 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C5D66617F2; Thu,  5 Sep 2019 07:21:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 95D9A61891;
	Thu,  5 Sep 2019 07:20:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7A2736186A
 for <greybus-dev@lists.linaro.org>; Wed,  4 Sep 2019 21:06:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6704B61868; Wed,  4 Sep 2019 21:06:26 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
 [209.85.160.196])
 by lists.linaro.org (Postfix) with ESMTPS id 9D61461868
 for <greybus-dev@lists.linaro.org>; Wed,  4 Sep 2019 21:06:24 +0000 (UTC)
Received: by mail-qt1-f196.google.com with SMTP id u40so116995qth.11
 for <greybus-dev@lists.linaro.org>; Wed, 04 Sep 2019 14:06:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UaZIRIb7eWDZUmuFUvyLJZmPVK7Rr9RueiAiw2bvhuY=;
 b=TR6OM8XCimjciRRcY4mOO6icw5JzntaADx6scSWBk5/i/i20SXvIERqxgJumcN00MZ
 8z+oWzjrnsGQ+kX+CZbHSNSL4IA3i9sr6enErrhyWEs8Pjis5DBYBjnwPMc0oLct8Mes
 iZuachrNFOavmEx+90iuBxWKusRxJrxSW4w+d89OvBlAGW2rLiC238k5QDynhyRk/UaR
 /a75oGmcfahF5LTEi26Yt9RFYlrRCbFQggYvtw0F9v+2FbQAQEij2bEP/MkF2onMdOCS
 tYilr2+DmHbcZndp2ZOk7velZY/zq6i9kgd4w+haHk4Yx7NyXXSqCbO7lhwyjjV1LhUn
 LnJA==
X-Gm-Message-State: APjAAAVIQQwLVcZZvkaqDQ4Tgr+SOWL2byb20YiY8OhRt6UI3iIsuUjK
 kZdjIC0ozcHmkKlJXIzB564=
X-Google-Smtp-Source: APXvYqwVoEzX6KSezOYOFf+WK2aIAr87DU49pQjAfxp0pf9UKtZOQWsSmSLyU+3HlWu+KMfP6vmIUQ==
X-Received: by 2002:ac8:92d:: with SMTP id t42mr105126qth.206.1567631184313;
 Wed, 04 Sep 2019 14:06:24 -0700 (PDT)
Received: from 24a3ceb039de.ic.unicamp.br
 (wifi-177-220-85-167.wifi.ic.unicamp.br. [177.220.85.167])
 by smtp.gmail.com with ESMTPSA id o127sm86871qkd.104.2019.09.04.14.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 14:06:23 -0700 (PDT)
From: Pedro Chinen <ph.u.chinen@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org
Date: Wed,  4 Sep 2019 21:05:47 +0000
Message-Id: <20190904210547.5288-1-ph.u.chinen@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:20:48 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: loopback_test: remove
	multiple blank lines
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

Rml4IGZvbGxvd2luZyBjaGVja3BhdGggd2FybmluZ3MgaW4gbXVsdGlwbGUgbGluZXM6CkNIRUNL
OiBQbGVhc2UgZG9uJ3QgdXNlIG11bHRpcGxlIGJsYW5rIGxpbmVzCgpTaWduZWQtb2ZmLWJ5OiBQ
ZWRybyBDaGluZW4gPHBoLnUuY2hpbmVuQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMv
bG9vcGJhY2tfdGVzdC5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tf
dGVzdC5jCmluZGV4IGJhNmY5MDVmMjZmYS4uMWU3OGMxNDhkN2NiIDEwMDY0NAotLS0gYS9kcml2
ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMKKysrIGIvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCkBAIC03NzksNyArNzc5LDYgQEAg
c3RhdGljIHZvaWQgcHJlcGFyZV9kZXZpY2VzKHN0cnVjdCBsb29wYmFja190ZXN0ICp0KQogCQlp
ZiAodC0+c3RvcF9hbGwgfHwgZGV2aWNlX2VuYWJsZWQodCwgaSkpCiAJCQl3cml0ZV9zeXNmc192
YWwodC0+ZGV2aWNlc1tpXS5zeXNmc19lbnRyeSwgInR5cGUiLCAwKTsKIAotCiAJZm9yIChpID0g
MDsgaSA8IHQtPmRldmljZV9jb3VudDsgaSsrKSB7CiAJCWlmICghZGV2aWNlX2VuYWJsZWQodCwg
aSkpCiAJCQljb250aW51ZTsKQEAgLTg1MCw3ICs4NDksNiBAQCB2b2lkIGxvb3BiYWNrX3J1bihz
dHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKIAlpZiAocmV0KQogCQlnb3RvIGVycjsKIAotCiAJZ2V0
X3Jlc3VsdHModCk7CiAKIAlsb2dfcmVzdWx0cyh0KTsKQEAgLTg4Miw3ICs4ODAsNiBAQCBzdGF0
aWMgaW50IHNhbml0eV9jaGVjayhzdHJ1Y3QgbG9vcGJhY2tfdGVzdCAqdCkKIAogCX0KIAotCiAJ
cmV0dXJuIDA7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8v
Z3JleWJ1cy1kZXYK
