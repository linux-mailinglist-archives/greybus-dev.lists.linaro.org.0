Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D6F1A509229
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 23:38:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0F53B40461
	for <lists+greybus-dev@lfdr.de>; Wed, 20 Apr 2022 21:38:42 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	by lists.linaro.org (Postfix) with ESMTPS id 7185C401E9
	for <greybus-dev@lists.linaro.org>; Wed, 20 Apr 2022 03:07:05 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id j6so355869qkp.9
        for <greybus-dev@lists.linaro.org>; Tue, 19 Apr 2022 20:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LM+R8F9f5IgEgs7eRlVM40Gk0INro2H615+Nbx4F7ZA=;
        b=AM0cmwEFMxtoHtYuPdZJHmPizAC3xPDy9MhGdcWzUknn/k1IAH1/CkfCBrwmMqMGU5
         Op9Zhr4loojsszKqfNWt4bDt3iTTGaKM9D9Cr/7M2u7KnTsX8LzACQsmUl5kwnPAjETn
         DiqvoCu7uatWoMKscC6RcE/9094nyKbknbu5JyhdzOzDRryDv/kp0+cX7okT0Cp1QG6W
         FV2ustpw+3X670x2N3ZHxaqNt5t2Go2E/jRIVSRzVzBZGkCfG36EpZSyw01CsvDPpBQA
         sX/XNqDnoqf+9TtrBud0Z3rClxNnCiFO7Geis+W3mixcT3rprV5sdMYqRjjeaaYuxFvD
         HJ7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LM+R8F9f5IgEgs7eRlVM40Gk0INro2H615+Nbx4F7ZA=;
        b=tZLzH/YUBzUV8lvaUZVGz02Xt1UWXXsjy9TACKx7s/RTMCV+CZFQUlGkV9CNQ8xCDG
         UOqaIeBHRDiYLEYezZuimYZANtzTDSX88AY4a23uIl8Rxj+bfk49839zLgTCHaTUgEAr
         hdKtphgeMe7U20358I2nzPN54M0+UFAyJ87D9t7NskRaiXnlHabXZP4sfGWo2EvNgi0s
         lSfhtXTNrKSWnd/MUBN9aLWg0viMfYGS9huGQZZHPC8e8RPruzELk1Ftzcml/ub8frhl
         d5bHLelwUIi/bdgCmJP/eqj3+IAI2DwPNORuC2YfObQOuMTL40XqjOz871fv8hs5Ghtl
         C5zw==
X-Gm-Message-State: AOAM533eZp8QuLoeZPGEh0iEFA6RD75q+Rkv2qZIrhU8M9e53vjJICS8
	hCZnLDOM+aq+AUBT1fCcPDY=
X-Google-Smtp-Source: ABdhPJzjCuHLUi3jZowxZwNoFfPIn/5TAOu8OYoPIQjIC007jckvE0naRuD1/7B5aS0+InQCz5/Q4w==
X-Received: by 2002:a37:b984:0:b0:67f:64a2:313e with SMTP id j126-20020a37b984000000b0067f64a2313emr11220711qkf.3.1650424025131;
        Tue, 19 Apr 2022 20:07:05 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id u13-20020a05622a010d00b002f0c6664db1sm1020726qtw.49.2022.04.19.20.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 20:07:04 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: johan@kernel.org
Date: Wed, 20 Apr 2022 03:06:58 +0000
Message-Id: <20220420030658.2575942-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: cgel.zte@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6RTYPUZH73UABI6E5MEMHBA3WPDQPB5S
X-Message-ID-Hash: 6RTYPUZH73UABI6E5MEMHBA3WPDQPB5S
X-Mailman-Approved-At: Wed, 20 Apr 2022 21:38:39 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Minghao Chi <chi.minghao@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: using pm_runtime_resume_and_get to simplify the code
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6RTYPUZH73UABI6E5MEMHBA3WPDQPB5S/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Minghao Chi <chi.minghao@zte.com.cn>

Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
pm_runtime_put_noidle. This change is just to simplify the code, no
actual functional changes.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi <chi.minghao@zte.com.cn>
---
 drivers/greybus/core.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index e546c6431877..434aa5d9dd47 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -174,11 +174,9 @@ static int greybus_probe(struct device *dev)
 	if (!id)
 		return -ENODEV;
 
-	retval = pm_runtime_get_sync(&bundle->intf->dev);
-	if (retval < 0) {
-		pm_runtime_put_noidle(&bundle->intf->dev);
+	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
+	if (retval < 0)
 		return retval;
-	}
 
 	retval = gb_control_bundle_activate(bundle->intf->control, bundle->id);
 	if (retval) {
-- 
2.25.1


_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
