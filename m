Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A467A6D439D
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 13:36:56 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ACD5D3ED7B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Apr 2023 11:36:55 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	by lists.linaro.org (Postfix) with ESMTPS id E87883F639
	for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 14:11:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=a49YjFIz;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.53 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id l12so19215118wrm.10
        for <greybus-dev@lists.linaro.org>; Thu, 30 Mar 2023 07:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680185495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+FoJdn0v3mxQP8H3rv8z+g2SXXjZfcMeYd0mBDcN58=;
        b=a49YjFIziZlCSUFnzcypUe3Vbs/P/pZFB1JfUdfg1cCflz0+0TpTIqRyvVav/hYc2O
         ygZG6EhI3MLhz+tAlP8PaSKGZO+aA7TZ9gnTwHIzlnqLSFuNQHVCAkQw6Lk4hLd6qe9q
         w9UgFcBtHjjzeUkAtDIxBBrtK2cSlYn3baAUx4G/V9wsUz4c2uZadquagx/bTH8m4zAS
         uSq18TxuF2jpOa+YaoLG/lRy8euHZnwQ3kRAdBkB3183bF8jbr2OgRyTRLbBStpc/+69
         avifYLVbfUYOfHZTAYLn7YnTnLsasqRktRAYcLK+FDxTWXCuXL8gZZQqrGeYjSEIUpFU
         lqUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680185495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+FoJdn0v3mxQP8H3rv8z+g2SXXjZfcMeYd0mBDcN58=;
        b=ZDRXOloao8wqUDWwc8ONc8jh51hklgyWqKH3lXRDArfV//YpahwIqf10KumanuFCyN
         1673ZRnIPyvm3s/m0CvdLSsALdf8EO0hPwI6V6TFplp0r4be6NdnnqgdFsmAYbynOVIY
         3Whuo2WdOOl3e7+Dq/+xDftPLDkLG2crA+UL0corbF5XDUPKeb4AhFH8VK/Y3hF3JxuY
         2qJWB0481Lk5Q3qNC5dx43vyY4IFBa2oWOyelt2OQ0XuO+qYEBSOJqqtfe74xI5K/B6M
         CCg5datdTHvlOY63fzhT01yjFOiTvGBBmU1+baYPv/xM+e9wKFztyzViX+8ZWo9rJ2kP
         If4A==
X-Gm-Message-State: AAQBX9ciwh9pa9anuuFmyIJdWhnWv1snK616nT8xGRDij12kvQaDa5oN
	ZNfPRxeVd4azWd80bDmtk5M=
X-Google-Smtp-Source: AKy350bWVUPToKKGL3iWneHoEStvcoEquC3yrNGYcOy60iAv+Ky8hm0FdCIU3pgtTNqsbC8TVFQoow==
X-Received: by 2002:a5d:500a:0:b0:2cb:29eb:a35e with SMTP id e10-20020a5d500a000000b002cb29eba35emr5019627wrt.11.1680185494763;
        Thu, 30 Mar 2023 07:11:34 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id b5-20020adfee85000000b002c573778432sm32761705wro.102.2023.03.30.07.11.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 07:11:34 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Date: Thu, 30 Mar 2023 19:11:25 +0500
Message-Id: <96d04a4ff3d4a46293355f5afae3a8ece65f2c5b.1680185025.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680185025.git.kamrankhadijadj@gmail.com>
References: <cover.1680185025.git.kamrankhadijadj@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: E87883F639
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
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.53:from];
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
Message-ID-Hash: BB65LIWQDLKPI3PDAZJA4SCX6LM4CYS2
X-Message-ID-Hash: BB65LIWQDLKPI3PDAZJA4SCX6LM4CYS2
X-Mailman-Approved-At: Mon, 03 Apr 2023 11:36:41 +0000
CC: hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Alison Schofield <alison.schofield@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] staging: greybus: refactor arche_platform_wd_irq()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BB65LIWQDLKPI3PDAZJA4SCX6LM4CYS2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Linux kernel coding-style suggests to fix your program if it needs more
than 3 levels of indentation. Due to indentation, line length also
exceeds 100 columns, resulting in issues reported by checkpatch.

Refactor the arche_platform_wd_irq() function and reduce the indentation
with the help of goto statement.

Suggested-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 79 ++++++++++++------------
 1 file changed, 41 insertions(+), 38 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index a64c1af091b0..dde30c8da1a1 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -158,49 +158,52 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 
 	spin_lock_irqsave(&arche_pdata->wake_lock, flags);
 
-	if (gpiod_get_value(arche_pdata->wake_detect)) {
-		/* wake/detect rising */
+	if (!gpiod_get_value(arche_pdata->wake_detect))
+		goto falling;
 
+	/* wake/detect rising */
+
+	/*
+	 * If wake/detect line goes high after low, within less than
+	 * 30msec, then standby boot sequence is initiated, which is not
+	 * supported/implemented as of now. So ignore it.
+	 */
+	if (arche_pdata->wake_detect_state != WD_STATE_BOOT_INIT)
+		goto out;
+
+	if (time_before(jiffies,
+			arche_pdata->wake_detect_start +
+			msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
+		arche_platform_set_wake_detect_state(arche_pdata,
+						     WD_STATE_IDLE);
+		got out;
+	}
+
+	/* Check we are not in middle of irq thread already */
+	if (arche_pdata->wake_detect_state !=
+			WD_STATE_COLDBOOT_START) {
+		arche_platform_set_wake_detect_state(arche_pdata,
+						     WD_STATE_COLDBOOT_TRIG);
+		rc = IRQ_WAKE_THREAD;
+		goto out;
+	}
+
+falling:
+	/* wake/detect falling */
+	if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
+		arche_pdata->wake_detect_start = jiffies;
 		/*
-		 * If wake/detect line goes high after low, within less than
-		 * 30msec, then standby boot sequence is initiated, which is not
-		 * supported/implemented as of now. So ignore it.
+		 * In the beginning, when wake/detect goes low
+		 * (first time), we assume it is meant for coldboot
+		 * and set the flag. If wake/detect line stays low
+		 * beyond 30msec, then it is coldboot else fallback
+		 * to standby boot.
 		 */
-		if (arche_pdata->wake_detect_state == WD_STATE_BOOT_INIT) {
-			if (time_before(jiffies,
-					arche_pdata->wake_detect_start +
-					msecs_to_jiffies(WD_COLDBOOT_PULSE_WIDTH_MS))) {
-				arche_platform_set_wake_detect_state(arche_pdata,
-								     WD_STATE_IDLE);
-			} else {
-				/*
-				 * Check we are not in middle of irq thread
-				 * already
-				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
-					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
-					rc = IRQ_WAKE_THREAD;
-				}
-			}
-		}
-	} else {
-		/* wake/detect falling */
-		if (arche_pdata->wake_detect_state == WD_STATE_IDLE) {
-			arche_pdata->wake_detect_start = jiffies;
-			/*
-			 * In the beginning, when wake/detect goes low
-			 * (first time), we assume it is meant for coldboot
-			 * and set the flag. If wake/detect line stays low
-			 * beyond 30msec, then it is coldboot else fallback
-			 * to standby boot.
-			 */
-			arche_platform_set_wake_detect_state(arche_pdata,
-							     WD_STATE_BOOT_INIT);
-		}
+		arche_platform_set_wake_detect_state(arche_pdata,
+						     WD_STATE_BOOT_INIT);
 	}
 
+out:
 	spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 
 	return rc;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
