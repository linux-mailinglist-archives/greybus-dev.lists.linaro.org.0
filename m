Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD8A6C39D6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:57 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D3624441DD
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:56 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	by lists.linaro.org (Postfix) with ESMTPS id 1CA733E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 15:29:24 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=EL0OaV88;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.54 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id w9so37896884edc.3
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679239763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=EL0OaV88uE7w1zSJ8q0s8ZyR5j+/8i5pUz0qyWMyVWZz50lSmaSeDG+c2UTxTnThfy
         scFRyh8qZAlhcbxsZgZPKW9RItpvfjaOqs5rMAJQGTTg1OI+eY+tR2XEZwF4Odh64BHk
         vBtJ5PVTbpwsJK+MrFXklMEvz6f6RCUfqU9F4Nipl4wVgybrMSDLSmd34EuIJfW+kWjO
         PYJcMCoav9zF3nxDVWQ85kBXM/L6v73W3CIn11H6VRiYC87NTpaDwMnScnJnAqKdWhEk
         Hx3GMQrux+sjljqCLC651Vh1LrAIiJOHy/K+wyJ3nwEIxhGEJkQ0iuEeBiCMyZP4Xjvj
         maaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679239763;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hHi5+GWz44QI22N2lgNwAXCVNfgTvzls3W9uzDI9R7I=;
        b=YEPvMWhLJiCtigY0OPuOtOynpS2I/Yp7FPV9n3SLDCydBphBNlyDF9nE7n1h2clNOa
         MCK69MxKc2VND5wmNuXED+mu2Xsf+q5XF1B7XfDlvxI5EAKAeslZ3dN2nNZAxgMCPn7N
         hATtApQWjZ/ArCCIvjKLwmbY4432ScWptIdR+1yH3YitmtvHdO4pXGNClOq2tvwdVuT4
         SyN5I8U3hsEg/DAs7p9FTNqPf+w9uDgucfLNq2gcKyrV1cKMkjbWhJm3ow8Z5hDhKadm
         sPeelYdrRM3BgbNQYREETHmFAj8SzB5LjyfWY+MoFVkTo+zBeJRVDdcaLB6fNVu6KjQ0
         EWDA==
X-Gm-Message-State: AO0yUKXKBdLLPA70p9um2Rt6Dv/Ty7I4mbdfQzAHUdbLcLnlcR+eH2/l
	NXiPygRPFxxoMa7z0V6364A=
X-Google-Smtp-Source: AK7set/E0e+CI78tJzcFXyh5kyZx43f/wgftRrGinMc5pR7pChEra9ob+MPRBBpdNINOjJ8OqOz06g==
X-Received: by 2002:a17:906:8415:b0:930:3916:df19 with SMTP id n21-20020a170906841500b009303916df19mr5737952ejx.5.1679239762248;
        Sun, 19 Mar 2023 08:29:22 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id ia9-20020a170907a06900b00932b3e2c015sm2425429ejc.51.2023.03.19.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 08:29:21 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 19 Mar 2023 17:29:09 +0200
Message-Id: <20230319152909.163598-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1CA733E965
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.54:from];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,gmail.com,pengutronix.de,lists.linaro.org,vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
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
Message-ID-Hash: TZNVAJPVJNKDJV355ZSCG66M6AARPH22
X-Message-ID-Hash: TZNVAJPVJNKDJV355ZSCG66M6AARPH22
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:56 +0000
CC: outreachy@lists.linux.dev, johan@kernel.org, elder@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de, greybus-dev@lists.linaro.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: remove unnecessary blank line
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TZNVAJPVJNKDJV355ZSCG66M6AARPH22/>
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
