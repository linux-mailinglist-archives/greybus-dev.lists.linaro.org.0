Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E31248571
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 14:54:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5DE6D60665
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Aug 2020 12:54:46 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 50DA760EFF; Tue, 18 Aug 2020 12:54:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	RCVD_IN_SORBS_WEB,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D63BF665A6;
	Tue, 18 Aug 2020 12:50:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8DF3B60EFE
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 12:50:23 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7ECCD6162C; Tue, 18 Aug 2020 12:50:23 +0000 (UTC)
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by lists.linaro.org (Postfix) with ESMTPS id 582FD65FCE
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 12:48:44 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id kr4so9369709pjb.2
 for <greybus-dev@lists.linaro.org>; Tue, 18 Aug 2020 05:48:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KWn2a6wUAxzQeIq4NFtMTmknoSynjzag0OTUIJgkTrQ=;
 b=gZ+PaKZ4Fo+A4tZehV6K+i2iDY1f0XHZ1CWmMwHcY8yKiDeqD24OGLKeizptfwaT1r
 UE30Zr5xroyulY2jBR+DBTZ5+/7qQowqzDFkkQvLnSLq7oF2KY4IE/vcNOyMF973KZ0H
 3QcLNUqg7oZJlDSTf2EwtEYjVSuJwe11HHEyhZPzwlfi1PtRZoZ8TtTmwEDjkO/Me/8H
 r4u6ceGnLOs4pawdT0s1s+tJJHejETqB/aapGYKgHhMxqJKQWMsNMFgMTX/GyeexTLxI
 TwPo19r4ysElsHOp+iHB9wrja0BnGDEc9/QUzSMbN3Orl65rwZ7iPdkFLFl33sohj7ft
 yk4w==
X-Gm-Message-State: AOAM530SDkFKEfO9C3Mx2LGCRMSLxRTgr7lTEflf0h8Kc4fJ92lvr5Yx
 sZitbWClMSAmk8RI2A9N36S3yyC/ig85K3M=
X-Google-Smtp-Source: ABdhPJyc6T610ljbDUn5debOLMdl/xg0cxa0srsGVrN6G+hkcmuzstJu3MMzepgUzsxucaHrl+fJ7A==
X-Received: by 2002:a17:902:264:: with SMTP id
 91mr15477464plc.88.1597754923210; 
 Tue, 18 Aug 2020 05:48:43 -0700 (PDT)
Received: from localhost.localdomain ([116.68.79.111])
 by smtp.gmail.com with ESMTPSA id e4sm24264221pfd.204.2020.08.18.05.48.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Aug 2020 05:48:42 -0700 (PDT)
From: Vaishnav M A <vaishnav@beagleboard.org>
To: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 gregkh@linuxfoundation.org, arnd@arndb.de, johan@kernel.org,
 elder@kernel.org
Date: Tue, 18 Aug 2020 18:18:13 +0530
Message-Id: <20200818124815.11029-2-vaishnav@beagleboard.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200818124815.11029-1-vaishnav@beagleboard.org>
References: <20200818124815.11029-1-vaishnav@beagleboard.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: rajkovic@mikroe.com, robh@kernel.org, mchehab+huawei@kernel.org,
 robertcnelson@beagleboard.org, drew@beagleboard.org,
 Vaishnav M A <vaishnav@beagleboard.org>, davem@davemloft.net,
 zoran.stojsavljevic@gmail.com
Subject: [greybus-dev] [RFC PATCH v2 1/3] add mikrobus descriptors to
	greybus_manifest
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

VGhpcyBwYXRjaCBhZGRzIG5ldyBkZXNjcmlwdG9ycyB1c2VkIGluIHRoZSBtYW5pZmVzdCBwYXJz
aW5nIGluc2lkZQp0aGUgbWlrcm9idXMgZHJpdmVyLCB0aGUgZGV2aWNlIGRlc2NyaXB0b3IgaGVs
cCB0byBkZXNjcmliZSB0aGUKZGV2aWNlcyBvbiBhIG1pa3JvQlVTIHBvcnQsIG1pa3JvYnVzIGRl
c2NyaXB0b3IgaXMgdXNlZCB0byBzZXQgdXAKdGhlIG1pa3JvYnVzIHBvcnQgcGlubXV4IGFuZCBH
UElPIHN0YXRlcyBhbmQgcHJvcGVydHkgZGVzY3JpcHRvcgp0byBwYXNzIG5hbWVkIHByb3BlcnRp
ZXMgdG8gZGV2aWNlIGRyaXZlcnMgdGhyb3VnaCB0aGUgVW5pZmllZApQcm9wZXJ0aWVzIEFQSSB1
bmRlciBsaW51eC9wcm9wZXJ0eS5oCgpUaGUgY29ycmVzcG9uZGluZyBwdWxsIHJlcXVlc3QgZm9y
IG1hbmlmZXN0byBpcyB1cGRhdGVkCmF0IDogaHR0cHM6Ly9naXRodWIuY29tL3Byb2plY3RhcmEv
bWFuaWZlc3RvL3B1bGwvMgoKU2lnbmVkLW9mZi1ieTogVmFpc2huYXYgTSBBIDx2YWlzaG5hdkBi
ZWFnbGVib2FyZC5vcmc+Ci0tLQogaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfbWFuaWZl
c3QuaCB8IDQ3ICsrKysrKysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ3IGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19t
YW5pZmVzdC5oIGIvaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfbWFuaWZlc3QuaAppbmRl
eCA2ZTYyZmU0Nzg3MTIuLjgyMTY2MWVhN2YwMSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9n
cmV5YnVzL2dyZXlidXNfbWFuaWZlc3QuaAorKysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3Jl
eWJ1c19tYW5pZmVzdC5oCkBAIC0yMyw2ICsyMyw5IEBAIGVudW0gZ3JleWJ1c19kZXNjcmlwdG9y
X3R5cGUgewogCUdSRVlCVVNfVFlQRV9TVFJJTkcJCT0gMHgwMiwKIAlHUkVZQlVTX1RZUEVfQlVO
RExFCQk9IDB4MDMsCiAJR1JFWUJVU19UWVBFX0NQT1JUCQk9IDB4MDQsCisJR1JFWUJVU19UWVBF
X01JS1JPQlVTCQk9IDB4MDUsCisJR1JFWUJVU19UWVBFX1BST1BFUlRZCQk9IDB4MDYsCisJR1JF
WUJVU19UWVBFX0RFVklDRQkJPSAweDA3LAogfTsKIAogZW51bSBncmV5YnVzX3Byb3RvY29sIHsK
QEAgLTE1MSw2ICsxNTQsNDcgQEAgc3RydWN0IGdyZXlidXNfZGVzY3JpcHRvcl9jcG9ydCB7CiAJ
X191OAlwcm90b2NvbF9pZDsJLyogZW51bSBncmV5YnVzX3Byb3RvY29sICovCiB9IF9fcGFja2Vk
OwogCisvKgorICogQSBtaWtyb2J1cyBkZXNjcmlwdG9yIGlzIHVzZWQgdG8gZGVzY3JpYmUgdGhl
IGRldGFpbHMKKyAqIGFib3V0IHRoZSBidXMgb2NuZmlndXJhdGlvbiBmb3IgdGhlIGFkZC1vbiBi
b2FyZAorICogY29ubmVjdGVkIHRvIHRoZSBtaWtyb2J1cyBwb3J0LgorICovCitzdHJ1Y3QgZ3Jl
eWJ1c19kZXNjcmlwdG9yX21pa3JvYnVzIHsKKwlfX3U4IHBpbl9zdGF0ZVsxMl07Cit9IF9fcGFj
a2VkOworCisvKgorICogQSBwcm9wZXJ0eSBkZXNjcmlwdG9yIGlzIHVzZWQgdG8gcGFzcyBuYW1l
ZCBwcm9wZXJ0aWVzCisgKiB0byBkZXZpY2UgZHJpdmVycyB0aHJvdWdoIHRoZSB1bmlmaWVkIGRl
dmljZSBwcm9wZXJ0aWVzCisgKiBpbnRlcmZhY2UgdW5kZXIgbGludXgvcHJvcGVydHkuaAorICov
CitzdHJ1Y3QgZ3JleWJ1c19kZXNjcmlwdG9yX3Byb3BlcnR5IHsKKwlfX3U4IGxlbmd0aDsKKwlf
X3U4IGlkOworCV9fdTggcHJvcG5hbWVfc3RyaW5naWQ7CisJX191OCB0eXBlOworCV9fdTggdmFs
dWVbMF07Cit9IF9fcGFja2VkOworCisvKgorICogQSBkZXZpY2UgZGVzY3JpcHRvciBpcyB1c2Vk
IHRvIGRlc2NyaWJlIHRoZQorICogZGV0YWlscyByZXF1aXJlZCBieSBhIGFkZC1vbiBib2FyZCBk
ZXZpY2UKKyAqIGRyaXZlci4KKyAqLworc3RydWN0IGdyZXlidXNfZGVzY3JpcHRvcl9kZXZpY2Ug
eworCV9fdTggaWQ7CisJX191OCBkcml2ZXJfc3RyaW5naWQ7CisJX191OCBwcm90b2NvbDsKKwlf
X3U4IHJlZzsKKwlfX2xlMzIgbWF4X3NwZWVkX2h6OworCV9fdTggaXJxOworCV9fdTggaXJxX3R5
cGU7CisJX191OCBtb2RlOworCV9fdTggcHJvcF9saW5rOworCV9fdTggZ3Bpb19saW5rOworCV9f
dTggcGFkWzNdOworfSBfX3BhY2tlZDsKKwogc3RydWN0IGdyZXlidXNfZGVzY3JpcHRvcl9oZWFk
ZXIgewogCV9fbGUxNglzaXplOwogCV9fdTgJdHlwZTsJCS8qIGVudW0gZ3JleWJ1c19kZXNjcmlw
dG9yX3R5cGUgKi8KQEAgLTE2NCw2ICsyMDgsOSBAQCBzdHJ1Y3QgZ3JleWJ1c19kZXNjcmlwdG9y
IHsKIAkJc3RydWN0IGdyZXlidXNfZGVzY3JpcHRvcl9pbnRlcmZhY2UJaW50ZXJmYWNlOwogCQlz
dHJ1Y3QgZ3JleWJ1c19kZXNjcmlwdG9yX2J1bmRsZQlidW5kbGU7CiAJCXN0cnVjdCBncmV5YnVz
X2Rlc2NyaXB0b3JfY3BvcnQJCWNwb3J0OworCQlzdHJ1Y3QgZ3JleWJ1c19kZXNjcmlwdG9yX21p
a3JvYnVzCW1pa3JvYnVzOworCQlzdHJ1Y3QgZ3JleWJ1c19kZXNjcmlwdG9yX3Byb3BlcnR5CXBy
b3BlcnR5OworCQlzdHJ1Y3QgZ3JleWJ1c19kZXNjcmlwdG9yX2RldmljZQlkZXZpY2U7CiAJfTsK
IH0gX19wYWNrZWQ7CiAKLS0gCjIuMjUuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxp
c3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8v
Z3JleWJ1cy1kZXYK
