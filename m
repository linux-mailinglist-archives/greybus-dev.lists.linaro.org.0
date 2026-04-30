Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNYRLs6V82nR5AEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 19:47:58 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEB74A691D
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 19:47:57 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B437E406AA
	for <lists+greybus-dev@lfdr.de>; Thu, 30 Apr 2026 17:47:56 +0000 (UTC)
Received: from mail-yw1-f195.google.com (mail-yw1-f195.google.com [209.85.128.195])
	by lists.linaro.org (Postfix) with ESMTPS id EA1B4404F5
	for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 17:31:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=RvVnRPu2;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of sonionwhat@gmail.com designates 209.85.128.195 as permitted sender) smtp.mailfrom=sonionwhat@gmail.com
Received: by mail-yw1-f195.google.com with SMTP id 00721157ae682-79a60975dc5so14731447b3.0
        for <greybus-dev@lists.linaro.org>; Thu, 30 Apr 2026 10:31:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777570286; x=1778175086; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N/+4Wu+sU1O8P+03F6I8GHbXafqNDqKJAi0ynLG9Wx4=;
        b=RvVnRPu2XkowJ9pm6k1Mt6a/yv4z2oYc++K90LkCvDofaBXAf5cKiSXM7eNN3EyvNy
         YOL1W+TMD3zKjcWuSDA0RQuU9Ibysw+2wCk4Sy5drKLRNXgv0r6X+MHCQe6Lhlqf1Dow
         f8k2qEoyiYBzJqoOWoqCzxmMF7oIaEMTV+7FYkTT8Q6AbjciQDafd40dvyFVwtfk+R//
         6KFdkgcIGi4esw/P0BbqV029ASWvcuUJ8Nt9mdubAKrISJR94WFvMfo9by8sRoRxFjl4
         BiyPtXyuNBnMHzGe5fJJH/jafzviZeV5FsscDvRGlFN+V0+i3gbU4WDPTKUeo62Tnr74
         T7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777570286; x=1778175086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N/+4Wu+sU1O8P+03F6I8GHbXafqNDqKJAi0ynLG9Wx4=;
        b=gwpPiIlasBnwDtGPCKte4XwqPNKxb2bZw12ls+cE5xAbfFsLR93dySn5FAIwZKXlMo
         FfScewcXK+ZxPfo+DMmG4C/L+IYhi1lkjfyNO0l1wkSyjLI8TbpcnsJrV3CJ9QFH0bkB
         OqouDVKKjCBlARL+t8qgkWlwuJP7oTM7uVjpfewQC/0Vi014DKfyJNNiLwEI6SsX1p8f
         GcDBB0vgoBSYGPs0OzY8ImBbn4Q9EwZrNAxSJW5lbqZYiuABgJKXaWgsXazb7l/ik7S6
         ZPDd/L4HyMdk7mWVXC62Zi6TgRDbmIHLGX4BWNrTmWx2rgwOfr9ck/RowgcZuwsBd2CP
         hS9w==
X-Forwarded-Encrypted: i=1; AFNElJ9VnizU1EIUdyjqKQ8CQx+FBrE/BZgPTahQrWVgfnjSUWV4pHe5ed9UhLBEElQa34VcGb22NcOLvcWiuw==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywd/sBcvCXgwLSUebAH5xMuTQuxAzMEblZPIkms9JoROq7AeqN9
	Ljo8WK8N9bt0cfhmCtXqfhkqiZwux2NJlpVG1CoLC7nsr99I1xkfIEBB
X-Gm-Gg: AeBDieuKqDAI9MIFYsoBwBczVqz9z3acXoz0KLwn1qofAEamFhl3NFi/n53rMv3ArRi
	60jpXIO9SwT7yTuE56Kg3OpuwN2AVDINLPfacIYZ4Ri8kwFJJx8MlNoDe20EVfFcjah2CJVgJdN
	O8mWKuFCYHMyaAih6kkxH+IkH+Z+NII0jvYh0bhP5sUn7A66PZnVfaq92oau5Dy6hVvwK9q9jH+
	9LWcr6Y35z5rAF0VKwjTa2DIc38cUtHlMe+SkF4tOR4+IWInH99bZVa6wlnxHMLNVlU2XAO7sww
	6pb+BVvkJOVuyvHfthLY8R7ME/0UwTzAeBBXPprvCNhPw05U2tax73TCOyrwZRVYDRt5Ytqf2QQ
	BnvHI+z7OwQqnpRTECsk7EEZ8jzXGW4zs0iSEaU5MUCH0tYZiXkD/9on0K8WosrzcHrxygM6DPf
	2gh9o3xxJv5Yqy5LboKom0o1eV7LVyJaF3ZBSs4bQQMzR5pk8T7+bJchsBdMYZ68NswonVgGAGp
	A==
X-Received: by 2002:a05:690c:67c8:b0:79e:9cc1:ede3 with SMTP id 00721157ae682-7bd52825839mr41518467b3.2.1777570286417;
        Thu, 30 Apr 2026 10:31:26 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::b])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7bd66888cc7sm68137b3.44.2026.04.30.10.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 10:31:25 -0700 (PDT)
From: Bentley Blacketer <sonionwhat@gmail.com>
To: gregkh@linuxfoundation.org
Date: Thu, 30 Apr 2026 13:30:45 -0400
Message-ID: <20260430173045.4619-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: sonionwhat@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: M5NRISLCQH7EM2RXJQR6JET6NEPTVGEJ
X-Message-ID-Hash: M5NRISLCQH7EM2RXJQR6JET6NEPTVGEJ
X-Mailman-Approved-At: Thu, 30 Apr 2026 17:47:54 +0000
CC: vireshk@kernel.org, johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Bentley Blacketer <sonionwhat@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: bootrom: replace dev_info with dev_dbg for firmware name
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/M5NRISLCQH7EM2RXJQR6JET6NEPTVGEJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 3EEB74A691D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.991];
	FROM_NEQ_ENVFROM(0.00)[sonionwhat@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

The original dev_info call was intentionally temporary, with a FIXME
comment noting it should be downgraded to dev_dbg once modules with
valid VID/PID values were common. Project Ara was cancelled in 2016,
so that time has long passed.

Remove the FIXME comment and downgrade to dev_dbg as originally intended.

Tested via code inspection only, as Project Ara hardware is no longer
available.

Signed-off-by: Bentley Blacketer  <sonionwhat@gmail.com>
Signed-off-by: Bentley Blacketer <sonionwhat@gmail.com>
---
 drivers/staging/greybus/bootrom.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/greybus/bootrom.c b/drivers/staging/greybus/bootrom.c
index 83921d90c..058044ba7 100644
--- a/drivers/staging/greybus/bootrom.c
+++ b/drivers/staging/greybus/bootrom.c
@@ -163,18 +163,13 @@ static int find_firmware(struct gb_bootrom *bootrom, u8 stage)
 	 *
 	 * XXX Name it properly..
 	 */
-	snprintf(firmware_name, sizeof(firmware_name),
+snprintf(firmware_name, sizeof(firmware_name),
 		 FW_NAME_PREFIX "%08x_%08x_%08x_%08x_s2l.tftf",
 		 intf->ddbl1_manufacturer_id, intf->ddbl1_product_id,
 		 intf->vendor_id, intf->product_id);
 
-	// FIXME:
-	// Turn to dev_dbg later after everyone has valid bootloaders with good
-	// ids, but leave this as dev_info for now to make it easier to track
-	// down "empty" vid/pid modules.
-	dev_info(&connection->bundle->dev, "Firmware file '%s' requested\n",
+	dev_dbg(&connection->bundle->dev, "Firmware file '%s' requested\n",
 		 firmware_name);
-
 	rc = request_firmware(&bootrom->fw, firmware_name,
 			      &connection->bundle->dev);
 	if (rc) {
-- 
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
