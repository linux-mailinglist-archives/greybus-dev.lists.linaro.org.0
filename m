Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aHLMMNq4nmnwWwQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 09:54:50 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 371D2194719
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 09:54:50 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 88457401C7
	for <lists+greybus-dev@lfdr.de>; Wed, 25 Feb 2026 08:54:48 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	by lists.linaro.org (Postfix) with ESMTPS id 46E843F9BE
	for <greybus-dev@lists.linaro.org>; Wed, 25 Feb 2026 07:12:29 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Niz2b7OD;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.215.171 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c70f191313cso6186a12.3
        for <greybus-dev@lists.linaro.org>; Tue, 24 Feb 2026 23:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772003548; x=1772608348; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q1YxipkLf0FnwbRouoqtGjqWkQYlfLCHRzYlNn0OsgA=;
        b=Niz2b7ODQLt+iRMkpboFx+tE4dyKEXO9LNvZ5ri+XclmIaSI3UC24Yjvk52zAfGnKS
         3GWqZN4Aau+5bP6i9XZaPFhKSoWJkdfHhkvCtGjK8Sob3sBoA40XElpf6doWLEeAlFvX
         Nl5+qmoCPwIEufCUNkmKH8lOosUsZwUmoRvB5sAZjqWRtedw99FIVnesjWIaiiQdg9kp
         4EffPJI6O4P13CSj2pLPIPb6Fpo/3cTOA3L5UIWWv/xCItg4wqYMreLUGnCyLJs3Tcos
         SMor+/2k3CwHKvBANzh70BFG8D0zR9rV/+7XvJtUZbFhXBRZjdYQ9/zgr1RVUK5a5UcX
         6PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772003548; x=1772608348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1YxipkLf0FnwbRouoqtGjqWkQYlfLCHRzYlNn0OsgA=;
        b=GjZE2mLsVaZ+L0+qeXdBJPgGoGeX1cMTKFwmhJSKnZR+BqtANYij+D+Q802G9QUrCN
         BWDxl2p5CRTSFHt9dAjwklXb/aQuhmMURV8ljrSq6p7PjHDfYNs5kbZpHniqukjEhjf3
         CbBn0LfbZN/qjwjhLNZchKlCL04OEEYTBZh1dkIK3rNB2NymThsLpCJkZx3l2g17eBC7
         8Kbvq4CM8m6XViTY/C+f1P1BiAt7Q6vulhtdLFYFS7JxfQxeONQWx3oFrR8tn9CAbAcR
         2/SpTr4swAqRQvuO7qGJUxORsBnaLvo7Juqa9Cs25IFkrDAqfXdRESHPur3O92WlfYVo
         a/rQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwWacTGxbJhW3Ar21g5pziHiW4H4JZTC1C7fsJ6EsZ33sH6USfhBMSfX5LuadEImT2N9v2YUef+fWcIw==@lists.linaro.org
X-Gm-Message-State: AOJu0YzL2Ywpj/DVgt5s2Rv8EfLQzdudakfKmALlfcqgs/NzIVHPw8Gp
	69X4sqrOTQlmHdHLWUudoQF9aS/5a9LYSP3wFwGW00rq1XqHkqMPo+cC
X-Gm-Gg: ATEYQzzXcMvITEmZKtfDtgfFFR8lrdsAy1YfSOrCU17YyqCZBW2rQYI6Hq8gTzPHy1o
	esTIzj/vk0Ng/VkvFpvB+Fr+nNHl1PMOi+BnG9NBNtUdA/qbNbLTCp7ANlHaltbExJj5ao7DuHL
	mYnjI0xC0axg9dQoEDKdiLPPC43XjpFD9pP3Xx+GaOG4AATuHQ1x9tfC2vuNx00MJbyDHpPA5gl
	GxsIVaFNpcW3v/hWKOrUXXxVsf8RwKhF4eGRvPrE9sUQSoQgqiwy9eaUhoNQrL+Wp/T03pR7TNc
	Y18dBeyO0RiAm9xXYsMqZZOSGAvn9ci+8DawsBQD9SuB3sjTj2eXuswtiWYmW/ZW1/aZroZDpw7
	icJLJGTOJ5bu9EMmjgbCcjkyBqW1wwbz6WGlFnIkBAwL842q+qikRmTZKt/MNRGxTP7YqELYCoV
	XeIgXOiYKTx/BrbRYi7s30u4m2b8CymUQ2VA==
X-Received: by 2002:a17:90b:5747:b0:33b:bed8:891c with SMTP id 98e67ed59e1d1-358ae8c6c31mr13644861a91.23.1772003548280;
        Tue, 24 Feb 2026 23:12:28 -0800 (PST)
Received: from fedora ([2409:40e5:116b:88d4:3795:8a9b:7eb9:b495])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35912fe6bc8sm381401a91.5.2026.02.24.23.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:12:27 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: gregkh@linuxfoundation.org
Date: Wed, 25 Feb 2026 12:42:12 +0530
Message-ID: <20260225071212.9050-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AQI3N2S4V2EA6CBLLYU7SRFU6IDRA3FK
X-Message-ID-Hash: AQI3N2S4V2EA6CBLLYU7SRFU6IDRA3FK
X-Mailman-Approved-At: Wed, 25 Feb 2026 08:54:47 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v4] staging: greybus: audio: Use sysfs_emit in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AQI3N2S4V2EA6CBLLYU7SRFU6IDRA3FK/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 371D2194719
X-Rspamd-Action: no action

Refactor sprintf to sysfs_emit in all show functions of the greybus
audio manager module. This follows the standard kernel practice of
using sysfs_emit for sysfs attributes.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
v4:
 - Remove \n additions, keep format strings identical to originals.

v3:
 - Add patch history below the --- line as requested by Greg KH.

v2:
 - Add missing Signed-off-by line.
 - Wrap commit message at 72 characters.
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index e87b82ca6..f9dd9269c 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sprintf(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
