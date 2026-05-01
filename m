Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEwVGEv49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:27 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 36ABB4AEFD6
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:27 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 520A64095F
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 19:00:26 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	by lists.linaro.org (Postfix) with ESMTPS id 45C163F774
	for <greybus-dev@lists.linaro.org>; Fri,  1 May 2026 14:43:03 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Q0XEcNkp;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of shyamsunderreddypadira@gmail.com designates 209.85.210.180 as permitted sender) smtp.mailfrom=shyamsunderreddypadira@gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f8bf96b46so915422b3a.2
        for <greybus-dev@lists.linaro.org>; Fri, 01 May 2026 07:43:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777646582; x=1778251382; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lO72bdGdZwejIJb7TOURovIvs6tmJN/3DIyI5HlYHnk=;
        b=Q0XEcNkpgVUrFLOYVyjgFX6CyUXKdrRDPRa8fY05giMNceMvRIg5oy66Na+LxXTPgQ
         vSG2zJEW7bSqg8d7j4G00t5Ye0PmRfXDFHgT0eIpS+eqQuPgOLkb+31NCRvkt/UgSJwm
         yNBpq+UunjWxjkQSCbXI6jFG7gErsPQnx8uNA2AD5GRcjQ4v8ELCdrtyP9OqtkdI5RD7
         HUT8isv2IvWLYDPOU7LcxInDaT78ux6Y9mQdcREsJPQ5xmNYWGN51DqP/XoUXknnzLaT
         NON6ArjOGi3SWBONPyVLkJui2XThKCXBgEErRgFxbiy0ZehTj9AT03ghLHew7DTJdBjY
         1NlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777646582; x=1778251382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lO72bdGdZwejIJb7TOURovIvs6tmJN/3DIyI5HlYHnk=;
        b=kO9y5jEAIpfSrrDEcnOmmfN4/m05337cT5tczJ1BKIUPTOcjFf4kHGFxoK15PnRNc1
         LmcqmUVxTQQ+hRdieIL3cBmTiT1nVj7syf3Oghvw2e05E+ehCyJ8d2hXdlyjlDho2yxb
         cgtRw0Hjb6FHWuWs8MijjBqx8h4xHTCEQBhI18q9BqjxTqCiQKu94ewKcQpA2ItRf8Lt
         5qP0nj0Pwa598vpfL/LpHMutVs1oQ0zb+h0lxo1W665RFnO2WUT+stoQvjuNHJ9kdiQw
         XtHqR3ezJx1iPpeI7nTZ1M/kWFDAhLb/IZ6wHuzJvXf1Sek/S6Y3sT5JdLp64yXDxZnl
         aNsw==
X-Gm-Message-State: AOJu0YzQtM9sn/gE8FMhaiS7Kswa3fcKn8TTRAFXbNhmY3MynwYLwQfX
	a57/55k0n0+tpwCAjhHSCmEAN4jmnVUbZunj85JXNrk5KLqEBET/NB13
X-Gm-Gg: AeBDieuc/jW6f3nI6szxjBLq8CnHvddqFMBP9MIC3A6r0DmTnpeKzCQ3Q8XlRcdhZ0p
	BHSFWkodyGt8x83d9cCOY8aMJTYYbXlCDIf5Imh2817TszjnPd76txM2UEQHIHEp4bBlYOWXkBs
	dLcf2+7etXVANdEUIlruKjOO7DnWRYhBpkibtdUo0mr9dgNyDSxjs6fQIYjFaiI93AepxySjkJ5
	JwuF1piO9lPTCelcA6fNwoPKsR1efQ6ntDXyY27Hilf1I5kx7d03sPOdSvZbTqjZtpN0iL0T/sD
	vVMhx/0V/ZH0a/lccRT7ngk1+gEj/8hjRnx9cwRANqNfoRKOf8XEtgM5U/dvDKszfXis0wc0v3R
	eXjR+8RqZv1Iq9LpGWnLbSb4MZoQ4maAo0i4yzJfeXbZLhtI2jNnaWs/opPU3DHQYQBbguKZ0XZ
	KeJ5EPIjn5cc7DpUgcjhKDGhqJPoOf49dXYulCjHqxgf30iRzL9fzB0K4O757eQNZrgx+LrV4Qg
	LQ9bt1iduYAUphVwuhIorpPDtmDwuNe4CLw3q+caOxD
X-Received: by 2002:a05:6a00:391c:b0:82a:6461:6d1e with SMTP id d2e1a72fcca58-834fdcc4b03mr8472519b3a.46.1777646582202;
        Fri, 01 May 2026 07:43:02 -0700 (PDT)
Received: from shyam-VMware-Virtual-Platform.localdomain ([223.181.115.140])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b5b921sm3498062b3a.54.2026.05.01.07.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 07:43:01 -0700 (PDT)
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Fri,  1 May 2026 20:12:08 +0530
Message-ID: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: shyamsunderreddypadira@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZGX3AGJIOAYKKLT6FMI3IVJGMK4VB7JG
X-Message-ID-Hash: ZGX3AGJIOAYKKLT6FMI3IVJGMK4VB7JG
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:48 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus:add missing newline in sysfs show() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZGX3AGJIOAYKKLT6FMI3IVJGMK4VB7JG/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 36ABB4AEFD6
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
	NEURAL_HAM(-0.00)[-0.352];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]

Sysfs show() functions should return newline-terminated
strings.Add missing newline to sysfs_emit() format string.

Signed-off-by: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
----
v2:
-Remove "no functional changes" from the description as per
Greg's feedback.
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
