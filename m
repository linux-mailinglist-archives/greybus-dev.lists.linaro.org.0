Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C77331F76
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:42:10 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E543A66783
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:42:09 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id D45BF66793; Tue,  9 Mar 2021 06:42:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 82E87667C0;
	Tue,  9 Mar 2021 06:39:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BC39460631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AD438618B9; Mon,  8 Mar 2021 14:55:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by lists.linaro.org (Postfix) with ESMTPS id 16C3366012
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:40 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id bm21so20930005ejb.4
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lLj7Gp4AXNBIRfM05Fb/npNKmdzGnIj+j8T+QIUmIp0=;
 b=FES1AJWu+HhtaIzwJRir/oM0hEHsk1uLIcEibN+q9oBMZBDJ57Du+f9mGK05a5g1OG
 L0Tjqnpyb7b7SO5QhInKOm36pktBU2VQOGo5nALnvS9YJzb/QL5s87KDW1AjPdOvOrf0
 igZPNek0Yd7WXCmqofhWFAQ4t062RSrqCU5gbtTzyCGWEVElLhKbfakLtRB7wCSwQBZQ
 AqXU6Rh9+FU4yfI6fQvTcXj1OBJG86o8eG4JlDIHskQ+9INNj12Yp85YJXUNxPqGni0O
 6lGswCcxi6ZcPCUDWWyebmK4/+/msmEQQAOqhUAN8Dk1YTkkA2azy/l3waq6GRi0M6sx
 aWVQ==
X-Gm-Message-State: AOAM533S7IeupJ0SQ+XsTtKZpclD7qkEN7ZnwhTJJUOUwAXJ5GdpFp6X
 NcvUrE5stTk2XKYdMOuWnKyc4w==
X-Google-Smtp-Source: ABdhPJwujoxKBULC2TiDF0uTmZ725nCMJDdNLnOASHbIowxRxu7/T7o0BEees1GbdUH3W536CdvnxQ==
X-Received: by 2002:a17:906:2804:: with SMTP id
 r4mr15241523ejc.521.1615215339299; 
 Mon, 08 Mar 2021 06:55:39 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:38 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:55:02 +0200
Message-Id: <20210308145502.1075689-11-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 10/10] spi: docs: update info about
	'delay_usecs'
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

VGhlICdkZWxheV91c2VjcycgZmllbGQgaXMgbm8gbG9uZ2VyIHByZXNlbnQgb24gdGhlIHNwaV90
cmFuc2ZlciBzdHJ1Y3QuClRoaXMgY2hhbmdlIHVwZGF0ZXMgdGhlIGRvYyB0byBtZW50aW9uIHRo
ZSB1c2FnZSBvZiB0aGUgKHJlbGF0aXZlbHkpIG5ldwonZGVsYXknIGZpZWxkLgoKU2lnbmVkLW9m
Zi1ieTogQWxleGFuZHJ1IEFyZGVsZWFuIDxhYXJkZWxlYW5AZGV2aXFvbi5jb20+Ci0tLQogRG9j
dW1lbnRhdGlvbi9zcGkvc3BpLXN1bW1hcnkucnN0IHwgNyArKysrKy0tCiAxIGZpbGUgY2hhbmdl
ZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL0RvY3VtZW50
YXRpb24vc3BpL3NwaS1zdW1tYXJ5LnJzdCBiL0RvY3VtZW50YXRpb24vc3BpL3NwaS1zdW1tYXJ5
LnJzdAppbmRleCBmMWRhZmZlMTBkNzguLmQ0MjM5MDI1NDYxZCAxMDA2NDQKLS0tIGEvRG9jdW1l
bnRhdGlvbi9zcGkvc3BpLXN1bW1hcnkucnN0CisrKyBiL0RvY3VtZW50YXRpb24vc3BpL3NwaS1z
dW1tYXJ5LnJzdApAQCAtNDExLDggKzQxMSwxMSBAQCBhbnkgbW9yZSBzdWNoIG1lc3NhZ2VzLgog
ICAgICAgICBkdXBsZXggKG9uZSBwb2ludGVyIGlzIE5VTEwpIHRyYW5zZmVyczsKIAogICAgICAg
KyBvcHRpb25hbGx5IGRlZmluaW5nIHNob3J0IGRlbGF5cyBhZnRlciB0cmFuc2ZlcnMgLi4uIHVz
aW5nCi0gICAgICAgIHRoZSBzcGlfdHJhbnNmZXIuZGVsYXlfdXNlY3Mgc2V0dGluZyAodGhpcyBk
ZWxheSBjYW4gYmUgdGhlCi0gICAgICAgIG9ubHkgcHJvdG9jb2wgZWZmZWN0LCBpZiB0aGUgYnVm
ZmVyIGxlbmd0aCBpcyB6ZXJvKTsKKyAgICAgICAgdGhlIHNwaV90cmFuc2Zlci5kZWxheS52YWx1
ZSBzZXR0aW5nICh0aGlzIGRlbGF5IGNhbiBiZSB0aGUKKyAgICAgICAgb25seSBwcm90b2NvbCBl
ZmZlY3QsIGlmIHRoZSBidWZmZXIgbGVuZ3RoIGlzIHplcm8pIC4uLgorICAgICAgICB3aGVuIHNw
ZWNpZnlpbmcgdGhpcyBkZWxheSB0aGUgZGVmYXVsdCBzcGlfdHJhbnNmZXIuZGVsYXkudW5pdAor
ICAgICAgICBpcyBtaWNyb3NlY29uZHMsIGhvd2V2ZXIgdGhpcyBjYW4gYmUgYWRqdXN0ZWQgdG8g
Y2xvY2sgY3ljbGVzCisgICAgICAgIG9yIG5hbm9zZWNvbmRzIGlmIG5lZWRlZDsKIAogICAgICAg
KyB3aGV0aGVyIHRoZSBjaGlwc2VsZWN0IGJlY29tZXMgaW5hY3RpdmUgYWZ0ZXIgYSB0cmFuc2Zl
ciBhbmQKICAgICAgICAgYW55IGRlbGF5IC4uLiBieSB1c2luZyB0aGUgc3BpX3RyYW5zZmVyLmNz
X2NoYW5nZSBmbGFnOwotLSAKMi4yOS4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlz
dHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9n
cmV5YnVzLWRldgo=
