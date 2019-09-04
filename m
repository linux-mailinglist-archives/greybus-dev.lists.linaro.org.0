Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D49EA9B9E
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 09:21:12 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 75A2861738
	for <lists+greybus-dev@lfdr.de>; Thu,  5 Sep 2019 07:21:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 66FAC617F2; Thu,  5 Sep 2019 07:21:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 051C061883;
	Thu,  5 Sep 2019 07:20:50 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id B116261868
 for <greybus-dev@lists.linaro.org>; Wed,  4 Sep 2019 20:56:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A526A6186E; Wed,  4 Sep 2019 20:56:16 +0000 (UTC)
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
 [209.85.160.193])
 by lists.linaro.org (Postfix) with ESMTPS id ED40261868
 for <greybus-dev@lists.linaro.org>; Wed,  4 Sep 2019 20:56:15 +0000 (UTC)
Received: by mail-qt1-f193.google.com with SMTP id o12so146349qtf.3
 for <greybus-dev@lists.linaro.org>; Wed, 04 Sep 2019 13:56:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1QaddsCLQh46Q9EX1SzXxpSpkDTuxvATR1ZZECPWevo=;
 b=eeCGw++CtJGOGbeZq6NYyDpExkgGK82Mcm5hRQ6zkKeJ48zG57hGQk/Co2Bv6km/4S
 hB+mh1aw9Vf4axzBsgLBXjk4qoAoeMOuK5sBbx2B8aEJhCex4+J9Hqgrc0lBG7veHWiW
 UOYJL9nBz6EgvQRkFJO8b6LZdhumL6MWyu0LJus0c1kijwKBpOx+a1Ha82BGL+TFZcUr
 zBRSVLNcxt6/H6eGQNEDuasTKQlNN47gnH0rz3RFFtDgepHLYXuoIlBDPzubRvkx270y
 EHNxn63Gl0wpngsUn1L9rFr+np2UmtZAiJqRP7yiBSc9byyXBbMxqJqOmmGcPWU03nrt
 JB3A==
X-Gm-Message-State: APjAAAUT+TxVKd8qWHKKdcCaqqNp4OgWMHf3MV3bjAI9uKJcjHd6Qyu2
 VEr7uBIazzEpikzjto2/ZTQ=
X-Google-Smtp-Source: APXvYqzmSUjeBY0HCsAUxhBjx6Rf12lCd77aY1C0yZnkwSV/0fmWgXiCTIX6FfsZuohn9DAN1QFwww==
X-Received: by 2002:ad4:5048:: with SMTP id m8mr27389919qvq.134.1567630575468; 
 Wed, 04 Sep 2019 13:56:15 -0700 (PDT)
Received: from 389b3b377db9.ic.unicamp.br
 (wifi-177-220-85-178.wifi.ic.unicamp.br. [177.220.85.178])
 by smtp.gmail.com with ESMTPSA id g194sm95382qke.46.2019.09.04.13.56.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 13:56:14 -0700 (PDT)
From: joahannes <joahannes@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-kernel@vger.kernel.org, lkcamp@lists.libreplanetbr.org,
 jevsilv@gmail.com, joahannes@gmail.com
Date: Wed,  4 Sep 2019 20:55:58 +0000
Message-Id: <20190904205558.27666-1-joahannes@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 05 Sep 2019 07:20:48 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: remove blank line after an
	open brace '{'.
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

Rml4IGNoZWNrcGF0Y2ggZXJyb3IKIkNIRUNLOiBCbGFuayBsaW5lcyBhcmVuJ3QgbmVjZXNzYXJ5
IGFmdGVyIGFuIG9wZW4gYnJhY2UgJ3snIgppbiBsb29wYmFja190ZXN0LmM6NzQyLgoKU2lnbmVk
LW9mZi1ieTogam9haGFubmVzIDxqb2FoYW5uZXNAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyB8IDEgLQogMSBmaWxlIGNoYW5nZWQs
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29s
cy9sb29wYmFja190ZXN0LmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFj
a190ZXN0LmMKaW5kZXggYmE2ZjkwNWYyLi4yNTFiMDU3MTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYworKysgYi9kcml2ZXJzL3N0YWdp
bmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMKQEAgLTczOSw3ICs3MzksNiBAQCBzdGF0
aWMgaW50IHdhaXRfZm9yX2NvbXBsZXRlKHN0cnVjdCBsb29wYmFja190ZXN0ICp0KQogCQl0cyA9
ICZ0LT5wb2xsX3RpbWVvdXQ7CiAKIAl3aGlsZSAoMSkgewotCiAJCXJldCA9IHBwb2xsKHQtPmZk
cywgdC0+cG9sbF9jb3VudCwgdHMsICZtYXNrX29sZCk7CiAJCWlmIChyZXQgPD0gMCkgewogCQkJ
c3RvcF90ZXN0cyh0KTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8v
Z3JleWJ1cy1kZXYK
