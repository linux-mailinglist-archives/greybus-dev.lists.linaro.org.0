Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 35030745C8B
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Jul 2023 14:50:31 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DBCAA3F940
	for <lists+greybus-dev@lfdr.de>; Mon,  3 Jul 2023 12:50:29 +0000 (UTC)
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	by lists.linaro.org (Postfix) with ESMTPS id 27ED83ECBB
	for <greybus-dev@lists.linaro.org>; Mon, 26 Jun 2023 08:43:58 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=NzJLbmTb;
	spf=pass (lists.linaro.org: domain of islituo@gmail.com designates 209.85.160.173 as permitted sender) smtp.mailfrom=islituo@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-400a9d4b474so4417501cf.0
        for <greybus-dev@lists.linaro.org>; Mon, 26 Jun 2023 01:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687769038; x=1690361038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=n3P9OZJWzMEw+HCOB/2/9OKBcaBnbB33CMEBt6EtuOg=;
        b=NzJLbmTbs2cRWIXCuozi6jBQ2e1FyIyN0caD6N25S24shFOJHBMhlFPvmJrLxrTl+w
         BIpxU78dMHsLwl25CQo9g8xyyHZ/hT7PNdzx2ljIgjwfhdbPuZUJVwF+5c/X7/Wo/u3w
         4XVzj5LLV1s3POGgMEDzyn9ChPZ7gpvV+grYOMblm9286TplG2iXydjQRX04F5EjDoa7
         YrBvOjNCvPmRDqsR4zYZHa7BXMdLbkOrUFeaajWb1sEKxStKEwvaOd/M+q8BOVMDHdDF
         zNzxm0WpEuBjQ/WDkMlEV+krYm4EMcnAbK/NkIEc1M08PNH0ta/rNTmcfXCM3OKJXNO3
         QEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687769038; x=1690361038;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3P9OZJWzMEw+HCOB/2/9OKBcaBnbB33CMEBt6EtuOg=;
        b=KtJoguHNI36IgxsYT68Reox9fxZar4sQbSkajLksAI/3+q8CCWFxGVMj9afRigHZXC
         ZrSnqAr2zLTcoPgrIcT0KusP3G+gpTwTt/tz4+3YrLuoupzNiYAjXwX050wOi3uUl60T
         yRRSNm9sfFZm5MrJZH9ZKY54L00jEcRk4/UAi/PEZFDiesfUFbsyGCtCP7sGiqheuMQs
         Y2p/vjsAl8zX3C0NinnzO8KnyHRN0ZPNfvAuPB2S65tjj5+zwhhXJVuca3BGNl0T2OBw
         8dwP9nsyxEHU93Q4LQ/VwDnRg2/M1khHreHUVsvp59U6USDMnnTiIX/oCuih6c0UZUp5
         2VMQ==
X-Gm-Message-State: AC+VfDyrU2vtz07PgD1U0Gwp2WfAIIuixkpua+Y/SGDdu7/5OdH12l4e
	4lqUy3SUYRtGxnJzwayS2MI=
X-Google-Smtp-Source: ACHHUZ4+iTkBcVtKyis5jDcOlnkP7phLAgP0DEhfbF/w8zPszMxagkPQM8MT14U670wv27ZToEgmHA==
X-Received: by 2002:a05:622a:20f:b0:3f9:c539:c9d5 with SMTP id b15-20020a05622a020f00b003f9c539c9d5mr36477606qtx.68.1687769037696;
        Mon, 26 Jun 2023 01:43:57 -0700 (PDT)
Received: from oslab-pc.tsinghua.edu.cn ([166.111.139.122])
        by smtp.gmail.com with ESMTPSA id m23-20020aa78a17000000b0066a67637cfasm3340667pfa.26.2023.06.26.01.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jun 2023 01:43:57 -0700 (PDT)
From: Tuo Li <islituo@gmail.com>
To: dtwlin@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 26 Jun 2023 16:43:39 +0800
Message-Id: <20230626084339.998784-1-islituo@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Result: default: False [-4.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_IN_DNSWL_HI(-1.00)[209.85.160.173:from,166.111.139.122:received];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.173:from];
	URIBL_BLOCKED(0.00)[mail-qt1-f173.google.com:helo,mail-qt1-f173.google.com:rdns];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,outlook.com,gmail.com,buaa.edu.cn];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 27ED83ECBB
X-Spamd-Bar: ----
X-MailFrom: islituo@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: H6YE6HCQUIFKVKQJS3OS7QN6L52HYFDC
X-Message-ID-Hash: H6YE6HCQUIFKVKQJS3OS7QN6L52HYFDC
X-Mailman-Approved-At: Mon, 03 Jul 2023 12:50:25 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, baijiaju1990@outlook.com, Tuo Li <islituo@gmail.com>, BassCheck <bass@buaa.edu.cn>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: fix a possible data-inconsistency due to data race in get_serial_info()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/H6YE6HCQUIFKVKQJS3OS7QN6L52HYFDC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The variables gb_tty->port.close_delay and gb_tty->port.closing_wait are
ofter accessed together while holding the lock gb_tty->port.mutex. Here is 
an example in set_serial_info():

  mutex_lock(&gb_tty->port.mutex);
  ...
  gb_tty->port.close_delay = close_delay;
  gb_tty->port.closing_wait = closing_wait;
  ...
  mutex_unlock(&gb_tty->port.mutex);

However, they are accessed without holding the lock gb_tty->port.mutex when
are accessed in get_serial_info():

  ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
  ss->closing_wait =
    gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
	ASYNC_CLOSING_WAIT_NONE :
	jiffies_to_msecs(gb_tty->port.closing_wait) / 10;

In my opinion, this may be a harmful race, because ss->close_delay can be
inconsistent with ss->closing_wait if gb_tty->port.close_delay and 
gb_tty->port.closing_wait are updated by another thread after the 
assignment to ss->close_delay.
Besides, the select operator may return wrong value if 
gb_tty->port.closing_wait is updated right after the condition is 
calculated.

To fix this possible data-inconsistency caused by data race, a lock and 
unlock pair is added when accessing different fields of gb_tty->port.

Reported-by: BassCheck <bass@buaa.edu.cn>
Signed-off-by: Tuo Li <islituo@gmail.com>
---
 drivers/staging/greybus/uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/uart.c b/drivers/staging/greybus/uart.c
index 20a34599859f..b8875517ea6a 100644
--- a/drivers/staging/greybus/uart.c
+++ b/drivers/staging/greybus/uart.c
@@ -596,12 +596,14 @@ static int get_serial_info(struct tty_struct *tty,
 {
 	struct gb_tty *gb_tty = tty->driver_data;
 
+	mutex_lock(&gb_tty->port.mutex);
 	ss->line = gb_tty->minor;
 	ss->close_delay = jiffies_to_msecs(gb_tty->port.close_delay) / 10;
 	ss->closing_wait =
 		gb_tty->port.closing_wait == ASYNC_CLOSING_WAIT_NONE ?
 		ASYNC_CLOSING_WAIT_NONE :
 		jiffies_to_msecs(gb_tty->port.closing_wait) / 10;
+	mutex_unlock(&gb_tty->port.mutex);
 
 	return 0;
 }
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
