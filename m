Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YM/dEJG78WnGkAEAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:04:33 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id EDB14490EFA
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 10:04:28 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 75504406B2
	for <lists+greybus-dev@lfdr.de>; Wed, 29 Apr 2026 08:04:27 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	by lists.linaro.org (Postfix) with ESMTPS id DA1F73F78A
	for <greybus-dev@lists.linaro.org>; Tue, 28 Apr 2026 16:57:20 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=qPGe8UDX;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of ajithpv.linux@gmail.com designates 209.85.216.44 as permitted sender) smtp.mailfrom=ajithpv.linux@gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so12240122a91.0
        for <greybus-dev@lists.linaro.org>; Tue, 28 Apr 2026 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777395440; x=1778000240; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eNIfAFIh9VUEeZyZ7+5hHhr7ZygZVo9QnMVxJndWS1U=;
        b=qPGe8UDXO9G5BND5AcIdGf4PwelPdEnbtEQ2mIUqvqtVQ/54Fi+3TPODtASsD7n3MY
         EVYDiGvPeYddeIl5Ngl8J0xtRX4ywHIg4pMmfaNoj7uIjNxMY2rNTxcMuRu7PWH0pueb
         ph7Hxzwj90WGYg5fdabjZz+co6KWScRaDwLUHrrI9ZP+ycpb5oNEEr7s7YlVPoCqOxl4
         2ixb/9Nan4alpQmsVOb/OVy2hHNFGZshpZroUFlSbIZBqPfNaGm26WkLULvxbCuNJOCp
         ZsaCjQIrWv+iDz/7XirS2LZsIQrWZoh+JuJ88WoZ7JvidndUXeohq+eOm5b75npAv6kh
         /usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777395440; x=1778000240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eNIfAFIh9VUEeZyZ7+5hHhr7ZygZVo9QnMVxJndWS1U=;
        b=AmdBYLEPeBv8tFn6VTwUR5tet4kqDbvVOX56awDIv2gj5ILgNPjyeGTLgwRtI3wm+G
         6cp2bsF6um6rZP+/Gs1s+L7jxFL6SIiNWwBmaouQWefcXRcte96hECLzLdmQfYRH6YfX
         SGSFqwSibHsIvoVOo9YAFbAXSLiNAgNjMEybw2cjWEMK9nBVHEHcvIEHC9XcoH1FD/Qv
         QU8mh2ODHX4dMhOafQRTjZYl1Q4FXvIgDSYCRvyP+H4P1EACl+EElGROW75RvsBLkW5R
         1nNkxJoo4wa/gNPYngdSiqjKGMc9afi3c3ZVvrMSiTnRATQ9QvcoSW7n6qS96roeTH3W
         U1sw==
X-Gm-Message-State: AOJu0Yxo6eLOXPJsa30tPgaO0dRyWDcDk0WP6+4vyhgQ5SNLlxtxHW3s
	oHyIkIsZODJJGqBuBFQNmcCDCpmca3k9fGV4q1KSrBZNFfO8NRM1fhP1g+o0Fg==
X-Gm-Gg: AeBDievUexRbV2QzaOuFlf462P8hk2J/0ajFwpXmHoABe+ZUJCq+JtKE3N4/DvMkteR
	Qynw9PEG4gEiGNiEOHcTBV7G2fO4rHuRVCqg/ZiD1mwQI0dgNprnTRocGhY64vo6ybEvv+jBuEI
	aM7+ZQkEikOalTpBRPQtOLZr2+o/4QE5zM0laPCQNyqTfslYylAEp8ZJnsj/rYrXtBzCnT5e14M
	HXwjDAyhg8MVe+5exou/anGf2REjMKN2UHkfuaOqVLt394B2lO1mRTgsraqiDG+cYPXjm/o35qe
	z9q2cH6UVPlBmY4ZF21+WzqWIfNx8JfCMx8nyEiw51asO5WD6tlE2VJfdjnwSJS1ihNDxGOYvUg
	g88+1sN8BqODWSGjbwvBWlXK7Qc2kNO8xuv55ngzr08Vohqy2OjQt/AIIHC7p8IPzdplE1avAa/
	qbVQcSNAjK30fQq6g4tNwRLRUBXQgRbw4mdJKcQSHzG2blx3J+
X-Received: by 2002:a17:90b:1a92:b0:35b:e56e:a17e with SMTP id 98e67ed59e1d1-364920a55e8mr3951141a91.17.1777395439948;
        Tue, 28 Apr 2026 09:57:19 -0700 (PDT)
Received: from ubuntu.. ([49.205.39.136])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-364a0109e6asm238590a91.2.2026.04.28.09.57.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 09:57:19 -0700 (PDT)
From: Ajith P V <ajithpv.linux@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Date: Tue, 28 Apr 2026 16:57:08 +0000
Message-ID: <20260428165708.3565022-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: ajithpv.linux@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: ZQBU6E5OUXCAWQ3YKVDSSQXARFTMP5JP
X-Message-ID-Hash: ZQBU6E5OUXCAWQ3YKVDSSQXARFTMP5JP
X-Mailman-Approved-At: Wed, 29 Apr 2026 08:01:58 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Ajith P V <ajithpv.linux@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add missing newline to sysfs_emit
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/ZQBU6E5OUXCAWQ3YKVDSSQXARFTMP5JP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: EDB14490EFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ajithpvlinux@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_SPAM(0.00)[0.296];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]

The sysfs attribute is missing a terminating newline.
According to the kernel documentation for sysfs, attributes should
be terminated by a newline to follow standard userspace conventions.

Fix the formatting by adding a '\n' to the sysfs_emit string.
This resolves the checkpatch warning:
"return sysfs_emit(...) formats should include a terminating newline"

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
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
