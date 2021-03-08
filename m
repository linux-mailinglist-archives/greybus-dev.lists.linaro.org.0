Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BEA331F6D
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:41:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7EC1D66783
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:41:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6AD3266793; Tue,  9 Mar 2021 06:41:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 87209667A9;
	Tue,  9 Mar 2021 06:39:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D890A60631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:36 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id C5DFF665AA; Mon,  8 Mar 2021 14:55:36 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
 by lists.linaro.org (Postfix) with ESMTPS id A17F260631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:34 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id w9so15125748edc.11
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Io9v2GBIlHI+Tmp+Muo2ozOuxnB5JlN/m/peVkSOoQk=;
 b=Yl58fJ1nxP2GdY/PQFH/t4xKwfdCOFdRfnzBG5jvupdZi85OBdo/f4TYjomhoqQ6y6
 v46BzG0+ns4MNQcecvWfOnBoy8Hfbv3RMuJCUPPPdf6UIiASAqOeBcverPHmNJgo3kLd
 CK/yGiAKxf8IQor9TUD+xdrb3tHKfRZOlYXRAS3RQgmbxIwvzi6+Gw1+Rj6+AqLx9+pY
 3GWkAd7R3DFO4fGkK+0CanG4BBuDIe8MNbGcKv3HveOYTN8BI4Entl4WKRJYsRh25if1
 AwfKsFdsuapRQiueudB2CbrNEMxlyI+hvlGKlTEJDB7cYZvESMqqdKUGid9tKItXTLCO
 heEQ==
X-Gm-Message-State: AOAM533keLjfWgSMYBSJ1JOS/chDq0mWEWcCVpKfpvuRlQoioBQp/6iv
 JYkLQ0kMXN7NUePhvmk/40kp+w==
X-Google-Smtp-Source: ABdhPJzOxDsiKTJZFzssNH71mhV3dmH3qpwIBVJVNeEVFcuravA0h+m9Fy72NPjkwyy5NAtefvkZcw==
X-Received: by 2002:a05:6402:2076:: with SMTP id
 bd22mr22161922edb.378.1615215333831; 
 Mon, 08 Mar 2021 06:55:33 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:33 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:58 +0200
Message-Id: <20210308145502.1075689-7-aardelean@deviqon.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210308145502.1075689-1-aardelean@deviqon.com>
References: <20210308145502.1075689-1-aardelean@deviqon.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 09 Mar 2021 06:39:38 +0000
Cc: thierry.reding@gmail.com, elder@kernel.org, johan@kernel.org,
 jonathanh@nvidia.com, broonie@kernel.org, ldewangan@nvidia.com,
 Alexandru Ardelean <aardelean@deviqon.com>, vireshk@kernel.org,
 f.fainelli@gmail.com, linux@deviqon.com
Subject: [greybus-dev] [PATCH 06/10] staging: greybus: spilib: use
	'spi_delay_to_ns' for getting xfer delay
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

VGhlIGludGVudCBpcyB0aGUgcmVtb3ZhbCBvZiB0aGUgJ2RlbGF5X3VzZWNzJyBmaWVsZCBmcm9t
IHRoZQpzcGlfdHJhbnNmZXIgc3RydWN0LCBhcyB0aGVyZSBpcyBhICdkZWxheScgZmllbGQgdGhh
dCBkb2VzIHRoZSBzYW1lCnRoaW5nLgoKVGhlIHNwaV9kZWxheV90b19ucygpIGNhbiBiZSB1c2Vk
IHRvIGdldCB0aGUgdHJhbnNmZXIgZGVsYXkuIEl0IHdvcmtzIGJ5CnVzaW5nIHRoZSAnZGVsYXlf
dXNlY3MnIGZpZWxkIGZpcnN0IChpZiBpdCBpcyBub24temVybyksIGFuZCBmaW5hbGx5CnVzZXMg
dGhlICdkZWxheScgZmllbGQuCgpTaW5jZSB0aGUgJ2RlbGF5X3VzZWNzJyBmaWVsZCBpcyBnb2lu
ZyBhd2F5LCB0aGlzIGNoYW5nZSBtYWtlcyB1c2Ugb2YgdGhlCnNwaV9kZWxheV90b19ucygpIGZ1
bmN0aW9uLiBUaGlzIGFsc28gbWVhbnMgZGl2aWRpbmcgdGhlIHJldHVybiB2YWx1ZSBvZgp0aGUg
ZnVuY3Rpb24gYnkgMTAwMCwgdG8gY29udmVydCBpdCB0byBtaWNyb3NlY29uZHMuClRvIHByZXZl
bnQgYW55IHBvdGVudGlhbCBmYXVsdHMgd2hlbiBjb252ZXJ0aW5nIHRvIG1pY3Jvc2Vjb25kcyBh
bmQgc2luY2UKdGhlIHJlc3VsdCBvZiBzcGlfZGVsYXlfdG9fbnMoKSBpcyBpbnQsIHRoZSBkZWxh
eSBpcyBiZWluZyBjb21wdXRlZCBpbiAzMgpiaXRzIGFuZCB0aGVuIGNsYW1wZWQgYmV0d2VlbiAw
ICYgVTE2X01BWC4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWFyZGVsZWFu
QGRldmlxb24uY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jIHwgNSAr
KysrLQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jIGIvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvc3BpbGliLmMKaW5kZXggNjcyZDU0MGQzMzY1Li4zMDY1NTE1M2RmNmEgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jCisrKyBiL2RyaXZlcnMv
c3RhZ2luZy9ncmV5YnVzL3NwaWxpYi5jCkBAIC0yNDUsNiArMjQ1LDcgQEAgc3RhdGljIHN0cnVj
dCBnYl9vcGVyYXRpb24gKmdiX3NwaV9vcGVyYXRpb25fY3JlYXRlKHN0cnVjdCBnYl9zcGlsaWIg
KnNwaSwKIAkvKiBGaWxsIGluIHRoZSB0cmFuc2ZlcnMgYXJyYXkgKi8KIAl4ZmVyID0gc3BpLT5m
aXJzdF94ZmVyOwogCXdoaWxlIChtc2ctPnN0YXRlICE9IEdCX1NQSV9TVEFURV9PUF9ET05FKSB7
CisJCWludCB4ZmVyX2RlbGF5OwogCQlpZiAoeGZlciA9PSBzcGktPmxhc3RfeGZlcikKIAkJCXhm
ZXJfbGVuID0gc3BpLT5sYXN0X3hmZXJfc2l6ZTsKIAkJZWxzZQpAQCAtMjU5LDcgKzI2MCw5IEBA
IHN0YXRpYyBzdHJ1Y3QgZ2Jfb3BlcmF0aW9uICpnYl9zcGlfb3BlcmF0aW9uX2NyZWF0ZShzdHJ1
Y3QgZ2Jfc3BpbGliICpzcGksCiAKIAkJZ2JfeGZlci0+c3BlZWRfaHogPSBjcHVfdG9fbGUzMih4
ZmVyLT5zcGVlZF9oeik7CiAJCWdiX3hmZXItPmxlbiA9IGNwdV90b19sZTMyKHhmZXJfbGVuKTsK
LQkJZ2JfeGZlci0+ZGVsYXlfdXNlY3MgPSBjcHVfdG9fbGUxNih4ZmVyLT5kZWxheV91c2Vjcyk7
CisJCXhmZXJfZGVsYXkgPSBzcGlfZGVsYXlfdG9fbnMoJnhmZXItPmRlbGF5LCB4ZmVyKSAvIDEw
MDA7CisJCXhmZXJfZGVsYXkgPSBjbGFtcF90KHUxNiwgeGZlcl9kZWxheSwgMCwgVTE2X01BWCk7
CisJCWdiX3hmZXItPmRlbGF5X3VzZWNzID0gY3B1X3RvX2xlMTYoeGZlcl9kZWxheSk7CiAJCWdi
X3hmZXItPmNzX2NoYW5nZSA9IHhmZXItPmNzX2NoYW5nZTsKIAkJZ2JfeGZlci0+Yml0c19wZXJf
d29yZCA9IHhmZXItPmJpdHNfcGVyX3dvcmQ7CiAKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0
CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21h
aWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
