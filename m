Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F797F6637
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:48 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8ABA53EF5A
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:47 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	by lists.linaro.org (Postfix) with ESMTPS id 1F3253EC22
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 12:22:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=CwuFgeze;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.214.174 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1cace3e142eso10501015ad.3
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697977336; x=1698582136; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=CwuFgezeZtpFc4/ohmpdFc+ZdSRHhWItFeS8UWYqrcNkXIrdZBNXG6ayxp+0kKF0dA
         FIlckg1WO2/UiK7Y6kHnoQU0VQ1EvAmFEBTUbqnl520hTCROg7ma07usKOdNZl1BvoBe
         5Sg+qgzIrFtsqmoTLj/b7lqSr33aUhkNQFTfu5GLvmgRG9Sdk6nr9tEq87OrSqhmy3jI
         pVBYR0gLDibf+7OEYIKBk21GZNoQR2oHKDfxWDluFeqOo8eyKSDgd2P3KJ+R+vXP89B4
         nDkzM3fKE8j8JV7U+bcyNCsFoFIiKWyOfyq10CTZoPyflBkHXGjdtsWEnQcz9bW39lM5
         qm3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697977336; x=1698582136;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=tvVhIqufQ8KaFBrZAkrmDUEc6LRif6NeD1iRtX+iR7nlRA9Os8kxaMsahseMNPckc0
         IibA4gKqjC76NReFXLLPdO8yyvXqg4Uk0S0fBtUAqoWrNBOYAvPSqOl+N80vRtTFO4nE
         xDyzVyX1Ywx0rx5WAgG90Q35vFuwvQm6oyxbZlH4zR3aOgkW1zsTs42lVgTd9UHC9FcB
         OPi7icCy4BnGLTPPTTiJMrZPOF0wKGjcxdVrKlnvMlXWZbBep4ioxX//sPxOoUrxhU5Q
         cfDMqaF9HVOgTgvOu9lzzWm/yShaC7gn1QtTXMXJESvrOsTnvkg3vW2cWYY7EtSsDftr
         upjw==
X-Gm-Message-State: AOJu0Yy0mz4AlZ3rw6ZfAbCM/6qqQI+KgNMonV7FX9zy+xhNGIP0KANS
	T3OI9It8L0oy4Zh5Gn5Ny/o=
X-Google-Smtp-Source: AGHT+IF1FBY7sLm9rNomTWAVxhv2/l5Ypb5rjdG1xEhEaWJX2DT9XfTahzDniulHJdMPesFNNO62Kg==
X-Received: by 2002:a17:902:c948:b0:1c9:e0f9:a676 with SMTP id i8-20020a170902c94800b001c9e0f9a676mr5156866pla.6.1697977336197;
        Sun, 22 Oct 2023 05:22:16 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id m15-20020a170902db0f00b001bbb8d5166bsm4341897plx.123.2023.10.22.05.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:22:15 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:22:11 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <39be7bb04ce1362b00aa31a638ebe2e88dd81fec.1697976302.git.nandhakumar.singaram@gmail.com>
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1F3253EC22
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.174:from];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-MailFrom: nandhakumar.singaram@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TYQGBWLYZOGO5AM3EJBNBYMQ4Q6EIKVT
X-Message-ID-Hash: TYQGBWLYZOGO5AM3EJBNBYMQ4Q6EIKVT
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:55 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 3/3] staging: greybus: bootrom: fixed prefer using ftrace warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TYQGBWLYZOGO5AM3EJBNBYMQ4Q6EIKVT/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Adhere to linux coding style. Reported by checkpatch.pl:
WARNING: Unnecessary ftrace-like logging - prefer using ftrace

Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index a8efb86de140..79581457c4af 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -491,8 +491,6 @@ static void gb_bootrom_disconnect(struct gb_bundle *bundle)
 {
 	struct gb_bootrom *bootrom = greybus_get_drvdata(bundle);
 
-	dev_dbg(&bundle->dev, "%s\n", __func__);
-
 	gb_connection_disable(bootrom->connection);
 
 	/* Disable timeouts */
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
