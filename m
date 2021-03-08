Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 835E1331F6F
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:41:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A03776602A
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:41:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 8C0A766793; Tue,  9 Mar 2021 06:41:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ED183667B2;
	Tue,  9 Mar 2021 06:39:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DB4B4618B9
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:39 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C7E1366596; Mon,  8 Mar 2021 14:55:39 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by lists.linaro.org (Postfix) with ESMTPS id 61989618B9
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:37 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id v13so15119403edw.9
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=urYLQtVdnzA+q/DonKHBr+50GGSu7EQTj+TBy7g6Q9o=;
 b=pQmHNsP+p7/wADWJ7HHFqOantEM0Un8Rf99he7CVS/CYDq79tJzLL7Pp8eYjh2yTen
 VOYKcb7xMLASOLHnuqeP1Ggzpy6YsiIr+HXvea7weDzE2SYTupGk2DM98r76QUm76DTB
 RWisB1Js523lB9vOWHTRnBsO7o8hNTvNo0R7SKqslGD57ao0plaVt0BwhRwQLH5IpT9s
 4ijaISpc+4C5/sO2rfNdDE3eg8f7JpQ1dGiehVJv88N/YtGbPaMa3ZxBXmiWlAaftpTL
 gKmhhncAWbWNcHWAHPwUnxzVAYZXORTkq0WnA91EhPilF3GA/vvI2gHuhbRcltX3AUgS
 NtOA==
X-Gm-Message-State: AOAM532F4ANmntXV5gb2gqVNkXs1u3wy+cV+G+1M/12NqTb4HbrdfgTB
 6ps0kzaWXj9YKQ7Z+wMoB4cUag==
X-Google-Smtp-Source: ABdhPJxe0zyWH76y8kItEqXgvETT7TZ6JKNT1e22wQhgFUZx5RbGpKr9TzsZbEKqFDYgqLwPaYGILg==
X-Received: by 2002:aa7:c94c:: with SMTP id h12mr22840108edt.40.1615215336605; 
 Mon, 08 Mar 2021 06:55:36 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:36 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:55:00 +0200
Message-Id: <20210308145502.1075689-9-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 08/10] spi: fsl-espi: remove usage of
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

VGhlICdkZWxheV91c2VjcycgZmllbGQgaXMgYmVpbmcgcmVtb3ZlZCBmcm9tIHRoZSBzcGlfdHJh
bnNmZXIgc3RydWN0LgpUaGlzIGNoYW5nZSByZW1vdmVzIGl0IGZyb20gdGhlIFNQSSBGU0wgRVNQ
SSBkcml2ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcnUgQXJkZWxlYW4gPGFhcmRlbGVhbkBk
ZXZpcW9uLmNvbT4KLS0tCiBkcml2ZXJzL3NwaS9zcGktZnNsLWVzcGkuYyB8IDE3ICsrKysrLS0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktZnNsLWVzcGkuYyBiL2RyaXZlcnMvc3Bp
L3NwaS1mc2wtZXNwaS5jCmluZGV4IGNmMmI5NDdjNjAwZS4uZjcwNjZiZWY3YjA2IDEwMDY0NAot
LS0gYS9kcml2ZXJzL3NwaS9zcGktZnNsLWVzcGkuYworKysgYi9kcml2ZXJzL3NwaS9zcGktZnNs
LWVzcGkuYwpAQCAtNDM1LDggKzQzNSw3IEBAIHN0YXRpYyBpbnQgZnNsX2VzcGlfdHJhbnMoc3Ry
dWN0IHNwaV9tZXNzYWdlICptLCBzdHJ1Y3Qgc3BpX3RyYW5zZmVyICp0cmFucykKIHN0YXRpYyBp
bnQgZnNsX2VzcGlfZG9fb25lX21zZyhzdHJ1Y3Qgc3BpX21hc3RlciAqbWFzdGVyLAogCQkJICAg
ICAgIHN0cnVjdCBzcGlfbWVzc2FnZSAqbSkKIHsKLQl1bnNpZ25lZCBpbnQgZGVsYXlfdXNlY3Mg
PSAwLCByeF9uYml0cyA9IDA7Ci0JdW5zaWduZWQgaW50IGRlbGF5X25zZWNzID0gMCwgZGVsYXlf
bnNlY3MxID0gMDsKKwl1bnNpZ25lZCBpbnQgcnhfbmJpdHMgPSAwLCBkZWxheV9uc2VjcyA9IDA7
CiAJc3RydWN0IHNwaV90cmFuc2ZlciAqdCwgdHJhbnMgPSB7fTsKIAlpbnQgcmV0OwogCkBAIC00
NDUsMTYgKzQ0NCwxMCBAQCBzdGF0aWMgaW50IGZzbF9lc3BpX2RvX29uZV9tc2coc3RydWN0IHNw
aV9tYXN0ZXIgKm1hc3RlciwKIAkJZ290byBvdXQ7CiAKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KHQs
ICZtLT50cmFuc2ZlcnMsIHRyYW5zZmVyX2xpc3QpIHsKLQkJaWYgKHQtPmRlbGF5X3VzZWNzKSB7
Ci0JCQlpZiAodC0+ZGVsYXlfdXNlY3MgPiBkZWxheV91c2VjcykgewotCQkJCWRlbGF5X3VzZWNz
ID0gdC0+ZGVsYXlfdXNlY3M7Ci0JCQkJZGVsYXlfbnNlY3MgPSBkZWxheV91c2VjcyAqIDEwMDA7
Ci0JCQl9Ci0JCX0gZWxzZSB7Ci0JCQlkZWxheV9uc2VjczEgPSBzcGlfZGVsYXlfdG9fbnMoJnQt
PmRlbGF5LCB0KTsKLQkJCWlmIChkZWxheV9uc2VjczEgPiBkZWxheV9uc2VjcykKLQkJCQlkZWxh
eV9uc2VjcyA9IGRlbGF5X25zZWNzMTsKLQkJfQorCQl1bnNpZ25lZCBpbnQgZGVsYXkgPSBzcGlf
ZGVsYXlfdG9fbnMoJnQtPmRlbGF5LCB0KTsKKworCQlpZiAoZGVsYXkgPiBkZWxheV9uc2VjcykK
KwkJCWRlbGF5X25zZWNzID0gZGVsYXk7CiAJCWlmICh0LT5yeF9uYml0cyA+IHJ4X25iaXRzKQog
CQkJcnhfbmJpdHMgPSB0LT5yeF9uYml0czsKIAl9Ci0tIAoyLjI5LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlz
dApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
