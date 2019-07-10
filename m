Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ED6F65027
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 04:30:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1DAF61781
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Jul 2019 02:30:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id A69466182D; Thu, 11 Jul 2019 02:30:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DATE_IN_PAST_03_06,
	DKIM_ADSP_CUSTOM_MED,FREEMAIL_FROM,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2539A61797;
	Thu, 11 Jul 2019 02:30:08 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 320B561758
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 16:20:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 26B176177D; Wed, 10 Jul 2019 16:20:34 +0000 (UTC)
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
 [209.85.222.195])
 by lists.linaro.org (Postfix) with ESMTPS id 2442961758
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 16:20:33 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id s22so2322605qkj.12
 for <greybus-dev@lists.linaro.org>; Wed, 10 Jul 2019 09:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QibyFGWnGdatOh5nsBNwpo+J2I04tbVTYJ/VYtxRgmY=;
 b=kSwIaYDH9QhA93E6goKw4yvKXWgxVcY+2VqNUpVte8a9AaCKIlc/HNn4l1KzMjWluF
 5YDwcTm8dSzQIYcbo6XDU0lbOpz13+VwtQeRZpIVhMFNwGf5shJpSLd06aKpXPFWQLSj
 yrGgnIy1jhyH8bmhpyr7RxO4o6njLs1oykbNdTRp3YoSO9IM4qhbUmtL25Ky1Ct1BCpC
 EmjtllOA/qtdLGpfMuzd40YEG5gGRKulGc8oGDwVMdxcLBAsDrJeihCGyyGj8ZcmkW46
 Kb2fdseDT3HgOec97hcTNLKSLByRN0TpdrP0ZMyJZ1An9E0rd+z22IHnPf/+A0FY5QPA
 M21w==
X-Gm-Message-State: APjAAAXCBKUSTGdZYw3cZkuMyC6OS1G8qSExtlC7bT1mVta+lHNjXsCB
 VtD1m3pfTalHWLaWIxpkIw==
X-Google-Smtp-Source: APXvYqxVssmy8QQI7rLDeD1eZVdZ4DW7d8qWxdxiaMn/YNYrzpr6p+bYlVuIkxf22mrsNYDvJMmv7Q==
X-Received: by 2002:a37:4c4e:: with SMTP id z75mr24407869qka.230.1562775632730; 
 Wed, 10 Jul 2019 09:20:32 -0700 (PDT)
Received: from localhost.localdomain (modemcable148.230-83-70.mc.videotron.ca.
 [70.83.230.148])
 by smtp.googlemail.com with ESMTPSA id 6sm1546208qkp.82.2019.07.10.09.20.31
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 09:20:32 -0700 (PDT)
From: Keyur Patel <iamkeyur96@gmail.com>
To: 
Date: Wed, 10 Jul 2019 08:20:17 -0400
Message-Id: <20190710122018.2250-1-iamkeyur96@gmail.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Jul 2019 02:30:06 +0000
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, David Lin <dtwlin@gmail.com>,
 greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 iamkeyur96@gmail.com
Subject: [greybus-dev] [PATCH] staging: greybus: add logging statement when
	kfifo_alloc fails
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

QWRkZWQgbWlzc2luZyBsb2dnaW5nIHN0YXRlbWVudCB3aGVuIGtmaWZvX2FsbG9jIGZhaWxzLCB0
byBpbXByb3ZlCmRlYnVnZ2luZy4KClNpZ25lZC1vZmYtYnk6IEtleXVyIFBhdGVsIDxpYW1rZXl1
cjk2QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMgfCA0ICsr
Ky0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy91YXJ0LmMgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy91YXJ0LmMKaW5kZXggYjNiZmZlOTFhZTk5Li44NmEzOTVhZTE3N2QgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3VhcnQuYworKysgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy91YXJ0LmMKQEAgLTg1Niw4ICs4NTYsMTAgQEAgc3RhdGljIGludCBnYl91YXJ0X3By
b2JlKHN0cnVjdCBnYnBoeV9kZXZpY2UgKmdicGh5X2RldiwKIAogCXJldHZhbCA9IGtmaWZvX2Fs
bG9jKCZnYl90dHktPndyaXRlX2ZpZm8sIEdCX1VBUlRfV1JJVEVfRklGT19TSVpFLAogCQkJICAg
ICBHRlBfS0VSTkVMKTsKLQlpZiAocmV0dmFsKQorCWlmIChyZXR2YWwpIHsKKwkJcHJfZXJyKCJr
Zmlmb19hbGxvYyBmYWlsZWRcbiIpOwogCQlnb3RvIGV4aXRfYnVmX2ZyZWU7CisJfQogCiAJZ2Jf
dHR5LT5jcmVkaXRzID0gR0JfVUFSVF9GSVJNV0FSRV9DUkVESVRTOwogCWluaXRfY29tcGxldGlv
bigmZ2JfdHR5LT5jcmVkaXRzX2NvbXBsZXRlKTsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
