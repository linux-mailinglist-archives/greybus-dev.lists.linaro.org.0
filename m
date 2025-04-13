Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F52A87202
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 14:59:32 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 6FA65454D8
	for <lists+greybus-dev@lfdr.de>; Sun, 13 Apr 2025 12:59:31 +0000 (UTC)
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	by lists.linaro.org (Postfix) with ESMTPS id B61164601A
	for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 07:32:45 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=mJaqeJhk;
	spf=pass (lists.linaro.org: domain of ganeshkpittala@gmail.com designates 209.85.160.195 as permitted sender) smtp.mailfrom=ganeshkpittala@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-477296dce8dso33566401cf.3
        for <greybus-dev@lists.linaro.org>; Sun, 13 Apr 2025 00:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529565; x=1745134365; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M4007EJtTTw4rTvfv0n1SalSLJtmVlRpzu0mtepvnyg=;
        b=mJaqeJhk/1dg+NhjfiKE9m8bfYexMIeIRytPWNHbpNHZwixwSLKN9FM8BEiVLQx6h7
         GOgvNMCPa5fJE7Iu2VVCagc2AlEMblrL1WJHY9+fMZBfAtUtmx4cdEJK5oFWhNuTT6r6
         7AtGV4Q78Pn0ts4MyyF6gnxWFBzORGc5/c0J637TpZUxnXEqa5TOJa0RnTKJbGIdRdFW
         1ZDs4F9o+BUGBG1l9W/zUVFIXV8Zuorqfd27yQEklAXxSJxQlTTDDuJLE6tfJ76d+bf1
         W3axzylkf5VGEtDE8T8fPz5xYtA5AQOIauiMdUjb9itXu17sTgW93yNxDfj1iDFuG3fQ
         ce2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529565; x=1745134365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M4007EJtTTw4rTvfv0n1SalSLJtmVlRpzu0mtepvnyg=;
        b=FlIbjUXY5XbLGZhqESMesdLoT6R0eBim4Uhb9Wgkh39kSUX92nWji8hvwL08CJhM2T
         gAqlsvGqwXN3pq1vlx036DIr39oCxHkvt9N9JudP4gWUP/3db8xrVAcavoltw89flYVk
         MXwUJhKRx1/78RMtwoIxY+H0sDB/udtwXFJncgkhMXnmMj2tsndjZPMmKCxPLIaxH7Zr
         Lsp/sNQzSUgXHoKXPZ1fh7LyYMRHF0ffMv/JEzEUWJppNGzERBVYKfuONRI5rIPVZSyE
         1Z+5sNJ3R8tEks+gYuz+jo57u5av7wbBeva8DKBL6mhwZAD4O8RhLtHFkKcnkynEB2Lv
         ALag==
X-Gm-Message-State: AOJu0Yx46rDw1hMtSZ8QFsH3F3ARQ/hrS1fo6hZ22F07rw6hBU10sn33
	NsdSYkR1wbuCHFw+M0wqKZ3bfxYlPuanQyaDlJwzWDR3GbsCPFtt
X-Gm-Gg: ASbGncvoItCwevXmuFDdnwgyfv+h43G8mB1Sb0vrLS0nfYK4DyAqQubwgG0yLE+PqE6
	Z+H/l40lk1iz2DrXMXvA6OAdH4b7LVVHVm87WPaUHpFH/7cByCg7XwB8Kji6iBQYhWTZft0QPOM
	XYT5S7KFeu2ttWSWl+xoSOzHIleJrEV4PkgznyEzN+91WSSvDXF4vAJgeckwRFnwRwTRm1jXZER
	qYKk4MZ1A0jWA0C61PhuYr63fv9K9eMjMucQZx4yQgS9cObYJ9VpfcRfeiaItrdOx0q9c3/HdP8
	mNzGMBrTue1EqUU4lOtdBkRqs9SQtXpUOOvx7Y4xV9Me0JSLUeRDKkuTxGd+IerQm7ibIWnnxyP
	OZN6khNjWaR3mVHzFoBNO2qTycvI3
X-Google-Smtp-Source: AGHT+IFIabePYRIYtpcxXzaSMqqVPGq5rSARcMVUANBjoA+ZM+7MttbdYWxqjnd1rND1XEHRjhJRxQ==
X-Received: by 2002:a05:622a:352:b0:476:8588:cead with SMTP id d75a77b69052e-47977551ea9mr100615211cf.17.1744529565199;
        Sun, 13 Apr 2025 00:32:45 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:44 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Sun, 13 Apr 2025 07:32:17 +0000
Message-ID: <20250413073220.15931-2-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250413073220.15931-1-ganeshkpittala@gmail.com>
References: <20250413073220.15931-1-ganeshkpittala@gmail.com>
MIME-Version: 1.0
X-Rspamd-Queue-Id: B61164601A
X-Spamd-Bar: +++
X-Spamd-Result: default: False [3.40 / 15.00];
	RBL_SENDERSCORE_REPUT_1(3.50)[209.85.160.195:from];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.160.195:from];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_ALLOW(0.00)[gmail.com:s=20230601];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com,animalcreek.com,nexus-software.ie];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_DN_NONE(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	TAGGED_RCPT(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	R_SPF_ALLOW(0.00)[+ip4:209.85.128.0/17:c];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Spam-Level: ***
X-Rspamd-Server: lists.linaro.org
X-MailFrom: ganeshkpittala@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: B3QE2KPOEG7ELQODOY6BEXZ2FCLWBMHY
X-Message-ID-Hash: B3QE2KPOEG7ELQODOY6BEXZ2FCLWBMHY
X-Mailman-Approved-At: Sun, 13 Apr 2025 12:59:21 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, hvaibhav.linux@gmail.com, pure.logic@nexus-software.ie, ganeshkpittala@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2 1/4] staging: greybus: replace deprecated strncpy with strscpy in firmware.c
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B3QE2KPOEG7ELQODOY6BEXZ2FCLWBMHY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This patch replaces the use of the deprecated strncpy() function with
strscpy() in drivers/staging/greybus/Documentation/firmware/firmware.c.

The strscpy() API is the recommended safer alternative that guarantees
NUL-termination and avoids potential buffer overflows, making it more
robust for handling string operations in kernel space.

This change improves code safety and aligns the driver with current
kernel coding practices.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..f37904b914d2 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
