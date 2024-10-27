Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1699B1DF9
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Oct 2024 15:01:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4C9E240C46
	for <lists+greybus-dev@lfdr.de>; Sun, 27 Oct 2024 14:01:51 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	by lists.linaro.org (Postfix) with ESMTPS id 104D040B7A
	for <greybus-dev@lists.linaro.org>; Sun, 27 Oct 2024 07:54:10 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=jUHdSOK6;
	spf=pass (lists.linaro.org: domain of surajsonawane0215@gmail.com designates 209.85.214.174 as permitted sender) smtp.mailfrom=surajsonawane0215@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-20ca388d242so29052835ad.2
        for <greybus-dev@lists.linaro.org>; Sun, 27 Oct 2024 00:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730015649; x=1730620449; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KWickdyVmCsECTe9uWE+5e70fKgYSzHKZqcNgghgJWE=;
        b=jUHdSOK6jcc47RVnWDiGu04Pp3f5Iky3d3aLNMgaHSGKw/y0bh8oMB4c+o3Fy8KCVe
         +RSK6FuNYbd54b7yBUjevtz6kptZL9q2Ghx8bwoD7ar6/Zz+mMYfhWVIqRq/219D7e68
         kUIBhmyqwSTsWHgcyvijslfvExFtYEYP4BLW87LMus5QH5no7Wd5crlqwjV3X+9xmn5v
         ECAEHu8Eowdn6+66ftcEmE63mAxN4+mcB7OWoh+0WJhJkcHYlWjDzl22MVi2LosPmiIj
         bRzUGarbYEgNuFDrAf8mx65FNtOr688Cfcg0uOTU1G4Ay3itv16xR7U8TuzyUjmQn+vF
         I8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730015649; x=1730620449;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KWickdyVmCsECTe9uWE+5e70fKgYSzHKZqcNgghgJWE=;
        b=Tfcu3C8UHESkCtX7yynM/Lo++ip4TVXwmhFx+36ubqp5HHS95HJev4zkjA0k7R5j7s
         kEtfB2pKA2GSBG13DrRCTM8CZwEurVr0kXD1miCNt3MLEORiyV0YXwefZ1hIPOtEM0jm
         f0ASk1OT9rPwoJ0WNYOlx7uQk+1NY5k/Vi1Qeu7GIuCtyB3XoyFeyjtthSyxPlseo+ni
         fvthMc5uX8mP9MEGCTywOGCIpkmAmBvJnqaap2Bxg9+EgqswhNez1tCDDg168uM1Ousz
         5UGdYcCX/lZi++nC005KmbNzeW/kkBpoozEfwHUF+9woAfagr2iNCyDxTRJdqvc7JPsO
         0QIA==
X-Gm-Message-State: AOJu0YxPEksH2k4xaQPHR1La5rWHjyQnNdsOxQsBPD9ajJT+tZhEovqr
	AH/SAdeA9T641P26IGcmBqH0KguyFaohcwCPTEB7J9oOO14EIcFuMYvOYHEQ
X-Google-Smtp-Source: AGHT+IFx3Mxj2UYdS6rcKUmhPqMKikjEiuq8NHR0Aq8wItg1uU6BpL7wNNtVlEM1eRsgtZFqMDZwlA==
X-Received: by 2002:a17:902:f790:b0:20f:b54f:400e with SMTP id d9443c01a7336-210c6cde236mr55853975ad.61.1730015648938;
        Sun, 27 Oct 2024 00:54:08 -0700 (PDT)
Received: from purva-IdeaPad-Gaming-3-15IHU6.lan ([2409:40c0:233:2700:b026:7bd0:77f6:16a6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bbf6d311sm32282135ad.81.2024.10.27.00.54.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 00:54:08 -0700 (PDT)
From: Suraj Sonawane <surajsonawane0215@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun, 27 Oct 2024 13:23:04 +0530
Message-Id: <20241027075304.7301-1-surajsonawane0215@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_CONTAINS_FROM(1.00)[];
	RBL_SENDERSCORE_REPUT_9(-1.00)[209.85.214.174:from];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.174:from];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,vger.kernel.org,gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 104D040B7A
X-Spamd-Bar: ---
X-MailFrom: surajsonawane0215@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: RXS3JHW2XYYXCIRVF4MHJVYFUVKR2EEG
X-Message-ID-Hash: RXS3JHW2XYYXCIRVF4MHJVYFUVKR2EEG
X-Mailman-Approved-At: Sun, 27 Oct 2024 14:01:47 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org, Suraj Sonawane <surajsonawane0215@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: Fix null pointer dereference in gb_operation_response_send()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/RXS3JHW2XYYXCIRVF4MHJVYFUVKR2EEG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fix an issue detected by the Smatch static tool:
drivers/greybus/operation.c:852 gb_operation_response_send() error:
we previously assumed 'operation->response' could be null (see line 829)

The issue occurs because 'operation->response' may be null if the
response allocation fails at line 829. However, the code tries to
access 'operation->response->header' at line 852 without checking if
it was successfully allocated. This can cause a crash if 'response'
is null.

To fix this, add a check to ensure 'operation->response' is not null
before accessing its header. If the response is null, log an error
message and return -ENOMEM to stop further processing, preventing
any crashes or undefined behavior.

Signed-off-by: Suraj Sonawane <surajsonawane0215@gmail.com>
---
 drivers/greybus/operation.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/greybus/operation.c b/drivers/greybus/operation.c
index 8459e9bc0..521899fbc 100644
--- a/drivers/greybus/operation.c
+++ b/drivers/greybus/operation.c
@@ -849,7 +849,13 @@ static int gb_operation_response_send(struct gb_operation *operation,
 		goto err_put;
 
 	/* Fill in the response header and send it */
-	operation->response->header->result = gb_operation_errno_map(errno);
+	if (operation->response) {
+		operation->response->header->result = gb_operation_errno_map(errno);
+	} else {
+		dev_err(&connection->hd->dev, "failed to allocate response\n");
+		ret = -ENOMEM;
+		goto err_put_active;
+	}
 
 	ret = gb_message_send(operation->response, GFP_KERNEL);
 	if (ret)
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
