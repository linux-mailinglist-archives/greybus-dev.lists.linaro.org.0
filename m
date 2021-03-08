Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2271B331F65
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:40:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E2E16602A
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:40:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2EF7766783; Tue,  9 Mar 2021 06:40:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DAAC266799;
	Tue,  9 Mar 2021 06:39:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 3769F60631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:32 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 2AB09665E9; Mon,  8 Mar 2021 14:55:32 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by lists.linaro.org (Postfix) with ESMTPS id 3AB5760631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:29 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id p1so15156919edy.2
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K1kerxlBQXsnkBW66DYRSLvt3f+bVaEYRPTXorPAb2o=;
 b=anY/1Ot5bphbrKIslN77tm6mE7lgmqe08FnbK22/Oak1gpO1tN1UFQXkegMpj18ngd
 fzOX6JlV554CVmSXQ10LBGMf0nmZViqn26De2+5kabt+vKyZw7AJjGPm23BzAsIGe9BV
 x8C7tpQ57a2S7Bb+np5qMs88oE2q9R1QK8wtFWCPwE+Ul8S2cdEvlIs12By/hRtTLvz/
 uqd7XHoHXUfM8jodCzs+zvOkqexpmsnedAn/F9g7tRLEtRF71qApxg783oaUwGh4TgG7
 ixwzs7xe9peS0FaamP5RYDh3Yc0Nm/YeXyaKWMTFC0/WetrC3Ht+EFn1A+aOrQKmoXr+
 X78Q==
X-Gm-Message-State: AOAM5312S2KrToekxtw2VvF3MUglCj0Nulcav6pCu8MBFdOsx5/vIjy3
 lxkQXF/iJGAjMZodxDd+C07u9Q==
X-Google-Smtp-Source: ABdhPJxEzekHbaS2S5/KEJAyRUXUwCnOcpb8YwShTRdZxuCkPKC3qM7GvCvE1zMb6YSlbV7UXjYPrg==
X-Received: by 2002:a50:e0c3:: with SMTP id j3mr23091988edl.32.1615215328449; 
 Mon, 08 Mar 2021 06:55:28 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:28 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:54 +0200
Message-Id: <20210308145502.1075689-3-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 09 Mar 2021 06:39:38 +0000
Cc: thierry.reding@gmail.com, elder@kernel.org, johan@kernel.org,
 jonathanh@nvidia.com, broonie@kernel.org, ldewangan@nvidia.com,
 Alexandru Ardelean <aardelean@deviqon.com>, vireshk@kernel.org,
 f.fainelli@gmail.com, linux@deviqon.com
Subject: [greybus-dev] [PATCH 02/10] spi: bcm63xx-spi: don't check
	'delay_usecs' field
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

VGhlICdkZWxheV91c2VjcycgZmllbGQgd2FzIGhhbmRsZWQgZm9yIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5IGluIGNhc2UKdGhlcmUgd2VyZSBzb21lIHVzZXJzIHRoYXQgc3RpbGwgY29uZmlndXJl
ZCBTUEkgZGVsYXkgdHJhbnNmZXJzIHdpdGgKdGhpcyBmaWVsZC4KClRoZXkgc2hvdWxkIGFsbCBi
ZSByZW1vdmVkIGJ5IG5vdy4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWFy
ZGVsZWFuQGRldmlxb24uY29tPgotLS0KIGRyaXZlcnMvc3BpL3NwaS1iY202M3h4LmMgfCAyICst
CiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3NwaS9zcGktYmNtNjN4eC5jIGIvZHJpdmVycy9zcGkvc3BpLWJjbTYzeHgu
YwppbmRleCBkMDhiYjc2MDAxNTAuLjgwZmEwZWY4OTA5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
cGkvc3BpLWJjbTYzeHguYworKysgYi9kcml2ZXJzL3NwaS9zcGktYmNtNjN4eC5jCkBAIC0zNjks
NyArMzY5LDcgQEAgc3RhdGljIGludCBiY202M3h4X3NwaV90cmFuc2Zlcl9vbmUoc3RydWN0IHNw
aV9tYXN0ZXIgKm1hc3RlciwKIAkJfQogCiAJCS8qIENTIHdpbGwgYmUgZGVhc3NlcnRlZCBkaXJl
Y3RseSBhZnRlciB0cmFuc2ZlciAqLwotCQlpZiAodC0+ZGVsYXlfdXNlY3MgfHwgdC0+ZGVsYXku
dmFsdWUpIHsKKwkJaWYgKHQtPmRlbGF5LnZhbHVlKSB7CiAJCQlkZXZfZXJyKCZzcGktPmRldiwg
InVuYWJsZSB0byBrZWVwIENTIGFzc2VydGVkIGFmdGVyIHRyYW5zZmVyXG4iKTsKIAkJCXN0YXR1
cyA9IC1FSU5WQUw7CiAJCQlnb3RvIGV4aXQ7Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApn
cmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
