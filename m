Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A533399A6D
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:30 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 1D7F1611AF
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:27 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 18DB36101C; Thu,  3 Jun 2021 06:03:20 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C475C609C0;
	Thu,  3 Jun 2021 06:03:16 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id CE34861145
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:13:18 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id CC1A761148; Wed, 19 May 2021 15:13:18 +0000 (UTC)
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by lists.linaro.org (Postfix) with ESMTPS id C503B61145
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:13:16 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id 27so8373759pgy.3
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 08:13:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
 b=n40THdRfAoBafaZbp00vGauvtDhhN41cyBhmX8LROnMMA2m4ryRmfFtwciXVPn2wEG
 JZMzcViWQpO/rxkeJqvd/yRjxqy+ERr9O/Rinc84y8DQ4yeX3Mpue3T2IiUJT4nyMEEX
 x859Z7VW1AeD8g+3niJPNx353nqxBt7Iv6z+dMhi5MxWU/eo3vrCswTLPh4/WqI0ju6F
 ISRZzhrXQaFwphhLhD0KkRg6gOIC62kqWBCQ+FVHCkYnN4x7vY/JzqNO3dn7sws50CGx
 wXbhgI/tNTxNoTTev1Eici2LlWqZP+c40KOH248Az9A46p1UmMtRbKdLHkvaU4CTBOcD
 nZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
 b=XCVWKcLPNx05DoY9ieqifouWXZdq+rHWQZqU8GjNvtYCXybgzuPrniNMASbknMgXI+
 zNLi5eAuO85KrX7+MHzQLtNzBFArubeniuxlOuVTb3r8cgUzkc72Zh9TcLphMmIrJ5Cy
 SAYHe+0ttYN5A0Fsd4Svs122NTvRp3oFJc4BQsR6ES0WbQZ/W6X3ujbGHnnM7urN9SKg
 xmWhBLE/XK+7rWOfL6+/vpjBmRI3qmIn52viHk6QMwqQTjGZYYh/CiIH6qFsMFHTPK8T
 vAs6eoZofvOqUErBcMbnrJ4pnf/YesmGXYAvwTbBFtkLeJdegjMrwvCCVeI8bLOBNa/i
 5qmA==
X-Gm-Message-State: AOAM530Yp/KaL4HucV1ik7r9hNF/C4KT8UFFzGsrFOwnd4hdDfTlz7Q4
 elY531c+St0hH5r8DGQnBtur
X-Google-Smtp-Source: ABdhPJy/Myxcy7bbgNjO9/KwP0pk3uC5ShQibLxNRwLOs5F4vzS/w4fcBWkjdNPZmN3wbPescTZr+g==
X-Received: by 2002:a65:6a44:: with SMTP id o4mr11269699pgu.145.1621437196050; 
 Wed, 19 May 2021 08:13:16 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:4000:11ca:dcec:9f88:85c9:3532:e27b])
 by smtp.gmail.com with ESMTPSA id n23sm2408025pff.93.2021.05.19.08.13.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:13:15 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: ash15.sulaiman@gmail.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Date: Wed, 19 May 2021 20:42:58 +0530
Message-Id: <20210519151258.25845-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: [greybus-dev] [PATCH] Staging: greybus: fix open parenthesis issue
 in gbphy.c
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Cc: greybus-dev@lists.linaro.org, "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

This fix "Alignment should match open parenthesis" checkpatch
 error.

Signed-off-by: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
---
 drivers/staging/greybus/gbphy.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/gbphy.c b/drivers/staging/greybus/gbphy.c
index 9fc5c47be9bd..13d319860da5 100644
--- a/drivers/staging/greybus/gbphy.c
+++ b/drivers/staging/greybus/gbphy.c
@@ -27,7 +27,7 @@ struct gbphy_host {
 static DEFINE_IDA(gbphy_id);
 
 static ssize_t protocol_id_show(struct device *dev,
-				 struct device_attribute *attr, char *buf)
+				struct device_attribute *attr, char *buf)
 {
 	struct gbphy_device *gbphy_dev = to_gbphy_dev(dev);
 
@@ -221,7 +221,7 @@ void gb_gbphy_deregister_driver(struct gbphy_driver *driver)
 EXPORT_SYMBOL_GPL(gb_gbphy_deregister_driver);
 
 static struct gbphy_device *gb_gbphy_create_dev(struct gb_bundle *bundle,
-				struct greybus_descriptor_cport *cport_desc)
+						struct greybus_descriptor_cport *cport_desc)
 {
 	struct gbphy_device *gbphy_dev;
 	int retval;
-- 
2.17.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
