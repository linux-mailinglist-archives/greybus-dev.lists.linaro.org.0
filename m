Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 20301331F64
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:40:12 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 470E666015
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:40:11 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 39E386602A; Tue,  9 Mar 2021 06:40:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 64CFF66795;
	Tue,  9 Mar 2021 06:39:39 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 79EBD618B9
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 6C29166596; Mon,  8 Mar 2021 14:55:29 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45])
 by lists.linaro.org (Postfix) with ESMTPS id F2738618B9
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:27 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id bd6so15097729edb.10
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WJxdRpdzofsaI6pJC87KN8qfD7oiIuHmhf+Ws3rK5bo=;
 b=PAXLWFSDJs5hCyfImfEUWOP/5nFisZafHyd0IKU/j4sh3K5cZ+ko3vCmI3MIbUx0Qt
 EF8FZzfrbGpIcq0k95zTXdIpnYwQYqE6xq+UtqoJbfwvfV3XI0IwJUxPMr9Q00gsPCpw
 AMlvYZYaEuJu6QNoMIU0xuJQnyWDCz630C/z2B+MDF3Uj/SbEZIqWVJEqaM3RngDaf/V
 303MUAdZi3bQptQkPtsQNQymH7OSN+KidVzrvblfrkx+lJ2k35MEgL1hDoPVnqcCIGZ9
 XIKGJDKWSsMsstKAppMoNK1PYhnIuoftvXMv6awgXudJHqRx2qyExZVbVyydG/XP7Lky
 dVzw==
X-Gm-Message-State: AOAM5324SCkKCjJU7SiDw+wK8Hs7SIwD9Zlm7E/cwFim/2kTVKvXKbWP
 stAKbNFW5IP0LQnvNTbL3UQ3yJ+AsWk7CKU3mz0=
X-Google-Smtp-Source: ABdhPJwlgot4NbjzzuYuRheze893HpYfgoXITowLPS3t6zG7Qok0RqmnNpkbz3PPbWWOQb7cwfKxaw==
X-Received: by 2002:a05:6402:10c6:: with SMTP id
 p6mr15045774edu.241.1615215327135; 
 Mon, 08 Mar 2021 06:55:27 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:26 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:53 +0200
Message-Id: <20210308145502.1075689-2-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 01/10] spi: spi-axi-spi-engine: remove usage
	of delay_usecs
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

VGhlICdkZWxheV91c2VjcycgZmllbGQgd2FzIGhhbmRsZWQgZm9yIGJhY2t3YXJkcyBjb21wYXRp
YmlsaXR5IGluIGNhc2UKdGhlcmUgd2VyZSBzb21lIHVzZXJzIHRoYXQgc3RpbGwgY29uZmlndXJl
ZCBTUEkgZGVsYXkgdHJhbnNmZXJzIHdpdGgKdGhpcyBmaWVsZC4KClRoZXkgc2hvdWxkIGFsbCBi
ZSByZW1vdmVkIGJ5IG5vdy4KClNpZ25lZC1vZmYtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWFy
ZGVsZWFuQGRldmlxb24uY29tPgotLS0KIGRyaXZlcnMvc3BpL3NwaS1heGktc3BpLWVuZ2luZS5j
IHwgMTIgKysrKy0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA4IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvc3BpL3NwaS1heGktc3BpLWVuZ2luZS5j
IGIvZHJpdmVycy9zcGkvc3BpLWF4aS1zcGktZW5naW5lLmMKaW5kZXggYWY4NmU2ZDZlMTZiLi44
MGMzZTM4ZjVjMWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvc3BpL3NwaS1heGktc3BpLWVuZ2luZS5j
CisrKyBiL2RyaXZlcnMvc3BpL3NwaS1heGktc3BpLWVuZ2luZS5jCkBAIC0xNzAsMTQgKzE3MCwx
MCBAQCBzdGF0aWMgdm9pZCBzcGlfZW5naW5lX2dlbl9zbGVlcChzdHJ1Y3Qgc3BpX2VuZ2luZV9w
cm9ncmFtICpwLCBib29sIGRyeSwKIAl1bnNpZ25lZCBpbnQgdDsKIAlpbnQgZGVsYXk7CiAKLQlp
ZiAoeGZlci0+ZGVsYXlfdXNlY3MpIHsKLQkJZGVsYXkgPSB4ZmVyLT5kZWxheV91c2VjczsKLQl9
IGVsc2UgewotCQlkZWxheSA9IHNwaV9kZWxheV90b19ucygmeGZlci0+ZGVsYXksIHhmZXIpOwot
CQlpZiAoZGVsYXkgPCAwKQotCQkJcmV0dXJuOwotCQlkZWxheSAvPSAxMDAwOwotCX0KKwlkZWxh
eSA9IHNwaV9kZWxheV90b19ucygmeGZlci0+ZGVsYXksIHhmZXIpOworCWlmIChkZWxheSA8IDAp
CisJCXJldHVybjsKKwlkZWxheSAvPSAxMDAwOwogCiAJaWYgKGRlbGF5ID09IDApCiAJCXJldHVy
bjsKLS0gCjIuMjkuMgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5v
cmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
