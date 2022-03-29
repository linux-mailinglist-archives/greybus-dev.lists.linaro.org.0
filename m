Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 05B654FC2A3
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 18:43:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 361BB401B0
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 16:43:09 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	by lists.linaro.org (Postfix) with ESMTPS id BB6E03EA29
	for <greybus-dev@lists.linaro.org>; Tue, 29 Mar 2022 01:59:23 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id j8so6125195pll.11
        for <greybus-dev@lists.linaro.org>; Mon, 28 Mar 2022 18:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=Q2tEzc6qqUTq/8x9S+eo1Cjz2mjNMrLq0btC0WZqnOM=;
        b=Bj5rWMMqUgL/GsAyNikkuLD6Fiapi3KQknPLIqpvdw6qNvpOodVRhqD6Zx8YE7Kb5e
         3AUWVNw6NUkGik5KKu4qU/k5YSyrktA1aACy9otYtuR7WMO4E223UxWy4Brc9wvDB0/O
         uEM2mp7QVYOo6yXgu2rWNnRCJbCzraQILh34397i0OhyjQNSxrr2MQBLAr1ouwfiq0pY
         bIP7nYqAoKu5ZKSwDqeIBUHJpxTy8GdT1OGVKoWSCDVTp7NOdvI5E16vben5U3PJ7B0y
         oVIQTTqyZfbfFpg60kfS5hpXGY0saEXIlfNLCcD5lYt72/l0ZHNZISmY5sXkxhwZBJfQ
         N/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Q2tEzc6qqUTq/8x9S+eo1Cjz2mjNMrLq0btC0WZqnOM=;
        b=0humfEIImaknkGbRVDn20Iq+BKC1UpE1Lb6ljFmVSTLju+ZyD2RJP5gRGdYqp7oMfj
         uZHkLIztYE4kuRCmyUKCWG+SGUe0cYKXTGYW6TszJ0o1PZ+Xre7Bcf1vq/jNEKDDTnBS
         EekHA8yxPdQXSf0PlRBM/douMudlwLzbmAWQqjUvMNYyfwPPXLC+3SN2nvbgZ2q5Sg06
         2Ip+UH1Dbc2LYix+tiNuMl7T4kklk2tnooij24WVdzD+ai8AyQq6okBhliP+zOLNv8QT
         Pe5AnlolENs/FS4mnUuCzF3YaniMppBbhbawQuUy7H0DDBbK1TkuQsaeFKn+XUlZ1858
         P2yg==
X-Gm-Message-State: AOAM530e7erczofJrCwh0i1dIw2azmvyXEKtO6QuQvJBAr2AOBTLLUSX
	+95+ZKeFTST+oOySJYTBmRQ=
X-Google-Smtp-Source: ABdhPJyFcCNoQ/NPBV248dgiFpK3SjyUeJt5otlQ2gLkLeX9M1U17rD6APQ7GfI1hPe30uxQGJncyg==
X-Received: by 2002:a17:902:728f:b0:156:24d3:ae1a with SMTP id d15-20020a170902728f00b0015624d3ae1amr3094825pll.9.1648519162988;
        Mon, 28 Mar 2022 18:59:22 -0700 (PDT)
Received: from ubuntu.huawei.com ([119.3.119.18])
        by smtp.googlemail.com with ESMTPSA id hg5-20020a17090b300500b001c795eedcffsm736287pjb.13.2022.03.28.18.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Mar 2022 18:59:22 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: vaibhav.sr@gmail.com
Date: Tue, 29 Mar 2022 09:59:13 +0800
Message-Id: <20220329015913.10420-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiam0nd.tong@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: NWJ2WMZPRW2AI7GFP366K74YDLPB5SZ7
X-Message-ID-Hash: NWJ2WMZPRW2AI7GFP366K74YDLPB5SZ7
X-Mailman-Approved-At: Mon, 11 Apr 2022 16:43:07 +0000
CC: dan.carpenter@oracle.com, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: audio_codec: initialize data to silence static checker warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NWJ2WMZPRW2AI7GFP366K74YDLPB5SZ7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These three declares are here:
	struct gbaudio_data_connection *data;

Since all three of these functions check for if the codec->module_list is
empty at the start of the function so these are not real bugs to bypass
'if (!data) {'. To avoid static checker warnings like Smatch, initialize
the data with NULL.

Signed-off-by: Xiaomeng Tong <xiam0nd.tong@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..939e05af4dcf 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -397,7 +397,7 @@ static int gbcodec_hw_params(struct snd_pcm_substream *substream,
 	u8 sig_bits, channels;
 	u32 format, rate;
 	struct gbaudio_module_info *module;
-	struct gbaudio_data_connection *data;
+	struct gbaudio_data_connection *data = NULL;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
@@ -498,7 +498,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
 {
 	int ret;
 	struct gbaudio_module_info *module;
-	struct gbaudio_data_connection *data;
+	struct gbaudio_data_connection *data = NULL;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
 	struct gbaudio_stream_params *params;
@@ -562,7 +562,7 @@ static int gbcodec_prepare(struct snd_pcm_substream *substream,
 static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 {
 	int ret;
-	struct gbaudio_data_connection *data;
+	struct gbaudio_data_connection *data = NULL;
 	struct gbaudio_module_info *module;
 	struct gb_bundle *bundle;
 	struct gbaudio_codec_info *codec = dev_get_drvdata(dai->dev);
-- 
2.17.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
