Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Dz/3IU/fL2oWIQUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:35 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 07BEF685A7A
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 13:17:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=Bmxs5Rsp;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id ECAB340A51
	for <lists+greybus-dev@lfdr.de>; Mon, 15 Jun 2026 11:17:33 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	by lists.linaro.org (Postfix) with ESMTPS id 48E303F7F9
	for <greybus-dev@lists.linaro.org>; Sat, 13 Jun 2026 01:50:04 +0000 (UTC)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-842307472d4so663180b3a.0
        for <greybus-dev@lists.linaro.org>; Fri, 12 Jun 2026 18:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781315403; x=1781920203; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t37aJaEtFHDIlL04HCphJkfdvq0+XVtQ1GXGJFYW14U=;
        b=Bmxs5Rsp0byrBHHExROas8lsByYxiFNo4ZUFmoOsvH3au+IhYIh/CjHkxhbL8SKIE5
         X7d1XZQTrGpZ+7KueVlRzh4rH56/yflgnRF2fn/7NbsIOln/3Vh51Sqgi5odyjptc8u7
         88janJ0ndMCpGGuegizMNuMIeuqKpxehL2iLr//t0ZQw6V6YVitiy5Y3/k4WMXodNY1y
         BqYP+0S4TjMOuadVK9lGXKEzqiS7+WgCQd/bEcx74m6RSgHNDxHACzxzNv/v3MHB+AuF
         hZrrdW0Nd1HfowHj1Mq0RnxqL0Hv8UZjcVqS50YV+HWStUWVBMMkETpE0Lo8jfYtZojY
         2eqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781315403; x=1781920203;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t37aJaEtFHDIlL04HCphJkfdvq0+XVtQ1GXGJFYW14U=;
        b=QMFyYEx1YwzM2S3VX1hPvyIwo4uQAo/3t2vje419vT2/YMZqqG05Rv5NH2V8KCyXL/
         Pm4N8xGYib+tWTEAN1ONOp5N9MCTX5QiKEnUPChkZVkSmXVdPDYMSuWMPVJQoLWSZINV
         gUN4UGxaWruen2nOWysQDufKmaf7hyZUds1SeBRMWwNOVbtilHTSq0kdXAhEBcy3bPun
         x5Rw8UOLdGrJmH57BdBYMMIbYjoGgQ1XmTnSQQGUWpa1P0EU5ipLO0PUfMqHRLiIfCqX
         0gtq4xbywzt3m3tvTMl1jLJ9tbhrx1n7W+k5yyWzz3cH5suWFCMWk0Uf3ktpGR5vlUX7
         0W3A==
X-Gm-Message-State: AOJu0Yy3lm4YuQoFmt5MIfl4zbQ4Ozc6RyOcPAN5n6ovlDjQ4Y1VefCd
	qn/wcWPj5ysi+5GtVknKIg2ECaXZLkn0FdN5Prr6zR1vZQuz5pxz68GB
X-Gm-Gg: Acq92OGjJqk6tovyBCXRZ04q9ThS0AzUaimESeAu8aFgxjFVOAuCmvETvNQcBQPPTMP
	YA+sHUtSgeNdWVth1NixZGnD0mepSJRCyl7NNb8LGz5Xziom1c/NUUPPnD9U1KGJPWpAdWzJQoU
	dvqSK63zNN7nJfdEi3z17tofdnWz/2i/NO1eiCHzTKTUzcy0McoBgGra9A/s5pzOypl6qNDfpzx
	XNeVIM8uxlZJX0e/rVxKZZWpDEvxtm645v0MCk957ZdoXmQMbhEWjhafedijduzcJmgFED3BBQa
	gCTZsWGkpRNVip6AkisJcOcnXTJ+gglvMMOOH8wKzSiM7cxKOUtB+zGQmDiIryowe0/TSMZoibu
	+qTGgR4oti1vMst8fHfRxIrYFOclJQKOsodxuh/q+PDRX0C5lK6oJKz6VGGjzM7+ZiynIbYLZfi
	JvJujV1ETXas0gKyZXbOOk33ktzA==
X-Received: by 2002:a05:6a00:39a9:b0:836:3f6a:3e7a with SMTP id d2e1a72fcca58-8434d07b973mr5705482b3a.26.1781315403315;
        Fri, 12 Jun 2026 18:50:03 -0700 (PDT)
Received: from localhost.localdomain ([2604:3d08:2474:4800::857b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8434acf23a7sm3336210b3a.22.2026.06.12.18.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 18:50:02 -0700 (PDT)
From: Brock Haftner <brockhaftner@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	outreachy@lists.linux.dev
Date: Fri, 12 Jun 2026 18:49:05 -0700
Message-ID: <20260613014905.48458-1-brockhaftner@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: brockhaftner@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 7AR5NPFPMO3WW3MVJLHYOSXDQKKADMJE
X-Message-ID-Hash: 7AR5NPFPMO3WW3MVJLHYOSXDQKKADMJE
X-Mailman-Approved-At: Mon, 15 Jun 2026 11:17:30 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Brock Haftner <brockhaftner@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: add missing newline to sysfs_emit formats
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/7AR5NPFPMO3WW3MVJLHYOSXDQKKADMJE/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	DATE_IN_PAST(1.00)[57];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:gregkh@linuxfoundation.org,m:outreachy@lists.linux.dev,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:brockhaftner@gmail.com,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linux.dev];
	GREYLIST(0.00)[pass,meta];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[brockhaftner@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brockhaftner@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[checkpatch.pl:url,linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 07BEF685A7A

The sysfs_emit() function is used to format strings that are returned
to userspace. According to the sysfs documentation, these outputs
should include a newline character for visual clarity.

Fix the checkpatch.pl warnings by adding the missing '\n' to the
sysfs_emit() format strings inside several functions.

Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
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
2.54.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
