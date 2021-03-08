Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3910E331F6A
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:41:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61FC266793
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:41:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 4F69E6602A; Tue,  9 Mar 2021 06:41:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 55CF8667A5;
	Tue,  9 Mar 2021 06:39:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6654466012
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 59BA6665AA; Mon,  8 Mar 2021 14:55:35 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com
 [209.85.208.43])
 by lists.linaro.org (Postfix) with ESMTPS id 4541166012
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:33 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id d13so15192242edp.4
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XWoEzbGml88OxuqmQAcHOjUJ4xDFJxJMYhsbSvaYG8g=;
 b=oOJ23x2SWyuXnrlCgsFJBksdV6Kp3kvW7DKyrVD6zM7V7c5g6KViRWu9sNrDzKRWlz
 zTThuHP9pli20VZ7Yi3rOug6QnnwdM/H+QydXuLzDimTyHRAfB1jUPIkq9TCFtm5VbCE
 tHTGeFlEDqO1FWqt+OFkvmlmqp2iQyO0qE+iNoiqeCCOY0Zs2rspqlP6UBN3E64bArQ8
 BuuBk4/L/++sMlbe+5V/tA8U6CDfzLXNJoA2cQYaf3AUcUlsoCDohAZbbn5gswcSRREo
 uLq+eMXio5C58RQ9zBdssTtTugYuzS106lICp8QsktW7X5RKAgo5SKep1XESMlBD+lWK
 yH9w==
X-Gm-Message-State: AOAM532kFkLI5yzr9hT1Ph+pZlVjaE7bVEJJ9NkMZoEUE4BK7Cj32P/d
 wtbUwP5RDMrPhTl+uFS0vQnL1Q==
X-Google-Smtp-Source: ABdhPJwUcJ3SUmtLrEEaeqoD1Jfg434VvxyQqtPpgiiJeOCIL6JkqcZQQAQ8evRVIMOkpgIhXEKA1w==
X-Received: by 2002:aa7:c1d5:: with SMTP id d21mr21943395edp.167.1615215332510; 
 Mon, 08 Mar 2021 06:55:32 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:32 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:57 +0200
Message-Id: <20210308145502.1075689-6-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 05/10] spi: spi-tegra20-flash: don't check
	'delay_usecs' field for spi transfer
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
ZSByZW1vdmVkIGJ5IG5vdy4gU28gd2UgY2FuIHJlbW92ZSB0aGUgJ2RlbGF5X3VzZWNzJwpoYW5k
bGluZyBpbiB0aGlzIGRyaXZlci4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8
YWFyZGVsZWFuQGRldmlxb24uY29tPgotLS0KIGRyaXZlcnMvc3BpL3NwaS10ZWdyYTIwLXNmbGFz
aC5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3NwaS9zcGktdGVncmEyMC1zZmxhc2guYyBiL2RyaXZl
cnMvc3BpL3NwaS10ZWdyYTIwLXNmbGFzaC5jCmluZGV4IGNmYjdkZTczNzkzNy4uMjg4OGQ4YThk
YzZkIDEwMDY0NAotLS0gYS9kcml2ZXJzL3NwaS9zcGktdGVncmEyMC1zZmxhc2guYworKysgYi9k
cml2ZXJzL3NwaS9zcGktdGVncmEyMC1zZmxhc2guYwpAQCAtMzQxLDggKzM0MSw3IEBAIHN0YXRp
YyBpbnQgdGVncmFfc2ZsYXNoX3RyYW5zZmVyX29uZV9tZXNzYWdlKHN0cnVjdCBzcGlfbWFzdGVy
ICptYXN0ZXIsCiAJCQlnb3RvIGV4aXQ7CiAJCX0KIAkJbXNnLT5hY3R1YWxfbGVuZ3RoICs9IHhm
ZXItPmxlbjsKLQkJaWYgKHhmZXItPmNzX2NoYW5nZSAmJgotCQkgICAgKHhmZXItPmRlbGF5X3Vz
ZWNzIHx8IHhmZXItPmRlbGF5LnZhbHVlKSkgeworCQlpZiAoeGZlci0+Y3NfY2hhbmdlICYmIHhm
ZXItPmRlbGF5LnZhbHVlKSB7CiAJCQl0ZWdyYV9zZmxhc2hfd3JpdGVsKHRzZCwgdHNkLT5kZWZf
Y29tbWFuZF9yZWcsCiAJCQkJCVNQSV9DT01NQU5EKTsKIAkJCXNwaV90cmFuc2Zlcl9kZWxheV9l
eGVjKHhmZXIpOwotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5
YnVzLWRldgo=
