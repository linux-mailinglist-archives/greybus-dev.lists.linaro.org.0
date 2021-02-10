Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 6339D318457
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 05:28:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8B66E60C36
	for <lists+greybus-dev@lfdr.de>; Thu, 11 Feb 2021 04:28:06 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7A8A2665EF; Thu, 11 Feb 2021 04:28:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 52C346675C;
	Thu, 11 Feb 2021 04:27:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 1169B66520
 for <greybus-dev@lists.linaro.org>; Wed, 10 Feb 2021 22:14:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 02FA766034; Wed, 10 Feb 2021 22:14:58 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by lists.linaro.org (Postfix) with ESMTPS id E469D66034
 for <greybus-dev@lists.linaro.org>; Wed, 10 Feb 2021 22:14:56 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id q2so4892183edi.4
 for <greybus-dev@lists.linaro.org>; Wed, 10 Feb 2021 14:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rqc/GNzS3OhAYcsjBHiaYbzkuH2zCrmHds0Gceno4C4=;
 b=BJsVgYgmAQgwdigSAvB4n8V9J5vzudoHhzQ3tHd06q9run/xTAGPVMxpCdWmUl5dVL
 R5/iUA02U4wRGKuQ0h4a3pGVE4EPvJQCtTwmr9QtFJFSb8aDizItofrJBVvUk1ZdEUUj
 MPVOcPUysSb7UU/r1hlXz3zTYh+a/Hl+f3dpfWsUkFkXVvnll9Qxh0gCCxyEYXe4QrjT
 Utv/5BtEHzAxT5ASeIhtiYR0kwmBxW4rlDVA5Aqy+pfZkrxJt8tro9k2RsMGuv3N56a6
 QJlFJQV6S6bm1D7/SpIcvxhd0LzLrUpmBZ6GomBxtW14m0JyasGMxVfV+TDBue9Sh9j+
 9m/Q==
X-Gm-Message-State: AOAM531Qom5lW6MHGujShadMZaEl0cP8OyYH0D7sv+aqz+WkWv5CFMCS
 IvNFXRMd3CZiD4JfJ8yiVQ8=
X-Google-Smtp-Source: ABdhPJwuC4q7QPIxZVE9dlElpGqJ1xYm+4iq1/sN4CEJTcgXM8gpWe6TrvOGrsyMsZUAV+V4+mVu4g==
X-Received: by 2002:a05:6402:1589:: with SMTP id
 c9mr5441722edv.282.1612995296012; 
 Wed, 10 Feb 2021 14:14:56 -0800 (PST)
Received: from TRWS9215.usr.ingenico.loc ([78.190.146.52])
 by smtp.gmail.com with ESMTPSA id b3sm2130578edw.14.2021.02.10.14.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 14:14:55 -0800 (PST)
From: Fatih YILDIRIM <yildirim.fatih@gmail.com>
To: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Date: Thu, 11 Feb 2021 01:14:39 +0300
Message-Id: <20210210221439.3489-2-yildirim.fatih@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210210221439.3489-1-yildirim.fatih@gmail.com>
References: <20210210221439.3489-1-yildirim.fatih@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 11 Feb 2021 04:27:39 +0000
Cc: devel@driverdev.osuosl.org, greybus-dev@lists.linaro.org,
 linux-kernel@vger.kernel.org, yildirim.fatih@gmail.com
Subject: [greybus-dev] [PATCH 1/1] Macros with multiple statements should be
	enclosed in a do - while loop.
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

U2lnbmVkLW9mZi1ieTogRmF0aWggWUlMRElSSU0gPHlpbGRpcmltLmZhdGloQGdtYWlsLmNvbT4K
LS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jIHwgMTAgKysrKysrLS0tLQog
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jIGIvZHJpdmVycy9zdGFnaW5n
L2dyZXlidXMvbG9vcGJhY2suYwppbmRleCAyNDcxNDQ4YmE0MmEuLmM4OGVmM2U4OTRmYSAxMDA2
NDQKLS0tIGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvbG9vcGJhY2suYworKysgYi9kcml2ZXJz
L3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jCkBAIC0xNjIsMTAgKzE2MiwxMiBAQCBzdGF0aWMg
c3NpemVfdCBuYW1lIyNfYXZnX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAkJXAogfQkJCQkJCQkJ
CVwKIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhuYW1lIyNfYXZnKQogCi0jZGVmaW5lIGdiX2xvb3Bi
YWNrX3N0YXRzX2F0dHJzKGZpZWxkKQkJCQlcCi0JZ2JfbG9vcGJhY2tfcm9fc3RhdHNfYXR0cihm
aWVsZCwgbWluLCB1KTsJCVwKLQlnYl9sb29wYmFja19yb19zdGF0c19hdHRyKGZpZWxkLCBtYXgs
IHUpOwkJXAotCWdiX2xvb3BiYWNrX3JvX2F2Z19hdHRyKGZpZWxkKQorI2RlZmluZSBnYl9sb29w
YmFja19zdGF0c19hdHRycyhmaWVsZCkJCQkJCVwKKwlkbyB7CQkJCQkJCQlcCisJCWdiX2xvb3Bi
YWNrX3JvX3N0YXRzX2F0dHIoZmllbGQsIG1pbiwgdSk7CQlcCisJCWdiX2xvb3BiYWNrX3JvX3N0
YXRzX2F0dHIoZmllbGQsIG1heCwgdSk7CQlcCisJCWdiX2xvb3BiYWNrX3JvX2F2Z19hdHRyKGZp
ZWxkKTsJCQkJXAorCX0gd2hpbGUgKDApCiAKICNkZWZpbmUgZ2JfbG9vcGJhY2tfYXR0cihmaWVs
ZCwgdHlwZSkJCQkJCVwKIHN0YXRpYyBzc2l6ZV90IGZpZWxkIyNfc2hvdyhzdHJ1Y3QgZGV2aWNl
ICpkZXYsCQkJCVwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3Rz
LmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3Jl
eWJ1cy1kZXYK
