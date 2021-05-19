Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DA01399A72
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:33 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 78F646101D
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 7003F60FF8; Thu,  3 Jun 2021 06:03:24 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9658960FBF;
	Thu,  3 Jun 2021 06:03:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 528CE60B20
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 19:39:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 3BFC76114C; Wed, 19 May 2021 19:39:42 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by lists.linaro.org (Postfix) with ESMTPS id 30EDE60B20
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 19:39:40 +0000 (UTC)
Received: by mail-qt1-f177.google.com with SMTP id f8so11043647qth.6
 for <greybus-dev@lists.linaro.org>; Wed, 19 May 2021 12:39:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=02LE2Ct4623xELUCtUAbj1uXOX9qcsak7FEg/dNML6A=;
 b=dzfDU5azfxRNJBTqHYG8or7QUfom7Bu1BO+LfG2VWEDP7d5C7BLgyjBJpD0anJp0Ng
 3RBjBIuVcTRvCP0rq/fJk/A3IBXQQZml5+Slp74VHkrFyk2p4+sIffz0IxFOu7osZ8wn
 WFd8zC7EK0gZ6+7d5sTjs6X/5GnpheehKVNLjV07k8e7vrI9ZSevlrOqD7B7SOlP6cLS
 bSHX/NVngabjLm5e8Tj+Xqvsgi7KGVnN6gpAtkAmaTfM/HwAB6ijZwHdlZLgepKO/KXU
 vLm6Z4ItCEQee67s6+rfvv3dKAG+DSTFfJc0tAw1ozQ8yd8O8yflZSRefiCuGdAkNyAJ
 8M7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=02LE2Ct4623xELUCtUAbj1uXOX9qcsak7FEg/dNML6A=;
 b=sO6hpkSDkGD7dvVOsLkIr5366PDwQ0TXzH7ysvFM6z6trInGNSfWiEy9XzSJaUbqbq
 n8BU4bQkIK/jTI2agyOgpRiXINxdzEisEfuxMY1O8vxj04ir2Be6yzukoZ59O2rQSl35
 ibkyYK+xp0/eg9wPL51543zQn3lC8LzT8eT1CSD0QnhFHzP23AObetECdoxCmhdaDpQl
 N1wOBa0XfVhDoIyQDiqZGqtvyDXur2ywFXNgyoL0SaxP5nE4L2J4MtSwalreTaDw34JY
 LCjMTg2kwWZinEP5g8BXbmJFSPIyvwbQ1LiDgDPN4Yjg2dpwTINOwEjwhgWoOW9BqeI4
 DZ8w==
X-Gm-Message-State: AOAM53341Ax30zcQQtpsA1imrV8v7BfOqjeKRYaY3IT+j2GLj2zaW8wh
 c5xZC6IgZ1+Rrjfoh3W0vBM=
X-Google-Smtp-Source: ABdhPJwN55plgQPAvjtWPUvdAgqqHiW+O3bkKZ8Bz/1z18i4usXndqMUBllGpcoyTFCIeZS9EN18Bw==
X-Received: by 2002:ac8:5205:: with SMTP id r5mr1241881qtn.305.1621453179751; 
 Wed, 19 May 2021 12:39:39 -0700 (PDT)
Received: from ubuntu ([191.96.170.47])
 by smtp.gmail.com with ESMTPSA id w14sm279832qts.83.2021.05.19.12.39.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 12:39:39 -0700 (PDT)
Date: Wed, 19 May 2021 12:39:38 -0700
From: Philippe Dixon <philippesdixon@gmail.com>
To: vireshk@kernel.org
Message-ID: <20210519193938.GA7131@ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: spi: add blank line after
 variable declaration
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
Cc: elder@kernel.org, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, johan@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

This patch fixes the following checkpatch.pl warning:

WARNING: Missing a blank line after declarations

Signed-off-by: Philippe Dixon <philippesdixon@gmail.com>
---
 drivers/staging/greybus/spilib.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/greybus/spilib.c b/drivers/staging/greybus/spilib.c
index 30655153df6a..ad0700a0bb81 100644
--- a/drivers/staging/greybus/spilib.c
+++ b/drivers/staging/greybus/spilib.c
@@ -246,6 +246,7 @@ static struct gb_operation *gb_spi_operation_create(struct gb_spilib *spi,
 	xfer = spi->first_xfer;
 	while (msg->state != GB_SPI_STATE_OP_DONE) {
 		int xfer_delay;
+
 		if (xfer == spi->last_xfer)
 			xfer_len = spi->last_xfer_size;
 		else
-- 
2.25.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
