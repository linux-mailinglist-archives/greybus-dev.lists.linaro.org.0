Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F37399A73
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:36 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E267560F4F
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 5283B61006; Thu,  3 Jun 2021 06:03:24 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6248061179;
	Thu,  3 Jun 2021 06:03:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id E64AC6090B
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 18:19:58 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id D19AA61146; Wed, 19 May 2021 18:19:58 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by lists.linaro.org (Postfix) with ESMTPS id CB2146090B
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 18:19:56 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id x188so10473036pfd.7
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 11:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=PW4uVNBA3mRHR7tGnDQy6S2ZgHL0fGnS5upoxeLAFS4=;
 b=LAgQL50DJZ6I9DmMa17MmOp5E9BA+o10kFJrra9ikHEiPJnl7hP3KDysdkzJPCxdO7
 DNZHH5mef9Uw1FEq/YgnMwDZSXtkBpurEZy40MAUAE7qhAJnlJnsb7eP20CsDOCoFlnp
 ghGpALsJQ/OuaPCQTkNbDnZfxhiFVZ6pCJbVUb1ZNKi/KgrEPysh+ylJBmltbEFGwF2q
 K5ru/1URHJN6RxsMaNI+py45qPI0/J/fk7PTJA2ziWIDGsMD/cuuSgd+R7oMoxChfN6i
 o0ebko7Wmxl1fqf6WZFguy6+GD++rzI0D0k2kMz4GLL40VcRGZE9SAcjuFlgE4XUttmr
 mjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=PW4uVNBA3mRHR7tGnDQy6S2ZgHL0fGnS5upoxeLAFS4=;
 b=mrk6Xzak4adG6RjYZwpA+GHQDXzDXC4tIoRBDmpX9RnOrILUBWGjlMlxNu3b4SEqxp
 VHKNCkc86EgUpQG5KOf+NUn7cYmOZdGxSsoxayaqYw1C9q8HaOAzAlA+ezsaXnIH32cN
 d3m464iu2Ersw/lPIr6sDzQTta74JFWsO22FE+T2keT7MHl/7R82DpM6cMKHth1WcZEt
 eEGNQDsU3HSZXVtMMiEX4Cj3xpw0d6dd205o8q0Az1hEblcA7wC854MyRISLB0skXhn3
 luD/DQhgXa0X2GqhzzNe7k0cmF38Q+j9MsmNpFF9H1aBueP6pOeWo+g0K7wvZ7dl6wj2
 T2ug==
X-Gm-Message-State: AOAM530au1q2N1xdsQNzNNTZXFX6jh3Xm/L2A20ewVrhNb7ckiG+4Zf0
 6dR7wMuX9YODE7oZ+5G5665L
X-Google-Smtp-Source: ABdhPJwXcf9yyVLYIrdBHqNyMJx+0WlY19enz6Kx/vmPzEP/3lG3o6ZWg/PgjWn9idU+8IRKMq/cXg==
X-Received: by 2002:a63:5218:: with SMTP id g24mr384869pgb.309.1621448395848; 
 Wed, 19 May 2021 11:19:55 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:4000:11c7:ee12:ddf7:464f:3770:cc69])
 by smtp.gmail.com with ESMTPSA id 205sm78211pfc.201.2021.05.19.11.19.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:19:55 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed, 19 May 2021 23:49:38 +0530
Message-Id: <20210519181938.30813-1-asha.16@itfac.mrt.ac.lk>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: [greybus-dev] [PATCH V2] Staging: greybus: fix open parenthesis
 error in gbphy.c
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

This patch fix "Alignment should match open parenthesis" checkpatch error.

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
