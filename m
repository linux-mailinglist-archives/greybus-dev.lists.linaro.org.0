Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 11EE01E1D04
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:13:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22468614FE
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:13:56 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1452B61805; Tue, 26 May 2020 08:13:56 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C0D4A65FAB;
	Tue, 26 May 2020 08:11:02 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id A875E618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:22 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 98CA265F7F; Mon, 25 May 2020 18:26:22 +0000 (UTC)
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by lists.linaro.org (Postfix) with ESMTPS id ED4CB618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:17 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id s19so15690363edt.12
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 11:26:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vks0hIgL1NwjWUU2xJ9iHtmVGdxZKzV+xbSUPqXCfwA=;
 b=HSic4eYXukqWQnYG11cpqgO1G6ExIubsg3hB+7QCuSC2qYU5EVGjvQj+Ehp+e1S5s4
 pqEfwKHRPd0FwXXvcWmmwKA29Go5NERjmQz0DYP/cie4X/BfBCLM7xjR+83jV5IoSRpa
 0JhIEd0vHUuUdiD3HZIE9zmDFy/onPI5i8IsLehMKp/YcQy3SXq1xX3Yg+qFLN19XD0n
 PvhCXvXtGKDRtsl3Gi6gnEFZaKv2fOH27BF/vH5eMG3SRG/QuY3i/nDZ2XoI67+q8cBo
 pyjKJHV0I+8h87QyfW/94veKKNNJ02zFXy2Xsdt/zPCmp2KLuUBn5Cj1kY1RVouAAt7d
 TY3g==
X-Gm-Message-State: AOAM533CA0v0SmUmDqRskVMEsaecMvWsYiBvfvmpDW/aeroeCjy5EmFb
 wXCDI33H4a5DN+TDl+t917o=
X-Google-Smtp-Source: ABdhPJxpk17hj32HQlVxuKMrJl9fav78GF8tiYkjJ3OmXfQxm5boXKtzfcrmijAtVvsY76ZoDX8sKQ==
X-Received: by 2002:aa7:c3cb:: with SMTP id l11mr15735650edr.364.1590431177072; 
 Mon, 25 May 2020 11:26:17 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n15sm15555707ejs.10.2020.05.25.11.26.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 11:26:16 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 May 2020 18:26:04 +0000
Message-Id: <20200525182608.1823735-5-kw@linux.com>
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
Subject: [greybus-dev] [PATCH 4/8] scsi: pm: Use the new device_to_pm()
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
ZHJpdmVycy9zY3NpL3Njc2lfcG0uYyB8IDggKysrKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGlu
c2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zY3NpL3Nj
c2lfcG0uYyBiL2RyaXZlcnMvc2NzaS9zY3NpX3BtLmMKaW5kZXggNWYwYWQ4YjMyZTNhLi44ZjQw
YjYwZDMzODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc2NzaS9zY3NpX3BtLmMKKysrIGIvZHJpdmVy
cy9zY3NpL3Njc2lfcG0uYwpAQCAtNTMsNyArNTMsNyBAQCBzdGF0aWMgaW50IGRvX3Njc2lfcmVz
dG9yZShzdHJ1Y3QgZGV2aWNlICpkZXYsIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSkKIHN0
YXRpYyBpbnQgc2NzaV9kZXZfdHlwZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldiwKIAkJaW50
ICgqY2IpKHN0cnVjdCBkZXZpY2UgKiwgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKikpCiB7Ci0J
Y29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKnBtID0gZGV2LT5kcml2ZXIgPyBkZXYtPmRyaXZlci0+
cG0gOiBOVUxMOworCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRyaXZlcl90b19wbShk
ZXYtPmRyaXZlcik7CiAJaW50IGVycjsKIAogCS8qIGZsdXNoIHBlbmRpbmcgaW4tZmxpZ2h0IHJl
c3VtZSBvcGVyYXRpb25zLCBzdXNwZW5kIGlzIHN5bmNocm9ub3VzICovCkBAIC03Miw3ICs3Miw3
IEBAIHN0YXRpYyBpbnQgc2NzaV9kZXZfdHlwZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldiwK
IHN0YXRpYyBpbnQgc2NzaV9kZXZfdHlwZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2LAogCQlp
bnQgKCpjYikoc3RydWN0IGRldmljZSAqLCBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqKSkKIHsK
LQljb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0gPSBkZXYtPmRyaXZlciA/IGRldi0+ZHJpdmVy
LT5wbSA6IE5VTEw7CisJY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKnBtID0gZHJpdmVyX3RvX3Bt
KGRldi0+ZHJpdmVyKTsKIAlpbnQgZXJyID0gMDsKIAogCWVyciA9IGNiKGRldiwgcG0pOwpAQCAt
MjMyLDcgKzIzMiw3IEBAIHN0YXRpYyBpbnQgc2NzaV9idXNfcmVzdG9yZShzdHJ1Y3QgZGV2aWNl
ICpkZXYpCiAKIHN0YXRpYyBpbnQgc2Rldl9ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQogewotCWNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzICpwbSA9IGRldi0+ZHJpdmVyID8gZGV2
LT5kcml2ZXItPnBtIDogTlVMTDsKKwljb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyAqcG0gPSBkcml2
ZXJfdG9fcG0oZGV2LT5kcml2ZXIpOwogCXN0cnVjdCBzY3NpX2RldmljZSAqc2RldiA9IHRvX3Nj
c2lfZGV2aWNlKGRldik7CiAJaW50IGVyciA9IDA7CiAKQEAgLTI2Miw3ICsyNjIsNyBAQCBzdGF0
aWMgaW50IHNjc2lfcnVudGltZV9zdXNwZW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIHN0YXRpYyBp
bnQgc2Rldl9ydW50aW1lX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IHNj
c2lfZGV2aWNlICpzZGV2ID0gdG9fc2NzaV9kZXZpY2UoZGV2KTsKLQljb25zdCBzdHJ1Y3QgZGV2
X3BtX29wcyAqcG0gPSBkZXYtPmRyaXZlciA/IGRldi0+ZHJpdmVyLT5wbSA6IE5VTEw7CisJY29u
c3Qgc3RydWN0IGRldl9wbV9vcHMgKnBtID0gZHJpdmVyX3RvX3BtKGRldi0+ZHJpdmVyKTsKIAlp
bnQgZXJyID0gMDsKIAogCWJsa19wcmVfcnVudGltZV9yZXN1bWUoc2Rldi0+cmVxdWVzdF9xdWV1
ZSk7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8u
b3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2
Cg==
