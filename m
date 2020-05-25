Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 1773F1E1CFF
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:13:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3A714614FE
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:13:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 2B09161805; Tue, 26 May 2020 08:13:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 89B3C65F9E;
	Tue, 26 May 2020 08:11:01 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 84FF3618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:14 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6A2F661943; Mon, 25 May 2020 18:26:14 +0000 (UTC)
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com
 [209.85.218.65])
 by lists.linaro.org (Postfix) with ESMTPS id 3C4E2618F4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 18:26:13 +0000 (UTC)
Received: by mail-ej1-f65.google.com with SMTP id s21so21369485ejd.2
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 11:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tkUGbMkkypRL042+ieWSoDccuHFghwak5Hi3wVxhDmE=;
 b=LgqrmWt9el/RIzpRYNfrrkV5TXyJyxm7yuYm5QM3puTZ1FDqT4a/PMyCHplgvC3iYK
 pG0AQ2G3Ikj8YMkd5ZahZCucuFPBbf6vGmU8zIuQXiwq2sXXPzQAM0thWjF7X+6DEiwf
 jscFzWm8RsHgtyeNKT/zW6M34SttGx7wpFhwBI+mJc/WIIL5nyxnfFwBy7DEb9/u30BT
 ecJZIRxCnA4DAf9Z1rVeG/8E1qTYRCjznk8tIz1M7fBH0LRyP0HLcI7z0hRxDtyu4bQ3
 FUPp/dKzULmJf9838BfYACF31iLf7DUfdCss4MwjNVH8G/FqDkJ0yoityx09S7eYQJkH
 EeDw==
X-Gm-Message-State: AOAM5315TbY5xpYTTIUpF/vcQK4/QbyQ1RFG+dAzEwTspHuRSwbXNRvc
 WJapHfpZEEuNcp0GZ/ZIkT0=
X-Google-Smtp-Source: ABdhPJyLZsaw5mEGXRcLaNb9q3bD5AU4cxUKQ8Vo98mbYphbp21kYQ3Rc8jcjNp3ljuzgmIEt8D4Ug==
X-Received: by 2002:a17:906:f1c3:: with SMTP id
 gx3mr19110160ejb.278.1590431172312; 
 Mon, 25 May 2020 11:26:12 -0700 (PDT)
Received: from workstation.lan ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id n15sm15555707ejs.10.2020.05.25.11.26.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 May 2020 11:26:11 -0700 (PDT)
From: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>
To: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 25 May 2020 18:26:01 +0000
Message-Id: <20200525182608.1823735-2-kw@linux.com>
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
Subject: [greybus-dev] [PATCH 1/8] driver core: Add helper for accessing
	Power Management callbacs
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

QWRkIGRyaXZlcl90b19wbSgpIGhlbHBlciBhbGxvd2luZyBmb3IgYWNjZXNzaW5nIHRoZSBQb3dl
ciBNYW5hZ2VtZW50CmNhbGxiYWNzIGZvciBhIHBhcnRpY3VsYXIgZGV2aWNlLiAgQWNjZXNzIHRv
IHRoZSBjYWxsYmFjcyAoc3RydWN0CmRldl9wbV9vcHMpIGlzIG5vcm1hbGx5IGRvbmUgdGhyb3Vn
aCB1c2luZyB0aGUgcG0gcG9pbnRlciB0aGF0IGlzCmVtYmVkZGVkIHdpdGhpbiB0aGUgZGV2aWNl
X2RyaXZlciBzdHJ1Y3QuCgpIZWxwZXIgYWxsb3dzIGZvciB0aGUgY29kZSByZXF1aXJlZCB0byBy
ZWZlcmVuY2UgdGhlIHBtIHBvaW50ZXIgYW5kCmFjY2VzcyBQb3dlciBNYW5hZ2VtZW50IGNhbGxi
YXMgdG8gYmUgc2ltcGxpZmllZC4gIENoYW5naW5nIHRoZQpmb2xsb3dpbmc6CgogIHN0cnVjdCBk
ZXZpY2VfZHJpdmVyICpkcnYgPSBkZXYtPmRyaXZlcjsKICBpZiAoZGV2LT5kcml2ZXIgJiYgZGV2
LT5kcml2ZXItPnBtICYmIGRldi0+ZHJpdmVyLT5wbS0+cHJlcGFyZSkgewogICAgICBpbnQgcmV0
ID0gZGV2LT5kcml2ZXItPnBtLT5wcmVwYXJlKGRldik7CgpUbzoKCiAgY29uc3Qgc3RydWN0IGRl
dl9wbV9vcHMgKnBtID0gZHJpdmVyX3RvX3BtKGRldi0+ZHJpdmVyKTsKICBpZiAocG0gJiYgcG0t
PnByZXBhcmUpIHsKICAgICAgaW50IHJldCA9IHBtLT5wcmVwYXJlKGRldik7CgpPciwgY2hhbmdp
bmcgdGhlIGZvbGxvd2luZzoKCiAgICAgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKnBtID0gZGV2
LT5kcml2ZXIgPyBkZXYtPmRyaXZlci0+cG0gOiBOVUxMOwoKVG86CiAgICAgY29uc3Qgc3RydWN0
IGRldl9wbV9vcHMgKnBtID0gZHJpdmVyX3RvX3BtKGRldi0+ZHJpdmVyKTsKClNpZ25lZC1vZmYt
Ynk6IEtyenlzenRvZiBXaWxjennFhHNraSA8a3dAbGludXguY29tPgotLS0KIGluY2x1ZGUvbGlu
dXgvZGV2aWNlL2RyaXZlci5oIHwgMTUgKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwg
MTUgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZl
ci5oIGIvaW5jbHVkZS9saW51eC9kZXZpY2UvZHJpdmVyLmgKaW5kZXggZWU3YmE1YjU0MTdlLi5j
Y2QwYjMxNWZkOTMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oCisr
KyBiL2luY2x1ZGUvbGludXgvZGV2aWNlL2RyaXZlci5oCkBAIC0yMzYsNiArMjM2LDIxIEBAIGRy
aXZlcl9maW5kX2RldmljZV9ieV9hY3BpX2RldihzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2LCBj
b25zdCB2b2lkICphZGV2KQogfQogI2VuZGlmCiAKKy8qKgorICogZHJpdmVyX3RvX3BtIC0gUmV0
dXJuIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJhY3MgKHN0cnVjdCBkZXZfcG1fb3BzKSBmb3IKKyAq
ICAgICAgICAgICAgICAgIGEgcGFydGljdWxhciBkZXZpY2UuCisgKiBAZHJ2OiBQb2ludGVyIHRv
IGEgZGV2aWNlIChzdHJ1Y3QgZGV2aWNlX2RyaXZlcikgZm9yIHdoaWNoIHlvdSB3YW50IHRvIGFj
Y2VzcworICogICAgICAgdGhlIFBvd2VyIE1hbmFnZW1lbnQgY2FsbGJhY2tzLgorICoKKyAqIFJl
dHVybnMgYSBwb2ludGVyIHRvIHRoZSBzdHJ1Y3QgZGV2X3BtX29wcyBlbWJlZGRlZCB3aXRoaW4g
dGhlIGRldmljZSAoc3RydWN0CisgKiBkZXZpY2VfZHJpdmVyKSwgb3IgcmV0dXJucyBOVUxMIGlm
IFBvd2VyIE1hbmFnZW1lbnQgaXMgbm90IHByZXNlbnQgYW5kIHRoZQorICogcG9pbnRlciBpcyBu
b3QgdmFsaWQuCisgKi8KK3N0YXRpYyBpbmxpbmUgY29uc3Qgc3RydWN0IGRldl9wbV9vcHMgKmRy
aXZlcl90b19wbShzdHJ1Y3QgZGV2aWNlX2RyaXZlciAqZHJ2KQoreworCXJldHVybiBkcnYgJiYg
ZHJ2LT5wbSA/IGRydi0+cG0gOiBOVUxMOworfQorCiBleHRlcm4gaW50IGRyaXZlcl9kZWZlcnJl
ZF9wcm9iZV90aW1lb3V0Owogdm9pZCBkcml2ZXJfZGVmZXJyZWRfcHJvYmVfYWRkKHN0cnVjdCBk
ZXZpY2UgKmRldik7CiBpbnQgZHJpdmVyX2RlZmVycmVkX3Byb2JlX2NoZWNrX3N0YXRlKHN0cnVj
dCBkZXZpY2UgKmRldik7Ci0tIAoyLjI2LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBs
aXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2dyZXlidXMtZGV2Cg==
