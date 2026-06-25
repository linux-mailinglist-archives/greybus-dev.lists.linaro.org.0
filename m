Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5MiRMhc9PWquzwgAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:11 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B17E6C6B68
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 16:37:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=bm93gAAu;
	spf=pass (mail.lfdr.de: domain of "greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org" designates 44.210.186.118 as permitted sender) smtp.mailfrom="greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org";
	dmarc=fail reason="SPF not aligned (relaxed)" header.from=gmail.com (policy=none)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B35ED40AA0
	for <lists+greybus-dev@lfdr.de>; Thu, 25 Jun 2026 14:37:10 +0000 (UTC)
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	by lists.linaro.org (Postfix) with ESMTPS id 220804098A
	for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 09:15:13 +0000 (UTC)
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-139d5c9a495so2912754c88.0
        for <greybus-dev@lists.linaro.org>; Thu, 25 Jun 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782378912; x=1782983712; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XYPMam/tRodxN/Tm8mIWsdZqWcS5VypETHSh8DycrZU=;
        b=bm93gAAu4Rx7yILwN/wXjJ4BUd/vUDXB0yvF96ddnpAsK1VCvBPhMMFZSwUjnVo3aw
         2OsPrwk5QZecU1ApxaFD4rOjqnHTNzz6X48WeKov3wD/KJiBm19TBrK/0xNJiz6Ws5U8
         NRkwVwuDkNq2Zzp90zgqrIlVDNffl/DJLGhA5H0ziTj3HEJK8yFQ26bOVyIrIpIWxpw9
         QMrdJLc+4tFIaWiqP08fLi1ruw6h7zQlASvij94MlFcpM3dqpmeB+30GwGT4GeoC+HQ5
         qb4sa+Cdwf0TMEVDVJ37ew83ftMtRC9SwnoB4IlcQ0/laU313zOKvnhjiJ3FOB39b3r4
         axFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782378912; x=1782983712;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XYPMam/tRodxN/Tm8mIWsdZqWcS5VypETHSh8DycrZU=;
        b=XIYMr/9QAh42t+msCZpzf+RXtzcwXL1gYw9q+sLA7S0e2FRGX4KW3NHKmiZntCUgEP
         dtLOBQjsLuwYnZBxknT/jo6rSM4oFXOTVsAAnBrJRkITStdipBPQTJPMSeGCOX2LE/Lt
         189Ze5wdp2f+A71sLOBsVXFEYOuWUVSlHqKXNkJpXq6nTSzKqOteuvhNVmoEXmpCEm/8
         x2MUg8C6/Kw86VJfv3+TcBFIohkPx8lpkUlqGrjx0Kcfeb9MlxKgRuW+LKcxOsni756F
         MoanykV30Tnk5OizycBRdmnWIPGFhxx13qHanvj2zVKKey3/ygdja476fslgCunGKAqo
         2fTA==
X-Forwarded-Encrypted: i=1; AFNElJ8AypkwlTPBX7CZCbPjGpxMevaU+8tjvCs9cg4kGndEvc7ICM1YjW8zv0mss000Y+bFt0QNnulPBxod3Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YzTNNDRrSnEynNkLLIj7HoWdBLIcregTksrT+X/8h43moh1VAt6
	2MeQPj3WTL9okiBHcp4Ky5rjzdaLRohmrO7G+1goievTpRIBbCGnzCf4
X-Gm-Gg: AfdE7ckM7iRYDbFW59YnjDA2J3QkGC1l8JZqyQ8JJab37v25EwmrBpGzFVs+vLUAVOM
	wzhYNEtXCtucH76wywKC4F5WY/R1IKy222+sKNCdBb/5lanRW8kBId8M1NUwl6piJ0UEjxA4Ycf
	yqfkYkKbRCvSFJNwsBu+YTpMvtjfH/ImiVqdW8kthkUskHF3tyNqNJXi3qYN9c3kaBv9izc7lLr
	L6uqw4uSh6iRUxY5jIagwJpbhWe4xR3gff/I2NGj+ZhCFOafMYbahy5oda6XeRfLUTRMwxTvHfN
	CQ17fhGBh/zoSAH9pDEldlNt/2fTepz1zf4dawYWXn7ZzSqbc1YJ+GWvWXdu1nZRs1CJLkJ47Fb
	2eCJWF1sCgs0snksvv6w778WQ2OrzuvpP5PxyXEfyd1j6ponZQ8R1EdBp4cu/dNrCBSnVJaDiOr
	DfzT5CuFl1EXRYvKG7mravakpooiVzhBdKXQ==
X-Received: by 2002:a05:7022:ec82:b0:137:f0d8:4ffe with SMTP id a92af1059eb24-139dbb5da1bmr1566450c88.36.1782378911800;
        Thu, 25 Jun 2026 02:15:11 -0700 (PDT)
Received: from 10-86-27-11.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d912197bsm10118616c88.15.2026.06.25.02.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:15:11 -0700 (PDT)
From: suryasaimadhu <suryasaimadhu369@gmail.com>
To: vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Date: Thu, 25 Jun 2026 17:14:16 +0800
Message-ID: <20260625091416.230920-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: suryasaimadhu369@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: EQAUG5GTQKLKFWTWKA5GJ74TO4S72XQP
X-Message-ID-Hash: EQAUG5GTQKLKFWTWKA5GJ74TO4S72XQP
X-Mailman-Approved-At: Thu, 25 Jun 2026 14:37:00 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, suryasaimadhu <suryasaimadhu369@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: add missing newlines in sysfs_emit calls
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/EQAUG5GTQKLKFWTWKA5GJ74TO4S72XQP/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [3.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com];
	FORGED_RECIPIENTS(0.00)[m:vaibhav.sr@gmail.com,m:mgreer@animalcreek.com,m:johan@kernel.org,m:elder@kernel.org,m:greybus-dev@lists.linaro.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:suryasaimadhu369@gmail.com,m:vaibhavsr@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[kernel.org,lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[suryasaimadhu369@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	TAGGED_RCPT(0.00)[greybus-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B17E6C6B68

Add missing terminating newlines to sysfs_emit format strings
in audio_manager_module.c as required by sysfs ABI.

Signed-off-by: suryasaimadhu <suryasaimadhu369@gmail.com>
---
 drivers/staging/greybus/audio_manager_module.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index dc90cc2d2..5737f2a32 100644
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
2.47.3

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
