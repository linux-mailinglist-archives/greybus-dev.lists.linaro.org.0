Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MpYErokvGkxtgIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:30:50 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D392CED6A
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 17:30:49 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E4E71401FA
	for <lists+greybus-dev@lfdr.de>; Thu, 19 Mar 2026 16:30:48 +0000 (UTC)
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	by lists.linaro.org (Postfix) with ESMTPS id E0ADD3F8EF
	for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 12:02:15 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=EG7A3c6d;
	spf=pass (lists.linaro.org: domain of grondon@gmail.com designates 74.125.82.42 as permitted sender) smtp.mailfrom=grondon@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-128d2e3074fso660415c88.0
        for <greybus-dev@lists.linaro.org>; Thu, 19 Mar 2026 05:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773921735; x=1774526535; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cx0qCYEgpEY0APyH3BW58E7QngJ1Y7p1bZt4MgX1Fjw=;
        b=EG7A3c6dkBjnAvFuMhxdroEW/MwiFHKTXpm2XbR7nTWKYDyhrIBQr4nq4xXYxO2ZYF
         OsDAoa6FiMMo+bfXbuWxRsQiLdbSN+VlFh6syGufQ34DmaXtZtNAxU+votthIl81Vk2M
         NRNm/rboTYBtanST1snusoYOLmP3K2cuYY0y/y2k5F4G0K6YJ/493vCaAI7ogzb37Lk9
         CwDKSyK9jWnMDCMhFeDlWHk5ywkrUTRDZXI9XS9NCEh+NjnmfRemii87cc2fbV3z9ON1
         nz4VctObbqR881AwyyBu0xlI53rn2iNLbc0/NKwjrGbTqezBJliaqc9Lgh5lrWuXxFmn
         P2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921735; x=1774526535;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cx0qCYEgpEY0APyH3BW58E7QngJ1Y7p1bZt4MgX1Fjw=;
        b=HHTmwn0yQWmh3GfBKhvE/U1MDGPq3YA+80psqXXugtGQUBCLEj+v4lBBIC2JAkO1TC
         Sk3DL+bT37j/Dmo255reFnu4VTDFpuiXkVJGQBTcTAphskXTCLcBJ8wB6V3rmJogjFPs
         zAWrSQP5wnW8CXTRmAefvjkBYbEBtE253pXWsxpZfca+Mv8uyE5Rg1/PSBSqrCN5gLvx
         /4nVEfFnMDxhadll7fZ+t96qbVh4iujjdoFTU+QZP+C80Kit5b8SVKJKzH/preb46L/e
         5ydP7BMk3CVPcyLZVGSbVJjGOgZ/UOPzodqLmcWKnEujBZxCsbQ0ooPzP98pZ/fjjeJ7
         f6qg==
X-Gm-Message-State: AOJu0YxUwnVTpFGAfM8bAEAnO4RI8wxtJAZol7b2HzwkRW//TdaZIIBc
	4CRJiMrjs63tuFQBy4HUQ+I/rViNAc1sx7Ubz8vmVnkN6wJRcqO0WTnA
X-Gm-Gg: ATEYQzyUV8misJ4ppEArKTiuSETltvbGWjU2061XmUVx/g6UFtPBsdyI4QL3/g1CYYw
	FliVjr8ewAvqHyJ7t7ITuhQy4D/U0aNVXqsiXYBxLcxT2g6oxiB/CEs7qKeT0vVnsaJ66W4WQR1
	Dh3ROqSRVaPqILA7eHsSLfnPc0hrfO9T+RcYKbLoaHvq/IUWiqElbrmG61PB6HlWGx4N3VmFN3s
	VbsfFambBd0SXLO84xyhpjp4ewyfBKRLWGwyGQSmgIIbOrzzibpJb+huLHEbwozaxCw1JpTBNGi
	VwgqxlzlbKXu9I4m7fpzmSbN5WNiBlM0mYbU79+uwGUzPT8IORtbBFEUmdoL9zuLUktMWBdmbUS
	keKgao83usuM+mq7nfFXjLgCT71JBgF/wVWi/95nQsQnM2xdTOWodWFeFvy436dUWyVMm6ewnBw
	5XEWXQNkPdT04UeWS6/w6tAKYuAjPbZU5O
X-Received: by 2002:a05:7022:692:b0:128:d375:f1d4 with SMTP id a92af1059eb24-129a7160854mr3759174c88.28.1773921734412;
        Thu, 19 Mar 2026 05:02:14 -0700 (PDT)
Received: from localhost.localdomain ([149.102.251.98])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a7153051sm6311253c88.0.2026.03.19.05.02.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 05:02:13 -0700 (PDT)
From: Gabriel Rondon <grondon@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Thu, 19 Mar 2026 12:02:01 +0000
Message-Id: <20260319120201.25210-1-grondon@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: grondon@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: B5DIAO5CVS2KDCN5FCD6H4B2Q6QQKHR2
X-Message-ID-Hash: B5DIAO5CVS2KDCN5FCD6H4B2Q6QQKHR2
X-Mailman-Approved-At: Thu, 19 Mar 2026 16:30:47 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: use sysfs_emit() in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/B5DIAO5CVS2KDCN5FCD6H4B2Q6QQKHR2/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.218];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[grondon@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: D8D392CED6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Replace sprintf() with sysfs_emit() in all sysfs attribute show
functions. sysfs_emit() is aware of the sysfs buffer page size limit
and should be used instead of sprintf() for sysfs show callbacks to
prevent potential buffer overflows.

Also add the missing trailing newline to each output, which is the
standard convention for sysfs attributes.

Signed-off-by: Gabriel Rondon <grondon@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index e87b82ca6..f22ee73eb 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -76,7 +76,7 @@ static void gb_audio_module_release(struct kobject *kobj)
 static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
 					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%s", module->desc.name);
+	return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.vid);
+	return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
 					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-	return sprintf(buf, "%d", module->desc.pid);
+	return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
 					    struct gb_audio_manager_module_attribute *attr,
 					    char *buf)
 {
-	return sprintf(buf, "%d", module->desc.intf_id);
+	return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.ip_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
 					       struct gb_audio_manager_module_attribute *attr,
 					       char *buf)
 {
-	return sprintf(buf, "0x%X", module->desc.op_devices);
+	return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.33.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
