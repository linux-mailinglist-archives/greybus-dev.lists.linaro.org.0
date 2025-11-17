Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F76C696BA
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:38:43 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EFD5B3F918
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:38:42 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	by lists.linaro.org (Postfix) with ESMTPS id 909843F7E5
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 17:22:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=lcfDQ7ZU;
	spf=pass (lists.linaro.org: domain of dharanitharan725@gmail.com designates 209.85.214.169 as permitted sender) smtp.mailfrom=dharanitharan725@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-297e264528aso45893695ad.2
        for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 09:22:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763400132; x=1764004932; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yAA0GwH52ajq/akzptLH6J8vo5E9RZZYpTL6Z8e7ZiY=;
        b=lcfDQ7ZUzfeVPs1ruw09Q+iCKVav8o1EmoXyZDi89F6/ckSvnXQgGKxau5m08xefcf
         fcQMslvDBKg8J1KKZeMVAXgSof1YQw4p3FdcuSBa0OzyYIYQVpT51eYc2K4a2CRXIUQr
         Z1HjTw9tAiW7QAA3IKgPjZNuvKEPX/P40nbGm0D2lhzm6x1xqWFEDj1d4zFL1wMuGwnj
         KIWIEyE9DMj4NOLH25OmbjBJEzQryqeZqDLB0H+gmHclJPbw+JqXGZfjz6z2GCmLAvv2
         QihYxL9NjtwKkmFIij4K9ByGcMBhPtpu8Qo5yL/djCgBeeb0MLA7PjLIcRf9Y5t8BBvj
         x+SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763400132; x=1764004932;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yAA0GwH52ajq/akzptLH6J8vo5E9RZZYpTL6Z8e7ZiY=;
        b=O4F7qStCZteXKggzsm1sCC+LV1u0PSN4e0ILfxrItTnhhoISIiihGxVmX4V/x6jDbD
         CbhW+blkENta4OTZlXXjPDIuHTVhM2Mf7n9L7JkIdkkPohmknbyifIroKKpCljQSy9U0
         qllXf3mQGzibOj2reka3MR6DhN2AmSHzX9M3oSZvhk2a/U8T1jX8md3BJthZjCFTzMby
         uzmjfG4f0AiSOgOtlxk3EiDYOdykO0Dgno8Qd1ISXFBMC8FR7+nwN86YZfV+mjXLs/Cr
         ramiBxChazptH/++zGEw7FQ7XHAOT8wVh2g8IQuSBMqQb+c9C+j3Mqjnd0Dv5XnvMvAw
         9Nmg==
X-Forwarded-Encrypted: i=1; AJvYcCWD6kHeAfxx59wnriLlkbR177PnHG6Ui9MKnrKQ1tmCBMDGrPFrrPZ0SZOTfpCgkPEEuuo+X9jOXBIaaw==@lists.linaro.org
X-Gm-Message-State: AOJu0Yweh1tR+qQC+dWaMidTPwImJRC8zCVkdUtOnNbAmlolyBLuZren
	5IefgcsOF1QrmXSISEbJfmVvkDPGeiIaww1F3zbA6TYVALyFzzqMx+l3
X-Gm-Gg: ASbGnctVJh542swPYcNqUYmjlYL+nLCxgbehictmsWRwX8zh6lMujsDyCi6VwoYvM0W
	eEVNXrAFwYcGMqR6Oonx5bPUrdr6ica1eF4aMcdnDTgdLaZdR3DxouAyMXd2DaYB8+7B/GhC+Hu
	RBVVavvSFdtMENUd3KS4eUsiWCHmP1SYRi57Q7yzY8bDT3EqYvNlGFwfkG13Rr2obAA72qrPcpx
	/p/6EovACSSY3p1KtZxp8ojSXFtH5io06qKkY4NV4ZOS+ooerYxpPFA/prqHoXn/ZOmAReu8w1R
	SBgKJJKPRhH7pZ2Boy943yuKVypF0lG+8RgdLE8IUYdZWSNapYlvMSk4706cmePZvX4aX42ZvA3
	xEs880u3VMDL2CrjQQANhzwZCy5MQNM8Y/5g2RGa+yJL2L6FIqeqN8L9tHwGPQOPEjwJWRj9YY/
	4Qlz+0yAQNsX148AQIuF1Y5IjitzLhtilhIbU=
X-Google-Smtp-Source: AGHT+IFvlXWfDf546K4r1AuyRxT+uG27t/39YDLO2SJ2wxn/1qv3fSENY0aOYPAZFEFjGBApJ2QX4Q==
X-Received: by 2002:a17:903:380b:b0:296:3f23:b910 with SMTP id d9443c01a7336-2986a6b5587mr118372555ad.9.1763400131613;
        Mon, 17 Nov 2025 09:22:11 -0800 (PST)
Received: from localhost.localdomain ([157.51.73.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2ccbc2sm145395385ad.102.2025.11.17.09.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Nov 2025 09:22:10 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 17:21:33 +0000
Message-ID: <20251117172133.10936-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.169:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,gmail.com];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 909843F7E5
X-Spamd-Bar: --
X-MailFrom: dharanitharan725@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: PHOIZTTT7E6ANDT4RQ6DGYDGFHBH4YYN
X-Message-ID-Hash: PHOIZTTT7E6ANDT4RQ6DGYDGFHBH4YYN
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:33 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, Dharanitharan R <dharanitharan725@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/PHOIZTTT7E6ANDT4RQ6DGYDGFHBH4YYN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

v2: Fix indentation issues pointed out by Greg KH.

Signed-off-by:Dharanitharan R <dharanitharan725@gmail.com>
---
 .../staging/greybus/Documentation/firmware/firmware.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..6f6410878ee6 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,9 +63,11 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+	strlcpy(intf_load.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
 		printf("Failed to load interface firmware: %s (%d)\n", fwdev,
@@ -101,9 +103,10 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+	strlcpy(backend_fw_info.firmware_tag, firmware_tag,
 		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
 	if (ret < 0) {
@@ -129,8 +132,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strlcpy(backend_update.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.43.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
