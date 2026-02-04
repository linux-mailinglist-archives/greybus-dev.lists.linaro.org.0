Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMuMMiiSg2lCpQMAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:32 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C08EBB66
	for <lists+greybus-dev@lfdr.de>; Wed, 04 Feb 2026 19:38:32 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id AC4A43F722
	for <lists+greybus-dev@lfdr.de>; Wed,  4 Feb 2026 18:38:31 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	by lists.linaro.org (Postfix) with ESMTPS id 158663F914
	for <greybus-dev@lists.linaro.org>; Wed,  4 Feb 2026 18:30:18 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=TNmf2gl1;
	spf=pass (lists.linaro.org: domain of rchtdhr@gmail.com designates 209.85.210.182 as permitted sender) smtp.mailfrom=rchtdhr@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-82311f4070cso135066b3a.0
        for <greybus-dev@lists.linaro.org>; Wed, 04 Feb 2026 10:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770229817; x=1770834617; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XeKtehgegrBJK1qC444tDoPU5h/Cv5FUsriYQwcl1xw=;
        b=TNmf2gl100K+Y8YyPbp6HIE0wRKG+3svdjmiPgs9/ohh8A2dkrOnjy65rAuj1ddrFm
         q/x/LBCMiJE8NXbdhgz5PZt2a8nTlF4UIpJMsoRP09eie3FYRJgb58/G+WkGNORtqDO7
         k/zGteLpCk36HYrdN+R/vOMN5WLbiahL07Hkc8+SWpk/G78B5qTh45D+o1WjGm8Mdg9k
         /e4iKtQc2YYgwuB00GT7z98QadEpRmvo4RFvUqLLSAscYAp84K0jeN7mpti1BonGi4a9
         i2mSTPapnBN9EYsU4VUbpcAzcuYdwtJparB9X8REpwdabx+TfJYM2cSDDRXC4WWvvMRU
         jirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770229817; x=1770834617;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XeKtehgegrBJK1qC444tDoPU5h/Cv5FUsriYQwcl1xw=;
        b=gHzLzzYXZpaBjp90rFOzw9QqvAxd6HACoBCL1giQICWvhXn1cLkBbnQevL4gQKu1eF
         KjWrnPjaDpRRtwDEcmOXuN1RA0uROAxg5Eynjum2WfaPLh/9f6fHNkd3iONwWe9PWuJR
         IMM0vEgv8JIZRuRnUMJOcQOjxpvcO+z1ey4CWD8m7AUVpGLFjNAtw3y0waLY0WxJo3dy
         8azI3EH0PSv3103ClYIkN1CEzngEEJTSJx8rYydQ6Cs5NwBF/HtR0iLHMyRPYfiKC0KE
         qHiucQxyup3WhpDFBSNTH0eYDGt7nY5TzvZunbBpc4Hx7E8VI5ZeHWaq2l2gPyl1DhfU
         yLRg==
X-Forwarded-Encrypted: i=1; AJvYcCWkWqFapV16IhvkpJ0alFs/lxYaHVQx4uMc+flLukFzC6o9O5mTenJcljbHEv72hzZRObELeTkXkr/4Pw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yxtcq93jRhqObdVeL+XGhI5yF+dy/A6eiV/NVAglGFoIk1CcEhK
	gnhYexPYgEkoEndXNl+ACklA3BJrfpIY/TFX/vqyOZHMxeIPBPb7WHi6
X-Gm-Gg: AZuq6aJpDouWsD8jgVpOzsMb0pKGsORZ2Ms2CmrtL8ozl9EnwCzXYD6fK2RYmt91zNi
	72R6b6icw+gRAjOu7DbaK5Cuq835ir+8VadSqD6/fLdLZaUk0NSzkUayWwURsm4lBOYqx3XdVtM
	W055/N/8jxQ0ZxM+bx8PmyKUHEPWWutUzEDkgbqttgo1Gw4QrFfmJoH695D49PeU+FrcbV3chfF
	uJJZO8C/fVvw+XbXV83R2hghL+PInD/BFeZkuussESNorczgYHVABb6pNz9ElE3trGT9YCGwn0+
	rSWKcEyVXbJl6fyy2wVISk2ScKEOktMeFXRSxai0tvk00bdr/MO1AAL8/UA8XXxUnCKKO0JZvyn
	LL3dcNAbxmj8ucy5TLWOtask3tdDcxISHUuuIz7TF50nadqwMzEQIIFHyrE5YRjkzt+ycuNgG7R
	o5M3uy31PpSqlOwcHYcMXTOzai6pfn
X-Received: by 2002:a05:6a00:983:b0:823:ec5:430c with SMTP id d2e1a72fcca58-8242d4eb74fmr184781b3a.29.1770229816985;
        Wed, 04 Feb 2026 10:30:16 -0800 (PST)
Received: from DESKTOP-7ISABPS.localdomain ([223.233.85.111])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d1e55b8sm3902912b3a.30.2026.02.04.10.30.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 10:30:16 -0800 (PST)
From: Rachit Dhar <rchtdhr@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>
Date: Wed,  4 Feb 2026 18:30:03 +0000
Message-ID: <20260204183003.182728-1-rchtdhr@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: rchtdhr@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BNZHAVPLGMEKBKR6I6ZL2P5YL2OGGU5H
X-Message-ID-Hash: BNZHAVPLGMEKBKR6I6ZL2P5YL2OGGU5H
X-Mailman-Approved-At: Wed, 04 Feb 2026 18:38:25 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Rachit Dhar <rchtdhr@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3 1/4] staging: greybus: added comment to mutex declaration in fw-management.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BNZHAVPLGMEKBKR6I6ZL2P5YL2OGGU5H/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[rchtdhr@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 92C08EBB66
X-Rspamd-Action: no action

Added comment to mutex declaration, to resolve a checkpatch.pl check.

Signed-off-by: Rachit Dhar <rchtdhr@gmail.com>
---
 drivers/staging/greybus/fw-management.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/fw-management.c b/drivers/staging/greybus/fw-management.c
index 152949c23d65..07a0e6b63cf3 100644
--- a/drivers/staging/greybus/fw-management.c
+++ b/drivers/staging/greybus/fw-management.c
@@ -28,7 +28,7 @@ struct fw_mgmt {
 
 	/* Common id-map for interface and backend firmware requests */
 	struct ida		id_map;
-	struct mutex		mutex;
+	struct mutex		mutex; /* protects fw_mgmt->disabled, and serializes ioctl */
 	struct completion	completion;
 	struct cdev		cdev;
 	struct device		*class_device;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
