Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A131B588152
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Aug 2022 19:48:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B7AD441092
	for <lists+greybus-dev@lfdr.de>; Tue,  2 Aug 2022 17:48:28 +0000 (UTC)
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	by lists.linaro.org (Postfix) with ESMTPS id 1D2A73F47D
	for <greybus-dev@lists.linaro.org>; Tue,  2 Aug 2022 07:45:48 +0000 (UTC)
Received: by mail-pl1-f177.google.com with SMTP id m2so5952780pls.4
        for <greybus-dev@lists.linaro.org>; Tue, 02 Aug 2022 00:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pofh/mBkV9iyAkeXPvhTnC/91KwnyKUAxl/+MJcDnJ8=;
        b=MlHjDd/GSzDh3km2sHGBqB0VrnzdSkUBCbxa9MN3lgM23qg+QH/9cn4YqdLrGkxnF7
         wvbXX8dg6WSQHtw2TD4m/mQNWtuA+UEY2UtI4YBWGFMPmMuTzm+GisZaSjTOZ3MV8MUP
         mn8O2jylhlnhZWMNqllv1BzSV55JL86WuisDkfUvjiluCwzJYtauV5R1d81tCJyS4jLO
         tQAsxcC5FyGZcieEIbdfS8DgJ5Q8693mLFFtb7FT4xw2pGhHxMp/UnOQwVpoau+su6uC
         WC9sEvmtEbfpmwdbIBfZWlzEaS5fdILrh2HaLfr4TkUt0aof9VnVYX62ShHwOBx0OFSS
         xHpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pofh/mBkV9iyAkeXPvhTnC/91KwnyKUAxl/+MJcDnJ8=;
        b=unPfGI4+SLLB8jAYwpzb0dpeEp1uBQIVRF623i36sJGhfEVBVFHBPm1vFnEog8qQpO
         cg45VzUcUeG0ygS771iKKfNSJtv5zRVK970ULafvdou904M7xoUHmMt9YlW0VqC2e0om
         WDkNqmrj0TLHbzPAtdgO6p2357Ip4eOjGI5xKXf+PH1h9C7BIaWthk3Qijui4ZJ58Svu
         jlaRoUreVTuSsyBJKv2hgfVrhBwIns6o1mTDQS02w5g1sWuGYO2WJwMk+u+jQI+IWsdJ
         FxLb9c0SzbsFXctRaXdH3Ih+fknyyvPNyEFvRBnJ+GqYkz1d0xLu3kthKNinZTdkuak9
         cMhA==
X-Gm-Message-State: ACgBeo0Eif6ftZCeHa2p+HcBMxKomvmnQC4lxpeiLHk4G8tIksEhFkuk
	DdcmQcxZf50WDfdQWRsyoCg=
X-Google-Smtp-Source: AA6agR6Qie5f4zp9P90DnxSZqjxV+ccwBszUIewBvDwJKYthIFEVqwyKd4RY5WxXaeO/kYsXE/sdYg==
X-Received: by 2002:a17:902:c406:b0:16e:df76:5267 with SMTP id k6-20020a170902c40600b0016edf765267mr11157809plk.8.1659426347138;
        Tue, 02 Aug 2022 00:45:47 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id o66-20020a625a45000000b005289ef6db79sm4651850pfb.32.2022.08.02.00.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 00:45:46 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: linux-kernel@vger.kernel.org
Date: Tue,  2 Aug 2022 07:45:42 +0000
Message-Id: <20220802074542.1648594-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: cgel.zte@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: MF7XRHJO7NNYWFDHNXQLDHMCKBISLLOR
X-Message-ID-Hash: MF7XRHJO7NNYWFDHNXQLDHMCKBISLLOR
X-Mailman-Approved-At: Tue, 02 Aug 2022 17:48:27 +0000
CC: greybus-dev@lists.linaro.org, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH linux-next] staging: greybus:using the pm_runtime_resume_and_get  to simplify the code
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/MF7XRHJO7NNYWFDHNXQLDHMCKBISLLOR/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: ye xingchen <ye.xingchen@zte.com.cn>

Using pm_runtime_resume_and_get() to instade of  pm_runtime_get_sync
and pm_runtime_put_noidle.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
 drivers/greybus/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/greybus/core.c b/drivers/greybus/core.c
index e546c6431877..b9063e86534b 100644
--- a/drivers/greybus/core.c
+++ b/drivers/greybus/core.c
@@ -174,9 +174,8 @@ static int greybus_probe(struct device *dev)
 	if (!id)
 		return -ENODEV;
 
-	retval = pm_runtime_get_sync(&bundle->intf->dev);
+	retval = pm_runtime_resume_and_get(&bundle->intf->dev);
 	if (retval < 0) {
-		pm_runtime_put_noidle(&bundle->intf->dev);
 		return retval;
 	}
 
-- 
2.25.1
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
