Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D25507B7A
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 62A624030D
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:41 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	by lists.linaro.org (Postfix) with ESMTPS id CC01C3EC22
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 01:50:35 +0000 (UTC)
Received: by mail-qt1-f181.google.com with SMTP id j21so18236074qta.0
        for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 18:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0zgX0lRBSeUYGjy4/2KaVjVU1Nii6uaJF61nZ62EHQo=;
        b=ALgJryFJ8KuYRsLAi1C70WILaGJYBJhDByCkA4L1ffkmDCQ/ZcrlTh7vQsszZdUX9o
         tpDYK5/Bl7zAg9xOpA/+n1JSC/YhUIL83iiBcKEtVOlvRZZGuNfD0QM3biDB0YQUqt/e
         q2kTTCfXhdiIagqLBL8nroWc/e7+9wyvqvTqEwVkfKvsPBKFlTI26gP+mFCkuOMwgwb/
         tsbhTwcL+tE5V4KpcWj7r+B5T7Ocwk2aKDVRlKZfLstP+CkTxl/gO9wxp41K9fPIfd44
         SHMI5MfC4wFxdQeXE84aVPZLm7YaYklDFHx32VoPtEl06EIkyB/M89AjY30pDhgfkeX1
         Ytjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0zgX0lRBSeUYGjy4/2KaVjVU1Nii6uaJF61nZ62EHQo=;
        b=j6Xw0AtTBiIopUT8Nf0UlxwhPqs/r1djHT2u2KtOAj6CLuRo3qITDNtR8DqE59bhLO
         vk5OgYd1d1Jy272UCRvYNch/IkqCgH/7mFkN8D1ezqxdaCXApBAsmsEN+ojEI1u9jCMa
         FX+4ggWGk+ytVaUc+t88ttWUlSgdbtde/oV/RO0Nwtvmirm6g8v9gQc8WE6HLwnIVGng
         lmNDWw17NEvEe52H0JTEyDuuaou4dxLYREMM1G61bOHqrN2dTa2/5zxJm7GQzGOs4cD6
         jtwn4YrhulcKpD9HDN7r2LAbq2o5mwY+Pfk+XEMUSKhUH89ZCag6Tv4NQ6SsLjphcEY5
         Ixnw==
X-Gm-Message-State: AOAM5330Y4W3GeYj0ejUJQdqYX6SYBfrKA6fqMZUZsmvBoIFEZP8FDyR
	GYFaSESmompn14pZKUYwncs=
X-Google-Smtp-Source: ABdhPJyVeA6zt+aob1XQm4uc32KoNAGhowGFGSAdjfqXLMJZMqwhQg9FsbA9zzbKZLBucKwnc+oolA==
X-Received: by 2002:ac8:688c:0:b0:2f0:4bcd:1e46 with SMTP id m12-20020ac8688c000000b002f04bcd1e46mr1159320qtq.577.1649728235524;
        Mon, 11 Apr 2022 18:50:35 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm29556305qta.75.2022.04.11.18.50.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 18:50:35 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Mon, 11 Apr 2022 21:50:22 -0400
Message-Id: <eaf51ac31d264179298cb24c91f05a14e3651bda.1649712572.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649712572.git.jhpark1013@gmail.com>
References: <cover.1649712572.git.jhpark1013@gmail.com>
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: N2TH67FSBQGRF7N3NTQPY2QUTUQYR23A
X-Message-ID-Hash: N2TH67FSBQGRF7N3NTQPY2QUTUQYR23A
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:37 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] staging: greybus: remove return in an empty void function
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/N2TH67FSBQGRF7N3NTQPY2QUTUQYR23A/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Issue found by checkpatch:
WARNING: void function return statements are not generally useful

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index 0f50d1e51e2c..3e3a16568def 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -1032,7 +1032,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
 static void gbcodec_remove(struct snd_soc_component *comp)
 {
 	/* Empty function for now */
-	return;
 }
 
 static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
