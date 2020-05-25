Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE831E1CFD
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 10:12:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 21B16614FE
	for <lists+greybus-dev@lfdr.de>; Tue, 26 May 2020 08:12:48 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 13C5B61805; Tue, 26 May 2020 08:12:48 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 591D765F92;
	Tue, 26 May 2020 08:11:00 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 5BFC3607A4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 06:11:55 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 4E20E608DF; Mon, 25 May 2020 06:11:55 +0000 (UTC)
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
 [209.85.222.193])
 by lists.linaro.org (Postfix) with ESMTPS id 65745607A4
 for <greybus-dev@lists.linaro.org>; Mon, 25 May 2020 06:11:49 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id f83so16585641qke.13
 for <greybus-dev@lists.linaro.org>; Sun, 24 May 2020 23:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9IziVmgyfYM4YsH6OqHb3uAGAVG/qg0TjTfH8HoMiuk=;
 b=mdV2aHbtYBkFsgRMsjxO55qu97wUYQ1f/FKYCHShRTiKu0VU5WM/0c/MxeVUpYF6GO
 dYhcO4DCVi/Tdso7DSPDGmLKxTYGJMqgVidlhEW4XChvA2W9Tb0QwnUr/roCtMxJ7lBq
 VuwK/BlL7cJaD38ECB5c4rCrYXO/pmcjP/hnGBq0OTjxlM1uOxJIR4NiXvKdPFrwzFRk
 6zaWcAqEr2yKF5W1lG80GcZpUWdu8KyIOyqr6LgtLRblIpEhEa/bS0g+Up49D3ndU18O
 PEKhMciToBVtn/vjCeqIMGHzdwOG03UHvi2iHoWISpFXRtGlh0RwVRR7KJfqUjQrTfAg
 ZGLg==
X-Gm-Message-State: AOAM531YE64/pQprmMRSsXaY/ccaqzVe2scuxSHx4w7FCUHWCZkn/E4a
 PJmprzFne593y5tq6OtMtg==
X-Google-Smtp-Source: ABdhPJz4W7rG9gQgXFStdiHwzFfGeyODFuXYL4YmkKJh6WuzG4oJm1BVoOlr5k6sYisCAknLIRAiwg==
X-Received: by 2002:a37:2783:: with SMTP id
 n125mr24350464qkn.335.1590387108835; 
 Sun, 24 May 2020 23:11:48 -0700 (PDT)
Received: from localhost (cpe-104-162-195-29.nyc.res.rr.com. [104.162.195.29])
 by smtp.gmail.com with ESMTPSA id
 193sm2045786qkn.94.2020.05.24.23.11.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 May 2020 23:11:48 -0700 (PDT)
From: Till Varoquaux <till.varoquaux@gmail.com>
To: kernel-janitors@vger.kernel.org,
	pure.logic@nexus-software.ie
Date: Mon, 25 May 2020 02:10:43 -0400
Message-Id: <20200518051314.1785567-1-till.varoquaux@gmail.com>
X-Mailer: git-send-email 2.25.4
Received: from localhost (cpe-104-162-195-29.nyc.res.rr.com. [104.162.195.29])
 by smtp.gmail.com with ESMTPSA id e3sm8401074qtj.25.2020.05.17.22.13.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 17 May 2020 22:13:55 -0700 (PDT)
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 26 May 2020 08:10:58 +0000
Cc: devel@driverdev.osuosl.org, Alex Elder <elder@kernel.org>,
 trivial@kernel.org, Till Varoquaux <till.varoquaux@gmail.com>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH] staging: greybus: loopback: fix a spelling
	error.
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

U3VjY2Vzc2VkIC0+IHN1Y2NlZWRlZC4KClNpZ25lZC1vZmYtYnk6IFRpbGwgVmFyb3F1YXV4IDx0
aWxsLnZhcm9xdWF1eEBnbWFpbC5jb20+CgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xv
b3BiYWNrLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jIGIv
ZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYwppbmRleCA1ODNkOTcwOGExOTEuLjI0
NzE0NDhiYTQyYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2su
YworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jCkBAIC0xMzUsNyArMTM1
LDcgQEAgc3RhdGljIHNzaXplX3QgbmFtZSMjXyMjZmllbGQjI19zaG93KHN0cnVjdCBkZXZpY2Ug
KmRldiwJXAogCQkJICAgIGNoYXIgKmJ1ZikJCQkJCVwKIHsJCQkJCQkJCQlcCiAJc3RydWN0IGdi
X2xvb3BiYWNrICpnYiA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwkJCVwKLQkvKiBSZXBvcnQgMCBm
b3IgbWluIGFuZCBtYXggaWYgbm8gdHJhbnNmZXIgc3VjY2Vzc2VkICovCQlcCisJLyogUmVwb3J0
IDAgZm9yIG1pbiBhbmQgbWF4IGlmIG5vIHRyYW5zZmVyIHN1Y2NlZWRlZCAqLwkJXAogCWlmICgh
Z2ItPnJlcXVlc3RzX2NvbXBsZXRlZCkJCQkJCVwKIAkJcmV0dXJuIHNwcmludGYoYnVmLCAiMFxu
Iik7CQkJCVwKIAlyZXR1cm4gc3ByaW50ZihidWYsICIlIiAjdHlwZSAiXG4iLCBnYi0+bmFtZS5m
aWVsZCk7CQlcCi0tIAoyLjI1LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5s
aW5hcm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXli
dXMtZGV2Cg==
