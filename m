Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id CC52AC6D6DD
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 09:32:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id D7ADA3F915
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Nov 2025 08:32:23 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	by lists.linaro.org (Postfix) with ESMTPS id DF8B53F72C
	for <greybus-dev@lists.linaro.org>; Wed, 19 Nov 2025 04:28:05 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=GGP9RIQ4;
	spf=pass (lists.linaro.org: domain of dharanitharan725@gmail.com designates 209.85.216.54 as permitted sender) smtp.mailfrom=dharanitharan725@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3434700be69so8418996a91.1
        for <greybus-dev@lists.linaro.org>; Tue, 18 Nov 2025 20:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763526485; x=1764131285; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SnW3lMeFBIz1EoKhdwPjI2R4Sj1FyOihlB1aeeAwH0=;
        b=GGP9RIQ4MbXvhbfnTRXGpVo7UwobGZAnus6iY8QS3yhBb84e/GI1RDP9+p9vUxmpXK
         bhwesvU9jpCiy+KU9WF8/ffvZiWAo8Abj+jbKEmBfJYonSF6R+pWO7PzJU4D8ZExoSeR
         j9KnW5p5z+WKFtyN/mbon+ovccm1GXT1IX9x8ZWox7lBN75Vn+8pQFdDGcMuobvu146C
         dnPanpJopALnGfTjFnDBCDzDwrKfrrEr854izsi3A4HCy/GJ1H1K9ha9p1bD5irf9MAG
         Zu0nL8XAQhTRZ3uD/svea05HmssyozegKQV4Cb7L0K4AlOkmgZg6u++sxbOMH/CEmFpN
         de0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763526485; x=1764131285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SnW3lMeFBIz1EoKhdwPjI2R4Sj1FyOihlB1aeeAwH0=;
        b=mL9oIGbADjO9MIaUytMCLGNfjEgNx/AormleHJyUaLqxEZdjBjiORlUWKbSmbjhH1Z
         pNdXHCJ9JAcdV6X3tYg61IMgeEeTWcfI6f1LF1wNM6Bisz0Bagu2B3zJm2AjiS6yaCYf
         mrsbyI4niNTfO+VUszhNr0hkYCNe3+wtOGnRROp/sXyoBBGUnRQ0hGravaEG8tzylzde
         v8oW6PRc0Rw53PDWKj1m0+oEjgD1srdUbRebMJYsWD2yPS0FMT+GordO8gFZAVttfTTh
         0Gv8taCAeZh9jSvDduL6GVqgC0xUPfottGMI/oKM1mtXHe9AklVp+piDP56qeXvcFEYV
         JTPw==
X-Gm-Message-State: AOJu0YzIE4c872A9cA5BSDuw94g+ad0ORq8tB7KIOI8vulBpIoqXRiBc
	0pZsN1Zww3RKvf4nkU/scXZuRk6f+iiCnceROKv+9KEBkgr9FJlFlKmE0qLB2XFwKTg=
X-Gm-Gg: ASbGnctskXmsSIvEzwOYmxUH0tT8YZkiiSrtoXvXPpCGo8/fA5Jd6so/Y1PvY8oWlwD
	r34njSHGMuvWM2PdgdumeQoYYIPCgN98fuPSOY6LC7BgFBVf2LrDDlWWSbVcrlpUm/eYL2sfPdu
	WngSY4n7pNrebnxoi8BEkn8c7k2zp84/Y5x6nf0W8fauYrKf/FOuP2aYA2gUZsB+bM0X/zDvpCC
	SUcBrDJBTgtGecbzoX0sqcuPJdk892tGoNm7woQyfCH+TPK3FDQH0+oYuBNaNRYBLmU3/ALHz5k
	NyJEecmjEamGoP92ZUcSvwmIyMzhk/FVbRs+pyYYGEoWkbVBQIOOwhIF5ShRGx8zBGg6amFrWFC
	+5XpNl412PGfTQgMyhuQfmAjchk3jmn1hsbf3nzuRRnHb9Djo1yReZKT8HIWtYMlEDqd1BaCjSA
	OWGW0rFNEkfhcsIyoFvEaTKMjCdrA2TciJfTtf6zRnkH8Q
X-Google-Smtp-Source: AGHT+IFEwG8QepH96TZzC9SOhj1fdIlBxkreWdjgZlgUNZCYfltiiU1BYciUThK45Y7QGT95Ytck/g==
X-Received: by 2002:a17:903:2b10:b0:297:d777:a2d4 with SMTP id d9443c01a7336-2986a752800mr219135165ad.46.1763526484843;
        Tue, 18 Nov 2025 20:28:04 -0800 (PST)
Received: from localhost.localdomain ([157.50.12.49])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2c0577sm190146755ad.78.2025.11.18.20.28.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 20:28:04 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Wed, 19 Nov 2025 04:27:10 +0000
Message-ID: <20251119042711.5350-1-dharanitharan725@gmail.com>
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
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.54:from];
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
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: DF8B53F72C
X-Spamd-Bar: --
X-MailFrom: dharanitharan725@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: BRHNQHU5B67TG7PI7ZDQJLS5WHQ7DLGL
X-Message-ID-Hash: BRHNQHU5B67TG7PI7ZDQJLS5WHQ7DLGL
X-Mailman-Approved-At: Wed, 19 Nov 2025 08:32:17 +0000
CC: Dharanitharan R <dharanitharan725@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: replace strncpy() with strlcpy() in firmware test tool
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BRHNQHU5B67TG7PI7ZDQJLS5WHQ7DLGL/>
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
+    	GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
