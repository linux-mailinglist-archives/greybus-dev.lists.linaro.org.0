Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AFD4E6C96B4
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 18:10:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7330D3E94D
	for <lists+greybus-dev@lfdr.de>; Sun, 26 Mar 2023 16:10:30 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	by lists.linaro.org (Postfix) with ESMTPS id D1B1E3E948
	for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 08:33:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=o639WNsL;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.216.47 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id om3-20020a17090b3a8300b0023efab0e3bfso7176635pjb.3
        for <greybus-dev@lists.linaro.org>; Sat, 25 Mar 2023 01:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679733197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=o639WNsLIKilsuSbOUQwSfrRBEy0Ll5v6ntkkD2bVaCkuUpwN37cLOeUhsSmI2yWPg
         2oHDK5veQ/gPP4Y6VOOAviErv5ZSsRk9Az81n0plcXMtoUtcAH727Zv2lzW5+8z6dWCd
         IZzlWtDLt/aIg213mx6VZnAHEGyB9FniS0Z5N6XYiQXNamw5/HjamXl1joGd3zIAstgk
         ieHPgx+zOgiTjL+QDQ+3ogDtcgbWlpb/+lYwHN1ln0Q+lT+wCObrY9aQVDSCGReZrFj1
         dim4Xafs5mOQwBH66ZX6FKC4rDEBow9Wwz9bu15AuYjsFHO0YGHb3J87NkpFi5PDOw9s
         7XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679733197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i9ruC/xMC7tL0m+Bw7Ok6wqKxtgof/3SmFbXbg58scA=;
        b=Z3Fb3EHmZY+gSVHMbDZOGSi3MG31rh3yKpweqC6G0v2VMmXM6+Nj9f2e9c7Indx0YJ
         7v+XIAr9kl0zH2ce1fnyWPsBkt4DlkzfDEhLJl9bibnz8FeNUDZx2aiKa5TXIUVd3Oe3
         sHknniw92TwwHL5AM2oqiDF+AAHD4OsM1XieNyJbGqLaYe+rXwYOLGciNmCR42OnrsrK
         iYE8YM+ewZtFwHrYsINlqu0eWEpawHHSsZsonQ0oahP1UKATh1LLed4Xc24rwohFnr3T
         Irtmx3sDDBJAK/h7MlPOAJQBRlTmpPUPmVSmgokOZpDCfDVrN2dCNhaRiXaJZxto3LVo
         RPcg==
X-Gm-Message-State: AAQBX9fvC5SdH1mIOezxrlMek0LFKVKA8WBW31+2d8jCmjf0k/01oP6J
	PuHfkjHAN7ZVo+ldIsnoDuM=
X-Google-Smtp-Source: AKy350ZlnfYWnaB6Q+DvHqgRzooKnDj0lpmUsKqxSDWIpYnsovqRM9QW9zeSWnZKKLZ4RDDGa9YD+A==
X-Received: by 2002:a17:90b:4c86:b0:237:c565:7bc6 with SMTP id my6-20020a17090b4c8600b00237c5657bc6mr5802024pjb.10.1679733196934;
        Sat, 25 Mar 2023 01:33:16 -0700 (PDT)
Received: from ubuntu.localdomain ([117.245.251.101])
        by smtp.gmail.com with ESMTPSA id m33-20020a635821000000b0050927cb606asm14290224pgb.13.2023.03.25.01.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 01:33:16 -0700 (PDT)
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: outreachy@lists.linux.dev
Date: Sat, 25 Mar 2023 01:31:10 -0700
Message-Id: <f1ef1b643840e74f211264dda0c590f8458618f6.1679732179.git.sumitraartsy@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1679732179.git.sumitraartsy@gmail.com>
References: <cover.1679732179.git.sumitraartsy@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: D1B1E3E948
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.47:from];
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
Message-ID-Hash: 2C5RA5MO2ND346L6ZSTO3US75GBU2VCC
X-Message-ID-Hash: 2C5RA5MO2ND346L6ZSTO3US75GBU2VCC
X-Mailman-Approved-At: Sun, 26 Mar 2023 16:09:48 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Sumitra Sharma <sumitraartsy@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 3/3] staging: greybus: Inline pwm_chip_to_gb_pwm_chip()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2C5RA5MO2ND346L6ZSTO3US75GBU2VCC/>
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
