Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D8A3322762
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Feb 2021 10:02:05 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4BF33615AF
	for <lists+greybus-dev@lfdr.de>; Tue, 23 Feb 2021 09:02:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3E39660F06; Tue, 23 Feb 2021 09:02:04 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 33F1060F06;
	Tue, 23 Feb 2021 09:01:33 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2C8C46677E
 for <greybus-dev@lists.linaro.org>; Fri, 19 Feb 2021 14:46:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1C50666780; Fri, 19 Feb 2021 14:46:13 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
 by lists.linaro.org (Postfix) with ESMTPS id 46F346677E
 for <greybus-dev@lists.linaro.org>; Fri, 19 Feb 2021 14:46:12 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id t2so4290643pjq.2
 for <greybus-dev@lists.linaro.org>; Fri, 19 Feb 2021 06:46:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=slTXshU8vidGGVMSxD6AxHpQCaGZpeJQ08PMj6GSx14=;
 b=G/qFeaMZ90ZSiDPxcAQIk+/V4zCHK1kFdUeS2xUGg7fkKrsN6V1Sj3UO+9GZRwStPI
 nekStzo2QXJnUn+lePdGGmB1es/YaqsDdxZxqasBGZuB1mDVGqdps2u+xgQjgogOOD81
 ZjT968gAiV9Pk9GLXBtFt1MkEi8XGZhgZqPkyrRA2Qu2A9g/6LrsiMFa5QSI8Wx0Z+uw
 zhz3/KzWrcABbmfvKQonaZjuEPEhUyF4kcxOd8OcaYBAz5cwDKWcMvXaiLpdo4AKVmWQ
 XFNedz6oAnB0xpWukfi2O3rSS9g1qsPEUpoq8J1jlJSmyx763cIyhKiuJ/MgKDWeukC0
 tjvA==
X-Gm-Message-State: AOAM5326J+KdSx/P4K+DxMJq5aZHEPONI2mXYnlMXoOaNO/pVGt5uOgw
 26nG7xNRIu9dtttTuyGz3AI=
X-Google-Smtp-Source: ABdhPJyqHMbC6dTR+BB6SR6heG0MwTmAa5lseJ80Z8WddGX3n6NsiVuKO/5qiPoAnmthmOTWLND8Pw==
X-Received: by 2002:a17:90a:2a4e:: with SMTP id
 d14mr9797342pjg.36.1613745971421; 
 Fri, 19 Feb 2021 06:46:11 -0800 (PST)
Received: from localhost.localdomain ([49.36.144.93])
 by smtp.gmail.com with ESMTPSA id k13sm10457329pfg.146.2021.02.19.06.46.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:10 -0800 (PST)
From: Amrit Khera <amritkhera98@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Fri, 19 Feb 2021 20:12:31 +0530
Message-Id: <20210219144230.32055-1-amritkhera98@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 23 Feb 2021 09:01:31 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Amrit Khera <amritkhera98@gmail.com>, linux-kernel@vger.kernel.org
Subject: [greybus-dev] [PATCH] staging: greybus: Fix blank line style issue
	in sdio.c
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

VGhpcyBjaGFuZ2UgZml4ZXMgYSBjaGVja3BhdGNoIGNoZWNrIGZvciAiUGxlYXNlIGRvbid0IHVz
ZQptdWx0aXBsZSBibGFuayBsaW5lcyIuCgpTaWduZWQtb2ZmLWJ5OiBBbXJpdCBLaGVyYSA8YW1y
aXRraGVyYTk4QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9zZGlvLmMg
fCAxIC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zdGFnaW5nL2dyZXlidXMvc2Rpby5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc2Rpby5j
CmluZGV4IDA5MzlmNGE0Yzk2My4uMzdiZjA0YzIyZGJjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0
YWdpbmcvZ3JleWJ1cy9zZGlvLmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvc2Rpby5j
CkBAIC0zMyw3ICszMyw2IEBAIHN0cnVjdCBnYl9zZGlvX2hvc3QgewogCWJvb2wJCQlyZWFkX29u
bHk7CiB9OwogCi0KICNkZWZpbmUgR0JfU0RJT19SU1BfUjFfUjVfUjZfUjcJKEdCX1NESU9fUlNQ
X1BSRVNFTlQgfCBHQl9TRElPX1JTUF9DUkMgfCBcCiAJCQkJIEdCX1NESU9fUlNQX09QQ09ERSkK
ICNkZWZpbmUgR0JfU0RJT19SU1BfUjNfUjQJKEdCX1NESU9fUlNQX1BSRVNFTlQpCi0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
