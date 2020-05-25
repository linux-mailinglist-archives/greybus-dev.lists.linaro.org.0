Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B921E1D05
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:14:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D402A614FE
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:14:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C70C761734; Tue, 26 May 2020 08:14:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1184165FAF;
	Tue, 26 May 2020 08:11:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id DDC7265F7F
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:24 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D0E7B65F80; Mon, 25 May 2020 18:26:24 +0000 (UTC)
Received: from mail-ed1-f67.google.com (mail-ed1-f67.google.com
 [209.85.208.67])
 by lists.linaro.org (Postfix) with ESMTPS id 8BAB3619D0
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:19 +0000 (UTC)
Received: by mail-ed1-f67.google.com with SMTP id e10so15721903edq.0
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 11:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0zGvHrt9YYoiSjZrnFb35ZKjC/21ugPMkpe0HjhFbIE=;
 b=KyKUtAl2nzborCsk/sm2VONa5gueK0GcHpbpjwCr7ge4WZbXLvk/bBgYcRKCGbIwrQ
 odU73zZM8VIeWjvIvYPUYYSLRoUEWfXss/XAXKzDQF2ngcOQKG+PWH/9q2DhpwuRVjy2
 K8Mqca8yVK6NRL0BksLsEZ5+95tC7I4s40ALwH6jL2FUecFi815c8z6oNB3vsFInniYg
 l/bi8Jng8tsOGZ0nVYyR2bplkW1mZJNIESVoQwOaMcWESZzapO9qQ+E2nypz6EtwpZHf
 pzlH66zbReiYoILzTWmBa6+vcAC9/fTYmu+Tldmi6p7ce2ChJPP56C2jTLS+duAB8UAy
 M8Cw==
X-Gm-Message-State: AOAM5326fIUNUfCiRWm5wId2Hsw/SaWej98UwjzpXR2KYq53bdbFh8aX
 TmXsIOGZUC8JnVzSjPH8do4=
X-Google-Smtp-Source: ABdhPJxu8xj7ETus6I8qz75XV9UcGoEOmg3ZGJLGe0YSg2hAMRNpcfMS5lnkyWZC+sphielpDh7PsA==
X-Received: by 2002:a05:6402:948:: with SMTP id
 h8mr15890575edz.127.1590431178687; 
 Mon, 25 May 2020 11:26:18 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n15sm15555707ejs.10.2020.05.25.11.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 11:26:18 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 May 2020 18:26:05 +0000
Message-Id: <20200525182608.1823735-6-kw@linux.com>
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
Subject: [greybus-dev] [PATCH 5/8] usb: phy: fsl: Use the new device_to_pm()
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
ZHJpdmVycy91c2IvcGh5L3BoeS1mc2wtdXNiLmMgfCAxMSArKysrKysrLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL3VzYi9waHkvcGh5LWZzbC11c2IuYyBiL2RyaXZlcnMvdXNiL3BoeS9waHktZnNsLXVzYi5j
CmluZGV4IGI0NTFmNDY5NWYzZi4uM2I5YWQ1ZGI4MzgwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3Vz
Yi9waHkvcGh5LWZzbC11c2IuYworKysgYi9kcml2ZXJzL3VzYi9waHkvcGh5LWZzbC11c2IuYwpA
QCAtNDYwLDYgKzQ2MCw3IEBAIGludCBmc2xfb3RnX3N0YXJ0X2hvc3Qoc3RydWN0IG90Z19mc20g
KmZzbSwgaW50IG9uKQogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgZnNsX290ZyAqb3Rn
X2RldiA9CiAJCWNvbnRhaW5lcl9vZihvdGctPnVzYl9waHksIHN0cnVjdCBmc2xfb3RnLCBwaHkp
OworCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbTsKIAl1MzIgcmV0dmFsID0gMDsKIAogCWlm
ICghb3RnLT5ob3N0KQpAQCAtNDc5LDggKzQ4MCw5IEBAIGludCBmc2xfb3RnX3N0YXJ0X2hvc3Qo
c3RydWN0IG90Z19mc20gKmZzbSwgaW50IG9uKQogCQllbHNlIHsKIAkJCW90Z19yZXNldF9jb250
cm9sbGVyKCk7CiAJCQlWREJHKCJob3N0IG9uLi4uLi4uXG4iKTsKLQkJCWlmIChkZXYtPmRyaXZl
ci0+cG0gJiYgZGV2LT5kcml2ZXItPnBtLT5yZXN1bWUpIHsKLQkJCQlyZXR2YWwgPSBkZXYtPmRy
aXZlci0+cG0tPnJlc3VtZShkZXYpOworCQkJcG0gPSBkcml2ZXJfdG9fcG0oZGV2LT5kcml2ZXIp
OworCQkJaWYgKHBtICYmIHBtLT5yZXN1bWUpIHsKKwkJCQlyZXR2YWwgPSBwbS0+cmVzdW1lKGRl
dik7CiAJCQkJaWYgKGZzbS0+aWQpIHsKIAkJCQkJLyogZGVmYXVsdC1iICovCiAJCQkJCWZzbF9v
dGdfZHJ2X3ZidXMoZnNtLCAxKTsKQEAgLTUwNCw4ICs1MDYsOSBAQCBpbnQgZnNsX290Z19zdGFy
dF9ob3N0KHN0cnVjdCBvdGdfZnNtICpmc20sIGludCBvbikKIAkJZWxzZSB7CiAJCQlWREJHKCJo
b3N0IG9mZi4uLi4uLlxuIik7CiAJCQlpZiAoZGV2ICYmIGRldi0+ZHJpdmVyKSB7Ci0JCQkJaWYg
KGRldi0+ZHJpdmVyLT5wbSAmJiBkZXYtPmRyaXZlci0+cG0tPnN1c3BlbmQpCi0JCQkJCXJldHZh
bCA9IGRldi0+ZHJpdmVyLT5wbS0+c3VzcGVuZChkZXYpOworCQkJCXBtID0gZHJpdmVyX3RvX3Bt
KGRldi0+ZHJpdmVyKTsKKwkJCQlpZiAocG0gJiYgcG0tPnN1c3BlbmQpCisJCQkJCXJldHZhbCA9
IHBtLT5zdXNwZW5kKGRldik7CiAJCQkJaWYgKGZzbS0+aWQpCiAJCQkJCS8qIGRlZmF1bHQtYiAq
LwogCQkJCQlmc2xfb3RnX2Rydl92YnVzKGZzbSwgMCk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
