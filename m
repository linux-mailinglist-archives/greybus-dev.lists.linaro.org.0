Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNlfJ58HoGl/fQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 09:43:11 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7C11A2C10
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 09:43:11 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6C0173F7E4
	for <lists+greybus-dev@lfdr.de>; Thu, 26 Feb 2026 08:43:10 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 2A1053F786
	for <greybus-dev@lists.linaro.org>; Thu, 26 Feb 2026 06:52:57 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=agFMaYUV;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ad617d5b80so3019665ad.1
        for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 22:52:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772088776; x=1772693576; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Gf17pvZ1NyScQyL5xRBCKEFufheAGb1+DVddT1v2qng=;
        b=agFMaYUVAdbiAxUZaxt6fPmF1pZnj/OBurDjH5b03GGcR83DYN6qcTmWYBZR7TF5Bm
         b+BiZOzyvGXXZAk3gwqON9HudbDBb7398jcRZ6mO4qRNgf4AGOPcxsq+PpFogMeDHX7f
         MEKEjdtsmwbwu7qKKsbHTeYtH+kmAHD3ejBu4piTE/5kRXCITLPQvIo5mOOLMiymww0g
         TsipjZJ2ClRtBjvCD/2ybmqP0dIV49sWlq/KdMH1HEzk9hoEohh3r0aC93HbH6MRn+7m
         HVlya5PzZTtOoSvS52y4dfwW75BQQNzRRAnHwsxwVXHZ1Ckf+SatY4DLbQd7Apa9JSEj
         SpJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772088776; x=1772693576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gf17pvZ1NyScQyL5xRBCKEFufheAGb1+DVddT1v2qng=;
        b=F3k8CCDZ/hx7ET2DbOagHPbOehUxoSk5DwDqURqzQiPM/wIIwNSuIC0SUegMu5KgFB
         NRFs9P0TJKAIO6Sk3M+pF6Bvh7gkWeR+BiFSAQCn1BfOTuM/ivyyFjvYG/0eMFlzjnOc
         aF/4l08OVyHv+eQSnz7gRRVHFKtf9aY3ixhE0zTg4WNnQdhjADaSELsje1YjtUTEcsBP
         9ycluwtS3fPm/0EYS5hYj7Hoi9DTn4QlJjz7AhIaMigdVsEVMWZnmBmTppDSxzObkrmd
         aZhSbziFsOhpkAUDj4effLPErpHST8PwFGOkgmRhru2GQesE7QQtRNaAGuDzN0mera2X
         Om5g==
X-Gm-Message-State: AOJu0Yw6tZRDJ5Kpoguq/11/KQxctLLvsBM5RZUnIfmMuwXuFcLmT/7c
	GJvSnqWiE5rh6W5fNlkPAwPRR8rSAY1u6IZUNMC4XSiWTCUwJvaSpvC5
X-Gm-Gg: ATEYQzzI38MMeB3hE4TBomAIV8jlfIRjTrV7GSnAqcZ/9H/Ry8EHR8Ss5SAgX69wmWG
	tE8aHvkeQGCmlikHSu2G5LjH3H+RZjHKHBKCcDdcd6gOr98ppipW1hNKNVnzb07YOf/6FVUCDs3
	FYbrkWorBq8SZkUZ8QHzsDp2a0WaaJTpd29Mht38N2ytB1RnguNgf+vE4/ukun7m+gthPyeuQq9
	djnzaY9mhDD5UgaRr6p55eo3yoKS0JebW+Kq17v0oU4qGGWFdFrHCltTfJz0EgHJtbClGzfaOWt
	JVEq6hpexA+PqhMFgySnZ7PzqSLKN3nEXQ4zoMuJrX0rjkYKYW5J4oW6q/sIRSOV4f7vZmkqOWi
	QRTBtdyZwj+4by/yQ9fAgzPh5mif6rp1pqFPsfY7mQbc6JjGHCsxcYU/PX7CjLkyOaEeyohpNAb
	otro1fBJwQqBDBj2YMkRHBlr4WRa19IxuYH61RyiWIs1a9
X-Received: by 2002:a17:903:984:b0:2ad:bdf6:6405 with SMTP id d9443c01a7336-2adbdf664d2mr63896525ad.32.1772088776187;
        Wed, 25 Feb 2026 22:52:56 -0800 (PST)
Received: from fedora ([2409:40e5:11e8:25ba:c234:5daa:9801:9675])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5c1976sm13490575ad.22.2026.02.25.22.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 22:52:55 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: hvaibhav.linux@gmail.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu, 26 Feb 2026 12:22:39 +0530
Message-ID: <20260226065239.11698-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: O3ORM4P25USBWJ77NT7R6RGGR6O3SSMM
X-Message-ID-Hash: O3ORM4P25USBWJ77NT7R6RGGR6O3SSMM
X-Mailman-Approved-At: Thu, 26 Feb 2026 08:43:06 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: arche-platform: Use sysfs_emit instead of sprintf
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O3ORM4P25USBWJ77NT7R6RGGR6O3SSMM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.974];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 4F7C11A2C10
X-Rspamd-Action: no action

Refactor sprintf to sysfs_emit in the show function of the arche platform
driver. This follows the standard kernel practice of using sysfs_emit for
sysfs attributes, ensuring consistent output formatting and newline
handling.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---
 drivers/staging/greybus/arche-platform.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/greybus/arche-platform.c b/drivers/staging/greybus/arche-platform.c
index f669a7e2eb11..de5de59ea8ab 100644
--- a/drivers/staging/greybus/arche-platform.c
+++ b/drivers/staging/greybus/arche-platform.c
@@ -374,15 +374,15 @@ static ssize_t state_show(struct device *dev,
 
 	switch (arche_pdata->state) {
 	case ARCHE_PLATFORM_STATE_OFF:
-		return sprintf(buf, "off\n");
+		return sysfs_emit(buf, "off\n");
 	case ARCHE_PLATFORM_STATE_ACTIVE:
-		return sprintf(buf, "active\n");
+		return sysfs_emit(buf, "active\n");
 	case ARCHE_PLATFORM_STATE_STANDBY:
-		return sprintf(buf, "standby\n");
+		return sysfs_emit(buf, "standby\n");
 	case ARCHE_PLATFORM_STATE_FW_FLASHING:
-		return sprintf(buf, "fw_flashing\n");
+		return sysfs_emit(buf, "fw_flashing\n");
 	default:
-		return sprintf(buf, "unknown state\n");
+		return sysfs_emit(buf, "unknown state\n");
 	}
 }
 
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
