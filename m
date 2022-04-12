Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DEA507B79
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:38 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 53BD1401C0
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:37 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	by lists.linaro.org (Postfix) with ESMTPS id 700BD3EC22
	for <greybus-dev@lists.linaro.org>; Tue, 12 Apr 2022 01:50:33 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id c1so5424516qke.10
        for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 18:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=aXVbsRa2yH5DAASxHCBOihAz6ipOW8TA49XkgznzBFXPNgMxrfaH1kbEz7GlFFkcq+
         1XhueTEgVssesDPYvJOa5CcZS2SrQSNKRmkEvlNOlQ9GyK8bhy1jdvSRlXnNZTh6nr7W
         At4MeV5SRXN4YGyYuijU853lKVzVQpGtNmxT1Mch4kEb6d12LIIDHziyGyBRPZz+IXwt
         5ES2GjLuCzEqHPG3Y1dys8xtAM+ZZpVUHoNd3ETVgLgEOfxjL4TNagIBPcjl2ONRBrK3
         yLICfOldH1XCFa/nnqcjCV+Nd7gxsRh4FWsq4wdnXXH6D+8ALMcEqCO6Q197UMPBig7o
         TXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=V+uhDRnVaCfeOValKap1QbJV0ZPoBMrZwYkSrcVFKf/i4rUt3FL7kPvNbkzIDANXlY
         /nQJmxD4tD6fmdr2DKkBHCEbHmFx+QHvXsoOQ9FejKocdUTiGZWaIcjc2kAguSOyUn+1
         osY92XhZ6G9cbZU7yBZ4a06xXWI19qlgRPYR5+kCdKWfQfq0kJnH+AWbgZ+PnD/3M4s0
         9YshVPOs/rCTQ3ZG1MEg/FRTZbZm9HZMOUCnLDGVNFBoUvpfTNT0BqBA9IiIgC+RpTLo
         CCzK59WTc6Fso7Y2Z6KRoorW+E7738A2TMjW6Pff2PkEdo7M9EX5gHyq8bVUZdSYCtYE
         Vniw==
X-Gm-Message-State: AOAM532kQi1rn4rNr/jaD21BFZ8FWD/d3yqekNnTqIRJvRM9D1hyq64t
	KVlFsXNQoNSIa6h3wbKlvJQ=
X-Google-Smtp-Source: ABdhPJxsOqNQqNWBE75c7gOwbm9rwZ7jKHdxtsI5WotnoPMlls4ptrYn5I1yj0kL0v98wKpQREt+1A==
X-Received: by 2002:a05:620a:3728:b0:67d:4fe0:1e0c with SMTP id de40-20020a05620a372800b0067d4fe01e0cmr1634898qkb.102.1649728231862;
        Mon, 11 Apr 2022 18:50:31 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:50fb:900e:25ab:983d:ac30:58b5])
        by smtp.gmail.com with ESMTPSA id s16-20020ac85cd0000000b002e1ed82f1e5sm29556305qta.75.2022.04.11.18.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 18:50:31 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: johan@kernel.org
Date: Mon, 11 Apr 2022 21:50:21 -0400
Message-Id: <1c4f0dfb83ad0c603a9efddafac37cccb7204415.1649712572.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649712572.git.jhpark1013@gmail.com>
References: <cover.1649712572.git.jhpark1013@gmail.com>
MIME-Version: 1.0
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: A3SBOARB5VF6LFDT5NBFHAYRU6DKKAJI
X-Message-ID-Hash: A3SBOARB5VF6LFDT5NBFHAYRU6DKKAJI
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:34 +0000
CC: elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, outreachy@lists.linux.dev, jhpark1013@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: correct typo in comment 'Atleast' to 'At least'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/A3SBOARB5VF6LFDT5NBFHAYRU6DKKAJI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Correct spelling typo.

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
