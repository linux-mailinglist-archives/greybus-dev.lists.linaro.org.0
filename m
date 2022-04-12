Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 411D3507B7D
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:49 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7A164401C4
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:48 +0000 (UTC)
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	by lists.linaro.org (Postfix) with ESMTPS id 2819F3ECE6
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 19:59:31 +0000 (UTC)
Received: by mail-qk1-f175.google.com with SMTP id e10so13038086qka.6
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 12:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hepSgzGX1ayc5uaj+DhWfA1vMc3etzGY6KGlUx8uOco=;
        b=PqH3myYYEiMPoqI86MF0nXFrvRxRIHfXKpTlfObqjZJnTOf+3mjUYUh+R+kIOYs4hJ
         kTAqkPm1coLb4HqVU9FlJbQkE+Z7s7WM+0TrADSKnyuczW3KmOO/fALzISpjqHQZAo+Q
         UCuLRNoQl+DufWzGtMIgHSVVJvxz/ZcYQ2p7Ob2XPFKscZIvf8Y4+btFtXkNMievHvfc
         Y1zkIkZ+ZyWdICeueBhHF5DVwUwLgw2afEIKTD2ZN8Q4HOEUot135n3jA1CI4OAABlV5
         +bIaO39UAOZB0gHxTZvqurHK4Y77blmEwL33sYlIvci5FWWt4yaMQ+QUmoV7C6stl67V
         UgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hepSgzGX1ayc5uaj+DhWfA1vMc3etzGY6KGlUx8uOco=;
        b=lmu74CIAUQVleeJTGGkCY7Z/akQ6DnagiCb+Rny5u50nLO/l80SpXig93kXnnD0oKa
         WrEzKXp7UaABRkS7BtFDyXgqNLQ887fO/Sw3LkXUs4M7PvCrXsEYwOhUlLEUyZci3wRM
         VuFPGoatWAoqCE6gZcXfrZybnHA8zVjG3PVfiHigi+cFLPUDQ2reX0RmgSx0SaeYCsgX
         euEZkJwOk/j3fhkMB0mulY0jdNPiRt9TVt5EHvfRAAEVwFSlT9akaBuvywzX5uzocsBL
         4h70cKX5Y9+OS6AjyX8eOfm4DTI63hypiAviyVPX7pi/k5E1aRCyfCb1Qm4Rz3zuLm/S
         RVTQ==
X-Gm-Message-State: AOAM530/91Oz1fEMWN/crWvJAxCqfKkQ5IfUavjWq+2oqZQaK7v3R0b0
	NLtXYds0D52RVMCK1eg4tfQ=
X-Google-Smtp-Source: ABdhPJySqzDv3PGtG9/O5YcAzDMDnFRohUff7hHMdby3sYkeQsP33V9rXq8vbvK/mrOzdnbpyQO/Lg==
X-Received: by 2002:a37:9a83:0:b0:67b:31be:2ac2 with SMTP id c125-20020a379a83000000b0067b31be2ac2mr4489603qke.416.1649793570850;
        Tue, 12 Apr 2022 12:59:30 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a01c700b002e1b3555c2fsm27270744qtw.26.2022.04.12.12.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:59:30 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Tue, 12 Apr 2022 15:59:15 -0400
Message-Id: <d4d01ecdabc492e52a3decebf165d1f584f3b3bf.1649793138.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649793138.git.jhpark1013@gmail.com>
References: <cover.1649793138.git.jhpark1013@gmail.com>
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7WAZRYR3PWQ6SGFJCF4LNDOEZIV6GBAZ
X-Message-ID-Hash: 7WAZRYR3PWQ6SGFJCF4LNDOEZIV6GBAZ
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:44 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 2/2] staging: greybus: remove unneeded return
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7WAZRYR3PWQ6SGFJCF4LNDOEZIV6GBAZ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

An empty function with void return type does not need an explicit
return. Issue found by checkpatch.

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
