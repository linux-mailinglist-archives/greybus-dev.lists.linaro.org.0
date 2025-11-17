Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E91C696B7
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 13:38:40 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B86853F859
	for <lists+greybus-dev@lfdr.de>; Tue, 18 Nov 2025 12:38:38 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	by lists.linaro.org (Postfix) with ESMTPS id BC1AA3F80A
	for <greybus-dev@lists.linaro.org>; Mon, 17 Nov 2025 06:50:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DHwwraWC;
	spf=pass (lists.linaro.org: domain of dharanitharan725@gmail.com designates 209.85.210.169 as permitted sender) smtp.mailfrom=dharanitharan725@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7bc248dc16aso1723290b3a.0
        for <greybus-dev@lists.linaro.org>; Sun, 16 Nov 2025 22:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763362215; x=1763967015; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rcsk5ZeQ7H8x3wIhBbV5hj1Gvifm17yYNO4t5tbYLA0=;
        b=DHwwraWC7Rdxxs7HAL2+r5p8V0GdnoR0FX2Wi5bx7/zkW+8/sqfw3OPIAPBxJR8etu
         aGzNhF2+YDaZAe8EFPJ2HGKGU8r1BHN8qKVUpq2Waxo0YepXn7WqnsgWCoQYq9n/FkOj
         TW+O0y1FTR3SIjZq+pcD1d7hePfN4OKS5owCk/4asSUOl8dL/lR8I4x2PBx2KwsBvVSG
         Ksi2mSQDLNe3dJyYRNT+xntMX9FGkm1jlhDrT/GTbwZONXGn6Lu5aP5rP41SELqIey1u
         r57MGcH+UhvfOLJi+b5PnmZvD4brJXGazqMFT6pXThoA1D7T6lUiPhgc65hAOzf8zelu
         zjpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763362215; x=1763967015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rcsk5ZeQ7H8x3wIhBbV5hj1Gvifm17yYNO4t5tbYLA0=;
        b=PFjD8Y2MyUuZPWlBV4CIaxXO+Tx9m4Yb0sc4c2Rd2qKAX1HX8ikOpXw//bYmMFpnjO
         p7D1U4I7qVwHrAgACe5ORraru3nrDz0Aa/mX76o2dH84lmXEX8hkWBviRP9SuukFse/8
         XeBludVLbSC3RqsOD1zjZ6Xm5CgaUQ34FTxhyiC8QjH1Gyh2vC7TIf2n1hkAdE4Di5Yd
         DP45QLwqzueYhocQ/r0NNU2IEZEc1NO2onIemeO0Ad6xy1G0P7WnNxxFZwCm/oI9yI0a
         NgcmPctH7cEuyEzDdWHUaKziHGfoRJZs+vtHYtHXPhx3lUhPP2mOtwAB1g7eAYIoIZWT
         WG7w==
X-Gm-Message-State: AOJu0YzUvoyoyz/znDIhUOIePotlC+q3CA4i/wEJT6qifNeZoH02ZKwb
	BkuRtVbjsm3nkqSrg5IhpEbn9uPxUJgX7oSNrBlNgb7wY7LjRJ1fz44t
X-Gm-Gg: ASbGnctb4wVlBgIL0V87c4Ez2UfpiaLpU1TtJOYnuXGCNx1C5TyHc+O5yC5arG+GMZJ
	VWWPrKpltGLIWJgdH6c97zNXzvTbuXuHytyZQGbF2OyQODzBumYe0dy6XCRu5h+5AeAAGmD8c2J
	PlyjYTpYauScKJexpetrASus/324A0Sh20UU+PFojPIE4WBJ1HeASvu7lwNDugHUCJPVvy+vbx+
	49Ej6eHxfKTSe7P2JivEPhX67KCpmvKb2+h2OQnbuHMPMYsMfFoYAQl5nu20T0s7KwZWwEIRhaJ
	v5BVe/LcD5dAik4aBlyxvQ72rAWolL4bGXS+A/N/qsSVm+XQMc/aBFecZ7N5tnDoaVK9SooKGyp
	0RQ1TaBB8e1LIMacx5D9bZdqiHE1ci+DDGgHlIfCgLqlFQA/p7ZruCNXUiEuqAql7ucqY6XxUK1
	7JqTCI8+z1otICVuxctssR7y0PFkbXJSTAFC9x
X-Google-Smtp-Source: AGHT+IGxi4zd0jo6/MZiPeQPTGUHJqofagpVYfARMww4ZdH9XcQJD/Xht9LykrDS5kDPLJMWZnZgeA==
X-Received: by 2002:a05:6a21:33a9:b0:35f:30ff:89f6 with SMTP id adf61e73a8af0-35f30ff918dmr3425612637.57.1763362214656;
        Sun, 16 Nov 2025 22:50:14 -0800 (PST)
Received: from LAPTOP-6H9JJHSF.mshome.net ([61.1.189.195])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36e8a58c4sm11013227a12.9.2025.11.16.22.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Nov 2025 22:50:14 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Mon, 17 Nov 2025 06:50:03 +0000
Message-ID: <20251117065003.7453-1-dharanitharan725@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.169:from];
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
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,gmail.com];
	RCPT_COUNT_FIVE(0.00)[6];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BC1AA3F80A
X-Spamd-Bar: --
X-MailFrom: dharanitharan725@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 6ZXBV3KMZUKHRY3GQUKQVNSHR5MUF5B7
X-Message-ID-Hash: 6ZXBV3KMZUKHRY3GQUKQVNSHR5MUF5B7
X-Mailman-Approved-At: Tue, 18 Nov 2025 12:38:33 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, Dharanitharan R <dharanitharan725@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/6ZXBV3KMZUKHRY3GQUKQVNSHR5MUF5B7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The sample userspace firmware-management tool uses strncpy() to copy
firmware tags. strncpy() does not guarantee null-termination and can
leave buffers unterminated. For userspace code, strlcpy() is the
recommended safe alternative.

Replace all strncpy() calls with strlcpy().

Signed-off-by: Dharanitharan <dharanitharan725@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c      | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..224eb8f4e39c 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,8 +63,9 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+    strlcpy(intf_load.firmware_tag, firmware_tag,
+       GB_FIRMWARE_U_TAG_MAX_SIZE);
+
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -101,8 +102,9 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+    strlcpy(backend_fw_info.firmware_tag, firmware_tag,
+       GB_FIRMWARE_U_TAG_MAX_SIZE);
+
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -129,8 +131,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+    strlcpy(backend_update.firmware_tag, firmware_tag,
+       GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
