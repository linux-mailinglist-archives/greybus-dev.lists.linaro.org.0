Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id A868EABF2D7
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 13:28:59 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id CAD2C44408
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:28:58 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	by lists.linaro.org (Postfix) with ESMTPS id 8BC1D40C9D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 09:30:40 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=HqktXgtO;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.210.180 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7398d65476eso5125586b3a.1
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 02:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747819840; x=1748424640; darn=lists.linaro.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JVjUabk5NQmhfEI5CaBTj3E009mNGNPOZl2dDH0wA5k=;
        b=HqktXgtOjUweQTcjRjnCLhv/e2KyJdr7RROe27aTWLRyt/Z+J8LgPGgSPwsxVz+Rei
         V4fVPW6UMjuCpYmj/VSI8PXEK5+HhVOm5TLC7RMiwad1VrB/J4jQM3rIy/bRX7FyIZPS
         euV6Mc+oASCteOsuszLW+RXYsqbToCAL/y6DuWMeyBWkti/e4wlkhl4DDzFlqaEuN0JL
         OC0wEZJiTEgoqltlJZaNyYUjGbjR4HjhD/TuWcKGQPAAMqMSRI97Im5f/NoDuffkEvBU
         hPo9xRkwpHgAQJVjdkzgVj+vwK+FbF+z1JGG7TmNhpJzZ0GwD00pA83eyg7GpFIXyvjL
         DbJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747819840; x=1748424640;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JVjUabk5NQmhfEI5CaBTj3E009mNGNPOZl2dDH0wA5k=;
        b=CCwkNpWxG2tWgtp9/lXuel5sbdUYY8px2H5R2z/Ui9AgJk7BNwqn0ySSO5W2V55AJg
         QRL+tg2hGJjJH4r+TZ0ovQd3GH82TzqNPhgHyv3SMKTBtiK25GtFbvTELrheCynNoPQe
         Q1klfX0kFfKMhi1Rd5N8TZO/1UhNQpzK4QGQ0todK8aXzHbTUUrSqhlrDX2gfjAM830O
         loDaP1Cp81HuAAZFbkf5TMYa5RRM4hRVe5UWlJklaPgsCUTBumZYcVKN5QAOwAeuhfdq
         QNrIs+ODW7BUW3GF5Gixs7zqDv1LNuFM1SLMpUoAcbpR36apfv5II8X3l0JjTGvDU8af
         0LVg==
X-Gm-Message-State: AOJu0Yza6RHvMc+b83Iy+YHkno5t2WMzb359L8Vpwb7GE0hZSTWqdV8P
	qS2/pSLNiZ+95BUZqxzbXvk58tlq+Y/i/DnsSAbebnk2us4RM6kAdeij
X-Gm-Gg: ASbGnctEPDpmWcYIzPZzlyktJ2GCX+J9D9uHqAmo2TrU+8hSkd+eKwboOf1n7mKgQ6E
	xUXM9D3T4hJKYqGRBWCtcYTJbeckxWdDFl0xOvOnf6o+rAkM7UnbiD7/+1abPzWxxOqNmKj7gbd
	fd53jxEBTIGnxEuSR+2nCytiiHmysUR8CDa5IzL1iE1ybIyTU/lBitQPYSL8YyY58HkI4boyhCB
	keBNxQFB5Ld7coHhRLYJUgEU+WcfIdpiTUuEWsg00xOXhvF2yuHb41c6f/dSilqTCJxIphE1Dc3
	JycGAW3PpHbdWVfHlBlTwhuJ52eEr4Cdrfa/4fJzpD8Kb0wrLfwI3ADx41PqJz0HwXDHQg==
X-Google-Smtp-Source: AGHT+IHUyx+vlWYq4hohag+qL5ddwEkbL8Ga94LR9t3ebzdNx3dQ1c7jzeXIFn1QLgkVEwlx47k1mw==
X-Received: by 2002:a05:6a00:ac1:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-742a99fab76mr25752923b3a.2.1747819839565;
        Wed, 21 May 2025 02:30:39 -0700 (PDT)
Received: from brak3r-Ubuntu ([2401:4900:91d2:7413:9e7e:c313:d5f8:b22b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9877030sm9516405b3a.148.2025.05.21.02.30.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 02:30:39 -0700 (PDT)
Date: Wed, 21 May 2025 15:00:35 +0530
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
To: johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org
Message-ID: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-3.60 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.180:from];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 8BC1D40C9D
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: OR3BNBNBEAKMRTPH4SDOKI7HFBJ7HCI7
X-Message-ID-Hash: OR3BNBNBEAKMRTPH4SDOKI7HFBJ7HCI7
X-Mailman-Approved-At: Wed, 21 May 2025 11:28:42 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH V1] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/OR3BNBNBEAKMRTPH4SDOKI7HFBJ7HCI7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

----------------------------------------------------------
This is the new Patch for the earlier Patch hence made V1. 

[Note: there will be no significant changes.]
----------------------------------------------------------

Changes: 

To ensuring that the firmware tag is properly null-terminated. When copying firmware tag strings to prevent buffer overflows and ensure data integrity.


Changes has been made in 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
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
