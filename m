Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 8903E6B556A
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:17:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id A2D103F505
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:17:48 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	by lists.linaro.org (Postfix) with ESMTPS id 547A83F49E
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 15:51:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b="EjgPufN/";
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.221.54 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f54.google.com with SMTP id q16so5478100wrw.2
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 07:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678463496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jpuN32VQrGcv/3Pj2zsLc3BfvbthJh4eelemNP67L9M=;
        b=EjgPufN/cGkNJlNHqYKe7Dvb0DPZVDoUQfE7cCDnzHUy5HZaHZxrDsNAUzRwAQrUL1
         i/DNPGm/Z4VM2zl0DJ936UNJEm4qO2uunUmPxw1Nyw7k1nH3csue+QAqkTJEpKNjVkz9
         bvXQtggu+bIZZ7pQ8mJ0rhogOJBh0VB+3gWsZCxs6Q+SRxwk1t7O7yKKBso8Z2urhAKY
         l4dPXw9Hs8vlhZDQjL80h/uJmxsngN3bvRzX6UckLTmjoKUpiQSS0H0rCrrLZXHEHkGK
         JbKgtiuN6nx7pkcIsCSJYuZAlqSlBiDbrffsaUcMfe/uN00BL+S8+pRHWLGR8Aw4UuuQ
         AQWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678463496;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jpuN32VQrGcv/3Pj2zsLc3BfvbthJh4eelemNP67L9M=;
        b=WP2EJtbW6Nt+mUZhQo9X0Fp1WlnFyaHfiGxDwWM6CJIO1SyFXLVJnYo876AshBU4xg
         4rLDMyGeml3WdVYnXNw2TiFhRtfJClty6ZfGCjZTlKY7mbLIAzljU9wjCnBwTRr1PJQq
         BCKytramIeGmzH7HDFonqjy82OLC7VZzxPUBs354arXxtxnCw10Q3a4evAiUeBVMvko1
         +MSdKXGjZd9GRv/0kaXG/32SNIppPT4+2x03LNwLNzmjMf0NTgKOt9mV4GBW8+fx1vVI
         ob5xkhG9Tf6UF13nXUly23ttS0SsqpR/1O3l+hxvjlL9lRb3Rer/IhehABCX+Ki3bVhJ
         ydGQ==
X-Gm-Message-State: AO0yUKWs+vySMwiM2oJfk3peM9ZTmLMVI59v9ohrWLjEbXBRlrXV3N6k
	eFMK0Bi62KKgDuPTkfG+OwE=
X-Google-Smtp-Source: AK7set+aFnP5rMPRo/m99shb4IMy/aI/Wc8HeEJBX8YkAaBNdpjimiY4SO5S8m3LRlXa0ZEhtAJyTQ==
X-Received: by 2002:adf:ee8c:0:b0:2c7:9931:4f7d with SMTP id b12-20020adfee8c000000b002c799314f7dmr16660450wro.18.1678463496288;
        Fri, 10 Mar 2023 07:51:36 -0800 (PST)
Received: from alaa-emad.. ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600001c800b002c7e1a39adcsm140139wrx.23.2023.03.10.07.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:51:35 -0800 (PST)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: outreachy@lists.linux.dev
Date: Fri, 10 Mar 2023 17:51:25 +0200
Message-Id: <ccd27442c1ad9a33b0b7564176fa68f7b153fa20.1678462486.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 547A83F49E
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.54:from];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	RCVD_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_NONE(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_TLS_LAST(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[]
X-MailFrom: eng.mennamahmoud.mm@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: UC3DG3ZTC3VDKW7JOKXUOFJCMTGMG7WW
X-Message-ID-Hash: UC3DG3ZTC3VDKW7JOKXUOFJCMTGMG7WW
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:37 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 2/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/UC3DG3ZTC3VDKW7JOKXUOFJCMTGMG7WW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix " CHECK: Alignment should match open parenthesis "
Reported by checkpath

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/fw-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-core.c b/drivers/staging/greybus/fw-core.c
index f562cb12d5ad..0fb15a60412f 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -110,7 +110,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}
 
 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_download_request_handler);
+							  gb_fw_download_request_handler);
 			if (IS_ERR(connection)) {
 				dev_err(&bundle->dev, "failed to create download connection (%ld)\n",
 					PTR_ERR(connection));
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
