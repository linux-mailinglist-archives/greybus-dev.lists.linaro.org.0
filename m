Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD8C4FC29E
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 18:41:24 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AAF76401B0
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 16:41:23 +0000 (UTC)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	by lists.linaro.org (Postfix) with ESMTPS id 3B5663ECC6
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 12:37:20 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id z92so16700975ede.13
        for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 05:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRjhCmUK3oCUee61cBk8RWBfzYem6vzRvo8MfD2Xsek=;
        b=TXnBWcEzq++rM6dKuuLB6BLFl6gqNs6THIYwaBvze0VDaT1xhchA/2D4sZuvIkC4A+
         Na98eVdTzfmRT+t+I3XEOCyQVchH6ujIL7WjDl3me4DULQxxu19jvtZi2Q6a8dieIjwc
         CpYWth0Ucw5mTFfayzPOTuxgo42NV7t5g8yqnhfxNPpW6ZU9gW68024901NoTsy0WhRk
         I3xcuC/NPtbSDQHHFRRLSnbe1nszFIcYqVtjCcNoThTcJawdDaiWYritHMJpWrx92OTZ
         5YXJbV0IbZvCiVH01JgNGqIR6TfJEiLzTm+CM1eEh/dOGrEPwwlNRSAzc3qVhaZarX/d
         8Lbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bRjhCmUK3oCUee61cBk8RWBfzYem6vzRvo8MfD2Xsek=;
        b=BnqvCa3XZ23LP5Bb6ACW9J5Fz9lXajItovjvpJCBfhylhmMTQwyr2Xq7jtZ0fPvCXz
         Q6uLbAf9Rlyt6Uh8CmBaSWJLHLtxxKV61K7vUeo155l4IM2mDkItyEdE1Dv/oWF/CDHY
         tJrS2kFfycZf7Z/S3cxHuoi9YYKVYJ9LNhwaHbksBU0gjSjRUfOnoak7qpkyRBa6UQU3
         K7Hy0duHVSCfRc+IbcYQmRrmSUBkElltt93GunjFmvRbEN5dSwzZHM48K6EtROU0KfC2
         avLnNqNutv0N9KGPUujTRU8ZuS5sraRBNVuCfG5EU4WdLsaWPCcONlmeS0Pro5ZnpS8h
         8h1A==
X-Gm-Message-State: AOAM533BEwW8Vio4ZKISNZt03kF/Oib/KmBVcXOgdldSwJycMm7IiTsN
	cw9Ljiw7LpPiGbzScU2ehJir83YSDKSxiQ==
X-Google-Smtp-Source: ABdhPJxdZNGfZ/MJWrWNAUwKIPsAS8dgeql0tJLH/bNUH2QSyyo1NxAh4EGJxzpnmqzwon6K90lyYg==
X-Received: by 2002:a05:6402:3488:b0:419:172c:e287 with SMTP id v8-20020a056402348800b00419172ce287mr14182660edc.87.1647866239250;
        Mon, 21 Mar 2022 05:37:19 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id g11-20020a170906538b00b006ae38eb0561sm6923828ejo.195.2022.03.21.05.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 05:37:18 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Mon, 21 Mar 2022 13:37:12 +0100
Message-Id: <20220321123712.3068778-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: jakobkoschel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LQWRSBXV54IRHC7QG4TUVVEAALN2LAMW
X-Message-ID-Hash: LQWRSBXV54IRHC7QG4TUVVEAALN2LAMW
X-Mailman-Approved-At: Mon, 11 Apr 2022 16:41:21 +0000
CC: Jakob Koschel <jakobkoschel@gmail.com>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapoport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: codecs: use dedicated list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LQWRSBXV54IRHC7QG4TUVVEAALN2LAMW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

In preparation to limit the scope of the list iterator to the list
traversal loop, use a dedicated pointer to point to the found element [1].

Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..a446d6455fbd 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -497,7 +497,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
 			   struct snd_soc_dai *dai)
 {
 	int ret;
-	struct gbaudio_module_info *module;
+	struct gbaudio_module_info *module = NULL, *iter;
 	struct gbaudio_data_connection *data;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
@@ -511,11 +511,13 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
 		return -ENODEV;
 	}
 
-	list_for_each_entry(module, &codec->module_list, list) {
+	list_for_each_entry(iter, &codec->module_list, list) {
 		/* find the dai */
-		data = find_data(module, dai->id);
-		if (data)
+		data = find_data(iter, dai->id);
+		if (data) {
+			module = iter;
 			break;
+		}
 	}
 	if (!data) {
 		dev_err(dai->dev, "DATA connection missing\n");
@@ -563,7 +565,7 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	int ret;
 	struct gbaudio_data_connection *data;
-	struct gbaudio_module_info *module;
+	struct gbaudio_module_info *module = NULL, *iter;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
@@ -592,11 +594,13 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 		return ret;
 	}
 
-	list_for_each_entry(module, &codec->module_list, list) {
+	list_for_each_entry(iter, &codec->module_list, list) {
 		/* find the dai */
-		data = find_data(module, dai->id);
-		if (data)
+		data = find_data(iter, dai->id);
+		if (data) {
+			module = iter;
 			break;
+		}
 	}
 	if (!data) {
 		dev_err(dai->dev, "%s:%s DATA connection missing\n",

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
