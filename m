Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9A331F6E
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:41:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5F73E6602A
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:41:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4E8BB66783; Tue,  9 Mar 2021 06:41:27 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B16F3667AD;
	Tue,  9 Mar 2021 06:39:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2F9DB66012
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:38 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 22E32665AA; Mon,  8 Mar 2021 14:55:38 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by lists.linaro.org (Postfix) with ESMTPS id 1E12B66012
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:36 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id lr13so20975454ejb.8
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dk38R2BEd68k0sRStLee7izJxfsp+PQHJm3HaMXnM6A=;
 b=NGk72IqInS9ism9mxFqYMtemzw5n2/sW4hpqtB2TEMnArGqTXEimRoL2eeiIox/DcF
 V3rXJUBKCmO5gC9vBD+OrRlMFq5gA84Tm+1QqjJt+XGE2KKxqZCa/Cr+p8KNFEDYjkiP
 /mo71jZJNRaNZyGTy9Jaz3EWmaOyfG5po6kYZMZKb4pEWxCUGzi4sHbQ1XTpRF+u7t7o
 4HiuRa/KXwSFa2dtwRwDRraULA7WxcL0MExRzQHgpHxoTIfw03sPrfUCiWKdChbuax0x
 2ODTA6u5FjtUrBfFNGzwep1lnYie/H70cr756QqcBYdQ8U3A5XowljUJNcUEKBCdiHuJ
 Xt4Q==
X-Gm-Message-State: AOAM533t9FLYQDtWEdDMgOj+P2BT9/xZvr6mYjx/e7UD/AlAOVZKM+Tq
 9Xv1TM9ENSHdtiCIh0cfIC5eOg==
X-Google-Smtp-Source: ABdhPJz1X+Yvv3Gf60Ux6dslZLHmcGo2s75ffNy+pTDMIK2LHvMuhKrswzHu65RuNVsJWclcjcnmIQ==
X-Received: by 2002:a17:906:7150:: with SMTP id
 z16mr15048608ejj.103.1615215335290; 
 Mon, 08 Mar 2021 06:55:35 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:34 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:59 +0200
Message-Id: <20210308145502.1075689-8-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 07/10] spi: spi-falcon: remove check for
	'delay_usecs'
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
bnNmZXIgc3RydWN0LgpUaGlzIGNoYW5nZSByZW1vdmVzIGl0IGZyb20gdGhlIFNQSSBGYWxjb24g
ZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFyZGVsZWFuIDxhYXJkZWxlYW5AZGV2
aXFvbi5jb20+Ci0tLQogZHJpdmVycy9zcGkvc3BpLWZhbGNvbi5jIHwgMiArLQogMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9zcGkvc3BpLWZhbGNvbi5jIGIvZHJpdmVycy9zcGkvc3BpLWZhbGNvbi5jCmluZGV4IGQzMzM2
YTYzZjQ2Mi4uYTdkNGRmZmFjNjZiIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktZmFsY29u
LmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLWZhbGNvbi5jCkBAIC0zNzcsNyArMzc3LDcgQEAgc3Rh
dGljIGludCBmYWxjb25fc2ZsYXNoX3hmZXJfb25lKHN0cnVjdCBzcGlfbWFzdGVyICptYXN0ZXIs
CiAKIAkJbS0+YWN0dWFsX2xlbmd0aCArPSB0LT5sZW47CiAKLQkJV0FSTl9PTih0LT5kZWxheV91
c2VjcyB8fCB0LT5kZWxheS52YWx1ZSB8fCB0LT5jc19jaGFuZ2UpOworCQlXQVJOX09OKHQtPmRl
bGF5LnZhbHVlIHx8IHQtPmNzX2NoYW5nZSk7CiAJCXNwaV9mbGFncyA9IDA7CiAJfQogCi0tIAoy
LjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdy
ZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBz
Oi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
