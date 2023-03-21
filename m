Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F15A6C39EA
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:09:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 58EE83ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:09:35 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	by lists.linaro.org (Postfix) with ESMTPS id BBA503E974
	for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 18:17:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=aNWqkqIv;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.49 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f49.google.com with SMTP id i5so16347134eda.0
        for <greybus-dev@lists.linaro.org>; Tue, 21 Mar 2023 11:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679422655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2XHYm6132cfvGuV3ZRuw0Q1fBdGTBcOSwhXcyenDK4Q=;
        b=aNWqkqIv8UByTrLWplFKR85w538weWxpIILjqopAdJvWe0VIpkxfVr0udzl3iCOVvf
         aHPGs0b8kmWFd9u27OrkzdD8tfsoEn8F0ifHFo5eBsprVl5AGL/LDViiEWDn2lrzfZpA
         Y3+Luc2w1Y76Nq5CJ7pfxuXUtXPbupL9s1R8QnpVwnYfc+8NL9IQfrZbWP9xClEHvQMK
         4PPpgolG7lnsn2WFz/wKFQGtejhT5TPzfh+TZ/kA1naexzuzOBbQ5e/DVGNs4HUkkuw6
         0GS14XA74cSHFkbjzSVUNIl7KunBveHB6tE86caDqhtECFcCCkDSWPN57+IC/eYUC3M+
         ibww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679422655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2XHYm6132cfvGuV3ZRuw0Q1fBdGTBcOSwhXcyenDK4Q=;
        b=GE9RP6/jxccMT09AfAX/8YhpfnXZCs+BAgRSKmI0cYYjdLExgHQRxwr0oGuxNgxhYg
         4mOaoVyNBOTfaZrC0MStUcdYgneArQ0C0sUK50FxJF+AOBvKMIPyqnICIs87hNLJ24lH
         3Q7uZNqM8Zj79FFWwxk6VF1XZRYkISbZWmvyCsI1NcI6aD7B2O0Rma8ElpkSBEDROYWV
         xVbb/N4/o+Deu1jVChQrumjj46I+sTNlJoLtr2YJtbxOE+Q/qnIH2tVJo7BoUof0cw42
         dC5AdjzW+Xnwjf0c1VlnhsJj51GX9uxjlSDyhzpibjQeBQq5fBWjCwY1MznRWvKbyU0F
         UvqA==
X-Gm-Message-State: AO0yUKXwSa6jxpjdIas9iQCNhUjCnLBNoF8TqCqszqMKkStDY4TJ8yit
	ZwTj+vhWEP90p9OmBmYiXsM=
X-Google-Smtp-Source: AK7set8irkZ/caMVldGalTdZB3+euMiXpFwKTTyChrRAC4smAA1fxCXMD/1zrzRADUKnlz606QkTZg==
X-Received: by 2002:a17:906:228b:b0:932:6601:4910 with SMTP id p11-20020a170906228b00b0093266014910mr4031726eja.54.1679422655754;
        Tue, 21 Mar 2023 11:17:35 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id h25-20020a1709063c1900b008e8e975e185sm6079198ejg.32.2023.03.21.11.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 11:17:35 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 21 Mar 2023 20:17:25 +0200
Message-Id: <20230321181725.8691-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BBA503E974
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.50 / 15.00];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.49:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_TWELVE(0.00)[12];
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
Message-ID-Hash: Q6VA25AIE7A4E5RWCR2VRTB3KMLKSAK6
X-Message-ID-Hash: Q6VA25AIE7A4E5RWCR2VRTB3KMLKSAK6
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:08 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/2] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/Q6VA25AIE7A4E5RWCR2VRTB3KMLKSAK6/>
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
change in v2:
	add patches that have same edit in sigle patch.
---
 drivers/staging/greybus/greybus_authentication.h | 1 -
 1 file changed, 1 deletion(-)

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
-- 
2.34.1


From 6f56ebcda89f91cdfe6e64c0707dc476ebc1e819 Mon Sep 17 00:00:00 2001
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Date: Tue, 21 Mar 2023 00:03:32 +0200
Subject: [PATCH v2 2/2] staging: greybus: remove unnecessary blank line

Remove unnecessary blank line before struct as reported
by checkpatch:

" CHECK: Please don't use multiple blank lines "

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
change in v2:
        add patches that have same edit in sigle patch.
---
 drivers/staging/greybus/pwm.c | 1 -
 1 file changed, 1 deletion(-)

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
