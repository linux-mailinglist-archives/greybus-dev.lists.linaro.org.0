Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id E78B02E0B05
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Dec 2020 14:45:00 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8057466783
	for <lists+greybus-dev@lfdr.de>; Tue, 22 Dec 2020 13:44:59 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 77F9B66754; Tue, 22 Dec 2020 13:43:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,RDNS_NONE,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C7AEB66752;
	Tue, 22 Dec 2020 13:43:06 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 8D0046673D
 for <greybus-dev@lists.linaro.org>; Tue, 15 Dec 2020 14:53:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 7358E66740; Tue, 15 Dec 2020 14:53:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (unknown [63.128.21.124])
 by lists.linaro.org (Postfix) with ESMTPS id 3EA6E6673D
 for <greybus-dev@lists.linaro.org>; Tue, 15 Dec 2020 14:53:14 +0000 (UTC)
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-12-V8rVZwjZNGOr8d5SLoR5Dg-1; Tue, 15 Dec 2020 09:53:12 -0500
X-MC-Unique: V8rVZwjZNGOr8d5SLoR5Dg-1
Received: by mail-qt1-f200.google.com with SMTP id e14so14496796qtr.8
 for <greybus-dev@lists.linaro.org>; Tue, 15 Dec 2020 06:53:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ompx6jQ8zGERoq0RC6yve0+nHkEYL2wxaj8e3jFemHI=;
 b=JY++85S6JwQbgYcyzTBpECIzeKFRO2E9OMwuPtzRSeg0O2hLe0Jw9yya3pfNJmLEQk
 fQ/J3T6SJuRSJPuMZEMRYEWfVgfj0dzAWANwOyC2KXU5xAjfY4ATMaDWPiChHeF6BtyN
 c4C+/CQnF8UUMlt0NIf0Ndz4OImuLHCNV94t+FTJoATlDuKcb2ChsTQOMcb590IVjOMv
 OCxBGPBYFOJdsqFlpKG0Pn1h1Hi0/gk/JNehm6Jc8QmyA/oS4Wt5XxrA0z3uhU5se0O3
 c9mnICnI3hfenY9z6IuHVBmxjTMIgikc5l25ygoHGb3gVVLemQw6EhrO1kZd2z5M71NJ
 9bVg==
X-Gm-Message-State: AOAM531P8bRDlO0jpAy+QOv5hbgLlg1UP8ZRHvHExsvLRcj4fVS7nPqq
 7RypT9dr9CGE9vuWs9VKAjr/8hkjJJOps12H8ak+gOK2kG1YOE8n4Qh5Qx//DWQxMgT5aO+SDs9
 Kg8ti+sQOsZkKsGixa4dKZPbY
X-Received: by 2002:a37:4a90:: with SMTP id
 x138mr40235618qka.186.1608043991752; 
 Tue, 15 Dec 2020 06:53:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwpXzQKMn+/7g/okl1FhtOglvIXN986uZb3Ek+BsWSPZKBONAGFHOLfAhOMToD/UhaCvlRdBw==
X-Received: by 2002:a37:4a90:: with SMTP id
 x138mr40235598qka.186.1608043991537; 
 Tue, 15 Dec 2020 06:53:11 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com.
 [75.142.250.213])
 by smtp.gmail.com with ESMTPSA id r201sm17185721qka.114.2020.12.15.06.53.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:53:10 -0800 (PST)
From: trix@redhat.com
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Tue, 15 Dec 2020 06:53:06 -0800
Message-Id: <20201215145306.1901598-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 22 Dec 2020 13:40:34 +0000
Cc: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org,
 Tom Rix <trix@redhat.com>
Subject: [greybus-dev] [PATCH] greybus: remove h from printk format specifier
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

RnJvbTogVG9tIFJpeCA8dHJpeEByZWRoYXQuY29tPgoKU2VlIERvY3VtZW50YXRpb24vY29yZS1h
cGkvcHJpbnRrLWZvcm1hdHMucnN0LgpoIHNob3VsZCBubyBsb25nZXIgYmUgdXNlZCBpbiB0aGUg
Zm9ybWF0IHNwZWNpZmllciBmb3IgcHJpbnRrLgoKU2lnbmVkLW9mZi1ieTogVG9tIFJpeCA8dHJp
eEByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3JleWJ1cy9ncmV5YnVzX3RyYWNlLmggfCA2ICsr
Ky0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvZ3JleWJ1c190cmFjZS5oIGIvZHJpdmVycy9ncmV5
YnVzL2dyZXlidXNfdHJhY2UuaAppbmRleCAxYmM5ZjEyNzVjNjUuLjYxNmEzYmQ2MWFhNiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncmV5YnVzL2dyZXlidXNfdHJhY2UuaAorKysgYi9kcml2ZXJzL2dy
ZXlidXMvZ3JleWJ1c190cmFjZS5oCkBAIC00MCw3ICs0MCw3IEBAIERFQ0xBUkVfRVZFTlRfQ0xB
U1MoZ2JfbWVzc2FnZSwKIAkJX19lbnRyeS0+cmVzdWx0ID0gbWVzc2FnZS0+aGVhZGVyLT5yZXN1
bHQ7CiAJKSwKIAotCVRQX3ByaW50aygic2l6ZT0laHUgb3BlcmF0aW9uX2lkPTB4JTA0eCB0eXBl
PTB4JTAyeCByZXN1bHQ9MHglMDJ4IiwKKwlUUF9wcmludGsoInNpemU9JXUgb3BlcmF0aW9uX2lk
PTB4JTA0eCB0eXBlPTB4JTAyeCByZXN1bHQ9MHglMDJ4IiwKIAkJICBfX2VudHJ5LT5zaXplLCBf
X2VudHJ5LT5vcGVyYXRpb25faWQsCiAJCSAgX19lbnRyeS0+dHlwZSwgX19lbnRyeS0+cmVzdWx0
KQogKTsKQEAgLTMxNyw3ICszMTcsNyBAQCBERUNMQVJFX0VWRU5UX0NMQVNTKGdiX2ludGVyZmFj
ZSwKIAkJX19lbnRyeS0+bW9kZV9zd2l0Y2ggPSBpbnRmLT5tb2RlX3N3aXRjaDsKIAkpLAogCi0J
VFBfcHJpbnRrKCJpbnRmX2lkPSVoaHUgZGV2aWNlX2lkPSVoaHUgbW9kdWxlX2lkPSVoaHUgRD0l
ZCBKPSVkIEE9JWQgRT0lZCBNPSVkIiwKKwlUUF9wcmludGsoImludGZfaWQ9JXUgZGV2aWNlX2lk
PSV1IG1vZHVsZV9pZD0ldSBEPSVkIEo9JWQgQT0lZCBFPSVkIE09JWQiLAogCQlfX2VudHJ5LT5p
ZCwgX19lbnRyeS0+ZGV2aWNlX2lkLCBfX2VudHJ5LT5tb2R1bGVfaWQsCiAJCV9fZW50cnktPmRp
c2Nvbm5lY3RlZCwgX19lbnRyeS0+ZWplY3RlZCwgX19lbnRyeS0+YWN0aXZlLAogCQlfX2VudHJ5
LT5lbmFibGVkLCBfX2VudHJ5LT5tb2RlX3N3aXRjaCkKQEAgLTM5MSw3ICszOTEsNyBAQCBERUNM
QVJFX0VWRU5UX0NMQVNTKGdiX21vZHVsZSwKIAkJX19lbnRyeS0+ZGlzY29ubmVjdGVkID0gbW9k
dWxlLT5kaXNjb25uZWN0ZWQ7CiAJKSwKIAotCVRQX3ByaW50aygiaGRfYnVzX2lkPSVkIG1vZHVs
ZV9pZD0laGh1IG51bV9pbnRlcmZhY2VzPSV6dSBkaXNjb25uZWN0ZWQ9JWQiLAorCVRQX3ByaW50
aygiaGRfYnVzX2lkPSVkIG1vZHVsZV9pZD0ldSBudW1faW50ZXJmYWNlcz0lenUgZGlzY29ubmVj
dGVkPSVkIiwKIAkJX19lbnRyeS0+aGRfYnVzX2lkLCBfX2VudHJ5LT5tb2R1bGVfaWQsCiAJCV9f
ZW50cnktPm51bV9pbnRlcmZhY2VzLCBfX2VudHJ5LT5kaXNjb25uZWN0ZWQpCiApOwotLSAKMi4y
Ny4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5
YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczov
L2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
