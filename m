Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCC43187A8
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 11:03:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 144AC60FF9
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 10:03:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0902A66034; Thu, 11 Feb 2021 10:03:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BCBD5666DC;
	Thu, 11 Feb 2021 10:03:34 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BF45566034
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 09:54:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id A681C666DC; Thu, 11 Feb 2021 09:54:52 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by lists.linaro.org (Postfix) with ESMTPS id 3629066034
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 09:54:51 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id e9so3104258pjj.0
 for <greybus-dev@lists.linaro.org>; Thu, 11 Feb 2021 01:54:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wcz3AQJyepgs6E3Mhy+qpeJeGUBWMUKWfxuRMoRrU+I=;
 b=rOF3NQoi9chbIUFVrcIuB7w0UovEJLYk3MnMTndt+DQ2oAMu9Bsi5Br2VPoX4FVpe1
 WbVEUy83wRiU/eBkUD6qI9GIOWztWfo6nhXSqzzMQ7wQ9V9dv+Lh1d8v4F/HU/NitWW/
 qBvyT9HUWp8GkbhGN/uQezxnEpWKjIuvYKGrZdnSs5SdECPXvs+Gy9QTBj6mKF9t+shi
 IhjO5l9XW0DZ4BYtOAsqDG2eXiD0gBA886jWDS1jQVM1srzxoxuodZXHk92GxzZ0sGlQ
 zTmhXp7URjbeVrNlCvpDie/S90GNi7XIpjawgRQD2TuSJCWdx8xBTUaxjT1sHmCkcEFf
 Q3MA==
X-Gm-Message-State: AOAM5305tM7K9QsAKZtyBLYH9GfX/vGpASgZeq1lKrp3oiz8JGB/Kexa
 LtoAOl/GTgVLoxMG3ckIe+4=
X-Google-Smtp-Source: ABdhPJwV1rcv6wGkjVZ8flLv4pmrLtBs1E2FL3ApE5mLK8efWmbyclpYoAXRUjxrJdjzDcqHGzwx8A==
X-Received: by 2002:a17:902:8c8f:b029:e0:1663:fd34 with SMTP id
 t15-20020a1709028c8fb02900e01663fd34mr6901568plo.84.1613037290390; 
 Thu, 11 Feb 2021 01:54:50 -0800 (PST)
Received: from localhost.localdomain ([27.5.41.215])
 by smtp.gmail.com with ESMTPSA id y24sm4959382pfr.152.2021.02.11.01.54.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Feb 2021 01:54:50 -0800 (PST)
From: Hemansh Agnihotri <hemanshagnihotri27@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu, 11 Feb 2021 15:24:44 +0530
Message-Id: <20210211095444.54447-1-hemanshagnihotri27@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Feb 2021 10:03:33 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH 1/1] staging: greybus: Added do - while in
	multi statement macro
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

VGhpcyBwYXRjaCBhZGQgZml4ZXMgYW4gY2hlY2twYXRjaCBlcnJvciBmb3IgIk1hY3JvcyB3aXRo
IG11bHRpcGxlIHN0YXRlbWVudHMKc2hvdWxkIGJlIGVuY2xvc2VkIGluIGEgZG8gLSB3aGlsZSBs
b29wIgoKU2lnbmVkLW9mZi1ieTogSGVtYW5zaCBBZ25paG90cmkgPGhlbWFuc2hhZ25paG90cmky
N0BnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYyB8IDUg
KysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMKaW5kZXggMjQ3MTQ0OGJhNDJhLi42ZGQ5NWQ2NDg5
OTkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMKKysrIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYwpAQCAtMTYyLDEwICsxNjIsMTEgQEAg
c3RhdGljIHNzaXplX3QgbmFtZSMjX2F2Z19zaG93KHN0cnVjdCBkZXZpY2UgKmRldiwJCVwKIH0J
CQkJCQkJCQlcCiBzdGF0aWMgREVWSUNFX0FUVFJfUk8obmFtZSMjX2F2ZykKIAotI2RlZmluZSBn
Yl9sb29wYmFja19zdGF0c19hdHRycyhmaWVsZCkJCQkJXAorI2RlZmluZSBnYl9sb29wYmFja19z
dGF0c19hdHRycyhmaWVsZCkgZG8geyBcCiAJZ2JfbG9vcGJhY2tfcm9fc3RhdHNfYXR0cihmaWVs
ZCwgbWluLCB1KTsJCVwKIAlnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZpZWxkLCBtYXgsIHUp
OwkJXAotCWdiX2xvb3BiYWNrX3JvX2F2Z19hdHRyKGZpZWxkKQorCWdiX2xvb3BiYWNrX3JvX2F2
Z19hdHRyKGZpZWxkKTsJCQkJXAorCX0gd2hpbGUgKDApCiAKICNkZWZpbmUgZ2JfbG9vcGJhY2tf
YXR0cihmaWVsZCwgdHlwZSkJCQkJCVwKIHN0YXRpYyBzc2l6ZV90IGZpZWxkIyNfc2hvdyhzdHJ1
Y3QgZGV2aWNlICpkZXYsCQkJCVwKLS0gCjIuMzAuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
