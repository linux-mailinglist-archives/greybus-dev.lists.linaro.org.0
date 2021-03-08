Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 06554331F75
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:41:55 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 29C0566783
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:41:54 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1EBBC66793; Tue,  9 Mar 2021 06:41:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3878E667B7;
	Tue,  9 Mar 2021 06:39:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 55AFD60631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:41 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 48CF266596; Mon,  8 Mar 2021 14:55:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 by lists.linaro.org (Postfix) with ESMTPS id B6C6060631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:38 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id e19so20972052ejt.3
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eGIsP86uecOdbNP3RzEXdRJwjYXQN4lavob9ylpQnlo=;
 b=h36wpDjDXRCec3uwczNaKj6KOmczr5vB91X9veeQW3naZb4Bu9y1ERwvGFPGDd6TIO
 WamhVgaQiAUP2x9VC1tGW7e944YxW8KfBSNtffjzNWC+/BoHQ7sDChk8B26/BR5ElJs5
 Gq5wbFj4lOK/Z0u7Gh350wo4nWgKeTd4dYteSRWdI4B0VlDsmClSNZkbCEwny30HhqfL
 GMR4fh+SNtDE6i9BZsgen6lg76kebPQKCGvm47C2Am/meefehfozgvYpAEH97MryUEEw
 w7jqzcCLzuurlKgIQyayC6ctynPoYam9SgdHVGmQDSJpARLt8PJFLTGqhvo0h/8wgCeC
 K15A==
X-Gm-Message-State: AOAM531zbEvjuY+onj7e4bwKYB5rdPIXG3Ox0sQBQMxTRY6fWzkP5kbK
 /RSSFW5j7I/c2Y709E3AYKTnfg==
X-Google-Smtp-Source: ABdhPJztNbtWidlTaFpyoGea7LJcNkwK+Ksb+1J38vdVQrHaHxFzKw412LMQTMbUTaZZaFEz5HcZtA==
X-Received: by 2002:a17:906:6558:: with SMTP id
 u24mr15604493ejn.185.1615215337950; 
 Mon, 08 Mar 2021 06:55:37 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:37 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:55:01 +0200
Message-Id: <20210308145502.1075689-10-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 09/10] spi: core: remove 'delay_usecs' field
	from spi_transfer
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

VGhlICdkZWxheScgZmllbGQgaW4gdGhlIHNwaV90cmFuc2ZlciBzdHJ1Y3QgaXMgbWVhbnQgdG8g
cmVwbGFjZSB0aGUKJ2RlbGF5X3VzZWNzJyBmaWVsZC4gSG93ZXZlciBzb21lIGNsZWFudXAgd2Fz
IHJlcXVpcmVkIHRvIHJlbW92ZSB0aGUKdXNlcyBvZiAnZGVsYXlfdXNlY3MnLiBOb3cgdGhhdCBp
dCdzIGJlZW4gY2xlYW5lZCB1cCwgd2UgY2FuIHJlbW92ZSBpdApmcm9tIHRoZSBrZXJuZWwgdHJl
ZS4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWFyZGVsZWFuQGRldmlxb24u
Y29tPgotLS0KIGRyaXZlcnMvc3BpL3NwaS5jICAgICAgIHwgIDEgLQogaW5jbHVkZS9saW51eC9z
cGkvc3BpLmggfCAxMiAtLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTMgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLmMgYi9kcml2ZXJzL3NwaS9zcGkuYwpp
bmRleCBiMDhlZmU4OGNjZDYuLjQ4MTQyNzc4MDE2MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkv
c3BpLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLmMKQEAgLTMxNzgsNyArMzE3OCw2IEBAIHN0cnVj
dCBzcGlfcmVwbGFjZWRfdHJhbnNmZXJzICpzcGlfcmVwbGFjZV90cmFuc2ZlcnMoCiAJCS8qIGNs
ZWFyIGNzX2NoYW5nZSBhbmQgZGVsYXkgZm9yIGFsbCBidXQgdGhlIGxhc3QgKi8KIAkJaWYgKGkp
IHsKIAkJCXhmZXItPmNzX2NoYW5nZSA9IGZhbHNlOwotCQkJeGZlci0+ZGVsYXlfdXNlY3MgPSAw
OwogCQkJeGZlci0+ZGVsYXkudmFsdWUgPSAwOwogCQl9CiAJfQpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9zcGkvc3BpLmggYi9pbmNsdWRlL2xpbnV4L3NwaS9zcGkuaAppbmRleCA1OTI4OTdm
YTRmMDMuLmVhMTc4NGE0MzI2NyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9zcGkvc3BpLmgK
KysrIGIvaW5jbHVkZS9saW51eC9zcGkvc3BpLmgKQEAgLTgzMiw5ICs4MzIsNiBAQCBleHRlcm4g
dm9pZCBzcGlfcmVzX3JlbGVhc2Uoc3RydWN0IHNwaV9jb250cm9sbGVyICpjdGxyLAogICogQGRl
bGF5OiBkZWxheSB0byBiZSBpbnRyb2R1Y2VkIGFmdGVyIHRoaXMgdHJhbnNmZXIgYmVmb3JlCiAg
Kgkob3B0aW9uYWxseSkgY2hhbmdpbmcgdGhlIGNoaXBzZWxlY3Qgc3RhdHVzLCB0aGVuIHN0YXJ0
aW5nCiAgKgl0aGUgbmV4dCB0cmFuc2ZlciBvciBjb21wbGV0aW5nIHRoaXMgQHNwaV9tZXNzYWdl
LgotICogQGRlbGF5X3VzZWNzOiBtaWNyb3NlY29uZHMgdG8gZGVsYXkgYWZ0ZXIgdGhpcyB0cmFu
c2ZlciBiZWZvcmUKLSAqCShvcHRpb25hbGx5KSBjaGFuZ2luZyB0aGUgY2hpcHNlbGVjdCBzdGF0
dXMsIHRoZW4gc3RhcnRpbmcKLSAqCXRoZSBuZXh0IHRyYW5zZmVyIG9yIGNvbXBsZXRpbmcgdGhp
cyBAc3BpX21lc3NhZ2UuCiAgKiBAd29yZF9kZWxheTogaW50ZXIgd29yZCBkZWxheSB0byBiZSBp
bnRyb2R1Y2VkIGFmdGVyIGVhY2ggd29yZCBzaXplCiAgKgkoc2V0IGJ5IGJpdHNfcGVyX3dvcmQp
IHRyYW5zbWlzc2lvbi4KICAqIEBlZmZlY3RpdmVfc3BlZWRfaHo6IHRoZSBlZmZlY3RpdmUgU0NL
LXNwZWVkIHRoYXQgd2FzIHVzZWQgdG8KQEAgLTk0Niw3ICs5NDMsNiBAQCBzdHJ1Y3Qgc3BpX3Ry
YW5zZmVyIHsKICNkZWZpbmUJU1BJX05CSVRTX0RVQUwJCTB4MDIgLyogMmJpdHMgdHJhbnNmZXIg
Ki8KICNkZWZpbmUJU1BJX05CSVRTX1FVQUQJCTB4MDQgLyogNGJpdHMgdHJhbnNmZXIgKi8KIAl1
OAkJYml0c19wZXJfd29yZDsKLQl1MTYJCWRlbGF5X3VzZWNzOwogCXN0cnVjdCBzcGlfZGVsYXkJ
ZGVsYXk7CiAJc3RydWN0IHNwaV9kZWxheQljc19jaGFuZ2VfZGVsYXk7CiAJc3RydWN0IHNwaV9k
ZWxheQl3b3JkX2RlbGF5OwpAQCAtMTA2MCwxNCArMTA1Niw2IEBAIHNwaV90cmFuc2Zlcl9kZWwo
c3RydWN0IHNwaV90cmFuc2ZlciAqdCkKIHN0YXRpYyBpbmxpbmUgaW50CiBzcGlfdHJhbnNmZXJf
ZGVsYXlfZXhlYyhzdHJ1Y3Qgc3BpX3RyYW5zZmVyICp0KQogewotCXN0cnVjdCBzcGlfZGVsYXkg
ZDsKLQotCWlmICh0LT5kZWxheV91c2VjcykgewotCQlkLnZhbHVlID0gdC0+ZGVsYXlfdXNlY3M7
Ci0JCWQudW5pdCA9IFNQSV9ERUxBWV9VTklUX1VTRUNTOwotCQlyZXR1cm4gc3BpX2RlbGF5X2V4
ZWMoJmQsIE5VTEwpOwotCX0KLQogCXJldHVybiBzcGlfZGVsYXlfZXhlYygmdC0+ZGVsYXksIHQp
OwogfQogCi0tIAoyLjI5LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5h
cm8ub3JnCmh0dHBzOi8vbGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMt
ZGV2Cg==
