Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B08399A6E
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C58B6102D
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:28 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C274661299; Thu,  3 Jun 2021 06:03:20 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 03F6760FFB;
	Thu,  3 Jun 2021 06:03:15 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 6816D61101
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:12:13 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 65C4061146; Wed, 19 May 2021 15:12:13 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
 by lists.linaro.org (Postfix) with ESMTPS id 6030361101
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:12:11 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id g24so7465581pji.4
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 08:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
 b=fDqCDfJ54DtEaGdhd7sYWeGzt4g5NM1DIHv1VGG6R9KY3pCiA1TAMdlKwjMhGrUW2N
 qOPoXyUogAHhL6SxtjlanPeoWbzotuyDUU3DpwdBpor7gvyw8Kj4E6nK2h2nP29tGEua
 vM0ijpVrIhjmzHxQVq6+6a4jxUKihNrLATb/gkTaJubJwhP45QA8jxYHTQfU2lxtVxZ4
 oGp4y/zam6vB7FXyyOyM+ce6FzpeUA7S46S9VDMJpUL4viM/xz58Hk5Ib/hygwTXc1mW
 +oHmWmTbMIC2mHrZIdV4/eWvP+zb4gJi/vvLf84f40r2TOog30aKjvCgNVU54Dr3VYHb
 Xcdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=p1U+oAmLN15Il7adctUFj5XirLGOy/razNk7lJyJFbo=;
 b=A5rTcNohv2KClL4hZLnrRFcsCsHoBlbg+B9k4zyOfYDRqKWALReuw+D2HZIFXZJxlF
 SXW2cI1THEjk+4kSc8+PHSn2ER1lDkmqDYjQOAiFLgk/kH459s63G5gi0Cts9Je3+4n+
 RSUxoeQ0UjGdtq1Ypljy/GmgGHVuahKf6m77y+7EWPlAANO1ga86ER3u4b97ZwtHCUrG
 gnSp4EU+N18jwSx08f6zCO7kHn7wCShUM1Mbx8IrCoP997fsmo9L3AebSTNBxhPaTvE4
 Jn4sxx2sAwHij2zFla0f0hNnR7yzudXoSmmZZhE9K4QD4P7AKVHZPpU/kyN3Zqkihh0D
 +1RQ==
X-Gm-Message-State: AOAM533iKzED2m16JmeVWsYL08agIWE0meydU30BbyTiSxBUrF6YER8t
 MrS7Pom0LQS+TQzk67Aj3s0z
X-Google-Smtp-Source: ABdhPJwWWRjTit2FSgkPlyWC4e1fX4x3syhQE7l//ZKhD0H6Ai90FQWeppLVuJOiu5iuWP7Lfp15rQ==
X-Received: by 2002:a17:90a:d24f:: with SMTP id
 o15mr11834852pjw.83.1621437130579; 
 Wed, 19 May 2021 08:12:10 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:4000:11ca:dcec:9f88:85c9:3532:e27b])
 by smtp.gmail.com with ESMTPSA id c195sm6414618pfb.144.2021.05.19.08.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:12:10 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: ash15.sulaiman@gmil.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Date: Wed, 19 May 2021 20:41:51 +0530
Message-Id: <20210519151151.25667-1-asha.16@itfac.mrt.ac.lk>
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
