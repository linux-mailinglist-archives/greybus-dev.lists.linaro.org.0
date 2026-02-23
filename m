Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QESiH7WKnGmLJQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 18:13:25 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id DD86C17A7F6
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 18:13:24 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E6B384047C
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 17:13:23 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	by lists.linaro.org (Postfix) with ESMTPS id 8C79240477
	for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 17:09:08 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=DNiSCuGe;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.216.53 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-354a4ef0c1eso2375451a91.2
        for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 09:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771866548; x=1772471348; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgrmP6awDtMCnbJPdJhA9HCzopCsaUstELIvxLFFieM=;
        b=DNiSCuGedxg9bAHWJJGi/OvbtG5rrmIxCrwIBNtIhPFrt3EFNl2WATwOLlEk68wKBD
         5ph6QbsfBX8NZmzTcLvPbBoGlxeUeWEr9HKVZ82Mz1C/UHjrUDNplFHbEeqvSZrG8QRf
         zfFILZcC0IlHDXjNJQticYHal8F9KdWztcMv8AM65YqGsp09b9f7jE4Fj1qBeiUYnSon
         WGlLgth06YT3q+9LqgOG/GTBJQ6gwc5G8BBXmbMFYmpYwYy/g5tz2fFk1/ADQ9vC4h2P
         3kxHtvKsixnFJA8vAglqbO58nRbCmtOhstVL4oA5H4fNM/fFsu59k1oFOZmSNEDjO+RB
         M9DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771866548; x=1772471348;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JgrmP6awDtMCnbJPdJhA9HCzopCsaUstELIvxLFFieM=;
        b=egsEIxf2Mxh16oVJ+YOcfaQKGVjHXCraCgbnXD181t0jsGyJxPxrDaelZDTMFDbGdZ
         GKWkR3lpbOgNv9ZP4zrmpwmdkQFzh9zxeplwDeQkqjSN48MDopOlZEZiL1V/z+RSio5F
         Vtknb+OjpQlJiGUXpCQE5nCAV9MJL70k7nLW9D2brH5whkmLIZwOq4W/EwklQv9zfesl
         thMj40ompDqw3L7T0CuaWKPQP3lNkpze9Piy5yKD2fKagC5OMsumb3ShCLf6vCWps2dM
         n/c9lpeNbNOADlWjZdgiimo+PRJxAoeEL7kA83f3Ld1pSCXuXICTi6sHXCVSZVvQkpeg
         Fq7g==
X-Forwarded-Encrypted: i=1; AJvYcCWNy3dDk8vAagI9GEwTWwPhjWkG1z0MxPMl/MlUPvFZxDxfRBc9aE24A4yCPjrYdLRNB1W7JnPfAxwOlA==@lists.linaro.org
X-Gm-Message-State: AOJu0YzrO50OzOstB6bVcWb7TGwstIlEgezEd3iKfpLExukttZ3iiIRZ
	P2XyIyLk6yl+kv/8/h2PpX33D1zrMQlFD0xcQMRy3OaDx07RF2jtSVH1
X-Gm-Gg: ATEYQzyw32wMZ+dmqc7Frtrn87iI/zhhrTR3H0pzbP4qRJg2IFDVLl2Z12WCTq4IGPi
	SkfMCmwCqg+s+bkR5QUKMHzjvyqKSqaE8+hwnMB9ACAJwkn7xop0JqePB8vI7Wui6XPsDzGjiOb
	huAI8m302/UBBg7RUiQvtU19zEjEPL4A+s/dhBdnZXtnPI6NSb/JN1p6amgbmwLQu+8Z0QhxbVa
	VbuuSHncn1XjEBl7ETb+LmS5AF/Z1fRKvCO3wQpV99XAOI51eXrV1IT3GzojW+leXf1RvC5iDpf
	xogt9Oi+8Utqa/yqSDzUxn2UbMIfv44JcpTLF9ue+JDVmFnZukSqRiV6TOkgnsVRlkCXgiYxREZ
	Gm9cPLUfq0GaTTh6FGjFFK6WAaEh6rgOUf1dsGJ/VUdKuUDLw4/mF9ZB1lo7hMwZPdiwXcqjFy6
	RNnHLtiZB0ImrpdHokLQUdplO9iIrWSTJAniQ=
X-Received: by 2002:a17:90b:2e0f:b0:32e:3829:a71c with SMTP id 98e67ed59e1d1-358ae8b23damr8902568a91.16.1771866547542;
        Mon, 23 Feb 2026 09:09:07 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-358d79bf6d8sm22522a91.2.2026.02.23.09.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 09:09:07 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 23 Feb 2026 22:38:49 +0530
Message-ID: <20260223170849.10912-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 542GLG27KYPWTKW3OS5HBVP4LFUWR5BT
X-Message-ID-Hash: 542GLG27KYPWTKW3OS5HBVP4LFUWR5BT
X-Mailman-Approved-At: Mon, 23 Feb 2026 17:13:22 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v2] staging: greybus: audio: Use sysfs_emit in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/542GLG27KYPWTKW3OS5HBVP4LFUWR5BT/>
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
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[chakrabortyshubham66@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: DD86C17A7F6
X-Rspamd-Action: no action

Refactor sprintf to sysfs_emit in all show functions of the greybus
audio manager module. This follows the standard kernel practice of
using sysfs_emit for sysfs attributes, ensuring consistent output
formatting and newline handling.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
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
2.53.0

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
