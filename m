Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CB6D767287
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jul 2023 18:56:53 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A4E5343EF5
	for <lists+greybus-dev@lfdr.de>; Fri, 28 Jul 2023 16:56:52 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	by lists.linaro.org (Postfix) with ESMTPS id 5C1973F1AA
	for <greybus-dev@lists.linaro.org>; Fri, 28 Jul 2023 16:56:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=bCcCHrlv;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.172 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-686efb9ee0cso2264622b3a.3
        for <greybus-dev@lists.linaro.org>; Fri, 28 Jul 2023 09:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690563406; x=1691168206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J0JyEv6SMzk3Na9nYV0TP3RVZJQFwBgMOze4lUBSnUc=;
        b=bCcCHrlv0Od7I72UzWqOpr2PpDxKbkUsK3JrwF5EkIvmcBcdEzBWokytXXAew9X42e
         GL/u+y6hzZR2nXNHUtjpvtiY4/eKvdvdAF3JxfxJ9iDTUcsgStzJ0v42XbJ1tMs+gno8
         AePnC4G1MviLmVi1DIBEW+Q57pG/bWoR6w4kcm7FTQAJEOkA3IYymmQwa8jGIMCJa6Dd
         K7i0RTWFlM9pHTptGR535cyMwRNAjNUoNO+Y9IQngadb8pIOzTx7NzFuQ6p2hcc+RvBH
         wfpWwpMpgMMHER31PUmHSUN2OyZQK39D135Psr3QmM9oqkLWrqnpfSNyUHBRxrAs8PpL
         quJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690563406; x=1691168206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J0JyEv6SMzk3Na9nYV0TP3RVZJQFwBgMOze4lUBSnUc=;
        b=NMVIpXaIK3Q+G1H7hRWgPcfxTvYR8qxVqZKSxS0BBqQEXAfti+z0EyreqECKFRtRaK
         cygReSFCTjl22HDJfvJxVtvCt8In9Kv1A5GSbX9i/m5LjF8r3zNoPtcDIAgtvBFOcQUh
         OGtkHVlzz+/ReiljzeyEbh63iwephBsDMPh9WmdMvRNbgZi/cIDGhMNkX+MHWsp1rF/Y
         MymEC9nC/7ZU1HzvIkUPuP/1BQ+eocfgABQRO6ZSW14HLPM6cEhd3P4L4KpJX3zaSl1V
         R7iq6SRixKYFrgSPG4RR9sXvgEpKWNzdPv0KF5Tr3GubIkE4iugYZ+jzYwNWwAjfSiLT
         Z9HQ==
X-Gm-Message-State: ABy/qLYHH3X76jQmANyCAN4bJcp4rNQPznVHa/rct1VFQu6HhyOOA8/M
	c9SgsX6XE4vqDJkdRAM07TVzyBKbPRtt3Q==
X-Google-Smtp-Source: APBJJlGQbKlXKxEnn7kTHuB3E0Gs0uA8CaXAo8eGMjMBba8VAZ8Tec36ebL0QVrr1ZalyDlYZ0cYzQ==
X-Received: by 2002:a05:6a00:1989:b0:67e:6269:6ea8 with SMTP id d9-20020a056a00198900b0067e62696ea8mr3311901pfl.22.1690563406070;
        Fri, 28 Jul 2023 09:56:46 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.66])
        by smtp.gmail.com with ESMTPSA id k22-20020aa792d6000000b00682a9325ffcsm3430756pfa.5.2023.07.28.09.56.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 09:56:45 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Fri, 28 Jul 2023 22:21:55 +0530
Message-ID: <20230728165155.155332-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728165155.155332-1-ayushdevel1325@gmail.com>
References: <20230728165155.155332-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5C1973F1AA
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.50 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[103.15.228.66:received,209.85.210.172:from];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.210.172:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: T3OETYMJ3QGHBNGKDZBBY3GAKOEOS7VP
X-Message-ID-Hash: T3OETYMJ3QGHBNGKDZBBY3GAKOEOS7VP
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org, Ayush Singh <ayushsingh1325@gmail.com>, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/1] Remove extra newline
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/T3OETYMJ3QGHBNGKDZBBY3GAKOEOS7VP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

From: Ayush Singh <ayushsingh1325@gmail.com>

This change was suggested by checkpatch

Signed-off-by: Ayush Singh <ayushdevel1325@gmail.com>
---
 drivers/greybus/es2.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/greybus/es2.c b/drivers/greybus/es2.c
index e89cca015095..1727914dd1a4 100644
--- a/drivers/greybus/es2.c
+++ b/drivers/greybus/es2.c
@@ -17,7 +17,6 @@
 #include "arpc.h"
 #include "greybus_trace.h"
 
-
 /* Default timeout for USB vendor requests. */
 #define ES2_USB_CTRL_TIMEOUT	500
 
-- 
2.41.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
