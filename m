Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DEEBDA04B
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 16:33:42 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 029E045F49
	for <lists+greybus-dev@lfdr.de>; Tue, 14 Oct 2025 14:33:41 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	by lists.linaro.org (Postfix) with ESMTPS id 153524447C
	for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 13:42:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=WQZcHCsL;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of vivek.balachandhar@gmail.com designates 209.85.222.180 as permitted sender) smtp.mailfrom=vivek.balachandhar@gmail.com
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-85a4ceb4c3dso664256385a.3
        for <greybus-dev@lists.linaro.org>; Tue, 14 Oct 2025 06:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760449352; x=1761054152; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j01C3ZF4H0h3fr2NXxsvLtO/yyM1N0PB3fovVaXYGQE=;
        b=WQZcHCsL2yI7I+wTXn7k1lRy9PTpFzZtbOUYs/4litJtcwYRbSbXQ1WODuov5VckXk
         Vv8k58Fm6Lw+6IGToVnGyz9PpsZeD3tZC0+CD7C79vjIO9yTx5d8tvBSdN7eTLXzzWWf
         xNwhsLmFm1jJknhA1jNdIq1HDiDf0pRGflJFVN2y+NSxDRvfmCbOdH2hqbZnbJ6jb9Nc
         lhyeR5/hqeddFWzVjmYpDSuDmLNfg9C0p+3YDKONQ2NH0TUQ63GJueiWuw3x7kLomA2x
         deBJsrLat0QOhx1axcy0bI48USNZsq06ZMiAD3tEC8HzhRnlLXDuuXne+l+oOGeLc70C
         Beww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760449352; x=1761054152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j01C3ZF4H0h3fr2NXxsvLtO/yyM1N0PB3fovVaXYGQE=;
        b=lkaoOGzHu0EfSKAZvlyAn0Lh3T/AJQbd2UXoUd6o5z42saNwzKNq19WjQDaFMztU/V
         M18Sb1rHE2S8KrekTQfwFgIgpFVfhoxVHxDy6CQlqEViMbVp8jzL8f5vryHCT4IxyYQV
         tF70Tj2rBxzpZ/efkrP3/+4q3qRXVRkBOarm/pN9/fcyhUPSV3YDE1gfeobkRsL6nnVI
         mPl8CuYDWvPy5glOQaBQ9gzrDW5BJMDyCQf/RaoAMLwr2zd7M0Rk2KUNszQbRnP4dA3C
         t73IGqKJJ9+TCMdTod6DYEbwceHwZ1dNf4JOWQgfoaXOiM3nCINX7rLJqPNbl6ZwFTI+
         SLnw==
X-Forwarded-Encrypted: i=1; AJvYcCV3sweTpM4XTpDRwak+q08kOlGxCuNMSvXPG9qHdbvZTuhz5Tt54XPUUz6yHs5kDL1vHH3OoTiXZYpDZg==@lists.linaro.org
X-Gm-Message-State: AOJu0YwKtCuuyTBXm60vLwab93J5eDt64k2dnIuo8kHspE2pCft9dC3m
	GQP8YCoia35Ifa/WDmoGmmFc8CmuLSd5P/DT9dK2J26LEVB/3bMQrRSI
X-Gm-Gg: ASbGncv9MYwLVNqXylKBF3vc2Ri+gz2P/F89uSiURKEf0qCNDj8ECUwtNgSb+NORWgO
	KTl9CohFITKdWrnc3VipO0xII0i92s/50GhqE7OVTZqAXvmTltkv9Sw0liihLfn+Pf1LtBRSIuv
	Xc0pdtDicUZPP2Qiv9YFIMMTU/1Rw60b2hk2rBdDfEFee0meCaLc79S6iQV0YpSdZUWLjaSPW/K
	nUOUrgXnAddtbVD4quagpuc0XwRgEEKzl23gJJZ5RTejzVgTjdY1on+42xE6MW2n3a8MuHd9qov
	nrTuSF02teSr7at6RjYLn+7xV+9StVsn6XyJiB7XhOmzAg2sOYrGZWhOkCvPPNkV5GhE7eR3qMu
	fKaLvAN5p7B+QT5SheH8PscqPSpt3bDgfTqs2viyZe3a93b07h4lm/mx32ZoSLqzmV5p1JTgtVX
	VO3uJfZexo
X-Google-Smtp-Source: AGHT+IEwlgpPG3uvjmGvQT2i4/p6+LKOyxSTea/Iia58pq2hmmM8J3zLPgs3I36OerMcczFeKPK/uw==
X-Received: by 2002:a05:620a:c4d:b0:84b:97c2:4f27 with SMTP id af79cd13be357-883529b5d5cmr3367221385a.4.1760449352485;
        Tue, 14 Oct 2025 06:42:32 -0700 (PDT)
Received: from kernel-internship-machine.. ([143.110.209.46])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-884a2272670sm1214768585a.42.2025.10.14.06.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:42:31 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Date: Tue, 14 Oct 2025 13:41:48 +0000
Message-Id: <20251014134148.2597178-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Rspamd-Queue-Id: 153524447C
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.00 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ubuntu.com,abhy.me,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	URIBL_BLOCKED(0.00)[mail-qk1-f180.google.com:rdns,mail-qk1-f180.google.com:helo];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DNSWL_BLOCKED(0.00)[209.85.222.180:from,143.110.209.46:received];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.222.180:from];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: vivek.balachandhar@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: O5T5VSSE2CZ6MWRS3KVPHNI7N36W2SCN
X-Message-ID-Hash: O5T5VSSE2CZ6MWRS3KVPHNI7N36W2SCN
X-Mailman-Approved-At: Tue, 14 Oct 2025 14:33:37 +0000
CC: johan@kernel.org, elder@kernel.org, schopin@ubuntu.com, me@abhy.me, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Vivek BalachandharTN <vivek.balachandhar@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: documentation: replace strncpy() with strscpy_pad()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/O5T5VSSE2CZ6MWRS3KVPHNI7N36W2SCN/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

strncpy() does not guarantee NUL-termination and is deprecated for
NUL-terminated strings. Replace it with strscpy_pad(), which guarantees
NUL-termination and zero-pads the remaining bytes, matching the fixed-size
firmware tag semantics.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 .../greybus/Documentation/firmware/firmware.c        | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 3b35ef6d4adb..deac8584841b 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,8 +63,8 @@ static int update_intf_firmware(int fd)
 	intf_load.major = 0;
 	intf_load.minor = 0;
 
-	strncpy((char *)&intf_load.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy_pad((char *)&intf_load.firmware_tag, firmware_tag,
+		    GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 	ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
 	if (ret < 0) {
@@ -101,8 +101,8 @@ static int update_backend_firmware(int fd)
 	/* Get Backend Firmware Version */
 	printf("Getting Backend Firmware Version\n");
 
-	strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy_pad((char *)&backend_fw_info.firmware_tag, firmware_tag,
+		    GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_version:
 	ret = ioctl(fd, FW_MGMT_IOC_GET_BACKEND_FW, &backend_fw_info);
@@ -129,8 +129,8 @@ static int update_backend_firmware(int fd)
 	/* Try Backend Firmware Update over Unipro */
 	printf("Updating Backend Firmware\n");
 
-	strncpy((char *)&backend_update.firmware_tag, firmware_tag,
-		GB_FIRMWARE_U_TAG_MAX_SIZE);
+	strscpy_pad((char *)&backend_update.firmware_tag, firmware_tag,
+		    GB_FIRMWARE_U_TAG_MAX_SIZE);
 
 retry_fw_update:
 	backend_update.status = 0;
-- 
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
