Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F0F6C96AF
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:04 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9A8F143CD1
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:03 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id EFA3A3E96A
	for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 07:34:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=oVpq6RhJ;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id le6so1070308plb.12
        for <greybus-dev@lists.linaro.org>; Fri, 24 Mar 2023 00:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679643260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TCuUQNVkkfD2ZPnOF587mW3XsARVZtximMlGLvwHOxo=;
        b=oVpq6RhJr2s0S9DQD3buIKYI1LGRwDwGLmm55a4+Dc6subYya2Oywblx+ebe3Wj/Bs
         nSHIQ39bpdx9GsJvW6iq9hTjHO/rHdV8ZlQpAhJ3eKl2yHT583D/1skJVMDKYwHF27Gx
         rzA60odIMXvYC/efcBdh5eUdDm5h3B7C+kzP5AMQx6hBmVkYLw+vPR5X0WPFjop1Md3p
         cvRPWxZgjF0GKVWX4UQ2Os4vAoZga7Ri9LhqEM+QCfXnXNZV/F9OQcMbISWy3W+rlQGK
         rT1HJGQCzfWxFsYcUlz8uTpQmAOxW/OH1cdWoYIBCWv9O0NVQp36Q6lZV2otYTCejxMd
         nieA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679643260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TCuUQNVkkfD2ZPnOF587mW3XsARVZtximMlGLvwHOxo=;
        b=zNMfPod+rAj8b9HnHPIu4a0l2M0VhXkStMGqpOtAJ/w2mB31lITkVbp28XiyzleHFY
         Ixx2hpdty8TJ+arjbES5eKvg0LS67EgvozmaxzLzLXFYAQn4LU5kptZYouX0XjbbpDRp
         k/wOETAVxLiwhFOQm568pFXTPEoT++OHLVmKyCEAZjCqa7rX3Fs1UHnz7VYP/VDCvn3d
         3ewA4qzt2Y7Iob8P/L/4BpFWDOKnW95rHJS6nsXRUnAH80JvBJuzD70MOovIS+Y5+SI/
         eKWIq/UllNZdUAOv+BAeB2PZwfl4UHPZU4xBqrnjgVKd/tqEm1GePKSdNDShNdY2VdER
         kj2g==
X-Gm-Message-State: AAQBX9dQTp0TjrZybIdbhlq0cDyEe7lHTUTXyFSaq+BFdV/ADGSIukby
	iSnTHi677BxKlM0WixotUyk=
X-Google-Smtp-Source: AKy350Y/HHioS9DnMn2ppRJJ2qm9D8YHrwBl/5qZydmOURfSPB4rXN6nY4wARgBZ8PsqDCngFlx4gA==
X-Received: by 2002:a17:903:124d:b0:19f:3aff:dcfd with SMTP id u13-20020a170903124d00b0019f3affdcfdmr8704345plh.6.1679643260081;
        Fri, 24 Mar 2023 00:34:20 -0700 (PDT)
Received: from ubuntu.localdomain ([59.89.175.90])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709029a0c00b0019a75ea08e5sm13511604plp.33.2023.03.24.00.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:34:19 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Fri, 24 Mar 2023 00:30:03 -0700
Message-Id: <a7d0f315478af0596d1b6b97b8722a753dd39666.1679642024.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679642024.git.sumitraartsy@gmail.com>
References: <cover.1679642024.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EFA3A3E96A
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	MIME_GOOD(-0.10)[text/plain];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_TWO(0.00)[2]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FJI5OZU3S7RNOMLX4O3YOPQUUPEGL3ON
X-Message-ID-Hash: FJI5OZU3S7RNOMLX4O3YOPQUUPEGL3ON
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:32 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 3/3] Staging: greybus: Use inline function for pwm_chip_to_gb_pwm_chip
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FJI5OZU3S7RNOMLX4O3YOPQUUPEGL3ON/>
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
v2: Change patch subject, noted by Alison Schofield 
<alison.schofield@intel.com>

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
