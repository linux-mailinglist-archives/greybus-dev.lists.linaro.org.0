Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 1495AABF2D9
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 13:29:08 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2AD1C44406
	for <lists+greybus-dev@lfdr.de>; Wed, 21 May 2025 11:29:07 +0000 (UTC)
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	by lists.linaro.org (Postfix) with ESMTPS id 2BE1E3F68D
	for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 10:42:50 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=hAwtxb7J;
	spf=pass (lists.linaro.org: domain of braker.noob.kernel@gmail.com designates 209.85.128.170 as permitted sender) smtp.mailfrom=braker.noob.kernel@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-70dfa8424c7so2730357b3.2
        for <greybus-dev@lists.linaro.org>; Wed, 21 May 2025 03:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747824170; x=1748428970; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GMDMg0oZJHBeEHyo9DXsYD1Zb05NAR0JOCkGcjty1VE=;
        b=hAwtxb7J+LqEtBXPF6TW2cvgBkra5CW2bhVdYql5UjdHGDMPaMbCg9Jx/6PNgpSGmJ
         dAufdT7KS66CHE4BayHKEygLCBWzn1OLMG/Vu9wa0/5sSpQFNof7SfLYmVxTWqUwa4IQ
         /qcJ3b1hg3bDWOKgjtJs/4ow3+7JF+YjVCI3puGaz3Sa3SFRWoLyAepOFmaBe5ndo2cR
         43bAU7aN9M0ltVl2YUHUjRWxpemjVK0f1SNF+cfJt80BaCFtNw4INXd33A79bhmB0x/4
         K4hu5qhKlATUsk1E/TF3CD9Z+iEWu9qJ/zlJ0ZjcsEh5yF0iGyx5c1YXZrwB+d1Xn5dU
         k0XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747824170; x=1748428970;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GMDMg0oZJHBeEHyo9DXsYD1Zb05NAR0JOCkGcjty1VE=;
        b=Z+DQqHTK+zh+x0lE/2UOdlRisRe0LJVjsj31PFbiq/GtUPZ7BWqOVPuCP5lmOK9D5/
         sTe9VPRHBKeA0LunH+D+J3O6/qynV48uOQB/Xd+gE782SRLHVmwtMbbyjW1VseA6QkxC
         3EIpTT7ltYwA/mBGmQY388W9XdodDhXf85pDaOMspkrO6Gk7LlLU7hQccJcHmK5dI0ZA
         H2eE5HVWKowrb5dJ373Qcqjl+rDKFpjyc/Q5yUEAibqdBE3qlUii8iniYJIMDH8beMdZ
         UC47wrqPRdknVTVeUfwdHwR81PudQd6+GReuT1R3mpPkS29s2czuef8w/J50lGOrRPWP
         YWzw==
X-Gm-Message-State: AOJu0Yxhi6Bk+kLEfhglczk1Eo9PLI6do+sU2zoOSWEC7m/XCtKbrOJQ
	/ULDzqhsDeaF3OjdKFGjlIYyyWrmzCxMPkuy2/LgQ1+epqBt7WGq24R2aAcJbi8di/l0mGl+CGr
	loPy9Jx9OlVfa0rOANNB3D3RzCtROxkY=
X-Gm-Gg: ASbGncubioDLOz8PwIyvO1KNY0edyzRb2TMWBjp64C5Ctc/YBMBX9edtUwa/NsbeI96
	zHR5zCkhxhjSGaQAH28IJCq5x3ld7PI3IA4g7EvHcc/xjZehJclpIseE8TdccaJ6La3BdWVXzBL
	VsmrYHLkGm1JdJ7+wGRyoAfaXe0OcLkdDWxstjgcmeJwgF6GWF72J7OUfNCxwlOHo3iGA=
X-Google-Smtp-Source: AGHT+IGCEa6kyM+UnftuFUzah/9Z4wSrRBAisibwNFh6VGxUeQAiBYOU1NwOn7d/SKAB67K4LUagn1THRgns4aXCGHE=
X-Received: by 2002:a05:690c:4b8a:b0:703:b278:db3b with SMTP id
 00721157ae682-70cab0b8d50mr279505107b3.30.1747824169667; Wed, 21 May 2025
 03:42:49 -0700 (PDT)
MIME-Version: 1.0
References: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
In-Reply-To: <aC2dO1QKTVMOJQ8K@brak3r-Ubuntu>
From: Rujra Bhatt <braker.noob.kernel@gmail.com>
Date: Wed, 21 May 2025 16:12:38 +0530
X-Gm-Features: AX0GCFupvQaAcKzkZjV_NSmznrI_u7c1AU4u8-h7t66D4WJTaKE4h_CycWF4fN8
Message-ID: <CAG+54DYR0CyAKWcgU=mV9ooeyGVrouxrKOv7kzCKTYaf3+9Yyw@mail.gmail.com>
To: Johan Hovold <johan@kernel.org>, elder@kernel.org,
	Greg KH <gregkh@linuxfoundation.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Spamd-Result: default: False [-4.00 / 15.00];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	ARC_NA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.170:from];
	URIBL_BLOCKED(0.00)[mail.gmail.com:mid];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Queue-Id: 2BE1E3F68D
X-Spamd-Bar: ---
X-MailFrom: braker.noob.kernel@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2JTYCFQFZHLUMRGFJBDIMXSM5ZEUK7YU
X-Message-ID-Hash: 2JTYCFQFZHLUMRGFJBDIMXSM5ZEUK7YU
X-Mailman-Approved-At: Wed, 21 May 2025 11:28:43 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Fwd: [PATCH V1] staging : greybus : Documentation : firmware : Replace deprecated strncpy() with strscpy()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2JTYCFQFZHLUMRGFJBDIMXSM5ZEUK7YU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

This is the new Patch for the earlier Patch hence made V1.

[Note: there will be no significant changes.]

Changes:

To ensure that the firmware tag is properly null-terminated. When
copying firmware tag strings to prevent buffer overflows and ensure
data integrity.


Changes has been made in 3 positions:
1: update firmware tag
2: backend update firmware tag
3: backend update firmware tag with unipro

Signed-off-by: Rujra Bhatt <braker.noob.kernel@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/firmware.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/firmware.c
b/drivers/staging/greybus/Documentation/firmware/firmware.c
index 765d69faa..f37904b91 100644
--- a/drivers/staging/greybus/Documentation/firmware/firmware.c
+++ b/drivers/staging/greybus/Documentation/firmware/firmware.c
@@ -63,7 +63,7 @@ static int update_intf_firmware(int fd)
        intf_load.major = 0;
        intf_load.minor = 0;

-       strncpy((char *)&intf_load.firmware_tag, firmware_tag,
+       strscpy((char *)&intf_load.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

        ret = ioctl(fd, FW_MGMT_IOC_INTF_LOAD_AND_VALIDATE, &intf_load);
@@ -101,7 +101,7 @@ static int update_backend_firmware(int fd)
        /* Get Backend Firmware Version */
        printf("Getting Backend Firmware Version\n");

-       strncpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_fw_info.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_version:
@@ -129,7 +129,7 @@ static int update_backend_firmware(int fd)
        /* Try Backend Firmware Update over Unipro */
        printf("Updating Backend Firmware\n");

-       strncpy((char *)&backend_update.firmware_tag, firmware_tag,
+       strscpy((char *)&backend_update.firmware_tag, firmware_tag,
                GB_FIRMWARE_U_TAG_MAX_SIZE);

 retry_fw_update:
--
2.43.0




Addressed the "The canonical patch format" .

thank you,
regards,
Rujra Bhatt
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
