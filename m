Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 6092B6C39D8
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 20:08:09 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 696C73EBA6
	for <lists+greybus-dev@lfdr.de>; Tue, 21 Mar 2023 19:08:08 +0000 (UTC)
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	by lists.linaro.org (Postfix) with ESMTPS id 52DC73E965
	for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 16:45:30 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20210112 header.b=LXs9nIjH;
	spf=pass (lists.linaro.org: domain of sumitraartsy@gmail.com designates 209.85.216.45 as permitted sender) smtp.mailfrom=sumitraartsy@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f45.google.com with SMTP id e15-20020a17090ac20f00b0023d1b009f52so14089004pjt.2
        for <greybus-dev@lists.linaro.org>; Sun, 19 Mar 2023 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679244329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wmtLzAp7TAfFzU4Wal3aHOCAS9vHX2uOg0KnFqhgfOg=;
        b=LXs9nIjHeLGc4vvNlmA23A/cSABl8I0XqAC1aUqw4CUby9pvLsTuK+E/TA3D3Bz5a9
         3iBf1J/ArqNespEhEmmrBwb444AgD9APc8yDQD/YiU/+E7/9CqeSgSIpE2bb/pZPTp7B
         wOOh6SiAnC7qlePvsPYEk7H6nmZqnYJy/3vtJhd31RFDVkHgXhAptaQhgsLadb+W5IhE
         A8MNpfPa1HdDhAHNTK6BN6qKHHBc/L3qWrLpK8BVbtWJov/xFFcxWOihgu44cA736mo1
         5LeUWymaryZOHNVb6weW14aeEn+feYT7V4VMYlavnQB/0pEGMJ5jXxx6P6VpsU0zt3oo
         Lcbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679244329;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wmtLzAp7TAfFzU4Wal3aHOCAS9vHX2uOg0KnFqhgfOg=;
        b=dtc+lM4l/dlse7FzCUmbCyvimL3Wfu5gtUY5XzxvOaj0xUqYSzXzN8RVTitJbAb/Gs
         Qe1n3eDBn8YqeGdR+QzsYfq76yxKH4WW+6uya7l10UTI7wcrCwNpBAOaN9KmKqRLhAIL
         wkCb9SpuYDbLg/O46OxgvM7KoYHvf4Wyjgrnuq9KDcZBhYFu23lZNCpyXFJK1u+JOwrD
         CAF/GXDYur88vTwB94Y9EA6hzSSiLZIL77Yzs1rd43PVn49/lyQtDl78PFH+TOHqXMr0
         E8c8NbxFWTRPg3zl2h/sYbrUFCnUSz1XTGXXTgxEtPB9SQW+zhTV3gMH+fZb1XAYMX0y
         5RBA==
X-Gm-Message-State: AO0yUKVpH2BogfZUbBpcgmT+RFOy2XNQPHu8Pl/dFvQggDlZfzXmhXRG
	kYIxY4bxxaflOI2VF8PsGMk=
X-Google-Smtp-Source: AK7set89cJ4rq6OJEYq0Uljx9YEOr8CfmsGk8+Y5TyoZookPRhjaGAooHa6/vi5uZaiShmz6OVcAzQ==
X-Received: by 2002:a05:6a20:7aa2:b0:d9:1ec8:e9bb with SMTP id u34-20020a056a207aa200b000d91ec8e9bbmr2242327pzh.28.1679244329269;
        Sun, 19 Mar 2023 09:45:29 -0700 (PDT)
Received: from sumitra.com ([117.209.117.91])
        by smtp.gmail.com with ESMTPSA id m5-20020aa79005000000b00627f1efd470sm1091128pfo.135.2023.03.19.09.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Mar 2023 09:45:28 -0700 (PDT)
Date: Sun, 19 Mar 2023 09:45:20 -0700
From: Sumitra Sharma <sumitraartsy@gmail.com>
To: Vaibhav Agarwal <vaibhav.sr@gmail.com>,
	Mark Greer <mgreer@animalcreek.com>,
	Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Message-ID: <20230319164520.GA125117@sumitra.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 52DC73E965
X-Spamd-Bar: --
X-Spamd-Result: default: False [-2.60 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20210112];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.45:from];
	MIME_GOOD(-0.10)[text/plain];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,animalcreek.com,kernel.org,linuxfoundation.org,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_TLS_LAST(0.00)[]
X-MailFrom: sumitraartsy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: REBQ4G3UTED4AWFI7A52EZFVKNQINRJW
X-Message-ID-Hash: REBQ4G3UTED4AWFI7A52EZFVKNQINRJW
X-Mailman-Approved-At: Tue, 21 Mar 2023 19:07:01 +0000
CC: outreachy@lists.linux.dev
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH] Staging: greybus: Fix lines ending with '('
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/REBQ4G3UTED4AWFI7A52EZFVKNQINRJW/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The coding style used to limit lines to 80 characters,
which led to splitting of these function headers into multiple
lines and ends the first line with a '('.
Such splits causes checks reported by the checkpatch.

Place the function parameters of each function immediately after
'(' in a single line to align the function headers.

Signed-off-by: Sumitra Sharma <sumitraartsy@gmail.com>
---
 .../staging/greybus/audio_manager_module.c    | 40 +++++++++----------
 1 file changed, 18 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/greybus/audio_manager_module.c b/drivers/staging/greybus/audio_manager_module.c
index 0a0f0a394c84..81b4ba607a0e 100644
--- a/drivers/staging/greybus/audio_manager_module.c
+++ b/drivers/staging/greybus/audio_manager_module.c
@@ -70,9 +70,8 @@ static void gb_audio_module_release(struct kobject *kobj)
 	kfree(module);
 }
 
-static ssize_t gb_audio_module_name_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_name_show(struct gb_audio_manager_module *module,
+					 struct gb_audio_manager_module_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%s", module->desc.name);
 }
@@ -80,9 +79,8 @@ static ssize_t gb_audio_module_name_show(
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 	__ATTR(name, 0664, gb_audio_module_name_show, NULL);
 
-static ssize_t gb_audio_module_vid_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
+					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%d", module->desc.vid);
 }
@@ -90,9 +88,8 @@ static ssize_t gb_audio_module_vid_show(
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 	__ATTR(vid, 0664, gb_audio_module_vid_show, NULL);
 
-static ssize_t gb_audio_module_pid_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
+					struct gb_audio_manager_module_attribute *attr, char *buf)
 {
 	return sprintf(buf, "%d", module->desc.pid);
 }
@@ -100,9 +97,9 @@ static ssize_t gb_audio_module_pid_show(
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
 	__ATTR(pid, 0664, gb_audio_module_pid_show, NULL);
 
-static ssize_t gb_audio_module_intf_id_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *module,
+					    struct gb_audio_manager_module_attribute *attr,
+					    char *buf)
 {
 	return sprintf(buf, "%d", module->desc.intf_id);
 }
@@ -111,9 +108,9 @@ static struct gb_audio_manager_module_attribute
 					gb_audio_module_intf_id_attribute =
 	__ATTR(intf_id, 0664, gb_audio_module_intf_id_show, NULL);
 
-static ssize_t gb_audio_module_ip_devices_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *module,
+					       struct gb_audio_manager_module_attribute *attr,
+					       char *buf)
 {
 	return sprintf(buf, "0x%X", module->desc.ip_devices);
 }
@@ -122,9 +119,9 @@ static struct gb_audio_manager_module_attribute
 					gb_audio_module_ip_devices_attribute =
 	__ATTR(ip_devices, 0664, gb_audio_module_ip_devices_show, NULL);
 
-static ssize_t gb_audio_module_op_devices_show(
-	struct gb_audio_manager_module *module,
-	struct gb_audio_manager_module_attribute *attr, char *buf)
+static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *module,
+					       struct gb_audio_manager_module_attribute *attr,
+					       char *buf)
 {
 	return sprintf(buf, "0x%X", module->desc.op_devices);
 }
@@ -181,10 +178,9 @@ static void send_add_uevent(struct gb_audio_manager_module *module)
 	kobject_uevent_env(&module->kobj, KOBJ_ADD, envp);
 }
 
-int gb_audio_manager_module_create(
-	struct gb_audio_manager_module **module,
-	struct kset *manager_kset,
-	int id, struct gb_audio_manager_module_descriptor *desc)
+int gb_audio_manager_module_create(struct gb_audio_manager_module **module,
+				   struct kset *manager_kset,
+				   int id, struct gb_audio_manager_module_descriptor *desc)
 {
 	int err;
 	struct gb_audio_manager_module *m;
-- 
2.25.1

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
