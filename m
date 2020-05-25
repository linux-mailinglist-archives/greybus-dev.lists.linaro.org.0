Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A27E1E1D07
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:14:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BB98061805
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:14:47 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id AEB8161943; Tue, 26 May 2020 08:14:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9925665FE7;
	Tue, 26 May 2020 08:11:03 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id EB554618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DC88A619D0; Mon, 25 May 2020 18:26:34 +0000 (UTC)
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 by lists.linaro.org (Postfix) with ESMTPS id 4B212618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:24 +0000 (UTC)
Received: by mail-ed1-f65.google.com with SMTP id d24so15677408eds.11
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 11:26:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6WamrPQShgiTsDFapEcmGDUQvC5yr09yE8HLsYvPPjk=;
 b=D2R1tepXNj33TQ1vQIgqZTrctGFwkuL6DaVos5K6bEYEbPnHM4at6jyNfvAyWaquyI
 p+rQ8lcmxF//SXZjaVh9/X08Ilw+qdGfdpK7od1adqruVSuTaJlVnoZcs4ebdcuwDbtt
 GnK05A0KWgHY+eALZQra15BpSjVEyIayBlscDtE9yMg7ZD8OrmXSKEo/ML80TIHeIb2R
 LVQ+jB+svu6/l1SvQfWWzNbULmzmLffYvfKtgBwgQmi3zv/tgUEvcfvurwAMJo0MWjrJ
 o/8V/it9egYapy7/qeIawl8VS6bUXYgbUnkmCu6ivfCMvp1hkG+5FmCTjPBje2pZE4qm
 58Xg==
X-Gm-Message-State: AOAM533RO8mZ31Zto/GmH+UMmJhPKgqEtgOUU3fGHynd9raeZLZIzroz
 gdw0SAkCouP1ZcUul8cRmw0=
X-Google-Smtp-Source: ABdhPJwaQ1a3PQrLYUo66G+JvtCe5bgBlAK3z2hUCsbaw6NsBbigY5hyn9hKVKSVUbo33mXU0BIe7w==
X-Received: by 2002:aa7:cf12:: with SMTP id a18mr11182818edy.193.1590431183421; 
 Mon, 25 May 2020 11:26:23 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n15sm15555707ejs.10.2020.05.25.11.26.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 11:26:22 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 May 2020 18:26:08 +0000
Message-Id: <20200525182608.1823735-9-kw@linux.com>
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
Subject: [greybus-dev] [PATCH 8/8] net/iucv: Use the new device_to_pm()
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
bmV0L2l1Y3YvaXVjdi5jIHwgMzAgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbmV0L2l1Y3YvaXVjdi5jIGIvbmV0L2l1Y3YvaXVjdi5jCmluZGV4IDlhMmQwMjM4NDJmZS4u
MWEzMDI5YWI3YzFmIDEwMDY0NAotLS0gYS9uZXQvaXVjdi9pdWN2LmMKKysrIGIvbmV0L2l1Y3Yv
aXVjdi5jCkBAIC0xODM2LDIzICsxODM2LDIzIEBAIHN0YXRpYyB2b2lkIGl1Y3ZfZXh0ZXJuYWxf
aW50ZXJydXB0KHN0cnVjdCBleHRfY29kZSBleHRfY29kZSwKIAogc3RhdGljIGludCBpdWN2X3Bt
X3ByZXBhcmUoc3RydWN0IGRldmljZSAqZGV2KQogewotCWludCByYyA9IDA7CisJY29uc3Qgc3Ry
dWN0IGRldl9wbV9vcHMgKnBtID0gZHJpdmVyX3RvX3BtKGRldi0+ZHJpdmVyKTsKIAogI2lmZGVm
IENPTkZJR19QTV9ERUJVRwogCXByaW50ayhLRVJOX0lORk8gIml1Y3ZfcG1fcHJlcGFyZVxuIik7
CiAjZW5kaWYKLQlpZiAoZGV2LT5kcml2ZXIgJiYgZGV2LT5kcml2ZXItPnBtICYmIGRldi0+ZHJp
dmVyLT5wbS0+cHJlcGFyZSkKLQkJcmMgPSBkZXYtPmRyaXZlci0+cG0tPnByZXBhcmUoZGV2KTsK
LQlyZXR1cm4gcmM7CisJcmV0dXJuIHBtICYmIHBtLT5wcmVwYXJlID8gcG0tPnByZXBhcmUoZGV2
KSA6IDA7CiB9CiAKIHN0YXRpYyB2b2lkIGl1Y3ZfcG1fY29tcGxldGUoc3RydWN0IGRldmljZSAq
ZGV2KQogeworCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRyaXZlcl90b19wbShkZXYt
PmRyaXZlcik7CisKICNpZmRlZiBDT05GSUdfUE1fREVCVUcKIAlwcmludGsoS0VSTl9JTkZPICJp
dWN2X3BtX2NvbXBsZXRlXG4iKTsKICNlbmRpZgotCWlmIChkZXYtPmRyaXZlciAmJiBkZXYtPmRy
aXZlci0+cG0gJiYgZGV2LT5kcml2ZXItPnBtLT5jb21wbGV0ZSkKLQkJZGV2LT5kcml2ZXItPnBt
LT5jb21wbGV0ZShkZXYpOworCWlmIChwbSAmJiBwbS0+Y29tcGxldGUpCisJCXBtLT5jb21wbGV0
ZShkZXYpOwogfQogCiAvKioKQEAgLTE4ODMsNiArMTg4Myw3IEBAIHN0YXRpYyBpbnQgaXVjdl9w
YXRoX3RhYmxlX2VtcHR5KHZvaWQpCiBzdGF0aWMgaW50IGl1Y3ZfcG1fZnJlZXplKHN0cnVjdCBk
ZXZpY2UgKmRldikKIHsKIAlpbnQgY3B1OworCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbTsK
IAlzdHJ1Y3QgaXVjdl9pcnFfbGlzdCAqcCwgKm47CiAJaW50IHJjID0gMDsKIApAQCAtMTkwMiw4
ICsxOTAzLDkgQEAgc3RhdGljIGludCBpdWN2X3BtX2ZyZWV6ZShzdHJ1Y3QgZGV2aWNlICpkZXYp
CiAJCX0KIAl9CiAJaXVjdl9wbV9zdGF0ZSA9IElVQ1ZfUE1fRlJFRVpJTkc7Ci0JaWYgKGRldi0+
ZHJpdmVyICYmIGRldi0+ZHJpdmVyLT5wbSAmJiBkZXYtPmRyaXZlci0+cG0tPmZyZWV6ZSkKLQkJ
cmMgPSBkZXYtPmRyaXZlci0+cG0tPmZyZWV6ZShkZXYpOworCXBtID0gZHJpdmVyX3RvX3BtKGRl
di0+ZHJpdmVyKTsKKwlpZiAocG0gJiYgcG0tPmZyZWV6ZSkKKwkJcmMgPSBwbS0+ZnJlZXplKGRl
dik7CiAJaWYgKGl1Y3ZfcGF0aF90YWJsZV9lbXB0eSgpKQogCQlpdWN2X2Rpc2FibGUoKTsKIAly
ZXR1cm4gcmM7CkBAIC0xOTE5LDYgKzE5MjEsNyBAQCBzdGF0aWMgaW50IGl1Y3ZfcG1fZnJlZXpl
KHN0cnVjdCBkZXZpY2UgKmRldikKICAqLwogc3RhdGljIGludCBpdWN2X3BtX3RoYXcoc3RydWN0
IGRldmljZSAqZGV2KQogeworCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbTsKIAlpbnQgcmMg
PSAwOwogCiAjaWZkZWYgQ09ORklHX1BNX0RFQlVHCkBAIC0xOTM4LDggKzE5NDEsOSBAQCBzdGF0
aWMgaW50IGl1Y3ZfcG1fdGhhdyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCQkvKiBlbmFibGUgaW50
ZXJydXB0cyBvbiBhbGwgY3B1cyAqLwogCQkJaXVjdl9zZXRtYXNrX21wKCk7CiAJfQotCWlmIChk
ZXYtPmRyaXZlciAmJiBkZXYtPmRyaXZlci0+cG0gJiYgZGV2LT5kcml2ZXItPnBtLT50aGF3KQot
CQlyYyA9IGRldi0+ZHJpdmVyLT5wbS0+dGhhdyhkZXYpOworCXBtID0gZHJpdmVyX3RvX3BtKGRl
di0+ZHJpdmVyKTsKKwlpZiAocG0gJiYgcG0tPnRoYXcpCisJCXJjID0gcG0tPnRoYXcoZGV2KTsK
IG91dDoKIAlyZXR1cm4gcmM7CiB9CkBAIC0xOTU0LDYgKzE5NTgsNyBAQCBzdGF0aWMgaW50IGl1
Y3ZfcG1fdGhhdyhzdHJ1Y3QgZGV2aWNlICpkZXYpCiAgKi8KIHN0YXRpYyBpbnQgaXVjdl9wbV9y
ZXN0b3JlKHN0cnVjdCBkZXZpY2UgKmRldikKIHsKKwljb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAq
cG07CiAJaW50IHJjID0gMDsKIAogI2lmZGVmIENPTkZJR19QTV9ERUJVRwpAQCAtMTk2OCw4ICsx
OTczLDkgQEAgc3RhdGljIGludCBpdWN2X3BtX3Jlc3RvcmUoc3RydWN0IGRldmljZSAqZGV2KQog
CQlpZiAocmMpCiAJCQlnb3RvIG91dDsKIAl9Ci0JaWYgKGRldi0+ZHJpdmVyICYmIGRldi0+ZHJp
dmVyLT5wbSAmJiBkZXYtPmRyaXZlci0+cG0tPnJlc3RvcmUpCi0JCXJjID0gZGV2LT5kcml2ZXIt
PnBtLT5yZXN0b3JlKGRldik7CisJcG0gPSBkcml2ZXJfdG9fcG0oZGV2LT5kcml2ZXIpOworCWlm
IChwbSAmJiBwbS0+cmVzdG9yZSkKKwkJcmMgPSBwbS0+cmVzdG9yZShkZXYpOwogb3V0OgogCXJl
dHVybiByYzsKIH0KLS0gCjIuMjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3Jl
eWJ1cy1kZXYK
