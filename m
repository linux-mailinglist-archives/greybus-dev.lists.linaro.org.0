Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 521F36C39D9
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:14 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 644183EF1C
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:13 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	by lists.linaro.org (Postfix) with ESMTPS id 5ED113EA31
	for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 08:26:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="VwD/cTCp";
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.208.51 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f51.google.com with SMTP id cy23so43292658edb.12
        for <greybus-dev@lists.linaro.org>; Mon, 20 Mar 2023 01:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679300789;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MLz3hRBfX2H9kEvnXukqy9ngVwHdXnfaWeWONnLje10=;
        b=VwD/cTCpK2eod5z/7muOl6+J7Tq9jX8bgEJzMWuM6UWdUmscthpSF17CqC/LzichUE
         SnhGfHT3d9QJyGIwg6NbGJREF+XzogXguXf3m4V43gTbbQktn8vI7sfgR0TG0wVa0wHj
         8n1mI24Uwvcrq2flFXFJVIWpz6D7BM6UMlpgi8JyzIeDYq3CkpO5SsPCtqB9NiVmx0v9
         BnznADdg7QWsC9s5wJLQAeJ3wFST5xoFhEfxr9scPqIje/qO5mjWKT9SHp3zO1GAxVkh
         lhphJpVsfuTfdvSxHNiAu7Y6xtYuza+RgWWMmdvMLn/a4C1Qn0jKnBcRl5XpkLNp5UQy
         uzJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679300789;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MLz3hRBfX2H9kEvnXukqy9ngVwHdXnfaWeWONnLje10=;
        b=tUU+gvXofT3aNFiRgWZLIXRJQwPJV2ogoELFJvWce/i9BM8Fg59YDBNzWNfghU200R
         tPJ0pu/twMZpAnj+63M8/jXxiIPqbnUozvVi05D7wlPRqFO14IiqfIr7F5yCpPZWZtLg
         oboYpxm8CgUGTVcB/HokEPkzlO8RhYIsXZVW2cFFY8s6yM2i5D9rjXmhfw1I0jHa/Wmf
         wch+Q0L0wSVROmwrcYcQvkrzydbpYM8WwapLRTF1ai/rTr259W4/nYD1Rd2824T5YpEq
         jrpKH24zYFiG2ECX4TE/4n7doOi4ht2oQpdTOj6PYEl8n8JPGfAnkQUcKyUt+5UqpRg8
         Tuxg==
X-Gm-Message-State: AO0yUKVAf4x7jgGw10OKO4EygYNKMk1k2xWOyGeu6oJr/qZgj1eURXKL
	K8Gd7zWiGaVXvu1wtUUgM8g=
X-Google-Smtp-Source: AK7set8d9sgILfZHW+akuoOmIEj/S+YtcQwxysXg+R+z+yF04NSZlFIinm9t2bQRA4dZlz+2IKBR3A==
X-Received: by 2002:a17:906:3c4b:b0:886:7e24:82eb with SMTP id i11-20020a1709063c4b00b008867e2482ebmr7155552ejg.21.1679300789202;
        Mon, 20 Mar 2023 01:26:29 -0700 (PDT)
Received: from khadija-virtual-machine ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id hf8-20020a1709072c4800b0092b65c54379sm4100679ejc.104.2023.03.20.01.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 01:26:28 -0700 (PDT)
Date: Mon, 20 Mar 2023 13:26:26 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Message-ID: <ZBgYsqkpdYpGQniB@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5ED113EA31
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.51:from];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: GGZCEJ7ALJZOIGYWFIMP7DGZANEKO3MN
X-Message-ID-Hash: GGZCEJ7ALJZOIGYWFIMP7DGZANEKO3MN
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: merge split lines
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GGZCEJ7ALJZOIGYWFIMP7DGZANEKO3MN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

If condition and spin_unlock_...() call is split into two lines, merge
them to form a single line.

Suggested-by: Deepak R Varma drv@mailo.com
Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---

Changes in v3:
 - Removing tab to fix line length results in a new checkpatch warning,
   so let the fix length be as it is.
Changes in v2:
 - Rephrased he subject and description
 - Merged if_condition() and spin_unlock...() into one line
 - Link to patch:
 https://lore.kernel.org/outreachy/ZAusnKYVTGvO5zoi@khadija-virtual-machine/

Link to first patch:
https://lore.kernel.org/outreachy/ZAtkW6g6DwPg%2FpDp@khadija-virtual-machine/

 drivers/staging/greybus/arche-platform.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..6890710afdfc 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -176,12 +176,10 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				 * Check we are not in middle of irq thread
 				 * already
 				 */
-				if (arche_pdata->wake_detect_state !=
-						WD_STATE_COLDBOOT_START) {
+				if (arche_pdata->wake_detect_state != WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
 									     WD_STATE_COLDBOOT_TRIG);
-					spin_unlock_irqrestore(&arche_pdata->wake_lock,
-							       flags);
+					spin_unlock_irqrestore(&arche_pdata->wake_lock, flags);
 					return IRQ_WAKE_THREAD;
 				}
 			}
--
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
