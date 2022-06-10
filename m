Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6BF545DDB
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 09:54:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6ACDE3F4CB
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Jun 2022 07:54:35 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	by lists.linaro.org (Postfix) with ESMTPS id 1745B3EC74
	for <greybus-dev@lists.linaro.org>; Fri, 10 Jun 2022 07:54:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97F9A61FD1;
	Fri, 10 Jun 2022 07:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE5CEC34114;
	Fri, 10 Jun 2022 07:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1654847672;
	bh=DBQYB/NWje6Nr8mT58sp4vpMjE0yrhfHsUXtKYObB0w=;
	h=From:To:Cc:Subject:Date:From;
	b=dfpTaBopnWG8CcOHUvKfiXJy+VJv1UcOzVc6Z6N+l9InOyBVJwFs849QCxxzYSuYE
	 EW99L4QqeD0vt0deGSi4RRQGZLn/BRQkWg9sQKk7CdXWoK6+LCkk4fbuCTicgkM9vp
	 /BV/G6fv3ANFXgcuGbSmHfJtVMkPePd1mvH6kfzTsk9fOxLbveFqWaocqtFJNq50M+
	 4WsgShqDTwrP+wdCsuQsAnFQbjzJMgCrF8KRV6oiY+u43X75v9HJ1bPUL/JaHppo+A
	 j2ZVHOVMtOInwISsrCLAUAffB0Knc60YzO/I30TIhiz4+u15AX2HM+kn+J6tZA16Bh
	 Kvzis5ZaKrdBA==
Received: from johan by xi.lan with local (Exim 4.94.2)
	(envelope-from <johan@kernel.org>)
	id 1nzZTP-0004vk-7o; Fri, 10 Jun 2022 09:54:27 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Fri, 10 Jun 2022 09:53:47 +0200
Message-Id: <20220610075347.18917-1-johan@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Message-ID-Hash: NQLZJLLTSH6DXN7FSVKK6UUKBQ3XO2AV
X-Message-ID-Hash: NQLZJLLTSH6DXN7FSVKK6UUKBQ3XO2AV
X-MailFrom: johan@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Jared Kangas <kangas.jd@gmail.com>, Johan Hovold <johan@kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: replace safe list iteration
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NQLZJLLTSH6DXN7FSVKK6UUKBQ3XO2AV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

No entry is being removed from the list when iterating the widget list
in gbaudio_dapm_free_controls() so there's no need to use
list_for_each_entry_safe().

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/staging/greybus/audio_helper.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 07461a5d97c7..05e91e6bc2a0 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -115,7 +115,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 			       int num)
 {
 	int i;
-	struct snd_soc_dapm_widget *w, *next_w, *tmp_w;
+	struct snd_soc_dapm_widget *w, *tmp_w;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *parent = dapm->debugfs_dapm;
 	struct dentry *debugfs_w = NULL;
@@ -125,8 +125,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
 		w = NULL;
-		list_for_each_entry_safe(tmp_w, next_w, &dapm->card->widgets,
-					 list) {
+		list_for_each_entry(tmp_w, &dapm->card->widgets, list) {
 			if (tmp_w->dapm == dapm &&
 			    !strcmp(tmp_w->name, widget->name)) {
 				w = tmp_w;
-- 
2.35.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
