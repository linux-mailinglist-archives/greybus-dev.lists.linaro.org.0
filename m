Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gEdlI6l9nGm6IQQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 17:17:45 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D517991B
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 17:17:45 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 28EC240470
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 16:17:44 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id 2A4D5401BA
	for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 16:16:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=GJlZfMaU;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aae146b604so31450815ad.3
        for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 08:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771863396; x=1772468196; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9h/B+Ic9Vm3Lym35kv4S0L3Iob6GiyUZC8duzFM8IG4=;
        b=GJlZfMaUB3+HuNNmNNlts6clBO4kL6fYrVwoK5NCYcQkpgcdyhAzYAJNIkIu4I7sSH
         Zkmoxvq97nWK+7qYunHVQHX9EXm/1t3zZD8COJ7cOyH79KB8sTL3P1RhPgx2Jr9W3me4
         F3ECcyiReYQHbayFob3tDa4RdlJjfnb70xqtvoX31ajw8i00JLqmII1SJT/5GyI+n33c
         tJu4Zka4UL6jfKi1FT+g/i15oA9bcS5HMAAJu30MuBX4iRVxOxBY155CrXbKRSbjw/qi
         DXzc+a/UTq6DycnqqOuyFrWxQx8sB6S0TomOUAA5DsIkBWTKoirHjWdCEi9Nxgvjo3Sr
         sORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771863396; x=1772468196;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9h/B+Ic9Vm3Lym35kv4S0L3Iob6GiyUZC8duzFM8IG4=;
        b=TkTeTFP0b226uJjCbIdWkQVD07NHKzZAANeK5D/fEzigp9zGn+EW+VvDRcKs9AgusD
         w2XNdVmH4YHZ8/ZhvYO9elJGVkDsKG1dRORUF93X/56F/LDUWJYhrOjJxvOmuxb3rEPM
         7VCSoSp2VWPQDQ7SwgANGLQUXnEO6IWHESwh53PD68VRPzq4LuJssfYR5jdOw/1XqX7I
         AwCQ2dcR1ks9GAvQGa4YQbSuR+ax8VoKq/f6Dap9TP7u+VMbCWQouYVS7Lp5legGMABn
         x6voTe5LRyrMFkkXmP4cDicpCQ8i9z1EuPOlQ3c7NxzoXcMztXT4ZEQIyfUXHTU2Yu1z
         rG7A==
X-Forwarded-Encrypted: i=1; AJvYcCUo16zQYfLxsuxCz8rS9RXDh4YeHIZoo7bH8Aq5zxJOGIyUnKQOehINb0nfv7Cfv5e11apbuibeSDr2HQ==@lists.linaro.org
X-Gm-Message-State: AOJu0YxLtLB5/1gT7gmKs9qn6X8c+Wi6bVf2uEK/j2OY88nPBPWhrG2t
	6Mhrb9ksRQ2VFl+aoUZbtUvyhuemW/IvHUz3fakKSYvk+B+iB8jP7JkS
X-Gm-Gg: ATEYQzyWhS3pbPYMUNFZ398WloYiBWuJs6iciXAGBKWnbGL83u7AibqofGGthIS4Jnj
	Lm7W2tO/gjoKzdcjbRtwisyGGL9+r9/Da8q7MoMvDseK3kv6Y52D6tgDMOUh9x4LAwh6r7/JbZp
	jBy7BgiyfdWggbLsqvHMg+VUuhWwCIBMjSs2vwoJZFovmVjlQapE+69MiHiMd+bOUS0JFvKzNO5
	ZBE9Cyjswy4AFI/jPSctjGmD+zaihgglsPuV9xhdlMo8oZeX3KWDH3Ivm2WMALH2gVxgJJkO2tz
	vdKae2OXYxURq3OlVujcGHQGFQ+u3ovfc5/LKdyw8k/4e43aLXCTaFbq7AbcyOMg4JjCw3/zeR2
	nil9TTNYzvPY5PoWXzai9RsynOIuMnGypn+ph8jqDJwZxgIogsMoTIjsex/TcRMAqME4KA5K+Jg
	atkzu6nfdXft1R4euPjE804Y7PqIU+N5/Ym0Q=
X-Received: by 2002:a17:903:b90:b0:2a9:411a:c5c6 with SMTP id d9443c01a7336-2ad74511698mr74043325ad.39.1771863396259;
        Mon, 23 Feb 2026 08:16:36 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm82095665ad.80.2026.02.23.08.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 08:16:35 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 23 Feb 2026 21:46:10 +0530
Message-ID: <20260223161610.8596-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 2GDUA7EOYFLHQOHWE3TMKVU5X6EPYCYJ
X-Message-ID-Hash: 2GDUA7EOYFLHQOHWE3TMKVU5X6EPYCYJ
X-Mailman-Approved-At: Mon, 23 Feb 2026 16:17:41 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] staging: greybus: audio: Use sysfs_emit in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/2GDUA7EOYFLHQOHWE3TMKVU5X6EPYCYJ/>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:helo,lists.linaro.org:rdns]
X-Rspamd-Queue-Id: 285D517991B
X-Rspamd-Action: no action

Refactor sprintf to sysfs_emit in all show functions of the greybus audio manager module. This follows the standard kernel practice of using sysfs_emit for sysfs attributes, ensuring consistent output formatting and newline handling.
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
