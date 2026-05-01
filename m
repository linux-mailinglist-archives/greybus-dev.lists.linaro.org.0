Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wDkXEkP49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:19 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A2A4AEFC7
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:18 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4E5D2406EE
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 19:00:15 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	by lists.linaro.org (Postfix) with ESMTPS id 051214017B
	for <greybus-dev@lists.linaro.org>; Fri,  1 May 2026 14:17:07 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=quBIO+03;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of shyamsunderreddypadira@gmail.com designates 209.85.216.50 as permitted sender) smtp.mailfrom=shyamsunderreddypadira@gmail.com
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso2120701a91.3
        for <greybus-dev@lists.linaro.org>; Fri, 01 May 2026 07:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777645026; x=1778249826; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BpWu2F1fF1FptrmyDGMQb5fmzeBhfU0DO5L7Hlee5Z8=;
        b=quBIO+03YMJ2NucZ1myePJMP+H2+1PxTSOOLG9/ZsjZzozQfiGKD60o8PI4PXrc8RB
         tLeE5qsI+jvzcmEPhbKjsBOelWnJ5ody3B4xXgfI0YLCnawy2oq1XapEs0UEpq2WLkUz
         jkfHHnkuCbgs+ft1uZFXaMzv39J8FKnDZSJrQkpTV3fZC2vEwDiDnERyN5L9xJqdppqe
         ElqzF8K4LbrDxGNEp4SQzYIEzqQyZKxT9v69n7QRUB6eWtX4Xm/hZFxijo64JUyRYd7g
         IMVcL/z7wuxpbxJcw9iAvEgcpWQRyANipZXwTFJVOTE6GDyHVtF04NCEtVE+IuSs7Alx
         nSuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777645026; x=1778249826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BpWu2F1fF1FptrmyDGMQb5fmzeBhfU0DO5L7Hlee5Z8=;
        b=bNQvbbsKN5O25Ts3RQk7WmhQp8fw+OP0xopgmZqOuRRAJweQj/DoyXHbwOBKNI7B5b
         cEr/LdQZvfMzd9sE5EWgXC7N+wgfu2UmCcatTbKAHz4b3zlL9LY95VvZD3FUzWT3FQGB
         OROQ5SQrJ1ljgh5uf8ZO8fC+J6TsmG/vOQKVsP7diYiMR2qAYGMHr1UnqW/PTc0GkQAg
         SFiSXXrZghCsoX1zkkJXp5ulPGNJsu1pMWfM/YYvwa4HHVW99xzJUiKoA/KPRAjIwDkw
         ag9dZU8C4vCXaOf6dLRBpb7c7As7fRhbb0DpWNuuuDTyvRTHKhmSLipNpP1f3i7S+r6j
         UPzg==
X-Gm-Message-State: AOJu0YzXEXbfovhTUxsLoLPtsmwN6wtnIvI6tlFt/t2q1loFx6imceVJ
	ji3YSFVohJQt6ezJV9XyINBqvqHVa9wV0K4OP6XWQfPGCU8Ceb86sYHe
X-Gm-Gg: AeBDievVfJbgMT1jw11v/hrfqtu44n+8vmeNwWwj3yW2I8AYj0lYEJjZ3Ur5MnNmK59
	mcQ+z1IaCd/6mf4N2yvmUqcqgozOYrJcxpQ4oi3TMf+W7EeDr5plxWobEhPe+tj4tzg3HUoktWi
	31DLud9RHHAoV9GnZre3Y/x0kknao0sAodafI61/pPh9VC5wMwjfUnumNMOspsEj/9Fy7gPo4v+
	AFpSIhbjToLryKFvUJnbDvTy/7vVxCa5rbq2bCBr5ERR/ckv5mbKW1WPmqLFX83dWzl1PTQOdAI
	8Gw/BB/Zqtzw8Rn8NWdtw4b9hz9T7EjNpq8/gs4Fgrr9RspqrZzU0JqHA4+ME2FNl5ixLFrX8wD
	DsFkLjHIcp5ZWFlewIBAbNRNQMhxvjH39UnPG8Sqk+Vma1TEuYFLAfcVv0FgDzT2RMzFIiVGcA2
	muU1jeSLrZ2JPpc40C4hbmXnSgm5S/OamdAs84heuABvPhUPzlShRtT5Uf52S17oQ0pCYH+pDP5
	jfZHxmZyM3JceCFV1urFUyERi3BRTi+nA==
X-Received: by 2002:a17:90b:1b4f:b0:35e:5aa5:ae38 with SMTP id 98e67ed59e1d1-364ef3a6e12mr3415480a91.9.1777645025909;
        Fri, 01 May 2026 07:17:05 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364f4558e0dsm1025415a91.2.2026.05.01.07.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:17:05 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Fri,  1 May 2026 19:46:17 +0530
Message-ID: <20260501141620.24411-1-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: shyamsunderreddypadira@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZDUVJUAH64K2LXYDY6QE5M5F5V5P6WRC
X-Message-ID-Hash: ZDUVJUAH64K2LXYDY6QE5M5F5V5P6WRC
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:46 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus:add missing newline in sysfs show() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZDUVJUAH64K2LXYDY6QE5M5F5V5P6WRC/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D1A2A4AEFC7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-0.353];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

Sysfs show() functions should return newline-terminated
strings.Add missing newline to sysfs_emit() format string.

No functional changes.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2308..5737f2a32f5a 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -75,7 +75,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -84,7 +84,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -93,7 +93,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -103,7 +103,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sysfs_emit(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -114,7 +114,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -125,7 +125,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sysfs_emit(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.43.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
