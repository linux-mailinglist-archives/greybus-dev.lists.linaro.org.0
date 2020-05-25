Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 077391E1D00
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:13:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 19DA0614FE
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:13:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0C0A361943; Tue, 26 May 2020 08:13:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DE37265FA2;
	Tue, 26 May 2020 08:11:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 18031618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:16 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 058AE61943; Mon, 25 May 2020 18:26:16 +0000 (UTC)
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by lists.linaro.org (Postfix) with ESMTPS id B880F618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:14 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id nr22so4984713ejb.6
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 11:26:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cTkeVh1JeKZCZ25CUvY4TadYKZCO3Tcb6SZa4hMT8IQ=;
 b=TMo8FEfQw5cg7PSV/RIeiiqQhuFxgDimdIuTP2Ts7es/ZG9ipoxTSknLkOfLq55LAo
 Ud62lCSO4l1q/0R7sUKT3dijEasZttf/VMqz6t++dOM0/4GgM+y8qRoGZPHL0jTH0RNY
 +npXDrgtPXfbWSOCX6d74Id5oijWbkedqheu4sDXv6CDIDu15YM0OrbRNvkNTXxOnNfU
 XKcxN7L7qu01MxJTATIlqCGsPLCZNlQ3UtXdntxnjzg880uLiketQIAmIHN34dK6GBMg
 Y19xjAMqGut2Ry2eVI6AoRyQwneU3o+QZvvVxRmzRYX660BAtnXfkFSFlO7Ir8lI8P1T
 TSLA==
X-Gm-Message-State: AOAM533uqcA6ZG8H2mEGnlmKzBl2tQ9sGNABSIqiFpqTWEfVjVRUzNMa
 jmcxOpNdjKAilXJNY8c7UQ8=
X-Google-Smtp-Source: ABdhPJwJ72EePelVfvR4GiaP04Cb7Af4MA+NTBXjPW6AogUELMABp0aGx0/LBvMTHK50C97aqq0rIg==
X-Received: by 2002:a17:906:ae93:: with SMTP id
 md19mr19856282ejb.4.1590431173903; 
 Mon, 25 May 2020 11:26:13 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n15sm15555707ejs.10.2020.05.25.11.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 11:26:13 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 May 2020 18:26:02 +0000
Message-Id: <20200525182608.1823735-3-kw@linux.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200525182608.1823735-1-kw@linux.com>
References: <20200525182608.1823735-1-kw@linux.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 26 May 2020 08:10:58 +0000
Cc: Ulf Hansson <ulf.hansson@linaro.org>, linux-pci@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Pavel Machek <pavel@ucw.cz>,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 Kevin Hilman <khilman@kernel.org>, Julian Wiedmann <jwi@linux.ibm.com>,
 linux-acpi@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 Ursula Braun <ubraun@linux.ibm.com>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, John Stultz <john.stultz@linaro.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Felipe Balbi <balbi@kernel.org>,
 Alex Elder <elder@kernel.org>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-usb@vger.kernel.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Karsten Graul <kgraul@linux.ibm.com>,
 netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Subject: [greybus-dev] [PATCH 2/8] ACPI: PM: Use the new device_to_pm()
	helper to access struct dev_pm_ops
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

VXNlIHRoZSBuZXcgZGV2aWNlX3RvX3BtKCkgaGVscGVyIHRvIGFjY2VzcyBQb3dlciBNYW5hZ2Vt
ZW50IGNhbGxiYWNzCihzdHJ1Y3QgZGV2X3BtX29wcykgZm9yIGEgcGFydGljdWxhciBkZXZpY2Ug
KHN0cnVjdCBkZXZpY2VfZHJpdmVyKS4KCk5vIGZ1bmN0aW9uYWwgY2hhbmdlIGludGVuZGVkLgoK
U2lnbmVkLW9mZi1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+Ci0tLQog
ZHJpdmVycy9hY3BpL2RldmljZV9wbS5jIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5z
ZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2FjcGkvZGV2
aWNlX3BtLmMgYi9kcml2ZXJzL2FjcGkvZGV2aWNlX3BtLmMKaW5kZXggNTgzMmJjMTBhY2E4Li5i
OThhMzJjNDhmYmUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvYWNwaS9kZXZpY2VfcG0uYworKysgYi9k
cml2ZXJzL2FjcGkvZGV2aWNlX3BtLmMKQEAgLTEwMjIsOSArMTAyMiwxMCBAQCBzdGF0aWMgYm9v
bCBhY3BpX2Rldl9uZWVkc19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgYWNwaV9k
ZXZpY2UgKmFkZXYpCiBpbnQgYWNwaV9zdWJzeXNfcHJlcGFyZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiB7CiAJc3RydWN0IGFjcGlfZGV2aWNlICphZGV2ID0gQUNQSV9DT01QQU5JT04oZGV2KTsKKwlj
b25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0gPSBkcml2ZXJfdG9fcG0oZGV2LT5kcml2ZXIpOwog
Ci0JaWYgKGRldi0+ZHJpdmVyICYmIGRldi0+ZHJpdmVyLT5wbSAmJiBkZXYtPmRyaXZlci0+cG0t
PnByZXBhcmUpIHsKLQkJaW50IHJldCA9IGRldi0+ZHJpdmVyLT5wbS0+cHJlcGFyZShkZXYpOwor
CWlmIChwbSAmJiBwbS0+cHJlcGFyZSkgeworCQlpbnQgcmV0ID0gcG0tPnByZXBhcmUoZGV2KTsK
IAogCQlpZiAocmV0IDwgMCkKIAkJCXJldHVybiByZXQ7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
