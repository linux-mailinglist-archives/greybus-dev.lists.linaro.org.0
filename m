Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C44AEC77E
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Jun 2025 15:56:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 5D8C542503
	for <lists+greybus-dev@lfdr.de>; Sat, 28 Jun 2025 13:56:04 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	by lists.linaro.org (Postfix) with ESMTPS id A0B1F40E0D
	for <greybus-dev@lists.linaro.org>; Sat, 28 Jun 2025 06:31:38 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=cwNoLUmf;
	spf=pass (lists.linaro.org: domain of pranav.tyagi03@gmail.com designates 209.85.210.179 as permitted sender) smtp.mailfrom=pranav.tyagi03@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747fba9f962so2915671b3a.0
        for <greybus-dev@lists.linaro.org>; Fri, 27 Jun 2025 23:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751092297; x=1751697097; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QOBUCLBuTfXdSALdN6Vhehv2a8w9yUjOo7KeQ2AcNNY=;
        b=cwNoLUmfunQJ03pArUPyOmNC0sVjByNmQxU5MFAQn0Cucz1RyKmIHOy04u4OO3bv9B
         KP3nETAUoMV6l6tIMLGwX/4TfxhuYOWpAutYjqRDaRP2o8lj//u6ZOvkLV+pVO8EsU/D
         VQQP6U99FZxuDwegIlgcBG2uU5q+mWeI2MMl9uZxTfBdvjOCZ38SEAFKFwQklyFXNme2
         2VbViOiDxZUpI7FULmdJ7/QVg95lp/x4y5WcOOOHFm9dG6+Ln0u7VdEHkOPY0K42UCdz
         qKfhBLsDASpelqj7pm+f5HHcUMrumOzMCuKjDgz/o/tNkAIGnTJ363UG4nDCxLO21lF7
         Zv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751092297; x=1751697097;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QOBUCLBuTfXdSALdN6Vhehv2a8w9yUjOo7KeQ2AcNNY=;
        b=qZq57iPtY5EHZun2+tyCGpciJ/AkeoeMyGonkpvTTIdgh5cGNGbfMGMOFG2DpFoTZo
         TkrM4u1IQ2gJdJq2Y0ihdiH9mpKPV05ytNIKWnhf+KpvtE3ulmzkJ6AHrzCrumMl+qfB
         GOikqAcmHFcv5pV05/YjatNkDYcmMTbfBBDILFsT94dQ108TFIZaEQcXPP/bMRITVpBm
         3gw3DVnaa9maxxCVe1tiqOuG8LS7GkVgH3D7krswHgihSMSkoFnSnPocMqIGZjRxeAuo
         oCW1CLxP7GCga/grUV1C1COHJtF6vSq7+4YvaGeEcI6b204HmoQ+u5aEbGXhYGddl0SC
         b4Rg==
X-Gm-Message-State: AOJu0YzY4+TdEO0gFMDr2qLyfJHGI2osMdSKbs3CHsV32K3FV75zQSOw
	1YW0Q8S3LV3g/ZhZmV6kMTIZgeSZtX1x0I54mmkMUWCgjim9oQAyg2trVhc6+V+M
X-Gm-Gg: ASbGncuau/xn3Szvijg1tEOy9kw4YCNXDlgbhqGN/CvmXcAgzpub5/2eIOWFB0c87nH
	bHYQOKM+GYflQgk8sSF2BIJ1n2omIGpDehOBYH4nI2bPSecjkXXiNMFj+kmjCPfcnNQfWKzG4Vj
	npm2u24q6Sy3oj/QraKhfyciquJUx19LxWRRBjIf5qZajLlYbaT9BUftvASyolVWRR1arYqStUQ
	e881DYs2ZXwzRMaALHpOE48NLGCLcw16R2NeCH4yHs77tWdmpQaPi7rv0xzJ11UqV8MM6JfaEMy
	ND9a4Ifrcfbwyx/gW9LXLZCPOG5nmvKFv9BtjPuWBZk4TxNSbGJSBGpByqJSD1Nr2zyiU57RPpz
	prROewP1UijkGB45KHw==
X-Google-Smtp-Source: AGHT+IEWpizPCQsGrOAiyMcr0FAuPQFRdWyOcJk3cOZz1JJvdwfoh/5L9YaZDy/VEMzWehbaSMmfOg==
X-Received: by 2002:a05:6a00:ac02:b0:74a:d2a3:80dd with SMTP id d2e1a72fcca58-74ae3e7b7f9mr15110492b3a.3.1751092297180;
        Fri, 27 Jun 2025 23:31:37 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:2179:50ec:85e6:275e:cc56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af57ef669sm3656147b3a.158.2025.06.27.23.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 23:31:36 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Date: Sat, 28 Jun 2025 12:01:21 +0530
Message-ID: <20250628063121.362685-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A0B1F40E0D
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.179:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[nexus-software.ie,kernel.org,linuxfoundation.org,lists.linux.dev,gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	DWL_DNSWL_NONE(0.00)[gmail.com:dkim];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RBL_SENDERSCORE_REPUT_BLOCKED(0.00)[209.85.210.179:from]
X-Rspamd-Action: no action
X-MailFrom: pranav.tyagi03@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VJ3U4M7OKKKQ3G55F6UKEVVYO4TJQOH4
X-Message-ID-Hash: VJ3U4M7OKKKQ3G55F6UKEVVYO4TJQOH4
X-Mailman-Approved-At: Sat, 28 Jun 2025 13:56:02 +0000
CC: pure.logic@nexus-software.ie, johan@kernel.org, elder@kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, Pranav Tyagi <pranav.tyagi03@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: loopback: remove gb_loopback_async_wait_all()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VJ3U4M7OKKKQ3G55F6UKEVVYO4TJQOH4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Remove redundant gb_loopback_async_wait_all() as connection is disabled
at the beginning and no further incoming/outgoing requests are possible.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/staging/greybus/loopback.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1f19323b0e1a..9d0d4308ad25 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -1110,13 +1110,6 @@ static void gb_loopback_disconnect(struct gb_bundle *bundle)
 	gb_connection_latency_tag_disable(gb->connection);
 	debugfs_remove(gb->file);
 
-	/*
-	 * FIXME: gb_loopback_async_wait_all() is redundant now, as connection
-	 * is disabled at the beginning and so we can't have any more
-	 * incoming/outgoing requests.
-	 */
-	gb_loopback_async_wait_all(gb);
-
 	spin_lock_irqsave(&gb_dev.lock, flags);
 	gb_dev.count--;
 	spin_unlock_irqrestore(&gb_dev.lock, flags);
-- 
2.49.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
