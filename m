Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id A097C182E8B
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 12:03:38 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C33D7609B3
	for <lists+greybus-dev@lfdr.de>; Thu, 12 Mar 2020 11:03:37 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B764960BE7; Thu, 12 Mar 2020 11:03:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 135E16189D;
	Thu, 12 Mar 2020 11:03:04 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 7820160C10
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6B68160E9E; Thu, 12 Mar 2020 11:02:58 +0000 (UTC)
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
 [209.85.167.68])
 by lists.linaro.org (Postfix) with ESMTPS id CB23460C10
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 11:02:28 +0000 (UTC)
Received: by mail-lf1-f68.google.com with SMTP id v8so3502877lfe.2
 for <greybus-dev@lists.linaro.org>; Thu, 12 Mar 2020 04:02:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y0gf9nMkz8jNTUgSUmsyUitRVxnbwlxPriCRXIfta74=;
 b=tzMQoFfCokLM8NAynXywPowyqBhrDPpFY++fqtbISNAtKbaixeGVwxQJhQFvIaI1i3
 ajk4wcegbu6BKaQYhkmG88xwY+T8NyL1mh6A3pfSJuPS4cok6CrSkkJN6Vl+qrCijIL8
 /YOXsShknLzJt838G5yno1FLoUgnln+IwimYrRLvx51wimgqUGr8vEfat5mV+ibtsrMP
 nepGjZ22/Xh37JcwQ6KQLPqk1TszfvK280aZ7CRnKjrYceCjOMsIHx05fYjicJSe6Emj
 S3Ulp5yUZstSFJDB6XaYCTXlrWshBG267nJxkrx9z+YwMAiTvJcZHPaU/6qGT6nbpRX5
 0m6w==
X-Gm-Message-State: ANhLgQ01XRWk6ZiqoMYMzcrHR1ol2+PGpFZEKKMxpEo/iXbcCrwe6vMM
 U73tCAdyaJdrV+FnjnzkVSLR35gD
X-Google-Smtp-Source: ADFU+vvQ1bXXJ25BFPPSH7DGiFmSZv25BlmnfXv7XwYE3ZUPwjwP4v9+8zv/blCyHOLkYopDXnMfTg==
X-Received: by 2002:a19:ae03:: with SMTP id f3mr5158733lfc.28.1584010947720;
 Thu, 12 Mar 2020 04:02:27 -0700 (PDT)
Received: from xi.terra (c-12aae455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.170.18])
 by smtp.gmail.com with ESMTPSA id n7sm6309933lfi.5.2020.03.12.04.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2020 04:02:26 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92.3)
 (envelope-from <johan@xi.terra>)
 id 1jCLbS-0005kH-GI; Thu, 12 Mar 2020 12:02:14 +0100
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Thu, 12 Mar 2020 12:01:49 +0100
Message-Id: <20200312110151.22028-2-johan@kernel.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200312110151.22028-1-johan@kernel.org>
References: <20200312110151.22028-1-johan@kernel.org>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 Johan Hovold <johan@kernel.org>, stable <stable@vger.kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH 1/3] staging: greybus: loopback_test: fix
	poll-mask build breakage
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

QSBzY3JpcHRlZCBjb252ZXJzaW9uIGZyb20gdXNlcmxhbmQgUE9MTCogdG8ga2VybmVsIEVQT0xM
KiBjb25zdGFudHMKbWlzdGFraW5nbHkgcmVwbGFjZWQgdGhlIHBvbGwgZmxhZ3MgaW4gdGhlIGxv
b3BiYWNrX3Rlc3QgdG9vbCwgd2hpY2gKdGhlcmVmb3JlIG5vIGxvbmdlciBidWlsZHMuCgpGaXhl
czogYTlhMDg4NDVlOWFjICgidmZzOiBkbyBidWxrIFBPTEwqIC0+IEVQT0xMKiByZXBsYWNlbWVu
dCIpCkNjOiBzdGFibGUgPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICAgICAjIDQuMTYKU2lnbmVk
LW9mZi1ieTogSm9oYW4gSG92b2xkIDxqb2hhbkBrZXJuZWwub3JnPgotLS0KIGRyaXZlcnMvc3Rh
Z2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNrX3Rlc3QuYyB8IDQgKystLQogMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMgYi9kcml2ZXJzL3N0YWdpbmcv
Z3JleWJ1cy90b29scy9sb29wYmFja190ZXN0LmMKaW5kZXggYmE2ZjkwNWYyNmZhLi40MWUxODIw
ZDlhYzkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL3Rvb2xzL2xvb3BiYWNr
X3Rlc3QuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190ZXN0
LmMKQEAgLTY1NSw3ICs2NTUsNyBAQCBzdGF0aWMgaW50IG9wZW5fcG9sbF9maWxlcyhzdHJ1Y3Qg
bG9vcGJhY2tfdGVzdCAqdCkKIAkJCWdvdG8gZXJyOwogCQl9CiAJCXJlYWQodC0+ZmRzW2Zkc19p
ZHhdLmZkLCAmZHVtbXksIDEpOwotCQl0LT5mZHNbZmRzX2lkeF0uZXZlbnRzID0gRVBPTExFUlJ8
RVBPTExQUkk7CisJCXQtPmZkc1tmZHNfaWR4XS5ldmVudHMgPSBQT0xMRVJSIHwgUE9MTFBSSTsK
IAkJdC0+ZmRzW2Zkc19pZHhdLnJldmVudHMgPSAwOwogCQlmZHNfaWR4Kys7CiAJfQpAQCAtNzQ4
LDcgKzc0OCw3IEBAIHN0YXRpYyBpbnQgd2FpdF9mb3JfY29tcGxldGUoc3RydWN0IGxvb3BiYWNr
X3Rlc3QgKnQpCiAJCX0KIAogCQlmb3IgKGkgPSAwOyBpIDwgdC0+cG9sbF9jb3VudDsgaSsrKSB7
Ci0JCQlpZiAodC0+ZmRzW2ldLnJldmVudHMgJiBFUE9MTFBSSSkgeworCQkJaWYgKHQtPmZkc1tp
XS5yZXZlbnRzICYgUE9MTFBSSSkgewogCQkJCS8qIER1bW15IHJlYWQgdG8gY2xlYXIgdGhlIGV2
ZW50ICovCiAJCQkJcmVhZCh0LT5mZHNbaV0uZmQsICZkdW1teSwgMSk7CiAJCQkJbnVtYmVyX29m
X2V2ZW50cysrOwotLSAKMi4yNC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMu
bGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5
YnVzLWRldgo=
