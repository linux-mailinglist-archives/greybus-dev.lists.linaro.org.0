Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 839E44FC2A2
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 18:43:03 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B1557401B1
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 16:43:02 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id 5D2473ED94
	for <greybus-dev@lists.linaro.org>; Sun, 27 Mar 2022 06:01:28 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id x31so3257955pfh.9
        for <greybus-dev@lists.linaro.org>; Sat, 26 Mar 2022 23:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=6MKU8QUY1L2KLGR2DZj/SIjJO3VMsnbAwKdZVAvU38Q=;
        b=HeE1ltv1IyIhmk58qv1eyAf9pMH6GYBlfgasv7WjsmP493BjLvnvxh/Qr//YKmoprk
         dJHLY8dBuVcvUCQ5SbyTBHuU+TIKCJSKxkQVEmSF1cILKZtRrlQpUhkODPHOBWJw+n63
         jVf6yobuNTTtS/R/f0DJY1oZ5eAe+zzEKMB1UH1dRXBHojFqGb1VBXkIsMUaR9lKyukF
         rRa9rePYYGMCGVmKvqIdprDRs7zv0sMsUxRbb3jFMA0BUuUQcinalbpn+jyIJLg06fKH
         8E3Esd1XUqeAXkg6otjwhKUrf9AXzzdoOF77iBu+zix4sOTadvjTiQVXEjxowy2YkzNE
         hgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6MKU8QUY1L2KLGR2DZj/SIjJO3VMsnbAwKdZVAvU38Q=;
        b=FVZHkslDP6QH1AHHwb7O5reUccgyqFaDFE/AERLCvqUSBmcoSZdIoqKBecHkMBFUPo
         k0aLNae5Qh2+t8ND/XUuU5XE8Ys3tTSLV+/06d/JvsZzja1H0iyT0y85gNE5PBKf9otL
         PRkFg+L0XH5IYnZ9457kZJR56Amu/mCCtQcjx+pq1KVoa8pyaBCtKGCF77C6m82AP5GL
         g/cS8JhUR60hAWWbG6gnd69/lO3DztZ/SJHamqFqlKuhKDKGZQKiDq3V6qFKIgp09Lmf
         0MFnwndgyy1H0UOvb9kTh57nILtL/NKcZPKmPpZsgJG1NrjdsQw2BTf5OwYftr4EoamB
         K3uA==
X-Gm-Message-State: AOAM530Rda77b9mHj+CAveBRmF+WYcEBTaPxVpRfDv8QC3hc8X8kw9jQ
	xYrK8dmEL4qJaINHON3Rbss=
X-Google-Smtp-Source: ABdhPJyePl/vuwUdTIAiOaZRsyJHZjTnbNl7woqQl9dyqCIcpM8g3SZVs/4/ckj/KQcrkLMUvw3Hkg==
X-Received: by 2002:a65:5a0d:0:b0:381:3c1e:9aca with SMTP id y13-20020a655a0d000000b003813c1e9acamr5741001pgs.562.1648360887480;
        Sat, 26 Mar 2022 23:01:27 -0700 (PDT)
Received: from localhost.localdomain ([115.220.243.108])
        by smtp.googlemail.com with ESMTPSA id ij17-20020a17090af81100b001c67c964d93sm15834043pjb.2.2022.03.26.23.01.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Mar 2022 23:01:27 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: vaibhav.sr@gmail.com
Date: Sun, 27 Mar 2022 14:01:20 +0800
Message-Id: <20220327060120.4316-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiam0nd.tong@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XAT6S53YT53LPFUNALKTVRLLTVDTYLQL
X-Message-ID-Hash: XAT6S53YT53LPFUNALKTVRLLTVDTYLQL
X-Mailman-Approved-At: Mon, 11 Apr 2022 16:43:00 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: audio_codec: fix three missing initializers for data
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XAT6S53YT53LPFUNALKTVRLLTVDTYLQL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

These three bugs are here:
	struct gbaudio_data_connection *data;

If the list '&codec->module_list' is empty then the 'data' will
keep unchanged. However, the 'data' is not initialized and filled
with trash value. As a result, if the value is not NULL, the check
'if (!data) {' will always be false and never exit expectly.

To fix these bug, just initialize 'data' with NULL.

Cc: stable@vger.kernel.org
Fixes: 6dd67645f22cf ("greybus: audio: Use single codec driver registration")
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
