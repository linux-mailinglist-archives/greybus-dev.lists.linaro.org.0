Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A97DB507B81
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:58 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E236E3EC24
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:57 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	by lists.linaro.org (Postfix) with ESMTPS id 34AF13EC47
	for <greybus-dev@lists.linaro.org>; Wed, 13 Apr 2022 04:39:03 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id t207so573742qke.2
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 21:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WErFaGsZeydU2G+yqS+vuepSAgxDO/xhmvr6tbUUEKs=;
        b=LgxEj98Ue+g5tZSw7pySZKcC+mlOTyCjF2bv1rvWqw6PGnNi2GVJ5cpx+jrwapHcM/
         PV/bXRZy+w6MedYIUuVPY4LgKFXnxZUmG7cpwqgTs2jKKRFDmS1AhZmIlypjvT+J7pTM
         7oP5PTIvF00mvMNY4oQHnPDoXmX8v0pZ071h/n9lKPulEJVzg10H2def68+nn0gh91oe
         GquCSuwKEWYxcXymRDx5pLKHst+rNIiyHX7fJIipX1VDX8WTAEre6BAIXDI73ciXgd6F
         jHCjVzkxB1H9WbaEbXj6i1lfp/VQVMKxAWTfyAqvgKs6EQbzJSNYJZ1yze9d/1Mm4+gc
         3EmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WErFaGsZeydU2G+yqS+vuepSAgxDO/xhmvr6tbUUEKs=;
        b=oJ1v1W/9mTTvVJgtgSE/UAlU+/QYKbTtoLBSzL2EXagrt8wGoVM/Z4EjvYWs/cXZRG
         YCwFZSGldLqi5Nq33YK8Apt3x9NGvuJR8WzGcu9XoLzXp1QZUqV4nKMmA46Vc4zivUnj
         XtdxwwbOUFE2I0tPadCmUNfUEpWBA/Fd9/+3oPVaWfZW6OIEh9+sO1K4AMMCSgwa7LtB
         uY1GAEF9oqWRijTgvFMTqngGqo7ww0iKJYYQhtcGUTG19PcpCDBmmmVHlIpVUeVc83gs
         zbkVAFsgM5wXoojM5JjUhvK9RCs4IMsRbBqE+C20Z9D0i3tPJaU+JvzWW2D3T+4eRwSy
         EYJg==
X-Gm-Message-State: AOAM531g59j4B/RG9RBj+yM+J8iVs0lAjGVEsGfOKMdLAwXETDXslYwL
	5CDZEXeXe+0gJMEbQ9WO8Sc=
X-Google-Smtp-Source: ABdhPJzMUjmFOWMutAiPHFw3TfOyB6lPTD/Bv8L4/M11SKvSvx8jIlR/T0XmQ2lqWc+oLQYEgEL3sg==
X-Received: by 2002:a37:4349:0:b0:680:f1f5:23b0 with SMTP id q70-20020a374349000000b00680f1f523b0mr5388159qka.530.1649824742805;
        Tue, 12 Apr 2022 21:39:02 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:5e57:caff:f44b:33f4])
        by smtp.gmail.com with ESMTPSA id d126-20020a37b484000000b0067e60283d08sm21984056qkf.40.2022.04.12.21.39.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 21:39:02 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Wed, 13 Apr 2022 00:38:51 -0400
Message-Id: <2feb03de97ca4dbd27c22cf40f8e185f7dfaae29.1649824370.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649824370.git.jhpark1013@gmail.com>
References: <cover.1649824370.git.jhpark1013@gmail.com>
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2QG62FCA6QKH22WIJ37G6XDX4CCLD5F6
X-Message-ID-Hash: 2QG62FCA6QKH22WIJ37G6XDX4CCLD5F6
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:54 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com, Alex Elder <elder@linaro.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/2] staging: greybus: correct typo in comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2QG62FCA6QKH22WIJ37G6XDX4CCLD5F6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Correct a spelling typo from 'Atleast' to 'At least' in comment.
Issue found by checkpatch.

Reviewed-by: Alex Elder <elder@linaro.org>
Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
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
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
