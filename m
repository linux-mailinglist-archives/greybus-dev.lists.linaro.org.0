Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPaiMyf49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 20:59:51 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 586604AEFB0
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 20:59:50 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E3DAB4095D
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 18:59:49 +0000 (UTC)
Received: from mail-yw1-f196.google.com (mail-yw1-f196.google.com [209.85.128.196])
	by lists.linaro.org (Postfix) with ESMTPS id 3E55F404F5
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 17:54:44 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=LMifgDkc;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of sonionwhat@gmail.com designates 209.85.128.196 as permitted sender) smtp.mailfrom=sonionwhat@gmail.com
Received: by mail-yw1-f196.google.com with SMTP id 00721157ae682-7bd5c582c6cso7245307b3.1
        for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 10:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777571684; x=1778176484; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3dimdmnPw7p7h4vp2Fv8tAEKCuPapstxfNs8Fmggzg=;
        b=LMifgDkcgq8fbpMpK4FdVgPXcusWY7ZuYVAHYGJNegWTp3SOu+gbHbOctwbHU4oTE8
         5jDq7CYYTZAXTTeGu/3dke4nsTC1KhjWamCEp1ClCZS+pVcpDTsA2eQoSIHZBw3NX4S5
         CZmbvlxsv/L4KMiiX0e/TlqpX3ybq1knpIOMRnHbXx0HorVxUpHZJ2Hg5ekGTynAwUb3
         jIHbHh0p7n8FWhNiZkdkz36DBP31ufJ8D9h6EJ3FWANX7VtDCkROUicMdawy0RoUn99Q
         H/1xQDSUBOM0Zd+F45w+Vwvf2HvssUESk8Himh3ORfLNE/A5wLT0x+wgLsNCC60ZMpF4
         1jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777571684; x=1778176484;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3dimdmnPw7p7h4vp2Fv8tAEKCuPapstxfNs8Fmggzg=;
        b=KcoUYPRNf3wBWVG8sJPqzC3dwK1BGOV1oMp64YTk7vv3JcQz1dNY8D4Z0eOA5iyryv
         1VT3N5pt/55f+uWRs0S7JjbeQONs3bi5UH/TUarGY1CcEkjsGkwrRty011scaSzgFZWi
         YryDVyp2ysd0sGBMLx6pdFmp2RYrYgFcJfFsxVQ8SdHQfWk4LsYZr2GVRUn/WKLgblki
         YE0evS6qTj760E8m00YObUQXu7ufDbEl2DIpPWnAgGPmxxCO0T2e2l76rwIvTkNqe6cE
         E5SciOYt1PZQ3bgdDPGXYCDB4Vp/IEouYug8xAiSH1D/vnb+vj/b/iCQ/AL+YgIZVfnx
         /2vg==
X-Forwarded-Encrypted: i=1; AFNElJ/sRQEfl1GYgtDOc5Habw0meukDCY5AmVghnhggRy07P1PLyc1K7l3I0gzXHXQXXtjr2haG7gNq3M9SjA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzfGMvltQqm5qdMoBJLiZsMYT/HxeCsvbtmuK1wN5qQSECjXo0S
	E9seBfYNPcnBQvFe2sMAvHKrAJ2doF9mBRilzcrn5prcAInyS7IvD5Qp
X-Gm-Gg: AeBDievWmtsTVcxCILauZ94XdhEjqs2kSHDkJBhhHxRt7oNOKp+jVj/OyqIP60ukNL2
	PNjXlW504LOoxakOTlWAf6A2QWAjF3tcs7iGKKxWOhQvEOvShaGmbyanIib3RMJJctknX/1m6+u
	pYuga5+2f8bhVXGbsgGdLNfQTgA/8k7OR40iFLKqNmjTYV2lOPT8LkkAdIdRdIrBjcBZ8A7Absb
	b/qIO8b1xYj9VuxtFFLX0/QCQTXgvscRZWW+khkuEPWygkVXQ92OARRa1PCZbyubVe+92DR8E7M
	++YJXjCerSPs7v9YclJ2P3qw2sM0XaCM5QBCD/ZhsqO/BmjlShVQWpi2vaCOTeUyoSG7+Di7fFU
	uhrftR+bV5mQLkVxDlmjwvtt1d8p0X9d1ZHhMEToFW8eX4NcfKzduBgXJ5I4saRMws7wfbIZI1T
	blNIgIB8fK5EvcKSaDKa/Vl1lkQfgrP+Iku9h+R3O/hpgKB3ImQqZZ9db4W5NaTK+uCkd0uKKpr
	A==
X-Received: by 2002:a05:690c:97:b0:7bd:6129:f245 with SMTP id 00721157ae682-7bd6129f547mr15443587b3.14.1777571683712;
        Thu, 30 Apr 2026 10:54:43 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd6686ead7sm327347b3.39.2026.04.30.10.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:54:43 -0700 (PDT)
From: Bentley Blacketer <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Date: Thu, 30 Apr 2026 13:54:36 -0400
Message-ID: <20260430175437.3699-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: sonionwhat@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: TKEZRI64NBZLGK7YJX4JYXRXFBXWFIBM
X-Message-ID-Hash: TKEZRI64NBZLGK7YJX4JYXRXFBXWFIBM
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:42 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bentley Blacketer <sonionwhat@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/TKEZRI64NBZLGK7YJX4JYXRXFBXWFIBM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 586604AEFB0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[25];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.990];
	FROM_NEQ_ENVFROM(0.00)[sonionwhat@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
---
Changes in v4:
 - Fixed duplicate Signed-off-by
 - Fixed missing tab on snprintf line
Changes in v3:
 - Fixed author name mismatch
Changes in v2:
 - Fixed whitespace issues
 - Moved testing note below --- line

 drivers/staging/greybus/bootrom.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..9e0f24d6d 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -168,13 +168,8 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
-
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
 	if (rc) {
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
