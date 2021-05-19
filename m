Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9D3399A6C
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:29 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CA17E61016
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:25 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 6246E610CB; Thu,  3 Jun 2021 06:03:20 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 22ADD61020;
	Thu,  3 Jun 2021 06:03:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 2F97C61145
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:19:26 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 22C0361148; Wed, 19 May 2021 15:19:26 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by lists.linaro.org (Postfix) with ESMTPS id 1CB2961145
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 15:19:24 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso1914373pjb.0
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 08:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=itfac-mrt-ac-lk.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=k8zjSgfqxLxlFthhLmpxkp9fckpuIPaxUqjese+DfO0=;
 b=wxXiEk5cfMSn+oebUrmAqIxaxe3uQoavSW8YeWQIpptNjA8WnDUG7VePoKAlmC0X3O
 ExXkJhERYYfGeg2YXpx0++bbi4QYlSbcGAfqPdxo9ev9zPukWzNm7rGwDT3nj1YTuGO0
 CyqCooNqCKOADjpBaIOmx92dSqsKRRtofCEKtqxEOufeykOaCXulsYTxLQdcCkH8rps3
 BFpJEDMY+8rXMy8gq/yV5F5w3DuA8FIlYu1h6gk+HoD9bgalLiAhkl9MiS4C00OwyGhm
 QmLN1FilocmSUpmomQIomX4Ihb9ZzgL98w9OcjN/zsoNcyBAItwWW0jeyqC+3cXiZzko
 9jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k8zjSgfqxLxlFthhLmpxkp9fckpuIPaxUqjese+DfO0=;
 b=lBCU5o+X4sEtb6JA9YkDNZHa88S0vIaDa3tS8zBY6AKGKif5Thh0RE4wJzAtE+Uc9V
 ACkYhCWE48cFRBEZso+JFODRtt1ofe2e14dteOksKNLQApjkj+y1BNskKwSpXBxzqYDA
 HZxZS8T6uoGSQPSUuj/r3usURQPc8UfO8vY/MRP4edcVO1Hof5fTqbc449OQq0woIZep
 2/BbbnbKlKiCI3NYqK6Gp3YXJaifJCtWhbNFLHtWpVow6AGTeaSgNQ53GeDvNgSgcerq
 UYbrgp2TcG4CF/3JcHu8xf+kzaX3sbnEkSF3hisGyU5LztsH7TDCuAKKmYa8XgS3VFOc
 epOQ==
X-Gm-Message-State: AOAM531zyN/cEHuKAzPCxlg/SNmmQbFTIqoEulmLWinA23UqhkvN0UzI
 JAyKtb1H2D3jWXKVsKCzDWBu
X-Google-Smtp-Source: ABdhPJy2iC8QxPrIsMllescdd+wISCdojKR/IHdc3CqJD/XKucc1n3UJ6p9YkgMXX9Ve2iyS5UhnHg==
X-Received: by 2002:a17:90a:a78d:: with SMTP id
 f13mr12007709pjq.161.1621437563291; 
 Wed, 19 May 2021 08:19:23 -0700 (PDT)
Received: from localhost.localdomain
 ([2402:4000:11ca:dcec:9f88:85c9:3532:e27b])
 by smtp.gmail.com with ESMTPSA id k1sm8804547pfa.30.2021.05.19.08.19.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 08:19:23 -0700 (PDT)
From: "F.A.Sulaiman" <asha.16@itfac.mrt.ac.lk>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Wed, 19 May 2021 20:48:51 +0530
Message-Id: <20210519151851.26006-1-asha.16@itfac.mrt.ac.lk>
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

This fix "Alignment should match open parenthesis" checkpatch error.

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
