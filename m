Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 59DFF399A70
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 08:03:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8E35561022
	for <lists+greybus-dev@lfdr.de>; Thu,  3 Jun 2021 06:03:29 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 57BBC60F4F; Thu,  3 Jun 2021 06:03:25 +0000 (UTC)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C3E3B6118D;
	Thu,  3 Jun 2021 06:03:17 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 68C4960713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 13:37:15 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 5572F60774; Wed,  2 Jun 2021 13:37:15 +0000 (UTC)
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
 [209.85.215.182])
 by lists.linaro.org (Postfix) with ESMTPS id 4998E60713
 for <greybus-dev@lists.linaro.org>; Wed,  2 Jun 2021 13:37:13 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id 27so2270012pgy.3
 for <greybus-dev@lists.linaro.org>; Wed, 02 Jun 2021 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ggtixs2081NFyzFZjKHEZFg0tSmZqU1lORXP6WHti2M=;
 b=ha4c+/+xV2Tg8r7LY6CYQfILogLoM9qyX2AB2ENNR2Kj4tmR1Nxfwr9QXbdvsl7lBV
 YgyXtHX+5m8dZz8qw9WvIgH8OkFmaZAo/EXo9KjNSk59rfE710G/8ayFxEg7OAHbAccY
 /vULJvNphqg35q0iP8wZ/LXRTvhK3fiq+fqtCdYGP4SSk5pBR4Q8egi8U0KOroQwZAO6
 R9zigCUJy8hwOZWUNJAKfP4EIgVQaXPRrZlxjvD8zLilFXYYqt58eYz8jgfZXbOzfOyw
 VLYnBKTBzApZAJnBk+nksamtwa/aRXPm5FSbXerumTo4gGpr2eY8WcaluzV5LF/zHdsF
 o2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ggtixs2081NFyzFZjKHEZFg0tSmZqU1lORXP6WHti2M=;
 b=gvgbOZoJ08Djzw8DthpL7KDBTEo1DTFWUIhFEmqovEPKpzi/1RmDz+Vk84MttQ+QLG
 C0HM1tISlDBfgXqOOK5EohYIfI0WQkIY0iEXUAjyTyp/SSi8kDDIxt7CkIjCrVbOuUti
 tquqgZ06RDutU0NpJixw7wt63sMhBQSQMZCp1HG/MKfMX0fNESR44ONMC9T57atdU99h
 fKoD8eLmSpRBg/2uDGGXzN0CEp4bthGsAbWAIHLG5hzyTzCEL75frr2IUi2TakKLElfz
 VJRtEp0ku7Dc/V2Bb9ZcQSLnQOtK6puuEhXsvXllwZAlDkCMx6X/z7axL4qro92c5t7H
 nVeA==
X-Gm-Message-State: AOAM531ApoyDv/yhWQXaiX9XRsGugdu8nfBOU5SQ/F0+9bGexc2CxwqB
 C2jxDOwic9Jly8IqO0DLZYQ=
X-Google-Smtp-Source: ABdhPJxSyat2Sj5uimWbBNoh8uTFj0dKrTGy/R2BnSoK93NYDr6PicCHpALC/bNrjzyERuRv41XHpw==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr14215853pgv.79.1622641032378; 
 Wed, 02 Jun 2021 06:37:12 -0700 (PDT)
Received: from localhost.localdomain ([183.82.159.194])
 by smtp.googlemail.com with ESMTPSA id x6sm907000pfd.173.2021.06.02.06.37.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jun 2021 06:37:12 -0700 (PDT)
From: sh4nnu <manikishanghantasala@gmail.com>
To: 
Date: Wed,  2 Jun 2021 19:06:58 +0530
Message-Id: <20210602133659.46158-1-manikishanghantasala@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Mailman-Approved-At: Thu, 03 Jun 2021 06:03:09 +0000
Subject: [greybus-dev] [PATCH] staging: greybus: fixed the coding style,
 labels should not be indented.
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
Cc: Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org,
 linux-staging@lists.linux.dev, manikishanghantasala@gmail.com,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

From: Manikishan Ghantasala <manikishanghantasala@gmail.com>

staging: greybus: gpio.c: Clear coding-style problem
"labels should not be indented" by removing indentation.

Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
---
 drivers/staging/greybus/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 7e6347fe93f9..4661f4a251bd 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -20,9 +20,9 @@
 struct gb_gpio_line {
 	/* The following has to be an array of line_max entries */
 	/* --> make them just a flags field */
-	u8			active:    1,
-				direction: 1,	/* 0 = output, 1 = input */
-				value:     1;	/* 0 = low, 1 = high */
+	u8			active:1,
+				direction:1,	/* 0 = output, 1 = input */
+				value:1;	/* 0 = low, 1 = high */
 	u16			debounce_usec;
 
 	u8			irq_type;
-- 
2.25.1

_______________________________________________
greybus-dev mailing list
greybus-dev@lists.linaro.org
https://lists.linaro.org/mailman/listinfo/greybus-dev
