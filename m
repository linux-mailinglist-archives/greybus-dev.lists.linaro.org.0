Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3256B556B
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:17:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 014C13F4FD
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:17:54 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	by lists.linaro.org (Postfix) with ESMTPS id 2CA633F32A
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 17:09:51 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=RdaB5Uqq;
	spf=pass (lists.linaro.org: domain of kamrankhadijadj@gmail.com designates 209.85.221.44 as permitted sender) smtp.mailfrom=kamrankhadijadj@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id t15so5695501wrz.7
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 09:09:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678468190;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zOiwuqcweU7+YHTRApQGtYui62Ok/Rws6N1HxOxsdlQ=;
        b=RdaB5Uqq59Xixi3DPF5AMfpPhk5fNLSJ/FglPJkO9jLtEajpmmlxzJqv/W9K6DLaK/
         VdWxCbx27GOEB1fRBtkFFCqkoXc0jaygnLu2f4dSQtqxhvV8NKZXibqSh9rpryXS8Ave
         Sa3jnLX4uDjoDjrz9yFXu4JuZh2FFSQDTs8oW3oX8YOFG2cGy7PYQoFcF8NGXnoaCz1A
         4SOIyKRWt5r0ra1NjuzKtkDJkd0tNxkvhyXEtO4RdrPU1ZYnhOC+yqZ9u1rhhKhGVLlu
         LiZvwq1xfsIjj32euc/aJ9wP8szSMCJ3VgNk3W+SsvN/8D914To8acxCJOtsfz3UUmBN
         37sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678468190;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zOiwuqcweU7+YHTRApQGtYui62Ok/Rws6N1HxOxsdlQ=;
        b=gWMTE3vwb7KnJvKr3qjrTsJJpkd7x187hb8IC1QN8j/ZXmUgOLEHF9iUdVPzAa/g1t
         e1w5ILcgRLc0e3Yh/dzLxe7THCAqlfJ5jCRtFGPWStoJdsUCbTNT0Hk7aYpwAnlE4Ayj
         LJ84v24HdF7lQwWbpTs73eflyEjFQlK2gVw/Ujq7vG1pLN57Bc2C6WRC8HZvnjPuig4u
         G76wSlb1Yuot4UMU4OKQNIQmxQhsLw8D1+gBf1wuTXC5BxPoFD4PeWGH5DNGG6Xjmy09
         FyzejrUEO93v/Kmj67nR3igk8jb7966EHHEZ0XaTutgth+ZqoDkwSfdmr1hs5DwkkPZ6
         AaXQ==
X-Gm-Message-State: AO0yUKVn8tolVxihs+DxNZV1hHAyjs57GeA7WvmArV5Q5KfDsw68pSOe
	wmpx8Urp1KHw+ugPI/FqTvU=
X-Google-Smtp-Source: AK7set/qo9y995l0QcIe7XINy9Xw7krXxPILJgQz4xXeZK2SqGcv8FKDtcu7qBUOcBqEv/Q2ioVh7w==
X-Received: by 2002:a5d:452b:0:b0:2c7:56b:863 with SMTP id j11-20020a5d452b000000b002c7056b0863mr18430570wra.10.1678468190085;
        Fri, 10 Mar 2023 09:09:50 -0800 (PST)
Received: from khadija-virtual-machine ([39.41.45.115])
        by smtp.gmail.com with ESMTPSA id c17-20020adffb11000000b002c592535839sm294581wrr.17.2023.03.10.09.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 09:09:49 -0800 (PST)
Date: Fri, 10 Mar 2023 22:09:47 +0500
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Message-ID: <ZAtkW6g6DwPg/pDp@khadija-virtual-machine>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2CA633F32A
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[39.41.45.115:received,209.85.221.44:from];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	FROM_HAS_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.44:from];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_SEVEN(0.00)[8];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: kamrankhadijadj@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: LMBPNFMZDQFC4VAAIPKHMTEO35QAM765
X-Message-ID-Hash: LMBPNFMZDQFC4VAAIPKHMTEO35QAM765
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:38 +0000
CC: Vaibhav Hiremath <hvaibhav.linux@gmail.com>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: fix exceeds line length
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/LMBPNFMZDQFC4VAAIPKHMTEO35QAM765/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Length of line 182 exceeds 100 columns in file
drivers/staging/grebus/arche-platform.c, fix by removing tabs from the
line.

Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index fcbd5f71eff2..0f0fbc263f8a 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -179,7 +179,7 @@ static irqreturn_t arche_platform_wd_irq(int irq, void *devid)
 				if (arche_pdata->wake_detect_state !=
 						WD_STATE_COLDBOOT_START) {
 					arche_platform_set_wake_detect_state(arche_pdata,
-									     WD_STATE_COLDBOOT_TRIG);
+						WD_STATE_COLDBOOT_TRIG);
 					spin_unlock_irqrestore(&arche_pdata->wake_lock,
 							       flags);
 					return IRQ_WAKE_THREAD;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
