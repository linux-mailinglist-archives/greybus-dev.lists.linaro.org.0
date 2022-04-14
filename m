Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6764A507B86
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:58:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9FF1440307
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:58:09 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	by lists.linaro.org (Postfix) with ESMTPS id 6CF6D3EF67
	for <greybus-dev@lists.linaro.org>; Thu, 14 Apr 2022 08:42:27 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id s8so4226202pfk.12
        for <greybus-dev@lists.linaro.org>; Thu, 14 Apr 2022 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=eJD0zgkQOtvBhg3kkOLY0JJ5fnzikCWkGfIBVnyjkyw=;
        b=SCIe2hRXByLjvsqBzSZB8ICjWmUkFlhXp81uju/X73gpEf7+GXrqi7qZaRfAvRbmmv
         CetmkAcq0whO6+BuZ0hVskN5LnbAgMzQyQ9M5bm43arg9HMj1pRUOk0NcPK23mgMMuVH
         vVkJL1zM47Uak2yYkRL1YAsfWYJAPWoo4xO5vN1Ni8WKsE5p5lTBYMAM1U2H5zZP0f/i
         U+PoM13iz1cXb0Uxdo/47d/mdTvPebCo7A5WU5/bwNCIQIA2P5WwPKGHq9cVX5Gg/2np
         H/PVeT0K1EcLLD9qzwRoXG37EOUCXnqmp1ilsYzR9yrUQSBTGjA5G8twgHwRBlH5ruVV
         k2RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=eJD0zgkQOtvBhg3kkOLY0JJ5fnzikCWkGfIBVnyjkyw=;
        b=fhtgQ42Tg2tQTO9UqRizMCvwg0/VW0bCLCJitpQ6zjpYu4vvlHipfvu95G3U8mBzrs
         CraZID7q2+UqZoFQrULEpi3zewHIFtKjcDlurkWxS3+hzZRLkM7VKJBM1haT4WStWJuE
         Mura+oYPIHl1uz597619sY9rWlsvd2v1UZR3tMDAesXoIxZ8pD7Llh+LfVMHGC6g8LP3
         bkkTfQjxLg8iHdB69Coo9Q9GzBwwmQlxP3n4SwxQpKPUIYl5TMK1/47wYU+1aYdezSfr
         0OJPZSlITKK+mYG0MRyRXgiObz1+gSdKbSg2BGyQ3//b5oAfTUyNfG26EYO8L2iCbP84
         XKCA==
X-Gm-Message-State: AOAM53350tnu76Ypme4CnU4+TcyrqAYCa1hpwZMq66vfPFe7ruCI0xk3
	4FvTQXFRQWZRXId8gQxfAQw=
X-Google-Smtp-Source: ABdhPJzaVPhzdnr/iDGxWIFtI6vG92JfkSadUCnYnYRQ315Q+PYJtunuyJakOXPgkdCr8swJOmxEXw==
X-Received: by 2002:a63:e051:0:b0:382:6aff:229a with SMTP id n17-20020a63e051000000b003826aff229amr1413694pgj.493.1649925746625;
        Thu, 14 Apr 2022 01:42:26 -0700 (PDT)
Received: from localhost.localdomain ([119.3.119.18])
        by smtp.googlemail.com with ESMTPSA id rm5-20020a17090b3ec500b001c7559762e9sm4977308pjb.20.2022.04.14.01.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:42:25 -0700 (PDT)
From: Xiaomeng Tong <xiam0nd.tong@gmail.com>
To: vaibhav.sr@gmail.com,
	dan.carpenter@oracle.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu, 14 Apr 2022 16:42:19 +0800
Message-Id: <20220414084219.13501-1-xiam0nd.tong@gmail.com>
X-Mailer: git-send-email 2.17.1
X-MailFrom: xiam0nd.tong@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AODDIWEENITWMKLMHHWY5H2SVFXJ4QWE
X-Message-ID-Hash: AODDIWEENITWMKLMHHWY5H2SVFXJ4QWE
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:58:07 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Xiaomeng Tong <xiam0nd.tong@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] greybus: audio_codec: initialize data to silence static checker warnings
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AODDIWEENITWMKLMHHWY5H2SVFXJ4QWE/>
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
changes since v1:
 - not bug, but can avoid warnnings (Dan Carpenter)

v1: https://lore.kernel.org/lkml/20220327060120.4316-1-xiam0nd.tong@gmail.com/
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
