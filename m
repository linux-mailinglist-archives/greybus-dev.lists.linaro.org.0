Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EA431CB7D
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 14:54:02 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8399E6600D
	for <lists+greybus-dev@lfdr.de>; Tue, 16 Feb 2021 13:54:01 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 773E166518; Tue, 16 Feb 2021 13:54:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1DA3866769;
	Tue, 16 Feb 2021 13:52:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id ABBF7607B9
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 04:11:21 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 9B365622F6; Tue, 16 Feb 2021 04:11:21 +0000 (UTC)
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
 [209.85.215.180])
 by lists.linaro.org (Postfix) with ESMTPS id B4275607B9
 for <greybus-dev@lists.linaro.org>; Tue, 16 Feb 2021 04:11:20 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id t25so5454914pga.2
 for <greybus-dev@lists.linaro.org>; Mon, 15 Feb 2021 20:11:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ebIyPnM1xttcLSuKTuGcbjybRJNODZdNu83i7vwhwcA=;
 b=acv3mQmaY2tTlvXDMt0h3Zv2EMIposOivFSCvOEqGjJXeYX9Buh388MWMpmumf8p4y
 9TxWlXsBuwU/1Fz9Ctx2JQ2SmCSkzAJYuI6BbZe+OFJSTXpd4eoeA35MRUE8JUJtf9Qe
 IN48s76umGWNOD8t6HH1EChe+/526cNSqmutSbkyybpavyMsFmHdkV8RLL2dXE9b+smE
 lLVOLeqh3+VkS4gIf/A1NUqdeOcyOcND/IqkYWMBIYhPbi4XrQv7gie41QWJ1t8wf7Ou
 7dAf0jrLvoADxrFLrFjnn2qTxJ+sISUt2iSjO+y/J6wkBYGakFkUlgrAS6zbLttKOhV6
 GVlw==
X-Gm-Message-State: AOAM532mYgLB6RE18LqYu8+Sguo2bx0tozQ/SVF3u9BG9WodkqtYwM9g
 VwlisvkFpAN5wZV+dSWf4y0=
X-Google-Smtp-Source: ABdhPJw8fbU9OjrAhu6G/i7O4NLkHLLkiBo4QCvV+GdwFNflZS9ijznZ334BXgSKB7flcSB9fAeN8A==
X-Received: by 2002:a63:4621:: with SMTP id t33mr1782005pga.22.1613448680062; 
 Mon, 15 Feb 2021 20:11:20 -0800 (PST)
Received: from ThinkCentre-M83.c.infrastructure-904.internal
 ([202.133.196.154])
 by smtp.gmail.com with ESMTPSA id 9sm20362024pgw.61.2021.02.15.20.11.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 20:11:19 -0800 (PST)
From: Du Cheng <ducheng2@gmail.com>
To: Bryan O'Donoghue <pure.logic@nexus-software.ie>
Date: Tue, 16 Feb 2021 12:11:14 +0800
Message-Id: <20210216041114.133574-1-ducheng2@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Tue, 16 Feb 2021 13:52:33 +0000
Cc: greybus-dev@lists.linaro.org
Subject: [greybus-dev] [PATCH] checkpatch: fix coding style of macro:
	gb_loopback_stats_attrs
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

V3JhcCB0aGUgbXVsdGktbGluZSBkZWZpbml0aW9uIGluc2lkZSBhIGRvIHt9IHdoaWxlKDApIGJs
b2NrLCBpbgpjb21wbGlhbmNlIHRvIHNjcmlwdHMvY2hlY2twYXRjaC5wbC4KClNpZ25lZC1vZmYt
Ynk6IER1IENoZW5nIDxkdWNoZW5nMkBnbWFpbC5jb20+Ci0tLQogZHJpdmVycy9zdGFnaW5nL2dy
ZXlidXMvbG9vcGJhY2suYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xv
b3BiYWNrLmMgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9sb29wYmFjay5jCmluZGV4IDI0NzE0
NDhiYTQyYS4uOWFlMTU0OTA4ZWM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9sb29wYmFjay5jCisrKyBiL2RyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2xvb3BiYWNrLmMKQEAg
LTE2Myw5ICsxNjMsMTEgQEAgc3RhdGljIHNzaXplX3QgbmFtZSMjX2F2Z19zaG93KHN0cnVjdCBk
ZXZpY2UgKmRldiwJCVwKIHN0YXRpYyBERVZJQ0VfQVRUUl9STyhuYW1lIyNfYXZnKQogCiAjZGVm
aW5lIGdiX2xvb3BiYWNrX3N0YXRzX2F0dHJzKGZpZWxkKQkJCQlcCitkbyB7ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAogCWdiX2xvb3BiYWNrX3JvX3N0
YXRzX2F0dHIoZmllbGQsIG1pbiwgdSk7CQlcCiAJZ2JfbG9vcGJhY2tfcm9fc3RhdHNfYXR0cihm
aWVsZCwgbWF4LCB1KTsJCVwKLQlnYl9sb29wYmFja19yb19hdmdfYXR0cihmaWVsZCkKKwlnYl9s
b29wYmFja19yb19hdmdfYXR0cihmaWVsZCk7ICAgICAgICAgICAgICAgICBcCit9IHdoaWxlICgw
KQogCiAjZGVmaW5lIGdiX2xvb3BiYWNrX2F0dHIoZmllbGQsIHR5cGUpCQkJCQlcCiBzdGF0aWMg
c3NpemVfdCBmaWVsZCMjX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAkJCQlcCi0tIAoyLjI3LjAK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMt
ZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8vbGlz
dHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
