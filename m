Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFFCC6D6E0
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 09:32:28 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E1D2C3F961
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 08:32:27 +0000 (UTC)
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	by lists.linaro.org (Postfix) with ESMTPS id BF3F43F72C
	for <greybus-dev@lists.linaro.org>; Wed, 19 Nov 2025 04:30:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DsRl+OTx;
	spf=pass (lists.linaro.org: domain of dharanitharan725@gmail.com designates 209.85.210.178 as permitted sender) smtp.mailfrom=dharanitharan725@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7b80fed1505so5537312b3a.3
        for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 20:30:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763526636; x=1764131436; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SnW3lMeFBIz1EoKhdwPjI2R4Sj1FyOihlB1aeeAwH0=;
        b=DsRl+OTxOs6cBwsG3K7s6bNCOCzVjBlLGPMZyE0IPuOFB9EvgEpLTu2ngnRnYC7CrZ
         FlwOskiXI0ZYNLP5l/KUK6Gaq+hZmgXZ0RT3uTm02KEprU2oNuX33oY8xtWBdkZJJ7lz
         8ITOBOD2zePcYTlz0a8eeFgCkAI8Yv3OiQlhHBY1rYzkX18JV6E/mSZrad3jiRMzdGZQ
         DrmOHz+gmO/Q7vn4Yl4HUiEfFcOZHaYrdoZK/z5xL9w73oVhSnhthY0IxCUOpmsI7nmn
         LpuceyW7gOv2PcU9rZCSemek2CnHYpPKkRO+BugkuGPiYjKqya8ZhJs39821P0bS/r3e
         QCdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763526636; x=1764131436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SnW3lMeFBIz1EoKhdwPjI2R4Sj1FyOihlB1aeeAwH0=;
        b=nnQrVxfZK3q40IX4Yco08OmaufJ9Poc+JNzLhvzBDITZV8/0PXc2wJJCwbaaKzVNVJ
         C0SxFjUx3/thBiF+/rhNryavjVxZ2rvQ+x3v+8ac+l7DXq43IkmakjcQ73SIOBt/7uMi
         haGbklOyvjr5rWl2/x1sIPj6f/MWcxnV6Y8X0Q3NfRf2sa48DhS2ZmzopMZOxNcGNnwg
         AxlwaRmKZi6dUfSCqcvt8eBL0cVfCOmKPeyNUsJBTnasTwwIcoOB+kWn0mQ2JYwKiHdi
         el6w8/vNcoMcT5kzzGtQi9gi23X+mOkIsD1VhT4BzbIaBuEYDwNlhtRmf/7Hz6EnPvw8
         wTGQ==
X-Gm-Message-State: AOJu0YwUM7J0nkzlHhwzeaA/VIlERW50uRScKnW2+yIBAMqC5C/0/I9x
	lyLGEtsAdoElU6MEFktrmLVGwzVI4RvFpbRyyA7iVH6ug8v1Xgn9nnAl3Xj3pWWjXvU=
X-Gm-Gg: ASbGncseMAnp7VlBqepLwHA+8ZDRzkRflWB3e0ezG6e2x6V+c5u4yb7wQmV6VJ+XE55
	42baOECmTN8RxELuPtMJip10R/HJtKttuhHe907ST8fe5OQlPwbI2I2g3QIgMlOFBesPE3G1sRd
	wnf/8ywAQOUdSSu2/T1+5cBhBpFG5zRXiTbRU6M5bm+xlay3EP/Jm2F1/tAjs9ZYeUQyOIJbWUQ
	ShJSHUsc2UWjL+lt/Fwl60i82Ff3Z9FbNmfLfCCzWoUGSkiZA9JcuUWiC5rJ9Va0/egqs8j0AVm
	AuXjmWfaBpEOMiNSezCNaC9Y74rTfCpdgAiW9focKXq76pKJBldjhPKt/Q0D3rVYve+DKPx2sqj
	8Bi0gKtXVCDR/hVDUEXNZqI6h6Jdmm8/mmx9joRp/FlAhr12XKwIU2uh6hEpDq6IISOhdJkSIDe
	qXl6uCOuhm4aKCIgMLxvHSdI+DgzN4b2QFSA==
X-Google-Smtp-Source: AGHT+IELg26g/QGYLiXR6/6uiGU37RLrXWKh/9F8rYyFB5aeXR+99RI9ftYwq4H8smAaI52iN1/2TQ==
X-Received: by 2002:a05:6a20:1114:b0:35d:bb66:5ce3 with SMTP id adf61e73a8af0-35dbb66607emr11538314637.12.1763526635557;
        Tue, 18 Nov 2025 20:30:35 -0800 (PST)
Received: from localhost.localdomain ([157.50.12.49])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b924aede04sm18101264b3a.11.2025.11.18.20.30.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:30:35 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 19 Nov 2025 04:30:05 +0000
Message-ID: <20251119043005.7382-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.178:from];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	RCVD_COUNT_TWO(0.00)[2];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: BF3F43F72C
X-Spamd-Bar: --
X-MailFrom: dharanitharan725@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: E7YGV7NUJBND5KDDLRJOKCSMFVSGCYJA
X-Message-ID-Hash: E7YGV7NUJBND5KDDLRJOKCSMFVSGCYJA
X-Mailman-Approved-At: Wed, 19 Nov 2025 08:32:17 +0000
CC: Dharanitharan R <dharanitharan725@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/E7YGV7NUJBND5KDDLRJOKCSMFVSGCYJA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Replace all strncpy() calls with strlcpy() and fix indentation issues.

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>
---
Changes in v3:
 - Fix Signed-off-by spacing
 - Move changelog below '---'

Changes in v2:
 - Fixed indentation issues reported by Greg KH
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
+    		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
