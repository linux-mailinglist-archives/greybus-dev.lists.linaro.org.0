Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 103D1545783
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 00:41:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 17E7A3F4C6
	for <lists+greybus-dev@lfdr.de>; Thu,  9 Jun 2022 22:41:09 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	by lists.linaro.org (Postfix) with ESMTPS id 4326F3EF44
	for <greybus-dev@lists.linaro.org>; Sun,  5 Jun 2022 23:18:40 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id gd1so11469014pjb.2
        for <greybus-dev@lists.linaro.org>; Sun, 05 Jun 2022 16:18:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g3BmJglTAjdnPLCGYhrHUrRvgHR+8N25cKSWQP4OWdo=;
        b=ZAA3tFmKdv+hsGYm0P0OrG8/DX9rjJq2pyOvCXV69jvY+yDW/qejLqet7DFf4kJGkW
         a166XTuZRJPK82neRxN6fzYaAF+pqPSOVt+HnFAALjE9v3PGWFsfhpKRDS8NbFKrXQ4Z
         PvDD4J3CIthf1j8sOj8qIUfa94RLiByPZ2cMjVOMwbTmxudUsltxSC3Jq5jWReWbl7bd
         NeBTg1T93iIDg0dgzHUh8zwtZqJCOSNGKTgIuq4PlFgA5JvlpqTGd0RJ6onZtFgHs4o2
         HbKPNQnB4K/+EnfQqfxgyGkqjjbKbdi4Gdauzrj8sKFO8vGupI8A9zux47P51yWf1/M0
         9AOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g3BmJglTAjdnPLCGYhrHUrRvgHR+8N25cKSWQP4OWdo=;
        b=D1xc6MlTIkVSscQLlYb5Voeyy5i+AwrvqclwFtM3NGG+YLb4S/P997eWMu/5ggx/Gf
         L7rZy5nffPYdiu4dCZKF6bKvRogojDd3doofozC+WinADQdKSZVuZ8wTfTOPEQkevqlU
         jo8hUfD2I/3gFEOEJTC/k8XkGOJOyDBqrJSrL0RWB8AoSMeNgoCwtYrgQWTD4GjZyIfH
         k6ZxmHs1wv9dHvn+G50M4gI804QXmYEC9b4AhuognhSfFyET+rm4Ecu/NZI261VKy+Ag
         5AE1mIjR4XaKETcJXPy25XZQZDf9R2WmvL8rHDqXW4q9f1TTdBXG0gRjvUw9y08GQaob
         vzVA==
X-Gm-Message-State: AOAM532CKCDljK2UJxVyCbAhqFC+5XRkvSqzbHIsvq+wbLLaKiypqkKo
	mM0ML37/OgHO9rz7q7TwE/g=
X-Google-Smtp-Source: ABdhPJziDtmWG7/wz+O6OHwkY+cBzggnGgVgcvrHu3ixyvAj7J0WuFlqaijreDNHDRPBf4RSn78ITQ==
X-Received: by 2002:a17:902:d48e:b0:167:5752:3b43 with SMTP id c14-20020a170902d48e00b0016757523b43mr11355808plg.52.1654471119415;
        Sun, 05 Jun 2022 16:18:39 -0700 (PDT)
Received: from fedora.hsd1.wa.comcast.net ([2601:1c1:4202:28a0::ec2b])
        by smtp.gmail.com with ESMTPSA id f21-20020a170902f39500b0015e8d4eb1d7sm9051948ple.33.2022.06.05.16.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 16:18:39 -0700 (PDT)
From: Jared Kangas <kangas.jd@gmail.com>
To: vaibhav.sr@gmail.com
Date: Sun,  5 Jun 2022 16:18:06 -0700
Message-Id: <20220605231806.720085-1-kangas.jd@gmail.com>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-MailFrom: kangas.jd@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: Z2MDLFPQGLWD7VT7Y7TJLVXWHZWVCVOR
X-Message-ID-Hash: Z2MDLFPQGLWD7VT7Y7TJLVXWHZWVCVOR
X-Mailman-Approved-At: Thu, 09 Jun 2022 22:41:07 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, johan@kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, kangas.jd@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: fix loop cursor use after iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Z2MDLFPQGLWD7VT7Y7TJLVXWHZWVCVOR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

gbaudio_dapm_free_controls() iterates over widgets using
list_for_each_entry_safe(), which leaves the loop cursor pointing to a
meaningless structure if it completes a traversal of the list. The
cursor was set to NULL at the end of the loop body, but would be
overwritten by the final loop cursor update.

Because of this behavior, the widget could be non-null after the loop
even if the widget wasn't found, and the cleanup logic would treat the
pointer as a valid widget to free.

To fix this, introduce a temporary variable to act as the loop cursor
and copy it to a variable that can be accessed after the loop finishes.

This was detected with the help of Coccinelle.

Signed-off-by: Jared Kangas <kangas.jd@gmail.com>
---
 drivers/staging/greybus/audio_helper.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 843760675876..07461a5d97c7 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -115,7 +115,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 			       int num)
 {
 	int i;
-	struct snd_soc_dapm_widget *w, *next_w;
+	struct snd_soc_dapm_widget *w, *next_w, *tmp_w;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *parent = dapm->debugfs_dapm;
 	struct dentry *debugfs_w = NULL;
@@ -124,13 +124,14 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	mutex_lock(&dapm->card->dapm_mutex);
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
-		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
+		w = NULL;
+		list_for_each_entry_safe(tmp_w, next_w, &dapm->card->widgets,
 					 list) {
-			if (w->dapm != dapm)
-				continue;
-			if (!strcmp(w->name, widget->name))
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
