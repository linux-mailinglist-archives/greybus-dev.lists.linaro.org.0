Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0F76C39CF
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:07:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3DC21441DC
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:07:27 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	by lists.linaro.org (Postfix) with ESMTPS id EC8593E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 11:42:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=J+tF2zg0;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.208.54 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id z21so36694583edb.4
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679226121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=J+tF2zg0Iwm2XC+tSURltnxNQztJUX8K2WBuYczagLH8I+10V1lWzZ5v61uH41iLz1
         hTz0VBA00NC6qtRR8wAcrvnzUWf8qhVIu6rczb2cXmHUKO/9/Xz+qqabybsloeKJ6PJ3
         mkw06RzTkMj0rSO6xJ975aATHmtkSRNf3I/EiMIzc8ERd6WMYTwwmzEHhXBXr/bbuOPd
         tUK30bE3M16oN0Lql1vYjFiIyeArdecNTrvlaUDLx4TyVSI+5K1jz7GWtUaGySW8PAw1
         tCU3rYSEr0EsaxZPpgmVKhTsL2w3V3XwqwxbOggLZv8uzIMsvj7AUYDJfMsSmFK4nL53
         nqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679226121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KvKtR1SyAlL8ZclsQUDCqvyh4Wf6MUHzliuNE/yYx4s=;
        b=Pa+4ffhOUZHxHJ+Lj+HEFzuTvU3tdBCHzmqxJgIeghMLS/h8J1h/fDn63wad9UFq9g
         lyKuiWJqf7Fq3lPl512c5688Z0tLTZ5jm0lUb2JnyNc5+FQ4ZmhwG1YKxSkEqbyRmnMU
         cLXTqRv5nNy7llHi0lp9DkkppOJMW6TxMBLUZsoLshFULjGKDen0jwuB3Fb4v0IsGyMI
         2ljtDhlLfDfrNfwJDZ5+T5IK1nLvdpEzw8ZJfH3EIYiIRubmT4IrUjpKKU/4ctU2ixxt
         xtvEOB7r10iXVxQpRqsmcaCTufoApY1JRUrxZpQA3V2AAGdIq62Mu1V2uNUvIlSZJWJu
         jkzw==
X-Gm-Message-State: AO0yUKUJztBc2nlbGZ0Hk0qtP9wdNs6Ic2iyzLzsigKytVI0KqsGbzgK
	i0Mf7qnlvW9b3QmUjC/lO2s=
X-Google-Smtp-Source: AK7set9gVBgC4A/48cDFSZl0RptXfN5NNcuDRCsURmwXed/2ruJCIN2pBCGb46OVpt06wbLi5JNwBQ==
X-Received: by 2002:a17:907:720a:b0:933:f310:34f7 with SMTP id dr10-20020a170907720a00b00933f31034f7mr1309456ejc.15.1679226120887;
        Sun, 19 Mar 2023 04:42:00 -0700 (PDT)
Received: from alaa-emad.. ([41.42.177.251])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709063f8700b008eddbd46d7esm3180681ejj.31.2023.03.19.04.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 04:42:00 -0700 (PDT)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: gregkh@linuxfoundation.org
Date: Sun, 19 Mar 2023 13:41:54 +0200
Message-Id: <20230319114155.42148-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: EC8593E965
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
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_CC(0.00)[lists.linux.dev,kernel.org,lists.linaro.org,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UUJJBKFUNPOMWMKV4TATUAE5GPZ4LN75
X-Message-ID-Hash: UUJJBKFUNPOMWMKV4TATUAE5GPZ4LN75
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:06:55 +0000
CC: outreachy@lists.linux.dev, vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add blank line after struct
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UUJJBKFUNPOMWMKV4TATUAE5GPZ4LN75/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

add blank line after struct for readability as
reported by checkpatch script

" CHECK: Please use a blank line after function/struct/union/enum
declarations"

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/gbphy.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/greybus/gbphy.h b/drivers/staging/greybus/gbphy.h
index d4a225b76338..1de510499480 100644
--- a/drivers/staging/greybus/gbphy.h
+++ b/drivers/staging/greybus/gbphy.h
@@ -15,6 +15,7 @@ struct gbphy_device {
 	struct list_head list;
 	struct device dev;
 };
+
 #define to_gbphy_dev(d) container_of(d, struct gbphy_device, dev)
 
 static inline void *gb_gbphy_get_data(struct gbphy_device *gdev)
@@ -43,6 +44,7 @@ struct gbphy_driver {
 
 	struct device_driver driver;
 };
+
 #define to_gbphy_driver(d) container_of(d, struct gbphy_driver, driver)
 
 int gb_gbphy_register_driver(struct gbphy_driver *driver,
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
