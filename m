Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2639FFDC
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 12:29:26 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 63670609D6
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 10:29:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 581BE617E7; Wed, 28 Aug 2019 10:29:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1E536162E;
	Wed, 28 Aug 2019 10:29:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0ADDC6058D
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 10:29:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id E844060BDE; Wed, 28 Aug 2019 10:29:12 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
 [209.85.128.67])
 by lists.linaro.org (Postfix) with ESMTPS id 024BD6058D
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 10:29:12 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 10so2187261wmp.3
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 03:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=npkI1OD2Sve7UGLUZ8V5TZogm8n/oSbOkDkQq+5XyUs=;
 b=JS7azQuVd4esCR8qRFufl8MQLiT5pzLeuPzqjENQiKVTHz1WQs8bw4N73iDgzmVrUA
 KzEDvpgF6S4iCAG8pRtR8XvQ+DTYoJPllLdrxI6Yyp5TuL8CucyQAXvikk9cRDaVCV2a
 1DAjGtZA3skX6i5nHkBe2V+moDRyo6HOnz03TONknm/yGo8vi0Y3BXBObMN6h+mqOO7q
 b0XFIP7WKCs6V5m258hDnvRKum0L0t1KAoMkZMehO9PF5kaHMYZSxSf1LL4jINa/2Ifi
 qq5Fe2BWp5q83qEWGB5SdSJlm29BkFmwWZMj6J8UYfkWyeVPSc4B51wHJTNhgN3pJ2fB
 sPEw==
X-Gm-Message-State: APjAAAXqjiydX+2DtFuvyeNBfEXAOCWk0gv1VyORhNcWkgpYrU5HnZcJ
 lwgkYmjN4UTEBK/CZFZtn7WPILB2
X-Google-Smtp-Source: APXvYqwCC6KHYz8mPlSFrOrE7HOaT5hgKDwpXhhDrUvtAcgidpstTTnKWzkAKMUyfdjvhxIgkvWSzA==
X-Received: by 2002:a1c:356:: with SMTP id 83mr4128366wmd.40.1566988151072;
 Wed, 28 Aug 2019 03:29:11 -0700 (PDT)
Received: from arch-late.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id o14sm2982629wrg.64.2019.08.28.03.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 03:29:10 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 28 Aug 2019 11:28:59 +0100
Message-Id: <20190828102859.13180-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Rui Miguel Silva <rui.silva@linaro.org>, kbuild test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [greybus-dev] [PATCH] staging: greybus: fix more header includes
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

TW9yZSBoZWFkZXJzIG5lZWRlZCB0byBiZSBmaXhlZCB3aGVuIG1vdmluZyBncmV5YnVzIG91dCBv
ZiBzdGFnaW5nIGFuZAplbmFibGluZyB0aGUgQ09NUElMRV9URVNUIG9wdGlvbi4KClJlcG9ydGVk
LWJ5OiBrYnVpbGQgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogUnVp
IE1pZ3VlbCBTaWx2YSA8cnVpLnNpbHZhQGxpbmFyby5vcmc+Ci0tLQogaW5jbHVkZS9saW51eC9n
cmV5YnVzL29wZXJhdGlvbi5oIHwgMSArCiBpbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmggICAg
ICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvZ3JleWJ1cy9vcGVyYXRpb24uaCBiL2luY2x1ZGUvbGludXgvZ3JleWJ1
cy9vcGVyYXRpb24uaAppbmRleCA4Y2E4NjRiYmEyM2UuLmJmYmM1NmQ4ZDg2MyAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oCisrKyBiL2luY2x1ZGUvbGludXgv
Z3JleWJ1cy9vcGVyYXRpb24uaApAQCAtMTUsNiArMTUsNyBAQAogI2luY2x1ZGUgPGxpbnV4L3R5
cGVzLmg+CiAjaW5jbHVkZSA8bGludXgvd29ya3F1ZXVlLmg+CiAKKyNpbmNsdWRlICJoZC5oIgog
CiBzdHJ1Y3QgZ2Jfb3BlcmF0aW9uOwogCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXli
dXMvc3ZjLmggYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKaW5kZXggNTA3ZjhiZDRlNGM4
Li4xMWE4NjUwNGM0MjkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZ3JleWJ1cy9zdmMuaAor
KysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKQEAgLTEyLDYgKzEyLDggQEAKICNpbmNs
dWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxpbnV4L2RldmljZS5oPgogCisjaW5jbHVk
ZSAiZ3JleWJ1c19wcm90b2NvbHMuaCIKKwogI2RlZmluZSBHQl9TVkNfQ1BPUlRfRkxBR19FMkVG
QwkJQklUKDApCiAjZGVmaW5lIEdCX1NWQ19DUE9SVF9GTEFHX0NTRF9OCQlCSVQoMSkKICNkZWZp
bmUgR0JfU1ZDX0NQT1JUX0ZMQUdfQ1NWX04JCUJJVCgyKQotLSAKMi4yMi4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5v
cmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
