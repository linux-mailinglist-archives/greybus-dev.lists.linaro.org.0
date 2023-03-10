Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9DC6B5569
	for <lists+greybus-dev@lfdr.de>; Sat, 11 Mar 2023 00:17:44 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 636203F4C4
	for <lists+greybus-dev@lfdr.de>; Fri, 10 Mar 2023 23:17:43 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	by lists.linaro.org (Postfix) with ESMTPS id 2016D3F0BD
	for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 15:51:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=cYjWkG0i;
	spf=pass (lists.linaro.org: domain of eng.mennamahmoud.mm@gmail.com designates 209.85.221.43 as permitted sender) smtp.mailfrom=eng.mennamahmoud.mm@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id r18so5484972wrx.1
        for <greybus-dev@lists.linaro.org>; Fri, 10 Mar 2023 07:51:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678463495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7rAHD7fKN+d5LXJmYh701SPQypdto2hSUjcoVGtRUMU=;
        b=cYjWkG0i0JfbUWP2Y+8Ik/AMlSn1huUyNXYTvDdE6RHDKFhVt2nokYIRF0DWg4dLF/
         9R0+rGx7j0+MavmlFqN6xyYU+e+9B+KBLBQefEMLgrpo393qK+XoMmBhipvHVfaXaR9G
         u6VmWiqKMHxd67/ALrTg3GwhF8m8BI1hEU11L7YDtWCO2c+TQECZrH6TPg5FG7Mue8Yl
         bg4cpxSAbUnTkRMYHZtPwoGfQeOgKsFx2YArU8B1yW4VHbuafP6jUc2qZH4+SCIO5deR
         hcwtgHYNCKewkThTCjYS88drnP/JOSrqX+/AKm5ML6Z6aiyGT6RdO8oxgkzefYE2179v
         m5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678463495;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7rAHD7fKN+d5LXJmYh701SPQypdto2hSUjcoVGtRUMU=;
        b=5B1yKrjAlJ7YUmNno4KaAnfHSh04nGvvwQpFz54Gl0zOMiw1N7XQWGAnnC19q9STaI
         gzc8kOymhoS5U7MaVyDB7IYkehjVR+BKVEzSwRIQewV2U6074mEmJuMa+R4QRGsZnRyE
         FxfGHhuO7TSmlfDpZX+uWpt9iU8eOYEJurnUGgMbuvEkN1NgAjq13mHDQHAbFAGE1CVT
         8PG7ySfxDX5uBvV0wStlzRI1Oo+elm2uaFCZ39ep9vLySOaCj8Tc5MnIp/PW1NYD4/Ha
         4XRaVqjeFRJv/OoGgPqnKI6aXCDz4syuxBH0oXNHT+jckikCgrQwFCRO+PTN3wAcnmTP
         spcA==
X-Gm-Message-State: AO0yUKU4CUrk906SF9fH/nHNsQknyfvi9QH67ynQ+Uuluzw030/EjNK9
	T1/VyxjFRkoGTsqyWFXuTE4=
X-Google-Smtp-Source: AK7set+d7Q+0h2RUYMfZYXj6ucr0U0beV4MqE4yhacgerLbbG6Q064+eN+N6+rJ+eBQA10OxLrmbjA==
X-Received: by 2002:adf:cc8f:0:b0:2c9:23c4:8f93 with SMTP id p15-20020adfcc8f000000b002c923c48f93mr16353992wrj.57.1678463495023;
        Fri, 10 Mar 2023 07:51:35 -0800 (PST)
Received: from alaa-emad.. ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id t8-20020a05600001c800b002c7e1a39adcsm140139wrx.23.2023.03.10.07.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 07:51:34 -0800 (PST)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: outreachy@lists.linux.dev
Date: Fri, 10 Mar 2023 17:51:24 +0200
Message-Id: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 2016D3F0BD
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.221.43:from];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
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
Message-ID-Hash: ERJWISADCJSX5G3U3TAVXBV3CNTAET62
X-Message-ID-Hash: ERJWISADCJSX5G3U3TAVXBV3CNTAET62
X-Mailman-Approved-At: Fri, 10 Mar 2023 23:17:37 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, eng.mennamahmoud.mm@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ERJWISADCJSX5G3U3TAVXBV3CNTAET62/>
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
index 57bebf24636b..f562cb12d5ad 100644
--- a/drivers/staging/greybus/fw-core.c
+++ b/drivers/staging/greybus/fw-core.c
@@ -89,7 +89,7 @@ static int gb_fw_core_probe(struct gb_bundle *bundle,
 			}
 
 			connection = gb_connection_create(bundle, cport_id,
-						gb_fw_mgmt_request_handler);
+							  gb_fw_mgmt_request_handler);
 			if (IS_ERR(connection)) {
 				ret = PTR_ERR(connection);
 				dev_err(&bundle->dev,
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
