Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DA1D86C512F
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 17:49:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E17083E96A
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 16:49:51 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	by lists.linaro.org (Postfix) with ESMTPS id 36C5F3E950
	for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 11:37:48 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=ompbDY5u;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.53 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id ek18so71592943edb.6
        for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679485067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ufD/aLu42UHkIOODHSMH1/E0WYEbXvQf/CWdu58h154=;
        b=ompbDY5ua/bSoxyasK11lHpffoErOOwV2sBWnSJqBvy51xtNqXaapwLRZrKeKi3mrR
         lNAOOm4shWIJvpM5pTscB2jGgPDcmDhRGOyYAHh7lagLbVXoLcedd9ImA98ydNxQ/p7W
         PAUwOKN9GLggsPbliQrOT+3/ILdW0lbU81Z8+IJGy47eYy7z+Qeogu8inDAqVsx7oa9O
         3BccEVB5K9DLCK7iQ/p5XuH6qy9D1eDD/ZFJQ7Xl0C3F9S39bYXhzXuoa+yZ7YI/B0i0
         tKmFyGn5+5a0SBtW8XLOtf9uNtF9s2ch0w7dC0+pcHg1sdvUrrYIdl7YGYXtvVCYMsJ/
         JLFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679485067;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ufD/aLu42UHkIOODHSMH1/E0WYEbXvQf/CWdu58h154=;
        b=PtkY5DnX8IugirU40lhQsvY1STZm5OBfcuzMjWvDsmQQZbSU3mjVojjQoxOfwe/VOx
         ImlGejdkwBSu+hPl7Nxhjb8akbouwR6WkDcVyb0ygO4+IGsIwdNAfTkexlONvxRu0dUG
         tjhffXdgrs3m69PnQDsmQmTqjQ42pf/uELN83FVLIztwVBPe0h5n2xY90zQLmGxlD2Kd
         /zsGD3awRu8UMjl38kvdFTwkvXuIKYlxwa9LJL+w/jk2RfXxqKDPIiqJ45OuI1UCRJQH
         JIPKnoa0Z3efLJKR5/iUHA+hM+DdsXQ4G3hkTEs/5B2ez9JnL1lpQdkKRPOygBNvBPtH
         lqDQ==
X-Gm-Message-State: AO0yUKUhIfRiDYY0TO7mUoVQFMQjG2aUPnmVtX7j4HF7uBjfLhjH9o0y
	5T7fYNOnZDAfeFwcnS/C+uk=
X-Google-Smtp-Source: AK7set+QYl632YO7U3z2o4iXfBMBL7347BgKxtJukkmWe5N/saAZ2jkFYmmMBz5K37ItBM9Prns2WQ==
X-Received: by 2002:a17:906:6450:b0:931:de76:c2e8 with SMTP id l16-20020a170906645000b00931de76c2e8mr7294230ejn.9.1679485067081;
        Wed, 22 Mar 2023 04:37:47 -0700 (PDT)
Received: from alaa-emad.. ([41.233.203.65])
        by smtp.gmail.com with ESMTPSA id ch19-20020a170906c2d300b00933d64cd447sm4412197ejb.121.2023.03.22.04.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 04:37:46 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 22 Mar 2023 13:37:34 +0200
Message-Id: <20230322113735.31214-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 36C5F3E950
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.53:from];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_IN_DNSWL_NONE(0.00)[209.85.208.53:from];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: FPEXF2PFIV2GVWBQ2QABUNBLTR6FJKPM
X-Message-ID-Hash: FPEXF2PFIV2GVWBQ2QABUNBLTR6FJKPM
X-Mailman-Approved-At: Wed, 22 Mar 2023 16:49:37 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/FPEXF2PFIV2GVWBQ2QABUNBLTR6FJKPM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove unnecessary blank line before struct as reported
by checkpatch:

" CHECK: Please don't use multiple blank lines "

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
change in v4:
        add version of the patch.
change in v3:
        add patches that have same edit in sigle commit.
change in v2:
        add patches that have same edit in sigle patch.
---
 drivers/staging/greybus/greybus_authentication.h | 1 -
 drivers/staging/greybus/pwm.c                    | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/greybus_authentication.h b/drivers/staging/greybus/greybus_authentication.h
index 7edc7295b7ab..48b4a9794d3c 100644
--- a/drivers/staging/greybus/greybus_authentication.h
+++ b/drivers/staging/greybus/greybus_authentication.h
@@ -41,7 +41,6 @@
 #define CAP_AUTH_RESULT_CR_NO_KEY	0x03
 #define CAP_AUTH_RESULT_CR_SIG_FAIL	0x04
 
-
 /* IOCTL support */
 struct cap_ioc_get_endpoint_uid {
 	__u8			uid[8];
diff --git a/drivers/staging/greybus/pwm.c b/drivers/staging/greybus/pwm.c
index 3fda172239d2..26d39e08c3b6 100644
--- a/drivers/staging/greybus/pwm.c
+++ b/drivers/staging/greybus/pwm.c
@@ -24,7 +24,6 @@ struct gb_pwm_chip {
 #define pwm_chip_to_gb_pwm_chip(chip) \
 	container_of(chip, struct gb_pwm_chip, chip)
 
-
 static int gb_pwm_count_operation(struct gb_pwm_chip *pwmc)
 {
 	struct gb_pwm_count_response response;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
