Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 33BFA56A1B4
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Jul 2022 14:00:47 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 61B473F19E
	for <lists+greybus-dev@lfdr.de>; Thu,  7 Jul 2022 12:00:46 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	by lists.linaro.org (Postfix) with ESMTPS id 3B7353EBFD
	for <greybus-dev@lists.linaro.org>; Thu,  7 Jul 2022 10:30:01 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id l124so8100386pfl.8
        for <greybus-dev@lists.linaro.org>; Thu, 07 Jul 2022 03:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=/JzY69fgYbq8dtADJobUrT4pb7r35M4xnJaXr87cK3U=;
        b=a9aVdVuqMiOUWEOJn/eEiKvjeGgNjoOGexx0TYuarnc6MA6fKnZX6q87wE89z3nxwS
         Iamb3bCn6Oq9QZik2pniyxHheK0YjEugERSJcE4C1HpzCIpfKuooeBsLuMW5dEZuw+5O
         45GmKA4XfhOZW5OGBAcC8csosNk9BhC55ZsRGaqYOTePpfSerU4EaroP3jR0mnBfBTPI
         7R4naPGtD25x3TElm2zOSXHk1R2Hc3QsDbl89MwlojIXM+1j+PpG7KMglp2JZFj6Hg1V
         +RaOzc6qZXVX9GEYT++/upRvkrYZ1c29+BnFkbBOeX9R/JrIxD3D+Z09YJuNcP3jBtF5
         sziQ==
X-Gm-Message-State: AJIora8MI48LZOhMXpUWmdNWX+EdxVvRFGluzsl20qpXmBHp9I8d0P+P
	5W9G8JVqKztpeEVlCCuBiDg=
X-Google-Smtp-Source: AGRyM1sP5WYD/HQ6rAdWuX3ltvmMcNxBEYTPCu9kKK5hzBuh5N6HbxYmHp/HV+1kgm1U4f9RpXQjfg==
X-Received: by 2002:a05:6a00:1a15:b0:527:d02b:29c6 with SMTP id g21-20020a056a001a1500b00527d02b29c6mr49866585pfv.23.1657189800287;
        Thu, 07 Jul 2022 03:30:00 -0700 (PDT)
Received: from karthik-strix-linux.karthek.com ([61.3.52.131])
        by smtp.gmail.com with ESMTPSA id f73-20020a62384c000000b005251ce498cfsm2725939pfa.191.2022.07.07.03.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 03:29:59 -0700 (PDT)
Date: Thu, 7 Jul 2022 15:59:54 +0530
From: Karthik Alapati <mail@karthek.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <Ysa1oopf0ELw+OfB@karthik-strix-linux.karthek.com>
MIME-Version: 1.0
Content-Disposition: inline
X-MailFrom: karthektmp@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CP3S2RKTXTPSHV7UYWA66NFKJGYZZFQV
X-Message-ID-Hash: CP3S2RKTXTPSHV7UYWA66NFKJGYZZFQV
X-Mailman-Approved-At: Thu, 07 Jul 2022 12:00:45 +0000
CC: Shuah Khan <skhan@linuxfoundation.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: don't use index pointer after iter
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CP3S2RKTXTPSHV7UYWA66NFKJGYZZFQV/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

There are some usages of index pointer of list(w) which may not point to
the right entry when the required entry is not found and the list traversal
completes with index pointer pointing to the last entry. So, use w_found
flag to track the case where the entry is found.

Currently, When the condition (w->dapm != dapm) is true the loop continues
and when it is not then it compares the name strings and breaks out of the
loop if they match with w pointing to the right entry and it also breaks
out of loop if they didn't match by additionally setting w to NULL. But
what if the condition (w->dapm != dapm) is never false and the list
traversal completes with w pointing to last entry then usage of it after
the iter may not be correct. And there is no way to know whether the entry
is found. So, if we introduce w_found to track when the entry is found
then we can account for the case where the entry is not actually found and
the list traversal completes.

Fixes coccinelle error:
drivers/staging/greybus/audio_helper.c:135:7-8: ERROR:
invalid reference to the index variable of the iterator on line 127

Signed-off-by: Karthik Alapati <mail@karthek.com>
---
 drivers/staging/greybus/audio_helper.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_helper.c b/drivers/staging/greybus/audio_helper.c
index 843760675876..7c04897a22a2 100644
--- a/drivers/staging/greybus/audio_helper.c
+++ b/drivers/staging/greybus/audio_helper.c
@@ -116,6 +116,7 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 {
 	int i;
 	struct snd_soc_dapm_widget *w, *next_w;
+	bool w_found = false;
 #ifdef CONFIG_DEBUG_FS
 	struct dentry *parent = dapm->debugfs_dapm;
 	struct dentry *debugfs_w = NULL;
@@ -124,15 +125,18 @@ int gbaudio_dapm_free_controls(struct snd_soc_dapm_context *dapm,
 	mutex_lock(&dapm->card->dapm_mutex);
 	for (i = 0; i < num; i++) {
 		/* below logic can be optimized to identify widget pointer */
+		w_found = false
 		list_for_each_entry_safe(w, next_w, &dapm->card->widgets,
 					 list) {
 			if (w->dapm != dapm)
 				continue;
-			if (!strcmp(w->name, widget->name))
+			if (!strcmp(w->name, widget->name)) {
+				w_found = true;
 				break;
+			}
 			w = NULL;
 		}
-		if (!w) {
+		if (!w_found) {
 			dev_err(dapm->dev, "%s: widget not found\n",
 				widget->name);
 			widget++;
-- 
2.36.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
