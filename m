Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C9C507B7C
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:45 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AA113402FC
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:44 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	by lists.linaro.org (Postfix) with ESMTPS id B05B63ECE6
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 19:59:26 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id i14so1286534qvk.13
        for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 12:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fGAe3LTsLkVSOmk5n1hYimC3Z+ei70JewOhDiYGXx2E=;
        b=mslVj8JNqY9h+etDhOaW5IR2IwPsASkEDfpx83ZM2H2oVURCRCLVverPb8AZ+5I+7I
         Yb4OLW38VZJrs5S4gGLSXXmcoXjjwrc3ryA4XueJFySQj9+K2ezEKJGlHBSHuIrFkgL8
         cymhOrNlfiLJD7cZybUL48DLP1cVPFSmc8KvkkVthiOU/UiANl5gN3P760Wp2CLZ8H+2
         HZ7QamWgc10Lp5ppiCELrjD9/FKVWLcAKRcBQM96E6QRhKZfFqjxJAbz+EYrfhVYXP1I
         8+jeWQKYhoi1mfymtcD1vUpveqaeQDjjnVB6odCA4Wa9HwN1N3zhg/Fgo73iWbFmAYEh
         NEiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fGAe3LTsLkVSOmk5n1hYimC3Z+ei70JewOhDiYGXx2E=;
        b=vmad+Ik9E740WfkW9wbuiX7DrwGy1hRb/j10VreMrMlEiiQFUY1267498dHApqfgqo
         Sz8IIpD3jWD/gKbOMkIAZ7MZK1jCR0CVCm9l64hxK7CJBFtyWGzQ6sCAPVg4qGE89FD8
         Xhtd10yZu1lOEJkEujPuzSZx+C1lgy0P3rxqhySMOA0NmbZnkM1dEzy8uTMoneaoevZW
         /5iFYZz/k9gN8VmC6qmLVPtFjZMg3Xme+C+g/eNg4Bl3vquVOT9dqMvHIFe+A6x9eZqg
         AlZU7rmmFv9+pkahMoDmdrIh6wLiPyhFhL6+Cpaxt48iYhVCKsKYNaOZ5TpXgTbnFVxC
         KZDw==
X-Gm-Message-State: AOAM530xebh57wHxxpHYkbX6aRGoCf3mtW3PxRPm6f7ar9Z6sVhS+Znu
	K47p9s28bZeaO5TrQCfsbBc=
X-Google-Smtp-Source: ABdhPJyyulonvQwzYbxt/mlsiQy6OiMMXokv29anfKFSczgkTC6EFhA44wlhlgNg6gRevoajn9OoBw==
X-Received: by 2002:a05:6214:625:b0:441:4934:3c8d with SMTP id a5-20020a056214062500b0044149343c8dmr5208428qvx.40.1649793566406;
        Tue, 12 Apr 2022 12:59:26 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id t7-20020a05622a01c700b002e1b3555c2fsm27270744qtw.26.2022.04.12.12.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 12:59:25 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Tue, 12 Apr 2022 15:59:14 -0400
Message-Id: <811ff26b07cf61efcc2814ed5033e8864ef16d7e.1649793138.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649793138.git.jhpark1013@gmail.com>
References: <cover.1649793138.git.jhpark1013@gmail.com>
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TZMZLBCRCXO4BOUMZZ6GFDEAY7TL5R7B
X-Message-ID-Hash: TZMZLBCRCXO4BOUMZZ6GFDEAY7TL5R7B
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:42 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/2] staging: greybus: correct typo in comment
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TZMZLBCRCXO4BOUMZZ6GFDEAY7TL5R7B/>
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
