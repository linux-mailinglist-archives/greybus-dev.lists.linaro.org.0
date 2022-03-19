Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CE34E2620
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 13:13:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A67523EF96
	for <lists+greybus-dev@lfdr.de>; Mon, 21 Mar 2022 12:13:38 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	by lists.linaro.org (Postfix) with ESMTPS id 38D093ECC0
	for <greybus-dev@lists.linaro.org>; Sat, 19 Mar 2022 20:21:30 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id o10so4217046ejd.1
        for <greybus-dev@lists.linaro.org>; Sat, 19 Mar 2022 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vHLMgXqZPwAjL27Id0sSqj94GzZmSc3lr7K5901Tgpk=;
        b=ZNtk/pp6yjLOiEaL/Kugxtk0VwmKSKQnMp/QX0Odlg3DSks4r6MCEHTB2EMZVVWn/v
         LmxJMZ1Rq6QEspYvEcZte27/pKeHa0zXORDmOttJad8LaM34/xYNQUB/4xPmTAPahkKz
         Tr6BWdiDNZykYDrMsAmIM/C/3lNOu4YYqZc6aY5xhrUb0aKzOp/M0+wrEnFcV+9qObg5
         yR/Pk1uYxQdc4ZEQwdgfYLYky5w4VzBG61xmOuAq1TAwHXNuvuLBhN7UrECZdY0zce+2
         wsVM+mYksjFjU2YnPResFSJ2/n0h3bXnuLxDhOsNabpEjrcDwuG9q5SpLpi/VGfM03pu
         zMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vHLMgXqZPwAjL27Id0sSqj94GzZmSc3lr7K5901Tgpk=;
        b=26uMY5UAs7IcXjaNhuAau0PqHb3Cb/Em5sXOIF6ToNbsmwkFYW5Rb7fxuZHhi+4GdC
         4c77XK3tdPJDRbqdytG1f4eK5peaHY6GB7u8dJy7TWm1coken298rJ4vVc6xg/kspfwh
         lEkb2re0K5B9g/wzexTepROtP8OTMwXDZJp63H/NPIAYugYBQi6FY0R2W6oC0l7cU6Jc
         EY7wSOm8f0GMrk6AFWMB1qXP5g6LJUEvimf0d43f4a5t0NO86rRC5GifarxqczweMp1I
         rFSt26ceZz+nz58wsvzY1DH912+4Htyj9AbfmQ9AHRWzAb8ddIbvZE8P3bXEs17rzfxS
         iRuA==
X-Gm-Message-State: AOAM530cJksoRLlgVW0JBUrZPdId1brr58ru93uTq8wlt4gnbGCO3tg9
	sfw0WTQbvloWZIFXTPua/Lo=
X-Google-Smtp-Source: ABdhPJwBdKbx0Y3W/PyFwMf1nRyC4G9Vb1RxtvkzGcHKA6U+X2LuzPFT6K7ipx0eljDg1AXH3aBvOA==
X-Received: by 2002:a17:906:7c93:b0:6cd:341a:a1d5 with SMTP id w19-20020a1709067c9300b006cd341aa1d5mr13999454ejo.698.1647721289256;
        Sat, 19 Mar 2022 13:21:29 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id rv11-20020a17090710cb00b006d5c0cd5e0dsm5103628ejb.82.2022.03.19.13.21.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 13:21:28 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Sat, 19 Mar 2022 21:20:58 +0100
Message-Id: <20220319202058.2518847-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: jakobkoschel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UC2QEE7OGUUEQU5MR3RZLJNJBLX5THXQ
X-Message-ID-Hash: UC2QEE7OGUUEQU5MR3RZLJNJBLX5THXQ
X-Mailman-Approved-At: Mon, 21 Mar 2022 12:13:34 +0000
CC: Jakob Koschel <jakobkoschel@gmail.com>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapoport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: codecs: fix type confusion with dedicated list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UC2QEE7OGUUEQU5MR3RZLJNJBLX5THXQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If the list does not exit early then data == NULL and 'module' does not
point to a valid list element.
Using 'module' in such a case is not valid and was therefore removed.

In preparation to limit the scope of the list iterator to the list
traversal loop, use a dedicated pointer pointing to the found element [1].

Link: https://lore.kernel.org/all/YhdfEIwI4EdtHdym@kroah.com/
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..0f50d1e51e2c 100644
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
@@ -592,15 +594,17 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
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
-		dev_err(dai->dev, "%s:%s DATA connection missing\n",
-			dai->name, module->name);
+		dev_err(dai->dev, "%s DATA connection missing\n",
+			dai->name);
 		mutex_unlock(&codec->lock);
 		return -ENODEV;
 	}

base-commit: 34e047aa16c0123bbae8e2f6df33e5ecc1f56601
--
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
