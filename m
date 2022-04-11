Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C993507B76
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 22:57:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A3CFC402E6
	for <lists+greybus-dev@lfdr.de>; Tue, 19 Apr 2022 20:57:30 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	by lists.linaro.org (Postfix) with ESMTPS id C76B63EBB3
	for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 21:25:17 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id z14so3596702qto.5
        for <greybus-dev@lists.linaro.org>; Mon, 11 Apr 2022 14:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=fUqMBkoKzef3RisQA1sUZojBghR4Vv1ytVm3k7JG8Xk1pRApJTqIcviBhfUKzadIwH
         SSvyJ3u4de/OQ96L15TYxpf5ictDfgiLTTXmvsiamW1eVgISuP/C4Ypwu/yJB3v3GXz1
         hlh3LonXPcIBsg9oVjvgcmUTYqOMMIrC1xGw2KOhYxGjIXq92mwktFtxSms2Rfwrah8D
         vWPsNxxYN+d104ogLLvOMh7IowdB/qKPsrNOlGQbP/Hwct4dHgLvowJfg6hM5elnPNMY
         N0iddWazs/3sQNSNRSme9eByZh25T1oWOfLAGuaBAP8Uxzytux0nHpe6E2ChV/AAI/+G
         jDiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=sEEO1a9gpg66HFf13zmhoKxUPpsxt/WYjEBH7Mta+38=;
        b=ldEM2vaMeW3ulXVdTxz0kon7bocuvFy7NZ10OLRX7D0n25TEZJpTVcT0ZQsp1f49IY
         2j0XTDXzDynT0+S9L36ysHf6bc1QOIIhjjZoRgu6+epWuL40lj/8FvCH/04JMNmTAs7U
         bX7co7pMhTRd4TzSwMjQC+OnCA0pyBT5YjxT+olDdlZ7UEO+uau+kL+j2z0CkG3l6hVN
         F5XixN3c3GlvnKCucTVyccuMXEO1bOhsSEcKTNcYyGk1vhSY1kV9a3vqagpMm66hqA2A
         6IBORd5zwKLmjq63ulehGWfrXpQ/uJ2VjZXolP187zZRZxYAKAIxZ0zC5cMe342fhDpk
         7zhQ==
X-Gm-Message-State: AOAM532XnCEOceZzH7mFQHWVw4OmCejNZFDoWQOcEkQYshz2kqiJvyqP
	sVHGXCe82XVg6tOh6Gy+ytk=
X-Google-Smtp-Source: ABdhPJxoaAOAT3J6wBlu9H4yGWw6bUYYlgQ+wLghgi86o+hmgv6kpZAYytWEwUVB+aUW18LO9op+ng==
X-Received: by 2002:ac8:7f01:0:b0:2e1:e86f:fd59 with SMTP id f1-20020ac87f01000000b002e1e86ffd59mr1083297qtk.448.1649712317458;
        Mon, 11 Apr 2022 14:25:17 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id o66-20020a375a45000000b0069be238e5e3sm6853883qkb.48.2022.04.11.14.25.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Apr 2022 14:25:16 -0700 (PDT)
Date: Mon, 11 Apr 2022 17:25:12 -0400
From: Jaehee Park <jhpark1013@gmail.com>
To: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
	Jaehee Park <jhpark1013@gmail.com>
Message-ID: <20220411212512.GA2797956@jaehee-ThinkPad-X1-Extreme>
MIME-Version: 1.0
Content-Disposition: inline
X-MailFrom: jhpark1013@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: QED2EQQRF2BSVKTDCQSPH5SMNKUSCPJJ
X-Message-ID-Hash: QED2EQQRF2BSVKTDCQSPH5SMNKUSCPJJ
X-Mailman-Approved-At: Tue, 19 Apr 2022 20:57:27 +0000
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: correct typo in comment 'Atleast' to 'At least'
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/QED2EQQRF2BSVKTDCQSPH5SMNKUSCPJJ/>
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
