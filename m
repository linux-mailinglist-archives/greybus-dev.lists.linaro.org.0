Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C562ADCC17
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Jun 2025 14:57:37 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B5313447DE
	for <lists+greybus-dev@lfdr.de>; Tue, 17 Jun 2025 12:57:36 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	by lists.linaro.org (Postfix) with ESMTPS id 541D341093
	for <greybus-dev@lists.linaro.org>; Tue, 17 Jun 2025 12:51:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b="YM/f3Gx1";
	spf=pass (lists.linaro.org: domain of pranav.tyagi03@gmail.com designates 209.85.216.50 as permitted sender) smtp.mailfrom=pranav.tyagi03@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so1826079a91.1
        for <greybus-dev@lists.linaro.org>; Tue, 17 Jun 2025 05:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750164706; x=1750769506; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSxo0ZHyfJr1fQpftYFJehkxIFFbw7pyxo/Db9fNjFU=;
        b=YM/f3Gx1hbTlu/tdtkzHpvgxDM8YpSiaJG8WkhZM4yIxbEGTTgCtRCvaAfAYA7lyTc
         o+HD3HK7Cc4wLlNhwG3AkvgZeXLCPdh1DXmQz1weJZ4p4n+/TqXbLKj/UMd4S3tLf2r2
         JENP9eaT6zRKsYUpytZO5lUMwub7NibL2Ltsan4rwi8VKUBllGfjbC2FsFtKabKLCgoy
         PGJ6S/nIGaos4gjmi7wwClvglLXOFm4RX7JVy0pwU2cYkl3S39gRvPqnKzeXCDGZFk8J
         VchIpjd8vZbZ4SpkxzOflmwP7d9IbrcktQcEQcsa1PX2yzgvo/IuU36XCrZPrRRYpgr6
         2a5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750164706; x=1750769506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hSxo0ZHyfJr1fQpftYFJehkxIFFbw7pyxo/Db9fNjFU=;
        b=wnlKfeZtbe4GnysTpN9cg4RWA954sJFoxuBl1SxiuX1fFl0RGGnbMNpm+AyXOGCUcN
         jPG5Ntc7LcW5zO+cVU/yR94jUShPkNS2xiKACQnQkUZnyD25Ug29zowprrQaxArn4Xyw
         PwBAgRwOt03aofDF+K4AzTbh0u2EiZ8Z9dReFEQLt/xekmWqxp9H7lX2YI4cbuixt1cl
         DPMEnmgLy1LoKPZ8FO/h6okkT+YgNdFie6YG1Cf5QezxcPIFMlV+Sq0zqw3I7QNfiPex
         RhTlEyHxo1O2zyFgc+QNpup++uy99EhLPDpc3u4uzfpyurt9MyPuMdTOzbysNCUKn1Bw
         L23w==
X-Gm-Message-State: AOJu0YypXjycfA3k/ak8o8grvPBf1ssYCpzM5VifQ9xbSQGywWh+cIl1
	zyQWRD7dMbaGiBkxFXCX8Css9eMybuyRDDWYyy8wgws1IlTIK2DMtHAG
X-Gm-Gg: ASbGncv7x447K0C4i8J8WxJgFB0NFBoEEaHPuSSqQq/rj5assrmif1jfvi+MHnP4UU+
	ynTMbt045EvM3MBvl124DoFYNARVfDeHpYnnYovuOGjvvjDT5bLzwIlFXJfktWBLtnA+/KR+xTy
	zBANITOsQ0lIV8ZBaiigew3dGjECyIPgu9vPb27usrfRtvfaq/BcTBh15H/WJCMHbiLeT8HWznj
	ZiGFEPfkHAGnjohouNNHFITnqwgLC8j38k/lrMC22IdKt177lrV/a+dMJLpAknzvhjCgby+x099
	kD9OOQvL52A0GRpo27S4EGNuzG0J9ZrF3cHLr1VWn4fGHCQe5lYd2ducP/0mJ0VmmE9Bg7CWDRd
	ebLD23U0YqxxKc5LgIw==
X-Google-Smtp-Source: AGHT+IFDyTmPgMZj/RHIVJLIOL48m69TjdL4fouKx5vArpbDJpyInEok0Mk+dEvaEXL3/xudr7VNHA==
X-Received: by 2002:a17:90a:dfc8:b0:311:f05b:86a5 with SMTP id 98e67ed59e1d1-313f19d2977mr23454941a91.0.1750164706232;
        Tue, 17 Jun 2025 05:51:46 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c68:884c:5800:7324:c411:408d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1806282sm10421980a91.0.2025.06.17.05.51.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 05:51:45 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	vireshk@kernel.org
Date: Tue, 17 Jun 2025 18:21:37 +0530
Message-ID: <20250617125137.24503-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-2.10 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.50:from];
	URIBL_BLOCKED(0.00)[mail-pj1-f50.google.com:rdns,mail-pj1-f50.google.com:helo];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,linuxfoundation.org,gmail.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 541D341093
X-Spamd-Bar: --
X-MailFrom: pranav.tyagi03@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HN7ONBDHGR5EGGIHZEUABN2ULQXJVUVN
X-Message-ID-Hash: HN7ONBDHGR5EGGIHZEUABN2ULQXJVUVN
X-Mailman-Approved-At: Tue, 17 Jun 2025 12:57:33 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev, Pranav Tyagi <pranav.tyagi03@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] greybus: firmware: use strscpy, fix tag size
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HN7ONBDHGR5EGGIHZEUABN2ULQXJVUVN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Increase the size of firmware_tag arrays in the following structs from
GB_FIRMWARE_U_TAG_MAX_SIZE to GB_FIRMWARE_U_TAG_MAX_SIZE + 1 to
accommodate null termination:
	- fw_mgmt_ioc_intf_load_and_validate
	- fw_mgmt_ioc_get_backend_version
	- fw_mgmt_ioc_backend_fw_update
	- fw_mgmt_ioc_get_intf_version

Replace strncpy() with strscpy() to ensure proper null termination as
firmware_tag is interpreted as a null-terminated string
and printed with %s.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
 drivers/staging/greybus/greybus_firmware.h           |  8 ++++----
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa9cc..3b4061f4b34a 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&intf_load.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy((char *)&backend_update.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE + 1);
 
 retry_fw_update:
 	backend_update.status = 0;
diff --git a/drivers/staging/greybus/greybus_firmware.h b/drivers/staging/greybus/greybus_firmware.h
index b6042a82ada4..ad5b2c8a6461 100644
--- a/drivers/staging/greybus/greybus_firmware.h
+++ b/drivers/staging/greybus/greybus_firmware.h
@@ -38,20 +38,20 @@
 
 /* IOCTL support */
 struct fw_mgmt_ioc_get_intf_version {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u16 major;
 	__u16 minor;
 } __packed;
 
 struct fw_mgmt_ioc_get_backend_version {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u16 major;
 	__u16 minor;
 	__u8 status;
 } __packed;
 
 struct fw_mgmt_ioc_intf_load_and_validate {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u8 load_method;
 	__u8 status;
 	__u16 major;
@@ -59,7 +59,7 @@ struct fw_mgmt_ioc_intf_load_and_validate {
 } __packed;
 
 struct fw_mgmt_ioc_backend_fw_update {
-	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE];
+	__u8 firmware_tag[GB_FIRMWARE_U_TAG_MAX_SIZE + 1];
 	__u8 status;
 } __packed;
 
-- 
2.49.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
