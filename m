Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id RG1yO0T0CWqDvgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:52 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3A562595
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 19:00:52 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 177D4404DB
	for <lists+greybus-dev@lfdr.de>; Sun, 17 May 2026 16:51:24 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	by lists.linaro.org (Postfix) with ESMTPS id 58D5A40464
	for <greybus-dev@lists.linaro.org>; Fri, 15 May 2026 22:33:49 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b="O8D/ar35";
	spf=pass (lists.linaro.org: domain of alhouseenyousef@gmail.com designates 209.85.221.44 as permitted sender) smtp.mailfrom=alhouseenyousef@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-45d96d21e82so124581f8f.0
        for <greybus-dev@lists.linaro.org>; Fri, 15 May 2026 15:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778884428; x=1779489228; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kt/xoXGBinKdMkcDOAaFA2n5mMy6AJx5Gs0Z2Cs3kJw=;
        b=O8D/ar35Dz/A9OaFZ9x4ITD2jIa4mUFU7WfQnCsC44b6imHvd4d/TQiqdLgeXxN3zX
         EHSGnE3UcJlC8glimgEhHhKI3V2MDktr28eQVQmb9gY2BNKjxghpyFlU9R+2vHjd8QNx
         2sLPZcHEA3Opsjm+jgWGtlszXVEba4OS8ffXC3e3zdWMDO/RPVzbDlRnpmjaVX6BYpaW
         eYG78z4DmuqP7VhhAP+XBOSHDp6hJ+4Xf5Z90eJ0a9bXAGONFj08w+w4ue3ArcRuDcpu
         kIughEEoTSa6MDEeDsAAZVJBzuBnc9Ro4vja8spMDesDbdL04vczqOTBSYb0hgNnw5yE
         HG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778884428; x=1779489228;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kt/xoXGBinKdMkcDOAaFA2n5mMy6AJx5Gs0Z2Cs3kJw=;
        b=jo1Jpnr6OHQLPCBwSQJdodeMB6yGJLO3NUtosD9l9RV5OW3NPgOidBfi3NcXG4rK4P
         2L8SBRrUmK3MhtupTEts7ZoNyFekmfSB5wkyV2sTD6+eGYFs1LoPaKu85ImlZG6n6tBc
         uzbri7NtPvZscf6s7afkt23k7Og6JqPTFei1bwGVA6Iy23eWUVei98WnxjivRmLPnsfG
         nHetaKRmOMB8m3L21Jyo8zxDifNqff7PkZCVI+GZ+H+nIPyOou7216nX8FYudzCZno6h
         EpmC1JqZb3EkkK20sJZgXNBQRF7xWsH1YE7D2RhCao2aucgG7NLhhQsB8AW2dBq/AJC1
         +Gng==
X-Gm-Message-State: AOJu0YxAZpcv9Iij8qDXSJJ5tN40koFkz0QzPdwm6DSc434matCpmQeI
	3axNPmGDl2OtnnFpKsuEPhzdR14+4JohHIIc7KOIEjD6B0dnJWPVm0Vh
X-Gm-Gg: Acq92OEqqQY7wgEmBxSitGjJcLT3wTp0HYyjcsFwAxQuaBJfcQo2iQz94zs/ASBvjRZ
	2cNP6monFZG5tFJ7vmSXMuIMiQwis50n7CeGoSV1BJfdbZVNJOsvneOA+rEcQdcG15MqB9u/QNj
	utIO1zjKxB+TMj4Z4Hq11OvsJYXhLFskT+zPQlLJO2VsZVMTgSfUdrTmySnEzt66WOveaYijv9v
	WMAQsGTU6cc2MjdmAkWal5iUfiRIqiqBTASf5DOOQPJ62E7Cq3p/uFlA3Qc9vK650cPHcQXAwya
	Q9F/7ZIKj4ZlBFyrLyUBpsvR2I0bE3wkypOtdeH5g9Na53X7VNwcMhxRJ9LX5wKDMw1ywINQY6M
	lCUUX/MOcbWDMz7qw04leiAI4QaDjoGqQXYnkX6HAxNFUDiWP/1Yy+qrx6t52t4ca9aRIG7IdDm
	V3TFi38hp2I2UD37QrJX2Pwe+3YQ0k30VkEJls
X-Received: by 2002:a5d:5f45:0:b0:45d:4a00:b927 with SMTP id ffacd0b85a97d-45e5c5dd627mr8378359f8f.31.1778884427892;
        Fri, 15 May 2026 15:33:47 -0700 (PDT)
Received: from Dev-Null-MSI ([2a0d:3344:52ac:a808:98a4:4381:be45:536f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da0a1aeafsm17849288f8f.23.2026.05.15.15.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 15:33:47 -0700 (PDT)
From: Yousef Alhouseen <alhouseenyousef@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Sat, 16 May 2026 00:33:42 +0200
Message-ID: <20260515223342.40869-1-alhouseenyousef@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: alhouseenyousef@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 5TY2CL476RMYMFDBVDQRCCUAUGHRFMPA
X-Message-ID-Hash: 5TY2CL476RMYMFDBVDQRCCUAUGHRFMPA
X-Mailman-Approved-At: Sun, 17 May 2026 16:51:14 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Yousef Alhouseen <alhouseenyousef@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add missing newlines to sysfs_emit() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/5TY2CL476RMYMFDBVDQRCCUAUGHRFMPA/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 71C3A562595
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MID_CONTAINS_FROM(1.00)[];
	DATE_IN_PAST(1.00)[42];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	ARC_NA(0.00)[];
	GREYLIST(0.00)[pass,meta];
	FREEMAIL_FROM(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	RCPT_COUNT_SEVEN(0.00)[9];
	FROM_NEQ_ENVFROM(0.00)[alhouseenyousef@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_SPAM(0.00)[0.130];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Action: no action

Sysfs show() callbacks should emit a trailing newline for text output.
Several Greybus audio manager module attributes currently omit the
newline, which triggers checkpatch warnings and makes the attributes less
convenient to read from userspace.

Append missing newlines to the affected sysfs_emit() format strings.

Signed-off-by: Yousef Alhouseen <alhouseenyousef@gmail.com>
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
