Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C7715A87204
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 14:59:40 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DF775454D7
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 12:59:39 +0000 (UTC)
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by lists.linaro.org (Postfix) with ESMTPS id 3437F45979
	for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 07:32:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=GokemoXM;
	spf=pass (lists.linaro.org: domain of ganeshkpittala@gmail.com designates 209.85.160.196 as permitted sender) smtp.mailfrom=ganeshkpittala@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qt1-f196.google.com with SMTP id d75a77b69052e-476964b2c1dso59384751cf.3
        for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 00:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529572; x=1745134372; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3uby1Q+b765/55h4CWBlJtND/wv5GPZpZ5T+Fpb9xa8=;
        b=GokemoXMdy2jm2lIynvi1IHt2AA//Au40RSXj7IIOgtp7o+x4BGd+S3MAHCr6HlfzR
         3I8hFudX5JIzaXx2mfKEHNuyX+8utzlWqws5GHc5trTPjGINHc205zng/sTTX72or93Z
         098Uu+e/lprOkyKvf7n3Fzby3lySeJuxvf/OjW5RcNJmpg2MnVqtqzHSAOdbGOB+9G3P
         nB09PIZTS6nyFux0lMlAKM2dEeH6yLj2A2V4QoYPDwDL82XDxwb3hiTMisLvquowfjbo
         gQPwTktsNb/XOSEl0nq/yBsGZxNOFpHjBrttYe/850DHuG8HZyaM/cF0dinAVRtJ6Eeg
         ZxLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529572; x=1745134372;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3uby1Q+b765/55h4CWBlJtND/wv5GPZpZ5T+Fpb9xa8=;
        b=P2JdX9vNu3FyfXDJ+Z8Lke/BatjAYzb8YqYCwHKs3qqRmhVZ6dgYJXAhVTIfzPFdYE
         gOChjB0b4NmZMjMSduDcGJ9HHYt1tvHjf/KqAf23Bj7KY1g29jDz4SwEp0/7HR9alZTz
         ZRfm5yNiupaMUnI80sK1hLAsRao3HGJGzdXWCUBr/pevUk+flWJEPBXbXIlD4UQ7uiTS
         YYbXw7gVctZBPDYk0069Nn3SqCUfCARgB9DCsLQ8MB1w0uOX2MziRsLcNlOXpR7iPwXD
         AWnMa386ZA8iOduFDGk3L8zNACkErFbHlLXRK/Psg2yqzO2tIIhzP+PGsEnbFKZYFDUZ
         46Lg==
X-Gm-Message-State: AOJu0YzsJBytXjdWUBgVE3OD4teHlt9e//0nkerDi4eFvF7RoL1ap8sN
	q4Qvj1RrQ3RDBYiqUjSKsom5zfCMfvGsAPmI+7ufHYUdejqhAbG7
X-Gm-Gg: ASbGncsaq2FVCKF30yw6E3WCDTWmDGG7hJT31HxURSovY9vFYCP0ISEYtAIxEDNdtFy
	7txNIETPskz++929Ac0ING8dwdqXOV4NxoYhIhrFKaAMDhXY3ZmhG/ePKW4wltYjEBzmUo+Y1Ak
	7XcENkQUm+CMu/zHC49F76akL0QoV04Nmtk0RU9CC5L3E6z2EZztwoFgOJ7Aea78CFRr3xFD+To
	WnVbGCGSjzU/T0bbHZgdecCSGaqTBoEEBeab5p0lvbI2IOaTr7V8Pnux3Pyk9w+/WfmwtBZwOyS
	nR1KKREH493EWWx4nQeUfrcPmGBsdPHdedh9E4XJ1pBN9HFR9TSJW9z3AN/DDWxt6kTn8uadBYs
	hutA21N0UGcU/X7LXbA==
X-Google-Smtp-Source: AGHT+IHRArwDsyiOHSw0uFQ2zMdIEQRmtTDX1Ac43R0yu6Md3oC0QegCdhqwo2sEf+nt/jF/DRPgjA==
X-Received: by 2002:ac8:7dcc:0:b0:479:1a10:8958 with SMTP id d75a77b69052e-4797750fb92mr128705241cf.1.1744529571657;
        Sun, 13 Apr 2025 00:32:51 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:51 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun, 13 Apr 2025 07:32:19 +0000
Message-ID: <20250413073220.15931-4-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 3437F45979
X-Spamd-Bar: +++
X-Spamd-Result: default: False [3.90 / 15.00];
	RBL_SENDERSCORE_REPUT_0(4.00)[209.85.160.196:from];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.196:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,animalcreek.com,nexus-software.ie];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17:c];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Spam-Level: ***
X-Rspamd-Server: lists.linaro.org
X-MailFrom: ganeshkpittala@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KHD2F43OJ33ONK5RNQPINLGVOZURKLNR
X-Message-ID-Hash: KHD2F43OJ33ONK5RNQPINLGVOZURKLNR
X-Mailman-Approved-At: Sun, 13 Apr 2025 12:59:23 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, ganeshkpittala@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 3/4] staging: greybus: refactor gb_loopback_fn into smaller helper functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KHD2F43OJ33ONK5RNQPINLGVOZURKLNR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch refactors the gb_loopback_fn() function in loopback.c by
splitting large blocks of logic into well-named static helpers to
improve clarity, readability, and maintainability.

The control flow remains unchanged. No functional modifications
are introduced.

This aligns with kernel coding style guidelines for long functions
and helps future contributors understand and modify loopback behavior
more easily.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/loopback.c | 152 ++++++++++++++++-------------
 1 file changed, 82 insertions(+), 70 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index c194afea941a..1e3644ede1b6 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -832,105 +832,117 @@ static void gb_loopback_async_wait_to_send(struct gb_loopback *gb)
 				  kthread_should_stop());
 }
 
-static int gb_loopback_fn(void *data)
+static bool gb_loopback_should_stop(struct gb_loopback *gb,
+				    struct gb_bundle *bundle)
+{
+	if (!gb->type) {
+		gb_pm_runtime_put_autosuspend(bundle);
+		wait_event_interruptible(gb->wq,
+					 gb->type || kthread_should_stop());
+		if (kthread_should_stop())
+			return true;
+		gb_pm_runtime_get_sync(bundle);
+	}
+	return kthread_should_stop();
+}
+
+static void gb_loopback_handle_completion(struct gb_loopback *gb,
+					  struct gb_bundle *bundle)
+{
+	gb_loopback_async_wait_all(gb);
+
+	mutex_lock(&gb->mutex);
+	if (gb->iteration_count == gb->iteration_max) {
+		gb->type = 0;
+		gb->send_count = 0;
+		sysfs_notify(&gb->dev->kobj, NULL, "iteration_count");
+		dev_dbg(&bundle->dev, "load test complete\n");
+	} else {
+		dev_dbg(&bundle->dev, "continuing on with new test set\n");
+	}
+	mutex_unlock(&gb->mutex);
+}
+
+static void gb_loopback_dispatch_operation(struct gb_loopback *gb, int type,
+					   u32 size)
 {
 	int error = 0;
-	int us_wait = 0;
-	int type;
-	int ret;
-	u32 size;
 
+	if (gb->async) {
+		if (type == GB_LOOPBACK_TYPE_PING)
+			error = gb_loopback_async_ping(gb);
+		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
+			error = gb_loopback_async_transfer(gb, size);
+		else if (type == GB_LOOPBACK_TYPE_SINK)
+			error = gb_loopback_async_sink(gb, size);
+
+		if (error) {
+			gb->error++;
+			gb->iteration_count++;
+		}
+	} else {
+		if (type == GB_LOOPBACK_TYPE_PING)
+			error = gb_loopback_sync_ping(gb);
+		else if (type == GB_LOOPBACK_TYPE_TRANSFER)
+			error = gb_loopback_sync_transfer(gb, size);
+		else if (type == GB_LOOPBACK_TYPE_SINK)
+			error = gb_loopback_sync_sink(gb, size);
+
+		if (error)
+			gb->error++;
+		gb->iteration_count++;
+		gb_loopback_calculate_stats(gb, !!error);
+	}
+}
+
+static void gb_loopback_delay_if_needed(int us_wait)
+{
+	if (us_wait) {
+		if (us_wait < 20000)
+			usleep_range(us_wait, us_wait + 100);
+		else
+			msleep(us_wait / 1000);
+	}
+}
+
+static int gb_loopback_fn(void *data)
+{
+	int us_wait = 0, type;
+	u32 size;
 	struct gb_loopback *gb = data;
 	struct gb_bundle *bundle = gb->connection->bundle;
 
-	ret = gb_pm_runtime_get_sync(bundle);
-	if (ret)
-		return ret;
+	if (gb_pm_runtime_get_sync(bundle))
+		return -EIO;
 
 	while (1) {
-		if (!gb->type) {
-			gb_pm_runtime_put_autosuspend(bundle);
-			wait_event_interruptible(gb->wq, gb->type ||
-						 kthread_should_stop());
-			ret = gb_pm_runtime_get_sync(bundle);
-			if (ret)
-				return ret;
-		}
-
-		if (kthread_should_stop())
+		if (gb_loopback_should_stop(gb, bundle))
 			break;
 
-		/* Limit the maximum number of in-flight async operations */
 		gb_loopback_async_wait_to_send(gb);
 		if (kthread_should_stop())
 			break;
 
 		mutex_lock(&gb->mutex);
 
-		/* Optionally terminate */
 		if (gb->send_count == gb->iteration_max) {
 			mutex_unlock(&gb->mutex);
-
-			/* Wait for synchronous and asynchronous completion */
-			gb_loopback_async_wait_all(gb);
-
-			/* Mark complete unless user-space has poked us */
-			mutex_lock(&gb->mutex);
-			if (gb->iteration_count == gb->iteration_max) {
-				gb->type = 0;
-				gb->send_count = 0;
-				sysfs_notify(&gb->dev->kobj,  NULL,
-					     "iteration_count");
-				dev_dbg(&bundle->dev, "load test complete\n");
-			} else {
-				dev_dbg(&bundle->dev,
-					"continuing on with new test set\n");
-			}
-			mutex_unlock(&gb->mutex);
+			gb_loopback_handle_completion(gb, bundle);
 			continue;
 		}
+
 		size = gb->size;
 		us_wait = gb->us_wait;
 		type = gb->type;
 		if (ktime_to_ns(gb->ts) == 0)
 			gb->ts = ktime_get();
 
-		/* Else operations to perform */
-		if (gb->async) {
-			if (type == GB_LOOPBACK_TYPE_PING)
-				error = gb_loopback_async_ping(gb);
-			else if (type == GB_LOOPBACK_TYPE_TRANSFER)
-				error = gb_loopback_async_transfer(gb, size);
-			else if (type == GB_LOOPBACK_TYPE_SINK)
-				error = gb_loopback_async_sink(gb, size);
-
-			if (error) {
-				gb->error++;
-				gb->iteration_count++;
-			}
-		} else {
-			/* We are effectively single threaded here */
-			if (type == GB_LOOPBACK_TYPE_PING)
-				error = gb_loopback_sync_ping(gb);
-			else if (type == GB_LOOPBACK_TYPE_TRANSFER)
-				error = gb_loopback_sync_transfer(gb, size);
-			else if (type == GB_LOOPBACK_TYPE_SINK)
-				error = gb_loopback_sync_sink(gb, size);
-
-			if (error)
-				gb->error++;
-			gb->iteration_count++;
-			gb_loopback_calculate_stats(gb, !!error);
-		}
+		gb_loopback_dispatch_operation(gb, type, size);
+
 		gb->send_count++;
 		mutex_unlock(&gb->mutex);
 
-		if (us_wait) {
-			if (us_wait < 20000)
-				usleep_range(us_wait, us_wait + 100);
-			else
-				msleep(us_wait / 1000);
-		}
+		gb_loopback_delay_if_needed(us_wait);
 	}
 
 	gb_pm_runtime_put_autosuspend(bundle);
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
