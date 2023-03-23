Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 330066C6A15
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 14:55:04 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 450473ED16
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Mar 2023 13:55:03 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	by lists.linaro.org (Postfix) with ESMTPS id C045B3E975
	for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 09:04:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=VovKeNVY;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.214.170 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id o11so21715802ple.1
        for <greybus-dev@lists.linaro.org>; Thu, 23 Mar 2023 02:04:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679562289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=VovKeNVYIntxSqSwNWdqBNoEkgHtZj1u9gRBjoOhUTw4PVGblIMga680+V+hAKcuu1
         9K53BgtPNgXP/RlEwIzsDqktSDJ2DYi1xD8BQ9MhFUeTZojlldhjBlqncCA7Lu5k3BrR
         1P5jKkrFeVpSxlwCTyCF2J5GHSzvdOIUN/J9oABTuTuITbiWrc2FWzi7JYmJNBcs46U+
         h/QQ+0qOQ9snZEY+MwqAynbRxoUHUKiBHe65wgenOlSKRBmztMNouKK8Vp6lqrrLcKPR
         Y6FjIRHpvs4T+BX03DM/Ah8ybGbzDZqDH+c9d+SdFIwF2lcN4HHvAEP8wgCNds7exe1P
         eqcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679562289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=52wSz/NRMpfjHMucerdMr8TU4WeoO1kKk50UrAYONHzeDLm4OKRiazS1rAZ8saXFcd
         Hu7NnPl/C/v6sA5seElTn1AAZwbQjxCRP63o/5UL1e0iCbIlso8X0RwMrjvL7O5TTd65
         jhsh6VSgqM+KQ7ychBCnzDpjDq7nvs8QM2bM527OuoULu4O6M9dOTmrS2eYeIkBPwDAF
         y2/lELC+xw0589TXCf6TDdal0AOQNqZnr4A5s5bCrtz0OkLoqtAxx3MaKF/BltoNu0n5
         538M3W0sebpI71FsRwBZIfszZ7bB9cpsianhgzZjyOLtoM9l/+LkPhq9ZbdF4nJLW+nG
         fcjw==
X-Gm-Message-State: AO0yUKUnS9LcX8vyQBOpj7o3rZWN+K44EuIRBDl+6LX7Gu+PRT9gaiFF
	u8csIgRSKGTfBrtcKfxNOR8=
X-Google-Smtp-Source: AK7set9t/l3/U0AE9cUZeRhxD7T95vWcwj6YWiY0Q1zLdKmBzXfwVrm3upUYzVgfarO+slDO2qVrvw==
X-Received: by 2002:a05:6a20:66aa:b0:d0:212d:ead0 with SMTP id o42-20020a056a2066aa00b000d0212dead0mr2342077pzh.26.1679562288804;
        Thu, 23 Mar 2023 02:04:48 -0700 (PDT)
Received: from ubuntu.localdomain ([117.207.139.205])
        by smtp.gmail.com with ESMTPSA id q8-20020a656848000000b005034a57b963sm11277116pgt.58.2023.03.23.02.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Mar 2023 02:04:48 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Thu, 23 Mar 2023 02:03:41 -0700
Message-Id: <fa02078208917ce81ad3fb6d453e8487a5ba7505.1679558269.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679558269.git.sumitraartsy@gmail.com>
References: <cover.1679558269.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: C045B3E975
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[117.207.139.205:received,209.85.214.170:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.170:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: DKXK6CNR6TZOTM7OB36PYZABKNMDRZDO
X-Message-ID-Hash: DKXK6CNR6TZOTM7OB36PYZABKNMDRZDO
X-Mailman-Approved-At: Thu, 23 Mar 2023 13:54:41 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] Staging: greybus: Convert macro struct pwm_chip_to_gb_pwm_chip to an inline function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/DKXK6CNR6TZOTM7OB36PYZABKNMDRZDO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Convert 'pwm_chip_to_gb_pwm_chip' from a macro to a static
inline function, to make the relevant types apparent in the
definition and to benefit from the type checking performed by
the compiler at call sites.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 drivers/staging/greybus/pwm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 3fda172239d2..88da1d796f13 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -21,9 +21,11 @@ struct gb_pwm_chip {
 	struct pwm_chip		chip;
 	struct pwm_chip		*pwm;
 };
-#define pwm_chip_to_gb_pwm_chip(chip) \
-	container_of(chip, struct gb_pwm_chip, chip)
 
+static inline struct gb_pwm_chip *pwm_chip_to_gb_pwm_chip(struct pwm_chip *chip)
+{
+	return container_of(chip, struct gb_pwm_chip, chip);
+}
 
 static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
 {
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
