Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id NNluObJayWmvxgUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 19:00:34 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB0B35330C
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 19:00:34 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 128DF3F8E9
	for <lists+greybus-dev@lfdr.de>; Sun, 29 Mar 2026 17:00:33 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	by lists.linaro.org (Postfix) with ESMTPS id 401C33F7D7
	for <greybus-dev@lists.linaro.org>; Sat, 28 Mar 2026 04:46:36 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=kOo3IUWh;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of shivgupta751157@gmail.com designates 209.85.216.54 as permitted sender) smtp.mailfrom=shivgupta751157@gmail.com
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35c206f0481so2446702a91.0
        for <greybus-dev@lists.linaro.org>; Fri, 27 Mar 2026 21:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774673195; x=1775277995; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tOQAY0QWafhJn0A51VpLeI70Zu09L6OxF6cr3nxplhc=;
        b=kOo3IUWh6lvLwbaxhiik4jODcDH/TreHD3ujYu8KVGU4ZGOotF006qnTJ0NfkZ7dGO
         tBZFbZlLuw3eA9BJ7X138JKvGywAvp3wQpEqmMDRNoZMxC6Pm5By+PqFiHImxCJdATqf
         q9rAH1xmouY71Hw+jDjtzhUPZ3Z4SIMPpGPt8S1KtxfN5OMdtaZ2jOMBWk0t9f407g5F
         Ho/4NjAYa4wv1/n5i6ypv2+FuXzwwnYYwMhybxPRKJPZSKxFmqwFHf7RxA7c496YUwkj
         Z3LVpPEx2zk8z4b+SO3rXupKs86QHHqv27Ns/qGLOCcidmMjKfisYyxbWnAmGgx13P2R
         bi+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774673195; x=1775277995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOQAY0QWafhJn0A51VpLeI70Zu09L6OxF6cr3nxplhc=;
        b=oGxy78Ct4D0Qvfpi6lpqHdCjrFjm8rdjHnSEXFbUs4UnM5EMZhabi9sLF0Ws8UyoFN
         /QXxLtqQOXj/7LfLo5yIbD82sVIjDFiE1tBDNeSI3GJ//sVcwHpzifPXiGZS79aypUTG
         pl/nGPjh563H7nQ/ivjVaoZxJy7VlxQ6q9Y+X6lftgEjGm46Zk1GWS27D4Nebv7TCnRS
         PtKvg2FpsaNkPaR6lMtFKBC3kB0nsEoaGci/VWqTHEjK0QurBOd6Y7QeSdt3rmKlKFtz
         N4ZvF0+eeu1X3sMLRG0YRIinbBh1+iMEiiceFg+Qw62CTc1M17EW8rOm1714eEJHfmov
         R7YQ==
X-Forwarded-Encrypted: i=1; AJvYcCXly1rBCpgUJwQ/gK3PjkhHEYPR8rglJ3v0Si3ywnPYVUBNhz4WRACfNf0QxxoTtE33noi3Rqx/dTVJGg==@lists.linaro.org
X-Gm-Message-State: AOJu0YzAcChfeQsoWVI1LLa2CGFDrDJWpjzOj4VFicYk7Z5lTCnfbYL6
	8My76FKWE0rkM6vtfzvJZpLgyywngmVBvhUusXDYdqYcoGuv2kca7H6Z
X-Gm-Gg: ATEYQzxKtjfh/2awVWBbIkLUNI1cO9EOPCA7HboT053MAnbQkZ5UkiSsFGouWEHaplc
	jyjN/bd7IYuiSnOMmUjaoT6iS6gzYHQ7WjLoDbljsWjxlqiM/NVNQP/1K3cY+1CCtAtHDYZ+iht
	OJVovDfJCTUdDSULVnTdjp6ZNoEGK4Ih6v2qdz2tVCiRFeErHcXhkDGOb5+cz/4jrETJqH2BPTH
	WOzyho18AzyAnfEBxvqlycexsg/GOgdSUjyPzZCLnxuo9poZRTaxkdBmYpDd9PBOTkhVirmDuot
	tYVZOvE1j86nsXaBTYG03nN0/fOuKiNDeSYw4HvAIT5ZHRbPw7nY+OpS280/HRJYrKzw7Na1V70
	19+MPNF0nNJBf2ndDwGF2pUQLfCdLlkagSEgXpcBEHp76hc2gisk9alcrpfsIaTVhZBkmnqsv8u
	1n2Hg1ulBLorCAJu+BKzw4IRPaPDxhneQo7XNNtRDaXaZr3nni4pnnUSNicPSUq3tcpu/q81dLP
	ei7kgy6xPVxR4uwbmXQ2X+jzWYtAjA5+A==
X-Received: by 2002:a17:90b:3144:b0:35b:e4f8:78e1 with SMTP id 98e67ed59e1d1-35c30008d96mr5000359a91.11.1774673195291;
        Fri, 27 Mar 2026 21:46:35 -0700 (PDT)
Received: from localhost.localdomain ([103.240.235.134])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35d9507d739sm745108a91.11.2026.03.27.21.46.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 21:46:34 -0700 (PDT)
From: Shivam Gupta <shivgupta751157@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Date: Sat, 28 Mar 2026 10:15:27 +0530
Message-Id: <20260328044527.10489-1-shivgupta751157@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: shivgupta751157@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AGUACRH3ZCPL3JC7MPIOHHJQXHRL3HPI
X-Message-ID-Hash: AGUACRH3ZCPL3JC7MPIOHHJQXHRL3HPI
X-Mailman-Approved-At: Sun, 29 Mar 2026 17:00:30 +0000
CC: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shivam Gupta <shivgupta751157@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio_manager: Add missing newline to sysfs_emit outputs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AGUACRH3ZCPL3JC7MPIOHHJQXHRL3HPI/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.59 / 15.00];
	DATE_IN_PAST(1.00)[36];
	MID_CONTAINS_FROM(1.00)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lists.linaro.org,lists.linux.dev,vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[shivgupta751157@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email]
X-Rspamd-Queue-Id: 5DB0B35330C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

sysfs_emit outputs in audio_manager_module.c do not include a terminating
newline, which is required for proper sysfs formatting.

Add newline characters to all sysfs_emit format strings.

Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>
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
2.34.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
