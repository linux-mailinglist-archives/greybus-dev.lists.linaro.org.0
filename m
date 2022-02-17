Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B614CA93B
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 16:38:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 0230D3EF48
	for <lists+greybus-dev@lfdr.de>; Wed,  2 Mar 2022 15:38:07 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lists.linaro.org (Postfix) with ESMTPS id 8C5273ED58
	for <greybus-dev@lists.linaro.org>; Thu, 17 Feb 2022 19:08:05 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id m7so6553734pjk.0
        for <greybus-dev@lists.linaro.org>; Thu, 17 Feb 2022 11:08:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/N0Rhhzz5vwAvXJwS8oHDh3H0bU+N1BFIY6++JNrEA=;
        b=I32ZG9aSf+guazsrpIpkMpf9UReyMsE3bpQQZ6ri67ToYEBZCORnXry2tmSi5TjU8J
         382+l2UPVDCC6WMcYhrQ4Ql/C8KnmmSsv4eN0pdwoUq1qX97hUA8y+pJAapfOixKQ08J
         xDyub5BY2k73NG/rjsLLz16hejmske6xZghcN+bObChI4+Pf44Y8Ozd+J561ppOjx8KG
         Wko6+4R9koNHhmnLe/PcG43TKfJBkI8+Iy3Dgj3fpFfZXe90ToFMip+4QGGO0AfHKjMn
         ACq4PbZBwJQOQuhsDZwgyrDhYNvCzkNIzJt3dK9rMHZTA5VcVOUWnxWe3DNrfdJbHG4P
         FQ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/N0Rhhzz5vwAvXJwS8oHDh3H0bU+N1BFIY6++JNrEA=;
        b=1IWsWURgw7QyEwo0Zj/CwtzTMvL58ypbaYZtGVNiw3zpDhLee60NI2fh87c/ZJh3Zu
         L/X/mjR/spMmtHtI8SuMHzD15DWkiVBv2YcVPENpvUMHknpGhfMy+3ZN9eNpyDTZkZuW
         1pW/EhUIGlQX0jG5vF4YhEqO6R2n/Q7gpk3l2asS51xLgUsPvzBONxnzZ8vCw3fSbqDM
         n1okbQ6LzmWpLlN3E347ttwSr1a08mKPzLd6qsbfc1CI3LChL0WmS4NMnUzDd5RLPVMP
         WVxbz2mpcoEk8kJjkAC15Tz76gzpRx3IkohR7SSzSb6LbTAxt95fCIdaRWP2z6Izuk/3
         qA0w==
X-Gm-Message-State: AOAM533r1GVY76CL4o39b6+m1stxXV3GboRsosnHYiiH5DWlOTuxH+kY
	fhdyswzEXMmNgKjsEksZoy8=
X-Google-Smtp-Source: ABdhPJylnRawVBSxsrWOtnvbZ8+881zQg6NSzIk9BizDTRVi2RHzCfV/Mdkmj6BMxBV3JDIVtD7fHw==
X-Received: by 2002:a17:902:b288:b0:14d:5f1e:4ff3 with SMTP id u8-20020a170902b28800b0014d5f1e4ff3mr4109531plr.24.1645124884621;
        Thu, 17 Feb 2022 11:08:04 -0800 (PST)
Received: from localhost.localdomain ([123.231.106.116])
        by smtp.gmail.com with ESMTPSA id k62sm8707864pga.86.2022.02.17.11.08.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 11:08:04 -0800 (PST)
From: Husni Faiz <ahamedhusni73@gmail.com>
To: pure.logic@nexus-software.ie,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Fri, 18 Feb 2022 00:37:22 +0530
Message-Id: <20220217190722.44894-1-ahamedhusni73@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MailFrom: ahamedhusni73@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GX3ALDS24XQTO5LTYTYYPCQYL6HJXCG7
X-Message-ID-Hash: GX3ALDS24XQTO5LTYTYYPCQYL6HJXCG7
X-Mailman-Approved-At: Wed, 02 Mar 2022 15:38:04 +0000
CC: Husni Faiz <ahamedhusni73@gmail.com>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: loopback: Fix Coding Style Error
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GX3ALDS24XQTO5LTYTYYPCQYL6HJXCG7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Macros with multiple statements should be enclosed in a do - while
block.

Signed-off-by: Husni Faiz <ahamedhusni73@gmail.com>
---
 drivers/staging/greybus/loopback.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2471448ba42a..33666a49e0a8 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
-#define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+#define gb_loopback_stats_attrs(field)					\
+	do {												\
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field)					\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
