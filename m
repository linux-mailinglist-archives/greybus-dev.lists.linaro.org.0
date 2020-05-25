Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 20D1A1E1D02
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:13:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3E978619A8
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:13:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2B05C61805; Tue, 26 May 2020 08:13:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4F9A065FA7;
	Tue, 26 May 2020 08:11:02 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 65566618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:17 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 56A5B61943; Mon, 25 May 2020 18:26:17 +0000 (UTC)
Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com
 [209.85.208.66])
 by lists.linaro.org (Postfix) with ESMTPS id 52E8C6193C
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:16 +0000 (UTC)
Received: by mail-ed1-f66.google.com with SMTP id g9so15689374edr.8
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 11:26:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1bL0BwD4jERke74zdsN6GWlbqAKQcOkJQVbWbDofjCc=;
 b=rCm0azKDtxeDghr3hhkfeetk+ox71FnFr+5Um16RAzbM1YQr7/+Vcx/azGUrK9QqS1
 gJVxaJaUYmQvKCr80c2fVGHv1NLUU/0kWxw+wyddODDBcGdbxb5ZgVoeyhcH6WTkfyIq
 fycdogjhL6V4sMrI9KywK6I6AnC6Ws2Ha03Y41E4eYXOKzixJuqWUUAvES1X8UjR0nHg
 EPQ+t5pWAqCgbNg5h5x+YSt7L3YUHiOi1W82IDULSSiiHGZ9HPTI3ww+0l8gPKo6yNVu
 E4qwk2q2T1tVsM4IzWKObpmt/g0YZhoFgy+IMN2n/kMkTGoyQhpSvRr06+hHlBYGInWI
 11+g==
X-Gm-Message-State: AOAM531wksqgYClUFJPmjPl1rQaZPtR9+arwhLeTvS3tXLIxeW8AeCWp
 qKlBUra4AvaF/8P66vBhAMo=
X-Google-Smtp-Source: ABdhPJwrYFIAvzGWl142jMalbOrQRtAasOCaag/9Ikx3BCjjSja4mpWvlAvCZRDWouYD7Z+QytFuXg==
X-Received: by 2002:aa7:cb8d:: with SMTP id r13mr16272548edt.12.1590431175453; 
 Mon, 25 May 2020 11:26:15 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n15sm15555707ejs.10.2020.05.25.11.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 11:26:14 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 May 2020 18:26:03 +0000
Message-Id: <20200525182608.1823735-4-kw@linux.com>
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
Subject: [greybus-dev] [PATCH 3/8] greybus: Use the new device_to_pm()
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
ZHJpdmVycy9ncmV5YnVzL2J1bmRsZS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9i
dW5kbGUuYyBiL2RyaXZlcnMvZ3JleWJ1cy9idW5kbGUuYwppbmRleCA4NDY2MDcyOTUzOGIuLmQz
OGQzYTYzMDgxMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncmV5YnVzL2J1bmRsZS5jCisrKyBiL2Ry
aXZlcnMvZ3JleWJ1cy9idW5kbGUuYwpAQCAtMTA4LDcgKzEwOCw3IEBAIHN0YXRpYyB2b2lkIGdi
X2J1bmRsZV9lbmFibGVfYWxsX2Nvbm5lY3Rpb25zKHN0cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSkK
IHN0YXRpYyBpbnQgZ2JfYnVuZGxlX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0
cnVjdCBnYl9idW5kbGUgKmJ1bmRsZSA9IHRvX2diX2J1bmRsZShkZXYpOwotCWNvbnN0IHN0cnVj
dCBkZXZfcG1fb3BzICpwbSA9IGRldi0+ZHJpdmVyLT5wbTsKKwljb25zdCBzdHJ1Y3QgZGV2X3Bt
X29wcyAqcG0gPSBkcml2ZXJfdG9fcG0oZGV2LT5kcml2ZXIpOwogCWludCByZXQ7CiAKIAlpZiAo
cG0gJiYgcG0tPnJ1bnRpbWVfc3VzcGVuZCkgewpAQCAtMTM1LDcgKzEzNSw3IEBAIHN0YXRpYyBp
bnQgZ2JfYnVuZGxlX3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQogc3RhdGljIGludCBnYl9i
dW5kbGVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKIAlzdHJ1Y3QgZ2JfYnVuZGxlICpi
dW5kbGUgPSB0b19nYl9idW5kbGUoZGV2KTsKLQljb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0g
PSBkZXYtPmRyaXZlci0+cG07CisJY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKnBtID0gZHJpdmVy
X3RvX3BtKGRldi0+ZHJpdmVyKTsKIAlpbnQgcmV0OwogCiAJcmV0ID0gZ2JfY29udHJvbF9idW5k
bGVfcmVzdW1lKGJ1bmRsZS0+aW50Zi0+Y29udHJvbCwgYnVuZGxlLT5pZCk7Ci0tIAoyLjI2LjIK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
