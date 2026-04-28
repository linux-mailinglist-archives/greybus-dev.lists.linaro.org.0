Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KC3GOQi78Wl1kAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:02:16 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id ECBB8490E50
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:02:14 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B4FDA404A5
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 08:02:12 +0000 (UTC)
Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	by lists.linaro.org (Postfix) with ESMTPS id 64C733F78A
	for <greybus-dev@lists.linaro.org>; Tue, 28 Apr 2026 00:24:55 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=BSgavGEI;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of sonionwhat@gmail.com designates 209.85.128.194 as permitted sender) smtp.mailfrom=sonionwhat@gmail.com
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-7b23713eac9so101889737b3.2
        for <greybus-dev@lists.linaro.org>; Mon, 27 Apr 2026 17:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777335895; x=1777940695; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z2jdUVTqGyX+jdjyIaM/RF3bFaCvwm69KDjVlb7MZEM=;
        b=BSgavGEICeLJ2vHtiji7BowtrW3Xx++PyGDQOFpsSmM3BrXz5OevGHrUVFO02I40JA
         dnfsZXLUZdn619vetL2SXLKPolrIhsaNnqtuxEJCPjIWCcj6HBHg50m9Bq3ezk22CM41
         zos8Vpga8a1v40MY15QvyAePdJPADScTEK8DSzKBIRXrvq1CwIq65tmkcUJJcYdkRWWY
         RKJPGe2cQX/nIv+EN5WRNZdr6/ODFg8054qBil+tEo3FrpoBgU7EKi53FBP3gBU90y70
         6Y/OVRJ4q9K52z6sR1sp24xzem6osF/NTCi75XmNRdQO5F2fD5S1Ssbi71Nm4HDvYpn6
         GX0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777335895; x=1777940695;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z2jdUVTqGyX+jdjyIaM/RF3bFaCvwm69KDjVlb7MZEM=;
        b=O1eitKsuH5flSqPWPb3NSSDSemJj/S7Vf+d38JJ3kv/GptOo1rL9FKYaG3Rk3px7Ry
         LQrke5m93JEYzGNZxFqCSwweQvZQb2lxmm3ZswUkGKrH56kL3YNU/a1iZK292n9hbesx
         s+OMWWF/Ek8KdzfAAGhXg+5R45fKvcXFedmWWLAKmfHl3VlrOvXehsN/7uz/agRu9ayQ
         li1yGHWXus1HnqwtMQJAPwwG8isc95JOgWM4TfoY56cGKGp8EUD+0qyCM8/qiQlAmlOk
         sGi1O0Htz3P0vxFMGEG7iizNWnKuPpNk889962xwsFYoBTETWTZLTMm4X5RrWkMqUYK6
         geBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+qBFvyW+568qdqgq0fImHjayCbzKhYzi34uDyCVhowswTupT5X5blNcto1OMu3oEUUR4ndWb0Xf/ItaA==@lists.linaro.org
X-Gm-Message-State: AOJu0YwApu90nGCRpRWAnlGo48v1bZtDvEKjCQ5Z0ZIdKy1weG6uroTj
	fAOKH3zzcggiCT8NRlm6sZ3j0apEmBVr4b9vW9S122XgjpZc7V8WERbWeFrKGf8Mp6gObLl+
X-Gm-Gg: AeBDies3OfSZXZHILQiDhNdkrYg02xaEHHJfQaQRPMh5IXiVzUwx8SjSsxTyFGL/WN2
	kjCLJ3P9eT4lfEFUrQZX0DW7vNMDX4+m3jOeLYJpL16AYrX2PpZSPgFImWN2Gy7/tq1tLfV0zOL
	LYYP6RXCClMgPtXBu7tBqHiB9ooNzZdZH6QMGtLp+qCLqLINiLaI55rSTO+d1/N4ib9I3raP5zi
	RM0ryeHUKHZ0ET7Wzy4On3LimtuXF1VfjVosqG9BwC7c66ew6PQMrF4lmzxPF2eMCps6j8VMI6o
	Ii67P94DHwW7ir4BP81mJWT/KBJtA6fsyQDS1AqWJIXZrZiL7ZKgn/CGF70A2dfqQ6zbTueRk6j
	fsM3Ae7MwZi4IC86M0ZsFr3k0fJzhE5zALnxGNrT7ZO07VQFzqh5/pxp59Ic4HsPJDANtAkxcti
	1Xwyk0VQHjs5f+dcaDqvjMwc7/hMBzg9XXx2LxSDeaje/WwkJ178Btuagsoe29T4JQsE8WO/SBs
	Zg=
X-Received: by 2002:a05:690c:113:b0:7ba:ef98:970a with SMTP id 00721157ae682-7bcf4fbe2cemr7689187b3.9.1777335894831;
        Mon, 27 Apr 2026 17:24:54 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::45])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bcf05e6118sm5892467b3.16.2026.04.27.17.24.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 17:24:54 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Date: Mon, 27 Apr 2026 20:24:48 -0400
Message-ID: <20260428002448.4829-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: sonionwhat@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7JN2CUA6K6Q3CAY7A5GVRQ35IHQUJOWO
X-Message-ID-Hash: 7JN2CUA6K6Q3CAY7A5GVRQ35IHQUJOWO
X-Mailman-Approved-At: Wed, 29 Apr 2026 08:01:56 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, kernelcoredev <sonionwhat@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7JN2CUA6K6Q3CAY7A5GVRQ35IHQUJOWO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: ECBB8490E50
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[31];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.761];
	FROM_NEQ_ENVFROM(0.00)[sonionwhat@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..757460c8b 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -168,12 +168,9 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
-		 firmware_name);
+
+    dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	    firmware_name);
 
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
