Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id EC874331F67
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 07:40:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 20F7C6602A
	for <lists+greybus-dev@lfdr.de>; Tue,  9 Mar 2021 06:40:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 0E8F366793; Tue,  9 Mar 2021 06:40:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 13380667A1;
	Tue,  9 Mar 2021 06:39:41 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 0DD1B60631
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 022E866596; Mon,  8 Mar 2021 14:55:33 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by lists.linaro.org (Postfix) with ESMTPS id E04E0618B9
 for <greybus-dev@lists.linaro.org>; Mon,  8 Mar 2021 14:55:31 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id h10so15165104edl.6
 for <greybus-dev@lists.linaro.org>; Mon, 08 Mar 2021 06:55:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uperHqgKyTc1tpYFKXo+RhHx7BCtYMzrCs+Kkh1SsV0=;
 b=mmeR+KKL8JiIlHc1gSfbwADpy7NAaLYQANUvZOljZ3TY6XeSy6Tgigkfk2XkOPRekp
 9qOJkjgFF0at4EToQ8MrHCql4txrwiJRcBqUN1I2ajDKdoV9xLAcoNXvivbbMbBdaatx
 taO7LnWlCVSFz3jKPRo+7Ft1K6K9hOsI4uBBZPO3fkRKrBdZfpS+LVRttDqfNr5vNJ1g
 Hzrlv4GTZ2WOCxXe0Cg5aKTwDpMqcehTPYYTSqyV0Irp4nXlEvhZSsn8Qfd3AG/Q5zv8
 kwLsEkkOJfQEaaUvemLkhAvOdxOy265cFK7eDbWvifvhgqtxl+jDeELWhEq/GSX+bnzw
 wegQ==
X-Gm-Message-State: AOAM533/a2xy9/5+wyHr7c8sE64PSMHrSUd2Gxe03ZwUWLRC42aLIqmo
 2zGO63fzHkyN+ERiUNfpL6PHyw==
X-Google-Smtp-Source: ABdhPJwPaZ3uD6Lhos/UbjXVxJWzoRqv4+WWiUx4IoveJlUHtsMTopNWyUeqtN/pd3JKBlgRsTvxgg==
X-Received: by 2002:aa7:d54a:: with SMTP id u10mr22811140edr.316.1615215331116; 
 Mon, 08 Mar 2021 06:55:31 -0800 (PST)
Received: from localhost.localdomain ([5.2.193.191])
 by smtp.gmail.com with ESMTPSA id bt14sm7411234edb.92.2021.03.08.06.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 06:55:30 -0800 (PST)
From: Alexandru Ardelean <aardelean@deviqon.com>
To: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 greybus-dev@lists.linaro.org, devel@driverdev.osuosl.org,
 linux-tegra@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com
Date: Mon,  8 Mar 2021 16:54:56 +0200
Message-Id: <20210308145502.1075689-5-aardelean@deviqon.com>
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
Subject: [greybus-dev] [PATCH 04/10] spi: spi-sh: replace 'delay_usecs' with
	'delay.value' in pr_debug
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

VGhlICdkZWxheV91c2VjcycgZmllbGQgaXMgZ29pbmcgYXdheS4gVGhlIHJlcGxhY2VtZW50IGZv
ciBpdCBpcyB0aGUKJ2RlbGF5JyBmaWVsZC4gU28sIHdlIHNob3VsZCBwcmludCB0aGUgJ2RlbGF5
LnZhbHVlJyB2YWx1ZSBpbnN0ZWFkLgoKU2lnbmVkLW9mZi1ieTogQWxleGFuZHJ1IEFyZGVsZWFu
IDxhYXJkZWxlYW5AZGV2aXFvbi5jb20+Ci0tLQogZHJpdmVycy9zcGkvc3BpLXNoLmMgfCA0ICsr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvZHJpdmVycy9zcGkvc3BpLXNoLmMgYi9kcml2ZXJzL3NwaS9zcGktc2guYwppbmRl
eCAxNTEyM2E4ZjQxZTEuLjQ1ZjMwNDkzNTMzMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9zcGkvc3Bp
LXNoLmMKKysrIGIvZHJpdmVycy9zcGkvc3BpLXNoLmMKQEAgLTI5MCw4ICsyOTAsOCBAQCBzdGF0
aWMgdm9pZCBzcGlfc2hfd29yayhzdHJ1Y3Qgd29ya19zdHJ1Y3QgKndvcmspCiAJCWxpc3RfZm9y
X2VhY2hfZW50cnkodCwgJm1lc2ctPnRyYW5zZmVycywgdHJhbnNmZXJfbGlzdCkgewogCQkJcHJf
ZGVidWcoInR4X2J1ZiA9ICVwLCByeF9idWYgPSAlcFxuIiwKIAkJCQkJdC0+dHhfYnVmLCB0LT5y
eF9idWYpOwotCQkJcHJfZGVidWcoImxlbiA9ICVkLCBkZWxheV91c2VjcyA9ICVkXG4iLAotCQkJ
CQl0LT5sZW4sIHQtPmRlbGF5X3VzZWNzKTsKKwkJCXByX2RlYnVnKCJsZW4gPSAlZCwgZGVsYXku
dmFsdWUgPSAlZFxuIiwKKwkJCQkJdC0+bGVuLCB0LT5kZWxheS52YWx1ZSk7CiAKIAkJCWlmICh0
LT50eF9idWYpIHsKIAkJCQlyZXQgPSBzcGlfc2hfc2VuZChzcywgbWVzZywgdCk7Ci0tIAoyLjI5
LjIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXli
dXMtZGV2IG1haWxpbmcgbGlzdApncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnCmh0dHBzOi8v
bGlzdHMubGluYXJvLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2dyZXlidXMtZGV2Cg==
