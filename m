Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EE2A9B9D
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 09:21:01 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 407F561738
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 07:21:00 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 312B161897; Thu,  5 Sep 2019 07:21:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BCB7261875;
	Thu,  5 Sep 2019 07:20:49 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BC95F61843
 for <greybus-dev@lists.linaro.org>; Wed,  4 Sep 2019 20:32:19 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9F46561868; Wed,  4 Sep 2019 20:32:19 +0000 (UTC)
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com
 [209.85.222.196])
 by lists.linaro.org (Postfix) with ESMTPS id BF6C961843
 for <greybus-dev@lists.linaro.org>; Wed,  4 Sep 2019 20:32:18 +0000 (UTC)
Received: by mail-qk1-f196.google.com with SMTP id x134so10849770qkb.0
 for <greybus-dev@lists.linaro.org>; Wed, 04 Sep 2019 13:32:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Rw3ZlxgGIlK+n0HAnKhsvEmsMU3R5cAn/CwZ2JWWhG4=;
 b=n+WYoJmziQ0jsKQEXv+aT/cLTi7SmpKKENOmk/yrqKQh70g8Wu4lypchVq+YujBlHb
 MVDu45fw8Zd82X8V02LwxGErkxkTPC5PujyPD1qZ/U7m+etJxg9gTwrl/MNLRh7crgRi
 Rcu19fFPQ3W4afSq4x0g+pSchle2UOQSOchMCjPY0wpK9nBKzn0uxLwvFCyzvBcrsBTg
 SSY1QLImTUDbCaZ+f2XW8Ve74DrrR3RjDoGYAspFZ82b+fAiJ9hDP9RZ7S8M19hdoUs3
 DmqrBMke9YVorMDMoiz7KpWnggjZliCNqPoabDhdmGdtev+ljQ5Z0QkE6tlj8fcPIulX
 p+8Q==
X-Gm-Message-State: APjAAAX0oDnJPjEKuWt9AO2bvqZVGZ/i9f8/7L1Z8AVDNCD1gxvyQeDM
 4tXvcDO6ZkLu0ZSzDXzsRPk31BPO
X-Google-Smtp-Source: APXvYqzqLCpHOCjA/B41dTkGeqI8xn4qIc6C7vCcbLfRSxUJDQ3GEP1X23zoT22+OaG1es1zzOO5/w==
X-Received: by 2002:a05:620a:7cc:: with SMTP id
 12mr42022383qkb.64.1567629138024; 
 Wed, 04 Sep 2019 13:32:18 -0700 (PDT)
Received: from localhost.localdomain (179-193-232-238.user3g.veloxzone.com.br.
 [179.193.232.238])
 by smtp.gmail.com with ESMTPSA id 21sm54602qkj.11.2019.09.04.13.32.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:32:17 -0700 (PDT)
From: Julio Faracco <jcfaracco@gmail.com>
To: greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org
Date: Wed,  4 Sep 2019 20:32:09 +0000
Message-Id: <20190904203209.8669-1-jcfaracco@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:20:48 +0000
Cc: lkcamp@lists.libreplanetbr.org, elder@kernel.org, johan@kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: Adding missing brackets
	into if..else block.
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

SW5zaWRlIGEgYmxvY2sgb2YgaWYuLmVsc2UgY29uZGl0aW9uYWwsIGVsc2Ugc3RydWN0dXJlIGRv
ZXMgbm90IGNvbnRhaW4KYnJhY2tldHMuIFRoaXMgaXMgbm90IGZvbGxvd2luZyByZWd1bGFyIHBv
bGljaWVzIG9mIGdvb2QgY29kaW5nIHN0eWxlLgpBbGwgcGFydHMgb2YgdGhpcyBjb25kaXRpb25h
bCBibG9ja3Mgc2hvdWxkIHJlc3BlY3QgYnJhY2tldHMgaW5jbHVzaW9uLgoKU2lnbmVkLW9mZi1i
eTogSnVsaW8gRmFyYWNjbyA8amNmYXJhY2NvQGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgfCAzICsrLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5
YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwppbmRleCBiYTZmOTA1ZjIuLmQ0NjcyMTUwMiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCisr
KyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYwpAQCAtODAx
LDggKzgwMSw5IEBAIHN0YXRpYyB2b2lkIHByZXBhcmVfZGV2aWNlcyhzdHJ1Y3QgbG9vcGJhY2tf
dGVzdCAqdCkKIAkJCXdyaXRlX3N5c2ZzX3ZhbCh0LT5kZXZpY2VzW2ldLnN5c2ZzX2VudHJ5LAog
CQkJCQkib3V0c3RhbmRpbmdfb3BlcmF0aW9uc19tYXgiLAogCQkJCQl0LT5hc3luY19vdXRzdGFu
ZGluZ19vcGVyYXRpb25zKTsKLQkJfSBlbHNlCisJCX0gZWxzZSB7CiAJCQl3cml0ZV9zeXNmc192
YWwodC0+ZGV2aWNlc1tpXS5zeXNmc19lbnRyeSwgImFzeW5jIiwgMCk7CisJCX0KIAl9CiB9CiAK
LS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcK
aHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
