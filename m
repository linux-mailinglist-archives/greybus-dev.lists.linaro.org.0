Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 34B676C39DF
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:47 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DFCF3ED72
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:46 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	by lists.linaro.org (Postfix) with ESMTPS id 4D741444BE
	for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 23:04:56 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="KHry5cV/";
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.54 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id cn12so7398051edb.4
        for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679353496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=KHry5cV/WmYVdWszvx3gMaRricrhKOL/lzXv+ovvM9LdfGIZgyTz5TzaEbBYmrHe+B
         d6QZ6jCGQWNRv0XTqPoMbbR8LQY7UlBHpPrmWOasvI3x8kdub0KpMZN05I14Wkbg49z6
         65WH61JSSg2xleRRoJoySE9nau0xIsxA0xM5siTeJsU7z+U/z1rPNfuoDKuGdzzjD0B0
         SVhXx+xnP29qwhgvzh9eTCpHRwtQeMXlRv/Je+70jYIjN8QWj8znIoxds7MXCJDDRQGz
         838MLVA7qu2ivpJ0P7b8s1YmRxU4C4L7PrhgtaVnnxN3jPAwyljEwdQsLF9miUVyLK52
         pgaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679353496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=guP6G9ISVm0JT46Tq9rPopnmhpJaTXVRsEhHRX8gGQrxbPkPS/Qaaw17pD3dEk9268
         DMcwZT146fH9Jzehku8++neiIYuUAGn1mmZp2wXfvZvjpLI73c0WWwLYeev1N8AG5ZPY
         gaO4VsqW5exbA5ejY3d6Wf2M6A3EAnbmrRiWTz3WnwD/pznC279GI0zNA9HM5RNP86F3
         Z8uUk6hYo9nmGwWv5zWiBcuFwxmGyF0uN+5ubzAC7XdEK3taAVatCC29jpRZ18+H1Ur8
         yTheg2L6w1Qx5WdznFZyRCCVFlxFjZkJRoYWPALEn7giGQOcSzd8FoPuXIFRhwWZo2el
         5CPg==
X-Gm-Message-State: AO0yUKVCmHXe1kLi+56Ti8v627vNl4RhzYV+Avtm+1nkdneftAaVGg8B
	sDcdV1yPt4HG01wZLMpW+R4=
X-Google-Smtp-Source: AK7set9oGrCiLwaTVVHNqARv9f/FYWeTuzzJVPjy0U7DAdWmYUUoV1H/27zWIC19MKSsWI6kfTIlNg==
X-Received: by 2002:a17:906:f6d9:b0:930:1391:da7c with SMTP id jo25-20020a170906f6d900b009301391da7cmr637301ejb.60.1679353495859;
        Mon, 20 Mar 2023 16:04:55 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id v5-20020a17090690c500b0093188e8d478sm4956403ejw.103.2023.03.20.16.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 16:04:55 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 21 Mar 2023 01:04:34 +0200
Message-Id: <f71528cf8bcdc2815ca8a1a1e1ed4e2fd6096d1a.1679352669.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
References: <cover.1679352669.git.eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 4D741444BE
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.54:from];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: F6TRGZ5R5FPI7MUKZ2SYF26J62M7FQNY
X-Message-ID-Hash: F6TRGZ5R5FPI7MUKZ2SYF26J62M7FQNY
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/F6TRGZ5R5FPI7MUKZ2SYF26J62M7FQNY/>
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
