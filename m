Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 3431A281F1B
	for <lists+greybus-dev@lfdr.de>; Sat,  3 Oct 2020 01:31:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5011F6186A
	for <lists+greybus-dev@lfdr.de>; Fri,  2 Oct 2020 23:31:52 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 3A39D61820; Fri,  2 Oct 2020 23:31:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 56F926188D;
	Fri,  2 Oct 2020 23:31:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id BCE5B60850
 for <greybus-dev@lists.linaro.org>; Fri,  2 Oct 2020 23:31:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id AF9A161831; Fri,  2 Oct 2020 23:31:27 +0000 (UTC)
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
 [209.85.215.196])
 by lists.linaro.org (Postfix) with ESMTPS id C145B60850
 for <greybus-dev@lists.linaro.org>; Fri,  2 Oct 2020 23:31:10 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id h6so1168572pgk.4
 for <greybus-dev@lists.linaro.org>; Fri, 02 Oct 2020 16:31:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QRLbEJdGZQDTrvNnzz/vd1A9XIJGgSIja/bYa4Qi8I=;
 b=eJdsWIsq8Pm77SnsxDMFYy9BiFljxuMKaS3ifiDSftd1B914Owln1jH/k0I8SUdPg6
 ZQJhv/AD435hDt6L+YafEmIhUE9ZM1CakSklS4+INNJvYVtRmn9xIOMrDwvhT4sr+yPb
 dg94DO9/3bJ8Otud1u71TCA9HsB+Bv8QHOmF4KIlthLi1fWfOQ/hBI8nqZSpivkd2Y+d
 Jb+gIh+OGlWfQUNWB1tgECy/YqTRnhu9JUCPrTYU7fhuNkMy1TBiqi1dQUtebrkd/Dit
 RWyeuuqmohmnODJFm4zE/xHuMfJgxqD52LdRfX4qIQ8Be9zAmo3eF353+zzoXHzGN0cq
 p/kw==
X-Gm-Message-State: AOAM533HKuahngo0geZTpGBXPRZtZXGpH1cowQvv6ZHwoEpFLxlLM/GE
 3Qz3evd4bWmBmea5sdYEPGg=
X-Google-Smtp-Source: ABdhPJw73LPDi16JTCtCO5zXNZyiqmqhLHjswVaUqoKuYBEoW58r2/ceig7gm7PEEc5WeSZGmal/AQ==
X-Received: by 2002:a62:1b86:0:b029:13e:d13d:a05b with SMTP id
 b128-20020a621b860000b029013ed13da05bmr5067399pfb.33.1601681470073; 
 Fri, 02 Oct 2020 16:31:10 -0700 (PDT)
Received: from localhost ([2001:e42:102:1532:160:16:113:140])
 by smtp.gmail.com with ESMTPSA id f9sm2643706pju.8.2020.10.02.16.31.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 16:31:09 -0700 (PDT)
From: Coiby Xu <coiby.xu@gmail.com>
To: devel@driverdev.osuosl.org
Date: Sat,  3 Oct 2020 07:30:56 +0800
Message-Id: <20201002233057.74462-3-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201002233057.74462-1-coiby.xu@gmail.com>
References: <20201002233057.74462-1-coiby.xu@gmail.com>
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>,
 Alex Elder <elder@linaro.org>, open list <linux-kernel@vger.kernel.org>
Subject: [greybus-dev] [PATCH v2 3/3] staging: greybus: use __force when
	assigning __u8 value to snd_ctl_elem_type_t
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

KHN0cnVjdCBnYl9hdWRpb19jdGxfZWxlbV9pbmZvKiktPnR5cGUgaGFzIHRoZSB0eXBlIG9mIF9f
dTggc28gdGhlcmUgaXMgbm8KY29uY2VybiBhYm91dCB0aGUgYnl0ZSBvcmRlci4gX19mb3JjZSBp
cyBzYWZlIHRvIHVzZS4KCkZvdW5kIGJ5IHNwYXJzZSwKCiQgbWFrZSBDPTIgZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvCmRyaXZlcnMvc3RhZ2luZy9ncmV5YnVzL2F1ZGlvX3RvcG9sb2d5LmM6MTg1
OjI0OiB3YXJuaW5nOiBjYXN0IHRvIHJlc3RyaWN0ZWQgc25kX2N0bF9lbGVtX3R5cGVfdAoKU3Vn
Z2VzdGVkLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckBsaW5hcm8ub3JnPgpTaWduZWQtb2ZmLWJ5OiBD
b2lieSBYdSA8Y29pYnkueHVAZ21haWwuY29tPgotLS0KIGRyaXZlcnMvc3RhZ2luZy9ncmV5YnVz
L2F1ZGlvX3RvcG9sb2d5LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9hdWRp
b190b3BvbG9neS5jIGIvZHJpdmVycy9zdGFnaW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYwpp
bmRleCAyMDkxMDMxNjU5ZGUuLjY2MmUzZThiNGI2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9zdGFn
aW5nL2dyZXlidXMvYXVkaW9fdG9wb2xvZ3kuYworKysgYi9kcml2ZXJzL3N0YWdpbmcvZ3JleWJ1
cy9hdWRpb190b3BvbG9neS5jCkBAIC0xODIsNyArMTgyLDcgQEAgc3RhdGljIGludCBnYmNvZGVj
X21peGVyX2N0bF9pbmZvKHN0cnVjdCBzbmRfa2NvbnRyb2wgKmtjb250cm9sLAogCS8qIHVwZGF0
ZSB1aW5mbyAqLwogCXVpbmZvLT5hY2Nlc3MgPSBkYXRhLT5hY2Nlc3M7CiAJdWluZm8tPmNvdW50
ID0gZGF0YS0+dmNvdW50OwotCXVpbmZvLT50eXBlID0gKHNuZF9jdGxfZWxlbV90eXBlX3QpaW5m
by0+dHlwZTsKKwl1aW5mby0+dHlwZSA9IChfX2ZvcmNlIHNuZF9jdGxfZWxlbV90eXBlX3QpaW5m
by0+dHlwZTsKIAogCXN3aXRjaCAoaW5mby0+dHlwZSkgewogCWNhc2UgR0JfQVVESU9fQ1RMX0VM
RU1fVFlQRV9CT09MRUFOOgotLSAKMi4yOC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZA
bGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxpbmFyby5vcmcvbWFpbG1hbi9saXN0aW5m
by9ncmV5YnVzLWRldgo=
