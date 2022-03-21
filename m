Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E19374FC29C
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 18:41:15 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D1B4401B1
	for <lists+greybus-dev@lfdr.de>; Mon, 11 Apr 2022 16:41:15 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	by lists.linaro.org (Postfix) with ESMTPS id AA7DE3ECC6
	for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 12:37:04 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id pv16so29613837ejb.0
        for <greybus-dev@lists.linaro.org>; Mon, 21 Mar 2022 05:37:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7me8S3DIeK4bexe2TBxZLK2PJKyh4lTG51mZlWXkZww=;
        b=C19FsPW3byM6bnKzUkgtA47+KFtmLiWrmr4t6hSJGULj2k309rEBEtN2OGQsQRiwuq
         Tf7pGGbRpBWabv9ws0LjfO1OL+rhABFTf+vjU+HIUUnAQRbmDhdFLmJpMp+yjZ8xSV4B
         KUfeNsDBZsJHX3FP8Lk7r2hiXgERWOOIBOGZ3FcOfhKTIgdhYHT3bknlW4P2YOYCrDXv
         5rkAOgvhMbmPGyyfARZBgE1MHiem0Ujlefjvar28MLDqRVXhaMP1F5tXGn792CIrUp8i
         qMmwJn+4Tj+g36DpgP5vT9kKWi3ykd/ErottJfQwACHtJmP9342GGljWeMeJpbxpoRYQ
         9WVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7me8S3DIeK4bexe2TBxZLK2PJKyh4lTG51mZlWXkZww=;
        b=KbccdgxYS61cdaIGaFRYjD+LHcRD430j1UkaEAR1yri5w7mxgDNvYw0Tf/UbCbJVh8
         VH3COYEgO+Z3mAGq0xUH4IftK/juw/gJyrfNAV/+s4FzeluEscMxd3vYorRYjEQgVYty
         L2bXRNIGntNS5VFD2/dDxxVKaq572hzcv7ePjPsY6QKELD1VtAjqRjqK9g09bD3FY+v6
         73yfJGicYKOkLQWvHdyb/upPqYxiTiUwUZ+rIpu3yXOkYYD1D0A8bqcoVFgYlQyKpPwr
         rpEtPzMlNmKOQCYvDm5AzFdVmhFBFTH2FP1V6luYWj+dvIBmQMvxfqD+RXN/AQSBJ6gA
         HOsA==
X-Gm-Message-State: AOAM5329aXO/cwpMJlXqAqBAuQDmDhKg9Fd2wNcCpgjtBNoUslrWnDQR
	ncQMuIgm0Er43s2/5zdfJBQ=
X-Google-Smtp-Source: ABdhPJz//+/NzM8a26O+rIuAgQzPd3NBsmf9i2GYdkXJe3FDISS5jPq35iB6eXU0g5Afq1Abig9xGQ==
X-Received: by 2002:a17:906:dc90:b0:6df:f5fb:cf91 with SMTP id cs16-20020a170906dc9000b006dff5fbcf91mr7190371ejc.429.1647866223710;
        Mon, 21 Mar 2022 05:37:03 -0700 (PDT)
Received: from localhost.localdomain (i130160.upc-i.chello.nl. [62.195.130.160])
        by smtp.googlemail.com with ESMTPSA id q16-20020a170906145000b006bdaf981589sm6836241ejc.81.2022.03.21.05.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 05:37:03 -0700 (PDT)
From: Jakob Koschel <jakobkoschel@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>
Date: Mon, 21 Mar 2022 13:36:26 +0100
Message-Id: <20220321123626.3068639-1-jakobkoschel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: jakobkoschel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: IU3YFHPJ6QQYEKN56OIGJAUI5SHWWNAQ
X-Message-ID-Hash: IU3YFHPJ6QQYEKN56OIGJAUI5SHWWNAQ
X-Mailman-Approved-At: Mon, 11 Apr 2022 16:41:13 +0000
CC: Jakob Koschel <jakobkoschel@gmail.com>, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Mike Rapoport <rppt@kernel.org>, Brian Johannesmeyer <bjohannesmeyer@gmail.com>, Cristiano Giuffrida <c.giuffrida@vu.nl>, "Bos, H.J." <h.j.bos@vu.nl>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: codecs: fix type confusion of list iterator variable
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/IU3YFHPJ6QQYEKN56OIGJAUI5SHWWNAQ/>
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

Fixes: 6dd67645f22c ("greybus: audio: Use single codec driver registration")
Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>
---
 drivers/staging/greybus/audio_codec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
index b589cf6b1d03..e19b91e7a72e 100644
--- a/drivers/staging/greybus/audio_codec.c
+++ b/drivers/staging/greybus/audio_codec.c
@@ -599,8 +599,8 @@ static int gbcodec_mute_stream(struct snd_soc_dai *dai, int mute, int stream)
 			break;
 	}
 	if (!data) {
-		dev_err(dai->dev, "%s:%s DATA connection missing\n",
-			dai->name, module->name);
+		dev_err(dai->dev, "%s DATA connection missing\n",
+			dai->name);
 		mutex_unlock(&codec->lock);
 		return -ENODEV;
 	}

base-commit: f443e374ae131c168a065ea1748feac6b2e76613
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
