Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 58D846D439C
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:36:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61C983EA1C
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:36:50 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	by lists.linaro.org (Postfix) with ESMTPS id 5BF6E3E94D
	for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 14:11:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=hHjrk15G;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.128.42 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id n19so11021325wms.0
        for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 07:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/11lbx2+OLsP5+4dMf0d4+77ejtkZtCxn73BU3ygIA=;
        b=hHjrk15GcvrQeufjkpCutHUhQG02cItQfcmF1eCByAc5XP/3GRJ3l+/Z5DqtxBEpzo
         vSjKRI4KxOkNLJfwrBRBPCM3jJqrNGioGh2W6VOtTnAKcjyIaPGCsb8y9oxGycPYHD9d
         R0mHuIILIRhID4cmurz77CsOeN95ATFZet0cca6to3YDoqyHE5E0PWOt1uz//rDLNQPw
         f8SS9FRgCMPUBCYipLifK2+sXSCA/XNIjVdTLMTQP3CGbSoTtf5xp475GCWFDsO5Phgg
         7h6onpoZfL8r9xvMceXS4dGp0LssRSROyideVcC79VX2uppc/ts7Wul6RcYBxAlzUdJd
         Nmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+/11lbx2+OLsP5+4dMf0d4+77ejtkZtCxn73BU3ygIA=;
        b=y2eEbxb1yLrMogP4DgABc5ysxHI1KoCV+wuNDjLqC2TBOBvVgdKFUrdZXCRRMWxcJn
         R2826oCir7xjuWee2Q1LzWaUqTylN0o7Diw4sH8Q6+3/Of1vXUrJaX/j+VqauY5qdB2v
         NalaGWqHjteMinzJuX/3VWXUqQzZxokZj64j9szQv/DxT+zHH68wL1qvqQgE5O8HpJPq
         D+UWLRkNJpUvSL5KI2lr/OA0sAhHNF2VASENyU9HjALSMyfpcpWWba+iJbLkLmgvL5Sv
         NsmAsv5pkDqvTvu6v/0ql9CEu0IWCq199hiJQxRx5r26EcqJJ0kY9EeSCoYTOpUHpoYt
         pJ0A==
X-Gm-Message-State: AO0yUKUNSZZHOl+3yKfJLaZc7XGLzaUBcrUA1yebNdc3TLW6EYfRnqOp
	ppuN3KZTdQbrgkyGLwjraeo=
X-Google-Smtp-Source: AK7set+0v3qdSi/olNwk5smzxmld9SdjfWJXtXnVbwWl/UlS7cLg4FLwT34Cf0kqEwRjVI7Gm/yaYA==
X-Received: by 2002:a05:600c:2049:b0:3df:e6bb:768 with SMTP id p9-20020a05600c204900b003dfe6bb0768mr17449957wmg.24.1680185492312;
        Thu, 30 Mar 2023 07:11:32 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm32761705wro.102.2023.03.30.07.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:11:31 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Date: Thu, 30 Mar 2023 19:11:24 +0500
Message-Id: <e670baa9bde47a3bdb02e59ec37a438a62c52dd1.1680185025.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680185025.git.kamrankhadijadj@gmail.com>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5BF6E3E94D
X-Spamd-Bar: -
X-Spamd-Result: default: False [-1.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.42:from];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,intel.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: V2IQYSFBZSI36JHE3OSJ7KC7IZMRMV4I
X-Message-ID-Hash: V2IQYSFBZSI36JHE3OSJ7KC7IZMRMV4I
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:41 +0000
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: add a single exit path to arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/V2IQYSFBZSI36JHE3OSJ7KC7IZMRMV4I/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

arche_platform_wd_irq() function has two exit paths. To make the code
more readable, use only one exit path.

Suggested-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..a64c1af091b0 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -153,6 +153,7 @@ static irqreturn_t arche_platform_wd_irq_thread(int irq, void *devid)
 static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 {
 	struct arche_platform_drvdata *arche_pdata = devid;
+	irqreturn_t rc = IRQ_HANDLED;
 	unsigned long flags;
 
 	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
@@ -180,9 +181,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 						WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
 									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
-					return IRQ_WAKE_THREAD;
+					rc = IRQ_WAKE_THREAD;
 				}
 			}
 		}
@@ -204,7 +203,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 
 	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 
-	return IRQ_HANDLED;
+	return rc;
 }
 
 /*
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
