Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6E77HVebnGmKJgQAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 19:24:23 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754417B76A
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 19:24:22 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id DB95340481
	for <lists+greybus-dev@lfdr.de>; Mon, 23 Feb 2026 18:24:21 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	by lists.linaro.org (Postfix) with ESMTPS id 032F240478
	for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 18:12:17 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=RSXSTfqq;
	spf=pass (lists.linaro.org: domain of chakrabortyshubham66@gmail.com designates 209.85.210.170 as permitted sender) smtp.mailfrom=chakrabortyshubham66@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-824adc96ad2so4634585b3a.3
        for <greybus-dev@lists.linaro.org>; Mon, 23 Feb 2026 10:12:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771870336; x=1772475136; darn=lists.linaro.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=o4TM41/w36jwqUfkddQX+ubMbarW75gQJZVoupki1Gc=;
        b=RSXSTfqqCzaYsqCmh11BweHn1zjezFBK6vjp7MTG/fRcAdSXjRbTwGOW+ZhkBwK2DJ
         WPYjQVsnrNdfLURviHe5BAfmsJBOULvOht2gc/X81WtT6F3DcE5mDt92scAfQ4adKDel
         eCgzsi9gVPDWl4pvgXzBHss66sgjriiuRolH3cqsi1sq5bI9S2bz4rypHnfsZHWXDApM
         6rgDWeklwfCJ6jDHoRwOF6QWd/HPTgt+QS/p6c3Q0C8VXII/VRKhnC08s5fx13C+XK/B
         UvxTIAlbiGZdVux+yy2kkQkUeLAEoMQjwrzHWlPFcFvJ61oPl37xBpmCo5x7ZxNjF/nO
         5eNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771870336; x=1772475136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o4TM41/w36jwqUfkddQX+ubMbarW75gQJZVoupki1Gc=;
        b=fFEA28H/ANoOUQUf9Me9JSDn8+2CGrsg1CQ6w4PNrksh7d9pu7bo7ygumB/sVRyEOt
         4ZJATFKdl81O3e7f2Iz/o5JPnUgGI4672BR66QEY3KzPwa0LeoJy3j08EPC1hessS+TJ
         hCdG06PdnFGGS2DMmxhUvPykabMtNFac9mSpaueylJidSJ6BsR+v+2fd303a/U3Ci1VC
         aoD8dsf9TL0GdniZZLABHOAW/9lEkGwpze0EkMCrijxn6LmRT5bAQMLl+zrxMLF1/dFO
         P58erPCM5oPnlfCc4qWhPzeZU7JhU/9dC6NQfbmn24RS7Z/lfCbqiD0uwqJzdGKEJ4GH
         D9ow==
X-Forwarded-Encrypted: i=1; AJvYcCUbxt0cVcyfdaK8vRV8OYFVX2CxIi/RtunxDtROqDrkDMF9voNIv7YhIRfA3aduv0Y0tgoLJF0t1yrn8g==@lists.linaro.org
X-Gm-Message-State: AOJu0Yy+VT5rdaVGsS5Z6nRQ/T1qz/0leHhLaSmjICSd0eJVhB2J6uBE
	f8Xg/O/2SU1cHJVnnjun5HU7NcACE64K3OJcvWOJjfFse5YmzRo2/AYf
X-Gm-Gg: AZuq6aKc09wVKqbEvejL5HX3KRTxAQWS7VIHPGxYhBVeNUMwWzpG/oJPwR2HQqoL0Q8
	SalFgKk7FldT/VmO945xlYPaMlvGkG/7QWt3caWqfTVkW8ujyEzeML+ZS16R6b3q4rguyVAVTGz
	/QG+INBy/O8PIpvZ8TVKqPLlnO36vrImGbRoe5ezQkIaUfEnTXkTFylHM7p4UY7CujsxocwmkyT
	9DGRKIZYVo26psTYZI2OvkJVBV7+GnOk/WKVkTqYIU7VyMszoPZwOVIQA8pUk9x4SDfK1QFAMDt
	KCF4zOrlC0lehr4iamFtVcB2Ggr2Xrk2ggEv5ig8v/A6R0zvnRojfegcoEBVMMevUbCk/ArIIvF
	IpgOfRI11pfihkMzWZusX45WzQP4TkBBaXDJwNoAuH3UvsjMLkHQsT5ghSJVxOmIo83q2NcXL/r
	Sb/htcYdMlQzo/GWejIDVRfIqr2gB0HoWGYG0=
X-Received: by 2002:a05:6a00:ad04:b0:823:1c5f:1c43 with SMTP id d2e1a72fcca58-826da9ee9efmr8568432b3a.36.1771870336014;
        Mon, 23 Feb 2026 10:12:16 -0800 (PST)
Received: from fedora ([2409:40e5:11e3:f079:b796:44c2:7e10:cd23])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd86c5ccsm8261940b3a.35.2026.02.23.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 10:12:15 -0800 (PST)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 23 Feb 2026 23:41:58 +0530
Message-ID: <20260223181158.13234-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Spamd-Bar: --
X-MailFrom: chakrabortyshubham66@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: YTSRHPVIU2AWVJC6DFXHGCN6EVXHFIOM
X-Message-ID-Hash: YTSRHPVIU2AWVJC6DFXHGCN6EVXHFIOM
X-Mailman-Approved-At: Mon, 23 Feb 2026 18:24:19 +0000
CC: Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Shubham Chakraborty <chakrabortyshubham66@gmail.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] [PATCH v3] staging: greybus: audio: Use sysfs_emit in show functions
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YTSRHPVIU2AWVJC6DFXHGCN6EVXHFIOM/>
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
X-Rspamd-Queue-Id: 0754417B76A
X-Rspamd-Action: no action

Refactor sprintf to sysfs_emit in all show functions of the greybus
audio manager module. This follows the standard kernel practice of
using sysfs_emit for sysfs attributes, ensuring consistent output
formatting and newline handling.

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
---

v3:
 - Add patch history below the --- line as requested by Greg KH.

v2:
 - Add missing Signed-off-by line.
 - Wrap commit message at 72 characters.

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
-       return sprintf(buf, "%s", module->desc.name);
+       return sysfs_emit(buf, "%s\n", module->desc.name);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
@@ -85,7 +85,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_name_attribute =
 static ssize_t gb_audio_module_vid_show(struct gb_audio_manager_module *module,
                                        struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-       return sprintf(buf, "%d", module->desc.vid);
+       return sysfs_emit(buf, "%d\n", module->desc.vid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
@@ -94,7 +94,7 @@ static struct gb_audio_manager_module_attribute gb_audio_module_vid_attribute =
 static ssize_t gb_audio_module_pid_show(struct gb_audio_manager_module *module,
                                        struct gb_audio_manager_module_attribute *attr, char *buf)
 {
-       return sprintf(buf, "%d", module->desc.pid);
+       return sysfs_emit(buf, "%d\n", module->desc.pid);
 }
 
 static struct gb_audio_manager_module_attribute gb_audio_module_pid_attribute =
@@ -104,7 +104,7 @@ static ssize_t gb_audio_module_intf_id_show(struct gb_audio_manager_module *modu
                                            struct gb_audio_manager_module_attribute *attr,
                                            char *buf)
 {
-       return sprintf(buf, "%d", module->desc.intf_id);
+       return sysfs_emit(buf, "%d\n", module->desc.intf_id);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -115,7 +115,7 @@ static ssize_t gb_audio_module_ip_devices_show(struct gb_audio_manager_module *m
                                               struct gb_audio_manager_module_attribute *attr,
                                               char *buf)
 {
-       return sprintf(buf, "0x%X", module->desc.ip_devices);
+       return sysfs_emit(buf, "0x%X\n", module->desc.ip_devices);
 }
 
 static struct gb_audio_manager_module_attribute
@@ -126,7 +126,7 @@ static ssize_t gb_audio_module_op_devices_show(struct gb_audio_manager_module *m
                                               struct gb_audio_manager_module_attribute *attr,
                                               char *buf)
 {
-       return sprintf(buf, "0x%X", module->desc.op_devices);
+       return sysfs_emit(buf, "0x%X\n", module->desc.op_devices);
 }
 
 static struct gb_audio_manager_module_attribute
-- 
2.53.0
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
