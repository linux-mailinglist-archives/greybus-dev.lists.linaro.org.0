Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 50B3A3823DD
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 07:56:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8D87A60B99
	for <lists+greybus-dev@lfdr.de>; Mon, 17 May 2021 05:56:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id C4F5061174; Mon, 17 May 2021 05:56:46 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 7AC8360C0C;
	Mon, 17 May 2021 05:56:42 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 03BBD60498
 for <greybus-dev@lists.linaro.org>; Sun, 16 May 2021 17:31:42 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id DBF82604FF; Sun, 16 May 2021 17:31:41 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by lists.linaro.org (Postfix) with ESMTPS id D39EE60498
 for <greybus-dev@lists.linaro.org>; Sun, 16 May 2021 17:31:39 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id k127so3709564qkc.6
 for <greybus-dev@lists.linaro.org>; Sun, 16 May 2021 10:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=jZ8LOmff06oPPMAKh+a2jwE6y0ctqZ6V1VXFOR4SU0w=;
 b=UVVyfsvBXooBVNH5JuyXsbzu1D7n933coq3oC53JqIxd6tmmdmqRyFWxqyOXM6XR6w
 12KpGePCNG4lx2ZhnoACF4gHLgEOxeiiC4UaTBvC3CvkEH2QF/x8x/0MjNDI8e09HBtr
 3u3vm+CpRTYH7tQimi7hPEYZNzX+36rZo2cUDHuUqGmjif10filwv0wAGeBhjxN1WWhP
 dXDThqeDxngrKRoi040j4Bys18LFIYzD8/AB9e7FnVK1f/7Sh6YY+OR1HaMdT2QWp+wY
 xUoLigiysLE74nh12lL4E3XabsdZ3aOYjLFWaxIWUO5KfOT1rbq1Pr8vZBUJFQFEE5/8
 umkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=jZ8LOmff06oPPMAKh+a2jwE6y0ctqZ6V1VXFOR4SU0w=;
 b=B+/7xsUPiipJSFGU0Af/h544nReINLS+lk5839B/t/xpvF69YJyNFscoS7+jh2ZpwR
 VXMZmymuvR1vLBvekVd0AoKMrES/bM38w+JpYlngBD21OHCudFKziTjMjQv+CwHsNSuA
 S3s9KlWwJwCzTeJFDo7Z3LQ9NOElykgrBnSaT8lcrd6+MBl9igz/NbZTK71ZS1ZsKjdv
 T2sK8soJ8kC3zhTKsjkAe0ExMwEbPlmJmEuhmR8APDsV70rci3X3JH+5oozOsApA3lMe
 ExYS+cOzPUwbWY2Jt6mswQg2XsDvzKHEYBDuOK8MBOCz9TZv3gH1cGFq2SqthTyFoaQf
 vFcw==
X-Gm-Message-State: AOAM5309ErHMo/fb8SEGqNf2Zrvemxbya/UGyez5tczf0J9mwIgTuU1U
 rhqdrgzn1yC6jXGUqE5n1Cg=
X-Google-Smtp-Source: ABdhPJzkYHi0xkBNpfuJGhU5qaWfyPJAcIei0SZhQV69eer7522bZZIhPdUn7fY6aRBYl+UJYNRUCQ==
X-Received: by 2002:a37:a995:: with SMTP id
 s143mr51224554qke.414.1621186299470; 
 Sun, 16 May 2021 10:31:39 -0700 (PDT)
Received: from yusupbadiev-17Z90N-R-AAC8U1 (ool-45788941.dyn.optonline.net.
 [69.120.137.65])
 by smtp.gmail.com with ESMTPSA id c185sm8849615qkg.96.2021.05.16.10.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 10:31:39 -0700 (PDT)
Date: Sun, 16 May 2021 13:31:38 -0400
From: Yusup Badiev <ybadiev@gmail.com>
To: Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <20210516173138.GA586734@yusupbadiev-17Z90N-R-AAC8U1>
MIME-Version: 1.0
Content-Disposition: inline
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Mon, 17 May 2021 05:56:39 +0000
Subject: [greybus-dev] [PATCH] Fix typo in commented code. Issue found by
 checkpatch
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
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

This patch changes the typo "Atleast" -> "At least" as checkpatch.pl warned

Signed-off-by: Yusup Badiev <ybadiev@gmail.com>
---
 drivers/staging/greybus/arche-apb-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-apb-ctrl.c b/drivers/staging/greybus/arche-apb-ctrl.c
index bbf3ba744fc4..45afa208d004 100644
--- a/drivers/staging/greybus/arche-apb-ctrl.c
+++ b/drivers/staging/greybus/arche-apb-ctrl.c
@@ -445,7 +445,7 @@ static int __maybe_unused arche_apb_ctrl_suspend(struct device *dev)
 static int __maybe_unused arche_apb_ctrl_resume(struct device *dev)
 {
 	/*
-	 * Atleast for ES2 we have to meet the delay requirement between
+	 * At least for ES2 we have to meet the delay requirement between
 	 * unipro switch and AP bridge init, depending on whether bridge is in
 	 * OFF state or standby state.
 	 *
-- 
2.25.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
