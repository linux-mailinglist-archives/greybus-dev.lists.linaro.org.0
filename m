Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ECB27687AD
	for <lists+greybus-dev@lfdr.de>; Sun, 30 Jul 2023 21:50:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A32F13F1D7
	for <lists+greybus-dev@lfdr.de>; Sun, 30 Jul 2023 19:50:17 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	by lists.linaro.org (Postfix) with ESMTPS id 1BCD43F6E9
	for <greybus-dev@lists.linaro.org>; Sun, 30 Jul 2023 19:50:09 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b="jkY7Vf5/";
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.216.48 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-267fc1d776eso2164281a91.2
        for <greybus-dev@lists.linaro.org>; Sun, 30 Jul 2023 12:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690746608; x=1691351408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIkxciK1h71kYixBqfRMgC/x1rLuQPnvGGFwSaNAzcg=;
        b=jkY7Vf5/KwULYNvYOdhIQQrP5dxkvN6d2Odm21TpM9Hf3rUUQxdzYV4lETjq/kezSr
         1NdA78cbteDHIFOKHcu7b99gPgRl/el/gEjl4YTXw2AwROz8+BxW15XKYWSoLb8aAGqz
         Dzu7b6wWeCCOP1bKo8eCPyoyiGuyQ8VsoxGFQusUepdYEV9zn6NJvtKI8qud1Z3UZ3dQ
         4TW3xtmOMolNQ9vemjI2CuFJmr9v2YgyLm/UrzC68edRNR2ncjG+7tQVUdCRwKcCu+2C
         mogV/JvdzZEzA3exSKqq6ehnJDjS2cLSsGnq/sSWNj4LG2vSWzt5qacfZ6Mbl8+c24LO
         bRfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690746608; x=1691351408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aIkxciK1h71kYixBqfRMgC/x1rLuQPnvGGFwSaNAzcg=;
        b=h56f+/OI4qY1zVWP+LEIYEYZufeP6DSgqolRcM79LgIyubtoRjIlB/qt6O0CVV1WB5
         3w4EZlYYN1dYPFA4T+2eYPYz7jiB+/vxHZxKbo4XoY8Bx7fI+e/Ihb9lYqNgmU95wZ2p
         RACQ5m9zPUzcVjReP7kXS9hqzyPTKaJfqlLdNeRYrK+XzotkXnqo1QYL3iV24XcR8J0S
         n56ixqrfoWoXZHYyP8UKk7wny5zrNaOgaP+m+OpZ14m6ul+o8K8tvBJk8Nng81IvDnyc
         ri5y/QriiLclTSaFWN6ZMcIehdEdIAkxaQ/AEeAhFjs7bISaukxXT48Dp1UN9XM6GHLV
         NPRQ==
X-Gm-Message-State: ABy/qLY7JGuGf+B17v5TV8Fy1leX0ZdHvDkHNaXUb4MWx/uLElqJ5u+t
	DVkB/kk3d3ejNs1dw1dt3uI89IbN0ySW619i
X-Google-Smtp-Source: APBJJlEKwpCe3xG7KWZYiqtIkOTdYu4HdCiqeH6Di2H/tHqC33gSfQ5C7tu9N6G6tU76jk1a3LPsbw==
X-Received: by 2002:a17:90b:4f46:b0:25e:ad19:5f46 with SMTP id pj6-20020a17090b4f4600b0025ead195f46mr7559837pjb.12.1690746607767;
        Sun, 30 Jul 2023 12:50:07 -0700 (PDT)
Received: from toolbox.iitism.net ([103.15.228.66])
        by smtp.gmail.com with ESMTPSA id gf4-20020a17090ac7c400b00263dccf96a3sm5061200pjb.54.2023.07.30.12.50.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jul 2023 12:50:07 -0700 (PDT)
From: Ayush Singh <ayushdevel1325@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Mon, 31 Jul 2023 01:17:52 +0530
Message-ID: <20230730194752.32042-2-ayushdevel1325@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230730194752.32042-1-ayushdevel1325@gmail.com>
References: <2023073032-hasty-crease-683a@gregkh>
 <20230730194752.32042-1-ayushdevel1325@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 1BCD43F6E9
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.60 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	RCVD_IN_DNSWL_HI(-1.00)[103.15.228.66:received,209.85.216.48:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.48:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_TWO(0.00)[2]
Message-ID-Hash: 5T2TC3JNTG5JVUSM3P7Z2LRMSMNXYQOM
X-Message-ID-Hash: 5T2TC3JNTG5JVUSM3P7Z2LRMSMNXYQOM
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org, Ayush Singh <ayushdevel1325@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/1] greybus: es2: Remove extra newline
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5T2TC3JNTG5JVUSM3P7Z2LRMSMNXYQOM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch removes some blank lines in order to fix a checkpatch issue.

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
