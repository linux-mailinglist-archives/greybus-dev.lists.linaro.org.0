Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id AFF2D331F66
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:40:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3F686602A
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:40:31 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C117166783; Tue,  9 Mar 2021 06:40:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 50BCE6679D;
	Tue,  9 Mar 2021 06:39:40 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 9FDB660631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 8EE04665AA; Mon,  8 Mar 2021 14:55:33 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by lists.linaro.org (Postfix) with ESMTPS id 94D7A66596
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:30 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id c10so20898739ejx.9
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mBNx3+l+qHDe6EkshwxnUvUhVuyIuR48vB6z54Joki8=;
 b=ZYZk9v/V800cfA9wmRossf1fZFy7kmp3TudosgdlSzaKvIqheE/B3co4Uzl9ZGEEoZ
 5B5uYsqB9/JzlZADC8eaaNQBtU7gYgGjNAI1mE3vGziWjvDVRAuTkFDk11wd+hZpCX4W
 5sHUVVw3Sc5fx5SDkZXbH3QkHG8VIKGFpWfYTyykIB53l4PHNLLckJZL2dIA+LwCAcie
 Fd+cV3lAZYtGNsTkdv9NAaqLgqoVMi8WB2LQg+NRe58Oc05EY6beU6vqn6ZtAxdDjbxx
 jYnJ8WUMQ7BXMynarrwry4HZnLIpEAa93wwy4/5CS113KM2pVNqHuAPPsG09i77Rdk2e
 g48Q==
X-Gm-Message-State: AOAM530oJdvl76BVxPVtW9ZKPVs31muio63FdXAz0cnVkLUpKuEVfEW6
 gjfluG1ymBURSzQoOtiQXWP8DQ==
X-Google-Smtp-Source: ABdhPJy3dzNItArKPc94hDqlK8aS8fNX1eICojTsHibEp0xBvophfesscwVwUCVlgWvMxvrYa/+PPw==
X-Received: by 2002:a17:906:7102:: with SMTP id
 x2mr15619326ejj.355.1615215329786; 
 Mon, 08 Mar 2021 06:55:29 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:29 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:55 +0200
Message-Id: <20210308145502.1075689-4-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 03/10] spi: spi-bcm-qspi: replace
	'delay_usecs' with 'delay.value' check
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

VGhlICdkZWxheV91c2VjcycgZmllbGQgaXMgZ29pbmcgYXdheS4gVGhlIHJlcGxhY2VtZW50IGZv
ciBpdCBpcyB0aGUKJ2RlbGF5JyBmaWVsZC4gU28sIHdlIHNob3VsZCBjaGVjayBmb3IgJ2RlbGF5
LnZhbHVlJyBiZWluZyBub24temVyby4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVh
biA8YWFyZGVsZWFuQGRldmlxb24uY29tPgotLS0KIGRyaXZlcnMvc3BpL3NwaS1iY20tcXNwaS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLWJjbS1xc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGkt
YmNtLXFzcGkuYwppbmRleCA3MDdmZTNhNWQ4ZWYuLmE3OGU1NmY1NjZkZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9zcGkvc3BpLWJjbS1xc3BpLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWJjbS1xc3Bp
LmMKQEAgLTY3MSw3ICs2NzEsNyBAQCBzdGF0aWMgaW50IHVwZGF0ZV9xc3BpX3RyYW5zX2J5dGVf
Y291bnQoc3RydWN0IGJjbV9xc3BpICpxc3BpLAogCWlmIChxdC0+Ynl0ZSA+PSBxdC0+dHJhbnMt
PmxlbikgewogCQkvKiB3ZSdyZSBhdCB0aGUgZW5kIG9mIHRoZSBzcGlfdHJhbnNmZXIgKi8KIAkJ
LyogaW4gVFggbW9kZSwgbmVlZCB0byBwYXVzZSBmb3IgYSBkZWxheSBvciBDUyBjaGFuZ2UgKi8K
LQkJaWYgKHF0LT50cmFucy0+ZGVsYXlfdXNlY3MgJiYKKwkJaWYgKHF0LT50cmFucy0+ZGVsYXku
dmFsdWUgJiYKIAkJICAgIChmbGFncyAmIFRSQU5TX1NUQVRVU19CUkVBS19ERUxBWSkpCiAJCQly
ZXQgfD0gVFJBTlNfU1RBVFVTX0JSRUFLX0RFTEFZOwogCQlpZiAocXQtPnRyYW5zLT5jc19jaGFu
Z2UgJiYKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFy
by5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1k
ZXYK
