Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C306A0225
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 14:48:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 528CC60879
	for <lists+greybus-dev@lfdr.de>; Wed, 28 Aug 2019 12:48:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 45CFA60BDE; Wed, 28 Aug 2019 12:48:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2 autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 04F96617E7;
	Wed, 28 Aug 2019 12:48:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id F036960879
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 12:48:33 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D9C586162E; Wed, 28 Aug 2019 12:48:33 +0000 (UTC)
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
 [209.85.221.67])
 by lists.linaro.org (Postfix) with ESMTPS id 5BBFE60879
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 12:48:32 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id e16so2378367wro.5
 for <greybus-dev@lists.linaro.org>; Wed, 28 Aug 2019 05:48:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ia9iMFD1fTVwn2oj5I4kJieRatgJPanbvk8YGMBpinc=;
 b=Q+RBAlWXrdhvcnMrxU/6TiMfY1KOrmjTURbK2GYiyQWuxM9VKOjkpVrzuvQhclo3t/
 6gFQNKG0xZpjbDRsGzn/GShfle6C1pj+5R7TNyxPi1saPF0tykkJDg3QC8l/cD8EzBI8
 89F2pKNB6hFV3wXF3nOvSjV7o2bqkK7hJjsGgK4puriF4gqTH9uLYSkWqeo09a/NjksC
 fNJqmpiihW/eZ7N4n+ihqnLhO9vrOBp9bA7TIum2Oe2219NKH9xL3V4h2oo/lqkr5yoa
 lyoWGnthSalkzHd8xjzl6laFq66JAq9wCeL09tDB3MxxzI7N4/Y/RdJ2dD3g3x8QHEya
 OldQ==
X-Gm-Message-State: APjAAAXevbzXuKV1f0gwbCJIAo5VH7nAxlcLypgHXbopFPMoMh+pGqMg
 Y6KzVmFq97LxcczMQNILQftYJDhS
X-Google-Smtp-Source: APXvYqzIR/lq+0DMAO/MG3yy+ybae6xSzeQ1IkcRI+aJa4qWtO/P6R8Wnyy/p7kjt4FbGbABclhJoQ==
X-Received: by 2002:adf:f3d1:: with SMTP id g17mr4503314wrp.38.1566996511497; 
 Wed, 28 Aug 2019 05:48:31 -0700 (PDT)
Received: from arch-late.local (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
 by smtp.gmail.com with ESMTPSA id g65sm2420551wma.21.2019.08.28.05.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:48:30 -0700 (PDT)
From: Rui Miguel Silva <rui.silva@linaro.org>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Wed, 28 Aug 2019 13:48:25 +0100
Message-Id: <20190828124825.20800-1-rui.silva@linaro.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 Rui Miguel Silva <rui.silva@linaro.org>, kbuild test robot <lkp@intel.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [greybus-dev] [PATCH v2] staging: greybus: fix more header
	declarations
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
ZiBzdGFnaW5nIGFuZAplbmFibGluZyB0aGUgQ09NUElMRV9URVNUIG9wdGlvbi4KCkFkZCBmb3J3
YXJkIGRlY2xhcmF0aW9ucyBmb3IgdGhlIG5lZWRlZCBzdHJ1Y3R1cmVzLgoKUmVwb3J0ZWQtYnk6
IGtidWlsZCB0ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBSdWkgTWln
dWVsIFNpbHZhIDxydWkuc2lsdmFAbGluYXJvLm9yZz4KLS0tCnYxLT52MjoKSm9oYW4gSG92b2xk
OgogIC0gdXNlIGZvcndhcmQgZGVjbGFyYXRpb25zIGluc3RlYWQgaW5jbHVkaW5nIGFsbCBoZWFk
ZXJzCgogaW5jbHVkZS9saW51eC9ncmV5YnVzL29wZXJhdGlvbi5oIHwgMiArLQogaW5jbHVkZS9s
aW51eC9ncmV5YnVzL3N2Yy5oICAgICAgIHwgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2dyZXli
dXMvb3BlcmF0aW9uLmggYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgKaW5kZXgg
OGNhODY0YmJhMjNlLi5jYjhlNGVmNDUyMjIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZ3Jl
eWJ1cy9vcGVyYXRpb24uaAorKysgYi9pbmNsdWRlL2xpbnV4L2dyZXlidXMvb3BlcmF0aW9uLmgK
QEAgLTE1LDcgKzE1LDcgQEAKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogI2luY2x1ZGUgPGxp
bnV4L3dvcmtxdWV1ZS5oPgogCi0KK3N0cnVjdCBnYl9ob3N0X2RldmljZTsKIHN0cnVjdCBnYl9v
cGVyYXRpb247CiAKIC8qIFRoZSBkZWZhdWx0IGFtb3VudCBvZiB0aW1lIGEgcmVxdWVzdCBpcyBn
aXZlbiB0byBjb21wbGV0ZSAqLwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9ncmV5YnVzL3N2
Yy5oIGIvaW5jbHVkZS9saW51eC9ncmV5YnVzL3N2Yy5oCmluZGV4IDUwN2Y4YmQ0ZTRjOC4uNWFm
YWY1ZjA2ODU2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2dyZXlidXMvc3ZjLmgKKysrIGIv
aW5jbHVkZS9saW51eC9ncmV5YnVzL3N2Yy5oCkBAIC0xMiw2ICsxMiw4IEBACiAjaW5jbHVkZSA8
bGludXgvdHlwZXMuaD4KICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KIAorc3RydWN0IGdiX3N2
Y19sMl90aW1lcl9jZmc7CisKICNkZWZpbmUgR0JfU1ZDX0NQT1JUX0ZMQUdfRTJFRkMJCUJJVCgw
KQogI2RlZmluZSBHQl9TVkNfQ1BPUlRfRkxBR19DU0RfTgkJQklUKDEpCiAjZGVmaW5lIEdCX1NW
Q19DUE9SVF9GTEFHX0NTVl9OCQlCSVQoMikKLS0gCjIuMjIuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0Cmdy
ZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxt
YW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
