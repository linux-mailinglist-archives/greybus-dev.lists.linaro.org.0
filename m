Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34C6C512D
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 17:49:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 36A2A3F09C
	for <lists+greybus-dev@lfdr.de>; Wed, 22 Mar 2023 16:49:41 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	by lists.linaro.org (Postfix) with ESMTPS id A77FC3E957
	for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 10:09:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=M6Mosss+;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.43 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f43.google.com with SMTP id eh3so70514381edb.11
        for <greybus-dev@lists.linaro.org>; Wed, 22 Mar 2023 03:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679479772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yru+/DJoW0l+gdfnZqzMPZHjYgVuqgrRcLKs3lSPmHE=;
        b=M6Mosss+BmvxqIkNxh0I9sIkanHXhjuavvFe9xCQtfjpYhR8vRfnbUIfB1WiWGLor0
         c/+8Fl/ZUbGEUi31LFq6Ju9M/muyfxJUhii3za1e9HG2JZ0NSUuByjdB1tSuPhtGxY8Y
         Nf+RN5G/XyQYWYi4f2/cdUJNdNAApdiYlS/cIOpbKQI9Q9G++5fMHxHGqGiEylQFB8Fk
         ps+IrR54AQBnzTytnt1FqW09dLlpJtXn3+jaLBkUxVqNpoIm6DLoIJJlN16lEszwD0Ue
         epbtZmchK/ZNepS15LuUh/nccrwlGmn/p81tA6SvbT0Z3028m/NtqUrGtWsq5AmZ7Qmc
         2s2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679479772;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yru+/DJoW0l+gdfnZqzMPZHjYgVuqgrRcLKs3lSPmHE=;
        b=svHIQHk4X7B9BNw0ZPIhrlALvtgqcv99sFZbNF816JRpKeqxvrb6KLM03DOHcMjpNg
         aypumVRQtBYZXYsSkCs+7GBhJ0kl1IrfpItYrCeJo/yqDRYTv6EkqsyPjRsi41rAYZ/9
         yRkxyze3GPlt6nAqOnOj2gAplothdOsdUPZlkwBCmIjwxylyPCnpm01/V4OPcP74g7j2
         HHtYKc9fVOqmfnqTIQq7qOOOvQ4tq6YjirHwIT5JlM7yUmIL8KfJCxkLVPdMzuHfPXiS
         SB2TLZq/kBovfFZRrwk9LGZ1kdFgbeWvvgF4MlV/8QkjDgE6nF/5Wd7en2v0Mx5Rdm/q
         me8Q==
X-Gm-Message-State: AO0yUKWTZbpa9p9AtSTBz007lIkHlmSSkcnsLqvx0ydqwiUKwdj60SQP
	Kz6yPLDfqSTtuPoYw65H6xI=
X-Google-Smtp-Source: AK7set/6uoHR69K90iGRKvBwbgrmpRQ1hfAMzKw4nU5pgrpBEBX/HIBu1pABx8tb83QbDHB/Qtz4nQ==
X-Received: by 2002:a17:906:1853:b0:92f:fc08:bb0a with SMTP id w19-20020a170906185300b0092ffc08bb0amr5888741eje.37.1679479772557;
        Wed, 22 Mar 2023 03:09:32 -0700 (PDT)
Received: from alaa-emad.. ([41.233.203.65])
        by smtp.gmail.com with ESMTPSA id s9-20020a170906454900b008f89953b761sm6954993ejq.3.2023.03.22.03.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 03:09:32 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 22 Mar 2023 12:09:27 +0200
Message-Id: <20230322100927.28351-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A77FC3E957
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.208.43:from,41.233.203.65:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.43:from];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5Y5ETIQOCCDEJ7U3TBV5FNUVV3HBWCXX
X-Message-ID-Hash: 5Y5ETIQOCCDEJ7U3TBV5FNUVV3HBWCXX
X-Mailman-Approved-At: Wed, 22 Mar 2023 16:49:37 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, vireshk@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, linux-pwm@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5Y5ETIQOCCDEJ7U3TBV5FNUVV3HBWCXX/>
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
