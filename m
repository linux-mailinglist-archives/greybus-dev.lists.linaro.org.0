Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9497F6631
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 19:27:19 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A69283EF5A
	for <lists+greybus-dev@lfdr.de>; Thu, 23 Nov 2023 18:27:18 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	by lists.linaro.org (Postfix) with ESMTPS id 22F003EC22
	for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 10:42:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=bPibKpJt;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of nandhakumar.singaram@gmail.com designates 209.85.216.44 as permitted sender) smtp.mailfrom=nandhakumar.singaram@gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-27d4b280e4eso1650404a91.1
        for <greybus-dev@lists.linaro.org>; Sun, 22 Oct 2023 03:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697971352; x=1698576152; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=bPibKpJtHKcWdyfCm8bPncoMp1pT9lXCh7cuHcPG6lCua4gOhBbEhW2GGx5zOe3a3v
         ywCztGgqLKo3pWcxrAEnVGTnFZIyEy6tGnFCjD2Vsz+eD9gWRp/Y2mgCOTqgSSyVeR7U
         BYz7LrfzX7oDx5GGypqRQyRBfKOhbdZMVI88fseWpIYKfyEXGjD8VGPUl65ZOgCQr+ux
         +FVDn2555gnVv0ldkbDLwZHgY4XjhTuLZR6Jd+H2UaXCeO/I4wtqEg2iZcG9E0q0Kv+H
         wVVW3NSXYSg9n3V3eZcqq5sU8lqsOtLSx2oimanoVD2laeU3Kb0B6qEtR+VWl+4GF26Z
         BlEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697971352; x=1698576152;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ytqp4yNQw6UYpoau4Yu6tPgcTfKhaPGEv4GOXMbKcHo=;
        b=NNG5xoJa2xr9hL+rf2OPbAZlM4b3dDklVR7yDodZoeujlgbX6rhS11KK6a2+FfhShe
         B8wgSwPyAR5c9scOviP9uoFLkvrkbV/qVVGSBKyYYP2n4Cv53Ag05sGIzNisllcJG0iD
         F+01GqgQn1yC0SxjvlRK1sh7+dI6xRt/mqVQzzzaz3nxCoNlYr/MD8c9oWjnaIp4NNOM
         YKTetZDmeV8MGlAolhwKXfuKykQQyluYCetpoGo/907nzDIfxxrQu7IJnFVCEeDVx70+
         A+2Z9RrmUFmzi7lUC1LmHm0tYNzmJkvPJOiHV8r9CzOLdr8qcHro7c349xPenIgvDEOV
         X7Cg==
X-Gm-Message-State: AOJu0YzmC/Yn9It3UYQidVzeE3lf4e/ju/PuT7IYcbGtEbVsqpjY2qiQ
	7AE8yjMFIy1rwiCPw1vRefg=
X-Google-Smtp-Source: AGHT+IHrw4gIaCM3FljDQJo9ciCCj4OiFXfzKFtUS0ANYKs8SoGdtBOJTU/EcVAiD+emNOG7IHMhMg==
X-Received: by 2002:a17:90a:ab82:b0:27d:886:e2d2 with SMTP id n2-20020a17090aab8200b0027d0886e2d2mr14005323pjq.7.1697971352250;
        Sun, 22 Oct 2023 03:42:32 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id g10-20020a1709026b4a00b001a80ad9c599sm4269872plt.294.2023.10.22.03.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 03:42:32 -0700 (PDT)
Date: Sun, 22 Oct 2023 03:42:26 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <cade10d4b94127900a015e0b2ab94da5dd8c2c63.1697969950.git.nandhakumar.singaram@gmail.com>
References: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1697969950.git.nandhakumar.singaram@gmail.com>
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 22F003EC22
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.44:from];
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
Message-ID-Hash: NKATFBIMU4JU4IBZJQOYNLBVCCMG3DUF
X-Message-ID-Hash: NKATFBIMU4JU4IBZJQOYNLBVCCMG3DUF
X-Mailman-Approved-At: Thu, 23 Nov 2023 18:26:51 +0000
CC: kumaran.4353@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 3/3] staging: greybus: fixed prefer using ftrace warning
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/NKATFBIMU4JU4IBZJQOYNLBVCCMG3DUF/>
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
