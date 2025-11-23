Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EBAC7E19D
	for <lists+greybus-dev@lfdr.de>; Sun, 23 Nov 2025 15:14:26 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 9C1873F8E9
	for <lists+greybus-dev@lfdr.de>; Sun, 23 Nov 2025 14:14:25 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	by lists.linaro.org (Postfix) with ESMTPS id 945213F807
	for <greybus-dev@lists.linaro.org>; Sun, 23 Nov 2025 05:46:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=XG5SNLBO;
	spf=pass (lists.linaro.org: domain of dharanitharan725@gmail.com designates 209.85.214.181 as permitted sender) smtp.mailfrom=dharanitharan725@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-298144fb9bcso35979725ad.0
        for <greybus-dev@lists.linaro.org>; Sat, 22 Nov 2025 21:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763876774; x=1764481574; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NV8miuACPpfiwynsZFrma43BnYgwKAlEYgRcS6P4IuM=;
        b=XG5SNLBOCM/Nx58L18VZIEFUiBYfvRI7mMprzgq3NCTG1wjnsQwUii3MiFklZLbBFt
         bsB82IoG1/Xwa7ZDlBZh7VlS5LyQ2M18eoCXB+t6bpslTFoL0RSSqK4+Hjp1kgiNxkym
         pJMiX2/yeC7hqcPMeUFBOCY12zTKSvhGqMcxe1stjoYczMSKi/Lr03tDpWGVaC15uwrs
         S7aKsIOZ0MnWs4FPLxaev5WyJnZMWEjE3dJ9kUMJIiV0Md/b2S6UyRJtoqyXEmy8OBF9
         6YpJDDFquCRpPrUsptRE3RY+ZftYEao6tvJmwaeqCUcm8ckVWUXgBfa1HZTyJFWbkTZW
         nQYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763876774; x=1764481574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NV8miuACPpfiwynsZFrma43BnYgwKAlEYgRcS6P4IuM=;
        b=E1r7lQAQ/+Yu909Lp2bA1YYnnPbTB7gPn8RVqAiHUvqIouFZf2woIcVjeGQ7Bo5ARv
         SwJkrVFuZbAEzSunxW73LH/sHUkj60tF4iohepFo6yO5O7m4fkT+V09p9QR9qgyxkjji
         OD+rcZL0zsUkltghcSG951sGFF3bHTLz41KjSnUN9NAgfetcpaeqSFcix66ZfrJjqJ6W
         pZSyPTTE1ImddTeVGQ6vTp9cYiuEGHXYqil9A4UhzICDMSlCDsvxe4l4oFKZoNGTLBLl
         GyGDB+t2WlKdis3SLGc3ICUOP/CUaAcjwp0mDAz+2BAFS5TV9yjrBr9eGllhQVpgsYt3
         1fiA==
X-Gm-Message-State: AOJu0YzIHfFcSHpVqtHqxhshp/p3d3fZ81+JVc5+ezKzPggfyUmAhT8U
	2Mk2P8uIus+R9fELSJER2FUXexdLYnDbxCHG0QLcQO7kNzhvp6gIp5bGZeX2L1vP
X-Gm-Gg: ASbGncsnHhH4wTYGkEr4mQwpTTJCwsrvpk8+99SOdUZEb9jLHSJk+kPvK93U/yhKPfI
	EGgo0h5Mmk7WPOvCEKHmNlFaAUrdZ2kA4f82XZPgAUyIj/VWaLUHsOrfmmLlGU7xcwSQsG7OFKM
	8B7zAnb6rQJ51NoM68ugqRFFH9cE7RuAISymHAsd8T6QirLYo3f9wcftHKphc6oWTyfimnb/F5D
	jmvv1Ov2xhRb+qePNFZGFvUB8Igf7LLmbZ5PAQLs5GsRq9LZLM/XzbUmOpBvvXamok0KWPVpi6w
	v9KeF5NLjjJpK6SyDIWyCU8AE10GkaYa5O5kAVxYc/BNR96GWPDGsCV8wCizW9oOkztybmJgQGC
	BPEd0gu6zjjvsOpVGpTPtLl3SgnNl3oLYH6XpzDZhIoWPQUpfqcVjV62M8oNLs+tQTowuta3aO3
	FvpHQcE5mMRQ7LDyrR4hgy+tJ2/JIlxUTVSA==
X-Google-Smtp-Source: AGHT+IF7ZuFitbyWpKOUOsci+zPWGkNqgqcG9vrw34NTlQzwZqY9YjIV06jtzEjqFE3GTXNEULx+2g==
X-Received: by 2002:a17:903:440c:b0:297:c058:b69d with SMTP id d9443c01a7336-29b6bf3862bmr95443755ad.34.1763876774435;
        Sat, 22 Nov 2025 21:46:14 -0800 (PST)
Received: from localhost.localdomain ([157.51.74.38])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13965csm99438445ad.30.2025.11.22.21.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Nov 2025 21:46:14 -0800 (PST)
From: Dharanitharan R <dharanitharan725@gmail.com>
To: greybus-dev@lists.linaro.org
Date: Sun, 23 Nov 2025 05:45:27 +0000
Message-ID: <20251123054527.10163-1-dharanitharan725@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.181:from];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	DWL_DNSWL_NONE(0.00)[gmail.com:dkim];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.214.181:from];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 945213F807
X-Spamd-Bar: --
X-MailFrom: dharanitharan725@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: KJO6UPEXE24C4C73BBUL3PI7VBUFBN2X
X-Message-ID-Hash: KJO6UPEXE24C4C73BBUL3PI7VBUFBN2X
X-Mailman-Approved-At: Sun, 23 Nov 2025 14:14:20 +0000
CC: dharanitharan725@gmail.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] Replace all strncpy() calls with strscpy() and fix indentation issues.
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/KJO6UPEXE24C4C73BBUL3PI7VBUFBN2X/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The firmware_tag string comes from userspace and may not be NUL
terminated. strlcpy() performs strlen() on the source buffer, which can
read past the end and potentially cause an Oops. strscpy() avoids this
and guarantees NUL termination without overflowing the destination.

Signed-off-by: Dharanitharan R <dharanitharan725@gmail.com>

---

Changes in v4:
 - Replace strlcpy() with strscpy() based on maintainer feedback
 - Added explanation about user-controlled buffers

Changes in v3:
 - Fix Signed-off-by spacing
 - Move changelog below '---'

Changes in v2:
 - Fixed indentation issues reported by Greg KH
---
 .../greybus/Documentation/firmware/firmware.c   | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 6f6410878ee6..84b9cf45fc8e 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,10 +63,11 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strlcpy(intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	/* firmware_tag comes from userspace and may not be NUL terminated.
+	 * strscpy() avoids strlen() on src and guarantees NUL termination.
+	 */
+	strscpy(intf_load.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -103,8 +104,8 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strlcpy(backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy(backend_fw_info.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 
 retry_fw_version:
@@ -132,8 +133,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strlcpy(backend_update.firmware_tag, firmware_tag,
-    		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy(backend_update.firmware_tag, firmware_tag,
+		GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
