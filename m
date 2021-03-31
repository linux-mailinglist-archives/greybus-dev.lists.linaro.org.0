Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D1223567E4
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 11:24:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 753BA66631
	for <lists+greybus-dev@lfdr.de>; Wed,  7 Apr 2021 09:24:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 647FE665EE; Wed,  7 Apr 2021 09:24:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C63AB66740;
	Wed,  7 Apr 2021 09:23:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7740360EBF
 for <greybus-dev@lists.linaro.org>; Wed, 31 Mar 2021 20:25:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 60D696186A; Wed, 31 Mar 2021 20:25:33 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 by lists.linaro.org (Postfix) with ESMTPS id 6D13A60EBF
 for <greybus-dev@lists.linaro.org>; Wed, 31 Mar 2021 20:25:32 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 u5-20020a7bcb050000b029010e9316b9d5so1758866wmj.2
 for <greybus-dev@lists.linaro.org>; Wed, 31 Mar 2021 13:25:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Gi9OUsUoRxjAcioEAF4TQW9mJ2fTHnHNzeSFEtVk1Wk=;
 b=Pf6FNm7MFbakEWkQWPIRTJBeKe9wuUpHStAE95KKaRzl4UdrYYXBPi1rUD6oljiNWV
 LXWc/nr6/3up+yrnGFhYnd5D9kV0amor5K5XWAUY+6lYZmxPrr+SosK2s5CGAocx03T5
 EpRrMa0QwOwzYuuJEvJTd308eYJi3Q7xi9kB4T3L0G67QPTuwZ6Fu/VgGKH6BchnY0qh
 azLREVAd3JYHvb6C+SMlOpbX3dexJqYVbtPSy/iEiPVRsu5Rrak0N0QPE4q5cWJGIGWN
 cIe5Onaxb/0cUgwtaZDKPmyl0HorK/sjlUCM99lh7+h8GZEmM1C486TNItEQUVVRRDma
 fcOw==
X-Gm-Message-State: AOAM5320eh0DvNROpEldAsaevRUKlK0c81iTXW/x+VoqxGva8PP3PrgQ
 j/H7erpZb5Jo7U4kQFGGdrU=
X-Google-Smtp-Source: ABdhPJzqSgyQVibalW7B3aVhjcAgmvHwW8HWc7q4lM9+ie7AzcVPs9VcvFZsoFPnVCxpDbyCELPK2A==
X-Received: by 2002:a05:600c:4f94:: with SMTP id
 n20mr4701240wmq.18.1617222331572; 
 Wed, 31 Mar 2021 13:25:31 -0700 (PDT)
Received: from bcarvalho-Ubuntu.lan ([2001:818:de85:7e00:87e9:fdd6:2b7a:c720])
 by smtp.gmail.com with ESMTPSA id
 u3sm6138637wrt.82.2021.03.31.13.25.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 13:25:31 -0700 (PDT)
From: Beatriz Martins de Carvalho <martinsdecarvalhobeatriz@gmail.com>
To: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 outreachy-kernel@googlegroups.com
Date: Wed, 31 Mar 2021 21:24:45 +0100
Message-Id: <20210331202445.108678-1-martinsdecarvalhobeatriz@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 07 Apr 2021 09:23:30 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: arche-platform: Fix ending
	'(' warnings
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

Rml4IGNoZWNrcGF0Y2ggY2hlY2sgIkNIRUNLOiBMaW5lcyBzaG91bGQgbm90IGVuZCB3aXRoIGEg
JygnIgppbiBhcmNoZS1wbGF0Zm9ybS5jOjgwIGFuZCBhcmNoZS1wbGF0Zm9ybS5jOjE4NC4KClNp
Z25lZC1vZmYtYnk6IEJlYXRyaXogTWFydGlucyBkZSBDYXJ2YWxobyA8bWFydGluc2RlY2FydmFs
aG9iZWF0cml6QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hcmNoZS1w
bGF0Zm9ybS5jIHwgMTAgKysrKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygr
KSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9h
cmNoZS1wbGF0Zm9ybS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0u
YwppbmRleCBlZWJmMGRlYjM5ZjUuLmUzNzRkZmMwYzkyZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9z
dGFnaW5nL2dyZXlidXMvYXJjaGUtcGxhdGZvcm0uYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3Jl
eWJ1cy9hcmNoZS1wbGF0Zm9ybS5jCkBAIC03Nyw5ICs3Nyw4IEBAIHN0YXRpYyB2b2lkIGFyY2hl
X3BsYXRmb3JtX3NldF9zdGF0ZShzdHJ1Y3QgYXJjaGVfcGxhdGZvcm1fZHJ2ZGF0YSAqYXJjaGVf
cGRhdGEsCiB9CiAKIC8qIFJlcXVpcmVzIGFyY2hlX3BkYXRhLT53YWtlX2xvY2sgaXMgaGVsZCBi
eSBjYWxsaW5nIGNvbnRleHQgKi8KLXN0YXRpYyB2b2lkIGFyY2hlX3BsYXRmb3JtX3NldF93YWtl
X2RldGVjdF9zdGF0ZSgKLQkJCQlzdHJ1Y3QgYXJjaGVfcGxhdGZvcm1fZHJ2ZGF0YSAqYXJjaGVf
cGRhdGEsCi0JCQkJZW51bSBzdmNfd2FrZWRldGVjdF9zdGF0ZSBzdGF0ZSkKK3N0YXRpYyB2b2lk
IGFyY2hlX3BsYXRmb3JtX3NldF93YWtlX2RldGVjdF9zdGF0ZShzdHJ1Y3QgYXJjaGVfcGxhdGZv
cm1fZHJ2ZGF0YSAqYXJjaGVfcGRhdGEsCisJCQkJCQkgZW51bSBzdmNfd2FrZWRldGVjdF9zdGF0
ZSBzdGF0ZSkKIHsKIAlhcmNoZV9wZGF0YS0+d2FrZV9kZXRlY3Rfc3RhdGUgPSBzdGF0ZTsKIH0K
QEAgLTE4MSw5ICsxODAsOCBAQCBzdGF0aWMgaXJxcmV0dXJuX3QgYXJjaGVfcGxhdGZvcm1fd2Rf
aXJxKGludCBpcnEsIHZvaWQgKmRldmlkKQogCQkJCQkJV0RfU1RBVEVfQ09MREJPT1RfU1RBUlQp
IHsKIAkJCQkJYXJjaGVfcGxhdGZvcm1fc2V0X3dha2VfZGV0ZWN0X3N0YXRlKGFyY2hlX3BkYXRh
LAogCQkJCQkJCQkJICAgICBXRF9TVEFURV9DT0xEQk9PVF9UUklHKTsKLQkJCQkJc3Bpbl91bmxv
Y2tfaXJxcmVzdG9yZSgKLQkJCQkJCSZhcmNoZV9wZGF0YS0+d2FrZV9sb2NrLAotCQkJCQkJZmxh
Z3MpOworCQkJCQlzcGluX3VubG9ja19pcnFyZXN0b3JlKCZhcmNoZV9wZGF0YS0+d2FrZV9sb2Nr
LAorCQkJCQkJCSAgICAgICBmbGFncyk7CiAJCQkJCXJldHVybiBJUlFfV0FLRV9USFJFQUQ7CiAJ
CQkJfQogCQkJfQotLSAKMi4yNS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5
YnVzLWRldgo=
