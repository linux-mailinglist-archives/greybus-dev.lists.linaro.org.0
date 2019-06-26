Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C21C35699E
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2019 14:45:22 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F1AA160F5B
	for <lists+greybus-dev@lfdr.de>; Wed, 26 Jun 2019 12:45:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id E0562615AF; Wed, 26 Jun 2019 12:45:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on
	ip-10-150-125-211.ec2.internal
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 108DC60EFE;
	Wed, 26 Jun 2019 12:45:13 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2B23F60F52
 for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2019 06:45:04 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 1431261513; Wed, 26 Jun 2019 06:45:04 +0000 (UTC)
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
 [209.85.214.194])
 by lists.linaro.org (Postfix) with ESMTPS id 2364460F52
 for <greybus-dev@lists.linaro.org>; Wed, 26 Jun 2019 06:45:03 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id bi6so850716plb.12
 for <greybus-dev@lists.linaro.org>; Tue, 25 Jun 2019 23:45:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZaPptmReQuzo4siTdAbVNE+klhm52Cm2tM2YAZ7O52s=;
 b=bUt6q2oZmMDLgF7ezyVf4QyJ6C6P/JkFdngvQFsCpAcWht3gPKoGEizmzUGYXoSK7P
 WzPixjhrdGeUInwx9JJPHp/dUtj1p+c2o90IxSpwL3s66luuZ8yIGzon+jrAm6KgplAz
 B/6BN6susX+fk8K6k5wWdR/XXLYjXN/Y3xJc+bPitekUQeiqwYDEe3qsfprTUtxMV8eo
 YVL36+ktivrkxGNdjV+djX0Izn7KTDB9my1a66U67C+edLpmEjjvWpE6CrQElQ6BmXSG
 XfZ/cDMt4rCu3ZC8Y60LDvAKy0R641HtgXeUENIGRUAtEEHxcG2JRCzou178UJ0Jl0BG
 xqmA==
X-Gm-Message-State: APjAAAXAqkqnHjJ2UKDw/9s3c3KIILqRCQpyedEY/IrcYyG3MTc4IYxy
 N74dfjId0VHv3hUoeTxXx14=
X-Google-Smtp-Source: APXvYqwiIk+6bkJjgOnNTjcJ7DXQLqws0hwPhj1sYHi8ZlHcXWKX0YSttzea+pxUDC/xPYl1JZfcbw==
X-Received: by 2002:a17:902:24c:: with SMTP id 70mr3526708plc.2.1561531502380; 
 Tue, 25 Jun 2019 23:45:02 -0700 (PDT)
Received: from localhost.localdomain ([110.227.94.173])
 by smtp.gmail.com with ESMTPSA id m6sm2378063pjl.18.2019.06.25.23.44.59
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 25 Jun 2019 23:45:01 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org
Date: Wed, 26 Jun 2019 12:14:50 +0530
Message-Id: <20190626064450.3062-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Wed, 26 Jun 2019 12:45:11 +0000
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [greybus-dev] [PATCH] staging: greybus: tools: Remove function
	log_csv_error()
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

UmVtb3ZlIHVudXNlZCBmdW5jdGlvbiBsb2dfY3N2X2Vycm9yLgpJc3N1ZSBmb3VuZCB3aXRoIENv
Y2NpbmVsbGUuCgpTaWduZWQtb2ZmLWJ5OiBOaXNoa2EgRGFzZ3VwdGEgPG5pc2hrYWRnLmxpbnV4
QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90b29scy9sb29wYmFja190
ZXN0LmMgfCA2IC0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jIGIvZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMvbG9vcGJhY2tfdGVzdC5jCmluZGV4IDJmYTg4MDky
NTE0ZC4uY2ViYzFkOTBhMTgwIDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy90
b29scy9sb29wYmFja190ZXN0LmMKKysrIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvdG9vbHMv
bG9vcGJhY2tfdGVzdC5jCkBAIC00MTQsMTIgKzQxNCw2IEBAIHN0YXRpYyBpbnQgZ2V0X3Jlc3Vs
dHMoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQpCiAJcmV0dXJuIDA7CiB9CiAKLXZvaWQgbG9nX2Nz
dl9lcnJvcihpbnQgbGVuLCBpbnQgZXJyKQotewotCWZwcmludGYoc3RkZXJyLCAidW5hYmxlIHRv
IHdyaXRlICVkIGJ5dGVzIHRvIGNzdiAlc1xuIiwgbGVuLAotCQlzdHJlcnJvcihlcnIpKTsKLX0K
LQogaW50IGZvcm1hdF9vdXRwdXQoc3RydWN0IGxvb3BiYWNrX3Rlc3QgKnQsCiAJCSAgc3RydWN0
IGxvb3BiYWNrX3Jlc3VsdHMgKnIsCiAJCSAgY29uc3QgY2hhciAqZGV2X25hbWUsCi0tIAoyLjE5
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
