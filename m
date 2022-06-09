Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D29055456B7
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jun 2022 23:49:39 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D7093F4C1
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jun 2022 21:49:38 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	by lists.linaro.org (Postfix) with ESMTPS id E531D3ED8A
	for <greybus-dev@lists.linaro.org>; Thu,  9 Jun 2022 21:49:34 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id mh16-20020a17090b4ad000b001e8313301f1so2137080pjb.1
        for <greybus-dev@lists.linaro.org>; Thu, 09 Jun 2022 14:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OqWT2+rs9ONxjJPi5zpOEh7NoBzb3sfwmxsPGIJo9Ek=;
        b=dsNmKyR8/Kn0lBpff4o8kscF+y8WEiWN7qe/Y1QdBUJkfYtqt9MwF9mcGg/YCgljwa
         Y3SdusFY+q8XzxCr8RqDXlvJTlUHQtKc+6pfXDQ0LrtZlWo6g0p7DOTE6DLJ3sS1KQPY
         9psnnZQhQDcBWdHh75S18SvB8u5U3JE2uaK7YrVYXfhByAjQn8xrajALooQWiPCqJwPm
         w5q6oLhJMERM7qj0N535LyCyA9AhynzGurpljaNmg5kP+u2fy8Vyur1k+9THF1UDR6CW
         ZkOSEkVTKYk3w3wMQeIIrawX5qwuUSuX2ft0sqqcLgUp/UZSrFrw8P53wav6PHnR4tDO
         x5mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=OqWT2+rs9ONxjJPi5zpOEh7NoBzb3sfwmxsPGIJo9Ek=;
        b=OHX+IfrOYfacCC0QVRg3Eq2nWWEbPduVCJI8V6BmoYI+e8vu5RGAZBMXLhwfSVLzLn
         DzzjyY+4tj6YyMCKjlP/4qRFFpxugMUSvP8U5DLYNaWRtVmhVBsqEiNAdZXLcLCYMuV7
         WoqzSnF2sncLov+RC3sGUrmlGmhI2tjMk2E2UvOR92r2eRTS6vPT8nXhPRs9tZWI5qxR
         uge06yH7v9vzY8HGLeiQ9unEDRN2QDrkI0kR8XIWaYU5C2KFzgrWaasV+6L3j/X/pk3T
         9+ywcDZLx+tsPhCNAaeZpTd3YYsc2Civ5a7hmpDtWJ24+hJ+pe61rooyYEHl4C8LcCLB
         Ihcw==
X-Gm-Message-State: AOAM5329+4Vt+kAjw0poJ/BVDExCFsE7x4mWB26tqAdaMOZdAlc+5HuO
	nQ3cfLI6vbK5Yqah69oswiU=
X-Google-Smtp-Source: ABdhPJzKuHA3e++qD1J1+2gtrORg9rwJEIfmEkbuCyqSWM3iMvjL2retYMovMhZIVD9PM2dlK7/jTQ==
X-Received: by 2002:a17:902:854c:b0:163:7dd2:130f with SMTP id d12-20020a170902854c00b001637dd2130fmr41678602plo.57.1654811373949;
        Thu, 09 Jun 2022 14:49:33 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:1c1:4202:28a0::ec2b])
        by smtp.gmail.com with ESMTPSA id q65-20020a17090a4fc700b001e8520b211bsm152669pjh.53.2022.06.09.14.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jun 2022 14:49:33 -0700 (PDT)
From: Jared Kangas <kangas.jd@gmail.com>
To: vaibhav.sr@gmail.com
Date: Thu,  9 Jun 2022 14:45:18 -0700
Message-Id: <20220609214517.85661-1-kangas.jd@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
Message-ID-Hash: SXRSI7GSIZUA7DQLOKQUJ43BKWRIFJ6G
X-Message-ID-Hash: SXRSI7GSIZUA7DQLOKQUJ43BKWRIFJ6G
X-MailFrom: kangas.jd@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-staging@lists.linux.dev, kangas.jd@gmail.com, Dan Carpenter <dan.carpenter@oracle.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/SXRSI7GSIZUA7DQLOKQUJ43BKWRIFJ6G/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

gbaudio_dapm_free_controls() iterates over widgets using the
list_for_each_entry*() family of macros from <linux/list.h>, which
leaves the loop cursor pointing to a meaningless structure if it
completes a traversal of the list. The cursor was set to NULL at the end
of the loop body, but would be overwritten by the final loop cursor
update.

Because of this behavior, the widget could be non-null after the loop
even if the widget wasn't found, and the cleanup logic would treat the
pointer as a valid widget to free.

To fix this, introduce a temporary variable to act as the loop cursor
and copy it to a variable that can be accessed after the loop finishes.
Due to not removing any list elements, use list_for_each_entry() instead
of list_for_each_entry_safe() in the revised loop.

This was detected with the help of Coccinelle.

Fixes: 510e340efe0c ("staging: greybus: audio: Add helper APIs for dynamic audio modules")
Cc: stable@vger.kernel.org
Reviewed-by: Dan Carpenter <dan.carpenter@oracle.com>
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
---

Changes since v1:
 * Removed safe list iteration as suggested by Johan Hovold <johan@kernel.org>
 * Updated patch changelog to explain the list iteration change
 * Added tags to changelog based on feedback (Cc:, Fixes:, Reviewed-by:)

 drivers/staging/greybus/audio_helper.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 843760675876..05e91e6bc2a0 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -115,7 +115,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 			       int num)
 {
 	int i;
-	struct snd_soc_dapm_widget *w, *next_w;
+	struct snd_soc_dapm_widget *w, *tmp_w;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *parent = dapm->debugfs_dapm;
 	struct dentry *debugfs_w = NULL;
@@ -124,13 +124,13 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	mutex_lock(&dapm->card->dapm_mutex);
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
-		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
-					 list) {
-			if (w->dapm != dapm)
-				continue;
-			if (!strcmp(w->name, widget->name))
+		w = NULL;
+		list_for_each_entry(tmp_w, &dapm->card->widgets, list) {
+			if (tmp_w->dapm == dapm &&
+			    !strcmp(tmp_w->name, widget->name)) {
+				w = tmp_w;
 				break;
-			w = NULL;
+			}
 		}
 		if (!w) {
 			dev_err(dapm->dev, "%s: widget not found\n",
-- 
2.34.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
