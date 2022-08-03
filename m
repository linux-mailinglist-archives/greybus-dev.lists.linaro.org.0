Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6615158AAE7
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Aug 2022 14:34:13 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4D4943F30F
	for <lists+greybus-dev@lfdr.de>; Fri,  5 Aug 2022 12:34:12 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lists.linaro.org (Postfix) with ESMTPS id 478253EC7F
	for <greybus-dev@lists.linaro.org>; Wed,  3 Aug 2022 06:23:03 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id 15-20020a17090a098f00b001f305b453feso1017661pjo.1
        for <greybus-dev@lists.linaro.org>; Tue, 02 Aug 2022 23:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=pofh/mBkV9iyAkeXPvhTnC/91KwnyKUAxl/+MJcDnJ8=;
        b=Xbp0g8fX57U6TlkZXO9/p38tBgYrr5OiEcJnmkdc8AE8Q197Qk8nfzZWyFtkx6cqCC
         Nq0XKqMqtrpo9BlRKpxC1MCqvfSPlNVtLtrHFd1hpG0H23QINjZN7Q1DqDg45kf0XNdc
         QrRunSuT9DIXuNjC8s7v17thS6IEoDnj5am3zdtgNGx3SM/QvjaPxmocH2W5eQHXlB1q
         imrdEsnG86XSH0nzz7oqGbY/abogh8MGLxiXo0eMJ8W5fPHQOsVXsQw7FYcYIOCK8ojq
         ndILB4WJIpfdgi17uiPUcMxJ8qNaHVH0ucEdJhY3h5vfIYKnK91ND+GahrpTbDpgSGDx
         YZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=pofh/mBkV9iyAkeXPvhTnC/91KwnyKUAxl/+MJcDnJ8=;
        b=ECuI3VdOmos7S8vCEWuVYdHEhnW5C/97cVUnTbmCE1Ds8FZntwyvb0EgNk9RjyHoxA
         ArehPkciR0fAbGeBNU+tjGr2K7Bpnnu8fOW48/xrQBJp2mqahWx6cO4G2xPAPG1uf/77
         IyxaAqXBRQ5VKCov56gLTLbrw4FD8LbN1JW7HwrSy6bJvC1wCP3LuaUEfANhvxHKRLG8
         hf6omibe0aoS/BfbCbEw/PSDhOoH5b5q3lCc/Znzeg1DGj26KIW2/TPa3tZ3f80l+MfG
         oQXNdKOuRzFeRfSHE4XlMVHv9QO2XDok2cQC/F4CUWzNXEV8yuILGOicZleGb9/8jtAl
         shjQ==
X-Gm-Message-State: ACgBeo2A7a3yayWzSek+keIJFRj9/f7EW75SNpiyhOsYrj8FEmqvDh51
	FfjgtAedAmSobmKBFlOeSCtKRnyL8PQ=
X-Google-Smtp-Source: AA6agR7KIVRrBG/gZyKSvIANK9GZgONbH3AY03GLwWLZOMa1sSrXo77cPF8AkrFEcyh18eVvY7X8yw==
X-Received: by 2002:a17:903:1c3:b0:16f:878:ed42 with SMTP id e3-20020a17090301c300b0016f0878ed42mr5555777plh.163.1659507782442;
        Tue, 02 Aug 2022 23:23:02 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id k12-20020a170902ce0c00b0016bf9437766sm865885plg.261.2022.08.02.23.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Aug 2022 23:23:02 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: linux-kernel@vger.kernel.org
Date: Wed,  3 Aug 2022 06:22:58 +0000
Message-Id: <20220803062258.1650792-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: cgel.zte@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: CX35CO2ZX5YYYCQ2UANMBIRHCE7DU627
X-Message-ID-Hash: CX35CO2ZX5YYYCQ2UANMBIRHCE7DU627
X-Mailman-Approved-At: Fri, 05 Aug 2022 12:34:11 +0000
CC: greybus-dev@lists.linaro.org, ye xingchen <ye.xingchen@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH linux-next] staging: greybus:using the
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/CX35CO2ZX5YYYCQ2UANMBIRHCE7DU627/>
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
